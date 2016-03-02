Received: by 10.25.208.211 with SMTP id h202csp2010667lfg;
        Tue, 1 Mar 2016 23:03:40 -0800 (PST)
X-Received: by 10.55.73.199 with SMTP id w190mr31127863qka.77.1456902220676;
        Tue, 01 Mar 2016 23:03:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si34769498qhc.14.2016.03.01.23.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0ou-0001TL-4K
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:03:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ir-00075x-Ma
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iq-0003by-O1
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 01:57:25 -0500
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:35309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0iq-0003bn-E6; Wed, 02 Mar 2016 01:57:24 -0500
Received: by mail-pf0-x229.google.com with SMTP id w128so83881627pfb.2;
	Tue, 01 Mar 2016 22:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7a/qz1dVRVdHWNa434Mk2yD8KwGN5+xMQaZn2B7Iomc=;
	b=BqghRY/mL06PQTp2oyIfDwQtcgc5wL5qJUNR4GJGww6riQoUnJH7kHgdlDncC69TAQ
	85AyFoYWeXgwjdYf+LCgCADoSg4wCPoAWCTBTrRdiGgSHmJg0WKmCRopHJUCiw0abUcM
	coypZrOK5rU9HXPN4xkU+hgbSz+GtGWOWLIOEqOeofzJyp1s5+bg9SqYoXrVA1rgY83A
	zlP4r/I742iPDKHcCI48MJI0dd956NzJeEqwbnjq8CfrtFEe64iyx+E4bKPRrmMyTUxr
	t08KIq8BndPu7sXc7c/QfqCDL62JexChpTP7u53MX5yza5dACaiDWnwfON6/BQ7/3sQ9
	RriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7a/qz1dVRVdHWNa434Mk2yD8KwGN5+xMQaZn2B7Iomc=;
	b=jbgHJOqhqq8CvWbKNrbzNSqbvvvKRjPdVuQKrSJ3b1nYXPwGoNrJZ+mrRidVXHcvDO
	x9+fRAJJPl8bsLWQ/dSK1cXi5wKfIUze9NrnV9SwKHFSUty80MayKaTs9DmWzrPjFAdS
	WEuOOIJ5EYYsyfvnautmkF6enmZbKTbOvmqlFBWANKySMex40j82ddDeGhEtlMS6G8OI
	YQI9P8f6fYYDNoiZbLHfjRrPuuOir9izE1IRX6R2kL+nD3j/T/BqEj6jDrZrAGsuHCbj
	sEMUyb1zPWl7JlCmjgsvbJ9CRZZoiPTbGWsYe+XkBSGfcbgszFctgAhSo5k7XHnE8eB5
	h1Ng==
X-Gm-Message-State: AD7BkJLRIu3rBPwkR5zhzZGwrd9msVTakY1SNxCH++tRAxj9MB5kFeM4sG49BQ9TL1T6KA==
X-Received: by 10.98.33.67 with SMTP id h64mr30746998pfh.157.1456901843707;
	Tue, 01 Mar 2016 22:57:23 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:22 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:19 -0800
Message-Id: <368ecb8c07deff822a1115b4df3e33e4e4a35524.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::229
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v2 15/18] loader: add API to load elf header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: esDGkvkbbdb4

Add an API to load an elf header header from a file. Populates a
buffer with the header contents, as well as a boolean for whether the
elf is 64b or not. Both arguments are optional.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v1 (PMM review):
Add filname to error messages
Remove unneeded lseek()
Add doc comment

 hw/core/loader.c    | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/loader.h | 13 +++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 3a57415..7d5e3a9 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -332,6 +332,61 @@ const char *load_elf_strerror(int error)
     }
 }
 
+void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
+{
+    int fd;
+    uint8_t e_ident_local[EI_NIDENT];
+    uint8_t *e_ident;
+    size_t hdr_size, off;
+    bool is64l;
+
+    if (!hdr) {
+        hdr = e_ident_local;
+    }
+    e_ident = hdr;
+
+    fd = open(filename, O_RDONLY | O_BINARY);
+    if (fd < 0) {
+        error_setg_errno(errp, errno, "Failed to open file: %s", filename);
+        return;
+    }
+    if (read(fd, hdr, EI_NIDENT) != EI_NIDENT) {
+        error_setg_errno(errp, errno, "Failed to read file: %s", filename);
+        goto fail;
+    }
+    if (e_ident[0] != ELFMAG0 ||
+        e_ident[1] != ELFMAG1 ||
+        e_ident[2] != ELFMAG2 ||
+        e_ident[3] != ELFMAG3) {
+        error_setg(errp, "Bad ELF magic");
+        goto fail;
+    }
+
+    is64l = e_ident[EI_CLASS] == ELFCLASS64;
+    hdr_size = is64l ? sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr);
+    if (is64) {
+        *is64 = is64l;
+    }
+
+    off = EI_NIDENT;
+    while (hdr != e_ident_local && off < hdr_size) {
+        size_t br = read(fd, hdr + off, hdr_size - off);
+        switch (br) {
+        case 0:
+            error_setg(errp, "File too short: %s", filename);
+            goto fail;
+        case -1:
+            error_setg_errno(errp, errno, "Failed to read file: %s",
+                             filename);
+            goto fail;
+        }
+        off += br;
+    }
+
+fail:
+    close(fd);
+}
+
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
 int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
              void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
diff --git a/include/hw/loader.h b/include/hw/loader.h
index f7b43ab..a626c9b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -36,6 +36,19 @@ int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
              void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
              uint64_t *highaddr, int big_endian, int elf_machine,
              int clear_lsb);
+
+/** load_elf_hdr:
+ * @filename: Path of ELF file
+ * @hdr: Buffer to populate with header data. Header data will not be
+ * filled if set to NULL.
+ * @is64: Set to true if the ELF is 64bit. Ignored if set to NULL
+ * @errp: Populated with an error in failure cases
+ *
+ * Inspect as ELF file's header. Read its full header contents into a
+ * buffer and/or determine if the ELF is 64bit.
+ */
+void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
+
 int load_aout(const char *filename, hwaddr addr, int max_sz,
               int bswap_needed, hwaddr target_page_size);
 int load_uimage(const char *filename, hwaddr *ep,
-- 
1.9.1

