Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp897309lfy;
        Wed, 19 Aug 2020 17:17:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQeHTZkUTAUuvHBW3et2pes0cFmgqUsRI9sas9bKvYJkK0M7vEfUGr5SbqOMqACYfOh5rW
X-Received: by 2002:a25:c6c7:: with SMTP id k190mr1299238ybf.166.1597882636728;
        Wed, 19 Aug 2020 17:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597882636; cv=none;
        d=google.com; s=arc-20160816;
        b=OEZKqDBoi6ccYDhK2rkuAsMSiFr8n8k39gkbpQWy/BPT/+ZeGC9QMMVqSEuhaoBuWr
         9qccKYHPUlzu9dOQYtuimh0Ak2LJorjTRoWOeBsCYGzD65oSgbEkhTn9RH0a6xUgs94k
         GZl9UGyI0OmcrYfFAs2eR5eGFuqWqfKsgYAx8cV4sOew+9AE6lZ1A8/kG19SAzuxuRo+
         j9kLs9U/Jkqm6RQOsrTanhONo8puloE9MvH2+l2Efg36XhNhLAIesTijOevxek4ZV9y6
         y2jg815zn8lp9NdWY1oIWw90nP5hzii5Ww8QgrNvnaeHmZXOniUSOaOBhAFV/yX+O/u6
         oX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+jgA8dgE5sort/nWACrbkzPceqpQedWg+RAtiLHen20=;
        b=Mae8rjvgH/pXUDbtNRT+atoerN8ZhBXTAzUSHzawrskUNvY5Uj2e3QPu3M9qpGa/tf
         Qc0PHVJIyXQcueeUT0N0JY58M48nN3n2U8f+Q4oJhvHBqQA3t2f4p1ot/NNoGshnLGwH
         NSkFHtxEp3nMpqx08avGwrhN8Jmbq+cb4C2bfU7QK4GsziTn4Ag5AHcTrtKyvhFVCh5t
         OogHxsla5tbbwtLPW1EdiKpnKX3f389F2lTfDd4/JsI6txyK+pjy9ZV9UjzLVQ60Z46J
         AAZb0mAB25IyIjafE36kk53RT5bkqD+w+Bm9j2Kh90SzYHScTEGr56lpdrN80f45a1W1
         h5tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NGBiYN9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si393082ybt.76.2020.08.19.17.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 17:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NGBiYN9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8YGa-0004Y2-1l
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 20:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCd-0005RH-VO
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 20:13:12 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23898
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCc-0002Ks-1V
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 20:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jgA8dgE5sort/nWACrbkzPceqpQedWg+RAtiLHen20=;
 b=NGBiYN9SrgpgnXoINpw28rAuxZRapZe9CDFRV9UXxDMrvOXu4BCUFeRLEa9A+sHYWgZgTf
 dH/XozF0ISyfPWiWAn3KpEGB9JiJ9R8S7NnmBO+WWWlvsy8kcUAhgnUN7vB3UV7+KkzwXL
 +ILIWfT63MiTPPeu3MIfyPpC9sV+KUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-4R8RBepJPNaoC7wFWPUs2A-1; Wed, 19 Aug 2020 20:13:07 -0400
X-MC-Unique: 4R8RBepJPNaoC7wFWPUs2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48C2510060C2;
 Thu, 20 Aug 2020 00:13:06 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1851B5D9E8;
 Thu, 20 Aug 2020 00:12:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/58] versatile: Fix typo in PCI_VPB_HOST definition
Date: Wed, 19 Aug 2020 20:11:49 -0400
Message-Id: <20200820001236.1284548-12-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 18:27:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkCRsTplNufX

Fixes: cd93dbf375bd ("versatile_pci: Update to realize and instance init functions")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/pci-host/versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 616882a80d..7e4aa467a2 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -161,7 +161,7 @@ static const VMStateDescription pci_vpb_vmstate = {
 
 #define TYPE_VERSATILE_PCI_HOST "versatile_pci_host"
 #define PCI_VPB_HOST(obj) \
-    OBJECT_CHECK(PCIDevice, (obj), TYPE_VERSATILE_PCIHOST)
+    OBJECT_CHECK(PCIDevice, (obj), TYPE_VERSATILE_PCI_HOST)
 
 typedef enum {
     PCI_IMAP0 = 0x0,
-- 
2.26.2

