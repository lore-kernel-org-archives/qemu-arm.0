Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881285wro;
        Fri, 26 Oct 2018 08:32:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dNSMPpp6nbZD09C8C931RzbYpXc21sRzizRnc34JRm6dLzfNIqm/QeGdDUPrbt9O406cV2
X-Received: by 2002:a1c:3584:: with SMTP id c126-v6mr6081136wma.120.1540567936350;
        Fri, 26 Oct 2018 08:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567936; cv=none;
        d=google.com; s=arc-20160816;
        b=bk77qpKCaeK82r7O2PVVpHBnluQrA5HbimuU8rSU+k7ZLKaHc4cQ70kIVL5kV9t7mt
         POu6q5W0slW1I9Db2IVWldoWTc7tlFRU3s6y/x67mfGcWOr+PEA7UiI4cSOI/beLVgPE
         AXeClhGYlOZKqgWhjwE8imLolnJ9KxZh3GHZDF2iu5xWFtpLxqTsEM5/FOL1gqImkhZK
         4o/0IswMJfIjVfRNoLo5EV/jIBIS8PYQ9Ks6CuZyNWlFwHgEdgaJNsa5gFwOFQcNbA9C
         GqQICt0HD1HOOPEmasWXNlM79IvAefZ6rC3W50CEJdYjc+2NaDTgi+EP8Sc//kuS6n5X
         tmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/8lbiZUhaAEwbfK6zkzyHN/TffMZZ88qqoKQUb3VUkw=;
        b=uf3ZYOxCKPwC670JGeHbdZEWwoi4SewQCAxbX+Drpj/2ZJJx2GE0UZmBz/BCuatfvu
         C7lHg+KIp63VAVESgIhI1Ktb3u2EzgrAJZqXk7hI6JghB6Yt3tiTQXjK6Nsts4vNrecd
         CoXHf31mV1XqWpNQ29R/a+7WF0FV+M4EKoJX/Fpia3V2YvGqVy97ne2Y+N7t82k5URi9
         GKSyNblXyJr633biq3atnfr5Ksj2Y+QBRJQirRguNGQCPfiYhKsOqQSU1uZLOSH5Qyh2
         /CwrRpjh0krk0tm3a9cBPWhBa8zA+ZbYWnYY20lwc9kpK9+PjfZfcfvn7pJSLrumEjWD
         XpXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id a9-v6si9605552wrd.453.2018.10.26.08.32.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:16 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3Xvv-1fXPaK0qXL-010fOy; Fri, 26 Oct 2018 17:32:11 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3Xvv-1fXPaK0qXL-010fOy; Fri, 26 Oct 2018 17:32:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 15/20] xen: Use the PCI_DEVICE macro
Date: Fri, 26 Oct 2018 17:31:20 +0200
Message-Id: <20181026153125.24738-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ujcQMLVnNdlA+bT6z6rODRtkZg/zsDEqRdCnz0gVnaZ9/UQrReP
 yYwtX/6ZZtTkN6YZvVq54IrtX1iqx1Xkwd5t2OJ98jNQ1a4UmWDICn6a7FyQKjgJF7W+Ctn
 QhTDR0tSekyjaYRLrbiYdL3X6UDp5aoM44K76g4syHvKF2eQxJRCBHixUz5iJDvpc3V9THi
 BBKc9sIV3voKPz5VYe5HA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:mDkSnPqe98M=:915bT4UpaXUVeT5R6liQYf
 w/dv7Ug2RSxa3KsGn+7+8g4f1ywSgyhZLKn7vYN0GfwmGhQArERISpZTBitmSAY/82mJJmPsB
 NvNdFf4tNjCK5ssXJsNtv4ZxU3h6e8CLvgCrGYxPKh7ON6DvOHEghV97LQUtR2E6sJxPGbrEZ
 ZRlftgPq3oJ8N7oFLRto2bVzIkVNDQOsWcxilAaFgKkd69mz/O60aiqy5qkym+i4hnDr7uMY/
 9Bty4ZbNp8mf1y3rtQc1uP1s7RWAf8BuDXeXiuSduAVbuwXcyUw5eMnWDkeJcgB2HdrMFYsxI
 vOPGdwsLZJqj+TLxiozh3y9lfi1YknPb7Nng/4fj0Z9nHsSJCGrJzacfFvYHyp/5YRuusD7Sk
 QDnBpWVYTJMnyyAVrNS9S+l2kR3n51RrIXDY6HjJ9GwcySHizBRyu8W3Ztj5QreLn/pYPvpS2
 JuOJj0emB9SmQ6hwpmHc7LUwYSCzX1fQK4stbEF0T0+/Aeyk/SL95f+fuoJhrN9vZVtTTCqjH
 7FHhGf525pC5VBpO0KCdiFwCDn5lEz3jfF5FGRgSVj2nqarRkJHS0cVsD1dUb9NCdAu4yCzSH
 CTOXdBv7ZjNZnlzw1rTTha8FTBVxwBEsgRVwSFOGR97Ilorc3IWMoWTq/HkwO/V8CFb9ERV1K
 RtoS1dDCoMkV+DEU4xVCJs5o1o9hNYzAlmnp1F9m1kIUuvD+OX+edWjILFNP//jnYmbq/OIji
 qt4DZM7g+prHqIIV
X-TUID: ALpHicPK2bMr

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_XEN_PT_DEVICE is a subclass of TYPE_PCI_DEVICE, the clean way
to access the PCIDevice pointer is using the PCI_DEVICE() macro.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xen/xen_pt_config_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index aee31c62bb..47f9010c75 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -358,7 +358,7 @@ static uint64_t xen_pt_get_bar_size(PCIIORegion *r)
 static XenPTBarFlag xen_pt_bar_reg_parse(XenPCIPassthroughState *s,
                                          int index)
 {
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     XenPTRegion *region = NULL;
     PCIIORegion *r;
 
@@ -469,7 +469,7 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTRegion *base = NULL;
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     const PCIIORegion *r;
     uint32_t writable_mask = 0;
     uint32_t bar_emu_mask = 0;
@@ -543,7 +543,7 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTRegion *base = NULL;
-    PCIDevice *d = (PCIDevice *)&s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     uint32_t writable_mask = 0;
     uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
     pcibus_t r_size = 0;
@@ -1587,7 +1587,7 @@ static int xen_pt_pcie_size_init(XenPCIPassthroughState *s,
                                  const XenPTRegGroupInfo *grp_reg,
                                  uint32_t base_offset, uint8_t *size)
 {
-    PCIDevice *d = &s->dev;
+    PCIDevice *d = PCI_DEVICE(s);
     uint8_t version = get_capability_version(s, base_offset);
     uint8_t type = get_device_type(s, base_offset);
     uint8_t pcie_size = 0;
-- 
2.17.2
