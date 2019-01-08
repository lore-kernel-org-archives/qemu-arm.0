Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4780137wrt;
        Tue, 8 Jan 2019 08:35:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN67JjYBjRiBzF/+Yjae8GKZz619o1qQxqP7rgO1jWOIX/UnGfUf2/FICK6N91RQoSkLbbSJ
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr1856160wrb.167.1546965321195;
        Tue, 08 Jan 2019 08:35:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546965321; cv=none;
        d=google.com; s=arc-20160816;
        b=xyhUmbHn5Q11pyutFZmlxEqxHnSpoxtB6M23McRBc9nmGWjT6simWWF+uqMNe55Xca
         nGMMGGvihRMkhsX5+djW5orruFoaSl72zAj4pL0Zq9rgGjr76gKrq0e/Dc2r9p1JOvkp
         nvSseLxxBoWTg4RyWETTyrgJp7hY3rRJ0bvagAxEtFbH2vgeaNJlQYR3SQE+sNjtyh27
         cpLyXjwLY3CkPwxI8eNmwBrJh68gl0/W61cG7UwakIH5J9fpAaUc1WhRUQzla/FL2rAm
         x3nLE1mRbNbaTl4wubOjU+ztdr5DIJePKjyCli8gTTBB/4OY7bo/Qufdf8meTMJKsa7r
         GUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=46ldnkoBNzwTQapSHqF1F5MiDCIH8/mF+o2srm542zA=;
        b=GrAuXcrbNKG6AKT/zWTfbCwEukur9BIZ0Lk+xwewWtgs4XtuDLMuyPxMkqV8hIkSeJ
         Kc+uiaAHnT2hv/euHVjMh1kZFrlsnbmYnjyqUzJHNf5QDIDbxzYVNx0qRJJoV4umxXX/
         t8W5RAVsPPICFo8L2S4veBmHSJM6sZaWOHVcBixsfcOwFG1/zwlwUtBmglx/5CvO0du+
         AEMbsitl+HnLacBX+Ra6fox39PpOPnFz3J8SXM5SsX2IdM9xVRgmxu26LxY4dsozxLHG
         DEeGhpTHOHbURDtShs2K8YYjk9Ez32JPIVvBnqdmY2FjTZjbGUH+V46ZxdPxcNQM9BNW
         DFRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WaPUYokY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si37127723wrv.412.2019.01.08.08.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 08:35:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WaPUYokY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gguLX-0005xZ-9i
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 11:35:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGu-0002wA-2M
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 11:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGk-0003xu-64
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 11:30:26 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gguGg-0003lF-Fe
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 11:30:18 -0500
Received: by mail-wm1-x344.google.com with SMTP id y185so8848726wmd.1
	for <qemu-devel@nongnu.org>; Tue, 08 Jan 2019 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=46ldnkoBNzwTQapSHqF1F5MiDCIH8/mF+o2srm542zA=;
	b=WaPUYokY5ErXyR7LdmjSESE3txFpKVAfb+jQ2XV7N7W9M0t5rQM1VHbbGd/DxJFHvy
	c2KlgQw3cYVn9DyvHT7AywpuGKLR5PYDtJM94fqzpk0NjQkrjJJpr5qmU2htXgy+QrRF
	bkSrPYTJhcV5FTnceKH76MBklxcmTejTqEW/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=46ldnkoBNzwTQapSHqF1F5MiDCIH8/mF+o2srm542zA=;
	b=IN4xe1vEVKKwHa9zjzCgaTkI+nv7ib6EK7AMz8mpdIznqk918P7HMUqe33fO3D9bA/
	GaXD7HPHuczpWWix4L32loZxTjuBAP/Z1HDLZCOFUvdsKiTvom1ES2+ko1gQ6s1TKqCE
	Ha8E9RzKnT41LyxJtwBYfQtAdNFX09mGHGD1OQrDKYcfYApKLNZRpNt2vhmqWDumRNaE
	6qLkUfaOz7sAchiD/f+MT+5BstOQnRQDdVOdyAYPh5aVabsVfKC0geCEIJfX1hG9pMZp
	J3SORPWZpGnjKdreBosTy5awkylO8O1NR3oEjO1xmX6jS0VAupqYs2Ek+Si3pDblRlkK
	eMFA==
X-Gm-Message-State: AJcUukfhPQ26yekWuL2Fncnrnrd58akVKmNYzQSGOm5vuNYUukIbc9Sd
	a3mJOEMR39Gtgt1snpf1uI/FJw==
X-Received: by 2002:a1c:1b8d:: with SMTP id b135mr2312163wmb.115.1546965015380;
	Tue, 08 Jan 2019 08:30:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	x81sm11278839wmg.17.2019.01.08.08.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Jan 2019 08:30:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  8 Jan 2019 16:30:07 +0000
Message-Id: <20190108163008.7006-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190108163008.7006-1-peter.maydell@linaro.org>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 3/4] accel/tcg: Add cluster number to TCG TB
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
	"Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwiCfky8NJdY

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
---
 include/exec/exec-all.h   | 4 +++-
 accel/tcg/cpu-exec.c      | 4 ++++
 accel/tcg/translate-all.c | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

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
index 870027d4359..e578a1a3aee 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -336,6 +336,10 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+
+    cf_mask &= ~CF_CLUSTER_MASK;
+    cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
+
     h = tb_hash_func(phys_pc, pc, flags, cf_mask, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 639f0b27287..ba27f5acc8c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1692,6 +1692,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         cflags |= CF_NOCACHE | 1;
     }
 
+    cflags &= ~CF_CLUSTER_MASK;
+    cflags |= cpu->cluster_index << CF_CLUSTER_SHIFT;
+
  buffer_overflow:
     tb = tb_alloc(pc);
     if (unlikely(!tb)) {
-- 
2.19.2

