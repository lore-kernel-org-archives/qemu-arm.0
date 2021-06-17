Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp491539lff;
        Thu, 17 Jun 2021 05:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVC19GBZFZ2Ck1PiIz40Dp5ybWbHsOE5mjQp1uH1R66Mjmr0a2IaUcrrdTtRU9zkbGOU8A
X-Received: by 2002:a67:79d1:: with SMTP id u200mr1683824vsc.19.1623932966697;
        Thu, 17 Jun 2021 05:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932966; cv=none;
        d=google.com; s=arc-20160816;
        b=big4J8i8XTtXFxYbbE4eOQwRk8jIE9PkFdB7mV6LAy6rij16KHxsABf4Qoo7Idm4/D
         Z+NvdCmnsA86lwPRM3Xy3/ksVbskf0AnB2ZoNGDKl+CWyHhjiL1f8W7lFrnP+46Gx0fR
         1/5y2LwW42l+pLfu5NA5165yc0/O1QEYChoilx9oPd4sfcpGsr+QkEkCdsxDFqIMiXuH
         gpQ4ZpSnpWICE2p4WEl2u/ViAz/uwb55+dvfG4zvqODX3Z3rSMnHfeQLHP/hG7TlbFSE
         zUBB8CvNmBQmYZqMAWeScxOWcsINqp9+V0kEv0GsMlNwmFadl1Tm6E9aX+I5F4rm0wQY
         UOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s/xNqlUgmyHAj/9iCxmCasI7tQ3a5dAsoLIRnxSibIM=;
        b=VUY6rMW/YDTlIGR4+gXBLzZzoB1E4PvArRFXAcVX5dHZiu0KWPvHFNcB9Hn3XOgGpG
         iIY3i13zeodea5/9OlVmf/dELHpLdDlT9JeI6TsLPcFaI2kCVBYsNhk3lm/6qDKbQyUo
         p80pDKV5pZsVc5jLmPNZ+nBT6V5TxwVN+nJhXL2mBK/pY86P6YjEWrsqkcF2tJWyxR9M
         Qs9Y7Msmpc63PIjZQwDv/H9j0mVrUWIw+BUfzAUsursH7ZCr3FzCTrJV46BTJjwzPDw4
         7NDAwGTGRUzXMJ9xhhbIppb3yvU1TtLiWyPcVeVTkyQLMdx5p5k0CIGvdUqZkjad2EL7
         XqCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wc6+VBBa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f206si3356169vka.42.2021.06.17.05.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wc6+VBBa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltr9B-0007mI-U3
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwz-0001TR-6c
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqws-0006zb-0v
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so6267586wmq.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/xNqlUgmyHAj/9iCxmCasI7tQ3a5dAsoLIRnxSibIM=;
 b=wc6+VBBaWsiwV0SInVSOX8hZTfC2t14pn0/XdQIK0FdImfp4QosqBNx0lkegxVXel/
 VeE8AFfSIomGVnX5ZJY8BJVwc3SyjNef63l4HE1sao+XLyjxWEZKvBewOEb4fX5tgcxG
 vvN3E++vcWHUS5WU1q21FJsTEsXu2JjKE7jOaEidm0AKKqGmYiBd1vgjkQOR7ntT1kB6
 sFXgRj8BTBDgxPkbQD/J+w77rClsZj9NQnaYCawmO4ptvBrlORb6A7KOk21ZgfWKHDD7
 9mFsMzH7OWsLWccb3HxZsccypJ/JHHRq9ELOuw2aOFULmyc3EKZQKnWeToWOAlDz0hq0
 I78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/xNqlUgmyHAj/9iCxmCasI7tQ3a5dAsoLIRnxSibIM=;
 b=E6KL9dH9SEuAXbMGArXj/Wdlj372R3sKwRdRJOcLXCdkjb4hcGeaxn2AltGyfiAA1u
 S/GSPJynggndFR+yjj7kLgAXrRJvudD7ujPn3hDIF2h4CWG3+y4yhAeO9f/1NSMtw6Ku
 WzDVLxpPWclDA7oaMe6KHdBf0XU8WDsp8JEeTfK4y2L92M/TM7pwG9bgGB40enj9QSop
 ETa5rrnpG5LrCe1oDgE6UjRJnJXrZnm1Dn8HADkJNAgbSsyU5n/1cr3IGViBNyYspT2Z
 bBRAO7gPxjgvPgtvG8ufYMfP7pwkEEzL7LXVyC8m56PK5mnLXGC+VjbnXJPJr8pw/894
 bsDw==
X-Gm-Message-State: AOAM530DKtjkm0ipwRxzW7UyTrnvSlZEnpSnoEw+IuIuRn4BS+aB6+mi
 EJTuyE6x0LVt/BdTwOwAgNwRWQ==
X-Received: by 2002:a05:600c:1ca6:: with SMTP id
 k38mr4874095wms.49.1623932200636; 
 Thu, 17 Jun 2021 05:16:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 13/44] target/arm: Implement MVE VMULH
Date: Thu, 17 Jun 2021 13:15:57 +0100
Message-Id: <20210617121628.20116-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ywd8T+cs+q0A

Implement the MVE VMULH insn, which performs a vector
multiply and returns the high half of the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 707b9cbd546..5c80b185ccc 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -81,3 +81,10 @@ DEF_HELPER_FLAGS_4(mve_vsubw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulhsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index f7d1d303f17..ca4c27209da 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -82,6 +82,9 @@ VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 
+VMULH_S          111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 6bbd15a3d9e..48744f38af1 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -377,3 +377,29 @@ DO_2OP(veor, 8, uint64_t, DO_EOR)
 DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
+
+/*
+ * Because the computation type is at least twice as large as required,
+ * these work for both signed and unsigned source types.
+ */
+static inline uint8_t do_mulh_b(int32_t n, int32_t m)
+{
+    return (n * m) >> 8;
+}
+
+static inline uint16_t do_mulh_h(int32_t n, int32_t m)
+{
+    return (n * m) >> 16;
+}
+
+static inline uint32_t do_mulh_w(int64_t n, int64_t m)
+{
+    return (n * m) >> 32;
+}
+
+DO_2OP(vmulhsb, 1, int8_t, do_mulh_b)
+DO_2OP(vmulhsh, 2, int16_t, do_mulh_h)
+DO_2OP(vmulhsw, 4, int32_t, do_mulh_w)
+DO_2OP(vmulhub, 1, uint8_t, do_mulh_b)
+DO_2OP(vmulhuh, 2, uint16_t, do_mulh_h)
+DO_2OP(vmulhuw, 4, uint32_t, do_mulh_w)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 5d3dee46995..de7d8b6c753 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -347,3 +347,5 @@ DO_LOGIC(VEOR, gen_helper_mve_veor)
 DO_2OP(VADD, vadd)
 DO_2OP(VSUB, vsub)
 DO_2OP(VMUL, vmul)
+DO_2OP(VMULH_S, vmulhs)
+DO_2OP(VMULH_U, vmulhu)
-- 
2.20.1

