Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1545276ejb;
        Fri, 2 Jun 2023 19:37:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63srTBU4UrUAZemt5NJS9eeNqPqTpchW5iUbmKkhwzNmmpizeekK6/MltZ4F2TmmKMlw/w
X-Received: by 2002:a05:620a:22f7:b0:75b:23a0:de98 with SMTP id p23-20020a05620a22f700b0075b23a0de98mr13741363qki.22.1685759875859;
        Fri, 02 Jun 2023 19:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759875; cv=none;
        d=google.com; s=arc-20160816;
        b=FcG9zqICpuqjuClfAzyxzMqzzsCM7FmKWGyc4ZT5WMyrqBFkTB8zMnMPRy9qo5KgkU
         Qv4XDQS280XCaev5LXnwXB+A/lTdTNpPCGBoogoAwAuiPT0s6gXI4+8jJ+i9sgwUrePN
         fnakUvl3jQ6AttWX0cv+KuajiiPziywUNeKh1HMwu0izOYqTZXAFeqy1lEbka2mXn0gY
         zPS/IEK5Jg4oDz/Sw3iZzjqrzznNsjGcmTW0GIgJO5BDaBeAnl3F7urDTCfhRji0Egip
         SkKewvPKdAAzDY/p/T1Gutb12u+mlAbzGEc2vt4ITJJbmzdSug8CSjh+Dc2z84w2UKTF
         KMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QGMX7Kmh8esce5VLR2nbZ8lMlpbn5/iajAqYWdVT+94=;
        b=xHK+m0FCZyNMZoxo5eeA260XOjHwlqi8/7ljZeHcoOnICjGzrg8j6Hl3OPPsDOGwkz
         pTWTdZcOyuQU3Jp9BldeKzDofiK+xPLaku0ECnrq/vn5oIMUiMh8KVN24AJiXz/o6SSr
         RnreUktcKlTM508Qbh82RX3zj8ecTtrvYfameVux5e74Z2HMOXBySdMH3Xncm00u85dC
         9V8vibRDx3GeJTHIDhX+GhfCw9rvvyTr/QvLJhS5BCENHNX7AOkeCHBNi+LQJprbxqmE
         LNpqN5Xjh1/n81HdnGShMjA8wydLRs21WFJ9X4B9o+hch0kDCCIyPT1FMs98cIMXXP9s
         vM5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEgbogGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020a05620a124d00b0075c9cb484edsi1587383qkl.628.2023.06.02.19.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEgbogGy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7h-00030z-Su; Fri, 02 Jun 2023 22:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6v-0000p2-N8
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:24 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6X-0004wl-Tw
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:35:21 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-75b08ceddd1so328864185a.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759697; x=1688351697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGMX7Kmh8esce5VLR2nbZ8lMlpbn5/iajAqYWdVT+94=;
 b=VEgbogGyphWwR5fRNqSKXpk3Y7XLQ6U5LzHpBL1tIAM2pk/QCVdHy66gevHb0EtcA7
 Wp1kYJr6xOHPKSFhAYg8ZZnWUhCR4qqh2C/EZniyNQI9trGJ5Luxarr3+wxAODz7rO1t
 0YtWfWnPGOLoibk+wj9koxMOvxcdjUH12aOPboP9nYTu5I9fwNDCbXqCAVM7u/i2zBN7
 kKcj5yiF/G2WWpLo3KvWxEVp4AP2RDMkIRb6vdyu/P/PPhuZBJwv95JKsRv5g7jZKJjn
 HBcMMjWK2WWWDEk6l7Kcn4A4a4toAzPldH5sC+X+WNTu24kcfckSUTQkyMt9Avuq6uza
 izog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759697; x=1688351697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGMX7Kmh8esce5VLR2nbZ8lMlpbn5/iajAqYWdVT+94=;
 b=fkHUj10YnlKTN8gzVn8ZqJdEFXM0b3lwXgcVKrX3xoUmIQMxGiOOIfpkXMaOdsnJPv
 H8+6zDbJCrnxhNv5V9kK5LfobQzonLDBDJJURhlKaFUf1Hy0jbkFsTILymaMhBc4SQ1i
 lnwDl5dFm8dXjSsfzpRTyOjtEX0UqPgrPeNw6Wv9MTQY8Edtgw9g/w8w0J90AGc5wXZQ
 7ALNkmAzeVzZmzUGVWzckeh78cc7wFr4vzYyAkaN/h62PjOrP5m9l83Lm/RnsCcSc/ZJ
 UzAG93fFh3drqBGs3Pp3UUgXxtAfoXh+RVbYgbrhMbqdJK64hx7Hj8le6fAoHemNqLIu
 MhDg==
X-Gm-Message-State: AC+VfDxlxAcEkpSqGwjIZcJWAVBm5BwHvnsCipPLouRbs+zf92ckLfLu
 M7KswFXjKFds+79TAROtI8BF+g==
X-Received: by 2002:a05:620a:3956:b0:75b:23a0:decf with SMTP id
 qs22-20020a05620a395600b0075b23a0decfmr17215772qkn.77.1685759696862; 
 Fri, 02 Jun 2023 19:34:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 32/35] crypto: Remove AES_shifts, AES_ishifts
Date: Fri,  2 Jun 2023 19:34:23 -0700
Message-Id: <20230603023426.1064431-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4Z88gr2SAR+4

These arrays are no longer used, replaced by AES_SH_*, AES_ISH_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h |  4 ----
 crypto/aes.c         | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 24b073d569..aa8b54065d 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -30,10 +30,6 @@ void AES_decrypt(const unsigned char *in, unsigned char *out,
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
 
-/* AES ShiftRows and InvShiftRows */
-extern const uint8_t AES_shifts[16];
-extern const uint8_t AES_ishifts[16];
-
 /* AES MixColumns, for use with rot32. */
 extern const uint32_t AES_mc_rot[256];
 
diff --git a/crypto/aes.c b/crypto/aes.c
index c0e4bc5580..4438d4dcdc 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -131,13 +131,6 @@ enum {
     AES_SH_F = 0xb,
 };
 
-const uint8_t AES_shifts[16] = {
-    AES_SH_0, AES_SH_1, AES_SH_2, AES_SH_3,
-    AES_SH_4, AES_SH_5, AES_SH_6, AES_SH_7,
-    AES_SH_8, AES_SH_9, AES_SH_A, AES_SH_B,
-    AES_SH_C, AES_SH_D, AES_SH_E, AES_SH_F,
-};
-
 /* AES InvShiftRows, for complete unrolling. */
 enum {
     AES_ISH_0 = 0x0,
@@ -158,13 +151,6 @@ enum {
     AES_ISH_F = 0x3,
 };
 
-const uint8_t AES_ishifts[16] = {
-    AES_ISH_0, AES_ISH_1, AES_ISH_2, AES_ISH_3,
-    AES_ISH_4, AES_ISH_5, AES_ISH_6, AES_ISH_7,
-    AES_ISH_8, AES_ISH_9, AES_ISH_A, AES_ISH_B,
-    AES_ISH_C, AES_ISH_D, AES_ISH_E, AES_ISH_F,
-};
-
 /*
  * MixColumns lookup table, for use with rot32.
  * From Arm ARM pseudocode.
-- 
2.34.1

