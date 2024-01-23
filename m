Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp492108ejc;
        Tue, 23 Jan 2024 10:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpbWmd3jQwCcOhGAtZqq6J5MdDuHz1BCpOhad7/M6xChM5efcKAKEVXmVcrhno5dwGePiG
X-Received: by 2002:ac8:7d83:0:b0:42a:45b9:9492 with SMTP id c3-20020ac87d83000000b0042a45b99492mr1458473qtd.19.1706033923479;
        Tue, 23 Jan 2024 10:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706033923; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ewxv65ic+hchldMSZHi3WfNiK+XkKv0XucioetqY3pMmeCPzRBu+ucTA57RsMCSdo
         VMJfASy5BZn9nmTLw/yASdRSeTQ05a9aG46HclndbcayBemH+iEYF2HKVkFkmi9HK0D+
         tWNTo8dSd99hEF68CmPA8DweMABjW5h1uhfONsD6NQDm29LX0JVBgVgt/WmjbjjvA+wJ
         hycjBr8iIY2kJF8JzFCmRLsr8v/gQs/JJIDAqeRWcHJjmmU2V7RB5YaLw6PiA+ds7wr7
         tMn/zclzbEPGVI5a9ddrz42ofXDEZoQYazela69kZu6HAN8OWxa/1Gyp1E7GYopwu6UI
         Wv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8xXIwvSW9GSTTNVm005/UCX+5VgpWafDUc44kl7NZI=;
        fh=6gTb9VNh6LOeqNyIPKrEwVzrOlAOUavPKoS18EAi0QU=;
        b=1DIHEkNjF0gAgfrsLEouqN9OKWPoQXNrSfFLn1JfUZF3QZnPegnZinOS6r0FGzILtO
         p8l5ZW1sT6JpZTanA0PuileUlm2KByeOeB7lJI7xfFlxqX/ZgErf8mnGSXd/ClE8CoPP
         6pSPERkCMp63xAu+aJVynK/1LCsFnfshnNYrVgLHn1ygPhJQWDyS0IvoBrNEkqc/0zks
         lwpSVQXgxx8BZjhGqv9c0MYKwkYs5krlDf7NK89CZIHwXE9yFQLrqI55caI+O7G0ypOW
         mG6e8jGUNqJwDG+8faA3lw9lqssUC0kKe9zLxfuQ+GO0N+cLCNgfOYGfWfBSimRg0HG5
         m19Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qbk8dLDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a05622a040b00b0042a1c757654si8523260qtx.626.2024.01.23.10.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 10:18:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qbk8dLDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSLLn-0007DV-Ki; Tue, 23 Jan 2024 13:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSLLc-000778-To
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 13:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSLLb-000641-1T
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 13:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706033886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8xXIwvSW9GSTTNVm005/UCX+5VgpWafDUc44kl7NZI=;
 b=Qbk8dLDnGNvfrg9keby24hbihwXKTmxv21AmGRY5aLYRpJucPhFN5EO0Bc0FFuGOsmAfIj
 ZTTxlFSRhDiyRFO76ckP7IG1UL1gwM0YHl66UISTdQyXoWgJWmPBIjjXr9qVQmZyNiCjPo
 IwOoSXmFv7RK7ia9KE07rZQTSTehfQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-_OEZ2MpXOTOSjfxtNjFBew-1; Tue, 23 Jan 2024 13:18:04 -0500
X-MC-Unique: _OEZ2MpXOTOSjfxtNjFBew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBC6C863E82;
 Tue, 23 Jan 2024 18:18:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87FD42166B32;
 Tue, 23 Jan 2024 18:18:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 2/3] virtio-iommu: Trace domain range limits as unsigned int
Date: Tue, 23 Jan 2024 19:15:56 +0100
Message-ID: <20240123181753.413961-3-eric.auger@redhat.com>
In-Reply-To: <20240123181753.413961-1-eric.auger@redhat.com>
References: <20240123181753.413961-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.327,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: brEboFAA0+kM

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

