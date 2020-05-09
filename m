Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026481lfb;
        Sat, 9 May 2020 06:09:33 -0700 (PDT)
X-Received: by 2002:a1c:f418:: with SMTP id z24mr21239188wma.122.1589029772961;
        Sat, 09 May 2020 06:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029772; cv=none;
        d=google.com; s=arc-20160816;
        b=IDqT8F3R3JcSEreCkwuAHDs5xg8mEdkChY4Yv0f8WYBEfjXiuvNLBeO1TKcAbNEs0Q
         IinvWyj3CclwxDDWX35iDrg4QNJaKTxn+60s/PojPayv6lwH5vltoTr4BYKGspEJrbfB
         z4Wk0QhFcyxgD33J4uJOCClRxZ3NDxfzNj8zW2U+NO4Uzbhg35gDq+sZwo/9ZP4V5OIH
         eIpqZtbApUtZ+3LgJ1XdcmbiHhIm/Vo/+Cc515fziN/cuL4GdMLPBunSWCL6lPhX0VX7
         FJUu1b220ffjlt5ntmrQgYGlQq5wJXWmX2sJhJIGeZx2qcDbK6T+qXaSiZU+XtbspbZI
         I3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+DgGlmxYDgp0TKp/P6BFoo5PGVwzBhcu5AKwXK50jX8=;
        b=z9ZsB714G0OzExl1LnOfqBUCScvApZuJ3amJppdR/uAHcuijO0wpb/mOjxmsrI0MxP
         ZMNV66Ggf8yUvRTsZlSuDVa93P+WZwHE88sZwXRm66QDJobW2EdEvfIFVJHycQG+8Smr
         gHWLRO4pCIPTueePJ4Bx53XKmwkXTHCw4OemXwuaJnM99gIGd9wForbjbF7KNDnnJt5T
         z0VHXXzdNIFUdLAyI2/EhuFPJMBOHSqqSa9FKllPCOsuj+sj086t6kYbzYoNQhygQo0n
         rZKMM4o3YC95yRiXd8Jea6dJatSWVKCE+jx0M/9zVx1IKds/A26/6mEaw5RY9iJbSxLU
         TOIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvcBFgiQ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b2sor2818773wrw.44.2020.05.09.06.09.32
        (Google Transport Security);
        Sat, 09 May 2020 06:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BvcBFgiQ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+DgGlmxYDgp0TKp/P6BFoo5PGVwzBhcu5AKwXK50jX8=;
        b=BvcBFgiQIUD1+RziJDhNMsQ7Ucuo0HzKzddEWCkSr5wWeMkPLjf9T3YUgVn7TEZUW8
         BeHtatd35QLZX1SyVZBXps154vdDu6tocL168dUDhvR6IdCcR/lyBozEOsD7vkG7qyXF
         GwQ4iLBTJ8MjVfX6GmIw020VUza87GqXIP2ErisDDxUDaiaV0WTXD+24msJH8VGk6ZZ9
         KgqXgJTJbXg6vRCdSTcREyPVonO1iyvU+21nhXXeCrqDLTbo6JpzO04xrj3l4yq1T0ZP
         4MviTafrpBKVsPxCgh618jx/It7wV31V6+Gz1rx4tYch2/z3kVArsHxues7KCOZvW/Jq
         aPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+DgGlmxYDgp0TKp/P6BFoo5PGVwzBhcu5AKwXK50jX8=;
        b=YPqM6vZER6sNWFgoaI1Jw1ijdu2E0NxDbJ5WPQKFLHDuGaUOqL22CfeTdUI0WGu9IX
         073av7Ex8FDHFBeeb9qWv0HQdhYUVBq+vHoepPL+1bDSKM+46VkxCJojjk4KlJDPwAF1
         CaHLxEMZDfHEqELJDA+NgwnaI09dVDNq/6CQz6+dVUrw/OZ+nq2jdbUuaWAkrV7wKmtJ
         uBsxKOrgnrVpnArP2nQspaBuXKxY+6iCZw1O2sQrWu7RpOdDODrZZP9vnfc5yHAwOXU+
         Oo7tRKTOx1pGBhsag5PayB4zU1v9ZdLh920g93Jvpsi34SuU+Ew1+rkIL99fmhUU3HLj
         fUYw==
X-Gm-Message-State: AGi0PuYSe39/pmXFKr4ixRqqIySBbObslLjJxvKhZGhnThXAMiEyuMPo
	CtBKLOLFcJRvhxctVmFrdOE=
X-Google-Smtp-Source: APiQypJmQJFMZiRR9DoMibdtr9JH+Z1Pn1cDFuHjz2glYTE1zO+Rwp2YknwOdohPGFoSiQItW5g6mA==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr8019146wrs.279.1589029772695;
        Sat, 09 May 2020 06:09:32 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 06/11] target/s390x: Only compile decode_basedisp() on system-mode
Date: Sat,  9 May 2020 15:09:05 +0200
Message-Id: <20200509130910.26335-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: cZ5ZpvDftphH

The decode_basedisp*() methods are only used in ioinst.c,
which is only build in system-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/internal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 8c95c734db..c1678dc6bc 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -204,6 +204,8 @@ enum cc_op {
     CC_OP_MAX
 };
 
+#ifndef CONFIG_USER_ONLY
+
 static inline hwaddr decode_basedisp_s(CPUS390XState *env, uint32_t ipb,
                                        uint8_t *ar)
 {
@@ -225,6 +227,8 @@ static inline hwaddr decode_basedisp_s(CPUS390XState *env, uint32_t ipb,
 /* Base/displacement are at the same locations. */
 #define decode_basedisp_rs decode_basedisp_s
 
+#endif /* CONFIG_USER_ONLY */
+
 /* arch_dump.c */
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                               int cpuid, void *opaque);
-- 
2.21.3
