Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6177119wrt;
        Mon, 21 Jan 2019 07:24:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN757uu5KEuKHe0m1YYGaNDzLScHQxZa0+TR+EY2U4UMjbSbEU/dGbqN9GLkkMl+k4QFG3uS
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr27214204wrv.87.1548084278852;
        Mon, 21 Jan 2019 07:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548084278; cv=none;
        d=google.com; s=arc-20160816;
        b=KNw1XXRix4zXrMeTYyTWRRVcfwF97b60Fk3g03SjnmG5RlVTEKApsqCJnBUbYJNCwh
         HNJsSDzVhG3kk5hiZyNS1Tk2YJGTb9nETRSFjKlVFi35P8Rkuh9OwvlRwDi851iwjixq
         UQ3wtUhnS7ZrLwdQalha5x2CVpMDKMZpT5x61ySwUBrKNG6XvCPSCjHHUoq5aOECDniW
         +26cFPFWtnpngkFoDoUoValsB6RgnUsrNR5PnQ738cwoB/VblM3sFYEzZFDrP9EeBdW5
         qK6pZe5mZz69Qo/tiuC7/DNpQEbV6FXbxCVZX+Hrg4oO+Th4OtV7m0H/pTaDORV1MsCY
         j5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=dhk3Zq9opGnAhyvLiJeHk55/147P47tsFD5cqMO13d8=;
        b=WUyWAOUcSrTd4oAwDnf/Y5EYIAYQd1PprWmIKEaIAT4UyVVu2Tc/tdjW8MIpmg4k+1
         8LIV091PlTYkX98VBGPnyt7nDMu70S+MQ+ReWF7/zygdK9ON0Jpug8RqD/37/E12KZVj
         TWBKhSKFsBleJthd5lDvRn5sUmT24+lfwgdOrz3XrwvSN61BMXOAd0CQkRl6nf+QNq81
         uHQ/O/M292h9Rw28wyQTQN13LbyLR4pcESZnQ6KGxPCBHa468z/7tIMvP/OEFJDIKvpO
         qWWvnw2TDLDI+gGuCZJRw0HDo1TrL2QkmEPtMFUsnF5SU/Q5VceI1qyY5lZW9xRNxwtV
         0x/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K7+FLLDP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si64392533wri.283.2019.01.21.07.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 07:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K7+FLLDP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glbRF-0000dm-T4
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 10:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPK-00080I-UZ
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPH-0003uh-1P
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:37 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:32768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glbPD-0003rd-QN
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 10:22:33 -0500
Received: by mail-wm1-x343.google.com with SMTP id r24so6401484wmh.0
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 07:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dhk3Zq9opGnAhyvLiJeHk55/147P47tsFD5cqMO13d8=;
	b=K7+FLLDPLAxC0VDE6tMo41Aa3M6C0B7zOo4ffLGlZcFAYtf1qdX+KU3HcB9IBFU0iy
	+tibzap5rv1Sqh0DxlF3+uJNlyoTYHIpEgO3BO/tpMFScVrIAwNdfLzImUXk/gFT6Y/s
	aOt1CquEURvucu3thODoLJieoCuXM+813skGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dhk3Zq9opGnAhyvLiJeHk55/147P47tsFD5cqMO13d8=;
	b=HkbEDMFD0u+fLmD4WuwrrpsDYzCVHjkj8wacNv0JGiZeLP8exS2V44oBkmhvNDv7Jk
	Ypc9rxTQLCSVTuC3ivBcQILHvb8WU16bOzfEqdvp9RGbOUhRYMxnMdFLCh3VSNvyxt23
	O4lGDm6321Ix8GmWcXG0UR51yk+Z+b2YamHhYW3iyx/PwnL49rhec/Ye8zBOxoD1b0RW
	owXBkOxtudd2OBOpqPmlN7MbZo9o7Fa5oGTxY9ib827i45vsEmP+hmBTtkAq08uSCvXf
	IBQEH31KcWhxG/U2TzSV3mNUd7D55LHjOGziALvo6sCxmwpNBYRSuucHNeIwSXYH56da
	V7cQ==
X-Gm-Message-State: AJcUukd++pMkCF056SlOPvtU/XzQY1i4eHLXo+DmqMLiweiyHQ70osFc
	SS0Sk6guinfMk+NfNpt61vGbHw==
X-Received: by 2002:a1c:bdc5:: with SMTP id n188mr26632670wmf.69.1548084146172;
	Mon, 21 Jan 2019 07:22:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	o16sm128900134wrn.11.2019.01.21.07.22.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 07:22:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 15:22:17 +0000
Message-Id: <20190121152218.9592-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121152218.9592-1-peter.maydell@linaro.org>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v3 3/4] accel/tcg: Add cluster number to TCG TB
 hash
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1CBTrVgJu1wG

Include the cluster number in the hash we use to look
up TBs. This is important because a TB that is valid
for one cluster at a given physical address and set
of CPU flags is not necessarily valid for another:
the two clusters may have different views of physical
memory, or may have different CPU features (eg FPU
present or absent).

We put the cluster number in the high 8 bits of the
TB cflags. This gives us up to 256 clusters, which should
be enough for anybody. If we ever need more, or need
more bits in cflags for other purposes, we could make
tb_hash_func() take more data (and expand qemu_xxhash7()
to qemu_xxhash8()).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: move the setting of the cluster index in
cf_mask in tb_htable_lookup() up to before we
set desc.cf_mask from it...
---
 include/exec/exec-all.h   | 4 +++-
 accel/tcg/cpu-exec.c      | 3 +++
 accel/tcg/translate-all.c | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 815e5b1e838..aa7b81aaf01 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -351,9 +351,11 @@ struct TranslationBlock {
 #define CF_USE_ICOUNT  0x00020000
 #define CF_INVALID     0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL    0x00080000 /* Generate code for a parallel context */
+#define CF_CLUSTER_MASK 0xff000000 /* Top 8 bits are cluster ID */
+#define CF_CLUSTER_SHIFT 24
 /* cflags' mask for hashing/comparison */
 #define CF_HASH_MASK   \
-    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL)
+    (CF_COUNT_MASK | CF_LAST_IO | CF_USE_ICOUNT | CF_PARALLEL | CF_CLUSTER_MASK)
 
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 870027d4359..6c4a33262f5 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -325,6 +325,9 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     struct tb_desc desc;
     uint32_t h;
 
+    cf_mask &= ~CF_CLUSTER_MASK;
+    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
+
     desc.env = (CPUArchState *)cpu->env_ptr;
     desc.cs_base = cs_base;
     desc.flags = flags;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 8cb8c8870e6..7364e8a071f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1688,6 +1688,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         cflags |= CF_NOCACHE | 1;
     }
 
+    cflags &= ~CF_CLUSTER_MASK;
+    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
+
  buffer_overflow:
     tb = tb_alloc(pc);
     if (unlikely(!tb)) {
-- 
2.20.1

