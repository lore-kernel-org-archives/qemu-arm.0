Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1679551lfb;
        Fri, 27 Aug 2021 08:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF8FeZB8AjQupn+AXJSnYFWHda6vxhvzuzueItEcvb1hvNLnsLRGKBK6d05xuKrpbRb0Zu
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr2760636wrc.233.1630077487750;
        Fri, 27 Aug 2021 08:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630077487; cv=none;
        d=google.com; s=arc-20160816;
        b=yQ5kIYJIHr2eKv3lo16xkRqJwCH3nL+jGPeIT1khXvZplZEVzBsGucQ2KMLBjmP0Z5
         WCehmFE5rYdFfMZipq0oBPoVmd7h8BUlhqkIFOlojun2dOahijekrmsOVHjgCMxUvxw+
         ROH0qFzIEbOA8zJ/2dZNfJu62gRKRSIQRBrgRRyhWVT8VpV/nF+sRn45O+zPxR2N5vmv
         3Jg/HN99IoV29vPhaW3r0E/9pd16dY+eTCmkUK8G6duzj3lcxdMOFnb4+b4VqZZSlvlT
         GS0Owca6M2UpZ9qSphzVkF1JrKomjxM1YvjAM2CXTGcZO4YqjZYfFynN3Iof7E1ukOCO
         2UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=L8XgRF1kt+KDBalRdVP8rge/CVuXZFXS+KX+MTrZpn4=;
        b=sPpI/rTXlBfmQMKrrCL+jXt3JUw+ip8uNQUCsxf5vGYLpDH3nQMQtJB++dpM9tmdry
         bIjtSFFnB2Jo9UiqLwMvRbtuUVbDgCbotVIYp7g93TnqHgQAYcr70zdtfyD33JDVYuQq
         oCVB6ThB4UYNzrio5msI8jUX4m3FGUCpQ65NosN3NM1to8Iac4cqXQIHKTZ2IMTeaght
         b9Y/QY8q6h8zTRCDUuYbDNtq1RcXv/SUf51Ap4pbZki17+P5VHIWZPRoUqj0NChl6Lrb
         ulKq3xbq3lxDxNzJKQ8qCQSygRBrHqim1I0/bBQTZkUdW5u9CO+ewCiOZgV7vWJxrZtD
         1ThA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F+YSKwZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si7998348edj.103.2021.08.27.08.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 08:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F+YSKwZH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJdcM-0001IU-PK
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 11:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJdbm-0001HO-Ax
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJdbj-0001wl-Re
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630077446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L8XgRF1kt+KDBalRdVP8rge/CVuXZFXS+KX+MTrZpn4=;
 b=F+YSKwZHemD2qRj+SIRTV+mrKvSmRaPwSwQ/sv46FCfftANOewy3NvxSyekqi0ukfPyeER
 Tn0Hw2/sMJl0OtrY7X9Mz1S5j7veSWNqLOEsyg5FHJo4kKW3/hxmAj2yd/pZXwWd797r5j
 vtM1e4XAvlYujXY5IjwtwAUTyQO+qXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-urzFy_e1O7avOBhk9Vh8oQ-1; Fri, 27 Aug 2021 11:17:25 -0400
X-MC-Unique: urzFy_e1O7avOBhk9Vh8oQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C97F1018F64;
 Fri, 27 Aug 2021 15:17:24 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EFF03CC7;
 Fri, 27 Aug 2021 15:17:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 4/3] gitlab-ci: Don't try to use the system libfdt in the
 debian job
Date: Fri, 27 Aug 2021 17:17:18 +0200
Message-Id: <20210827151718.178988-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9M9H16GU6Ue9

libfdt in Debian is too old to be usable for QEMU. So far we were
silently falling back to the internal dtc submodule, but since
this is wrong, let's remove the --enable-fdt=system switch here now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Sorry, I just noticed this after sending out the first three patches already

 .gitlab-ci.d/buildtest.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..f0eb5f6286 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -74,7 +74,6 @@ build-system-debian:
     job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
-    CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-- 
2.27.0

