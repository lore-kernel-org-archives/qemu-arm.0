Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE660CA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:19:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOvq-0003UO-5v; Sun, 04 Oct 2026 12:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOvo-0003Ss-V9
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:19:20 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOvn-0001Oy-Jo
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:19:20 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8925e417565so6903287b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130758; cv=none;
 d=google.com; s=arc-20260327;
 b=OKgVeo5u2TZfc5MQKPsoA2PbaBdQfAgc5amutXPIi328O+jQ3/lKuldGb0fxX164M9
 2uWpBj6hvWt6nOJDgFOTETLpNAFnJlX0IOAGqhdSBb1yePsrIHi7vl3z1J9EpZ2fu34b
 lTHShn/Us8rR0kmAkMkK3k1LVkVzx0w4dTavOpolWxUOXcWqU1fChttTOKO2oybwyA5B
 Pz8foqEfWw2CSjhXanlTwIb0jcFxsuXgeDBWI0dXd9jsP5g6dBy0eeu2PgZqsjX7czng
 lHxCliJl41AmX3q+LosGydI2aECaQMC2e9XPOi9fbY24JuiffbCd0I7QderilZDLhJo8
 LPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Z2HZ+S2vidBmnG20BYhRJcN1NWxOOInvW9Vq3G95Kvw=;
 fh=6bCwtZ5ukl1f3jNBe+JA1TRehootcuhDopm9lxRbwKc=;
 b=fWwI2RDeWlnU1zPgm7j4MPz9iJKinuzgbXpRQYlZpqHq9A/rjvvuJzQFbaBarC8mQ3
 9fZvD6gDO2Yxw0x6yLp7mrEan74FjJ+haJlijEQH/J2lcT1Up5JBOatw/idOhMOX8whz
 0thw9QizxxuxwzDAtpNdRRxKmK9cqjJI2suAlI/ZJi4l/lb2KWTzuVfftPuwpWb11foG
 xI9u1f+DeA2+vkIdN97ulIwG0Yh69o4lq+M49LdiRruPII+ikTKqUBzD9dZ/15VuU9fq
 wcPrmHlvs1blIISI9Wzl4m7PLXoGf/ho1C/TZHFq2Uht6BR9zmNTE9ik5GddfQivM8sM
 WZhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130758; x=1791735558; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Z2HZ+S2vidBmnG20BYhRJcN1NWxOOInvW9Vq3G95Kvw=;
 b=kqLH5xFgJSBDzKCrIEk3n9T3pe8/DxGAkj7FgtC+mrquvQGnu7+nLBUtjAQIFpZIka
 jw4w46FiBB7lnUwvWGuwlbj2IjJK91QnRKpb0gbctGB4mxD6NL7ukm9OHIOFHf6paj5j
 rFz/biF5iepyexls9TSP6lagBzxUBwo5nG+N5TR1RiSjZjA9gDaew20EcKjIuwWZWFNe
 oMosLo4xqXNqe09tiuruUgHlBp2Bnh1p4gNlQQEIlDQb4Yh0BdVnnWn+xKcGH/jQQaF8
 Wz9PLX/1bYKcaRwpbHrpuBG6I/jPWXCuf6YmXIP1/NUEfg6TGymqbKtKO++mC24sx9xO
 ggjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130758; x=1791735558;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Z2HZ+S2vidBmnG20BYhRJcN1NWxOOInvW9Vq3G95Kvw=;
 b=rXEskCrJpxHNXQgCtqMuDPk4LIupTt7OBmUoUY2YjQ9EModqfkxCPnDPpg1U4zvqnM
 Ujsuan/VG39+b8UqJttJcCsu5lIRgPqjsZEX8BDIyYP8wAHl3v/mk3Pe7zFolZ2DkrhQ
 5//mURta30OjkthjczFDmW26mKQOTU4gQPS8krIjaCZa8sTwDMl7MACBOZBSoTQQr+JQ
 AhR+sfgjjoL5I9UFZ2rh+wz9Vvv18nIqTvyyMpfT17CP+d9Ap8BD8NgsLEUbyu3Df53E
 CW0e1eKNJIHfL/zajw/TedugNsannyd+6F3aS0fL+B17gM6a7Q8Yysu0ypM6UmnKt/AQ
 50Pg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwsgagiItkAIJflW66iWiZcZFsdiULZhdvVYS0yN9fhCuEBhP1Pd3tmx3wJMi2MsK3+lUPkEW5qBQ==@nongnu.org
X-Gm-Message-State: AFq9FYIAeTZkek/Ti5S1xoWQHtqsigiRwxOP1Zs4P+lbZZpwsLp1lQYf
 KbwzcCHjZfOKxsf0ZO6LnZbmG90IQKk4qJxM9IQy+2OmYLYPicyQKwQ7phtTF304Pn4Sm4J20r5
 1UzJt3cZB1mwhJgRPmhftYeLshxqMQ4E=
X-Gm-Gg: AYBFou1hUJQoWJh7prGhdSwNhIX9Xsd0hbqDUqV1SzS+Rj45L4MhENxnCFcCpLwHJjO
 TCGESlIluDBlgnYG9na50cCw2gxhVsHQDpFSnnnsUmN24SNFQqxE/L0YOcZhepZv59gqYDn3XBM
 R8Gwvp8s4gf/0dc0EPE/vUsx5kkBqE1hGT7OAPaR1wWbut61Zp/u8n0H7lA6jIRaLP9woqYwFA0
 +phaHnzIaS8JuYcExS7Qd1BrUUOEo3gsd1zNFLxdQeSsfDdBjNnDm50kLiUWaFKNgGoh835LgiF
 pqlOOXH9YAm1Wl9ar2SwtJmoHiB/DsJsFELLBkg+eCVP4rH+qajIdVK8GFSnW8JxSqaRqYOn3fG
 X4gp7hCHLz8qwoTU=
X-Received: by 2002:a05:690c:f13:b0:896:5874:6d0a with SMTP id
 00721157ae682-8ae94cdc320mr17071447b3.40.1791130758418; Sun, 04 Oct 2026
 09:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-18-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-18-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:19:06 +0800
X-Gm-Features: AclHuK9w3j5zSHmHvwUqjUZvrxzOSXZD8B2EwEDpu8qYbPL5_2y0VcrVvZXozv0
Message-ID: <CAEUhbmXB2K7B=W5C-MyCCZQr-Cb3s1C0wM5NUBVtSCd5ZphaMw@mail.gmail.com>
Subject: Re: [PATCH v2 17/30] Kconfig: Extract config IMX_AVIC from config IMX
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112c.google.com
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

On Sun, Oct 4, 2026 at 8:37=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_AVIC to eventually eliminate config IMX.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 2 ++
>  hw/intc/Kconfig     | 3 +++
>  hw/intc/meson.build | 3 ++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

