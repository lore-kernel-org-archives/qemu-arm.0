Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515401lfb;
        Fri, 3 Sep 2021 10:45:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA7+ahQMbaOAsEWZFuDfw+tivzxtDDHyvStt0zvevSy/9XS8xfr0uL5/l3gGggWaJsfkry
X-Received: by 2002:a17:906:7d88:: with SMTP id v8mr81607ejo.22.1630691158013;
        Fri, 03 Sep 2021 10:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691158; cv=none;
        d=google.com; s=arc-20160816;
        b=jm2Ie/Y8dFU9BNKEXV9otJHeOktfk4rQ8AVs1AqEwFN/hA1A8Fo3ZkjggUn96r+oHa
         5Bj/j0hvN0BOi5oIp5HxJRZlnB9YcprfEWXbNqKttQWgcw4gs2dnly/o+aikAoRmcRHE
         WXY+xRuZQtkP5WwUvU1Ptfbg4Z5u8xmS0AOvIrXFOOb4HunnXfR7phZkq2HNBlWOzIr0
         60upE85RIJRY0o2WNmpgBx1UW8D06ftIIXY7R6I0xjRYB6I8O1nrv25w9xVyrwWMBuZt
         ZNg7COWoz4614JcB9EW7Y9zvtbmg4mIsJ1paa1FU/p+6NYONtArgeRf43J6zBV4iMVs7
         fVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
        b=nLMKai1IkcR3wy3exa0qPlqO8bnvaNt1dEEW0tIHHP8Jvsgmq4zIjDTe3tlGL9P2va
         8k2h4jfru3VOe88vPRuS20siMAIgDZKA0LvOlA/5icaI0zY10gBQBzWT2OhZrINwEJAE
         lzzMHW5NkBzrhE363KueGPeWV2kSqN86ZZcwQspW31dCpO5JSGyjMoBaZjuXkf91Fu4K
         8M08HkpEKnEfainenVFdeLBz6Ae84ho3Gg3GFtgO+27AAxcugntISxcKl0D4vtjswVeu
         1/33+hmNE2Scy6vfvHS0ltSlChq7xnjYIG8XDgp9XmwaFK/j86nsZWbC1r7O3btaKp/r
         GV+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h7FHLJBj;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id 3si1205917ejl.781.2021.09.03.10.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h7FHLJBj;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
	b=h7FHLJBjnRkDuPIleL5LeoeRYVjchRYaPXWh18QyYDa+j/IZzB4NbVxbQ3jn280eytLAzE
	kGcsOhawObVEqKoqjrYqSqNxGRzhn0iQUR3hqNIWQN8EbQsIJ8klaDGT0MmqCr3Ta4uGpt
	xoAChLf2zuir8MZODrUyUhrfQMNOBgs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-pjFt2FXMNQOAutVVw-VVYw-1; Fri, 03 Sep 2021 13:45:56 -0400
X-MC-Unique: pjFt2FXMNQOAutVVw-VVYw-1
Received: by mail-wr1-f71.google.com with SMTP id j1-20020adff541000000b001593715d384so1821718wrp.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6osDXRphDo8TIq2I2JrJLj4Iq8ymwMld3GU8FS2XmwE=;
        b=SF+9MrQGDZt6lMMiceR1Drs1hKu4odXYV+rsapQLMUZbfzT8Pw731DSOB28jvBs5tH
         /hERKrXP9loOMkbkaeY1i8fDaqQZYvQsE0IaVEuCrwFhjiPBPjtPxsoFlVeutNFNHjCh
         GRdf6rJkD16FK/ATnAwUyU7ZsuNjhVPLfHDhyg1B4fplRhzTnPzwEHXPixNV2RGSMGem
         LvwKtEw3HlBbCmwGedTzxCtyXnoZdH3ouWCM3PKu4ND8alHG+0Rzr8EMGImzx2nqO9fS
         0R1Thi/fkG81C047wakkbWbnTdZzd8Vc1yy6Bw7z7th9N2fZhKCMZXhgyhouiSvfj5jR
         9L+Q==
X-Gm-Message-State: AOAM532vqdGoMMb4MHDmcpVyRUuTsjUi31wHyKoSy80+d1JSbpwDBCA+
	sfGP7NCIHuuMR72icpsKYox1Iu1IqPvPcjDyR1mItx2C0YT2LnuFI9Q6hgCdpjqiRuMJL4RX+7q
	Qtz/NHSSP9GfvJKZ9
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr19263wmj.63.1630691155002;
        Fri, 03 Sep 2021 10:45:55 -0700 (PDT)
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr19251wmj.63.1630691154811;
        Fri, 03 Sep 2021 10:45:54 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id j18sm5524762wrd.56.2021.09.03.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 08/28] hw/acpi: Avoid truncating acpi_data_len() to 32-bit
Date: Fri,  3 Sep 2021 19:44:50 +0200
Message-Id: <20210903174510.751630-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lBSexltD6YnI

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
