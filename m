Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2339035njb;
        Tue, 15 Oct 2024 03:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPPDCtectX6jSW/a/GWER/97/swBosd/fJZMgB9kqCNXolfdvjLd4a1EVMWQ3LHeUUooKZmTJXmu8ysA==@linaro.org
X-Google-Smtp-Source: AGHT+IHar8e04+fanTNfITq8OhMr2xEGNF+VTrKsbcGFOuZQhrLu6AGVn+fEEqkLTthXpzu+WsMg
X-Received: by 2002:a05:600c:3b8e:b0:431:24c3:dbaa with SMTP id 5b1f17b1804b1-431255cea47mr114110315e9.2.1728986745293;
        Tue, 15 Oct 2024 03:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986745; cv=none;
        d=google.com; s=arc-20240605;
        b=VRPFaC4XHBvCisvIyakcitQRz9nS8r6ZPKD1V3HCXOT/mQILelTRRbO96K5k6QIsxq
         unwcAX7iBqHDN+H8dQzvnO+R54FxGIaZ1xmwXsNZQh6US0fqVEYZecvNbLrd1cF74iG/
         cyAKk8til1yp+9td6cXrCCAFpiglGNfYAAiECLrwAo3L0YRYNHboAiPdkbYIYjVGguVf
         MJfIdXrY4Klnf7fLVjdPWslu9F4KRz46nx4Bg8txcYI52lJGHL24B3MuSN661oB+Yrzu
         pA77zZm27aTfn/i8mAVxEp0Im3esxFS7WDppIdFnb/DKA9v0ndWq7Gyo7/XfTHoxhHII
         8cVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dmMWluBFfNXWSPLgzxqwJtxFbzLb5gYHlmEHm2xxF8U=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=RQOaGBVn9j4zYo7bQqWQeuEeo4fQgZ4Na133proG87iuN+jvH/gKmIB9qohCDKk1s3
         cHba6BvgRTcVZAHXjgsT3B2zunnHG7RP0qA0sbxJE6TLI1F1vnm583Hndk+0/UQNUdmq
         ZYbF8ey5XKJAs56KtBgH3905Tz9V83tJ9B7WKd9mrHPu9Jy/LOxrMIARr5UCkEZnkpdW
         091eqmptJAVgBeKgyd+iiqK12+fkf3Izkpr2Cle66XpI0OftqO3+oeVQ2mRFCxD3nRoG
         U7qe29fqXJo5YeBLEHAjP8Yyr8XJncd3DYtEEiBSOK6EpPSElIA12vuc72ydO4ucqsq9
         uBjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fc06b99si559611f8f.229.2024.10.15.03.05.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV8Q1jZPz6K98P;
	Tue, 15 Oct 2024 18:05:10 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F435140AA7;
	Tue, 15 Oct 2024 18:05:44 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:05:24 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 14/30] hw/acpi: Make _MAT method optional
Date: Tue, 15 Oct 2024 10:59:56 +0100
Message-ID: <20241015100012.254223-15-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: jiT8Ka3F0N3R

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The GICC interface on arm64 vCPUs is statically defined in the MADT, and
doesn't require a _MAT entry. Although the GICC is indicated as present
by the MADT entry, it can only be used from vCPU sysregs, which aren't
accessible until hot-add.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index d34c1e601e..2cbeedffe8 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -731,10 +731,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_append(dev, method);
 
             /* build _MAT object */
-            build_madt_cpu(i, arch_ids, madt_buf, true); /* set enabled flag */
-            aml_append(dev, aml_name_decl("_MAT",
+            if (build_madt_cpu) {
+                build_madt_cpu(i, arch_ids, madt_buf,
+                                true); /* set enabled flag */
+                aml_append(dev, aml_name_decl("_MAT",
                 aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
-            g_array_free(madt_buf, true);
+                g_array_free(madt_buf, true);
+            }
 
             if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-- 
2.34.1
