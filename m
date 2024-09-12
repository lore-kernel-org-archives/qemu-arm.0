Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422663nji;
        Thu, 12 Sep 2024 00:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlv4fo7Utw9I54KjIaWWuDlnnxEFilqs4gnLZE+TK1FEMLrKoVEQ7MX9ipu0jViDy0FCwIs9d2lNQoyg==@linaro.org
X-Received: by 2002:a05:6808:1293:b0:3e0:42ef:5dae with SMTP id 5614622812f47-3e071a9a45emr1915874b6e.14.1726126820167;
        Thu, 12 Sep 2024 00:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126820; cv=none;
        d=google.com; s=arc-20160816;
        b=jz1YplLLbbq7UXpF2n92hG99IlHvjm2ZACqi1Fu73P9gIeF3O4O8YGoTSiXAvkzrCL
         YQJZGPfTE1mbP6oTyH9rQ2E/TU+ZE9fIxr6xO3x90l+2E8QU1lDtKnnYSNuTkwKoSzgr
         RLELFZdisKAikpDRs39ocY9GmDqyvUPAcrnPLvtU6/lxLREWSxlFLshtAVuoUMJkmxIc
         C5x1jhYQdxah60IndwplyF6le8HfBgrtoMbxzFBFrIM1iSOWmYKvA7IakRfM/FqIcXB1
         dRgipejqCpvCQ+yHTiSgYeAZVmqDA9Zi846Gd1jNtEx0+fP3ku1dxjSxcOohNx8KGirI
         /TkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QDay2TYnrrMfur+0/EEHZALdjurI2FyW1zrkZGDuads=;
        fh=UGxwk0FHDfjDQNPLj54p3247mJPG9c4HWJ1lVqzwTHU=;
        b=ph+4SqIO7Hf0RMHkZyk2i4Tro9evFndejOMAzb0ByM74jxPkzNbsXGMCtD3Ye1rcgl
         3XukBKN1Dqn9yy++/dApyp1m959IXlqy8nxnUUsxtmypFtPliAVSTIOHcWFOM3S7sDcc
         SEb4wvkQ7Ar8W7lCugq7/soPvmzXfhWKlLcrAPvpsGJsDrJzwHAry/gHQrkxV2KTLBQ2
         4WsTlKv0YyHf5La8wcLyDbMgLzntG4gftZgmQO7LbI32maENURb+GnhlBR2lV3vFlGoW
         CfhFWuosePjYBPl6epLf6W9S04NpuLEinQ8eOPGHxDUgXWZVzQOD/r4M2kE7qmprjEjK
         gFPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+ByF4fX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e039bdd92fsor3336404b6e.16.2024.09.12.00.40.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+ByF4fX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126820; x=1726731620; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDay2TYnrrMfur+0/EEHZALdjurI2FyW1zrkZGDuads=;
        b=l+ByF4fXehOdOdGyd6FmuijHnFcaP7ABdvMOXzYoO/GfN1mJZ3l6KLDQwLiwXHwin1
         K4LDDGqzuA/KwMyamcTsMkxVCAFX2e8Qmh8B69G4eiJdgJdJtOvQetW1fne35N0d4YhK
         59yrw3uNPjbw8F/aVBTFMmdILuDTtMlb0kMVZSyUz6bh+Hp9xCR4InONYwXfTNoEAs+a
         FBNxtIGH1rC3bifJMbaxY7Ty6b/Pfvp1dCt2IQyhskuiYhxZzHTn8VQEF1Jtz2ezJ7t/
         yv5oRRpCj2L//Pq2kY5o8HV8eXshh54su7Kt9orIYkMhyr8IOqB08ZleXjpnSKDuGCps
         HmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126820; x=1726731620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDay2TYnrrMfur+0/EEHZALdjurI2FyW1zrkZGDuads=;
        b=jZXXMvsn73EX6GXHtkhnYXARHPIDthJqxuETKpqR1mZCh4DGjAURNrPXb/1nScjf2B
         YpYNNSFZJLQX2XWxAgkRLZRnF4os2H+lNd08sIc3HEAfV237tBcmv2YW5tj1pUbO1U/2
         cmYb+OWjZh9b9ZeMAcmyrmfjTQzPC89CU5QwfuKFPpty2i6gWWsI9gjQ/TYAODbGTXui
         NRjdXBoyDB94sZmlxFDZ+HgLjS69FLoPEG7SYUnb1SWailvi1ntI7o4m4dZhRdCXkPkR
         0THRIKvSh2PCxLRaBkkBvPDNJKlc7Ri26Smss+OYKFXx2LClTyL8Vam5YiZk0UXK1zE/
         MfCg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ29vqNvuYntpBTIAqin8pF74K62YZbKrvrY2FV36d3fuSJgycKw3FIF2bQpiDzNvkfEnhz5+h8eDuqA==@linaro.org
X-Gm-Message-State: AOJu0YyXWPNzmbsLXS46A0XRayh8cOEgpQI+O91GLAYxI2ZEI2CuEKhi
	5PyZkJl1V8/wkuQXBuXJ4QS9DxLLQg8niRcFq2hFugmU+zpgizH3F/lN6UtRIzjnlw==
X-Google-Smtp-Source: AGHT+IGYhbpRKjr9LXlf6ua3NjBjcAj8nIFkkfD9zPLBPpLzylMLlenLFQR3rSDBD4RdwwuqK2vzTw==
X-Received: by 2002:a05:6808:1290:b0:3e0:41ca:1443 with SMTP id 5614622812f47-3e071a9a491mr1814477b6e.16.1726126819675;
        Thu, 12 Sep 2024 00:40:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 20/48] hw/ppc: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:53 -0700
Message-Id: <20240912073921.453203-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D5OtdhFkx7rL

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/ppc/spapr_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index cb0eeee5874..38ac1cb7866 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
         /* we shouldn't be signaling hotplug events for resources
          * that don't support them
          */
-        g_assert(false);
+        g_assert_not_reached();
         return;
     }
 
-- 
2.39.2
