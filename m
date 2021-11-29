Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4080454lfk;
        Mon, 29 Nov 2021 12:06:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvAwFwS+YEZRoJOSft5dHDj/Gs+b0CHYQk9hODdoCtA9qRX2FW0dSf/k2BoXvGnUdScEyq
X-Received: by 2002:adf:d18f:: with SMTP id v15mr35175181wrc.447.1638216406181;
        Mon, 29 Nov 2021 12:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638216406; cv=none;
        d=google.com; s=arc-20160816;
        b=bUu7KnTubWncYv7ISM2aZEmA2ZkZ2QxZbz1cch1mbSpY+agSUSlcAvlwhZrIFuN0Lm
         FOG+hIgl8SBya8FTU7pek8BWwUxwufTLS4cthkLh2Kw1wdmsM07JHs/cStpJFOxdYzP0
         23g+w/f4DWlN7v126q9Pz9BXfM+dfWng5FBcaJNwYIM6b1kVD2F/BsFjc7X+ITz8kD90
         GcPIBM6quJCMPpgGx2LAsH2dXf1TJczaAjMv8KPH9GgRGtmqOhMscnct/yj9FIayILU4
         p8kfIohKqhkUTeKTrAMEBOylHtSTXORcrkI2sdqsNdN0iCxkBCRfSLm4ayJjiSy+seYT
         1+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UnmMe2XVlfepy+SM6SWY8AYsfzJiHx81z75dkAVJ9Po=;
        b=SC+2h0w7RPotzCz4CXvtw8EO8f9e9BVUglRCSsJgTExKvKM5dX1NwzXD5676SWx6Bi
         Tr1CL+Y9nRpbRVXoLtvNTs0XyH3iCOJmKudyF4vn0662hU2iDMVDL5cgX8JB2pL3S5CA
         /pKIB6B3SPtUts9Zufa7uhOZdqpv9/pNuguhTKXH/2OeywDJtfJgdPJmbrzIcjxK7MTC
         49kV1iFW3N6x3zM+thfGLytR6NpnDkHGTFDjLVCFmq7Mh5e08qdPvQa/Ir4b/lZvOjtX
         R5A559C260OiSXrBoHZK9/HejcdO/f4m1VlKhGHeQ+OyIjMbJ42xVMsX0wKpPi69Od/2
         PVeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hVFWrzAG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si21253086wrm.567.2021.11.29.12.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 12:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hVFWrzAG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrmvF-0004Ne-BU
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 15:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmu1-0003PD-NR
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:30 -0500
Received: from [2a00:1450:4864:20::32f] (port=53049
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008Cd-CX
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o29so15640344wms.2
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 12:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnmMe2XVlfepy+SM6SWY8AYsfzJiHx81z75dkAVJ9Po=;
 b=hVFWrzAG6sPmitcIJZiRpD4zOIr/efmL+IgPmctw3dF6NV+XjHw56FsW/6b+ZmfcbC
 1aqoyiikKJTM9BHIEsUFQcueUepxNeWWwzuQT5WGaiDJNoZL0HYIq/LJaD2Y03e5/k63
 csGbmSZ8q86yYTswSviFjcg9VGDG3VnDU43bB38zdY1Kp0AIWj2mLBwAw+AXSMhaEG4P
 55zzkgxedoJ/AOGgpznc2fdPmYSg2Ww9HDXEfi7lPDsN6LQEdVbJg+wB+EKNRIjoQEO1
 I7VpIWJjzG19s7wrd4GGyJRU0kN6mf/P2msta0jHcYx4kPrs3P1L7uYClYnsbWxjIlq0
 9s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnmMe2XVlfepy+SM6SWY8AYsfzJiHx81z75dkAVJ9Po=;
 b=Jsi1wrFuZDVuh9xBY72hux4jxbY4xeur203pN94UginnPhpLCaU08qHt9JznyyOucy
 8ZuWt2HME9we4smh4gq1rimSEq7uR++JR9VNIVXObARryhZ9HL2HzSGlnFjEDjwibQbW
 w9rITewP+syIaHIZnrK835hV7zVMV24+ZvScAjrCxh80St/lMQxitZ45rZgBUMTNakgO
 rRUTMOBhazkO4Vd8rT6cwNRGYh44xv4lP4ZQZJKVvlAXj9DbrZ4OrOFdRQdIJlrTvtzg
 NG2wuOlCalfoz7jvIDRpiatefbnbeHakXXdzwHe1ZR+n2HWVxxYnKxyAtf9UtE3jmMSc
 /GRw==
X-Gm-Message-State: AOAM5329s8jB6nVaBoI0BjNGmqiBjrrNIQ9G6oRbcUIygcCl3g4uPEGq
 QbCmDzH2B1TvVbABimroV8RvCJx6uhORHQ==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr225953wmd.32.1638216314846;
 Mon, 29 Nov 2021 12:05:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 2/4] target/hexagon/cpu.h: don't include qemu-common.h
Date: Mon, 29 Nov 2021 20:05:08 +0000
Message-Id: <20211129200510.1233037-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JC+UR9vU69YM

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

Move the include to linux-user/hexagon/cpu_loop.c, which needs it for
the declaration of cpu_exec_step_atomic().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/hexagon/cpu.h          | 1 -
 linux-user/hexagon/cpu_loop.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index de121d950f2..58a0d3870bb 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -23,7 +23,6 @@ typedef struct CPUHexagonState CPUHexagonState;
 
 #include "fpu/softfloat-types.h"
 
-#include "qemu-common.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba93..e47f8348d56 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
-- 
2.25.1

