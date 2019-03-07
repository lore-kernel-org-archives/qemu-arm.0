Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7216247wrx;
        Thu, 7 Mar 2019 06:37:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxN+agrYUL5YY6H5QEfoYdC8zQyJcRPRFLwjh6LbiyWneTlYg9kq5oustjWd0sUvHEJGmtQ
X-Received: by 2002:a25:738d:: with SMTP id o135mr10912967ybc.278.1551969467291;
        Thu, 07 Mar 2019 06:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969467; cv=none;
        d=google.com; s=arc-20160816;
        b=WPtBDnV9YLZDuOdLV7CYB8ioDSIL3EEYfZtg+z7rQWTF5lDL3pMc8meTm+aJRNmSJa
         GLAVKZzxLWufU2H/w/zQsairJHF2n1cnJ3u8nVDzsrt7B8WtFz6hO6LBjpZVu0xFjjoz
         5dSOLx3Rm8hTMuh5OnsFUWbnjqbTJEWSQpEZ5QKZxlFcXnXXBpzEi6IvzDdi0W3MR6et
         9fUf6P3mrVFyouncijjejGX2jFx7ANLIjJhxJ4xhnR6GOpAt3Dkp+Uv4R7WaP5tRBJIN
         af6yv4wFifKZe3KD3h6L1f8sdaD4wMIQl4aVC/byBeuXl1Gd+cdPJHm20NRdXcdqG8/8
         8L1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=veSmEB3f9bq+V78z4qP6flA40cLs/f5Qh9AntT34yyg=;
        b=rgsi5s/oUzO6RoJ2N7JlCyfeC9HITDrstQ3QgZY2OhSpEmFXv9cNSfMbh3Vrjmwu68
         0bmt7Yq+eWVrVR+ULDyVqpQ3JUqghcKsiAP1nmlK7xk/Bk7txV9gKIjTNKYZZoOSpjye
         /OCqBhjf8DaOocGjRDqNVwetjVQIWxiqOoJMMrALCzXR+jqaQq4fyt42YZbAv4yoK4D0
         sAiMB8iVmO3Xja0CSRceLevj1qYz9er1yiNB7iSm1JBdqVTt/Iwx+nVVDb3lgaiJGeV9
         ijvWxMWxrHakbJAUnLoE4PO7l6tY3PaxTL1EIF8M6O/I+622xR5HtQq5/9OANyXRngwj
         GLNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si2963885ywa.316.2019.03.07.06.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u9a-0003Oc-LD
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:37:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuy-0007M2-Jf
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tux-0002ds-Vd
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tux-0002bU-Oe; Thu, 07 Mar 2019 09:22:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 765B786679;
	Thu,  7 Mar 2019 14:22:37 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58FFE51674;
	Thu,  7 Mar 2019 14:22:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:52 +0100
Message-Id: <1551968334-18982-28-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 07 Mar 2019 14:22:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 27/29] hw/arm: Express dependencies of the
 xlnx-versal-virt machine with Kconfig
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oIrEI859x9jj

Dependencies have been determined with trial-and-error and by
looking at the xlnx-versal.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index adc38d4..3a04def 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -297,6 +297,10 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    select ARM_GIC
+    select PL011
+    select CADENCE
+    select VIRTIO_MMIO
 
 config FSL_IMX25
     bool
-- 
1.8.3.1

