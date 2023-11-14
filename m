Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1942246ejc;
        Tue, 14 Nov 2023 02:35:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuESnMQZR0tkXZ1NU0IB+xjMacPqJrQjENY60IE2tdOhxqh/gYTUeajEwP0QCjOmgA5X4Y
X-Received: by 2002:a05:6359:5e17:b0:16b:f704:15a0 with SMTP id pw23-20020a0563595e1700b0016bf70415a0mr1596694rwb.8.1699958150243;
        Tue, 14 Nov 2023 02:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699958150; cv=none;
        d=google.com; s=arc-20160816;
        b=NrwyoMZHXrZDUVRKmLRFGLim+6MSjhaun0wbKWoRhgNHGo8rU5VeYFrOOo6MgqHHuV
         GNOzCI9fmY5SQ2LF7amN2O/DVWltXKQSWZm9vHA2E0stZoB0Di8ucD0y1lM4gYQm8ZcW
         oD0jqJDp9ucPpSRylMOVtaw4pID4mIfW3rzulmTSiGXY/773+aJwIAdbLX3ne2Fp43bn
         f51BtrAthwXJhs1dzsgI1hHcgamCc9d6CPgeH+umq5lVL607MIdrlvk2qIutkhwBvBCU
         voe/Un3ZkC5Ac+BbVXCu0AVjpz5Z06B0zajmF32cud0rySEZvKRwn8flhVzOr6YgCnEL
         3nCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=yW/4j0it7NGLdhTPZuUYAL56B+3njidh/zMW6jBAoe8=;
        fh=gT18LomMi4CJmwZG/NBzG0ez4299g6cVe7jEzIk4n3Y=;
        b=UTJxsHMOrjl4I6i9LjeEB5mO1PdpH2S+3CoD1BXbFtfijWMIqY6EUqddyqFhBDZDfs
         YGQmPpeiKnSwjnYBnT0UOSZ8AWRFnftkf6j4S0p3EGLFsP+ZNgxhfNXpBgAMF7GHdpOW
         kOD1MjCjCfYjmSV6L5kHX36mOO1oq6aXlLYeuQTaDwTs3GlPy/1+zWBuQ2id0hFTwZOY
         BplDm/wtiHlcAjta2nidNWL3IurHXna97rZKkM83JzyXZ9X9H26jw1heD+qfp8Ux40mu
         do3wFoeVZK+KgEIoTrtTtWV5Msfj/mAo4XCT47PKgwTdetzonQHz0PgitXKU8Ue5uesa
         ZPFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a05622a008c00b0041811c03cc3si6698865qtw.254.2023.11.14.02.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 02:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2qkz-0003nE-Ed; Tue, 14 Nov 2023 05:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r2qkx-0003lk-O3; Tue, 14 Nov 2023 05:34:55 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r2qkw-00015X-9Y; Tue, 14 Nov 2023 05:34:55 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 351EE26110A;
 Tue, 14 Nov 2023 11:34:50 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 7SfRNMwKDuUL; Tue, 14 Nov 2023 11:34:49 +0100 (CET)
Received: from applejack.lan (83.11.210.67.ipv4.supernova.orange.pl
 [83.11.210.67])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8928B260251;
 Tue, 14 Nov 2023 11:34:48 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] target/arm: enable FEAT_RNG on Neoverse-N2
Date: Tue, 14 Nov 2023 11:34:43 +0100
Message-ID: <20231114103443.1652308-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: cFygjn9Dv2Es

I noticed that Neoverse-V1 has FEAT_RNG enabled so let enable it also on
Neoverse-N2.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 target/arm/tcg/cpu64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 08db1dbcc7..fcda99e158 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1018,7 +1018,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     cpu->isar.id_aa64dfr1  = 0;
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
-    cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
+    cpu->isar.id_aa64isar0 = 0x1221111110212120ull; /* with Crypto and FEAT_RNG */
     cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
     cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-- 
2.41.0

