Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1513764lfp;
        Fri, 1 Oct 2021 10:57:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9eWfQRFWHc5fs5qmzFKLwpE+LhAG3jzEr337M4a9OLgne7S4HaX1XAi8bCvIx9zm94n3u
X-Received: by 2002:a67:d00d:: with SMTP id r13mr5624321vsi.23.1633111030280;
        Fri, 01 Oct 2021 10:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633111030; cv=none;
        d=google.com; s=arc-20160816;
        b=KXTmNDQ9LvdpZ5gHsbTpDfFEYQUn6OpUheo0YZ06K7M23dohDMm5MXYYawUDFIx90f
         WyLxETp9OmFfV4G/J5+H37F8CbosWd8wFYTkcvZcNxqFLc55XYEX2q3lx2Cohr41c3TW
         jYXzHvUCUD+8+ril36lZlI4y2L757zaovq+YaSKN2vD2OjhDoCTgDVN0yYp0lbq+/IzG
         NPrgMSVbw9bl7RzgQPuZ6IoS0NUg541p76zf4PxWExCJ6LMQKNxEb7yy0JWM26E20j9b
         iTF/SY9/MVpoVgytMrXJZgNJvp7RVchyTO6sQ4H/270vIkOwdJd+J2KnWyQ/OJTi1mje
         DTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ezcbvk/+kLD6i+tf1SI+n2SWS5P4d5inXJz75DvTmhM=;
        b=AlE5mwNaRb7eEzOsh0ZZMGHCg40q8Y+82CyaMWO/6IbpfDrdV7bC6D4aeTSBxh6tFp
         UBh7Ab+VAKSkMmtpuO24qUeFUGobwusxEumWdjFdU1uggoo3YvgndbtOy+H7RXqM9e9p
         /EBNJH8ZcqoTLHQML1Ay5yFec8+4RszoSmJg3E7hCOawYjlX+EkI+lz0wqJCSjYdyn8U
         cCO+o4qJ7qAy7lEEuBEC/gRjW+NSI7k7QFwTcJyB5WZ/699p/tJE8L9NnyzZQ35/T1k9
         yTHP+8t2EJ055qKcO/pXNKKvE9WqqGj2dl1RVGCVvHTcQSpPloYPtIZJ3SDekBf7vw+g
         kh+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ybZ9ULUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si2214448vsr.12.2021.10.01.10.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 10:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ybZ9ULUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWMmT-000550-IE
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 13:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUI-0000Ym-Dq
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUD-0000jD-7c
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:20 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so584757wmg.3
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezcbvk/+kLD6i+tf1SI+n2SWS5P4d5inXJz75DvTmhM=;
 b=ybZ9ULUbYc9FQ/tepxzqHXkP07aCwVxeouYzulmVK3/AMQ1oqtjSM4CziQ5LM+xCFo
 +2nVqlfhP9Ktj4iIv1I4iqBuB5AKLNt0WsMLcZKl9DwENLZCxER4X97euLpjomDwX+Xo
 XAR6iU6RQhAsBGeK3YHa1ku0KCDFPei5+X7mvlP3nV1aQG0GASk/2sY+YWVZsOgW9iTB
 RSMvJWQCtcDPqMmrNFnOnk+PmiYlznL7J1+xvEBepKnsV15TRW7z7gP7Movy9hfjNSOR
 4cGs88bLTehDlLwrJsX59A/WhzwAkTTMHKBC39dS2D0QteV8GfVYYLJonVvhEoksD4ZB
 UvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezcbvk/+kLD6i+tf1SI+n2SWS5P4d5inXJz75DvTmhM=;
 b=ikX3PDtoc9wzUbhUNlh956Um2mR6Okm4oJYVyj250AYoQ67pfVnLRvAta9821JQkNy
 YqRomm927eTLaejiDFsRZU/Z0Baxn3OIHZjV2YdGDRs8NiKqCW8Sz5KsD1JOWg4pe1VP
 UhatT34fprglQwD0GK2cuw8PsRTatIGJcTQG/uFJNI/EA4vYmvlxEKD79nYZyZibmC0k
 ALWbPw2gTYc4unKrvnmdJjl0GQS1cKnLVf0RplSbg2HO0PapHbd7bwkCuj+mvRc05+8B
 kBH8feTFyNFlAzhZWX+azAxCRPIjgJR9kylp+2mdwGlqqaF4UKpOZFvzBE5QeoJyYEG6
 VGSA==
X-Gm-Message-State: AOAM532x8T9XT/QjlMOMdYHAfkNIgmsT1c00CXVfKw5PymJtrlilksxS
 xhtqt/1NknYBZMlCKGjevokP3vgAgadymQ==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr6071526wmd.17.1633109895826; 
 Fri, 01 Oct 2021 10:38:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:15 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 05/11] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
Date: Fri,  1 Oct 2021 18:33:53 +0100
Message-Id: <20211001173358.863017-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJlwse8FvJvk

To propagate errors to the caller of the pre_plug callback, use the
object_poperty_set*() functions directly instead of the qdev_prop_set*()
helpers.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 36f0261ef4..ac307b6030 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2465,8 +2465,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
2.33.0

