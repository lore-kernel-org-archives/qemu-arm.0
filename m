Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A224CA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:54:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOWf-0003xx-9s; Sun, 04 Oct 2026 11:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOWe-0003xX-27
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:53:20 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOWc-0007uM-BW
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:53:19 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 00721157ae682-8ab46253999so7883727b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791129197; cv=none;
 d=google.com; s=arc-20260327;
 b=WB8uoiOBXshISihP6eWVRU4v+mmr/odgIyVTBLG09bZBY9zrasTfB5TvgBVUGDX5uu
 89xN4yNZ/e6JxtlgfFTiYcjvWSWjtGX8wShJXViGk0e9nxnSlYzZOAr5D9ao/KgywdCs
 djH5q2dr1+oOYLvckbSSrs8qq2NGTUyzd0WDm3wjd+PbDqdKSn70la3QEemSo3XAaHnt
 /1ObvFAeXjTYGRFMzZWSdh+bSunyWAjQ1+nEn6961Im7bYrGDXXeqTRj1OdQSewwxOH7
 hmdeHHcgvEZHjncQDVOsG4hm9UkxHL2Nkn+lOaCG1Lpy4OTHeH1WoluyCqKjfh4ks1mK
 12oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PTbsI1qKOCs+tvm4+n4Z61evdmFzD0GBdyy20o/81ms=;
 fh=jCOuvEsiiJfH/891ivHMjkyyT6bMR83FNQeq8gjXGbI=;
 b=i0iwHu8ze0FRCs2Rnh/uxrfRp34XqWPKEi5Td5GujStwQzE9BpYyZRsT7/5lJsfbor
 0LPmFQsykZByBHW9Vnjj2uH0754UxM89TSC23QTNNgvxcLjlZe6FwTHwivlN+q5Jd24M
 LNjXeYoiTmm+Eou+K5a+7Qt61dmqxi7xZp2QCMZvhLer2xH16ouGhxQxyCW8twXviFMB
 2FYuUP29QqJq/4StaeN57XQ6+G9D1S+KCjBwcu2DaitDjSPXYoO8AH6DphW3fbJWpVt8
 1tGjDxO6HG6dTwRHM59MNKU1DV4nkMilEFs87ne0AF9hNEwjCSIGRoWc0nsQhCslyXkm
 LtKA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791129197; x=1791733997; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PTbsI1qKOCs+tvm4+n4Z61evdmFzD0GBdyy20o/81ms=;
 b=pdaeJSiFtqzMWn8UBOWN1sHTzzm7q7QwSZMqetsDPhS7N1Q8IVpUg15rpmRRcXNCiN
 de/6E63LihEGnlk62dFruYZiId6Wp7AQbxuvBL6eSnK400ocvUU9KbtUPuk0YevlpQEg
 H4Z/BbKW2O+ZHKK35zBAcCsyGrr9RaviX4GAEkDwY8eej9gIsdmCUdHBapjLGvMwgq1X
 1/qaEmrTH0+JLFdQYrh2WlM6bPyyFpUS9L4f1/v4dOybD/LFpEgYzNxpNztmbE6tn9qG
 gxf8rSXQp/QsX4JJQQr5CTbSkbQS/fgVIgNqjnGzR1o1S89cZioT3oLFMegm38TvByXW
 q8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791129197; x=1791733997;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PTbsI1qKOCs+tvm4+n4Z61evdmFzD0GBdyy20o/81ms=;
 b=rMjkr00Nv7/Bld7wg6HevhPiAyW11eW1zj0Blhhm6YHHAFJg/oaVMtJhr7a9U0Ny15
 JvQVQ3eUtPw7tpcb4YBJDJ5WdTGPqgfvpTn85QLmyT3u3k/udBLMzu2T87fM0xbVbDYq
 WIKOJnwz6h1phG7T4crueQD6N/6ujb5EQjY12NCZWGuZ/nWM2oqvfHxnJ7XdWhvTUbn7
 Gj2AboO+n0wEYidFc46zQRYRH2m84wN2dlCE5AEO+sE7YsSUX6EkN+q63BomVVlKU+Mh
 K4u803yur5pEkm/V0b4OgGiAo24knwjsUQkp0FbYuhmyhVKzYWVmmI9d8L32jgi5gOKR
 qhEw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKpQuZAmA2OpST/ijgN6zyVQHGLv0j3VifEE1UBi6OgVjfs3X3crMaI/fFp5zSaUe+DbqsydONOA==@nongnu.org
X-Gm-Message-State: AFq9FYKhQyTPUhNgb6J9DkmtJz6eDu/vaKOtY6S5V5yhybnWoHyOUFpU
 cGASWLJ4UIQ3medbONv+cVark6eEQLd4hrxMixtlbuBaBOJUfK4yVuBfh6w2XzBRIHWXWsjXFaI
 Jkcwa4VZEfamP0/9WOIspuXx3XArS9gk=
X-Gm-Gg: AYBFou1LD5rUNM0gVpu5JB6G8m4a6mK2tJVT8sMFy5CM3n2tEg/5Rq/fG2JmiQ5/QC7
 LfGHkiMKQCd5n1F25aO9e844bI+LU4DfR+kTbCcGW5orOsBOEQF114kbPfIkvCSalg1RkBqr7rs
 dw73925s2JEfdTcZndIm/w0U5Rr7571mZE0wHACnizdByQUGbpBo7ksVvyPM5fDr9T4Gz11dOfi
 aACdCHp96OY2lBtfPibeA7pZwJtJNRqeGFxXiKaGChcGLBs2gt2hvm3WZxmK3H3mHgtQEau9CGe
 F7l7qsF4puhvnmTULkG+PKet2my+91OTYOvdK+V+8D89xlbCWcaQbKO2ZoA10kx+SJw4b6cXqJE
 9d+2DXGq7x2Gt1ds=
X-Received: by 2002:a05:690e:e89:b0:677:c18f:7257 with SMTP id
 956f58d0204a3-677c18f81f3mr1662467d50.23.1791129197013; Sun, 04 Oct 2026
 08:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-9-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-9-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:53:05 +0800
X-Gm-Features: AclHuK9eGoJpGs441HvzALMbxy6ASo44jiUDRsSijICZZEnNwYUkk5jU8DNWW38
Message-ID: <CAEUhbmVOa01Y9m17oUSntnKF5PnAudhP3Zh7YE0OxCLE5QQDSw@mail.gmail.com>
Subject: Re: [PATCH v2 08/30] hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by
 default
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, Oct 4, 2026 at 8:29=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Having 512 MiB of RAM matches real hardware. Fix the machine
> default to make its use more ergonomic and less error-prone.
>
> To reproduce the old default behavior for e.g. migration purposes,
> `-m 128M` needs to be added to the command line.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/mcimx6ul-evk.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

