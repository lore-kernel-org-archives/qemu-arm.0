Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1009587ejb;
        Thu, 19 Oct 2023 23:10:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGun/EMDWRr5EOdZn2pTgKZufyJhwsgrj0jcKRy5tiq8LcsDzxZEXdZfwwjTZ+EyAuXbtd3
X-Received: by 2002:a67:e041:0:b0:452:8ad4:29d9 with SMTP id n1-20020a67e041000000b004528ad429d9mr1017043vsl.17.1697782212900;
        Thu, 19 Oct 2023 23:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697782212; cv=none;
        d=google.com; s=arc-20160816;
        b=HF5o5XJOvPfck0N0HqrkYMabGHGxYSjm0wQQLqfIz2670+OFWv06K2HX6snpb9NWAw
         1ypx8+SatXBXBjJY8qwslmRHEtN0xs6+ufDKZq6FylMfPDHkO+dJKxowKt2dXpW/2Q1J
         CguGEczmLFLdyZJp/b34r1WauMsXO11oJsHdWP7Oj5gRuCJQoDt1dwKgNWG9NzjKPszz
         zeCWj5G+4e4O8HaIjStnSmuw1TTKCr/2n0BnP0rpSX3QCzR4PV83L8q0ZH9p6EjtRC5y
         LZUHhX3X/N/7s1FLN7aQovISVnoVqZm4EV51SHP1L1k9vCKV+r6oBI2MvfNwX8fZIeYS
         Pxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4dG7BNby2fCw774AQhQ9YOvheWhOYWm3zoWvl+l/ar4=;
        fh=X3JeOFj4ztx2Lx+Yzj58ZbPbimbM/VvtLuGPbdfaUEg=;
        b=LDkNe556+CzIHRqR/O8dOywmef2RM3VwC5uCZPnIJlp7rSGgPetZ6pg2aOoF8jA2Vi
         +h8B4ozV6ePRH7PM9XtqKMypEIFXKyoiM+Gf5ac4mCaelWv5nZ90L4JCVCZJYU106Ffc
         6f9UdpUTadre+HhSninxbNXCAUhQpC5MBZD+hx1gzQHthYGxwHqkXtxaCGJ2X7xC+3x8
         /4hKP2lMDaFmJc80N6mtDZ7h08mpPB/RKNxV/mptxnTQLNkpO1TSb7n2AgkWWq9+v1l6
         SE60hmPVkLW9tFQDxVWsy/ZNQr7Sta4Ol/dNcala6vLTPj7t8k/ocL9jN/ZGOkwPwq45
         0JGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Taz7Gl3T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020ac85a04000000b00403cecf35bfsi825430qta.297.2023.10.19.23.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 23:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Taz7Gl3T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtihg-0003Sx-47; Fri, 20 Oct 2023 02:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtihf-0003RS-3j
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 02:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtihd-0003j8-5e
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 02:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697782184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dG7BNby2fCw774AQhQ9YOvheWhOYWm3zoWvl+l/ar4=;
 b=Taz7Gl3TagCltDaTjkw+GDnDCEBZpClExctbflIkyU9lUbYdQPc3UApqzE6uILIvulsTqU
 +/zIbWV9W0iQ8nye6s3peaRn5q7XnbDCJOHWaXqCaLPhHrUopvoxrx3NRzuz80tSUbHhq1
 1ejcn6pdqYZIXaa+sPppbwfnc4pLtrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-5el_-WyFN3GYFULRFeqxWw-1; Fri, 20 Oct 2023 02:09:41 -0400
X-MC-Unique: 5el_-WyFN3GYFULRFeqxWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCD22857F8C;
 Fri, 20 Oct 2023 06:09:40 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D927E40C6F7D;
 Fri, 20 Oct 2023 06:09:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] MAINTAINERS: Add hw/input/ads7846.c to the PXA2XX section
Date: Fri, 20 Oct 2023 08:09:34 +0200
Message-ID: <20231020060936.524988-3-thuth@redhat.com>
In-Reply-To: <20231020060936.524988-1-thuth@redhat.com>
References: <20231020060936.524988-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S3m0ANXqQ9Ez

The code from hw/input/ads7846.c is only used by hw/arm/spitz.c,
so add this file to the same section where hw/arm/spitz.c is
listed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14e8f7702d..34f9036df8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -938,6 +938,7 @@ F: hw/*/pxa2xx*
 F: hw/display/tc6393xb.c
 F: hw/gpio/max7310.c
 F: hw/gpio/zaurus.c
+F: hw/input/ads7846.c
 F: hw/misc/mst_fpga.c
 F: hw/adc/max111x.c
 F: include/hw/adc/max111x.h
-- 
2.41.0

