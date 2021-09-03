Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515440lfb;
        Fri, 3 Sep 2021 10:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ/t/Nz2nBet2UH2TeQW/mVqzGNZrVSV5rv5N/YCLFq7RYQw+0TGAiZ1pCHll5626VqZ3a
X-Received: by 2002:a50:8e42:: with SMTP id 2mr173185edx.338.1630691163474;
        Fri, 03 Sep 2021 10:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691163; cv=none;
        d=google.com; s=arc-20160816;
        b=U7U+whOqsyn9gffS0lXmLap+eCMRCaKjVgS31ZA2tpZPAcAQWijUFm8ADqA1h7YoRS
         zveq+xWczQBaBVymOPRY4kS4kp0oUU7y/dM+J5lSQhwF5vzVCHWJaboLXKn6vSkWHjQ0
         zOzksPn4h6ugsVmeqfTLezVXLRcIvSMSRapafwtIuIuoqoiYPXH6rjQb2b/xi7htovaI
         co7bsO5/kBiy3sAndiuULsVncUOkwwD7Wk/AzAgcDUL/g04DKF2ld+WP7kgd7fq/CzQx
         NthRW/1CVC8YxQyE6tpBQ5yh+yHS49RHaw6cud9eSBzpW7fvMcJAN0s3T550JadCa/WF
         87lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vuT0E6Tl+Ny+4npFTuPZzaTG6opZzVO57bTMu99Gkj8=;
        b=faktMQRIPaQji6ve2vbjUMphewDTVsUiw1tpl44pWfdPhaVmH0RsDrV+aXan61qZC2
         nLcQ3dWO/FdHaVDuFzgN3tbZyicEKl9Qb09FIBqSNQlNg4z5/a3jrXpAgCyAVk8MttKV
         w64hvW+bcofpxr9r79WgPLIJkctNbtCE92CqbbKGl7vsz3l9JUZKDN8G2l9T/Mi1VFAZ
         oKntzyBtyurXGT1A80cbLpp+1V9YYw62CkLPVeBI4yzHlbF7gCohdI0Pk8+KZzzSaEwl
         rDm+GFtpuTQRtvGaCtmBn+AShbi4GL1MNtBwpgM2mO3wiLLY0GCNLmH0uVfvybRe72iH
         1snQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TcTMoLN/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f15si5836241ejl.126.2021.09.03.10.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TcTMoLN/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuT0E6Tl+Ny+4npFTuPZzaTG6opZzVO57bTMu99Gkj8=;
	b=TcTMoLN/LjT5OgqSmYz1GXrPFd3k8kB56DCaD1RqIbiv8mGUUaKeY+4O9duMu8DoLOsutj
	4d3Hm1HWXYF85yese0q1g61p0sldcUXmy4MhyjQ6gJj4vUwFHpZNOZZkid635NokiWFBG5
	8n1i6zLeRgZpOYqLvNFLzVNoXswO91s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-aNkGKOvAOCC0MG6IHvxxEg-1; Fri, 03 Sep 2021 13:46:01 -0400
X-MC-Unique: aNkGKOvAOCC0MG6IHvxxEg-1
Received: by mail-wm1-f71.google.com with SMTP id x125-20020a1c3183000000b002e73f079eefso72669wmx.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vuT0E6Tl+Ny+4npFTuPZzaTG6opZzVO57bTMu99Gkj8=;
        b=Lr0xnZZ5SyoRz1CEbXB3zzQ6ZHv9I5zf5TgNp818PON2uDaPEhWBGqkfwThVziTr1P
         iZ3bkkuIm4Xc4c1jFDd6dQnEWKTqKUTrDx0Rccbt2t4+nrfBkYLUhncQjkhn0T9tJr7I
         FxFOr+2YUDHCpCrnuvJOxBflw2k+rH2FkEsV9S/mL1hWSEzS/mmzitALKdfZfgfvqcZJ
         KDQI0SH8NEdpJtC4Rvn/+7n11PdWnaPBGQZHDiQMZ3ITNx8jYyt9leP6AcbHv3MWckaA
         06FwbhQPBJ6rmwb5UMBwwR7EVAJrx1TXBJPqviBrjJeuoMdfZIVnV/Cv6hC8jobohAKn
         S30w==
X-Gm-Message-State: AOAM5324IzAyrTNTUwZUz5kp68XvE1ARrktzjdljLvA3quop12B15snP
	/ozxQU4NHzHrqBpL9HBldDIJcbnbzTQQ2fo3+HdmI8QoMT2o6hBfRjQ3ZoQjcNu0D2aBCO9i2U2
	KZR/u5yGz5aLKfNEB
X-Received: by 2002:a7b:c351:: with SMTP id l17mr36819wmj.120.1630691160133;
        Fri, 03 Sep 2021 10:46:00 -0700 (PDT)
X-Received: by 2002:a7b:c351:: with SMTP id l17mr36811wmj.120.1630691159937;
        Fri, 03 Sep 2021 10:45:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id l7sm39739wmj.9.2021.09.03.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:59 -0700 (PDT)
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
Subject: [PATCH v3 09/28] hw/acpi: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:51 +0200
Message-Id: <20210903174510.751630-10-philmd@redhat.com>
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
X-TUID: lgptP7ykJ9t2

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/core.c       | 3 ++-
 hw/i386/acpi-build.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078d..50ee821aae5 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -637,7 +637,8 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
         suspend[3] = 1 | ((!disable_s3) << 7);
         suspend[4] = s4_val | ((!disable_s4) << 7);
 
-        fw_cfg_add_file(fw_cfg, "etc/system-states", g_memdup(suspend, 6), 6);
+        fw_cfg_add_file(fw_cfg, "etc/system-states",
+                        g_memdup2(suspend, 6), 6);
     }
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index aa269914b49..dd5c06c8cd5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2785,7 +2785,7 @@ void acpi_setup(void)
          */
         unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
-        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
+        build_state->rsdp = g_memdup2(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
                                  acpi_build_update, NULL, build_state,
                                  build_state->rsdp, rsdp_size, true);
-- 
2.31.1
