Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440122wro;
        Tue, 30 Oct 2018 04:24:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eNzRaGU7JXG49BSzzc0BzZQBlvJJGdoDAA6VPnMjbZNzR1Mzv29uz74q0tmeK+NC/HzOW9
X-Received: by 2002:a1c:9609:: with SMTP id y9-v6mr1377431wmd.67.1540898640816;
        Tue, 30 Oct 2018 04:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898640; cv=none;
        d=google.com; s=arc-20160816;
        b=i00V7+HPs6uwvOJ0e98C8VtGVmkGvjoUxvvqgs+zRqUThM3neyBKKC+Ws2pn1P3+6V
         xoN+NgClOCoRN38c/bM51XeEYAZRiO7UFfkE/MyhDmuq6kb0QEpKctb7Yru82V+yETfA
         Ohcvg2m3tEiVYVU5skpz7L+Hmw+X1jzyQ5no/1Xg4eRVUxg7X+xn8XkmqiIuCqtzZgve
         m1aVd9B1Iiw5Y447MB90gRVQxE/lqdZWsRTRTGhvyDpRrWGEI2/QzBvMisnb7W9TAq2z
         nRUehsO3vFqtNEFE+Ilro6JrQOaNVjI+KoHpvjHNIib+T4FXfMPGn5If7TdzwUHoTbyh
         VmXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=CueiWp4DGxQDHJY4etXxbM38EWqbHGQZb2TBCCD2mOY=;
        b=IwXOtqhzvFWfiqSwPoMORKNRVbT7Cs2/mZLuKEUfk1qtGOB+6VLqGjRUOP+LNNIDm4
         Q2QRhWZxoOHxYn3CnznYrsttMDWjJQUTNX+75HHa8Z9ML7VNk28wAH5DQLdecBIHpOps
         9u2mD6bnextakVo0MnF79sGuyJXtvkK998XPmM3iD7o32a9BDs6CGBH4BsHimXIBCFHE
         355RDZBu/zyXUirREJ5eCkj+yL1Oc5hfBDmXcweztgQ8xgytrrazFjQ1eS8jK7XFVw89
         NpGMKFkc1q3W7s1/tHlx6s+aYoflodOkuleiEOu48DCyTyyUx6c235wm/joEKRBHFmBb
         1pEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id h26-v6si22888712wrb.262.2018.10.30.04.24.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:00 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MBDSg-1gPeXG0HrK-00CkD6; Tue, 30 Oct 2018 12:23:52 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MBDSg-1gPeXG0HrK-00CkD6; Tue, 30 Oct 2018 12:23:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>,
	Li Qiang <liq3ea@gmail.com>
Subject: [PULL v2 03/20] memory.h: fix typos in comments
Date: Tue, 30 Oct 2018 12:23:20 +0100
Message-Id: <20181030112337.17973-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:HBV5Oe768CROwcgkYs8F4WrMsfUq3swxoVTPbJS52XmjQTYOUg/
 eTVVWAqDKvgkEQGNiKHNMy8IZGaiGbbGEW+0aPPL3oE7Q1mIQkZ5spo05gsoG+ZxoBIA/Ha
 dNTxSlsX5Vu5s+VQgd6OakOVBljzGmBrmqLUoNhfBe8//o7jBUiRyZKy+Kxmq2/3lZo4gNY
 Kbjme8dMgUacGwLo3Xx8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:ry5LPF+NyDE=:jfS2YQ0jlbPQX+wXY2FMQY
 BCVa8D8yCRnw6VJEVi9GVOjozKSiNHGxI5rXGx4E4DNvi+JlE1MglK61DiiXd+F18dfEu7SWr
 GFerDkJQIX2Ze18RlEPvkVXg/DZxKWATttezhY+GPSru/6RwKZdPchyOfjzdunFCZveG2QPZ0
 0alLvrI1NOxRvOJ7Jdruz5Ucecw1B1cqwgi9CItUb91lzBW9D6EL4yL67ifhvxnA2S4qn0w2m
 B4/XXBiiEXO3fxhyX78lys9msP0MWya4Jp4m157ui9cR/RUxsLJci2oSSjI2JtWBdvE9QBN2w
 726uALHqVdPNEfIn0EILFvCxQb5gFqX6lDH8C8JAuGHL6Ce0cM0Dd4EiNXY8h160f7z0zN5bV
 4VlXZ8Y0O3rAAjmOMZ5asHsXbyIps4Vs5e2XMJaj85KLgJD4ipql0eXZ54GdQShUk9z1cux7R
 9AStll3MrryeiuEo3qxhCLPMnzX1kX/LtIJXv4Q3JCUD9i0T9iyHUv3fJrDGQyhCq4LxNbVHe
 5Qz2ejkmBYirV6zLX9wpKzYRxixoEHpoKCceSowx0njorrXoePO1JBm87NyPPiN5tMHxlHWc4
 R7SkgV7X/0NeyLFBn+lC9AsqRdPFXsRDQ9y34333VgE+wqFrpnVYqSlTvqJky46AMsIvwrxIr
 Ykwb15N62IwcnaY07OsCUZ9a6yqkCkoeENVK891eiggUy63ubH6YxEdV24UyoxTNwB6A=
X-TUID: J0v6I76utCjt

From: Li Qiang <liq3ea@gmail.com>

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <1539080467-2976-1-git-send-email-liq3ea@gmail.com>
[lv: s/types/typos/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 667466b8f3..d0c7f0d9e9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -935,7 +935,7 @@ uint64_t memory_region_size(MemoryRegion *mr);
 /**
  * memory_region_is_ram: check whether a memory region is random access
  *
- * Returns %true is a memory region is random access.
+ * Returns %true if a memory region is random access.
  *
  * @mr: the memory region being queried
  */
@@ -947,7 +947,7 @@ static inline bool memory_region_is_ram(MemoryRegion *mr)
 /**
  * memory_region_is_ram_device: check whether a memory region is a ram device
  *
- * Returns %true is a memory region is a device backed ram region
+ * Returns %true if a memory region is a device backed ram region
  *
  * @mr: the memory region being queried
  */
@@ -1161,7 +1161,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr);
 /**
  * memory_region_is_rom: check whether a memory region is ROM
  *
- * Returns %true is a memory region is read-only memory.
+ * Returns %true if a memory region is read-only memory.
  *
  * @mr: the memory region being queried
  */
-- 
2.17.2
