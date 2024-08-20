Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp341245njx;
        Tue, 20 Aug 2024 07:29:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE+kl9nceZnVH4M1LAKngm2XWBZEZSmOfrMjon4BKEnOyH9IZXv+R22IvTH/mkWct6XkWB4Zmnt+p5vw==@linaro.org
X-Received: by 2002:a05:6512:3094:b0:530:e323:b1cd with SMTP id 2adb3069b0e04-5331c6e387fmr10314479e87.40.1724164198260;
        Tue, 20 Aug 2024 07:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724164198; cv=none;
        d=google.com; s=arc-20160816;
        b=q9wo4D2EEf8cAvFD3OQBGvOonBUNfFK7Boiy2skuFbJkWBlpwBbANWOttCSUfXBqDX
         OWa58Rt6Ts5EDttJpy2Md0AA5SzX1sfyoD4RQjT82peFbFTWi1yqS1uvT+lX6oCw3LNw
         T4GGH+uDwNlKB4MxfO738ZMjLpGMX38yg2HkdmlireNOmhy2qBMI1dNSoNbxsrQ/hd0k
         deEq2g/sTP0TBy8OWJIYgUEkuBQ+3z+zU7Vr7/W/z2WIMGOuGsbGudJdDk1f5rHJNKDL
         Lfi4/ZVlO3eIkqeSAIiX3VB2jgC8Pb3fKa3K/vOal1UUazpzt07otOz18lVlWRT3us0x
         k9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        fh=rw0gExXJFXKi41RyUXmlDGNYPpuxXTRzfHiDsMxXeQs=;
        b=EyKfCI5VSpenvD0mbVMKmwQibrTyfXTM/1iz6mQCA7trYDIRNeWdtrfOyCcGdFQeqi
         gOL5TKEsimfXWkqoReTC9g4MyQU38Bcfstz0d+suMtgn8WK5bPW4p9dnee+BsqGNgMqu
         b2l2X+YIGJ4eTkVYktLrKjVClOP9SVsbLaL/fAID+4m05jXDzk4sj/+EGSrA0vUinXeg
         MQ+dbJe2pcLL5VPgKe4bccGkTkRkVfjeRCo4z3msKiG1blvdI1EBlIf+COO8hRzScyCb
         SS8BGn5V3AJiH3Y1Ur2hxXQPOpreMT3zndKdwP3gm+JoPCdjE7LVe7VgNGT35V+uwYZP
         fjuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QKmTtaw1;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d43054csor3286945e87.30.2024.08.20.07.29.58
        (Google Transport Security);
        Tue, 20 Aug 2024 07:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QKmTtaw1;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164198; x=1724768998; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=QKmTtaw1A7ACjLfpghGOWYAYwFo+f1svVMmMLUqOLCoBuMjfzu6R9EeMWdY5x7hJCI
         Ult2bwCcCOkyhR4kT/JwyrbDVs98IE2wF2tulyIV8hhJlih8cHOCRzudJw56SFr9Zd4U
         VtmiAlBXnX2fqKSbdnewMri/1/egVKtsV4anMNXIsOqKOnn/UgVxfgBifJyyKWR7+Zo2
         124qwNCB/iO6jspttp1Xmd3NlSpYqABM+2wAFhM0saNSxEC/Tl79UBX5HIsymzd18/rH
         IYKK5HMOPmePwY+Cqqfx0P+cYflYuo/xxrkC5hhwbStwFs4rFwDPSHuJP1eb3Eo2yvC2
         eb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164198; x=1724768998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=NCrQ2vmUFCFmIPrEfXa4QLD6tm/gnQVwvHIzu99NznrLIbqmjYetH/PkY+E7zY4Zil
         JDSS3GFEgCoPLi/fPNDry4mlYZuxi2WDn6gRU6ZMKogTMNgNOGnVvI8Gxs0W9+V6bbEp
         E1fRzs+nNoGHfXkuA2C/7GBysIkSRDEHTsqlNChdy6k22LRIL7qpo0bY0Z5FHjIwtZlc
         OqQF/JVdPmujxxZJCqogK1E0df11+rkzmLny/vjgDgZ410mOR3waMu87/XNGtoMtDA40
         NYjNjT3hMCqd03aZQzKwYDGc/mhWFnJhdNEmxS/X7K0axAS5SvFWDQ9YKP6t6wkxbDWY
         0ImQ==
X-Forwarded-Encrypted: i=1; AJvYcCVehJ21cJduo39V5CeTd5rS8honj++yuFXOmauniV8cD9SLh39fC39LjNuHAJItTkzm5yHlC4NWbq2l8K7P/w==@linaro.org, AJvYcCWX0x1g9r4v1RT3M2C4Kr2xa/LeRM0XhpRrcdjK7ugH8t1f2dK5B+FXGstMAbO3k9fu0TzYW1GOpc4jJA==@linaro.org
X-Gm-Message-State: AOJu0YzlStVPxT1A2qLWwLQQhYe6ccn8CFFzxJiDLE4Dgo4TwvIucmGl
	xc1SnsVY1A4i9/o2g9PhCFCU5R9phgFsIPfxTi+SGPaml5cLeaHS
X-Google-Smtp-Source: AGHT+IEUHrJ/SYDaIj+10HjdHpBx8iCW0Ws8VM3nxx/08/Kowr+gNMxcGQJYD8Ll+OK5SPcAIO861w==
X-Received: by 2002:a05:6512:1085:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-5331c6a2a5bmr10786717e87.14.1724164196933;
        Tue, 20 Aug 2024 07:29:56 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3b8f77sm1773996e87.72.2024.08.20.07.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:29:55 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 03/12] hw/arm: xenpvh: Tweak machine description
Date: Tue, 20 Aug 2024 16:29:40 +0200
Message-ID: <20240820142949.533381-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: patmb3evSDSv

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Tweak machine description to better express that this is
a Xen PVH machine for ARM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 766a194fa1..5f75cc3779 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
 
     MachineClass *mc = MACHINE_CLASS(oc);
-    mc->desc = "Xen Para-virtualized PC";
+    mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
-- 
2.43.0
