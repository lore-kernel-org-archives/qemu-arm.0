Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174293lfb;
        Fri, 3 Sep 2021 04:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybchnYzvKoHylXumU9DczrXJrnaFcuAwiJ9n+1HUUQlfofOqjmwQ85D2aRyzF/hr0UFHEQ
X-Received: by 2002:a17:906:e82:: with SMTP id p2mr3611232ejf.50.1630667291557;
        Fri, 03 Sep 2021 04:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667291; cv=none;
        d=google.com; s=arc-20160816;
        b=dNznDrneUcxxnAbWnrVAElkoi3AQtmIMcoZ5iuovCChmkUENGzQlMuPwb4XFcfq9Uv
         8Fjlq08Db6+wq8fYPKQFQwww87gc2eltXytZfjeJtJRW40SBlVJV0XkCJrc6wvulsuDT
         yS+jJHyGb4DdZLH4wsGuycJ8zCi5MSyw4f4DLUK9+OtbZKSzIr6MjGBPF6/hWm9nzDd2
         thhFcQNkLK9+9ID7JbQel7DJFrkhQhqkrgOjdGNMxpIB5YRblfwt2Prsg3WuUpT7DEZv
         3TxIDW0IHLsdUCGWOaUcz/0ncKQqaspUjAv14T8dGb+0F47s5HK9kI+4/nThMW5+2y+3
         /q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FntGbVxFK+XtYARw6XcNLA9NRLn2kntvBlBnFrP4mzA=;
        b=EHdmtZ2FKoez5PEr9naMJNKHbRxiVLCGGhJl6QvoBUEOwLcZZkuVEJAfBrcmnf2XdS
         iv455G70WA2WZOZ7abZEj7BliFoV9nqX7qQmsudtS7DNC/Yz8+nC79MyORegrKAKD1s5
         to9vsLV0QnywlQzrTIUCWZ9W+7OPVJPKt0d5aQejlPwKa7ecZbRxenVp1HE3SFJzvQ0F
         jGl4ZOV5G8toJ0S58NpNPTjNTn2v+V/aMFRTyhHeCXL2zrLFY4tQOKr7KRhOY8OnAhth
         Ep87rfe/4L7U5oyYfZnWUz72096vWLTdG4isd0BfQDnyDdJM4d289Zq1LgYa4Fq9iN/C
         WGmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vd51tuVY;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id se21si5562005ejb.28.2021.09.03.04.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vd51tuVY;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FntGbVxFK+XtYARw6XcNLA9NRLn2kntvBlBnFrP4mzA=;
	b=Vd51tuVY1Z9HyXLYZPURuG/6O1RUbzks88CePnvgH9EbHUJM65nkHsc+TJjtvV2R8IHmYu
	5zWiWEyym3c+cyybqLXIr7X1BlZOc9FhRFTo77AHADwTvgZi/lOAo3cokzlnvleltaVVeE
	iv3Z7xFMaVqOy9qeJNfAZEsM8nWXsfE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-CO9SY5mkP6GN3sgUeX3nTA-1; Fri, 03 Sep 2021 07:08:09 -0400
X-MC-Unique: CO9SY5mkP6GN3sgUeX3nTA-1
Received: by mail-wm1-f69.google.com with SMTP id c4-20020a1c9a04000000b002e864b7edd1so1766674wme.6
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FntGbVxFK+XtYARw6XcNLA9NRLn2kntvBlBnFrP4mzA=;
        b=X6DIoMMEnAHr0LAJDabEqzG0Z/XGlOv0AFKiGi5vhQeMD+yi2R2LreyKCx7m8A0Vz9
         endwlypvKBJgxA8vMsXZkEi09Ds6E5CXLFC4VwwrJv1TOebPS0hsvIA+FSapqY77h7qo
         fpXbjiJaMFpwt+lcXALdG4rgripefPvMfl32+IhAiMTxEEDundnWJh0VOKr6M/P3aaN0
         m2ny9SlhvJ0TLwXcDAxTDlsKge7aib4qVJeNGclGBxQ8CKoaRzX01/8U4uq85ZVaGoml
         /P2CY6P2mSU8KChqrDQVhHIinuyBL7l8N5E8+yQI2s7X7e5N5jMRSAQ48ZcOafbHAu8i
         wk7g==
X-Gm-Message-State: AOAM533uvVk1wmnPpMDsw9jaJGpAGj9ZBJOJWwO4tfpp7ML+vPTebxta
	Y94gpsDnLB6Kwi+8WZghulgufzonymfh9/zqrVmzJlSDAwJ3kvkxsIKhjJh1opyziQ1JVQ1r6Yk
	eCKnaaagy1c3T6Emd
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr7737816wmq.91.1630667288150;
        Fri, 03 Sep 2021 04:08:08 -0700 (PDT)
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr7737785wmq.91.1630667287932;
        Fri, 03 Sep 2021 04:08:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id j207sm4383064wmj.40.2021.09.03.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:07 -0700 (PDT)
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
Subject: [PATCH 11/28] hw/hppa/machine: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:45 +0200
Message-Id: <20210903110702.588291-12-philmd@redhat.com>
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
X-TUID: iwB0I4xZd2U7

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/hppa/machine.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2a46af5bc9b..058a81e85dd 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -101,19 +101,19 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
 
     val = cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
     fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_TLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/tlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_BTLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/btlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPA_POWER_BUTTON);
     fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
-- 
2.31.1
