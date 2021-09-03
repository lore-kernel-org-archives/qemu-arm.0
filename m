Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174119lfb;
        Fri, 3 Sep 2021 04:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKiZYoCtF3W5LW478xJX1gxG7RVFGKPyrqEBVa2+SsrrDiAZGU0PIHXSBSxKWkYQK7Fias
X-Received: by 2002:aa7:d9c1:: with SMTP id v1mr3457175eds.316.1630667280294;
        Fri, 03 Sep 2021 04:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667280; cv=none;
        d=google.com; s=arc-20160816;
        b=gx9UplUpp/1icRkNrP+U8SCwPcCxIlXlQ7tS9KvW4e6n3Qzybvv06243oBHdccmhmu
         /eduGkPJxPGhAHwEcuo880M8+gXywQWygrAQqjoOSyb476jIU5W1xI7FN2QEmdMVYFSy
         vj+XT9ZRoxAKFA/1Z2N1VZH2voExGx9fFEhYnp0X7shHEcA/MHsTBTZufVsM6oZLXz7Z
         4qRWE94AOUw51AFf1TWA+6DuqpqMB8uFkbRYHmV3CJqbyrCrBY9Vp59mh8KcFHaaoL5n
         bj1c1jz4uBlTlazKDd/I4UobMr5/IUGZ4BasXDCwm3isR6JPRlDSYwEj/JdixrMduwEQ
         Pg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jdbGO9h9jnqrOlFY+xUPTR+ImPF+i+blj+6DLU+L+so=;
        b=UfL0tvx2frC9Y7/TfqCzAk78bZ2qsHK2ZRLXut8UFTV5ObBAfzQy6Z1RtWxLJvzenx
         4dylATYTn00ANXNQI1PGvFm4fuy5QKcOhaRlIehpCPngd4a+VwKxpgie8zQ6jxJBZ5ll
         Lu63d5h6Yg+5+9kES2AwMiTc3+1Zq0SIyVLFcUtvMGbYddE9bDsBsQkVPE6w0heJGRi6
         qMmevIgt22TNdRCUE95oVuIml7BlVM5CYLKEkjN1aRo+QEC0xzpsLi/76/XHnEdeNW8C
         Wx6JJ59Io/HnDvCkGCqDpOlEhq9kj1SnK8rsITiBvx91sWpk3Eu8a6RwkkJnkDn3rBmO
         3RTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kps/7ugD";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q1si4582702ejr.43.2021.09.03.04.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kps/7ugD";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdbGO9h9jnqrOlFY+xUPTR+ImPF+i+blj+6DLU+L+so=;
	b=Kps/7ugDjxtyTCdW8xTjS1hPapwN//3dW7TJZaSHIOGdoeGpnV+bozJ3Z/T+TVp8IIaopN
	inj2grkGyDXjNjJoG8Hh5p1IrYiXg8NFMZNxLG5onWRc6zQiZlyY1zNsO0WyhhiPBgBY8N
	X+Am8CikF9Iy7wqaJ42ycSfr2lB6F1I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-MbkfJA_BMg-vyaavsgCMPg-1; Fri, 03 Sep 2021 07:07:58 -0400
X-MC-Unique: MbkfJA_BMg-vyaavsgCMPg-1
Received: by mail-wr1-f69.google.com with SMTP id h14-20020a056000000e00b001575b00eb08so1446302wrx.13
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jdbGO9h9jnqrOlFY+xUPTR+ImPF+i+blj+6DLU+L+so=;
        b=Dv0gPU0T6MbtCqeWNzwK37uR51LS/AdQpX1Jn0v0DARNiB4c97ibfw4iYRSrHO04bT
         sTC6ztNzT5iTc/XXgtRVP+aVa6nTqphQ0ONupCFGZiAlJOJTqS+SFiMcwbPr5wkbMY8B
         q8iEPcPpwb6Ml1WADNpSNeiLWRwLjGa5uJPvissZSMUWJPMPrKVUy0/0rRlEEInxUmBK
         tk1zekTCZvW/mJlzIteHraeBudW4uq+pz7R2TfLquzEY+DdZ/a53FJaPuMAlFugpdWMI
         MoTr+QhpGGl10v9OLg0KApgpNZgkqV+nQ24mW7ZXGOQkML3t46/85lkEkjDiz5l60yTF
         5bRw==
X-Gm-Message-State: AOAM5314nB6/CQTfCB5GstNvqAaPWH8ki9+x17hewWEv/YszVH2ocmdd
	UdF34vJcjqG3NNNwkE+m9wP+h86I0d2O442g6ToPvx7lNOwYC4Aawat+JMnxPsaoVRCJu4WH2I3
	zRgrMEsDxB+5vazGI
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr2762172wmo.41.1630667276888;
        Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr2762155wmo.41.1630667276703;
        Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id l124sm4039567wml.8.2021.09.03.04.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
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
Subject: [PATCH 09/28] hw/acpi: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:43 +0200
Message-Id: <20210903110702.588291-10-philmd@redhat.com>
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
X-TUID: R0aIXC3TVrgW

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
 hw/acpi/core.c       | 3 ++-
 hw/i386/acpi-build.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078d..9dd2cf09a0b 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -637,7 +637,8 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
         suspend[3] = 1 | ((!disable_s3) << 7);
         suspend[4] = s4_val | ((!disable_s4) << 7);
 
-        fw_cfg_add_file(fw_cfg, "etc/system-states", g_memdup(suspend, 6), 6);
+        fw_cfg_add_file(fw_cfg, "etc/system-states",
+                        g_memdup2_qemu(suspend, 6), 6);
     }
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index aa269914b49..54494ca1f65 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2785,7 +2785,7 @@ void acpi_setup(void)
          */
         unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
-        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
+        build_state->rsdp = g_memdup2_qemu(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
                                  acpi_build_update, NULL, build_state,
                                  build_state->rsdp, rsdp_size, true);
-- 
2.31.1
