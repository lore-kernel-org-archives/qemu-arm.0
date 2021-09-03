Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515603lfb;
        Fri, 3 Sep 2021 10:46:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+dnj1YXw4WOW/XT/2jsQXisQYR7cxEmnnz3Shn0Q1aoj7NZyOy4rcI18cnnEGheQqSa3n
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr142771edt.237.1630691174901;
        Fri, 03 Sep 2021 10:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691174; cv=none;
        d=google.com; s=arc-20160816;
        b=yQ6diLRtLnrTDs/E+ly/etHW1RKiHeBUf+TXR3dVcFedlI2QO/QAx+e8InPY7syhz2
         baZuuVp09xH0HdnymZD3cH61vhYwt7IlA2O1wWWOEN/qg0XclV67nhMtVtZxr4Dh0M4o
         tUMIBoOxEAf4bTL8Slek+OG7ZIREX5AxJQJK7iL7qgWCqOKi6jcErK2LOnfWL083MElL
         Ktr31ZcgV9+gxPXORGf3K7r7Gvd5nZ/+fT0CRu0479WZonnU1HwHKkpojVGBw7caivk7
         shGmBYLGbEOrpLwTPVrlmoqil1eOZDJPaMJoxH7rnug0jD338vTPhrsMoo8oLslzr6Zt
         5JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nAmVr0P2f5a4xc1MIJOvBsewcON3KB/MGRqhcdH2gFU=;
        b=Uzw51t74BsRUFiEPvyj4x9NJ6W32pn3Fl3ywyRcNGVoBCX1/g3JxHTu0D5oG4/+dB2
         p+DdzB3OCbPqLrvPOv0jko6PntF/ghG4s75fv19yrc/gKwLiOTl5SjB4tk5XejHA/W63
         Os+1tWPf2w3cbcKk8BTwspqSZVLrb06OqPORaNx5vvs5frVVfE0IYVW9kwI9Y0sLm6jy
         rw0feWgikXFg+pN3XN6MueKqpc/xqOObylS7z6fbjvGQ86qJHyv+o6A5k1n0l5hKolFn
         G2B26DBNqJ1jQUOOOjmoyc99vzx0762oMCbuymkaM6CAhpOuAxqO8k9rnJsJW4OJ+m/C
         ZCnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHVcC+c5;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k19si6389287ejv.662.2021.09.03.10.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fHVcC+c5;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAmVr0P2f5a4xc1MIJOvBsewcON3KB/MGRqhcdH2gFU=;
	b=fHVcC+c5Ed+4E0N9cuB0qLPtiEm3x+RtEk6brFjmkhXwNk7r20eVWdSUw8mM9PF2HH+0SU
	hgA13/AKdsNF2L87fCZx3Tnz3MFnuCDfi0/SCdARArZ+hKPQeprSqHvCY1+QBLTxA57QmU
	2CDSH5XNuDdWqTRfbJoS+keCCB40Q8k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-CXHsU5aUMKqa3bAw0zJ-6A-1; Fri, 03 Sep 2021 13:46:12 -0400
X-MC-Unique: CXHsU5aUMKqa3bAw0zJ-6A-1
Received: by mail-wm1-f71.google.com with SMTP id n16-20020a1c7210000000b002ea2ed60dc6so53839wmc.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nAmVr0P2f5a4xc1MIJOvBsewcON3KB/MGRqhcdH2gFU=;
        b=IKQzlgRS2uFF6XOJhAWypQk3Wx12iRQtwnNZcnzZh2lqWxC1SCAdxW9syM1JSO83gd
         ETN7sZSiyCWm04bKupM0FGkk6jgmZxAzclFvPxUlBpLyJjudF7hm1EOS8GSKKFC6l65c
         cUWaE1Kt6UUzh8JTlTaVnmX00lskaUE0w/mdz9UP0txpVGlvlahZFOhlQJrnMORgN4I/
         1pIgbcGEM0yrhGOB+OasFT6zX0yEbuCxJlBwAa+jAbtJ4PgJ2LzTO0jC/Aqxif3hHML2
         o8z8WbxDdyJYxzMbsyT8d/0U5lbLVFtSpKtPIReStUdsyPdnEnDmlOSooLZVS8ZBCrt4
         ntWw==
X-Gm-Message-State: AOAM533D9LLNcHnEh/6VnkiPPn5jJgfjGnhiM/CtNiP0wLt8kLdibPpv
	TjtjneM1XQaFhPeUMBINg3nvsbqy6Fx9ExxbCiV0Z93YLVecdvi6ppzfWannMhzzJhiHGvpBFlf
	mtPEuEQxIIl6mipDL
X-Received: by 2002:adf:e645:: with SMTP id b5mr305976wrn.34.1630691171525;
        Fri, 03 Sep 2021 10:46:11 -0700 (PDT)
X-Received: by 2002:adf:e645:: with SMTP id b5mr305964wrn.34.1630691171380;
        Fri, 03 Sep 2021 10:46:11 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id j18sm5525383wrd.56.2021.09.03.10.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:10 -0700 (PDT)
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
Subject: [PATCH v3 11/28] hw/hppa/machine: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:53 +0200
Message-Id: <20210903174510.751630-12-philmd@redhat.com>
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
X-TUID: 7F/B/SpcTqJp

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
 hw/hppa/machine.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2a46af5bc9b..e602e863a7d 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -101,19 +101,19 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
 
     val = cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
     fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_TLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/tlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_BTLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/btlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPA_POWER_BUTTON);
     fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
-- 
2.31.1
