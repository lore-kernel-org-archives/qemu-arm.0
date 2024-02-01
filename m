Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp81384ejb;
        Thu, 1 Feb 2024 00:28:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw5Miei5pjMxKI/hOuOmtLX0BJxZp7MsoyH5LBkxCaGozxj6e1CucZpdVdvqStIE58nF/J
X-Received: by 2002:a0c:9c83:0:b0:68c:6f8c:6741 with SMTP id i3-20020a0c9c83000000b0068c6f8c6741mr1566341qvf.11.1706776080780;
        Thu, 01 Feb 2024 00:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776080; cv=none;
        d=google.com; s=arc-20160816;
        b=gsHGV6vx7OF/prKC1D1IP+AO5ByiMgwTk2P1uABRBwzwvvzwc0beRqVzLKJ7ZC2Uuf
         upaIo4dO5YW4Put97YIHsU/Ey3NUp5tYbfBmjETptWmsGgfnJEOX+R0KLA2Pw71uji68
         reeKbW78JC6/uZT87SjSzS23zIuOXm8QnjB45u5xrlosn3YkC5oZK4WvRkdcF/ahs1AO
         NR2Sm6YpDlO3/kM4kHD5xlwYF5eJ/ruMwRwItAx4ddi8AJspNhcmtXjBtaM5sPY4xSeZ
         hOcdSCcQsQPGGc2ERnTFCsjkyBXiDCbZOeaqB9hu3YVGbqB7mNNOytTcSE5eYtC1nuqr
         qwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zZLFwMuKVTEWKj3IB5yRrxrSiBUAEe+2wIDYSFPdzco=;
        fh=uAGz73uMnJLVg0ksEl7lNVs7QE4H8yu/jdeM2wUOpzs=;
        b=a9yAb/1+zsRN2DA6T7gGsl4if74t0faal92mr4ZO544/pba5xdTMFMI/dv8FMHq+7Q
         cVox1VO8cYbIxSARsoq8Dsx4ulxV6eJE9ZCd/iG7HB5vuq0pUS4pb0v0sOLjaA1lBCn4
         1LrNq6rZrQ8L/PnK/SKfUFY1pEEi+8GD73Q0brjszFcGRU/MV1Mrg+j2f8M707ZHh3ZO
         cwP7hYERB2AxZi0AIgs1IprPql6plSb9FjstdAwPiHmXHkDc2y5Nfvd+NurnHoM0CdtA
         Y1SNdP/NN/p3iLOxoUlCv8mJBMF9iZaAGi/y3xkaejYegkb9WXcQXKHtfxnOY80Xh0XH
         xpAA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=AL6Tl+ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
X-Forwarded-Encrypted: i=0; AJvYcCVDA7tDp9uAE1WbWcwYb3mBb3+xTKKFbRBF05mf5RsSnFO2JFhIyymDXoEBPspYoMkmXukQgEDnZttdYMI87v4XKa9Lkwq0
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a0cf80a000000b0068c7841d33bsi1259394qvn.350.2024.02.01.00.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=AL6Tl+ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSQ6-0005O0-Vg; Thu, 01 Feb 2024 03:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPt-0005Li-2z; Thu, 01 Feb 2024 03:27:26 -0500
Received: from mgamail.intel.com ([134.134.136.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPr-0005Dg-MA; Thu, 01 Feb 2024 03:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706776043; x=1738312043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1nl3+K8pURSX0PIUZSsR4an8ZGi/KzhHvmfuQLv3Au4=;
 b=AL6Tl+ZQ6lqM+1v6+fuh7BD99V9K//CbKUbkzfZ/+hgEZrsTvgIFzyDL
 T2v1zrynr8D7yneoAJlC/J+K8u3iQ0+uxruWZXoAHgzJTsKFCmJMU0nLm
 DIqAvf57vlRudEg2LreQfWtGA1pMgo6518/gBywULjTDieA3ALjDr95sh
 gxwNn4ZvAGiRrkwENipMCJ8tqb6KuzkDWL1XhBV/6K9YrRMZSBfwdrdMs
 CVbWYH1JIU7S6eVS4exiS6M3UNt3wWNC5lqB7cbIG0FDZ6RNA2+1LXL0s
 HmGCM4CO7lCcHpEdGRZIDun2RwwImZuwk4gHxjPNuHHS2HfTXAKe8qmGp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468077736"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468077736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 00:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4348457"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 00:27:17 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 3/4] hw/intc/s390_flic: Consolidate the use of
 device_class_set_parent_realize()
Date: Thu,  1 Feb 2024 16:40:26 +0800
Message-Id: <20240201084027.345459-4-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
References: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XwTrF0r6LlHZ

From: Zhao Liu <zhao1.liu@intel.com>

Use device_class_set_parent_realize() to set parent realize() directly.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/intc/s390_flic_kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index 4d5cbb2a2fb6..baaa30dcb734 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -646,9 +646,10 @@ static void kvm_s390_flic_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     S390FLICStateClass *fsc = S390_FLIC_COMMON_CLASS(oc);
+    KVMS390FLICStateClass *kfsc = KVM_S390_FLIC_CLASS(oc);
 
-    KVM_S390_FLIC_CLASS(oc)->parent_realize = dc->realize;
-    dc->realize = kvm_s390_flic_realize;
+    device_class_set_parent_realize(dc, kvm_s390_flic_realize,
+                                    &kfsc->parent_realize);
     dc->vmsd = &kvm_s390_flic_vmstate;
     dc->reset = kvm_s390_flic_reset;
     fsc->register_io_adapter = kvm_s390_register_io_adapter;
-- 
2.34.1

