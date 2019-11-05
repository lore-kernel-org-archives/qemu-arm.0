Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1033849wri;
        Tue, 5 Nov 2019 09:50:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGomP6ATUAVXNVXXkdddhxtvhEjOGeXw2n4pPjXu2B01nPhFkrJZ4LKiidUbmE8GRXuvCB
X-Received: by 2002:a1c:2342:: with SMTP id j63mr213664wmj.56.1572976229431;
        Tue, 05 Nov 2019 09:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572976229; cv=none;
        d=google.com; s=arc-20160816;
        b=QAhvpkq7Yu1T5XtCbUtO6Oqg5g3plIuC4HXpw1A6l7dmZl8a0R97rHriSRUoxxyKer
         26GJzkDRvS5SNGpf1KHPiVn/+eXtcxiwUeqnQzYOFJz25Thv0v/ENwea16xZA/e290ob
         MMf7IvPFm0E01qiRmx9P9T8VE5x0KJeyQaGaebuHsvA1upCA+RtlJIpOk3QwTzD06tZG
         T/MnYdh1erG3044OuIGsAGEwjlYv22+NQ115m1KSP/LhgGiy/G+ZCxLALVOOoEzNgEXC
         3b8t2AkOK5o9OS35xM8lnNJRaBuoGGzkkH8iaCalz18Pmr9bbsik2ns3zD8IK5U+4IhQ
         WLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MN6hpwjD0DzHIrBNYwQqB2rnVGhQuAOfGnvXzFJjYIo=;
        b=sBRfUE2HJnMJZoStOWFmPcUrxgJuEp2OW3oR3iRid2c7JiT88WEZcWFEylj7kPnLyk
         SOZhHq21yxePdtVVT+aa3CrglaE5XXZGbUL6TtfSAn402Mi9RX/+W+WXd5e/1AntQDdK
         ylWJRxQcn5Hi8F66HhA5FntmmZsfgJCP6hQnJVllbphvXhGU3p5yn73071VgeoxTzxEa
         HcI9NK2jq5KFL14T40Akq812BVh+9NtKd/L7OqGVB7mAk8puJy5HopsTw1loA8fo5TgJ
         NYnJLrzTr9ZpgVEvuSBDtonmPHFHsCBYbSqfSkMw8KXaUvsk/GH13VriDz9w+Y0IohCh
         vQvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.75])
        by mx.google.com with ESMTPS id n13si1051784wrv.274.2019.11.05.09.50.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 09:50:29 -0800 (PST)
Received-SPF: neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=217.72.192.75;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.75 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M8xsm-1iY4aV2PBO-006BFm; Tue, 05 Nov 2019 18:50:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Fabien Chouteau <chouteau@adacore.com>,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL v2 3/3] global: Squash 'the the'
Date: Tue,  5 Nov 2019 18:50:10 +0100
Message-Id: <20191105175010.2591-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105175010.2591-1-laurent@vivier.eu>
References: <20191105175010.2591-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SaGI/2qVSXMVZNyKW/ejZuFYgiKKZFkiwfgC83akVKcYnU7xxX2
 fwJRh5TsZQRqkeqvyysvzK15pag2h6pa1AkmjtC4dNJfC0O4AFEJJgswhnCmfs6qnZOxKcI
 M0k8uTi+PU9aGoYemSLTC/YGOu9RZShzEpvnKKRQbjL2zoGYBbxBZNyBpnLWV9Uy3tzL9Z+
 GWbe/mBFDLYd5DHLrrFBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aEkazEhZA58=:PClIdpwWynZy75IsEQoQYP
 /aemNXr8Ap03tx3kzN9Om0z1kcU0bkg7/1aygjdDku534ZYBudJSwIZ/fKDtKAYM4bgTvkF8m
 kwEQRhFzfuUhsimiLmFCPSde7LT64+VKDn2S1NRoZkUCvxf9ObghYvCcsH1fRe4At26vg8JiJ
 CZEqONrv4X8v9W3TH3D5SvksLJUdlIDjVihYkrWpNVUJJlQXUKg+3zd62tDSLqpLCwJez3qmY
 iJSQpP2J1W4ZikwO2qLtO75Xl1K9uM6j5Dih8zDP5kkfcOL0Mo0zaT9rekyfwO6O4XEyk+qCO
 t4r/6H+jJhGcaGOMqLM1B4d0EVgUgvwoy7XBuHkWK3HHiMtChw8HcFJUrO2M/XjL4Jaj7qqan
 hKtzsW5WZrxO1kydCONgd3IUtmExwUs6ATE/uRfau53zoumYO1kKvUZrWooQU2Q/VMQkTPgoT
 exhIkd4pi5Nc7vjwJXdBvMtLWz9TyXEi1BZA2FMdM//3TDG2yuVnZSgBfYtegV+xT15FdUSoF
 LA9fNNJWpSO7Nuu6CgYDKoCiDja5lA973eBZav48jUT6uoD3+mhY4LofPQQjczVw3H0/vVxat
 lyW55MkHs5nAebnTmroX8s2ScjEsWMSW0HCxCMX4sAM4pbPpzKvAWfp2mzlEfxEuLo0ji1Aqo
 DjYvgsPpWROLG3tRJeK6VBwJNHF+kY+//loG5wNeezaxIfZtYJwislmdcqTczwsIZRxtZx1lg
 b0ENC8u0PBz4Es/a1isKzJydl57KEOiNtueFYtT+tOYulytvxWbBCi/38hfeGh0eewZ9NEAm2
 Dae4e8h23Jng607sZ+J2CrXSnPXJJpDkON883/TfZw8pb8P1QIClR3xjQkHB07unskTwUKxVY
 hthX4/B8Bs77gGIv4BpO5dHhYdQDCVBa48BgK0fmE=
X-TUID: 8oMGoJEMFNe7

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
