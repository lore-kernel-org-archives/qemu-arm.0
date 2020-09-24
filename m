Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1128765lfq;
        Wed, 23 Sep 2020 23:31:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWL0YzgmWj6vmvchZEtlWqzRQKZwbT45KX5tU8OSgeWRVt12UsndnHmBRBxD35VLf1ZAmR
X-Received: by 2002:a25:2687:: with SMTP id m129mr4764859ybm.425.1600929063772;
        Wed, 23 Sep 2020 23:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600929063; cv=none;
        d=google.com; s=arc-20160816;
        b=0bz9iIxGO/IcrarVLQoorN6tFup14+r6TCucq0QIZ//HHjW1QDrd+B5Cu88EDQ42ar
         nV4OGtxG5F1/itkDGC0YeKLvk7TYHrXtyhfelqkYOEQNMBpaxExV/nVkY/B6ldZvut6D
         XsnvXIZvpPxin8bvrvBS89or8RI2rzIgHeVmCAKKM2mT+oabjgIvgjpsdbRon/XVCv1g
         AZdxCbWFdySDhTe4nILtV7735KCpMeRafj3iNcXYTIgjlzitJfxX3ZbeEYx6Ol3f+tVd
         6nV0ZJLd6pnWC9ATBOQikAsNFIXk4XHoRfz2VVCfllaww/juAlyLd9j9LOgqEdTOsIt1
         6f+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DHJKSLa69s+O42U5mZZljJD2yF1oJm8rzp1k3+3HZE4=;
        b=DW3Fx7mEzoklcd3krKqEitGiV9vCCzv/ZxG9CF3mDvNKcgCF+H42N+RBLZv91BHHe6
         fCbKB9/36bzMRSgMuhVyqnn+vpHZhXLsLHgH+MZcoH6WE9GY1J1/4V3wx66PDFzNcstb
         crG2E5+vGcxPdh/JxLQaA8DIjwH4ArQiyRTCaAgUEOH3RdkaggIUbArHl+yqWpsvBsJ4
         fQsj8ut81iZLeN9ii2IT73I8gSQKtNL2njB+lVC4eUduRf/lXoThnQjpv1I+NPzpKQYp
         JrTCdNQw7P2Pu+mEQWiI5ipiuFha569NKRSe2+fbzTX1t/AROaTkXPqdZaI/Ug1qUZQz
         UfZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MSBD73AS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si2138539yba.136.2020.09.23.23.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 23:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MSBD73AS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLKmV-0002jD-2Y
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 02:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjU-00006S-Dk
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 02:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kLKjP-0001f3-IC
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 02:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600928868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHJKSLa69s+O42U5mZZljJD2yF1oJm8rzp1k3+3HZE4=;
 b=MSBD73ASaji41OvpXRxkROBdwOz1rnS+qdZsHZW4SBdHy1Pga8OeoKQxS8Oz+5REdUqUI5
 VkBIX7CE85ENTJQ0lS3UWIOzhyfHyasoxmAW6B+Dbjwh7RGJRMZguuSpUQAcSn9hb/+1s9
 xEfkUKDBEw0YLxxtZ4nMCA4P7i6Gsf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-qwxYvd3yPAW_BHMe8YNYoQ-1; Thu, 24 Sep 2020 02:27:46 -0400
X-MC-Unique: qwxYvd3yPAW_BHMe8YNYoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDFD656B56;
 Thu, 24 Sep 2020 06:27:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF8601002382;
 Thu, 24 Sep 2020 06:27:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C9949A8F; Thu, 24 Sep 2020 08:27:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] microvm: add irq table
Date: Thu, 24 Sep 2020 08:27:27 +0200
Message-Id: <20200924062734.22978-5-kraxel@redhat.com>
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aGJpjqDLZ8F0

Add a comment with a table listing the IRQs,
both legacy pc and microvm side-by-side.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/microvm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 3b9fd4ff17fd..0d61697c97f0 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -27,6 +27,28 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "qom/object.h"
 
+/*
+ *  IRQ    |  pc        | microvm (acpi=on)
+ * --------+------------+------------------
+ *   0     |  pit       |
+ *   1     |  kbd       |
+ *   2     |  cascade   |
+ *   3     |  serial 1  |
+ *   4     |  serial 0  | serial
+ *   5     |  -         |
+ *   6     |  floppy    |
+ *   7     |  parallel  |
+ *   8     |  rtc       | rtc (rtc=on)
+ *   9     |  acpi      | acpi (ged)
+ *  10     |  pci lnk   |
+ *  11     |  pci lnk   |
+ *  12     |  ps2       |
+ *  13     |  fpu       |
+ *  14     |  ide 0     |
+ *  15     |  ide 1     |
+ *  16-23  |  pci gsi   | virtio
+ */
+
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
 #define VIRTIO_NUM_TRANSPORTS 8
-- 
2.27.0

