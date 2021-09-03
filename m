Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174072lfb;
        Fri, 3 Sep 2021 04:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzx1kx2mPFqo71XObBScrlEcpdEffPKFI+Y8fSwqq2+4RjjS2CW9FPOmoZ6V+YCtwRqrq5
X-Received: by 2002:a17:906:4c89:: with SMTP id q9mr3616826eju.118.1630667276497;
        Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667276; cv=none;
        d=google.com; s=arc-20160816;
        b=zyK3AbEVjh1sw+RvpXCGVPm6F19VhpTBiYucnqCu3qR+AimOAsXvzkpdzhTOKPLcT7
         X0JhmURY5YVE0c5VXQmbhHocSnNsEuVr0bN5xoL3WepIp8nwsRQ/BZ/gkRX1OXMYbEgI
         RgMbRualBNuiJT58334SMSEdENxEvuh4VMBcFrR8+6MaYiof0FaCoge5gj8uy0KBiUhh
         g8CrxDXLP0xebZyJhGMvk88/WXinoGAtflkGrn084xsHmSoTSnxsfKtYEPzY6aCRQi+u
         4tHVMr96a6TP4zFq4ruYmP1wGidify36a154o2lJjqHBH48G6y0RqCR7uX3cdMnox8vy
         p70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
        b=S4OdIXR2DXD/PS+FN4ee+KTjjqp+RY+u16RnzVZS4gpGxAjmoJ8yZ5NV0RJm+FMvCu
         Qu3waZNxgHlEa1QngZ6MmLyvq5mye0X4gPy8JSnXji2nxA69vwhKoVJNBrHq4tLMc36O
         Z96WJ4x3sb+eYYTygNlU//gc5eadDNSI5ANBUrBWcTPe98tsnwQQOV48U1d/7iDe/tOu
         h91nCQEpDLaeN35TpVvLsyW87ZcQSEkx1/gXWAMZbaiqC/xfSQSr+7R+eCFqQEaMrG5V
         jMU9WKZeVky8CxXmNzzhiTwz1rwuQKaxPNwe2mpoRspgt6iIin+NL7jE4X9pR9SSd7Lx
         bz6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/RsAjjm";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h15si5150568ede.550.2021.09.03.04.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/RsAjjm";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
	b=K/RsAjjmcwmdhv/Pljpc4h1QiW26qVIPBPaNE/pw0ByKbLGpCTQ2QNeglA9Pob+TmYtSSY
	6XKRcXQ/XSbxJv6qWuWyWUcRbM3p0VBDvRB0w79+KmvDgB+vo8g0yoYE7P9n8zUeErjmhN
	tvhTwyFmPenlQDC/tIHmnOCcFhcxnxI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-zj74yHxEM_GXx85p0K2--g-1; Fri, 03 Sep 2021 07:07:52 -0400
X-MC-Unique: zj74yHxEM_GXx85p0K2--g-1
Received: by mail-wm1-f70.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so2511736wmj.8
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
        b=lArvgDVVvtqJWuJJl/g9lMljheTeQ50fXgcMlBhKOuylNshLG7+ES7gy7UH5PZGltZ
         3LBV8lLJ2Twbyj4ONQvF+2keLt8C7Bsbw8YJrcKRAied8CziZ0zfjC9S5fL0syoAEsii
         b5N3+GPI5l8kXla3xUvp07WZbI4Bhs8EGlu16OeEXX+Wr1h74JlHY9bohtZzoijpVA6t
         mgVQHqRS12dA5c2wED+l1kLJAqs/NeIdv1elh8SbxRGMxEhh0rjXyY0nNrsqQugPGhcd
         zzlkgrw7g1fFpgqvXQqF17+muYuEX/IPTsLtJ8dWWC38aUGgfuogc6B79sPzqEQH0eHx
         f8vA==
X-Gm-Message-State: AOAM531DVJXo+JhnTi1DnxOqWqFKSR759LaIK+MO+6LaNz8c8lILSQ4Y
	MvqM62YhD+7B3q+DtH55PyxVCrbiXN79avn7oCeWWKqSPx6tEr20fv5Kw0oQaCbyoTC5bSPXS35
	gcNOA7tEXpQBmldyH
X-Received: by 2002:a5d:526a:: with SMTP id l10mr3307829wrc.279.1630667271416;
        Fri, 03 Sep 2021 04:07:51 -0700 (PDT)
X-Received: by 2002:a5d:526a:: with SMTP id l10mr3307771wrc.279.1630667271215;
        Fri, 03 Sep 2021 04:07:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id b12sm5141598wrx.72.2021.09.03.04.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 08/28] hw/acpi: Avoid truncating acpi_data_len() to 32-bit
Date: Fri,  3 Sep 2021 13:06:42 +0200
Message-Id: <20210903110702.588291-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +mJLWsl6KPpn

acpi_data_len() returns an unsigned type, which might be bigger
than 32-bit (although it is unlikely such value is returned).
Hold the returned value in an 'unsigned' type to avoid unlikely
size truncation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 hw/i386/acpi-build.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82c..95543d43e2a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -885,7 +885,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 {
-    uint32_t size = acpi_data_len(data);
+    unsigned size = acpi_data_len(data);
 
     /* Make sure RAM size is correct - in case it got changed
      * e.g. by migration */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e1..aa269914b49 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2660,7 +2660,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 
 static void acpi_ram_update(MemoryRegion *mr, GArray *data)
 {
-    uint32_t size = acpi_data_len(data);
+    unsigned size = acpi_data_len(data);
 
     /* Make sure RAM size is correct - in case it got changed e.g. by migration */
     memory_region_ram_resize(mr, size, &error_abort);
@@ -2783,7 +2783,7 @@ void acpi_setup(void)
          * Though RSDP is small, its contents isn't immutable, so
          * we'll update it along with the rest of tables on guest access.
          */
-        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
+        unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
         build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
-- 
2.31.1
