Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56463C531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 14:35:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnH0A-0004jR-SZ; Fri, 24 Jul 2026 10:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnGKA-0007Da-Gp
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 09:52:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnGK8-00024l-Ar
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 09:52:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso429832f8f.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 06:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784901142; cv=none;
 d=google.com; s=arc-20260327;
 b=RoouVDVEFJnxYjF2s1/Y5+e9MjbX2VdTv6qejASrJtStwPeVR3qIoGJlqHZwFddhMF
 WWftHR2JFXcwDteXLkRAFBoX9yTq3omY7ql8oexorKBWc1bPOJUe0oByaNjb0PeK7353
 gruM+7tRzAE0H9vM4b21Xl0zkE4P7b2zq4094iKoKLwLCHYNltUGzn3xVLl5S51WS1in
 pQoL4uuD44EK8A0OYBjEjIpz1FbVD8jxYvcBhJQDXSqS6vPY0nHQ02V6drLqA4t4P8+s
 oN37lxAOyr3FtuaVTdhViKdOFvrFPKI+3zA7vEtr/Dn9Kyipy5+b1tqSB7vk6Qke1lDK
 cfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V6oyUglO8Xu1C1gsvw104MavYBVhw711ANAZceOpkdA=;
 fh=vdIg7Cjn7tU5nXpGjLJ4+Z/hNWLvgR214ZnSBV9vpYs=;
 b=FPiD22A6JNlA+3Xcwyz9qqk6aqa8uUjZPpL16XR1XP6PW+qXkcF+Xo51KinsepbmDm
 TRkBAIrRI67KUfBOKfg9VZnlDTfPsApYir8jHyAuv4G8Xadk+R+RuCIgPrA4D2gvo/8f
 aZXjfTd1ndle3MLJl+3LD1t3vL5YmE2F9JgnIYn8Kg0xGZCGQKW7O/3mf6Mowh9LeVvk
 IO+PVmiZl2SVzqjeoYg+TW4Lv5a9lBfWShTG5l8if7/sQ4yxv5cb/e+PNEvsMN5koxcW
 RdvsFduoKbru9Z3ClG6UurcB56EXHJU3epdf7ZsicptvmM+66G8S593Xtbegka/wd3RJ
 AhrA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784901142; x=1785505942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V6oyUglO8Xu1C1gsvw104MavYBVhw711ANAZceOpkdA=;
 b=XaPqfmr3B80HDyCI69DGLw215wbvCvn2TTc0IW4lisbKxR5K0UvRS7YGrfwYU0ydKZ
 Eq9lU2JBH4X3hki9Wv0GFpNJEXVHlcpz7BZ2C1mQa1ecIMJsm+6IHDplUVSFgZY/Z7Je
 t2jzBv7vsFLPCI1q9Y9LRkd22y0BhyEQFX6p/0Z6bBR7aO0HU0+0y+MW7DYcS7I35S02
 QIXpIRI05DZkNgB/lOGRadiqI8ji1IMQlB6yKwTS4PRLPafVgqqWstcGGcFR4d93ZKgi
 lL1DnPu74On7K3muR5D5g6YDPG1KDhD8gw3HxjwUSihUdsKD6vNBHKBWj1+1hwD4bGmC
 jeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784901142; x=1785505942;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V6oyUglO8Xu1C1gsvw104MavYBVhw711ANAZceOpkdA=;
 b=NKWDe03IVBC+Sz6rp3NRah5wkl6nb+0IjwYWgnCli6yKbme8eBMVB2drZk40tWeZNs
 S1bAs8ua9Rc1TAQKjcacq1WK/SUjtEqpwhIFHdem+XhBJBEf9wqfG74Hy014mXuutCzZ
 AoWksVrdEE6eIsSyljolJQ3VSN3cRB+C71MDBEqOxmHS2lAD4+R+2Zfi6yJygmXGq4ED
 0CrpiqWdvZ5zH5fA1OYUZo90zsoX1nPVd83t1yx2ALoB2zs89K0/LOGCpUjEQuHY56+G
 qzjJL9FwrcwC8Ij4IzYylzEbNypU5adjIjYUiI40uAuwlT8ZbCSURyj70t4ctvKKB0vv
 W+5Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrr1haLyInAZpiwm6ENiB8VartFT00Rbo5ENFbA4T4pcxh+RrAMJ0R17Y13cGlP191nMvnYrRZ3yA==@nongnu.org
X-Gm-Message-State: AOJu0Yze8fe94cxMDpBW9oEB3ph2Vg61P5brDQZEowGJIDlfTavIBb+l
 Y71kMTvANbTrrt0C8Y57/yyVcwy1DZ8uKaYozeyD6BU2DyHtA9GsE6yor7wwj7I9Xw4WYM8TN7R
 RKFPIZjoanHiTLDmP20i7kvgsf1vOOW0=
X-Gm-Gg: AR+sD120kVV/wtw4dueFs4/8p4z/QyYdsPIrPuMGYX735xQkbsADwQktGQdec4GQx61
 5xG3u4VIyTmnB/aOl01LgrAtPkTsvF4db8Z+51TFHjdMgojVf4Si1mZKa4bGJghjXfo5Id72Qal
 aUeyi0EZf0hnUxOifKZ8hxj1L/hNWnikn+kIU4+gLwpvQj5UsmF6JIMG9TPwMaoElvZZsyPV12Q
 fLlFjq/XyUsnqvWWUfEEjxk96lqIbQsxKXIgYpEksJCP9jZZ4GRZLXFezAkp0zgX7pvwm8UzbH2
 cvTcnAWrwTLlE64xUw+S
X-Received: by 2002:a05:6000:4022:b0:47f:80f6:afac with SMTP id
 ffacd0b85a97d-47f8dca592emr9663654f8f.49.1784901142267; Fri, 24 Jul 2026
 06:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
In-Reply-To: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
From: Nick Huang <sef1548@gmail.com>
Date: Fri, 24 Jul 2026 21:52:10 +0800
X-Gm-Features: AUfX_mxyid183ZDhvc8jEW3aqyjgalQqizKUI04sk3aqGVEmTHw0h8-XwxYkC5k
Message-ID: <CABZAGRHQa4n4A+EAXSEfFCRRR8oo=4tRQMGCWJ7UpRGoVd5jXg@mail.gmail.com>
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
To: botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@mailo.com, 
 qemu-arm@nongnu.org, 
 botszhuang <22925483+botszhuang@users.noreply.github.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=sef1548@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 10:35:42 -0400
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
Hi
Tested-by: Nick Huang <sef1548@gmail.com>
--=20
Regards,
Nick Huang

