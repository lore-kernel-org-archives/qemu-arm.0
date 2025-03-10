Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1059061njc;
        Mon, 10 Mar 2025 03:50:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuy1x7eEiIOcq1skXxFGjOVZiLsPWjSRrzd0AuX8EABWKNh+l7BcexL75VJATUAHd2oe4kAsK6IOP37A==@linaro.org
X-Google-Smtp-Source: AGHT+IFTTqfF9ScOcXQZ20EQUOH9SROY/IhyhAZBwDtQTJ2T8+hk2cTqqWnVqnkSCyDAGdDbnDU7
X-Received: by 2002:a05:622a:47ca:b0:474:bc32:41e7 with SMTP id d75a77b69052e-476623891b3mr118242971cf.1.1741603814238;
        Mon, 10 Mar 2025 03:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741603814; cv=none;
        d=google.com; s=arc-20240605;
        b=DA0Wwrx2SP6G6CPgpR5wRcya1JR+El1+yhZoWndNjY24kJGEda+DbI5/OJGDQ+vl40
         TdGgCGv8Oh7ep5dc8GdbwUl7wIqmBqx/LIzDPJQxO8Sai+mOY1VuDczZv2Pe3n5gphvL
         uN+lWDArUlhktF1XgK3EW7iCpGMcRaAtX3GAhOFNzp1kNB7BJTRW5DR2ipg/JmQTWxEe
         Y7ia4TEi5mrY8LNg9/a91EszUl0jJ/kj6+H2sz1A9o8K3lcfO5aQEbBNX8cbT3v8q2Cf
         CyOlW3OS3yLxhOP4egmnV16KNxujzfBKlziM0F1w4xsUGW9Z7QQwv98xV1soLPk9W/ob
         2iJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lPdgGObt3I9W5H3oCG0ujbSqzvoCHpdJpv7djxg/VTY=;
        fh=FvLmK+ASwa/udN3BYzpHvOI3vAVGVgdWPOeLx1ouiPI=;
        b=IXlzhsMueSJ0W8U+n83Dhsd8sEYW4ypGq4sDyVZpJOOLD1xUDGm15SU3zL8F7CAVhh
         vpT94N66yIAnSdVpdlVyTDHm8kcikzaDFrqMkNny3MJm5qLYYJ5tn8VtU6J2ZPiw77kG
         xeRLGfmBveZ/qrxlazsbUZ5v5GAcrm0oOhlCywpQ9ZRHkuhd2sE1dlD5S6GHlEX4JgJe
         sst8HIy4/U5LbZUhkGHwXR6ZoPGBePWAWFb+kvhoLf5a8VED4ri1TbYbqwC0FkpXBorF
         Ipxeu9bKYp++hXhn0k7X2Iy66VyNvcA4+WNDo2TJc5lAXDHOjNF1Q6fOpNRBylydYsE7
         qvbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAm6Icyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476704ef45csi41894471cf.566.2025.03.10.03.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 03:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAm6Icyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trahs-0006de-Ie; Mon, 10 Mar 2025 06:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trahg-0006Ue-RL
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 06:49:50 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trahd-0004wL-UW
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 06:49:48 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e6341e4d0b4so3719694276.0
 for <qemu-arm@nongnu.org>; Mon, 10 Mar 2025 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741603784; x=1742208584; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lPdgGObt3I9W5H3oCG0ujbSqzvoCHpdJpv7djxg/VTY=;
 b=mAm6IcypiywWxMzJSct1xCVvVVfSWy+P/kfRDLiMa1tRxjHyQobOjGMKs0UXyddazh
 d7S2gjQ8gyRFiJjR1iooZh50qzA4CBCjnrMAaZApYXHGg+ZUli1oY5TE8sE6LXIjks6M
 QVmlOrz0VK+hDuLveOFHvEKwROATcV4KqSCH3UksW5+c1axuCQ2vrhTQAqXYGFLm38MG
 k9LjgEvh8Kp/bctKTRzdiZ+VnsEDUXjUwNYcWzmcZxDlSNB1AuNHfhVqZjPdPGtArXvJ
 7QjHnntllOhuNg0uVsBPyZeoEsuBzJJU+v7IPyktwvwyN9Qjcg9o0QUr7+LcLjjSK7Dt
 Lmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741603784; x=1742208584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lPdgGObt3I9W5H3oCG0ujbSqzvoCHpdJpv7djxg/VTY=;
 b=dDhvKn6t6BuBY4W4ALocKJcNxdGoVKC9jrWNTEOT5aQWx2BIyBP8xNrDVhIxzrJA4t
 +ojgiF3iWSfcppcVFGrSvbZibWuwOr4jlomqfhuaUCaRzeoNOyeZhcOdAZ1EpHAJ8RUj
 4ohHCd7QTVS5IukJl8WtZxAUItV5YrX9wO1ZeW/jIJrNbsCop/pZ867GXiynpkvnzU1M
 87cBSTdvCAclGmwucS4z7oD3Ilo0y6z0/TeZcID5mqIQSkLECvSn9WWRYYKG5Kudyga5
 3g9qLLE61P6rb/1M/6WdZA91ReJ/6KZ69S1HTW1vBl64FEdzwmaDFP/oZ/CCpbj5Ehqz
 tB7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7c7WINbK7q2VLiF+RjME2/5VuP7mIRHl0MoVJHSHygddVmX+HgpkIXlOrdmaOtBcwTeLy6h6Www==@nongnu.org
X-Gm-Message-State: AOJu0Yxyri0szaG2JORw2ZJZjhJdXDHsJQQan0mYLdxwpvSROd7zd5TN
 n3VWJCxwm/GR352EJxMSiM+tEUvuVJ4CMuIZIkP8gaL3HsMFvRnEk2pjmUbSLNcWQfvuRigSwi/
 JTMpvR2ucRo/WMKTIYttU756Q56xr4R/o6aNk5w==
X-Gm-Gg: ASbGncs7oQDvuCnUT2yyNgWe8iIRiS5hHiFUckBsuKJ6OV0o+FM0fp3T98PhG2IPPDY
 HKZZ6LEhZbRp7wc+rCvw+Taw1ZEjPe2J8rVkhfxTur0vDHZ5zjiHyqzsRaQwuaDTJWOdes8Ddsj
 52VwZqqrzLQ+fVGlqD2CnZ/Xagjx4=
X-Received: by 2002:a05:6902:70f:b0:e60:915b:188 with SMTP id
 3f1490d57ef6-e636f7e9a04mr10189653276.18.1741603784612; Mon, 10 Mar 2025
 03:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
 <CAFEAcA9kED+fB1repp2+r-zMfZ_5ZeAkZq2ChyxjSUo1j5gAFQ@mail.gmail.com>
 <aef79501-b99f-4e84-b6fe-14dec1e030e6@csclub.uwaterloo.ca>
 <CAFEAcA9ht=T_XqKaKB-PaNK9joQFYgks37JHjqUO-qkaNe7YUQ@mail.gmail.com>
 <d714a7c2-2291-4a85-abcc-81648da1ef57@csclub.uwaterloo.ca>
 <CAFEAcA-9Nj9KrcPwoBBT88wK=NUPsorT71XbBbyLJYOemmkojQ@mail.gmail.com>
 <3660e47b-0f37-4e6d-8bbd-7d646eb67207@csclub.uwaterloo.ca>
In-Reply-To: <3660e47b-0f37-4e6d-8bbd-7d646eb67207@csclub.uwaterloo.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 10:49:33 +0000
X-Gm-Features: AQ5f1JrK2AJr7PnVsjxXkms3FcAS4rRuyNa3gw_NEhUjC6t3NN5Lnc8cXvVU0Sc
Message-ID: <CAFEAcA87OntUbW+CnebWZirnrHw4ZwFwROeRs4qJd91O6B3U4w@mail.gmail.com>
Subject: Re: [PATCH] bcm2838: Add GIC-400 timer interupt connections
To: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T39fmESfSwYn

On Mon, 10 Mar 2025 at 06:29, Sourojeet Adhikari
<s23adhik@csclub.uwaterloo.ca> wrote:
>
> Hello,
>
> So far I've figured out that I need to add a member called SplitIRQ
> in the BCMSocPeripheralBaseState struct, which is of size defined
> by `BCM2835_NUM_SPLITTERS`. Then from what I can tell through
> reading through the codebase, I should do something similar to
> what happens in `exynos4210.c` in the `exynos4210_init_board_irqs`
> function?

QEMU qdev devices have a multiple-stage initialization process:
 (1) 'init', which in this case means calling object_initialize_child().
     In this case you should do this in raspi_peripherals_base_init(),
     where we do this for the other child devices of the common
     peripheral base object.
 (2) set properties (in this case the "num-lines" property, which
     needs to be set to 2). You do this in the parent object's 'realize'
     method, in this case bcm_soc_peripherals_common_realize().
     There are several different equivalent APIs to set a simple
     integer property; using qdev_prop_set_uint16() like the exynos
     code does is fine.
 (3) realize the device by calling qdev_realize(); this has to be
     done after all properties are set.
 (4) wire up the input and output GPIO lines (you want to wire up
     a GPIO only once the devices on both ends have been realized).
     For this case, in the bcm_soc_peripherals_common_realize()
     function we're going to wire up the the device's outbound
     IRQ to the input of the appropriate splitter, and connect
     output 0 of that splitter to the BCM2835_IC correct interrupt
     controller input.
 (5) The last bit of wiring, where we connect splitter output 1 to
     the correct GIC input, we do in bcm2838.c, and only after
     we've called 'realize' for both the bcm2835_peripherals object
     and the GIC object.

> Sorry for taking a while to get back and still having quite a few
> questions about this. Thank you for helping me out with writting
> this patch.

No worries; this stuff is all quite complicated and we don't
really document it very well.

thanks
-- PMM
