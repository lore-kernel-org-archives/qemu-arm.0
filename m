Received: by 10.25.208.211 with SMTP id h202csp584493lfg;
        Thu, 7 Apr 2016 08:55:20 -0700 (PDT)
X-Received: by 10.25.142.137 with SMTP id q131mr1446580lfd.10.1460044506932;
        Thu, 07 Apr 2016 08:55:06 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lb0-x233.google.com (mail-lb0-x233.google.com. [2a00:1450:4010:c04::233])
        by mx.google.com with ESMTPS id ba10si4476696lbc.84.2016.04.07.08.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Apr 2016 08:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c04::233 as permitted sender) client-ip=2a00:1450:4010:c04::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c04::233 as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lb0-x233.google.com with SMTP id os9so8525518lbb.2
        for <alex.bennee@linaro.org>; Thu, 07 Apr 2016 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v0rCcQDDjsSRyDe1Rc/IdlqxcSxVrWKrC9sl3btWlio=;
        b=XIHfjwzNeTrmIySDZtLRWLB3OLUGJ6yyLnZzXIAkCnofZusLm+IPKTB/gVmIZOtfWK
         BMT4Kp57cH98c/UyQc6vxsUi8ndkaQ55STuNuJkz/IvPbCvBNFAcTIKhpHN0qRT5DLer
         8smyvy1FlLD82AciYcM+/7Kf/RSBz1O5YP8Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v0rCcQDDjsSRyDe1Rc/IdlqxcSxVrWKrC9sl3btWlio=;
        b=F049/drGtTg8NzhrtoLWw+k3z5m/fDg+YayIPSewydV8d1UM7qWHa0z2ywJvd3M716
         vwyjK1UDVpvz9EDiTlMBoTt66gF/yj3yMGUS5DWFK+ww6exk7eYtyl9URYdXjq8njdhs
         TbnavIvEcN9HQ8Bv+isDZkaUx+EypBt8Jpw9ErluHs3LZRQVDzdwfkxGhGsszbBfmBK9
         PuefuvyQmNxOW/h86aVJgf85oQvlRtH88a3J9+rG19o3ZgdbAaassKKnNGCxu5UvAAN0
         QS3XSxaLcW9zMmayI16EmzXVFgkKukZpwTofCJ4lrJmKbFsCRSVSX7Rvg41E3PQaNO1I
         Q8MA==
X-Gm-Message-State: AD7BkJJ51rdYz/DMsFxs/N08NnevEyeW8L9jw85DVrCJzx8Jcd1ECtRnrCUNMG6p7qNgn5YKr2A=
X-Received: by 10.112.137.41 with SMTP id qf9mr1706922lbb.140.1460044506768;
        Thu, 07 Apr 2016 08:55:06 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from localhost.localdomain ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id p195sm1316255lfd.11.2016.04.07.08.55.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 08:55:06 -0700 (PDT)
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
Subject: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
Date: Thu,  7 Apr 2016 18:53:50 +0300
Message-Id: <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: MXOJgdmfV5l9

From: Sergey Fedorov <serge.fdrv@gmail.com>

Ensure direct jump patching in AArch64 is atomic by using
atomic_read()/atomic_set() for code patching.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---
 tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 0ed10a974121..15fdebec921f 100644
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
+    assert(offset == sextract64(offset, 0, 26));
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
