Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1873746lfo;
        Fri, 5 Feb 2021 02:04:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyW+GeSDPw5LVgRPTeJtoTwaM+7iZ+wFPtlQMjnP4Ce7BKmA4PnH4niQ1marMcRjMqmVDRe
X-Received: by 2002:a25:5c85:: with SMTP id q127mr5471429ybb.101.1612519467509;
        Fri, 05 Feb 2021 02:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612519467; cv=none;
        d=google.com; s=arc-20160816;
        b=yRH/nwF1wW4CKGyQTnYltG79j4uF/XNUtSVPLt15IJnGX/MQtXiMUdoyWNasIZNp55
         +uE6fZHVzDD7AEocMc5ZKA79yQOYKz8cjqheMRrRDyBLMgGfLw7pwlxxPHChkdZoK8ni
         I1twoVP7i7N4hMDCGeSzDLMnPseYYLdvDY5DX3rgwMCfCkudr8XBnkHo4A7oHhJGbtYo
         Q5V5G1JQc/LujjCb2Pv72j+wHFY8S8xOQus/iKLlBo32GYPmhxgmkMTagGZWEUDRnaWi
         ogzBGD020yb0PGymjTN0QlH86pbV1pN5WdmVO8W3IltER8xZ71uUq23y6S9VSOEv+WbI
         X2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QkRraTuG9I3+RUzT5etVSoU/LORb9JRlwCxVj6PexCU=;
        b=OaRrWgecsXWM4xGtAcOqR/oweBSYdoMwhdi+v9E8mhLqdfx5smBOxfwTWpJq7/ZwDS
         rG4O83rDOzwJ+92U7SdH0I+6uZZxWxnYZnl0KN0NrL/neCNbD81fnCz9s5mlC4Y55oK0
         z97X1H4ISPOQcui1Sn43mEEblNDdXQqdJnxp6yZ1K5XNCjx/jVzxdVhw0ZcmDl8/SrhO
         fCOewSDYrckMjGy4j+AcEz9wQqY+4X/tvXRn5nRBORdZl9gmFild4oDHZ2xK9uZZPthx
         F7X77tB9/7WP2p/WEaZ3QFFcFPxYOA2NZV9N6fHBmfkvlBUUvxWdAtt3uflCF/f/ZYkQ
         Qd4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bomdp42e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si7330560ybt.458.2021.02.05.02.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 02:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bomdp42e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7xyU-00018R-SL
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 05:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7xyD-00016p-Pa
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 05:04:11 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7xy9-00037w-Hp
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 05:04:09 -0500
Received: by mail-ed1-x52a.google.com with SMTP id t5so8088143eds.12
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QkRraTuG9I3+RUzT5etVSoU/LORb9JRlwCxVj6PexCU=;
 b=Bomdp42eh4lVeXpgpduSUl9xuTWk1AnIq3e5LYDgJ4/U83wVG756NFvUNanCdqn/zV
 0ZLZ2cEbhAQIYCJCIwJonZk7gDKBQkoAauwqU1BjhP8eDRjCBp5cXVzHBIo/xGhonHNU
 P3dXyRNmnaWRKCfmXISZrG8ak//RxlOjqAbK4TzW5KvWpxhn5eQYbKnld6WcYZFfye6u
 Do6dbuxR8x1LAkXlg8KyYNEUTByjEhEtfaeUby4R9BYlXb/7HxAvQz1L+NELX1aeQcid
 +MAD5urynzw8z4FeEdkV5GpgbPqAfqlINnZNirCaTJEPwVfufd/wluq07fQ0g5UOmFSX
 7SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QkRraTuG9I3+RUzT5etVSoU/LORb9JRlwCxVj6PexCU=;
 b=U2ZvxU7nuFvdk2ibWDarxpFO42z2dz6RyQ+KUQUaJTcmqG8n+T4ILUKy+1AGNsL/Ds
 KmFU2r546/gN1Pgv+YT0COsOgrof1s8O/PWKW3kPy2N33T+pR3kTrxq6jjgmy5J6k/q5
 CIS8HI5ncX0MCk0aUf9t+hO/NsMlnPeG3P6W+VfaweZ1/nEPnainTfw5QdhKHjhEVxhV
 qGejrPr6m3Y5tz82SH3bNB80Gpu49/n+ieiSyHo63UywRphsNlK8a1krfLTMVxNZT+Fa
 d/wo5xR8iG3H+MYGyeQ4HfeKa6nVsoHoHFfedB2RTZynEUZAgAanc/OFDiPU9JxXvBMp
 v9xg==
X-Gm-Message-State: AOAM530uEcYqCceiGG2C8f7OcTZOETxFNucqeM+o+e6dXu7oNb4QGRJi
 RYVjWRK2oau5xUnXoxpZWvzmkQcSzeWyMGz7wRJuEQ==
X-Received: by 2002:a50:9e01:: with SMTP id z1mr1332075ede.44.1612519443895;
 Fri, 05 Feb 2021 02:04:03 -0800 (PST)
MIME-Version: 1.0
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
In-Reply-To: <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 10:03:52 +0000
Message-ID: <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nDfU8g88SvOA

On Fri, 5 Feb 2021 at 07:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Indeed, you found a design issue IMO:
>
> Versal creates the "mr-ps-switch" to be explicitly different from
> the main sysbus memory. TYPE_VIRTIO_MMIO is a SYSBUS device, thus
> can not be created without being plugged on sysbus.
> We want TYPE_VIRTIO_MMIO to be TYPE_USER_CREATABLE so we can create
> it on the command line (like your usage). TYPE_SYSBUS allows such
> automatic plug it on the main bus, but also maps to main memory.

That was never the design intent for the virtio mmio transport.
The idea was that the board creates a bunch of transports
(unconditionally). The user then uses command line options
to create virtio backends (blk, net, etc) which get plugged
into the virtio-bus buses that each transport has.

virtio-mmio is not user-creatable for the same reason that
all devices with MMIO memory regions and IRQ lines are not
user-creatable -- there's no good command line syntax for
the user to wire them up, and we don't want the user to have
to know "on this board address 0x50003000 is a good place to
put a device, and irq 43 is free".

thanks
-- PMM
