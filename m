Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2955860wrt;
        Mon, 14 Jan 2019 04:00:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6NghBXrrVgZ8a0JvB/YdGA4uud0RxrVvvQYcr01e7Dqr1NFrdOtHhO1Z2a1nVhC26macFD
X-Received: by 2002:a1c:de57:: with SMTP id v84mr11459263wmg.55.1547467239101;
        Mon, 14 Jan 2019 04:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547467239; cv=none;
        d=google.com; s=arc-20160816;
        b=q0L3P698FNdGrMSLhvgQk2RSJwoyfOgCct+2j4nTficYUhdslOUVRDbq4NsJnvH/Ie
         A0LQRlwlsobnJd7oaalsh3YYzhDm4iNPFEOmmL6ZxmQB4jQQ0OPKgZ4e4BIecF5muj7S
         FHlO5nQ4guC5TOQZHo4bX3vlw9yKxzcWLZtqn+c71GM5pFNJ6m+BBYHL4In18mWCEuVi
         +aFmlUS8FtX0O/6oRsohmsQ1BYwegVrH8M+Kk+12HvvUyolDpm86ek1ddAKoyZrvor+r
         v8Wxn+OQQpyD0L7hhjjrs6fZt7ZnOBCUsj3Nr+cQMBbU6Cdf9Vd721lQhcVGwix2tY4H
         OY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=oqRnIlXxwg2YvWcpXWnxVXBNj6TKwPF8KWOfQK0VbWs=;
        b=x3Qs2RwtLlg/cDV87pBbK/MmLRMRS2L8jVXkxc0JFZ2AkVaozKoqxX+StCqwfwAWmN
         zFtzu4AcwUNAuN6mGFqe19SgYvLGsOeWoCkMuDUiEBhTNi6SKZVTH3c69w5ELCH5ic1k
         gQcrpMeLEJHPNjbTrgJvH+8xr6nG/ymMitaJkzngyjT7D0rRq+KUiu0FZK2MUcel6Kir
         M7lNgOG3bjE1hxsXLQpvleiD4CEBdf+8IuagDGu2E9aHMruDkQZ1h1gFbjD70ytpSS/Y
         xs8g+/t/p2jPWytc9R7IqtE60zqtZ/5z4JxoOKMbtYYQkXMlzmAKCKWzzKLCZgZV91IW
         v3LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WFDQnSPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si11984966wme.142.2019.01.14.04.00.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 04:00:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WFDQnSPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj0v0-0001BZ-1W
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 07:00:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rI-0006YA-Lp
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rH-0005s8-8F
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:56:48 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gj0rG-0005qp-Vx
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 06:56:47 -0500
Received: by mail-wm1-x341.google.com with SMTP id m1so8612063wml.2
	for <qemu-arm@nongnu.org>; Mon, 14 Jan 2019 03:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oqRnIlXxwg2YvWcpXWnxVXBNj6TKwPF8KWOfQK0VbWs=;
	b=WFDQnSPKYzeEbOmwnvYye+A7r2uqk5tjXldKXZFbRYMO2q7u8U4Rx6W/qKcbFR6gyK
	tV2uxgTA4nHVETH2W0hUFfLMAak1oqSJKysy3foVeJkMQv9JiicRE9Tma2vIQae38ENf
	9Hl1qXrFxjH+HfTB44tJFIdH4bS4XI3W9mH3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oqRnIlXxwg2YvWcpXWnxVXBNj6TKwPF8KWOfQK0VbWs=;
	b=ssQWxSVirlmucUijsEvzHH/8nuZZsfh7EVWl5dkgELHFreIPe5DBJmgzpztYJ0ighh
	B4fBXFHPuP0h4ScZ3yVUzcvEauzGxg8bKglmUI63OakP1mWTMX+1m8mWiu1do7TJaLcA
	NUMTILcYJB9BlQziMfePT/tj4yZDGL+jr52CpQpTrM8nmqdWqOFXJRzGnyzTQHjVTel2
	Uy+xMccf40blF8g53x236jnJdGnyIntGz6L0Hmtgex+5hdu9TBnxW8j7wyHBKlkTRfoX
	2s+BzeoYI8iZ1ILecX92byIzbThco2FsN1Np4Lz4uxcHEImZk09Tbt9T9AHTTrHvW8xv
	g1pA==
X-Gm-Message-State: AJcUukcsqxx89SCGPW6YmxGrcSEeHEYUc72qGEKX2OMTE6jAKyP47pve
	miLpNuzMkaxrrrQ0vx50d38vGEgEEzY/6g==
X-Received: by 2002:a1c:570d:: with SMTP id l13mr11869347wmb.139.1547467004848;
	Mon, 14 Jan 2019 03:56:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	125sm47835842wmm.26.2019.01.14.03.56.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jan 2019 03:56:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 11:56:36 +0000
Message-Id: <20190114115637.6335-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114115637.6335-1-peter.maydell@linaro.org>
References: <20190114115637.6335-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH v2 3/4] accel/tcg: Add cluster number to TCG TB
 hash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7uZMw3c5ydi1

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
2.20.1

