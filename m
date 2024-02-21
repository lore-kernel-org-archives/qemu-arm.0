Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2011595ejb;
        Wed, 21 Feb 2024 08:05:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5+6+elu+SDvSJsKTZ+Tl1nRYHqDBJAe17YMDfF9erfHrhh2AkNkohkgHVt1VFT9JsiTfQ86vpVj8KwgYV5/Yb4VZB7DW0
X-Google-Smtp-Source: AGHT+IFNcI6QD8g69GSqptsaKeBs79HvmuJJbsEAd9ttLGG0Rr+U29m/4BFOt2H5OpNkt0tujzbk
X-Received: by 2002:a9d:6c04:0:b0:6e4:2c63:66d with SMTP id f4-20020a9d6c04000000b006e42c63066dmr19532486otq.27.1708531539960;
        Wed, 21 Feb 2024 08:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708531539; cv=none;
        d=google.com; s=arc-20160816;
        b=R/q9AHa5kF6hDP3WNi026Yc6Kl2fs1lZY0OGXgdE4ckI4iO/bzeYV93kGg4uyNb0ss
         /end2QwwRmWecPPuB0hgoVE96HfqqzHwcuJy8QyJcSz8PUUZ0CfHZ6GE6FWgbQNb0w3E
         Q9qXvTyoVegZZO9/n6KbgdJ2/0RYOUDBc++1eZMCNMCB1fFD9WlVJ1OIDROWNQjNKqzt
         IYaMz4hrdrTnmUWmcPCQtJtaCIkouzF6c0NbG1CZAQotzKFJGmpwFivIYvrO85Vnm8Kq
         wskMw5FMXeARqWNZ6s1cZV9TZP4OE9shPXxlG69kD8XkJTcIZfMzDYwZMGmyIluxyDQC
         GNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Zx6plqljoQIbboKQEAZwb0SuHhChAF9JKzhiTrcSu5E=;
        fh=lEGBvd5NDMS4B3ODxucmdPvubVUbaejigMDc2XaLCtc=;
        b=q90EIMkOEyq7yXNvcRtB1Mju3IDYHHmhG27Rz7agmsgGGb6+xmZWnQ3eCN2oKFMAwR
         bn4wIV/4wMK0mp4jkj5mrdJ9tvdHaurIQR1pH1jYu8pASGxW+8+WcFiH+bUssOfPqzoR
         eRvaFWOJi2m6EA504/dAzfTXz+dENjf0D4Ok4V9LL7PdqRlyABEsdWcgVWCVZUUfXsgt
         t1vGBKUpRITceuen/hCkPNBJBfcATYgNhtxR89+FuQPkxTlwHUvYptFQ7TBDJBmStcxp
         axLeP+EcrDrEx08TLBBkkJQkQoimS3E6dndehCn8N5G5bZ5lECgjIcBOkdwrTklSe+aS
         JSkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dxqYnga4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dx9-20020a056102458900b0046d6ee1c1b6si1656610vsb.551.2024.02.21.08.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 08:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dxqYnga4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcp68-0001fd-V6; Wed, 21 Feb 2024 11:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rcp67-0001fL-8X
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 11:05:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rcp65-0007uX-77
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 11:05:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4125df3c40aso36477035e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708531521; x=1709136321; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zx6plqljoQIbboKQEAZwb0SuHhChAF9JKzhiTrcSu5E=;
 b=dxqYnga4pMPCwsuNdQjdTt/5AaWOT1/kC4z5SZ+Im+7wAIbVckgy0dpms46uoa7rNF
 WpsCyceHEY0tZPfti2fYk4bFiez59iHv63I6YitS74/vLM0V17D48GuvCIoe1lBySXe1
 ydSomL0+b85UGtiWhUma6UJyVcxtfPX/7FFuRnfy+fRhX5JyfAVC6O5YS7prShdHkzPy
 b++ujKupqJ6d58kH0cI3bM7gcL6uT9Q/0TalJd6aVirW9IbHEriCnMbTsC1Ox+kifqkV
 VcuTUYIslhhwumeoDaSt34Kyq4UjZZiRM6EFHA2RFiyRdfW0KMlakHjf5TQBFVVmC9BA
 T5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531521; x=1709136321;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zx6plqljoQIbboKQEAZwb0SuHhChAF9JKzhiTrcSu5E=;
 b=iiAfCz7T3pKkvZgbEevT5BNnCyvIaXSx3136Cjtiy6FNXHiXZRCKfyCPZptwPmsKDH
 WOudSmlf1mJhC2lFRu3mSa8rB+4B7RhuNbBNoqUKOszIngSsgIAUr/khLjHKy7Oa65BV
 Zab7y0gFS8VHAC6LSsuE5kT0gNh76mMrZTxogYiVkFGr74/pX+YgSbzGNeUcFXoDh1NO
 uLIje/zyoJhlxO4Z7pFJr/lJ5Jp7/80xiMsclseAb77Ft4Ge7uvhmtxEp/IBUtLXPopS
 ljtbSBYJ/2VmR8YUfFV9eeDbuIDQJCQg3PkA6KGFIMyHyWhMzY6TCwb0J5ib54UPB5O6
 HDAA==
X-Gm-Message-State: AOJu0YxTjz77noQcn9jNngl2CFavvXx2ixa5EZgpJ8uVjRI7BZXxo7Bg
 vcsBDFSaoho/DHdIKfdjL3mJXhGiAc2sbDESYA+SvbxZKFGfDs2StPajXktQFwu6orZ++Gv1QD+
 JTakAuPIJ+E9N/2cULXwsMds84koj2rhmFykTBg==
X-Received: by 2002:a05:6000:1f89:b0:33d:4bc3:e786 with SMTP id
 bw9-20020a0560001f8900b0033d4bc3e786mr8636848wrb.23.1708531521217; Wed, 21
 Feb 2024 08:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20240207050308.3221396-1-tong.ho@amd.com>
 <CAFEAcA-JnKM9TCbp5=_Ogsnz+GSO96CcP1T-_5jTrSEXAyXc2Q@mail.gmail.com>
 <BL0PR12MB488255D9C3286058E51CBC3AE6572@BL0PR12MB4882.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB488255D9C3286058E51CBC3AE6572@BL0PR12MB4882.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Feb 2024 16:05:09 +0000
Message-ID: <CAFEAcA-fMAuqvw_-asbXrrHLpsh+iC-0u405LJwjCJbxpdD5cw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Add support for loopback
To: "Ho, Tong" <tong.ho@amd.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kV+ldGuJsqQa

On Wed, 21 Feb 2024 at 06:56, Ho, Tong <tong.ho@amd.com> wrote:
>
> On Thu, Feb 8, 2024 at 3:36 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > This implementation will send the transmitted characters
> > to the QEMU chardev and also loop them back into the UART
> > when loopback is enabled. Similarly if we receive a character
> > from the real input we will put it into the FIFO still, so
> > the FIFO will get both looped-back and real input together.
>
> > I think we only have one other UART where loopback is implemented,
> > and that is hw/char/serial.c. In that device we make loopback not
> > send transmitted characters out when in loopback mode, because
> > the 16550 datasheet explicitly says that's how its loopback
> > mode works. The PL011 datasheet is unfortunately silent on
> > this question. Do you have a real hardware PL011 that you
> > can check to see whether when it is in loopback mode
> > transmitted data is also sent to the output port as well
> > as looped back? Similarly for input: we should check whether
> > the UART continues to accept real input or if the real input
> > is completely disconnected while in loopback mode.
>
> Hi Peter,
>
> Here is what I found using hardware I have access to.
>
> When loopback is enabled:
>
> 1. Receive is disconnected from the real input and
>     only accepts transmit from loopback.
>
> 2. Transmitted characters is sent to both physical
>     output and loopback to receive.
>
> #2 is also collaborated by commit message for
>    https://github.com/torvalds/linux/commit/734745ca
>
> However, the same message also suggested that
> #2 may not be the case in other implementations of pl011.
>
> I will work on v2 to address you other comments
> as well, with a property for customizing whether
> transmit will send to both in loopback mode.

Thanks for checking against the hardware behaviour.
I think that unless you have a need for both behaviours
in loopback mode, I would be happy to just implement the
same thing as the hardware you tested, and not worry about
adding the property.

-- PMM
