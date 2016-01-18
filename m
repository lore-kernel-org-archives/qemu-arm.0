Received: by 10.25.159.19 with SMTP id i19csp1756034lfe;
        Sun, 17 Jan 2016 23:19:19 -0800 (PST)
X-Received: by 10.140.18.114 with SMTP id 105mr29343374qge.41.1453101559554;
        Sun, 17 Jan 2016 23:19:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c41si29621590qge.64.2016.01.17.23.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 23:19:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL45v-0005xa-0B
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 02:19:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL403-0003XN-Ht
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aL402-00078L-Fa
	for qemu-devel@nongnu.org; Mon, 18 Jan 2016 02:13:15 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:35583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aL402-000780-5f; Mon, 18 Jan 2016 02:13:14 -0500
Received: by mail-pf0-x231.google.com with SMTP id 65so153120731pff.2;
	Sun, 17 Jan 2016 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/xSaplGDb0viFbzih5h91s8XRgErzNwxEjCQX0qYcO4=;
	b=EC+bmnPFrcH0RI72tVDarrLERaRz+s60rCgbDvCy4Qd1W8t6IWxnM8gW2QHGDmURei
	WJeME9d/KZ5x/04l3LClSaBFfrwbCSgOelVxd9jy7kwFCPTNxTCXAzAf1A4FC38Ey1bD
	C1q420vYiaiVczTLhJmbTRweYyZCZTo5gbvs3SAL8Sym5/W05jzaHbnrY/4MLxvzSUc1
	Whv6XW7DrVJFI+SFKpfsuuqVg8EYZyi4KrbcFk9sLK7LCC1h0nAOqzjXSZ/Z775uAz6Y
	OKSwQEWsOReLE9XTprOV/N3ooCSNmo9YprXgzBI0FiS3jEG3FkQcgxJ3JmQg4cebynrA
	KCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/xSaplGDb0viFbzih5h91s8XRgErzNwxEjCQX0qYcO4=;
	b=lfic/bDfBjfk6E1to7oZw+XFIUvl7oOxUjb7WtGWskBBEDyuI5VSygQDRJ84MTUyYG
	orkDy14FUsY1LIQ7omkvmJe1ZWwWOiYh9f4sG2UndqnHkGox17zjKBytRHO1xe4enAqC
	0M/4D16ARiJxxtYiU2P70V/SmexI8RrE1TQatxZemGPKqYMmcJBNlx43kB3r/ZqLimB+
	Gsjdppjujzo+5g2E2GZQuZAEG6uiMYgjuSD9EVGhFT5h5S8Ekc3dEUPjly34eZvXYIBy
	0Mn3dXHNKN/kOKNItPuFLPxeBnuU6OZ0fwtJPHBeBLMFN6xaIjoRKp66yVn1K53ptCJr
	DsNw==
X-Gm-Message-State: ALoCoQm0Ia2Hr0vxuBCxx2mc4N+NvYEMUUgCLLAi/QxDcYHB/u/Mgv2cxGEAnF6Sa60jJfBfi8uL4RCQkag2Y5GnRShdfwvzLg==
X-Received: by 10.98.16.146 with SMTP id 18mr34468388pfq.122.1453101193603;
	Sun, 17 Jan 2016 23:13:13 -0800 (PST)
Received: from localhost.localdomain (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	xv2sm31471880pab.10.2016.01.17.23.13.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 23:13:12 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 17 Jan 2016 23:12:42 -0800
Message-Id: <06401b2d276819d87a81058279e1d05d4e9ec7b7.1453100525.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::231
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-devel] [PATCH v1 15/17] loader: add API to load elf header
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
X-TUID: oRP5HmX8UZ+U

Add an API to load an elf header header from a file. Populates a
buffer with the header contents, as well as a boolean for whether the
elf is 64b or not. Both arguments are optional.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/core/loader.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/loader.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 6b69852..28da8e2 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -331,6 +331,54 @@ const char *load_elf_strerror(int error)
     }
 }
 
+void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp)
+{
+    int fd;
+    uint8_t e_ident[EI_NIDENT];
+    size_t hdr_size, off = 0;
+    bool is64l;
+
+    fd = open(filename, O_RDONLY | O_BINARY);
+    if (fd < 0) {
+        error_setg_errno(errp, errno, "Fail to open file");
+        return;
+    }
+    if (read(fd, e_ident, sizeof(e_ident)) != sizeof(e_ident)) {
+        error_setg_errno(errp, errno, "Fail to read file");
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
+    lseek(fd, 0, SEEK_SET);
+    while (hdr && off < hdr_size) {
+        size_t br = read(fd, hdr + off, hdr_size - off);
+        switch (br) {
+        case 0:
+            error_setg(errp, "File too short");
+            goto fail;
+        case -1:
+            error_setg_errno(errp, errno, "Failed to read file");
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
index f7b43ab..33067f8 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -36,6 +36,7 @@ int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
              void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
              uint64_t *highaddr, int big_endian, int elf_machine,
              int clear_lsb);
+void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
 int load_aout(const char *filename, hwaddr addr, int max_sz,
               int bswap_needed, hwaddr target_page_size);
 int load_uimage(const char *filename, hwaddr *ep,
-- 
1.9.1

