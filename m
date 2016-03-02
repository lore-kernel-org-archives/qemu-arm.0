Received: by 10.25.208.211 with SMTP id h202csp2010303lfg;
        Tue, 1 Mar 2016 23:02:43 -0800 (PST)
X-Received: by 10.140.238.8 with SMTP id j8mr33443895qhc.76.1456902163010;
        Tue, 01 Mar 2016 23:02:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y69si34839799qka.73.2016.03.01.23.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 23:02:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab0ny-00007d-HO
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 02:02:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0iy-0007IR-6a
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:57:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ab0ix-0003e0-CH
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 01:57:32 -0500
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:36137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ab0it-0003cW-6M; Wed, 02 Mar 2016 01:57:27 -0500
Received: by mail-pf0-x22a.google.com with SMTP id l6so30968938pfl.3;
	Tue, 01 Mar 2016 22:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6pq0lY0+7R43ZPoXbcKGvXyrVWj9qPcpsft4ostSGDg=;
	b=pz5KyOPeIcJ+xADNx/rcQecJ6J+TkP9WwsV5VfsQC9HRl1J/r+9KqPpy5DuXTkbR4k
	/Ok4vP23LQl3gfBbWfRdOIA3bL4eIlHUOetYzEEvQva2cbXrFc6stz9HKVjRbJBgjfqs
	Qymjkh3Q6HcaU93Kqj9SNThnOxASazzBhVXKbXKtuM4pbE5zJEh2Opd1r3+MZSojrJsU
	SxdiJOf5K5L8ErBGXBkQFlE86PeLWmAou7xvSE+ymVQTHfJjSlbJR7/hpfz45zL7+B9M
	xQO1Q7XYS51HC96UIJbDLXcrWQUlB6iNFdhPtPxOcibFJOfyxHV5E7tUJz/ZtKc/zNyH
	pinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6pq0lY0+7R43ZPoXbcKGvXyrVWj9qPcpsft4ostSGDg=;
	b=QujkIz+OVXAjZ808ghfU3yKPi81bfTF6e3wEYm8vk2Si/sWc6J60XXm35sAiitMXcV
	ISEVQ4RLnIkfc77brvrdnMR7WmwGUJS2AdjWc+DQT1ecAb1t0poXJbwYLUmv9naT8CRO
	3+eF+vQHFEF0SYggJTFbzpYSfkGCJmla2ftiDYeeQ3qgcgupjmBanPj2+3hfyUta46Vz
	xrW6wRFPfdpGs1MyPHRUJaCZaeHPV8Y0TBA/PsHBr0vCIMW4zHYqKW51WIAXAz5JQAPY
	u64yOgiUKHEpbPVHA4DM04pMH+aYmOpgQVIGYMklRd5hhxRu6kBb0bXNvmad0eZIo5Qp
	/voA==
X-Gm-Message-State: AD7BkJLHHq9zoER9NXaSoerSamV5PUv0vkmf2ApnEgOnzQTVRex061///MwpDZsALU1dSQ==
X-Received: by 10.98.79.9 with SMTP id d9mr35358148pfb.46.1456901846385;
	Tue, 01 Mar 2016 22:57:26 -0800 (PST)
Received: from localhost.localdomain (mobile-166-137-179-103.mycingular.net.
	[166.137.179.103]) by smtp.gmail.com with ESMTPSA id
	19sm50069248pfb.64.2016.03.01.22.57.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Mar 2016 22:57:25 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 22:56:20 -0800
Message-Id: <26d6575268b8f625b1c31e1b7a1e8854b34cc0c5.1456901522.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22a
Cc: peter.maydell@linaro.org, sw@weilnetz.de, Andrew.Baumann@microsoft.com,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: [Qemu-arm] [PATCH v2 16/18] loader: load_elf(): Add doc comment
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pRGj2I7pBxow

Document the usage of load_elf() for clarity on current features.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 include/hw/loader.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index a626c9b..264ef89 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -32,6 +32,29 @@ int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
 #define ELF_LOAD_WRONG_ARCH   -3
 #define ELF_LOAD_WRONG_ENDIAN -4
 const char *load_elf_strerror(int error);
+
+/** load_elf:
+ * @filename: Path of ELF file
+ * @translate_fn: optional function to translate load addresses
+ * @translate_opaque: opaque data passed to @translate_fn
+ * @pentry: Populated with program entry point. Ignored if NULL.
+ * @lowaddr: Populated with lowest loaded address. Ignored if NULL.
+ * @highaddr: Populated with highest loaded address. Ignored if NULL.
+ * @bigendian: Expected ELF endianness. 0 for LE otherwise BE
+ * @elf_machine: Expected ELF machine type
+ * @clear_lsb: Set to mask off LSB of addresses (Some architectures use
+ *             this for non-address data)
+ *
+ * Load an ELF file's contents to the emulated system's address space.
+ * Clients may optionally specify a callback to perform address
+ * translations. @pentry, @lowaddr and @highaddr are optional pointers
+ * which will be populated with various load information. @bigendian and
+ * @elf_machine give the expected endianness and machine for the ELF the
+ * load will fail if the target ELF does not match. Some architectures
+ * have some architecture-specific behaviours that come into effect when
+ * their particular values for @elf_machine are set.
+ */
+
 int load_elf(const char *filename, uint64_t (*translate_fn)(void *, uint64_t),
              void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
              uint64_t *highaddr, int big_endian, int elf_machine,
-- 
1.9.1

