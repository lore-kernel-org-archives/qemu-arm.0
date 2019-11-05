Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp808970wri;
        Tue, 5 Nov 2019 06:43:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqw26GVzXWRxrGmmgjT8VGCAu12r/PW0BHuFVMj5XTKenaiotUFXErRPQbLacWEX/BEX6WJl
X-Received: by 2002:a5d:4684:: with SMTP id u4mr24273431wrq.352.1572964982757;
        Tue, 05 Nov 2019 06:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572964982; cv=none;
        d=google.com; s=arc-20160816;
        b=T3yhVIF0GoOc+xITvKGpwizpnMw4L/gMJ0YIbsrdlq11lt4Bh8igTDgUbvlgQlshLV
         FOlWR8NlXKr1/CFv3tSidVIiB6T/vCA+fSXkqau9w3lnYs+qsZxoyRW9aJwZ4Hrj/RN1
         eOCHyJpu5peLBkI4H5gQXS+h1w4VS8JgCfZq7Mb/jLq/HU2a+pZvn2BLnWCDdw3/bqJx
         s5Zi3OpGSG70ShpvSsxjwzGL3XBRbDtLNgNGsjZfLifVrqETZWh/2VbevU/dyV1rhvV/
         se6ah/Sy4oUW4KUi2yIupN771qLRd2OzcuG7nmhYfYl+jirHFDlHwBmiObBNUd4k3v9K
         8PDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MN6hpwjD0DzHIrBNYwQqB2rnVGhQuAOfGnvXzFJjYIo=;
        b=DkxnyywemdGmbg8asCx/m3okRfgE8GnuM1d8oZn65lLE757ey/Y9sBIW10dWEP1eKx
         H/v8n/8XPce6D3Qs0k+dYlxUg9/XQYrOQmMcHprDRpYg2X2I6Az76AX0lQhl3H9ImL/3
         aV+4QqHg1HCn3CMo2qj/mwJmRHtzKbXPmxJpnaV3PJpJRB3JVICe+vdTB0qnJLCR0vMa
         pMROKhYuFyUUVlcu7XRxmNwZ4eTKMFXphBPQStUcjtSQv4vF1CZ2s+rFsywBB9vC/SrJ
         pqGc6nCbubn/SqbmOo9qlVPrE6g+fk7V8/rUhizQNY3KEAQkB3uM3wZSJ8k4Eg6TMQOk
         t8NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id k12si16832322wrv.278.2019.11.05.06.43.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 06:43:02 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjPYI-1i4EoB2dju-00kyqs; Tue, 05 Nov 2019 15:43:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	qemu-ppc@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Cleber Rosa <crosa@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 4/4] global: Squash 'the the'
Date: Tue,  5 Nov 2019 15:42:47 +0100
Message-Id: <20191105144247.10301-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JNoxt4H34KkBSPuWmF9GErgKUZwyQv3Mxe+T2CTt6aHlA2A5yRR
 3E+liXgMDMhesz7bdii/u3mcbwIwTGlzMxclNKuIeSI+Ti/9qyNoUwv7wioMYkVOEoFcOfw
 V50zys+VtgQCtYTjEhZhAIZ9bXG+lxXncNV5qyt11sWNjC7i9v/ePmItrO3v0a+8tgwzJOx
 A/7AjMdEAcs+vG7ryklHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xfx0CyW1lWU=:dIquTygg+lDDE2ngKnWlqC
 CixfxkPGwz3v9iDyscyMwcEo5z/peQAFvuaEJsEIR8T5tLoq3FlR/sWqnncXn0lBmBYnCyM4K
 5mc/JK4O7wNXh6A5T6Ko53e2vHiaSdeHhnOXFDs4zgYRdKd14Yq6Mr8NzlwPpFVlNwaHXosnF
 dSqkL6LPusb9GlFrqyOlcOEQtPIp75XDTTaFy4Vhl7oTsjNgxYDTFLhgrGUhJK6nkQqQj0S4P
 6lzCHZOKM+8Zm9niyqL335Xbc+gRgtZ2NIycOxEs/3icCrOImAShbM799FuMp9hqUSaijj4lU
 k9iF4sCpPDQFWOJk6tWlz/qJVvfjAvR+cnXW5HrcD6+e88GM8+yMI3ADdeb3DmEnS+gcfuxTG
 TGj5EHYFpAleIMrOoMDeIrG3QuIXWtiq/7KQPrn6Z+e5H2CTQkU3R2yaSuaYbY/bAKqv/+cof
 BW2tzRhvFu5k7vD9BS/JuTC+PtFFg1e6/nbiRywH+9LwEsLYvICWJCFqTyYDkVVNa35v7b3hD
 WakILpLSVOYOt3Usa/QaVv4TqwWiJi6AGdFBMMDVd+HKAtHiNDflmaFRUUgn16K4g0Bc9n88v
 pr+5D+o3QTr8+0/PctrR6mkR3EsoTPNsZModvCRfWAU3cAEqDWfExnb1+f3WPSn6UCDiX67ny
 5wt/Fq4yMMYLYvdxKCpLm9qSJrYWjv3l214xEuH/jCHE0xcJngoBIJ8xmsI+zUSAUUTN/Wgno
 brVGdTH1x19OyRGq+1iH2AHsQzsXSdG6caSBdHd/R3icCEpvl5OLXThpCKsG06X00NJtWFgGQ
 crSP4WXP6VxJW+/e+59I+bxgVeorXM4FJRa8L95yVaCFVUHnb0IL8p0p4KeDuOoQivHG/1bRl
 dTGRrI+pqpnXTYf+kdEXsuPFJWTffENDL14Tpm1aA=
X-TUID: e7iSxA2rxOQV

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

'the' has a tendency to double up; squash them back down.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191104185202.102504-1-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 disas/libvixl/vixl/invalset.h       | 2 +-
 docs/interop/pr-helper.rst          | 2 +-
 docs/specs/ppc-spapr-hotplug.txt    | 2 +-
 docs/specs/ppc-xive.rst             | 2 +-
 docs/specs/tpm.txt                  | 2 +-
 include/hw/xen/interface/io/blkif.h | 2 +-
 scripts/dump-guest-memory.py        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/disas/libvixl/vixl/invalset.h b/disas/libvixl/vixl/invalset.h
index ffdc0237b47c..ef5e49d6feb2 100644
--- a/disas/libvixl/vixl/invalset.h
+++ b/disas/libvixl/vixl/invalset.h
@@ -102,7 +102,7 @@ template<TEMPLATE_INVALSET_P_DECL> class InvalSet {
   size_t size() const;
 
   // Returns true if no elements are stored in the set.
-  // Note that this does not mean the the backing storage is empty: it can still
+  // Note that this does not mean the backing storage is empty: it can still
   // contain invalid elements.
   bool empty() const;
 
diff --git a/docs/interop/pr-helper.rst b/docs/interop/pr-helper.rst
index 9f76d5bcf98f..e926f0a6c9cb 100644
--- a/docs/interop/pr-helper.rst
+++ b/docs/interop/pr-helper.rst
@@ -10,7 +10,7 @@ can delegate implementation of persistent reservations to an external
 restricting access to block devices to specific initiators in a shared
 storage setup.
 
-For a more detailed reference please refer the the SCSI Primary
+For a more detailed reference please refer to the SCSI Primary
 Commands standard, specifically the section on Reservations and the
 "PERSISTENT RESERVE IN" and "PERSISTENT RESERVE OUT" commands.
 
diff --git a/docs/specs/ppc-spapr-hotplug.txt b/docs/specs/ppc-spapr-hotplug.txt
index cc7833108e12..859d52cce6c8 100644
--- a/docs/specs/ppc-spapr-hotplug.txt
+++ b/docs/specs/ppc-spapr-hotplug.txt
@@ -385,7 +385,7 @@ Each LMB list entry consists of the following elements:
   is used to retrieve the right associativity list to be used for this
   LMB.
 - A 32bit flags word. The bit at bit position 0x00000008 defines whether
-  the LMB is assigned to the the partition as of boot time.
+  the LMB is assigned to the partition as of boot time.
 
 ibm,dynamic-memory-v2
 
diff --git a/docs/specs/ppc-xive.rst b/docs/specs/ppc-xive.rst
index 148d57eb6ab2..83d43f658b90 100644
--- a/docs/specs/ppc-xive.rst
+++ b/docs/specs/ppc-xive.rst
@@ -163,7 +163,7 @@ Interrupt Priority Register (PIPR) is also updated using the IPB. This
 register represent the priority of the most favored pending
 notification.
 
-The PIPR is then compared to the the Current Processor Priority
+The PIPR is then compared to the Current Processor Priority
 Register (CPPR). If it is more favored (numerically less than), the
 CPU interrupt line is raised and the EO bit of the Notification Source
 Register (NSR) is updated to notify the presence of an exception for
diff --git a/docs/specs/tpm.txt b/docs/specs/tpm.txt
index 5d8c26b1adba..9c8cca042da8 100644
--- a/docs/specs/tpm.txt
+++ b/docs/specs/tpm.txt
@@ -89,7 +89,7 @@ TPM upon reboot. The PPI specification defines the operation requests and the
 actions the firmware has to take. The system administrator passes the operation
 request number to the firmware through an ACPI interface which writes this
 number to a memory location that the firmware knows. Upon reboot, the firmware
-finds the number and sends commands to the the TPM. The firmware writes the TPM
+finds the number and sends commands to the TPM. The firmware writes the TPM
 result code and the operation request number to a memory location that ACPI can
 read from and pass the result on to the administrator.
 
diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
index 8b1be50ce81e..d07fa1e07822 100644
--- a/include/hw/xen/interface/io/blkif.h
+++ b/include/hw/xen/interface/io/blkif.h
@@ -341,7 +341,7 @@
  *      access (even when it should be read-only). If the frontend hits the
  *      maximum number of allowed persistently mapped grants, it can fallback
  *      to non persistent mode. This will cause a performance degradation,
- *      since the the backend driver will still try to map those grants
+ *      since the backend driver will still try to map those grants
  *      persistently. Since the persistent grants protocol is compatible with
  *      the previous protocol, a frontend driver can choose to work in
  *      persistent mode even when the backend doesn't support it.
diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.py
index 2c587cbefc57..9371e4581308 100644
--- a/scripts/dump-guest-memory.py
+++ b/scripts/dump-guest-memory.py
@@ -170,7 +170,7 @@ class ELF(object):
         self.ehdr.e_phnum += 1
 
     def to_file(self, elf_file):
-        """Writes all ELF structures to the the passed file.
+        """Writes all ELF structures to the passed file.
 
         Structure:
         Ehdr
-- 
2.21.0
