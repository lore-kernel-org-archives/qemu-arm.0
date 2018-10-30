Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440496wro;
        Tue, 30 Oct 2018 04:24:19 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eZ64OwbY2+pnrwd8pCeDcFlHbOJxGPK8qJFzDVG6eS6OSy7wQgcQtE5e7wMWQoPprF5v0T
X-Received: by 2002:a5d:448a:: with SMTP id j10-v6mr4767618wrq.236.1540898659251;
        Tue, 30 Oct 2018 04:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898659; cv=none;
        d=google.com; s=arc-20160816;
        b=O1pnk6SSzggG4mj/knGy8eVpq0XdtuysEKk4jScG0j3fTMjaOUO4L1BjAvBLQewp45
         5apGEbJHOYzESUNqK7PcoA7HAoyuwUvTLrxct5GEVyvT2+Zq+UHr5FMfwQDkdYxD5QdX
         wiDeqs0CWD57GyisJxrsgtnLWm9LDTPTfV9U5+BXEvY2/OTHLEXfdH4kVe+IPQHltW9C
         YYSjkdFQ1Ab9Np4Kg54p2gpigSlxaDSJesWqP55I/gfTCYiYM7rJ7QmXRzPFsrRTv3EL
         j2Kwam3xW5idBt/59PYqkRjLoplXhUp6037jWBXasuT4OAtWdzKHbaJOJrj/zBJXognY
         b/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/8lbiZUhaAEwbfK6zkzyHN/TffMZZ88qqoKQUb3VUkw=;
        b=NP+9/o5A23v5ZxgVO22IkEdwj7xZarmJX0jLwKE3OrwiZNoHHA3ZDxal62JJEflbJh
         NIBcIBsXmSuALbIwqctqf7uGDR3R9DIAnJmvpswLE/Pux69vN96p4sjok2Tz7h2Krn2/
         FCMl5P9r/43088MgsKcb1sftSK4I2CRFF9euRzfMbRN7KRk95peH/KRhUKJILpb3rI4f
         JLB/9RxNuglKH9YXdH7K0QUWKiwnOyZZC2ybbhBbXBs10U/atEQ1GqDF9gg/DfnqvhLT
         QVegWiIQP73X4h9jl7ADLm8aHRqYIVH5kXe3ljBeGR2nPamWE5z4rXvdL0iYd/5TVH65
         spXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id k62-v6si12825075wmb.79.2018.10.30.04.24.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:19 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4Qbu-1fbGre21f4-011OvM; Tue, 30 Oct 2018 12:24:16 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4Qbu-1fbGre21f4-011OvM; Tue, 30 Oct 2018 12:24:16 +0100
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
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 15/20] xen: Use the PCI_DEVICE macro
Date: Tue, 30 Oct 2018 12:23:32 +0100
Message-Id: <20181030112337.17973-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fEA6fEZUli6katgBcLR2UN6VP+wotM/9GE2n0cKhVL+g9AJJPqS
 aEsrP3QZQ1Z1kZfwABTc8xuERCj/NZX6+cjgovsZdIKZikW1jEvFAdRcqAE2pUSaG9Uqfvy
 Cp76U6QMb5PTUhEB7k8fjD0N9Fhk0wzbv+priZDqd4I8trza/F0LUZOaJwXOgxtPSIfO/QS
 W4/2FmL7pirR1OPGpjE4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:+0dT5Ik5g5A=:wSNQ6JljSuIwB+4s8LSxPs
 hCo43ZZSo1UY7aDC0Hom3leMsEsPOO6ley0omKGUR68uyRCqgBQZm5nh7Ax6EgwhXcrmedO2C
 4KlKvJVDBtK3QsDh56jEsDtlqtx4IIlg4z6hv9iLoVAztOZludyxI1UKODEMrYbnkRh0oNk0S
 Nr3yA3nqVSqAou0J3Oc7Hrc7j55ax47ssxPoN53YDv+EExIqB7/83/f8mL8376s+gMWdoobe7
 WUTTAJI/7b0LWmYVtTwfrMH50CgANP42Y/u6/+6YMfRUmhqHT+pzs/VETsQ4zDt+nYShhY79H
 FXlhn+pLwzX71R1e43/9R5Kp/Xuw2nooQhoqjocJNL7OQBSh37JdnzIlaswuUUOM8tjjHTVnn
 5Kjh75yM3qhRRpm94wZVaCN7enNc+w3AOJJD3cJBcvl4vn6wsJP5AwZdX4A+DTC9FlQb9TgfU
 sQ2ON/qumkenkEcXAuKIqhwfzyDyGG9M2pS5TRCLz3olCntr4f9KadPG7eRppcZCQ2/yKRF0o
 HbBed2bjuKd3HbmARIu1pqx9IsygYs8wiwxSimW/24ZcoQ6nVQsAClEmWKV6BS6maVYs7XG1G
 FwzlVncQ0WyYyT/Azl1xaH+DrguprnXMmY7Pet4nVd3YPSEw6WnVhNn1h11KwSs8rT2RldyiC
 cGoMDybGtNcAjea7773tlkLWEZYZU+1hyC8KYZSOqvCuCT+2Tnub+D9UMIVfvYCqinLO7K1UG
 wL18M3gzM+71QJ63
X-TUID: RNAV1KHoPl5B

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
