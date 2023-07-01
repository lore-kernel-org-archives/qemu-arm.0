Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp1494866ejy;
        Sat, 1 Jul 2023 12:30:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnGTaYUhqoeoY453eswy7Euj1ucMxYoFsKPDzVJJKP1UUZkof3PdZEvZP0i8mpSIfPz9PB
X-Received: by 2002:a0c:efc6:0:b0:635:e696:b322 with SMTP id a6-20020a0cefc6000000b00635e696b322mr5576442qvt.35.1688239807859;
        Sat, 01 Jul 2023 12:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688239807; cv=none;
        d=google.com; s=arc-20160816;
        b=pErn8/EpPlxnnDJ/1CPKDm0goDaWziwxVTRn4fg4QbygVcx3xNzaWVrlo0yVsdrBMK
         zm57m5M8c0FAnoqre9Zb7z4Fy7ycxtiL7L5r8rdB3iCfBNY22I11yCUCT63YkJFKiR0A
         83rxd4HAkZt2oPGgBQ7DXgbUCVkpg7/iZTozZDzqcTQi4hgoNsJkcOmKwD96NwPnegP/
         1EUDWknlt1at4nbslv4yeI7w1/StfQ1KajViF5KDiA13UGnA4qy/j8WlH8FO6yU+pXB3
         E+HV1k7ZIdnqS+XYxEiId9hw61qd9C1RjqgX3fru6OY/Cb2bHDRCHZI21+jFF7vtz/Nm
         A8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=pl+wOjZUOTFt0Nk3510CBbG02v9fl37VNTEj7ZB0OcA=;
        fh=l2dptV8ez/0XQmbtsURAmp7D4HBJZE1JNxwEz0P+Lks=;
        b=Jk3LO630hmnKzfade9AYUOIrklGWsGvu9w2SZI3cRWPz4SbLhha975INC9IdLSAg3B
         DTDxdKm2tFBJqHtRLjhl6EUFDGjns+ZrhGzsXT3sx0fklaHpMDwOrS4p9qrzFhzTPgo2
         8FzzBwLhXzZe9/gCOnE0z9R298lLhEBjLyc+w8jrRTh4nyfIoq0e+ujhy7HPDXTbjG0C
         bmwLtFUSPQEFGJkjWoXUD3uRhpsOEY2twGYeGyHG7T+fzV0WCGba45JUUtaP+RFKhBcp
         riv6LyDFjgCFvG+yCl9MvCaLBeO7vWtWOOEftzSVvY1ZByDCGBsCoO2Kk0XGyBx+6nG2
         RTqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=Fyl0cqC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw11-20020a0562140f2b00b006302085714csi8894151qvb.104.2023.07.01.12.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Jul 2023 12:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=Fyl0cqC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qFgI9-0003Rp-IE; Sat, 01 Jul 2023 15:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qFgI8-0003Qr-WE; Sat, 01 Jul 2023 15:29:57 -0400
Received: from mail-4018.proton.ch ([185.70.40.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qFgI7-0007Ss-BO; Sat, 01 Jul 2023 15:29:56 -0400
Date: Sat, 01 Jul 2023 19:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1688239792; x=1688498992;
 bh=pl+wOjZUOTFt0Nk3510CBbG02v9fl37VNTEj7ZB0OcA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Fyl0cqC7solQoeTK0eH+KseDQZvL2LmPBSVA0QByO2uuHX7h9vKZ+LEvRQ0aQWKNv
 FzLvp6RNNGnnidRtFFa++lDv37g9QTo0y+CykkHQeA0ngRjnev11S7tmfCni8u54lx
 42Hhjvb+sxWEWHVnw3XzNTo+jEAbxfny9oVHo36bPknmMnTfDf17gQzsuIkvHdjHj7
 Z/LTQHYKzvtnT2pZ6jmWSqXbUdrfie7OQdOS7uV0CO0L6+PLTdSQftW4UPv6rCDQ8K
 Nwx2aewu5ANEXlZ2dWq3XlijTxwv+gP/sqNBniTQ4meu29fNLYEUkZZJGR+UdbQ/4O
 uYAA0gprIlxbA==
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
From: Chris Laplante <chris@laplante.io>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: Emulation of 'System OFF' mode in ARM nRF51 SoCs
Message-ID: <MohQfUExfL0nZ3j8PyHN2oCI7rFFewEiEJGrkiEJvvj1R6VDX2KhN4miSxpq8MVBbXD0NqZG_F1ZVYQZ9fhNnISfa8p6JC2hOuXajIgMiew=@laplante.io>
In-Reply-To: <80bafa6e-77d0-184d-4798-207d13ab435d@linaro.org>
References: <j6_NJPGssQ1eBAedcPGs0eURXeMcehbzMcwJtaGvzN_FdUbQKyTP1cyEJWC759G72UNSVpX-QmQ4u6iJvZmt2c_vRO7rhryDQs9icVy5iEI=@laplante.io>
 <80bafa6e-77d0-184d-4798-207d13ab435d@linaro.org>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.18; envelope-from=chris@laplante.io;
 helo=mail-4018.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o4k3gr+oWp+g

Hi Phil,

> What problem are you getting with a single CPU?
> The "arm/arm-powerctl.h" API should work well.
> If you scheduled a timer, I expect it to awake
> your CPU on expiration. You can also use a QMP
> command to toggle a GPIO and trigger an IRQ.
>=20
> You can use the qtest API to test your code,
> see some tests in tests/qtest/ using:
> - qtest_set_irq_in()
> - qtest_qom_set_bool() for GPIO

Thanks for the tips - I am working on implementing this now!

Chris
