Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2116086ejm;
        Tue, 2 May 2023 04:43:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6KZGD2W46JvlIRYWQ992HNOgcS+KPROgfp2aKhXlfLI9E/YvUAzibsjMep9TPKpS3L+Geu
X-Received: by 2002:a05:6214:300a:b0:5ef:5481:595 with SMTP id ke10-20020a056214300a00b005ef54810595mr4475163qvb.0.1683027817649;
        Tue, 02 May 2023 04:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683027817; cv=none;
        d=google.com; s=arc-20160816;
        b=i0hYxxO2gO/zBh2xXf78tZNhqovvmDlkhsMOeNjeeVQmrJfAATATddW+fuimseDPCJ
         nsnbZ4nW4qgLyot+NK0aRvLPBPkQk/qb5Iq2DqleB76C7qDBdjrM8NOUJTJ/U5i2eYyR
         6F2WQBwv2XAlCZWIhVYr5ZvlnBZuPz0ho24i+vgeGLseH+LYAYq6TgVmQR1A5jLkKAiS
         ElfU4PQNwpj9g6xN3xslXJ3LPVdoFKRRSCpW5gaA1D1bhR5KX3PZfTEYM+0n4IDbYt3o
         qLbDhHe8uBK39oXTGJKQMF2hyXvwv+bXFcM05HuRUkCf1PS9yc3Vrad/m1JFPf+ed8b3
         BBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4aBmh74TWFAPSKGw9M0gRiL7reB7+TWQBABRNo5lGCY=;
        b=xQN6hsk/X3jdkOLcCQ0zlg7TYnnOCckP+3AwDmH0u5P2rBvzuMBhb/vamu7euM2/DS
         dg3qYBOdwjOUeHrXu+N0Z2lD76o3We2fOEZJ9UGWz/d3xcGia7soAhi2VIarJIDyedRl
         v7l+ALJWkJoigNFic9gQKy4ivHSj2dW4zPnjNb1Cc2o9J+aohyUrhy46l+ugzAf/mgAT
         zttS+tpn7Uk7D0HuFOarHZnDJucbVE0alS+wEfx81YqcQJDGe7hX1RVsB+cpidBdDRer
         FzFanMTcBUkhzGftnEs0YI7NvIx7PIRjSXZeKzHACa4rhw+afYaKx7w3afGTnZfJQL3A
         Ms3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mXb3PC8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a056214076100b0056eb06029f7si17183310qvz.421.2023.05.02.04.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 04:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mXb3PC8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptoPX-0007yx-8W; Tue, 02 May 2023 07:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoPW-0007yh-Jl
 for qemu-arm@nongnu.org; Tue, 02 May 2023 07:43:10 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoPU-0007HS-Lv
 for qemu-arm@nongnu.org; Tue, 02 May 2023 07:43:10 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso5105075a12.3
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683027787; x=1685619787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aBmh74TWFAPSKGw9M0gRiL7reB7+TWQBABRNo5lGCY=;
 b=mXb3PC8+dVaIiqJcrtbd4AZcQqFq5uIpFmYmy8vCjvGqmRur2t/7punyCe4iWtU/Pf
 Cmcwi6Y4zP/OvdC9Ln3b1xOufQf0kg+qSvA7uAq1fQEAP8YCySMQrRtPeFLNw9//A414
 lF7MWwx6j2J+b8y/yF7z9bTt+yhHEQ/lEvrDcKS6D1RteQG9NxKWhmNKhcO6BP5lF/Ga
 T8m6gyviXC8l/qHXz4RVPNyr22lreleJhJXyzWXOLCPxz9365U9RGmn18cpY0KsezqoV
 /Nk+9qDDK3QF7j2KPzPr/+M9V9gWfhdmDCOFLGkvPGngddYxNXObkNKMYyNgYeI5guC0
 g42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683027787; x=1685619787;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aBmh74TWFAPSKGw9M0gRiL7reB7+TWQBABRNo5lGCY=;
 b=c85jC8JK05PMHIMBeiT2NMgV1WYgRcL1DsTd+Fmm6/E7IRlfJbUt6bEXqx0gSF+fPR
 6wUgMsniogBMhsZ9BtXWzPmcRAv84cxme73kdgZ3obQKxb2t1Vd6CuJVP9ei40IAge5R
 ZS4zbdmqTYYvXzx7OJ4ToMnuGbB9Oejbod516kD3k7oR3COsvDIsAy4rMHo0rsMvfB8b
 cd1pIP2eW4du4Zliu/BDj6ixS07asPVBCGQRwqHDRZir/LE3tIoEgjK/ucP5BIK3MBcP
 wJOz3tOceuQkmNAzU4YlZOcQ/L7IWhPF5qNQpf/CwshSmMfhU/y0h5jvI1dctbLEQ6+f
 1tow==
X-Gm-Message-State: AC+VfDyA1nzJeIjZjB5+layqmGnFm0a5Wy09p2a2+TVpfU8OJkcodijq
 xQ4rAPmaYGy+h51CXfxyiGZqrjLrLMHdF6P70rdS7Q==
X-Received: by 2002:aa7:cb50:0:b0:50b:d731:9fa8 with SMTP id
 w16-20020aa7cb50000000b0050bd7319fa8mr547723edt.28.1683027786880; Tue, 02 May
 2023 04:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230425103250.56653-1-dani@danielbertalan.dev>
 <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
 <vxR7X7H0IH2rUOb1rvzXmmG3_3raS-2LMKN-ugFoq0ziCSX199bwb_i-zZ5_KdhWzllmtwIlvJF74epNBag-Etjya_nhkplFFNGmi6blpvs=@danielbertalan.dev>
In-Reply-To: <vxR7X7H0IH2rUOb1rvzXmmG3_3raS-2LMKN-ugFoq0ziCSX199bwb_i-zZ5_KdhWzllmtwIlvJF74epNBag-Etjya_nhkplFFNGmi6blpvs=@danielbertalan.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 12:42:55 +0100
Message-ID: <CAFEAcA-_a3Qx9UnsJf++9aM=5X_S22yajkA-p4iaXHWScQrcyA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2835_property: Implement "get command line"
 message
To: Daniel Bertalan <dani@danielbertalan.dev>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: /qypwxyEoM5S

On Tue, 2 May 2023 at 12:10, Daniel Bertalan <dani@danielbertalan.dev> wrote:
>
> Hi Peter,
>
> Thank you for merging the patch.
>
> On Tuesday, May 2nd, 2023 at 12:15, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Are there any particularly interesting bits of guest software
> > that try to read this property ?
>
> We plan to use it in the AArch64 port of SerenityOS temporarily, while
> we are in the process of bringing up device tree support.
> I added it here: <https://github.com/SerenityOS/serenity/pull/18557>
>
> [sidenote]
> By the way, do you know if anyone has managed to run the raspi3b emulation in
> EL1 (under KVM/HVF)?

No, that's not supported. The only board we have that works in
KVM is the 'virt' board. I guess in theory it could be bodged
into working, but AArch64 KVM isn't really intended as "run
an arbitrary guest kernel that uses an arbitrary machine and
set of devices", it's more "run a guest kernel that knows it's
running as a VM" (for instance there is no way to give the
guest something that says it's a Cortex-A53 -- you always get
the CPU type the host has).

-- PMM
