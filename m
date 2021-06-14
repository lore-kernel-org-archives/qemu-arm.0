Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2072884lff;
        Mon, 14 Jun 2021 08:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTikDenkZVlCuxoIHp41Bdq7H4tfZaWRYWcp6cZ8e9Y+Ba/HFRqQAEGkbLoa1VooDDUdfy
X-Received: by 2002:a1f:255:: with SMTP id 82mr16930169vkc.17.1623684470996;
        Mon, 14 Jun 2021 08:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684470; cv=none;
        d=google.com; s=arc-20160816;
        b=kb4zOESFYw6BPL7Y8Ryo9zY1b1NpmpTeW2F24Fr3jknw1SFBOiNbvG2zpzn/S4RHrz
         CC74zEPDEE34a6TDxQZH7GzGUCISBI8JZ6FOYcOQOixIJ1d6jX2d0okfOuV1BnwRDkxV
         p8lrKFLZ8ArlqBpxJt0WDXmaBn6w+00HlMdYnMiyJ/t/zE5ftjI9JW68jEaKMXjPk0Hr
         GVSDC6G86g46v5eVCcFXFpdTY9mEZm+Ms5uiPxTtmHHKhL+YZ4eIvWJvUgxKE57b2P74
         mMGtTi17VZRmC8DPv71O3pCneBBCIAgEr5iD0vrwMBYdrHujCz4P3jYAsovd6QRdpBTo
         Fxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vM5UtWzh3NSrqJBAJ/UTGcwe0IT71up7Culg3+JDJHc=;
        b=n+B9YYTjplML4tts42nUUPu9Gd9oEAMAERFlBuJFlTltSxobwXGAR/qi2p3RzKbDfc
         ZKocTu9ISXs+QRB9jv3MY645BeEQABgTvKHOWVXv4nBYjYakozahkT4U88MyEVPU1Hcb
         wkWyFoWRU2mHKdZDGFUmXdU7kutjJS2LcKdrSPVkNbg/w0e/1A7SXWth1Cz3iiqG02ZM
         5Tn1TIudY9eHUluC67/hdHknSUwaKeN5RKZekF7pLUikiczhm3Hj9qqxoNW8StlfhvxL
         pqUh0OPRvoZ44ojF3Bpe77MUFlnfNnaA6jexLXzENdEW1tP0CPBPkeyv5ZO/aZRd+JnW
         6Z/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=StucP7UI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si6423576uak.214.2021.06.14.08.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=StucP7UI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoVC-0005JN-7U
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEl-0001Y1-9n
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEV-0000Ql-Th
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id c5so14923153wrq.9
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vM5UtWzh3NSrqJBAJ/UTGcwe0IT71up7Culg3+JDJHc=;
 b=StucP7UItpP3/q4gcUqHIkEt2oTojzj1LJm6bC3pJGFvNWjj0vgmRGSE4zskPrKjjB
 KIlyhNgq57gssQdO6B4nxuD88JQraUuoX2qm/p1f1rM4opoIeTpkxTztivtxuzleGWef
 grv3ACnZ2NWBk6tf/QeuE65RN+peX1wN2Ss1ceDqGhuOV7QbSTnKuoFTkfuQnaeCrhHr
 FtU1hwgBHAaqQeRUfykDiVAHD0zxjeURAisVpgazbwh6BQGaLBwaRZmg+zo9eLh7pweu
 wGT8/unIo630vi0X/IHnbgLqY7Fg2YWpjpMbv/R+YxJ41CDx0xKpqaFxS75tnSQC7aCu
 YUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vM5UtWzh3NSrqJBAJ/UTGcwe0IT71up7Culg3+JDJHc=;
 b=ff1I51aWtFT5HKhYfyI9hRRoFYuwofYByR1J73Cx0F0lrsLGqYFACPfkeRbb9fZlJG
 evpid6RSnvUm8n2U1VNTkOcY8rBnxS7Pn9X42i5KMQ99Qno/GdBHnZ6KyL6xTngjJvbq
 3D4zzv8G2HmcqWaeNaMtxXpJLBvyOwMZz/QgIkx+aKctTjwo6+mpxDLcvUAoWsgfJr3u
 5Ng1NsBSNzjl0s1M6o9rUkGg/gEwK+kpzz+F3yMId6YPtlWvrfccKGvVcqchS/YIHScA
 glIpWa/L3a9QGC1lhqVJ7qozjSMnh8c7sBAfJWabbIJf9aAzswxqqT3afwZK75eg2030
 FkFw==
X-Gm-Message-State: AOAM531BY+fLQbXs0LqJ+nEOWYPjsvaRfF2Y3yAQj5UT/G4sU2GdxPUA
 8rZEUMLr8g1yjQDw9SoUFoPg0pHnEK5NIA==
X-Received: by 2002:a5d:47a6:: with SMTP id 6mr19233089wrb.203.1623683434515; 
 Mon, 14 Jun 2021 08:10:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 29/57] target/arm: Implement MVE VHADD, VHSUB
Date: Mon, 14 Jun 2021 16:09:39 +0100
Message-Id: <20210614151007.4545-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cX60nHXm1e/7

Implement MVE VHADD and VHSUB insns, which perform an addition
or subtraction and then halve the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5cd4e7d736d..02bef53ed41 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -116,3 +116,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 087d3db2a31..241d1c44c19 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -96,6 +96,11 @@ VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 
+VHADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 85122c00664..53d13e7dcf5 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -444,3 +444,28 @@ DO_2OP_U(vminu, DO_MIN)
 
 DO_2OP_S(vabds, DO_ABD)
 DO_2OP_U(vabdu, DO_ABD)
+
+static inline uint32_t do_vhadd_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n + m) >> 1;
+}
+
+static inline int32_t do_vhadd_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n + m) >> 1;
+}
+
+static inline uint32_t do_vhsub_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n - m) >> 1;
+}
+
+static inline int32_t do_vhsub_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n - m) >> 1;
+}
+
+DO_2OP_S(vhadds, do_vhadd_s)
+DO_2OP_U(vhaddu, do_vhadd_u)
+DO_2OP_S(vhsubs, do_vhsub_s)
+DO_2OP_U(vhsubu, do_vhsub_u)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ffed902625f..b8206dc77cd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -357,3 +357,7 @@ DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
+DO_2OP(VHADD_S, vhadds)
+DO_2OP(VHADD_U, vhaddu)
+DO_2OP(VHSUB_S, vhsubs)
+DO_2OP(VHSUB_U, vhsubu)
-- 
2.20.1

