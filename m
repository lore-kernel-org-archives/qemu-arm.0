Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1276CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:24:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDP0m-0000SK-Ig; Sun, 04 Oct 2026 12:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP0k-0000Ol-K0
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:24:26 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP0j-0001vm-4O
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:24:26 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8ab3fd8adb1so7925017b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791131064; cv=none;
 d=google.com; s=arc-20260327;
 b=rvGYXC5pEB/+Rw61z8s3VyMcLMrwPV354otjoDsIWUzFOpMuEdLvYdmhNK7Ln6AiXR
 5dReXKfVjAja5b3SzcraiL9LOPu+imvNkjjicC+v2mMhVaNWFt+McGt4o4q5mN4jNOhJ
 Fok+kKI7zggT3R6I6Bj7D0o27xiJrb+HCTPAm97BU86Xp1c0uxiKlJUbjMeylDG731J1
 xXrpgwCQi69sypeRg9HJQozbIyHbHGpzlQWRznMgdjI3iRsBpZRLp+PvFCVR5AjZ/l+k
 VZGPjWj2Egp4+BHGVTst4mbO/nuiBQPx/imN+HfOSoZmfhgoaEAIKzEpuXuvGWTRA40n
 fFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uOVDhL85kyGJGKff+y9FATncWkUC3Lv1pByLBJzSctc=;
 fh=HA4BvObogbyGUW0dOe0HS/SIyahJNAT175SXa90YVmI=;
 b=QDL17GcSBtMXVeNn3LnFSfXiKHRmpHwXtOQKQy0TN8xRWQDFDsv6c8LlBBE/akS7gB
 6bFoN1i5mgYrQGLVXHFemYFgI1hdBzdCypprtq9NHQthjBlKZQX1yp2sZhtKrX1RGQuY
 e7Ce8mgIJlCaOU61RNh40ez9W585a2bXlpoayhrIBdLeAIjQM6u6XF5G8q0OfcAkKTzF
 qCe4pMwh14ZwQDcL2yHeeCeC5y7sehj6g5j6ZCugcyNWH/hCsUgkrHXhbLgKr9bsUNqk
 CFd99kMbpgi7/MIebgGh7c1J29LHFjpe64Wje3n/AhdiZcj9tBxVkYgzwuOMgUZ+GWzU
 uChg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791131064; x=1791735864; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uOVDhL85kyGJGKff+y9FATncWkUC3Lv1pByLBJzSctc=;
 b=VHatxNG4CNaocu5seIrN69vQ0tjIojIA750o7GowqgoW4NnG/pT22Ufr1WGZufOpQ2
 fpmu+15ZFBcq1IQzUQx9FTnNQ2hdfMyAUJRNu1hh6CCr8XaKxdVTkT9nsWGoKxEN9qs8
 Bl+VJZgqP5oIaGzWdeA/ZjMr+Bb1oNj5wW95XEhPyFAxCEtRhxEzCkzPpVqVe7lf2WgH
 on/XLZVgVofG5gzGdUtti2eLLy5c1ZSggMdQ0+e9Se4dJESq2elhOpIKop8Yt8Yl10nb
 T6o/MD+gJlJxQnJ33HbvWr6bM/TNygWsv+C4l/K1DrveH4CZmsLLUn8bfJg6Sag9EcgC
 otWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791131064; x=1791735864;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uOVDhL85kyGJGKff+y9FATncWkUC3Lv1pByLBJzSctc=;
 b=zcKA6TF+MuVA7+lh3rLOwGlg5BbHNd10+PnTuVHGYB5LB5o31s4+MCvbiJEv9+osjD
 qr0q5GwC8AubiSgr9MciGolDPOYDChAdSnEqhwcBylSBcQz78jZHgVLmfm9oMD78YBGH
 POfmrPifcaMS3JRlyo51B9GDqMBXF2noKhQsPHeMhK3K5IIZlD2gfxRR1fP6h33oVemK
 kO0xYCQMoPxKVPdKMjPsswwDkyp+C7bM+Il2Jowpm5lZd6NOJVB4HlZIJ+jBvXpqV0YV
 Wc2HYGmhmD/kDZY/R1fc0n6x9gwd2OtlNyboNOqo/Gv+if7kPmP4TtkPz2tfW0bMn7Wc
 Y3Dw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxIobhH814k0zxRWzahMGoEClPNZ9/ZKFb4i81uLdHTMwqxKaZ/UbaydMjDNT6DVoZ8JcjBzM58OQ==@nongnu.org
X-Gm-Message-State: AFq9FYIAXbO2InfOhYrALDmt2IPVYwmgwLKRw4QazAd50SS5pXYwi3q1
 6dSL3mHTxLopUvAEJsqMaqhZ/ds/0PlzyKzPNlt6Ih1QhEt6w/EONo7jiEF81Ew68Zlgg0SLj/z
 dacjmfSo8TUGMjxyNoikZMlaJtv8vmaA=
X-Gm-Gg: AYBFou3Z7W9k4gXqe26rc5HNMaY4j28CRONne0lVrFU1secMST56gLimh98OguLRqIS
 zaKjdMGHib94gZx9ky6rKGccmD6DkdepqZfBt3AhYY5DsDumoS3ck5xkba/AgwpILzi2OqApE56
 5MFkfk8DZew9ENLM7WD6ujN1l6esMom6yu43rGTp0T++62ZGh6sv53pSOK7pbYOu2cZsVhLaWSq
 eO4qR+aMV9M+/uCCSS3aHmTj1j9hdiB+qX69av5CdCliCGmnfaA+IJGGnd0us/X4qRQfEvpKcs7
 iSz8lgUb9tphAHh/sVFGkeCcH/h5kpBjea/qLqNyaSzS/AEbniQOKFMsz7sGjTCXPOKUo23km8A
 geQlA4HrBzHSWvPM=
X-Received: by 2002:a05:690c:39a:b0:89a:63da:faa1 with SMTP id
 00721157ae682-8ae95b38df2mr18880947b3.92.1791131063901; Sun, 04 Oct 2026
 09:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-27-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-27-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:24:12 +0800
X-Gm-Features: AclHuK-l4UZbwFjPn4SSfsmg3UdRvYIPSrjZHKRJklgoiQtrgBR2mAsrIUIlPcw
Message-ID: <CAEUhbmXb5eOzmrVho4SNjMdA75s0VepBL7_eNEPYRMZeFG_PZg@mail.gmail.com>
Subject: Re: [PATCH v2 26/30] Kconfig: Extract config GPIO_IMX from config IMX
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1134.google.com
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

On Sun, Oct 4, 2026 at 8:36=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config GPIO_IMX to eventually eliminate config IMX.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/Kconfig      | 7 +++++++
>  hw/gpio/Kconfig     | 3 +++
>  hw/gpio/meson.build | 2 +-
>  3 files changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

