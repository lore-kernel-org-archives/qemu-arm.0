Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp366135ejc;
        Wed, 9 Aug 2023 19:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpybYG81jaWba0yWbZLnR7u9AnYpRh0ebfID/TIxavZrk6llIwnuNt/ukZUWS+6ZELHnBH
X-Received: by 2002:a05:620a:3953:b0:765:6542:d9fa with SMTP id qs19-20020a05620a395300b007656542d9famr1033055qkn.11.1691635006780;
        Wed, 09 Aug 2023 19:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691635006; cv=none;
        d=google.com; s=arc-20160816;
        b=iJhtqeONhLeapcMumj1frLTbnnlCkg1KsGAio/RnpxHYste2OnCt+Ae6N4TkpE9LS/
         0bRY3+bcQHaWQW3F4X4Xkk00bKjnikxEJP6Sw2eMXFEZ+TxppxSLEsyVTq3QEBSulYx8
         uAdkQ8qlfcLbB5rQdkgUD/qO5RbYxn9XI8wXBymqpHHAq7G9KoTB4mxk01903ZuNCdYT
         w0kAuPsgtM+fARQ035wHVvyMNRnAoH4RdAKT9tpp/FJFViExjPMOX7URSJ7jZhFYBQtu
         94t76Ze13BOOnkCn/HSLAi7C59ZvZPRi7zC+dSc6sTxuIdEQAVAlC6b+xNZGfh1T6N6W
         30CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DxgqNR4/eVoHsIiiFC5Te9EYL+Uy4Gcd+N/BbwRB+MQ=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=FRayAbFXfK39DTJB5SpOl087MuQh+VF3xX80N1tYLA097B97H6IYpcXaGjnFbfrhn2
         /RrXenHEtcccL0/VknAX4bXzvsm42ZVe9glBPBQVpzceWvfXCAQPliwDRoTXuD61KrJg
         r4Hpv14yAfKX+f8SVCdQq/txoKTDtizP2UL4RSIGqb38S7gKiIHfirO5+52pQ5IQPF0w
         xIcqBjW3sEnfKFXo8+eI/AVo6dAo2TvnmdOG43C/a0hjuqB9ZgEuAEq/Xq6vfqYxmoHZ
         Zz7oSHgEAHzvFZWEghR7c620TWgTRYM8fv7IBE9vRcK4OC7LQoOHbMBG430nsT11pgMZ
         Ngug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f5dJmtSx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a284900b0076c9391690dsi289393qkp.592.2023.08.09.19.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 19:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f5dJmtSx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTvWq-00010L-U2; Wed, 09 Aug 2023 22:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWn-0000x7-3c
 for qemu-devel@nongnu.org; Wed, 09 Aug 2023 22:35:57 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWk-0004yA-TX
 for qemu-devel@nongnu.org; Wed, 09 Aug 2023 22:35:56 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686f0d66652so382587b3a.2
 for <qemu-devel@nongnu.org>; Wed, 09 Aug 2023 19:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691634953; x=1692239753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxgqNR4/eVoHsIiiFC5Te9EYL+Uy4Gcd+N/BbwRB+MQ=;
 b=f5dJmtSxVZskh73aGB1ynAf/qnaTllGhYpUrauK0PYHAXj020th+U2B0UqM7akwREb
 NrQtRV4stAv1H7oaJU5dteu3ruw/OYMoq8VoDq8vMzEHgUrnwUPPmrsT2oCisxJ3f1P7
 UOPiIyCHMTwt65dO6SDb3rRvkOx/7h+V6ndv+ouW1HRQLRVStlJNObnoaEDWU+9c6o9g
 x0Y09fcp1EmDEeYtw1YA1/bPzHhYzDZA2pToNM5mtwSEynVp4I5q+IQRhdicNX7I6L4I
 83hSNCt6jUvm8L4Wj3Xp2w0G9sKhDUq6qiQqoMAKiqPKjWCftnT7i89ra6q208yoD26o
 9B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691634953; x=1692239753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxgqNR4/eVoHsIiiFC5Te9EYL+Uy4Gcd+N/BbwRB+MQ=;
 b=Y+bef9XXcExaRBP/nxWZ7w3lCEbB3q4XCdZERsRH9I3dQ5g8UUrF7fiq0bau0Q+nxA
 12tMvAZP4jEpxZaWf5IJQiZHEQs/TvRomlNAlR10YAHAji/uZkXSm1aNJFVKcJJUKIYI
 /R2iqapSGdnn+zOndNFEIXSFwB0cGj2iMqsb8Ymhjh+vru15474qh1/ZSSHwQ+K74b/z
 WT2Ps//aNn0qHr0GgSsJq+kM4bTBS8UQieRivYcL5sLhXNxYQwU0GUDu5btlfGvQ77Or
 nGIY7wEw76CsSUgL3o+Y18FLuyffEM1vNXH47TQup414WPyb6s64INli5ABGmShcd2eY
 jGbw==
X-Gm-Message-State: AOJu0Yx97Q27SYcwJ9E2SZb2cUSHv+SilADsvE7CvzqE9Jqh82hiP5aL
 HjRT2ybPKGssFEpL0prnOxckJYGCrg3cnqlFtWM=
X-Received: by 2002:a05:6a00:1588:b0:64d:46b2:9a58 with SMTP id
 u8-20020a056a00158800b0064d46b29a58mr1753737pfk.26.1691634953603; 
 Wed, 09 Aug 2023 19:35:53 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa791c7000000b0066ebaeb149dsm287283pfa.88.2023.08.09.19.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 19:35:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/5] target/arm: Support more GM blocksizes
Date: Wed,  9 Aug 2023 19:35:47 -0700
Message-Id: <20230810023548.412310-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810023548.412310-1-richard.henderson@linaro.org>
References: <20230810023548.412310-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: thhjzyEr3BvP

Support all of the easy GM block sizes.
Use direct memory operations, since the pointers are aligned.

While BS=2 (16 bytes, 1 tag) is a legal setting, that requires
an atomic store of one nibble.  This is not difficult, but there
is also no point in supporting it until required.

Note that cortex-a710 sets GM blocksize to match its cacheline
size of 64 bytes.  I expect many implementations will also
match the cacheline, which makes 16 bytes very unlikely.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 61 ++++++++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 3640c6e57f..6faf4e42d5 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -428,6 +428,8 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
     int gm_bs = env_archcpu(env)->gm_blocksize;
     int gm_bs_bytes = 4 << gm_bs;
     void *tag_mem;
+    uint64_t ret;
+    int shift;
 
     ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
 
@@ -443,16 +445,39 @@ uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
 
     /*
      * The ordering of elements within the word corresponds to
-     * a little-endian operation.
+     * a little-endian operation.  Computation of shift comes from
+     *
+     *     index = address<LOG2_TAG_GRANULE+3:LOG2_TAG_GRANULE>
+     *     data<index*4+3:index*4> = tag
+     *
+     * Because of the alignment of ptr above, BS=6 has shift=0.
+     * All memory operations are aligned.
      */
     switch (gm_bs) {
-    case 6:
-        /* 256 bytes -> 16 tags -> 64 result bits */
-        return ldq_le_p(tag_mem);
-    default:
+    case 2:
         /* cpu configured with unsupported gm blocksize. */
         g_assert_not_reached();
+    case 3:
+        /* 32 bytes -> 2 tags -> 8 result bits */
+        ret = *(uint8_t *)tag_mem;
+        break;
+    case 4:
+        /* 64 bytes -> 4 tags -> 16 result bits */
+        ret = cpu_to_le16(*(uint16_t *)tag_mem);
+        break;
+    case 5:
+        /* 128 bytes -> 8 tags -> 32 result bits */
+        ret = cpu_to_le32(*(uint32_t *)tag_mem);
+        break;
+    case 6:
+        /* 256 bytes -> 16 tags -> 64 result bits */
+        return cpu_to_le64(*(uint64_t *)tag_mem);
+    default:
+        /* cpu configured with invalid gm blocksize. */
+        g_assert_not_reached();
     }
+    shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
+    return ret << shift;
 }
 
 void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
@@ -462,6 +487,7 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
     int gm_bs = env_archcpu(env)->gm_blocksize;
     int gm_bs_bytes = 4 << gm_bs;
     void *tag_mem;
+    int shift;
 
     ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
 
@@ -480,14 +506,33 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
 
     /*
      * The ordering of elements within the word corresponds to
-     * a little-endian operation.
+     * a little-endian operation.  See LDGM for comments on shift.
+     * All memory operations are aligned.
      */
+    shift = extract64(ptr, LOG2_TAG_GRANULE, 4) * 4;
+    val >>= shift;
     switch (gm_bs) {
+    case 2:
+        /* cpu configured with unsupported gm blocksize. */
+        g_assert_not_reached();
+    case 3:
+        /* 32 bytes -> 2 tags -> 8 result bits */
+        *(uint8_t *)tag_mem = val;
+        break;
+    case 4:
+        /* 64 bytes -> 4 tags -> 16 result bits */
+        *(uint16_t *)tag_mem = cpu_to_le16(val);
+        break;
+    case 5:
+        /* 128 bytes -> 8 tags -> 32 result bits */
+        *(uint32_t *)tag_mem = cpu_to_le32(val);
+        break;
     case 6:
-        stq_le_p(tag_mem, val);
+        /* 256 bytes -> 16 tags -> 64 result bits */
+        *(uint64_t *)tag_mem = cpu_to_le64(val);
         break;
     default:
-        /* cpu configured with unsupported gm blocksize. */
+        /* cpu configured with invalid gm blocksize. */
         g_assert_not_reached();
     }
 }
-- 
2.34.1

