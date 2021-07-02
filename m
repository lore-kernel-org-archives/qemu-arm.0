Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1228451lfi;
        Fri, 2 Jul 2021 03:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaD43PiLjHogN9zHz/K6myDiyRgu2hHbCpNtCDgJfu6ZElqS0mfFbNdUKeRV0hRIipGN/q
X-Received: by 2002:ae9:dfc7:: with SMTP id t190mr4658236qkf.293.1625222938083;
        Fri, 02 Jul 2021 03:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222938; cv=none;
        d=google.com; s=arc-20160816;
        b=DISSfTCyLII1ZJNDcnB/TEgysG5EY/U7NDVfpLJRwbGJEsqBWCC5P3SRZ7Ldu8zQhq
         9RlhmnZplDn+Qrb8gtKtjXYIJUNzjwr9bW18MdnTpMKIOJiFuKAi4nCPj5gkacojtbFo
         phMbQujeXzm7JARQzRi4KhAAxf7x0n920LhM/VrTSa5B/yVsqaANhBmL3jRexK3BPXFB
         WitfWBrwWI2bOpqf3dy9zJDQ783v++bQHgACET2nby/N5a732Cq7wvnfQ4HXgsSQijpM
         uPqjWft3PLtAeL0ZFbm67kplbgXuT3wqWYfqYJoyS89awW/1qRDIS4XcI6r9bJH4tN5H
         rQUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4BANoWgI0RjhipvmntovUAzoJsSWS5FJsfiHUg00m54=;
        b=UGFdgGAcZz/T5/ho4e16ousziA3GgmBO1MUBjkQt+m8M3Uuyl2jv4S5mGrCEz7Xxz6
         rrJTMpHjBINDttyRy2MIFjQT74F1pRMGLrVzbPw/JlVgYfX1ZSGJ08GYCz6EaxzDrytR
         729RrqQk252PKuSNJu4lG0fgOp0zd+5g8pWgIi63fCBiRThkZyXTc88MPO7nr1f5Ms7X
         cztDTBifvGx9dK519p3gAc0NYg0KBy7pNEwYHj9kz8g38mm0Kb0hj/Uymfq4nUqbgauJ
         UicXbBo4jMdzJwo0Z6frRgP4qfWunYsMAZk6qN7Q8mkdRW/WSyqr2KeNN22qV/9i+b19
         vYsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QksazumL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 76si2136876qkj.292.2021.07.02.03.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QksazumL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGjB-0003PW-C3
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb6-0004qp-DI
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb0-0006gq-Gt
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:36 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t15so8528958wry.11
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BANoWgI0RjhipvmntovUAzoJsSWS5FJsfiHUg00m54=;
 b=QksazumLwCZ8AW6hLacg+J8/71Omk45FlLqCWaed+2MOyNiGEJjyf8y9CWbJMwg7hH
 1+p3DKi4OA4LItQ9VEM2iscgFp4/CxBPj5/3y4i8tkCvZRr5pXWKCqc94WDjD9BaYhGB
 MUA8j8yZPrPfIegkWZhcf768G74r2t6FQhDnLxKXSz3RECZJIsZaa7y4o5U2n89F8Y93
 OEk/N301J7qhB6Ida+ZEN6ppYucSbvCllL6ZujZPUwLl6FMA74KKhLsOVAoPxGruQhGu
 xju+xHlejbTeaq8fNadqH1JiD7kW/Xr/llpNJ8/fknRYxnclaFstB3C7YilQP0RA/cIi
 LxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BANoWgI0RjhipvmntovUAzoJsSWS5FJsfiHUg00m54=;
 b=gQssuzdEu4/muG8MXb7fV/unXIunHmgZjGC1WzHJnZVhBizCnVaKL3jboUrDHHPxc7
 aJ+c/HTW7RmvJ4zJYHTFbWQRl5gSaUetpz3RX3rBV4g0XcrboMOVZur8SIEppJ/bSTXo
 mFEfuINM9/fyjRxCOk4pSJaWWU5iOJ/qWxbYQnC3nCPZN72ceNQPw79M4fk9FSkUVOiM
 nxo9LLcl715fS3wElOOPnWmbVk1F2LI+dIwbZruYx4mxdkOQW1rkRWO61lt7XeCTu+Tl
 uSVIBEvUT1M4ZbWrl0Qtje3o36wtGa3m1ZYWTmOpNXLE92zWoHFtxwJrRZOxG3FKhwq7
 KYBw==
X-Gm-Message-State: AOAM530o0ev5/b5aAGLxngLyt0p06ltSbyjE7f97D3iKH/ad5h+lali9
 0jTAho3TYNkBwS0igzEoeC/n/DyWYGhd16dg
X-Received: by 2002:adf:fd42:: with SMTP id h2mr5150186wrs.262.1625222429140; 
 Fri, 02 Jul 2021 03:40:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/11] hw/arm/stellaris: Expand comment about handling of OLED
 chipselect
Date: Fri,  2 Jul 2021 11:40:18 +0100
Message-Id: <20210702104018.19881-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jTMkWyL2LGd

The stellaris board doesn't emulate the handling of the OLED
chipselect line correctly.  Expand the comment describing this,
including a sketch of the theoretical correct way to do it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Given the stellaris board is old and not very useful these days,
I didn't think it worth the effort of actually implementing the
correct behaviour, but I wanted to record what I figured out
from various data sheets while I was looking at PL061 stuff...
---
 hw/arm/stellaris.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8b4dab9b79f..ad48cf26058 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1453,13 +1453,67 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             DeviceState *sddev;
             DeviceState *ssddev;
 
-            /* Some boards have both an OLED controller and SD card connected to
+            /*
+             * Some boards have both an OLED controller and SD card connected to
              * the same SSI port, with the SD card chip select connected to a
              * GPIO pin.  Technically the OLED chip select is connected to the
              * SSI Fss pin.  We do not bother emulating that as both devices
              * should never be selected simultaneously, and our OLED controller
              * ignores stray 0xff commands that occur when deselecting the SD
              * card.
+             *
+             * The h/w wiring is:
+             *  - GPIO pin D0 is wired to the active-low SD card chip select
+             *  - GPIO pin A3 is wired to the active-low OLED chip select
+             *  - The SoC wiring of the PL061 "auxiliary function" for A3 is
+             *    SSI0Fss ("frame signal"), which is an output from the SoC's
+             *    SSI controller. The SSI controller takes SSI0Fss low when it
+             *    transmits a frame, so it can work as a chip-select signal.
+             *  - GPIO A4 is aux-function SSI0Rx, and wired to the SD card Tx
+             *    (the OLED never sends data to the CPU, so no wiring needed)
+             *  - GPIO A5 is aux-function SSI0Tx, and wired to the SD card Rx
+             *    and the OLED display-data-in
+             *  - GPIO A2 is aux-function SSI0Clk, wired to SD card and OLED
+             *    serial-clock input
+             * So a guest that wants to use the OLED can configure the PL061
+             * to make pins A2, A3, A5 aux-function, so they are connected
+             * directly to the SSI controller. When the SSI controller sends
+             * data it asserts SSI0Fss which selects the OLED.
+             * A guest that wants to use the SD card configures A2, A4 and A5
+             * as aux-function, but leaves A3 as a software-controlled GPIO
+             * line. It asserts the SD card chip-select by using the PL061
+             * to control pin D0, and lets the SSI controller handle Clk, Tx
+             * and Rx. (The SSI controller asserts Fss during tx cycles as
+             * usual, but because A3 is not set to aux-function this is not
+             * forwarded to the OLED, and so the OLED stays unselected.)
+             *
+             * The QEMU implementation instead is:
+             *  - GPIO pin D0 is wired to the active-low SD card chip select,
+             *    and also to the OLED chip-select which is implemented
+             *    as *active-high*
+             *  - SSI controller signals go to the devices regardless of
+             *    whether the guest programs A2, A4, A5 as aux-function or not
+             *
+             * The problem with this implementation is if the guest doesn't
+             * care about the SD card and only uses the OLED. In that case it
+             * may choose never to do anything with D0 (leaving it in its
+             * default floating state, which reliably leaves the card disabled
+             * because an SD card has a pullup on CS within the card itself),
+             * and only set up A2, A3, A5. This for us would mean the OLED
+             * never gets the chip-select assert it needs. We work around
+             * this with a manual raise of D0 here (despite board creation
+             * code being the wrong place to raise IRQ lines) to put the OLED
+             * into an initially selected state.
+             *
+             * In theory the right way to model this would be:
+             *  - Implement aux-function support in the PL061, with an
+             *    extra set of AFIN and AFOUT GPIO lines (set up so that
+             *    if a GPIO line is in auxfn mode the main GPIO in and out
+             *    track the AFIN and AFOUT lines)
+             *  - Wire the AFOUT for D0 up to either a line from the
+             *    SSI controller that's pulled low around every transmit,
+             *    or at least to an always-0 line here on the board
+             *  - Make the ssd0323 OLED controller chipselect active-low
              */
             bus = qdev_get_child_bus(dev, "ssi");
 
-- 
2.20.1

