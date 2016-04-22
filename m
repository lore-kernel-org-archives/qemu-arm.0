Received: by 10.25.208.194 with SMTP id h185csp855023lfg;
        Fri, 22 Apr 2016 09:09:32 -0700 (PDT)
X-Received: by 10.112.131.2 with SMTP id oi2mr9144330lbb.67.1461341358884;
        Fri, 22 Apr 2016 09:09:18 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x22c.google.com (mail-lf0-x22c.google.com. [2a00:1450:4010:c07::22c])
        by mx.google.com with ESMTPS id a16si2463948lfa.109.2016.04.22.09.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Apr 2016 09:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22c as permitted sender) client-ip=2a00:1450:4010:c07::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22c as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x22c.google.com with SMTP id c126so82163175lfb.2
        for <alex.bennee@linaro.org>; Fri, 22 Apr 2016 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=atuWIrMiqXQjHS/6lphWt51rsn7U0StDQ1ZevmCSBNo=;
        b=jorPyBALZiJnX2S318xv2x3TLjtgwdaPvxfZGh1Du3ZvKyWaxnLdQsed+p1IrqVl1X
         rjnnaxTd7/RvmnOr4nJxghnLh65IyWtdAqHmwKsuaU40Uj3iECrHEdRsuPgebPXdenHv
         Ubn6e0cbPklPYDN9X0x2qM65Rz2MBoGYjzdFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=atuWIrMiqXQjHS/6lphWt51rsn7U0StDQ1ZevmCSBNo=;
        b=DOypW4z2rFf55oRR/IViTogNNNVFv95W5EwXFb3FSKdDsynG7dmpd5YjLGm7MUE/72
         6L6EOcz+e4OXo0QMLBf3+mov1ag1KzIsgXJPZrAqIFapWexlH3FwPjIJqPEMh6B8OvQb
         iqgzi8Cr/mJ6ANYgl2q1ULD8C+7gcvsIo9qZeLx6OTFEF2zrToYl7AvIfsZlYYMHbRUK
         ApAK/zNmuOLKcoESEwLihc7Lcw3W3p/wIPDGmCOYqYaoQ7uBfc6Dc0H8EP+R0LjTAmcR
         Nll0vHeO3TI1FHWH3qWcA9FTVxHCDszKAWrQBuRjvoboCa7KqUCulr4YQbx+KltS83Un
         xt6g==
X-Gm-Message-State: AOPr4FWEhEd24KYSZc9mphSvMzdhRQRYGka/+ychae6AZWvTIyMqNQ5t1qDSAht16zOuqCvcjaA=
X-Received: by 10.25.83.199 with SMTP id h190mr4245414lfb.165.1461341358722;
        Fri, 22 Apr 2016 09:09:18 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id hw7sm1645709lbb.40.2016.04.22.09.09.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 09:09:17 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 08/11] tcg/aarch64: Make direct jump patching thread-safe
Date: Fri, 22 Apr 2016 19:08:50 +0300
Message-Id: <1461341333-19646-9-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461341333-19646-1-git-send-email-sergey.fedorov@linaro.org>
References: <1461341333-19646-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: RQzX2O0wHKCW

From: Sergey Fedorov <serge.fdrv@gmail.com>

Ensure direct jump patching in AArch64 is atomic by using
atomic_read()/atomic_set() for code patching.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---

Changes in v2:
 * Use tcg_debug_assert() instead of assert()

 tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 0ed10a974121..29839765b828 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -73,6 +73,18 @@ static inline void reloc_pc26(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
     *code_ptr = deposit32(*code_ptr, 0, 26, offset);
 }
 
+static inline void reloc_pc26_atomic(tcg_insn_unit *code_ptr,
+                                     tcg_insn_unit *target)
+{
+    ptrdiff_t offset = target - code_ptr;
+    tcg_insn_unit insn;
+    tcg_debug_assert(offset == sextract64(offset, 0, 26));
+    /* read instruction, mask away previous PC_REL26 parameter contents,
+       set the proper offset, then write back the instruction. */
+    insn = atomic_read(code_ptr);
+    atomic_set(code_ptr, deposit32(insn, 0, 26, offset));
+}
+
 static inline void reloc_pc19(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
 {
     ptrdiff_t offset = target - code_ptr;
@@ -835,7 +847,7 @@ void aarch64_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
     tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
     tcg_insn_unit *target = (tcg_insn_unit *)addr;
 
-    reloc_pc26(code_ptr, target);
+    reloc_pc26_atomic(code_ptr, target);
     flush_icache_range(jmp_addr, jmp_addr + 4);
 }
 
-- 
2.8.1
