Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026524lfb;
        Sat, 9 May 2020 06:09:36 -0700 (PDT)
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr7989279wru.243.1589029775889;
        Sat, 09 May 2020 06:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029775; cv=none;
        d=google.com; s=arc-20160816;
        b=itBeEME+TJCOs8/EYdtxwfgpB6qD/RP4YPdiVpK4wZKR66Rah7wOFcOMovq8Wcg2+w
         /+IsqocdMVma0kpg2vIXG2hgZ+cnKfdxp+OxrmbSpqicwbRNztGea+WIiDKvQH5Msnvo
         75tahy0jVvVsdFvaTIqJT1HWmkf8vLe2dKBgMGBf6qwZDcyu7ZUtVOn+EAOB+yTSfCn/
         tiI9LAyTA2BEvFCPa5E+78iLq9/RYq5iwsSfFpAWudqL39UU3NASMUai5ZlAt3bVLwAa
         78gNqPQ2/twKzLvSjU97KG9/FmCQ7N5R3c5uSCJne2K7I6DmADBm8YXFG39YgtSUhqIj
         f1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dOtABLpYucdkmo0UeAZ60MKjOPNkZbYs54q0kVYNjc4=;
        b=QJsW+t2pKF7r7nScxDK6WAOvgVM3+27Q6u48KwQmuwhl8KewZ6uk7Vw/pEnw028V5u
         jI3/atx1trQ4XAvaw38jhR/XtCGrEljs3fCiGvF+Lxq4Ejwy9WVgi7EG9dqMMHK/aAt3
         Gj8Cwc4Q12Mctco1yHotFAr/9E+kjtxHTYuivGrqaChhgSWagSPLat30JJ2pNxIKkaz3
         aN3agZxOwFIwBJHxdeYEKnH/2UH9Oc3DBwwlcywoEj9X9D/KSD9G+mzl/BsAM3IXR6It
         +05xJ/3AhsKWAD+qwAfnSl/CoRqOS4VIFNQxFu4tdoTxWLRzXVEMTjCQi/sfVHxIzuIR
         gzvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HQK3okQo;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f12sor2908596wrq.59.2020.05.09.06.09.35
        (Google Transport Security);
        Sat, 09 May 2020 06:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HQK3okQo;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dOtABLpYucdkmo0UeAZ60MKjOPNkZbYs54q0kVYNjc4=;
        b=HQK3okQo3XgNVWABTcc/YPdQSiaGJ3DfZD6sUUm77Yk8M91/zHxprIHjBdeBsmNIdg
         Bn3+sNvRRbzvzyVK7o+vMnT7F6lWE1Iz3Dc5pZD8yA9Su/M/W/MQvv9soEeS1saLjcTe
         1nsJCoI4Dt3gaLZtddO2soy9KlYTqguUaHTrFAwy1FsijxkmQEF8Ye47gY/UgB+Ingrx
         MXCjshWY7FIM1TOUdJ8OPNMRLvDuykIdDhp0rhL65CbYVOl8DVPRp2ITd3RjPSV48+KN
         dvEWFWdZoycY7hiqyy+y32YfKU0m1Agt5JeQFR0A3mdwVcz9WhrfrydHnlsV1s0wWDZY
         JRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dOtABLpYucdkmo0UeAZ60MKjOPNkZbYs54q0kVYNjc4=;
        b=tFBcUIbNCZK/MqkF2aX+Kc7CQNGqSMghIPEkK1rUEZvP6q+dCBXz3n0bPzdNCw+9xx
         VVJNKHIHT1lwX5IEavKHm8aT9R+Q54kzlmN6dtL3AEdG5PUGvHWiG7tI35+Uvt1ahAbZ
         nGH9/LfRsngyGfyY1mtz7oioi/mYefh3zvnC6kjLO5IXnteM0WC3YI+JF5AHRKRxYfk3
         oH2hyzsLLPCkJ56dwcXxU/pEIIzOvLHBP6O7+QjL92BhlzUpTL3oGJ7Hpx2VF7d890/F
         D4xe6bcH8RetpwhVd2jl8UkCayGEtjZiNmEjX7wi6Xf/kkVWjJxLtHfTP35uy1kRS0p/
         ttDw==
X-Gm-Message-State: AGi0PuZx4i3k6eR9ULw/ExYDCgyyKFvKsIltVw6v/RByDxfjcNmFGOmw
	fEhYbro8hkSPQFsu+x8rjgw=
X-Google-Smtp-Source: APiQypIV8V4JDCd+NtoSYkuzj8e2yB4xHjwhOrS9F9Bxn7DYiVKkt3jysGRG12LFj+3ejc82YWxp8A==
X-Received: by 2002:adf:d841:: with SMTP id k1mr8240629wrl.129.1589029775565;
        Sat, 09 May 2020 06:09:35 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:34 -0700 (PDT)
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
Subject: [PATCH 07/11] target/s390x/helper: Clean ifdef'ry
Date: Sat,  9 May 2020 15:09:06 +0200
Message-Id: <20200509130910.26335-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: zao5X3jpmbEP

All this code is guarded checking CONFIG_USER_ONLY definition.
Drop the duplicated checks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Suspicious ifdef'ry in s390_handle_wait() from commit 83f7f32901c.
---
 target/s390x/helper.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 09f60406aa..26e3b366e8 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -33,6 +33,7 @@
 #endif
 
 #ifndef CONFIG_USER_ONLY
+
 void s390x_tod_timer(void *opaque)
 {
     cpu_inject_clock_comparator((S390CPU *) opaque);
@@ -42,9 +43,6 @@ void s390x_cpu_timer(void *opaque)
 {
     cpu_inject_cpu_timer((S390CPU *) opaque);
 }
-#endif
-
-#ifndef CONFIG_USER_ONLY
 
 hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vaddr vaddr)
 {
@@ -98,14 +96,12 @@ void s390_handle_wait(S390CPU *cpu)
     CPUState *cs = CPU(cpu);
 
     if (s390_cpu_halt(cpu) == 0) {
-#ifndef CONFIG_USER_ONLY
         if (is_special_wait_psw(cpu->env.psw.addr)) {
             qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
         } else {
             cpu->env.crash_reason = S390_CRASH_REASON_DISABLED_WAIT;
             qemu_system_guest_panicked(cpu_get_crash_info(cs));
         }
-#endif
     }
 }
 
@@ -328,6 +324,7 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, hwaddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
+
 #endif /* CONFIG_USER_ONLY */
 
 void s390_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.21.3
