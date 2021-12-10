Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1552709lfk;
        Fri, 10 Dec 2021 09:11:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAKRCGd1wRfe/A5EKSQZ27PkHgaJoHrUl4NslEU+ED6FmU5iRwkuI/PHX61gX4cl8p5JZ0
X-Received: by 2002:a05:6214:76e:: with SMTP id f14mr26277257qvz.18.1639156299833;
        Fri, 10 Dec 2021 09:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639156299; cv=none;
        d=google.com; s=arc-20160816;
        b=GW68xycZB7IjUmkNsnjdzxTiR+wBGYSfdt5NXes2TohlBw2PQh8t5JqmDNCYXDCAqj
         u7e+xRWPq+DMmWz+nm6PfksQAsCprtJKy4f/QA2Gnm53gaQdOOcCU0zME8/CXmxxotun
         WwAOmGTBQNwv4IfQHI2q38j2lJZIuDbeMvcc1oEn6bNzYRjKhwu0CKQLHZng9OIRNoKN
         FUdws7XtZiggMYQdAMHnUAhFNLZBqCWs4RsDcY64YsNr73hKPjT+BnCqpIsE35P+91HK
         kSDjVTd4ZBMutKyPNE2Shvnya49EQhg+xCSDg2Jxzn6KAGUjz0CevAaFIBy4mX22MX2J
         t0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9IY62PSTotbT3b2mMDMBqrDCdhq+HRJSuGZ7/M2iISA=;
        b=i4R4pQdeXReVX1y5kXYkZy5+3z3/UcAigfUPOsl1vYOJuZofZ2TbUnp09sImlrAeV4
         jRGNrRnol+IPYVTMmbVUak0emPfj460GFN9p2AH4TEWeOzyoYXleZ+CDv0IHxwV2wTSk
         hDsUeUZmfy3K5vW3PE5PM0tHOfuhQt7q/f+Or2DequS+FRUj4ofszsuI0JBJmdzHWstq
         a9YZCEN+/eTEn6VhNohA612mpfl7F0X3ZE59Lgnjj2d0+I/HccqCb68BIWQZapJhHIcE
         GD9fcASYE2OZuUq1qgjrKVYwW6VsdNI4KOhyhkX1VysyrNh/GUhA+0iBEBs9lKMsg7C+
         XrhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MlAyKg8S;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si3769906qtx.768.2021.12.10.09.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:11:39 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MlAyKg8S;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjQp-0006fw-8X
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:11:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0005qN-Ax
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:07 -0500
Received: from [2a00:1450:4864:20::531] (port=40667
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLN-0006Sm-5m
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:03 -0500
Received: by mail-ed1-x531.google.com with SMTP id r25so31500445edq.7
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9IY62PSTotbT3b2mMDMBqrDCdhq+HRJSuGZ7/M2iISA=;
 b=MlAyKg8SpwxLFbiGzhFsztNym1SLq9kk7t2etxKr34Lx7YrifeLKMg6VzgD0QiHogx
 Gc72utugRJ8cxf9eI6jFMQ5dPdxDHl1ASkEZ+zNWJ+wBXNVrDG6SdhG89OwyVVROfxGj
 GOVndXUBR0WVb0bI0mhfa/yYEXa0IMtwCliHAtxVgrKVFm0URKKgMQoF7Tmc8hPlS7wg
 YshvxE47j4m+XTWvDZj1mEsejKm/IwcQQ4FJX5dMolRl+6awNmlGFs/mmJ+6pttzxbOH
 YX3xGcedxBdXtp787m1QqsV/5SvQojBLjx4NHJHSLuw/1azHORWUM1abrVlJYniiL/4C
 UmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9IY62PSTotbT3b2mMDMBqrDCdhq+HRJSuGZ7/M2iISA=;
 b=R3QoH5kaaitEU/g3qnO6i3fIDoJEL1AeSuN/dTBTpv+fWKNH6rLikA/N7AvgH2PwGZ
 15A0XLeMwSrkLew18LHb7zvNKgMs/o6kC+rNE70ET4hN6ZhvSoDfh9K/esFb2svuUrbA
 RNf5yBAD2fCQGMGsddV7XAj9qNMNOBLDG/59PYCenUOCPi+Z14+KPSJN8KrR75IHJBNf
 Y3JQjNNFn06ZVBFUv2f6kLLiZr2hhDfTrG3zR5Aj8yvdgGuyIHl+huSP+2dG7WiYNiKO
 BhbuzXhY5fGjX+UbzSZfD8xuHVJP1AsOTKxAEE99qiPV8jyXyWuGwDRM3G7lcE0EoozZ
 qHJw==
X-Gm-Message-State: AOAM533RQ7fVMaGUJMhKYh682xqiMj78oXh/A7lr6swTp0t3LQsqoEmo
 Yp2X5HQmlKLXua0g0yOWtyKl2w==
X-Received: by 2002:a17:907:160a:: with SMTP id
 hb10mr25801855ejc.83.1639155959337; 
 Fri, 10 Dec 2021 09:05:59 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 4/8] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
Date: Fri, 10 Dec 2021 17:04:12 +0000
Message-Id: <20211210170415.583179-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pjHj0uXrriVy

To propagate errors to the caller of the pre_plug callback, use the
object_poperty_set*() functions directly instead of the qdev_prop_set*()
helpers.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 608a0a78f0..6b51e8ad10 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2518,8 +2518,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                         db_start, db_end,
                                         VIRTIO_IOMMU_RESV_MEM_T_MSI);
 
-        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
-        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
+        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
+        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
+                                resv_prop_str, errp);
         g_free(resv_prop_str);
     }
 }
-- 
2.34.1

