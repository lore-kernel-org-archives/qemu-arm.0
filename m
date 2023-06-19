Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2705688ejt;
        Mon, 19 Jun 2023 02:19:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oG38wttFDSApbmZZF4W3ZclJ/LJkc1WzWEfCifK+Kek+99co5sqYGjfpI5tMgVEUHAkjS
X-Received: by 2002:a05:620a:208d:b0:762:41dd:1aa6 with SMTP id e13-20020a05620a208d00b0076241dd1aa6mr5830752qka.34.1687166360740;
        Mon, 19 Jun 2023 02:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687166360; cv=none;
        d=google.com; s=arc-20160816;
        b=fN5l9q1lwIGN9g4ZJjOcCUOGhmrCStYLxfqp1MWSscXy9yBnsorOE7Wp7BY4I/TDRu
         LcHnSDbrVBRB+9uyVu1BDwqchzd8wrTVMVb0fqHLDVjKDYJdYFMJpziP0+S9v5dUwPsb
         xe/zUZ0eLV2YLGVUgOgIRrcofB/hwsf+awI9cS/mZrnITLddBB6zpQUD84shJQ7vz+M0
         irqAsgbjRtzb3X2MSbWURMB004ynu0PrxwHQ5dIREk4jB0lYKChN8IOgf5TpmmGX9tjW
         vCrqoyweHtRNM7/2h6FtyMKFU15U4oPRpydUAapHu9DW6Uh/JM+lo/2SYuWTyevCK/PQ
         M80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VHlHQxlwsOWUk71VYo9wtJBVxxN3mr1x8H8MDl1D0DM=;
        b=YcXIl8N3eV/kmJVGXdJ8k6dzuBuDYGOCaXhEpIAocGBuEK7dNHPo00a1P2YIckKjNI
         kAajsyB6FkW7v7HguEVJ40Sj3LeZEya+Hh0lkUa2Nx0wzcABLZ3hnzR757ZU6Q7tQ+Y6
         YRXwURiA4kAtmT/WifaJJ7QPl9VpgTiSxGj8t3Duw9swkvJyoVIfcftVG0VniQNS2Gfp
         gOwVs6p7gx7sP1xkmuY+zHRV4NbQ9nvoK2gFpBIpXRn1nOv5B2nPdNylLJrd3gedsoJV
         QU5wBKOvxu76H2bBYppXnCjKsjqkDE6leZw5m9Rr4zeBxo3BrTcFykcSV2l6EjQ4PaFb
         xLMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imxgGqvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id da1-20020a05620a360100b00758eb103ec1si12747535qkb.480.2023.06.19.02.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 02:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imxgGqvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBB2c-000393-UC; Mon, 19 Jun 2023 05:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBB2b-00038G-Rm
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:19:17 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBB2a-0001yM-4o
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:19:17 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f866a3d8e4so2042769e87.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687166354; x=1689758354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHlHQxlwsOWUk71VYo9wtJBVxxN3mr1x8H8MDl1D0DM=;
 b=imxgGqvOkOFG1f8RZKnvnY7P+BScuqsUEmqwth94f8GDAiqJ3z74o5NSpnt2nhUhq7
 KUrGWj+7JKQy+jdT0EStxbc8WlXzgfCSei+y7Mo9iEJaaFkk9L7ZXpi9FkCj2ZCPP1uE
 I3H3XMd4lbhxj7hnLtUGFQEjP0XTpDG7MQSujWZseOT+1wFCdgvd+JhbIlr2IWca/OMl
 DX2Syv40GOZogUrcydUec4WZDYWnb6eOsx6dwMaeXM7RDmGrWRes/uuqI9BxKFO9R9PS
 dRzEmzpcYoriXp4lql+Ua4To0AqXtGzu2A6i4ESg6rarv56nFme4jClkj/lmaZ5VzvKA
 YynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166354; x=1689758354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHlHQxlwsOWUk71VYo9wtJBVxxN3mr1x8H8MDl1D0DM=;
 b=ANKTcr+clwPv/JagyMXc4WSAdAwn0IiPGfMQNRkLMUcMge3dLXaAKzvkwDHrJLXCnc
 06OORpXvE6RdnBpm9U4uFe3dbAYJxT2u5aqTqZ9wc7id7lNzXeyCOiBOgGfvDCbQr98P
 /HRgkSSUr7aE42Yt3UyiUtiJ3nQJHAN/5BAfFCGYOAuZjpfZVNfOxnFrBQoqc8456/rE
 gvBA282ZvWdiHIF5D/Io74yaPnQnDeiNQRyhioX0KVitecyhSDAeQ9fcCvDjWP2/JCXj
 oVYW4A0/oFYKIUYrodchaQSqZNGjoFsM6PlLiWEbQvLESYKJ97e+JNSU9qH3tw9b2oPQ
 b6fw==
X-Gm-Message-State: AC+VfDwqnCPaOLHEzw4v3gc44LdVOsvDApT2i1ZmLF8MOKY+NfzfY7rN
 N97UTgRv+S1NsxFSPzThlxdROw==
X-Received: by 2002:ac2:5b0c:0:b0:4f8:666b:9de8 with SMTP id
 v12-20020ac25b0c000000b004f8666b9de8mr2580890lfn.13.1687166354401; 
 Mon, 19 Jun 2023 02:19:14 -0700 (PDT)
Received: from localhost.localdomain (194.red-95-127-33.staticip.rima-tde.net.
 [95.127.33.194]) by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c2b8f00b003f4266965fbsm10101063wmc.5.2023.06.19.02.19.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 02:19:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/2] accel/tcg: Make probe_access() a generic TCG helper
Date: Mon, 19 Jun 2023 11:19:01 +0200
Message-Id: <20230619091901.51607-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619091901.51607-1-philmd@linaro.org>
References: <20230619091901.51607-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: vcZqjtMpyQKT

probe_access() is not ARM specific and can be reused by
other targets.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-runtime.h    |  2 ++
 target/arm/helper.h        |  2 --
 accel/tcg/tcg-runtime.c    | 16 ++++++++++++++++
 target/arm/tcg/op_helper.c | 16 ----------------
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 39e68007f9..a93a5d87a5 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -28,6 +28,8 @@ DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, cptr, env)
 
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
+DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, i64, i32, i32, i32)
+
 #ifndef IN_HELPER_PROTO
 /*
  * Pass calls to memset directly to libc, without a thunk in qemu.
diff --git a/target/arm/helper.h b/target/arm/helper.h
index cee9462c73..4336571d88 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -101,8 +101,6 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
-DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, i64, i32, i32, i32)
-
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 9fa539ad3d..b241a11791 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -152,3 +152,19 @@ void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(env_cpu(env), GETPC());
 }
+
+void HELPER(probe_access)(CPUArchState *env, uint64_t ptr,
+                          uint32_t access_type, uint32_t mmu_idx,
+                          uint32_t size)
+{
+    uint32_t in_page = -((uint32_t)ptr | TARGET_PAGE_SIZE);
+    uintptr_t ra = GETPC();
+
+    if (likely(size <= in_page)) {
+        probe_access(env, ptr, size, access_type, mmu_idx, ra);
+    } else {
+        probe_access(env, ptr, in_page, access_type, mmu_idx, ra);
+        probe_access(env, ptr + in_page, size - in_page,
+                     access_type, mmu_idx, ra);
+    }
+}
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 6cb84bc994..d507a3df16 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1009,22 +1009,6 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
     }
 }
 
-void HELPER(probe_access)(CPUArchState *env, uint64_t ptr,
-                          uint32_t access_type, uint32_t mmu_idx,
-                          uint32_t size)
-{
-    uint32_t in_page = -((uint32_t)ptr | TARGET_PAGE_SIZE);
-    uintptr_t ra = GETPC();
-
-    if (likely(size <= in_page)) {
-        probe_access(env, ptr, size, access_type, mmu_idx, ra);
-    } else {
-        probe_access(env, ptr, in_page, access_type, mmu_idx, ra);
-        probe_access(env, ptr + in_page, size - in_page,
-                     access_type, mmu_idx, ra);
-    }
-}
-
 /*
  * This function corresponds to AArch64.vESBOperation().
  * Note that the AArch32 version is not functionally different.
-- 
2.38.1

