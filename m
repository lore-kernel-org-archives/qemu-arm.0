Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp490584lff;
        Thu, 17 Jun 2021 05:28:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE+2RtdWF1EGziwkeZ3/UaoEGWjvpv9R5IKMCoCb2KV8x4jAm/PLfSdRgPav+ThVFTH7jl
X-Received: by 2002:a67:ef83:: with SMTP id r3mr3983435vsp.14.1623932882576;
        Thu, 17 Jun 2021 05:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932882; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9tEBy7IuLNXdwwO9evtMh9kgIUK2BSMnK89wgcSy2nKNZji035ergUDcjHl11JeH/
         NqoqjIbzVykaapHzqeVkyv92SLtXtRVY6gWlfW27DM4F4ykKK08AqLy9ekvLibq1cnwT
         C4nCvNU1IJBtuYnxTXpdKK+CUS9pqEdlgd3Penn/MNW50mHRRCkccWUA985xX6ca1/NZ
         y3J3BWsDp+aSKjBFL99Y8aXT2uKOINonB3za8sjPIc4CK44tBLl6KCciJ+xWr35RMCmx
         /zt6MkAXPScbIYdXD966KeJF803EZGvtBmj9rQn1Pd/rCy3fYi791wi0YnCuoTSlEVvu
         SWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H5S8VKHcS2e4Odv4CstwPlDuKl+BqWB81rtQ8YHYpuU=;
        b=HDaWWQx+XppbOYXnG2oAY+l1vPFF7k2IHnNLaHtGDeWWtM/hCYJvm63C5A38ll/8LN
         azrJMa1Pq1VNh7zgQHnUj5n4XnNAHmVoUrdz9DsQ/sQTJdQR+qI24IWseQ8P6chLTU79
         c14yjfyQa5OAuUFnXqle1383a4Nqv0P2czwDEIASCLrTXaM6GcrvLFqn90a/qR1VOE+P
         MKvjzXNOIVNX4lqVcH7UZAnWomieqfoDm8g4XKSUjs4tUjQTCHZm1TkS6SDTpevwdzRR
         ZGdl2bkW4DYQUWcryxv2VM2lrF6yDyBTrcfQYSy3JvyUly02mqh9rc7Wt4PFD77dN0Z8
         1hVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4mI8P3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o138si1642011vko.10.2021.06.17.05.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4mI8P3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltr7p-0006CR-Nx
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwr-0001AF-Fr
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwm-0006w9-HS
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so6267394wmq.1
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5S8VKHcS2e4Odv4CstwPlDuKl+BqWB81rtQ8YHYpuU=;
 b=Y4mI8P3cyUBGJEBHftwPv1wG/OQ2UBFuUCbqT/3GelnXAgYlvYvFP4J6RGw/rBZH4P
 Y1XXfoFQ3pPQLEMIJ86VuilX0SJ5KyC7JWhDI1yxz+ZUKPNZkVwUqYJq5OFRT8qAXWBB
 zrGFBJkhxFl2XalcO9pRjhHnIUD6r5HqlxUOdpcuG14U5PRfkC3jITBukP7p9HHz1mxV
 QviQSSvji3oLLN6qI+DSlVpGkYbyF9DV2dFztA0bPS0XMoDTp0RZBfmg3j1VwphE/xt8
 5TrzCHm34dPJ7easwkfnHspXNy4AOT4Cmbt4ethRInahjjH7oZiurCACZh63aUW1iW4n
 oFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5S8VKHcS2e4Odv4CstwPlDuKl+BqWB81rtQ8YHYpuU=;
 b=rPJFQdRhCRADUg4u6QPfp4Vrfk4ynxHOnnPVi5sVTzqJV121MlDoWmOhubKiP+wQT6
 mQ7bFiEQm6ZiTJawh5gv5ZfJrbCd6HmfZwg5fsGhPME+Bmy/XymNaeC8h7uZnFUFRnKP
 O0Me+kt1DhxZK4PHoTYFkUWmhAa87OJt1F2KPK3PMbplA1yUuGU8aXAsQJ8DIb5mXjq8
 jgzS43LxInCIKruDpIA0WB63DqyEnblY14P6LSOdpxJnMO4vwBXb66hFA95+8b6/p01a
 l59XUr2sj6Spl8RxrPYH2LlOhz0Ka/MFlNHstg7qmqLrUBthLPHMFQhjd03YjV+uTKn7
 v1VQ==
X-Gm-Message-State: AOAM531FRqDPOSQA3OszrOs5laJBnXnWs/PBxqTzYDCeRyfPrDiNyv6b
 4rzBFr0B+iQ/Z1PxSxvirWtilLEijDb+3Q==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr4578814wmf.173.1623932195252; 
 Thu, 17 Jun 2021 05:16:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 06/44] target/arm: Implement MVE VMVN (register)
Date: Thu, 17 Jun 2021 13:15:50 +0100
Message-Id: <20210617121628.20116-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mokQdVsIp1Eo

Implement the MVE VMVN(register) operation.  Note that for
predication this operation is byte-by-byte.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 2 ++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 4 ++++
 target/arm/translate-mve.c | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4c89387587d..f1dc52f7a50 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -47,3 +47,5 @@ DEF_HELPER_FLAGS_3(mve_vrev32h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64b, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 16ee511a5cb..ff8afb682fb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -30,6 +30,7 @@
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
+@1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 
 # Vector loads and stores
 
@@ -74,3 +75,5 @@ VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
 VREV16           1111 1111 1 . 11 .. 00 ... 0 0001 01 . 0 ... 0 @1op
 VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
+
+VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e0bb4755748..97da43fa3d6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -292,3 +292,7 @@ DO_1OP(vrev32h, 4, uint32_t, hswap32)
 DO_1OP(vrev64b, 8, uint64_t, bswap64)
 DO_1OP(vrev64h, 8, uint64_t, hswap64)
 DO_1OP(vrev64w, 8, uint64_t, wswap64)
+
+#define DO_NOT(N) (~(N))
+
+DO_1OP(vmvn, 8, uint64_t, DO_NOT)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 32a8324c5e6..bd908abcff7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -232,3 +232,8 @@ static bool trans_VREV64(DisasContext *s, arg_1op *a)
     };
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VMVN(DisasContext *s, arg_1op *a)
+{
+    return do_1op(s, a, gen_helper_mve_vmvn);
+}
-- 
2.20.1

