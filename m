Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E7CD342F
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 17:21:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLOsL-0005af-6T; Fri, 08 May 2026 13:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wLOsE-0005ZN-9N
 for qemu-arm@nongnu.org; Fri, 08 May 2026 13:20:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wLOs8-0002JC-AR
 for qemu-arm@nongnu.org; Fri, 08 May 2026 13:20:24 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso25663335e9.0
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778260815; x=1778865615; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=doRaxtPQOBaf8x86DjICGD/hSUnx6ZtzP3EUzx6fgfA=;
 b=w5o7VbOJ8FXpJDV3c7LYtNpY91DmwV8GDq1nvtkvF7Zs9ypEbrcdAuJaCEu9ATnjLn
 1yQG0offhEyr/UKMYFO+H1cBqZsNluQ7mH020C46xDTGwT7BZFsBk3UiMthpps8x8eNN
 4b4FbFFSn5nFUyPczD3AtPaUUsdn3EXi79OGL0sUWJWbLeo7zWkx0WmaS2L7Do4lK/nw
 jozNUjVOGT4fcsBuhMZIOqQ2Z6zAZZRzfuH4xYpgniPudj05hRVEyCeIHmmraBahhaKZ
 uFD8rhI62VASRTQMj9U67tD5uMdP5XG1dPpRj67covFwo25pwsBz+97RUvxdqHwhO0NW
 N8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778260815; x=1778865615;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=doRaxtPQOBaf8x86DjICGD/hSUnx6ZtzP3EUzx6fgfA=;
 b=FatYZ1wRffFr/HoXm5+JHm2hB0ftXnwfyxxBqMv1GAhY6Lv2G9Phw5p0J+1H3SuwLZ
 gRQYrsTVPF2efAuMHmrl8/tbsV0hsQ1wZ9I7QZ4fJDvXpCqAEhMqkGHOyUTHzI0PYvJE
 m4W0/vhDTuaoU+b3mqBCXpl1HKoavyS6eUJTFBNAdsY7+LGmmdr5TqiluOssBtKBwGaA
 D0DLQmrSjwaTYYRsy5FgYe950JDad9kJMhWwcnsLl7RMLKFsqocZq3z4EetEnPmMYucp
 p+vkoqgP4wS/qE3tf48IznEU7dGRxoQdFeCiP3qvWthDQqtH48KJxIJ+wumKbucY4X97
 b4cg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9zq9xtJDoScafdGmX9TcBJOHAk8o+g6z6v9vKv1PiQplUgX6QfIlSuzWmq1b2+DZuWyWz/bYt5CQ==@nongnu.org
X-Gm-Message-State: AOJu0YxBp+rNKL1NgPzThtGfkPl0+eRaZHT4DIayZ/pxWCUA8LI11pvT
 6CmFou1I7kRtbABE8R4alv2amcLEQl0RS1HVfN6mtq7nqyhcNYSExnoVGgpPcbhD4c8=
X-Gm-Gg: AeBDiet8D/TjrlDMXFjyb0yYUqAtyW6Q8drp6YSv6e8Q2p4k9bY/O9Yyd3/xIRk8g4S
 JbzFfJe9nJI1WAJrYO4T/BVKvql8VliKALad7Cr2bdTEA/tMU4ljgijXs3X83HR5QFSiJypvmas
 UsN8TWna5gfm7/CCEGao+j6OXkFzIG01x8tFe4XGHd7gqK60G27GO/2O4yxtbT/Y/+g7Zr18Q8R
 dMipKHvMGdTlPCDb0SiyClAfJ5Nl3pYE/Z28ZdmVMki1TEFqqU3US+DllogKzaklmQ75kb0TnV5
 rwGrSyCkUN64J/9g+zZH6HfmcDwedHtgojJoKAj0W7K8bEi6j+tXITiXBIBEK49o+Sy5tt2cNQf
 v1TG7mg/Qoit/WuPp34lvSI9d4jIQSnxZuELTLxdjKoTZBb45OypJfRLFt1I/njlrhBT8n4DlrZ
 zYLaqZZTyQCpq6GS91SxXPQDVxokA=
X-Received: by 2002:a05:600c:8b08:b0:48a:5501:7995 with SMTP id
 5b1f17b1804b1-48e51f32ca9mr231887985e9.18.1778260815112; 
 Fri, 08 May 2026 10:20:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:e47d:4cf0:1918:bbbd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6dd2c550sm9516965e9.3.2026.05.08.10.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 10:20:14 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 0/3] RFC: Testing exceptions in tests/tcg/aarch64
Date: Fri, 08 May 2026 18:20:11 +0100
Message-Id: <20260508-jmac-gpctest-v1-0-e57e42c87e1e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsb/mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwML3azcxGTd9ILkktTiEt1E87REs8RES4NkcwsloJaCotS0zAqwcdG
 xtbUAwDEzOF4AAAA=
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In order to test the granule protection system meaningfully, we need
to verify that certain memory accesses cause the correct exceptions.
AFAIK, we do have system tests which boot kernels using GPC, but no
finer grained tests for specific GPC behaviour.

So I've added the following example test of GPC. It uses a new vector
table which can replace the one in boot.S with one which will record
and ignore certain types of exception (data aborts and GPC
exceptions).

The test itself (gpc-test.c) is not quite ready for submission yet,
but I would like feedback on the mechanism used for verifying
exceptions. (For example, if we do in fact have an existing way of
testing exceptions.)

Once a mechanism for testing is in place, adding some more features
(for example FEAT_RME_GPC3) should be relatively easy.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Jim MacArthur (3):
      boot.S: Allocate minimal space for granule protection tables
      altvec.S: Alternative vector table for aarch64 testing
      gpc-test.c: Basic test for granule protection check.

 tests/tcg/aarch64/Makefile.softmmu-target |   7 +-
 tests/tcg/aarch64/system/altvec.S         | 129 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/system/boot.S           |  10 +++
 tests/tcg/aarch64/system/gpc-test.c       | 125 +++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+), 1 deletion(-)
---
base-commit: ee7eb612be8f8886d48c1d0c1f1c65e495138f83
change-id: 20260508-jmac-gpctest-a7fa6aa90c78

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


