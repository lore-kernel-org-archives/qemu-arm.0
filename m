Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp1245710lfn;
        Tue, 26 Oct 2021 02:42:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMh1VwLjdrAr+hj53xKvOylya60ibF887cT0NiZeJS1kzvJ5rhJpl0R16Ofd/vwv9x6am/
X-Received: by 2002:a05:6830:31b9:: with SMTP id q25mr19442038ots.222.1635241372274;
        Tue, 26 Oct 2021 02:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635241372; cv=none;
        d=google.com; s=arc-20160816;
        b=XsG2KmFn9RQ2Qo5wsKFn6SEyTDcC61fGxxPBXs0wgy91Jvw0gY26vreKJCoG0/AH8s
         /LfASFux5YqLJciICSHpxKsNj/6u8qLTZ2o3IDluV98JV9++gylUD6uyEjR5BFLwi3d0
         K18xYJCtyRT+NCstPojtChO0jCXzdZXgOsPJ1FI3enDdyTeaBLwwx4+a+iiz8IlKHNRB
         LNTA/JU1QwsXDj376waSWcrvmcwlPXgZQGQ+BdbzrHRbWkPf7nS0f6HqDMrmNFr66f8e
         TgkMkaqHTYM9SLF8PElB8PpaZZWnauuHQTxpaTDvwY5XQCjB+1x7PYBth1h3FAWO41K3
         4Feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BmMrpYkgE/fWANKuzs5Jq3pS/XyK0/piOHbkSrbmmZU=;
        b=mnWBxLLE+xGFIzLsvFm77YkgdOgOk9D8MY1U3q7lzyAEY1GyCO5OpNoimKBpyYw/px
         ipEhoiOrxJ4cfSEnxx88LxOadJMusuVvaclMqTiqcJK3Sq50491xROnZ29Hc2IIwBoah
         lAPIiCOz+C1Vi7zPHenjOXCMmCtyeN9tsAA8RCJ/vFAnM5UJ82WecQ5q6qEyfGaSU0v7
         tO+Xh5oaMysRvC3Nea+rUIK14cYFUXLMI4+/i1X6DkrrJxdGTNWbnxhL/cCuvW9rmW6E
         ne244irq/+t+xEkVIlgHDjrCh6/FJhXLF+jaimppukdvuRAbNF7nhibXQDr4p9lUeDEn
         Vf8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wvQGtyI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si8670087oil.197.2021.10.26.02.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 02:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wvQGtyI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfIyp-00009l-GS
	for alex.bennee@linaro.org; Tue, 26 Oct 2021 05:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfIxv-00075L-Ne
 for qemu-arm@nongnu.org; Tue, 26 Oct 2021 05:41:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfIxt-00063x-9f
 for qemu-arm@nongnu.org; Tue, 26 Oct 2021 05:41:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id j205so12768301wmj.3
 for <qemu-arm@nongnu.org>; Tue, 26 Oct 2021 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BmMrpYkgE/fWANKuzs5Jq3pS/XyK0/piOHbkSrbmmZU=;
 b=wvQGtyI78kw9nVM9Vxuzg3QyJMq/9aiy4ldGAHMKdGomIiCg7qV6wDxEbf81rSWemY
 evjdhYfUYQw8ayFhl4BmjlHUnMm9g43f9qQdFnhhLAKALiOw4V0dGkVGJuDWOyKdXr9N
 LueAaqqP8/CMHsa9xI3bzJyw/0TrEUH0xlgTUNN/YjnOqQ/EAhRb2OJTHtWFUWe4cb4M
 7aorBI7gnjBOupne0P0dGBtt3+0qAcRf1RPhTv/UqGZbcC29cw7O8XWqiE0/W5HyVVcs
 uWtYPqLaee9fBl8PcFM/665wYNNorNtBt9PiD50xIsx0dYUvQ+gKJW7Ovmz7uzis/gV7
 ebDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BmMrpYkgE/fWANKuzs5Jq3pS/XyK0/piOHbkSrbmmZU=;
 b=tJhvTTag/fmPEV+lTO8NWYK7JZjOTYVqgzgkPpQz0NwS0sQoKiGxtR7VRMfRa+52S/
 use+Fz2QYevEYr555KuNbXLycj9+NM+YTmaFuzPLHKbnGKj2aBpwUyvavUV/EPUFfqsh
 2NHgo7YjNXiDZapY1g3u5fkm6NJ5fR9O+ZVHIwbgoJFvKEbIhSRdzs1jG64QbQHfrWs+
 dr7W2PXYVlOJd74pWtYZjpWbBOzQkFC8AjiTtoCgH0vda6fGdqTGy2NdZ3vB7usxCA8T
 3bWx07QTJWb8ah84mDjuVoFmr+5PCgLlZGUssdF/QRLgZJy5sMY0Ic7fFpPnh6EoSfRv
 friw==
X-Gm-Message-State: AOAM531Oae7FVoKan5zn+cqmiVSjg/4TQ47wToanH1gdxDb4dHjRg32a
 wDxWa6uoLDcCSecMeRne11uzDg==
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr7870695wmq.173.1635241311644; 
 Tue, 26 Oct 2021 02:41:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id s3sm71554wmh.30.2021.10.26.02.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:41:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH v2] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Tue, 26 Oct 2021 10:37:34 +0100
Message-Id: <20211026093733.2144161-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8yvnCs1zmhZm

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
parameter definitions cannot use underscores, because keyval_dashify()
transforms them to dashes and the parser doesn't find the parameter.

This affects option default_bus_bypass_iommu which was introduced in the
same release:

$ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2: Resending to be merged separately from the equivalent x86 fix,
    already queued by Paolo [2]. No change other than added review tag.
v1: https://lore.kernel.org/qemu-devel/20211013160607.649990-2-jean-philippe@linaro.org/

[2] https://lore.kernel.org/qemu-devel/55e7387a-4bc0-1743-1013-19c38a6ceb77@redhat.com/
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca433adb5b..369552ad45 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2737,10 +2737,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
                                    virt_get_default_bus_bypass_iommu,
                                    virt_set_default_bus_bypass_iommu);
-    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+    object_class_property_set_description(oc, "default-bus-bypass-iommu",
                                           "Set on/off to enable/disable "
                                           "bypass_iommu for default root bus");
 
-- 
2.33.0

