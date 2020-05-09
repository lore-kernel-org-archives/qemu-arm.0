Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026403lfb;
        Sat, 9 May 2020 06:09:27 -0700 (PDT)
X-Received: by 2002:adf:eac6:: with SMTP id o6mr8328006wrn.297.1589029767108;
        Sat, 09 May 2020 06:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029767; cv=none;
        d=google.com; s=arc-20160816;
        b=VkHe/q/Kr/OhA8UXzPDoLDN9+5asEZ30A2w0wp0q3ZqcO5fssJJBlFJ4ASKxOhLMcG
         Yg4hPiYe1LuTbKe2Jh2vr9+cvcB7chikpJVYV0sK5ugv/VMBI69UQr5BjgSfoT86s2kI
         xBU06lISd7wPxhLzS2y4iFDZNLvmsEtMYStTtLhr24ILTjVxmv6JYkSuPYnkZQlHZh/O
         cYtfV/mWbk/ynGwOZBWvSoAR95DVyrkPjboeLMoXFfVX9krNZzpV9wvX++dkjwMtZTId
         W/dGwFQiC1a1cByQL7TVCJjcv5zwF4iff1YxrqSstHya+Et3v+k8mjzVO47ozV8VXEy7
         NO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/deFlLfSBeeZSBPphjSFXwpz9fqQ8rThdLclvTAwgLE=;
        b=QK9t/rKRfQct3NCcP4SociIfa7px8PNJ7334Q5YXcEYuc8LvThIyVsgM4MZ1KFqPHK
         sqKZb7VBl5i9rj64HnEN3MVlUIM66rTgQIK0pI44cNOVJKOI5qSQgqsLTQgLddSCybip
         sE648Cekpr8OTdVYDX3vOYFt605hrsFCB195CLMgrEriojNY6WAFTGzqQlqAypSUZbvt
         oeQNxiXjTnQYVyhUbjgMDyKzTzPm0zRhBn3SZNQpZ1QY6GA40KX8AliGl+Fj0OJjOG2h
         ksIomTR6EWhoTyDUhpFl3xhNPc+61CEX+AaqlIfMSEepOjbOKmVQdKA73Qy6WYJTrKg4
         LTWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="GXc5WD/j";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n5sor7804738wmk.29.2020.05.09.06.09.26
        (Google Transport Security);
        Sat, 09 May 2020 06:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="GXc5WD/j";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/deFlLfSBeeZSBPphjSFXwpz9fqQ8rThdLclvTAwgLE=;
        b=GXc5WD/jotqsaemJao8jVSg1pXJuzyf3A6lWcUqvDc3kiEcIAE+1c7w8dft4D3P4PQ
         8933I0NI8h47a5aOH3PEbvKagCUFu7KMOMW/e6+ZgFYN09dkTIUFYz0DGi/pNWSL/Idm
         bW1Y+JkBDZBPP/47h0/q5kq3uBxu4HCBqYD2GzQrV7vp1pVMgmDVEEu5TGis/ayRRhwO
         3BPIs9U0+X6XuHls3MMhYQHiz0RwtmcuL/J4tdaSIQVfdtX9kglYaQ6u7TbqNX6m607Z
         zy4D0ShG0JNc1PFYtgHeKfGtulBzHHIbVDJouBXhPdd3uBzxhR9LAM59/TYbj5vPjSmg
         L3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=/deFlLfSBeeZSBPphjSFXwpz9fqQ8rThdLclvTAwgLE=;
        b=M9OHQpR6/Lif+NTX0dZfRrFTShBWYJQaV3m4ZDbmmotYrAmlOjjVlWCSdYq3YiwVZJ
         Ia8lX43pdbszYHFyEDdu2x7CcpAdTYNOpqEJvIGICAzTMpigsCO9rsLk07rNhhg8bwUL
         2omUWJw0psoiZUg6yirZqVh4Dwz72tjNMvv5jAC/wUYy+XT+/1mCVzJgbnykhDrYU42o
         Nif7Dn9Wg7qA7dP3qPmfCGHbjDKtagQtTcDD7eXeWSw2zQIbyhnrhk2etToDedz0yuCA
         5hU24CYPn9eCovYIZ1mbjMlcuNw/8UaofQdJsxKs1b8/Dc/HWGOvZsBbFHyTVyXDGcQy
         HE1g==
X-Gm-Message-State: AGi0PuYGDksDnlU23GZ+LMo35+8f+h8/DFedAIC97+fFDVKuyD6uVYtX
	dHD37+vINMgrsVRUAgDaXVc=
X-Google-Smtp-Source: APiQypIVCdAFyRkc2ubH7ow2MRfiq0XjMLNU48lJ+FFzNlFhFUf46VOfeXAxA1DxSFAhNQrANi6jWw==
X-Received: by 2002:a05:600c:14d4:: with SMTP id i20mr22378257wmh.118.1589029766837;
        Sat, 09 May 2020 06:09:26 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:26 -0700 (PDT)
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
Subject: [PATCH 04/11] sysemu/hvf: Only declare hvf_allowed when HVF is available
Date: Sat,  9 May 2020 15:09:03 +0200
Message-Id: <20200509130910.26335-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: TT9UQdWEAjFJ

When HVF is not available, the tcg_allowed variable does not exist.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/hvf.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index d211e808e9..fe95743124 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -18,7 +18,6 @@
 #include "exec/memory.h"
 #include "sysemu/accel.h"
 
-extern bool hvf_allowed;
 #ifdef CONFIG_HVF
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
@@ -26,11 +25,12 @@ extern bool hvf_allowed;
 #include "target/i386/cpu.h"
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                                  int reg);
+extern bool hvf_allowed;
 #define hvf_enabled() (hvf_allowed)
-#else
+#else /* !CONFIG_HVF */
 #define hvf_enabled() 0
 #define hvf_get_supported_cpuid(func, idx, reg) 0
-#endif
+#endif /* !CONFIG_HVF */
 
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
-- 
2.21.3
