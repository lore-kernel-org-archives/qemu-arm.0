Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161518njg;
        Wed, 18 Sep 2024 21:47:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3lNd0RJpUW8tudnBb9vF87ZoEclRGEkh2HDAGL/U8H1q4fvjH7hovmMleuOO7/fkqqfgtBFDP1iK0AA==@linaro.org
X-Received: by 2002:a05:6a20:b598:b0:1cf:4ad8:83bc with SMTP id adf61e73a8af0-1cf7624b3b7mr34572983637.31.1726721266476;
        Wed, 18 Sep 2024 21:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721266; cv=none;
        d=google.com; s=arc-20160816;
        b=blHilT6cnuEj2TYbRxWOisRK8UXn3kAP2T7uG9QbIJG6WKM0lsroj2/HQxRCln8RW0
         8IPZmN1p4AeDb2b7UTb5tefsHhc9N3u4znpjVinI0Mk44Re+pJm4dBKw9V4nQt1y+K0U
         aNNbLeJ3C4+Xb2pOazwII8uPdMSWq9/wfPezLILJYYtSWv0lyhJsuQaXPwE9H+N7qHBx
         v2E9ZJD6tjMxt1yDTV5nYknykk1yGlH/XcfqElPkhIY/vvPc5uH2H29PH5xpMoCER2x1
         SCemrbgx+167iufACCLdPg/3jon5lqPwnapMDZ1DvnNsxx5WfOEVAdZINu6wTGYR2IqZ
         ZoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ozWlgV20eXCZ0c9b/13N/LAwE/BLpMMoDcMJfurfVNw=;
        fh=aU/p6mpzIY1OSHE2a35F/Ot4zyGQ/YUbsINQmlQ5MGo=;
        b=FbNT3a1maDkTXQswzxPsdnZbzai8UqdOfJE68b6TL2i1bE9PEF0DVlv55Z1ODBMadN
         iKWh0T1ZPzhmFSbIVin2LvsVbsTqxvyXTZIUhL8E+/n2dyuud54+UCFatwaB1Xvmu/gQ
         TZm+wk2jAqh9Zt5p6QGX33gVX1DRomJhJjSYYxPI/5rcAbCUKn2d/akCZ1AdjDG6gkEu
         t++FdCJ6AWK/EU/qj6Huwwl1X/srE+I86wR8RTLqlhUT3afR/S7UxAB/Kw9obi8+0UdO
         klLcNZPmXxxySzbSbV9bEz3/6KEUKLE+8U3aewJABYPyrEi2v7K8O2qXJGjUEv/XHaaE
         5+yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=accJmRkA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db4986bb69sor6404076a12.0.2024.09.18.21.47.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=accJmRkA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721266; x=1727326066; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozWlgV20eXCZ0c9b/13N/LAwE/BLpMMoDcMJfurfVNw=;
        b=accJmRkAwGVOsUsmUHPbThkIMCsZUt0QRtSnaoPoAal1AFwEhzj8dd/55KR4HA0gnv
         lVeQMbgbpoVAIG0tNcauWzVJRLnvByq+2vHtpSC8nuUo/7dK0G1zHeIhTIyuqZZvO5Dy
         z9e9r1ZxkA/v7KEQI+HfaOZ3jvgICXksZosHgLHlibBr/rP67E7wqjhO0PcIIoXlNtF/
         oZ4dcy1PO8SVuX7YrOM3nYfb2xq0hw2XVwbZmB0HrT3t9v0I6pVt1c5vKOsax9dccoSf
         J4cCH7x0ii2UNtVJM4XGc2wwpZC/5p1tj25zoCXAJhc7C2dFMxyN/oDIb4UEN2YkWtve
         +Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721266; x=1727326066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozWlgV20eXCZ0c9b/13N/LAwE/BLpMMoDcMJfurfVNw=;
        b=kskZg2hY+HOLbc8ESw2s0h4eEin409vWbHGg1WlH4oi8QZYQxZoNFyhyXuLNMGAnDi
         hca+aoNy9/01B6d/yFNB6cW9u9+r6jjrnQwdXikVOrkQiD98ErkZjSxUsN1TzKP4oU53
         uLqEeJ4tqW3An9tj9/rNl5EazKnyCBqDHbIjR+vsKWNN46Pine1cKZdIMlZHPBhMuSqm
         qmKO1LSXdmaUG6ZLT9ERg18Oc53iLnv9rpnTd8qzkzRBrTMT98m/TLXEFpBDM1BUQeOA
         9TdO1miDsN3pmxGg57TQGa0+eJGUfsHJnT0ywHRtX7cgJ53r6WlDPLVEVJtxus6CKO/0
         q8qg==
X-Forwarded-Encrypted: i=1; AJvYcCVJeWkf3//OUM8NgLUga+yud1U58LrqaCtpMd0T1iljzh5cGmHg9Mkc4tm32JQgmYg55+hjKPwkaqHcXQ==@linaro.org
X-Gm-Message-State: AOJu0YzPCwhU/5RDUXczcFzt+WM9U5SsH9PONr5O0wr+1mW5mcpjlPSJ
	saCsDMi1MOWJ1ZFn/JR2eCy8XVSCWfEkU9yLd4B6NvqHUDIun/nkUOcHGv0sIZpyeg==
X-Google-Smtp-Source: AGHT+IHsHP2GkF8PiOM9Z52fH8cAj4VN2oMaI0BFSJQoP5lyLdMB2INYK+7wocFS7jMYdV3UCDnxug==
X-Received: by 2002:a05:6a21:38d:b0:1d2:e945:77c4 with SMTP id adf61e73a8af0-1d2e94578b5mr9976706637.2.1726721266025;
        Wed, 18 Sep 2024 21:47:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 30/34] migration: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:37 -0700
Message-Id: <20240919044641.386068-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: s2oiGoKSfb54

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/dirtyrate.c    | 1 -
 migration/postcopy-ram.c | 7 -------
 migration/ram.c          | 2 --
 3 files changed, 10 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index c03b13b624f..5478d58de36 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -229,7 +229,6 @@ static int time_unit_to_power(TimeUnit time_unit)
         return -3;
     default:
         g_assert_not_reached();
-        return 0;
     }
 }
 
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index f431bbc0d4f..0fe9d83d44a 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1412,40 +1412,34 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
 int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_ram_prepare_discard(MigrationIncomingState *mis)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t rb_offset)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
                         RAMBlock *rb)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                         RAMBlock *rb)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_wake_shared(struct PostCopyFD *pcfd,
@@ -1453,7 +1447,6 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
                          RAMBlock *rb)
 {
     g_assert_not_reached();
-    return -1;
 }
 #endif
 
diff --git a/migration/ram.c b/migration/ram.c
index 0aa5d347439..81eda2736a9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1766,13 +1766,11 @@ bool ram_write_tracking_available(void)
 bool ram_write_tracking_compatible(void)
 {
     g_assert_not_reached();
-    return false;
 }
 
 int ram_write_tracking_start(void)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 void ram_write_tracking_stop(void)
-- 
2.39.5
