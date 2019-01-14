Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2537352wrt;
        Sun, 13 Jan 2019 17:23:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4MswVmJF3D0/klDKQa5t7K05P0jQcMg+h0GJG7StYi5SjGnr5FrgqAkeWGUTvAAkmQdzCd
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr9833340wmf.3.1547429004562;
        Sun, 13 Jan 2019 17:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547429004; cv=none;
        d=google.com; s=arc-20160816;
        b=YxflpRK5GmsuexbGi31PPEckjC0n+68KZbLeWi8L8xRP7J2CFqIszh3JrFidT6O5f2
         tqyGqph5iSl4N/kF/pA3iZC8LBQlQxZbeQtoCO6Nxi+N4eWImMsVnKgrUzRyXK0bS41m
         12WniV8N0WQIJdRj4R4JnHDgWZsUfD3AZanP29JkS2R3n7cwEFHyogi/FxjL1W6DZarI
         hNoiZWKBL3RZ2OCtcPS//csKLyt0F0LxjGJvUPY406epiwviEfvXi/PRwcWU7aDKFErX
         UPd2dbxP/4/CaeW9yE5fCt2G5fuhvTJ2r7COaKtZ0QtqxAnrLGfnjyOgEWMX/M2gD6MX
         lZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6RIgZQ3EkiygyRv4b+cnL5vicFb0iiKuZZbxL+UVxSM=;
        b=awhu7Gsoee36nx/FSBAFolnC4qVGfWCA/srEjaVuQTH8b/74X1gHqCDB7r1S5J4maO
         sz1a/hVENjSfp0SzViynzaeY5Dc9LFdQtt+mFG5jo3VTBnS6BsLZCbRof19BMKAuZiSK
         40xNqzBNQAfHPpp/07Bgfl0B7v7nirnQn2k//EFhyvee7kCMSBzwv+gorFSP4VF7Rsaa
         gf5xr9sDdBagblc1odL8wb/kuX2tSksW1KvKmpDBOWTyD+StGsmxiDlkd8BMckRBsHs0
         o1XJZ1L259bVd7ITkO9HsdEu1xnjAjH4Ac6yvSFQ3KLyMHNKon+qVGhbuBLs5S/E2OI0
         L9kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U0blRyQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si17257417wmc.53.2019.01.13.17.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U0blRyQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqyJ-0005tP-K4
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnt-0006GG-Q2
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnr-0001Et-II
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:37 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnr-00019N-8K
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:35 -0500
Received: by mail-pg1-x543.google.com with SMTP id s198so8751217pgs.2
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6RIgZQ3EkiygyRv4b+cnL5vicFb0iiKuZZbxL+UVxSM=;
	b=U0blRyQhnYNnW7z0eO6Vt6oNYTPRtwgvrl4LL/gUWrKmqYhwjO4ky9GkXLBvPqjZIo
	KHV6g1JwHL3JCN03K5+Fx+8CXJ4KaITXJHAgqfrL3HPH1aLvcyijLgepvIk5QcE1eD3X
	fu5lJHedH4il3Q9BQMd9jGQ5GBd//mrhKEmrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6RIgZQ3EkiygyRv4b+cnL5vicFb0iiKuZZbxL+UVxSM=;
	b=L4k7fcBdhA7mPoenZM8n2QxCuOccGpK1v0eGVMrKfX6VT0B8Wff9A4j0x+n55GWZa0
	w5dvm3pFqt1JXaDUoqo5eJcDi3Wt8lf0s+bOvzBfVmbb57XuVCJJoSXmNEc7qNWMnOas
	5hvsHzpuPTtJcgJ8ue5BMVaEMbTBS+qRTkizpfFB54yQD0rC0S5aRa9To2AtBPESem5b
	HMOl82XeOMKefDECk7vM9TVKFnpHZFbJpTQ6g+mMKxvqz8X4FCy+XpQFBz+ang/zJfYw
	51AHreCrTeinFU3cVYT7unFfk4KfZ2Tj9QSKzPl9wSOXPjko/WqvXoCf6cXmre43Oqys
	Owmg==
X-Gm-Message-State: AJcUukfQErd5yMiX7my74pCsy2ZTElcuRpP478GO+K49sPQUp7maC7ZD
	txplxUx93wXlJ59jX0QI27g5fmnRbGmySg==
X-Received: by 2002:a63:9256:: with SMTP id s22mr20519846pgn.224.1547428342219;
	Sun, 13 Jan 2019 17:12:22 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:12:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:21 +1100
Message-Id: <20190114011122.5995-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 16/17] target/arm: Enable MTE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bFIhLA23zcDg

??? It does not yet work for system mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 10 ++++++++++
 target/arm/cpu64.c |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5eff6995ee..aae30207b9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -180,6 +180,16 @@ static void arm_cpu_reset(CPUState *s)
          * make no difference to the user-level emulation.
          */
         env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        /* Enable MTE allocation tags.  */
+        env->cp15.hcr_el2 |= HCR_ATA;
+        env->cp15.scr_el3 |= SCR_ATA;
+        env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+        /* Enable synchronous tag check failures.  */
+        env->cp15.sctlr_el[1] |= 1ull << 38;
+#ifdef TARGET_AARCH64
+        /* Set MTE seed to non-zero value, otherwise RandomTag fails.  */
+        env->cp15.rgsr_el1 = 0x123400;
+#endif
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 64fbe75eca..49fdad69ce 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -374,6 +374,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.17.2

