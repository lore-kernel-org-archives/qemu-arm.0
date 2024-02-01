Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp353997ejb;
        Thu, 1 Feb 2024 08:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDousyH9Z9Ck/8xo6UjUh4uGoXJyXvmB95rfjEBv9O30J7wKa2DFfQMLo9Vt6s3TFqdPyq
X-Received: by 2002:a9d:6d11:0:b0:6e1:7b0:fb99 with SMTP id o17-20020a9d6d11000000b006e107b0fb99mr5881735otp.21.1706805277758;
        Thu, 01 Feb 2024 08:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706805277; cv=none;
        d=google.com; s=arc-20160816;
        b=XSY6XiwKfqXj4BxFW/NdZLWr0NbrcC59iCe7Ax+s/jCDKDgVFih7WdWERwxbeFT7KF
         QwUlh7NO0zg89H0qQIr89SOvDr29iNvzx9aEGjzQ3an0NRZamJvUKBI7WMgg2rL1fq1d
         eiI9exx6Pz6vKFO07DHbVaNyJjqsJLEReNAteY6EsYxgpc6vIfDE/450n9hXncAAEDSQ
         LT+aDIgmraRzdY0uQug3fenLRzQ7I5IMZxWXrOAaoUkQy0YNTdvybX+SrVRzTjRKJ7D9
         9ALjnRKslDa8WNPa9F+FXUwtqTwmIyJka+l7oU1YDOeGUd+1Au/TYalbCdgtE8umakaN
         bRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8xXIwvSW9GSTTNVm005/UCX+5VgpWafDUc44kl7NZI=;
        fh=BcGSKS4Zqmaou1aEfhNQv9dQcotAUOjOBe7C9x3XTvI=;
        b=0mYeGuSkY34XJp7nZ6iGWDsZl/mk5Da5lcLNEXNKvpCQZXHg54q5XH/8nKb5EZNp+8
         g/ZKeq7GybAo5vTJWXRlY3whVR/b7oHp6JCwQA3zf+c5E97F23NSGy6axg27n79JrAiz
         vKHr/lnfFAV9g/4ndUqoDAihmBxIEBLnbGkbPARoHpGAddO/4WjQ1sEOvQ1kGqqSw6py
         oNzakJdAzNCs2gMirWvC1ADRnE39nofv9x1h3O/KBWPdxYbxGS6PtVnpzpq1SzCtbmvk
         NSQ23RO/kVLygbaBSDqxbXLfV8es2mGM47pKgBAooz1Zq2NC7oSk5ZqCOUCgZfYVs12E
         s98Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i7lymTu8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCUQDrw5E2ybTWRjXyQrd+ZTSOVDcpgYsj8bzzY3HHSM6G97ndbBWXBEHq5+ES4D9j4sSCC4K00PlLTBgYuiTlTsfDityraD
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020ab054d6000000b007d2c394db6dsi2880uaa.10.2024.02.01.08.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i7lymTu8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rVa0X-0004VT-Tj; Thu, 01 Feb 2024 11:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rVa0U-0004TO-Ge
 for qemu-devel@nongnu.org; Thu, 01 Feb 2024 11:33:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rVa0T-0006wh-1f
 for qemu-devel@nongnu.org; Thu, 01 Feb 2024 11:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706805220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8xXIwvSW9GSTTNVm005/UCX+5VgpWafDUc44kl7NZI=;
 b=i7lymTu8evjP1lhY9bvtX3v7USiLIxJhoDNTClprCaGIxkuXsuWCHrp2V6rczU2t93eU6J
 iayPr3uQxJhjNvkW0hfojj8C1SMz8ts8Vm0uZrzfRzJfqNhc1+4j3tnQk4SMUFypxJYQM9
 hiZAa4TOYtvFUou42pD+1VnPMoXrXZg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-OoZDtHUaNMeRsjcy_7ROdw-1; Thu,
 01 Feb 2024 11:33:37 -0500
X-MC-Unique: OoZDtHUaNMeRsjcy_7ROdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAD883C025B2;
 Thu,  1 Feb 2024 16:33:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 992C2492BC6;
 Thu,  1 Feb 2024 16:33:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, yanghliu@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v2 2/3] virtio-iommu: Trace domain range limits as unsigned int
Date: Thu,  1 Feb 2024 17:32:23 +0100
Message-ID: <20240201163324.564525-3-eric.auger@redhat.com>
In-Reply-To: <20240201163324.564525-1-eric.auger@redhat.com>
References: <20240201163324.564525-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QMmsNniYixNx

Use %u format to trace domain_range limits.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 77905d1994..2350849fbd 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -111,7 +111,7 @@ virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_system_reset(void) "system reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
 virtio_iommu_device_status(uint8_t status) "driver status = %d"
-virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%d domain range end=%d probe_size=0x%x bypass=0x%x"
+virtio_iommu_get_config(uint64_t page_size_mask, uint64_t start, uint64_t end, uint32_t domain_start, uint32_t domain_end, uint32_t probe_size, uint8_t bypass) "page_size_mask=0x%"PRIx64" input range start=0x%"PRIx64" input range end=0x%"PRIx64" domain range start=%u domain range end=%u probe_size=0x%x bypass=0x%x"
 virtio_iommu_set_config(uint8_t bypass) "bypass=0x%x"
 virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
-- 
2.41.0

