Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B6C531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 14:36:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnH0A-0004jM-Qq; Fri, 24 Jul 2026 10:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnG9X-0004g6-6t
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 09:41:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnG9V-00016u-Oc
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 09:41:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso5127685e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 06:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784900483; cv=none;
 d=google.com; s=arc-20260327;
 b=EVEw7sS6FT3vF6bfNIJEARgTEkYxd9YagcJt4BNL2Sk/TBz+t2VMUOASAuRf2PwaIC
 HKZCn8oA0qmIPIO/jRzlA483xwoeiqnWS9zkcuM3cyXp4deE3NmmKUx3R9+/OBY3vDGv
 BWL3t554/2cEysfoKdrmMApgiX013NE/CbFib4sW/+BZpR1uypbsd86rqpopwa/eBEDN
 zd0tSTcxVG2Kcr5SjVEo2uz9K8bFk9MHkNAe6qLBvEGoEnoff9rc5R0wi6t/FlTmmBzE
 cKqaV62YLtnZolWo3qZQRgSikoSNymSFEdplekx6HS4WsxH4c0reePxU7e5mx1YQL8Ia
 Po0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AUVUTr/HgNRCnwG1yMKM1SC4paeEuvPkbXDF+YwNfeE=;
 fh=xY/IJBFmmpGMCGcrw8h/Vq9t9I2mBHYUgs5NmmtYgfw=;
 b=PSrRUUoCOfC6fOfa4td+mxk3+qg3pAyCy3BZzkZ/Xj646fXR8xe/DMxQHchTzOsIhq
 IjP6PYb1M2srcoPtUlrHSKC3OGOlppl/qV0Vf/C8yJpbhw2ILHZPaje3Tr2tEMZrsWrp
 2M4yGfuiWU0tH0AVCRKtV2tUHcrYmhVmDejCNDtOR9eDSG1EPh8Z5Eqhu9VRW/0Cs3U4
 DdxKCvjqcj89gggeZcSaRtS8EhPGjbEJ1DSqTT4U5WzGOE7o36WXnIZZNM7XEGiJ4Lvn
 FWswmAIQyMrEQAN6eUmEhhIMyylbe2MTpE0wXBpJPlRgR7ehcWa6b2GvgBsJxdjyBSVX
 y/IA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784900483; x=1785505283; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AUVUTr/HgNRCnwG1yMKM1SC4paeEuvPkbXDF+YwNfeE=;
 b=sK4LSAEP8jl294bvj4PHJJ/t2BzsSkhB/Avz4ix+DJob+i9dftpV/MYLAMS8qjM8Te
 wTM84Mr54oIJ4QjS+3HyD1XdaJcxCH2RdW6qiXnDLwSCjwFFMuG6DIfiwQb8MSVwcNse
 Jd0CdORLw10FCkaJS8oAhorTWpJn9y5bQ9pInTD8F/+Aab2r/cFVaGQzO+/lGqMn2/Il
 QUKFekutHaZ+nPcJPWPllo7e7k8QcOcqc0Ogtts2i+AEU568bP0Ie2oVz4olVWLzbhI3
 eiVv3l6YgL8cj5UghmvvuBjdQGwHDQfxCm79gYEa4RBXmPa2ILsXyf4vn1o1ILvJWEmf
 4hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784900483; x=1785505283;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AUVUTr/HgNRCnwG1yMKM1SC4paeEuvPkbXDF+YwNfeE=;
 b=k4r3ukEhKQ00jT4duH5Ws5ekR3K5YsPf1Md++p0mwq9yUozFAYnSOzlOPk1Oc1h0VD
 s62B2hZu8yHuZO0Jryz2MUy47fJC+JLQMSdshrF2sMrQN37JJhGqSWiDrPZ9W/Ea5r9S
 tDVqjSuDrvbxEIaHRkRoX/T8sjEtlE2q9DnjzYU5fExCSExxSOPjg3GEA56rM8vDDRsC
 gTAvtx1Yojg/QEp9aS3c1tBBnhM2Ts51EB1n8AXOQ3Cd1BfqsJgrOQU/TE5Ix0+KMWOS
 GQM8QZbj4usoN8l1rOPZOn14wRIb6ZM9O/Gq3vp0MrhLFdjtp6ay1IF5BbJIcm9b17o+
 aScw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrI4fmqssJbzipstadNxjJY9YJvMTFCTZJNYdN1SAg8Gp6sOBut9YI0aPBzxca5BaM3mi7fmCC+oA==@nongnu.org
X-Gm-Message-State: AOJu0Ywh7DruDfuk0AKWz/6wiQKzDgHBbuxcLO2bBukT+Qvb2bbN8388
 X2e9A0tcLSsRuCQes6ji8cVhSPu112q0d8QMEleZOPcQzO0LiEDSFt2dGqqRoK67OtF+T1wJ4dD
 OpmBCHb6KQCOJNpKnkcoa/E+ylNdF/BM=
X-Gm-Gg: AR+sD13rZtzVReHDGRTsDDuRVbA20FZgDG0LVX/hI6bSpG5VE3+PFwzOi1hYBIgy7Z+
 aLTIRZo7MFnhlpcK6Szr3oSeO3HIj6+cxZIlSFt2Fl3eNf1op97J9oA19EHua+B53+YJDJyOzF5
 BxX3CNdeHPc3NpVjo4i9LF/r+H2rOQAyGTrZmgG/vY8XIOkcJnflcguZ+Kz8YZRKs9cyi0tr/t3
 qbBlkGBiksk0g88AD4Rxas6ZG4BhWkUhMQGGchrge/trk6bQHuzngpdeF3/FBNfeBOgt/1LQo1n
 hJNE/7RiuoMwpTXnoixp
X-Received: by 2002:a05:600c:35c9:b0:490:9782:3eb8 with SMTP id
 5b1f17b1804b1-49573cffadfmr89335425e9.25.1784900482527; Fri, 24 Jul 2026
 06:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
In-Reply-To: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
From: Nick Huang <sef1548@gmail.com>
Date: Fri, 24 Jul 2026 21:41:10 +0800
X-Gm-Features: AUfX_mzkR-JlXs9TM4M8AMyvrXPbVdOW-WzjEEeyNV6UeLYPuIi8HEZb5TME_rw
Message-ID: <CABZAGRFOiXdJxsnyvpDkD9YjvoO=mH1H-W0FUBJ_q1WcYnG=Hg@mail.gmail.com>
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
To: botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@mailo.com, 
 qemu-arm@nongnu.org, 
 botszhuang <22925483+botszhuang@users.noreply.github.com>, 
 botszhuang <botszhuang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=sef1548@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 10:35:39 -0400
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

botszhuang <huang.botsz@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=8824=E6=
=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> hw/i2c/bcm2835_i2c: Correct CLKT register offset
>
> The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C controller =
is actually located at offset 0x1c, not 0x20.
>
> The previous incorrect value caused the guest OS to read from and write t=
o the wrong memory address when configuring the I2C timeout, which could le=
ad to unexpected controller behavior.
>
> Update the BCM2835_I2C_CLKT macro to match the hardware specification.
>
> Signed-off-by: botszhuang <botszhuang@gmail.com>
> ---
>  include/hw/i2c/bcm2835_i2c.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/i2c/bcm2835_i2c.h b/include/hw/i2c/bcm2835_i2c.h
> index 45f876df22..519c65f765 100644
> --- a/include/hw/i2c/bcm2835_i2c.h
> +++ b/include/hw/i2c/bcm2835_i2c.h
> @@ -38,7 +38,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2835I2CState, BCM2835_I2C=
)
>  #define BCM2835_I2C_FIFO    0x10                  /* FIFO */
>  #define BCM2835_I2C_DIV     0x14                  /* Clock Divider */
>  #define BCM2835_I2C_DEL     0x18                  /* Data Delay */
> -#define BCM2835_I2C_CLKT    0x20                  /* Clock Stretch Timeo=
ut */
> +#define BCM2835_I2C_CLKT    0x1c                  /* Clock Stretch Timeo=
ut */
>
>  #define BCM2835_I2C_C_I2CEN     BIT(15)           /* I2C enable */
>  #define BCM2835_I2C_C_INTR      BIT(10)           /* Interrupt on RXR */
> --
> 2.43.0
>

Tested-by: Nick Huang <sef1548@gmail.com>
--=20
Regards,
Nick Huang

