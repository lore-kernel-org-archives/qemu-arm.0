Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78696ejb;
        Wed, 15 Feb 2023 19:10:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+zpc1E7yQR9rauHbo6gwCxx6kKnKLo+p74p9gQRkkllOOavmjaR0tC/VeP1+joJi3L1OV5
X-Received: by 2002:a05:6214:d02:b0:56e:b186:ffa8 with SMTP id 2-20020a0562140d0200b0056eb186ffa8mr8077749qvh.21.1676517020578;
        Wed, 15 Feb 2023 19:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517020; cv=none;
        d=google.com; s=arc-20160816;
        b=EbgtAlwXNESRGwBZxtbyfLEHNVe++yvCiLuaoZBr3jzGQExDvjK4XhabkU+IwBeBlQ
         +nng19+YziOuXxFXUlshC+CXKk4UrmTMKpLXTnfHv/fipvWs3lfkOyLbiJdWeA4QF0uW
         G6MJ1Se+CFD5asj5UWNNJBVgr0iW7b1jia5DrQbl7kLKuNKduPtrlKtp7XuBjqwh+N9B
         EpUZKcXClP3rkhwtVBkcQz51NhK6/umP2e0oD5FW8OfR7TTLLzXb57hgE2AwyoTPi9Zj
         quMkjZWVhvoFLT7mcwAQWNmUTisrmTP3Ttxp6NQwO5/XrTLyCirZIMkBJctnWvpeY10v
         ex5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZZ+a7/CWiRtlGyB2C1ZyMWD3pj2WVtp3sfwQWKYTYqs=;
        b=uJF0m/lPkV9LwdNbUUJ24edYQMdPMoEOjFs/CKpSoxMUcSdUF27MsM40QhYURDpAGI
         qPBvEpBN1kZ9Q7g1cQg0OTJKtLQetby1kxnsKL5rDV+DXv3gQtP0QPItoSrFSrqDPH9Q
         fZBNxSOe82lXGc5U9cR4Ah4QNEPAKX2gWuEJFBml+A32tmaRzGHLLiSL+udtCHTxrURx
         KUhMDh5TtgVZuI84unUk7T/7a5thbLAm9FGQAkGoYzPi4dsRz4RBVM512SiGkLRAoYK/
         ypKlHPnhTImSjJG75XAjqNZMqyXDbRv8Bb8pkWEJe2nxGHiMrlzmINYAvcF2CCac20Hv
         qkeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gt75eBNA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm7-20020a05620a1d4700b0072b8387fb80si385788qkb.302.2023.02.15.19.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gt75eBNA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeI-0007W6-Is; Wed, 15 Feb 2023 22:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeD-0007TX-Na
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:25 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeB-00004w-SI
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:25 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 24so424723pgt.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZ+a7/CWiRtlGyB2C1ZyMWD3pj2WVtp3sfwQWKYTYqs=;
 b=Gt75eBNAM+k2icyWI7VYQr6JMWJ8Qa9iu1+1CSvYuneochRw+vii9jTaGnq2l+1nt8
 bQUqH54ealH5pIskJ/HvKvKuuoTQUxMcIuYgAhgpX0epB5bHXftZ9mmTU83IxaRQAHa1
 TUXiQtmLF2YWKiTkvtgGeC7JZtj/eVqkc/4GJQrXI8XxRixiwab6C0EsoU/FajGewtkw
 JRcirt9ZEm4MiMPthwdiBMIt1TDjZ1Y537pX+IJ5iHOE1SNMbtJlwrHdtQ3kadBz2zvP
 24K4P0q4EoyTjv1f4C8dFfYU8yw3XF7t2CmtwDCBvpQHMG9xzAZyENPQbcvwn+V3HnKg
 Wnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZZ+a7/CWiRtlGyB2C1ZyMWD3pj2WVtp3sfwQWKYTYqs=;
 b=NWJQB9O10wfOAjnk2hI2bGbeEmXUi7nWBHC0XhR1fzzYNgUyHFy1wPHihaV0TlRGIS
 XJ23NIwz3Ob4D6xPF6zmlWBeoNtZarShwtbSgf1RNP22//gPuZbSkINK4J+kaejvIstR
 uNK3f9xHQmzrtbnAg5uinfsNWaVJ/uvTBzxKcayR8xa1Z8Y979u/D3qKw9Cg7WQFkDPg
 sVy96zluwZo/l2H2sTXSo0ehzhCxrn/wo2Mu7dDg786lUOH/X8AvOnLPdoLjiYv6SbJN
 riNA4ET1Biee5TJrt8qvV6u1+/ze8BFMEubnSQ+uCKxMNCncjXssw7qyMsqgaSYNdF4I
 re2Q==
X-Gm-Message-State: AO0yUKVlsip7zXIQtg0AwOJk8c8KgRxNgjcG+uJ195QW6TzI1MNP4FRV
 MAym3IL2tlG5IxdBxpWiAzDSLegvq9ANyXtF7+0=
X-Received: by 2002:aa7:9d09:0:b0:5a8:abd7:a9e8 with SMTP id
 k9-20020aa79d09000000b005a8abd7a9e8mr3817285pfp.27.1676516963037; 
 Wed, 15 Feb 2023 19:09:23 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 17/19] target/arm: Move mte check for store-exclusive
Date: Wed, 15 Feb 2023 17:08:52 -1000
Message-Id: <20230216030854.1212208-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: Dq47ifSSiwrt

Push the mte check behind the exclusive_addr check.
Document the several ways that we are still out of spec
with this implementation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 42 ++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 78103f723d..f9fc8ed215 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2654,17 +2654,47 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
      */
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
-    TCGv_i64 tmp, dirty_addr, clean_addr;
+    TCGv_i64 tmp, clean_addr;
     MemOp memop;
 
-    memop = (size + is_pair) | MO_ALIGN;
-    memop = finalize_memop(s, memop);
-
-    dirty_addr = cpu_reg_sp(s, rn);
-    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, memop);
+    /*
+     * FIXME: We are out of spec here.  We have recorded only the address
+     * from load_exclusive, not the entire range, and we assume that the
+     * size of the access on both sides match.  The architecture allows the
+     * store to be smaller than the load, so long as the stored bytes are
+     * within the range recorded by the load.
+     */
 
+    /* See AArch64.ExclusiveMonitorsPass() and AArch64.IsExclusiveVA(). */
+    clean_addr = clean_data_tbi(s, cpu_reg_sp(s, rn));
     tcg_gen_brcond_i64(TCG_COND_NE, clean_addr, cpu_exclusive_addr, fail_label);
 
+    /*
+     * The write, and any associated faults, only happen if the virtual
+     * and physical addresses pass the exclusive monitor check.  These
+     * faults are exceedingly unlikely, because normally the guest uses
+     * the exact same address register for the load_exclusive, and we
+     * would have recognized these faults there.
+     *
+     * It is possible to trigger an alignment fault pre-LSE2, e.g. with an
+     * unaligned 4-byte write within the range of an aligned 8-byte load.
+     * With LSE2, the store would need to cross a 16-byte boundary when the
+     * load did not, which would mean the store is outside the range
+     * recorded for the monitor, which would have failed a corrected monitor
+     * check above.  For now, we assume no size change and retain the
+     * MO_ALIGN to let tcg know what we checked in the load_exclusive.
+     *
+     * It is possible to trigger an MTE fault, by performing the load with
+     * a virtual address with a valid tag and performing the store with the
+     * same virtual address and a different invalid tag.
+     */
+    memop = size + is_pair;
+    if (memop == MO_128 || !dc_isar_feature(aa64_lse2, s)) {
+        memop |= MO_ALIGN;
+    }
+    memop = finalize_memop(s, memop);
+    gen_mte_check1(s, cpu_reg_sp(s, rn), true, rn != 31, memop);
+
     tmp = tcg_temp_new_i64();
     if (is_pair) {
         if (size == 2) {
-- 
2.34.1

