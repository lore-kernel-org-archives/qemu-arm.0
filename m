Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4133133eje;
        Fri, 14 Jul 2023 08:48:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFxqEh0Gwq5GGQ5vJR7TE0oFrB/l9ycRludoYjFqZDG7/UBXnIjZ0+AM0FZ3ExLib3xrAoT
X-Received: by 2002:a05:622a:1706:b0:403:a9cb:dd58 with SMTP id h6-20020a05622a170600b00403a9cbdd58mr6727781qtk.51.1689349693042;
        Fri, 14 Jul 2023 08:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349693; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXkXmlmdzo5us/POogTW7NZ6kE7SpoVSksCkRBLOwKaHfYr9UUSLYAVH2wfLhUJslt
         0qrMjYbGjf4Tp989EyBH26WE/VD0Ts2EzCnIhaFpUWo/1pie8/nO6z/KIiPEeeC9Jj/U
         b/fZXBR+W+KDO2N6GkwdgEdbvm3iipuY6WxOVTApuU67k2pZIuk9fHDN0q4w6fQkE4Im
         trudWDNCdUSAuounK8hBjuahbyLb9rFgvauZ/cQlPlbQRcRPVUbOmxPGsl6+4aPJJ7lI
         77IDdU2cCxnYObnXLN0p9XmhchT7MLfYPTTj9k5BwyKevhmmgUUDQrM6q70S5N3l43cd
         OYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mAzSZlytbR1t1ZIQhjeYZyBJFO870QY6aIUEWQM1ovA=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=zHzJOh2l4uyZsEu8/b/GR00bd1dRtl7ku1qo+uOMncjliDq0kf7gZryr6w0GQM2adz
         yDjEMxmV8hT+UfKxOndga87tYIPCJIPZqwBP4NSwHd0pyUg5cW7fY66qSN9FEmqzrtza
         4PZkl2q5VACvvA65pgbISe34vOWJoLhv67AT3EWFkfyQNWsiFGdfWw94QnnXzZnhWnwz
         HiWcpHVqogPWmLCUx/DIrhK2Rs+cTsfBijXFRwY2/hgYLQOe8ODmbQYSR/mIZaqfDDtC
         Rinqq8IB9BXB6FZJDbFaRYT7tHWplw427XN2DJE6OCDB1YRIHzNa/UmdU8MNp5RoMRKG
         b3ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6KVwi48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020a05622a059200b004014074f313si4691710qtb.191.2023.07.14.08.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6KVwi48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0d-0007Lu-Gd; Fri, 14 Jul 2023 11:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0b-0007IR-He
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0U-00076j-38
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so19497345e9.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349615; x=1691941615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mAzSZlytbR1t1ZIQhjeYZyBJFO870QY6aIUEWQM1ovA=;
 b=M6KVwi48oYkjMrtQqacy5uJpo+d28ELanGOwFj21u9zFlTvEfMsd5D3IgE5m5MpA0Z
 X0QJNgmHGXwdVdirzD1U/6cMETxxfjlHHsDwGysEgxjnNyJlUxsqtsqQWsn+I44GzX7f
 ePDzLuDFlbnTTaEOVaR1xr2O7D6ZhgU4b+VbkwVNonWspZ/Cs3PjfQqlE4NDv/oBAPP/
 zsIm7poPfVPBp7+M9HLdO3xNGKPITJduoNS/PG8rWlvs8t9SdfLWIsBHEGMaJ7Gt7so2
 oDkx4ofPyc756rLrDJ170moM4TV3XXHsJ03/ijfjgi2ehlTDyX15dVknFZz9D7oMKnRH
 7t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349615; x=1691941615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAzSZlytbR1t1ZIQhjeYZyBJFO870QY6aIUEWQM1ovA=;
 b=FKW4A1FzjMSXs/uysimWn8KSmuaURFKNEpYymC+/qZwZKzY+NNYkIXcHdJSY1Dkz76
 LgK2sLJ80n68Zsn4k6M8C5oJyqIckNtlZOXBhJjbSpO9KOMm1tUx+n1PeptVBAArRXYy
 PVGKksGNKY4lh90St6JSImN4Ab5dEpSpfZG4N1JHfn/CmgvhtbIK6inO9Lis5Uwn5ntc
 3wyyu76ztyA3/7cMS9/NE1skIXKAh3K6tpXHIMTbt3NxAa5Pmi6PIYfyAVbDMdzMZHmZ
 fpRq7uJI6xzjnDReIPCsNOn6CZavVD4Coegu+UusWhY7sNiF+NbM0CqX/nVk4kIfchCq
 g1fA==
X-Gm-Message-State: ABy/qLa46P+xp6hCHCUzdJGicgjezezl/0IPA6496YiGjJhULOtpV9/o
 k1B5Ds11ubi5h+7tl2DwRSGekIRKG9FM5JrhBeA=
X-Received: by 2002:a5d:5087:0:b0:314:3f82:7959 with SMTP id
 a7-20020a5d5087000000b003143f827959mr4147858wrt.14.1689349615756; 
 Fri, 14 Jul 2023 08:46:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/14] target/arm/ptw: Drop S1Translate::out_secure
Date: Fri, 14 Jul 2023 16:46:44 +0100
Message-Id: <20230714154648.327466-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: qAyp0hsOgY9E

We only use S1Translate::out_secure in two places, where we are
setting up MemTxAttrs for a page table load. We can use
arm_space_is_secure(ptw->out_space) instead, which guarantees
that we're setting the MemTxAttrs secure and space fields
consistently, and allows us to drop the out_secure field in
S1Translate entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 77b8382ceff..2be6bf302b0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -63,7 +63,6 @@ typedef struct S1Translate {
      * Stage 2 is indicated by in_mmu_idx set to ARMMMUIdx_Stage2{,_S}.
      */
     bool in_s1_is_el0;
-    bool out_secure;
     bool out_rw;
     bool out_be;
     ARMSecuritySpace out_space;
@@ -551,7 +550,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         pte_attrs = s2.cacheattrs.attrs;
         ptw->out_host = NULL;
         ptw->out_rw = false;
-        ptw->out_secure = s2.f.attrs.secure;
         ptw->out_space = s2.f.attrs.space;
     } else {
 #ifdef CONFIG_TCG
@@ -570,7 +568,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
-        ptw->out_secure = full->attrs.secure;
         ptw->out_space = full->attrs.space;
 #else
         g_assert_not_reached();
@@ -628,8 +625,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
     } else {
         /* Page tables are in MMIO. */
         MemTxAttrs attrs = {
-            .secure = ptw->out_secure,
             .space = ptw->out_space,
+            .secure = arm_space_is_secure(ptw->out_space),
         };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
@@ -674,8 +671,8 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
     } else {
         /* Page tables are in MMIO. */
         MemTxAttrs attrs = {
-            .secure = ptw->out_secure,
             .space = ptw->out_space,
+            .secure = arm_space_is_secure(ptw->out_space),
         };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
-- 
2.34.1

