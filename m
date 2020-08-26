Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp815367lfc;
        Wed, 26 Aug 2020 07:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6W/zMD7+7PzpOtd5U39Czg3hf4hGGGdhejK4RoKfpEDeXfSuVeudmMB6N+bqBHTgCZrtz
X-Received: by 2002:a5b:508:: with SMTP id o8mr23596032ybp.43.1598452812923;
        Wed, 26 Aug 2020 07:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598452812; cv=none;
        d=google.com; s=arc-20160816;
        b=g41sDlq8TFcZo/eCyrqqx0MieX8wTquEZFAbZqPbuWgzFVR3P/N36FBFvWLgGu5HDO
         Fmd3VtdwIwEnJuATyTnpGWKxZQoG3i5vghUaOhTPix4CpaXR5JXFsoihkU4Zsy/eVBnS
         s+zTlNumKLBQQLpXsS+rPP0aSl9CokcueUYJT1OlrxlqTCDC5LBjfFhxdaMsSyzCFzdn
         beezzO1K+yftjmTwNrTcazmrZBAN3aqUMebEnCQX0I2S+pHhKcK4whPvQ5Q84H4Vk6CB
         98Gg3L4zpID9J/SI/+jkrns9+jaE53WNwJ1UchG1aByorLeSfaqUWC3MKeK0/fzQ6Lb5
         Y7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JMsC3c9/DHjUOSpDAcJrFyNttzIeCnsKLwCmZ6jNiU0=;
        b=hlxqUKtr3/ApoRPXo+aMPA1HcQ9KzUeIu1x24Gf1tJhOLUlB7Atb6ioPnWFNJO/3a1
         cbDkt3i1qHV+WHhAe2BHbX6MSUQSuV/Ync0GlezUGlwIGyNV/YzGv+DI9tu2CYztP4A8
         M4Xn987sdpBBOv1GxOu5YoRV3MnKkpiaOAh2vPgOz8fmrLAApSk/g1hi9l7m6OT/zfk7
         HMM9vB6E9wOFgSQTTu2TOVMXFOUKJxiGMTyv9Bcigb/yZRsEpFQ3k4gUPfmGPPqWVZJA
         yinS02Q7yAPQ5YnNn688g7pYfTZJJrFgajxULeLxmAVSgDcUpCEn0PIxJJoUQ8eK55v9
         oU4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dekTiL2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si2625051ybq.296.2020.08.26.07.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dekTiL2X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAway-0001XY-8f
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwYo-0005Pt-El
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:37:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60479
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwYm-0006EI-IX
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 10:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598452675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMsC3c9/DHjUOSpDAcJrFyNttzIeCnsKLwCmZ6jNiU0=;
 b=dekTiL2X/i7zvpLj2wL9OMeFyHPKqhuUk9rakvKxnis/PvtgKHigeDcgMfct1C5hkVmZHa
 6QuaRyzvru8/4yvja2reoghaHqmtlbD+Gy6lulyC8udbdPvppOC7U1CaYTKccenOPn4Ph6
 zoTbG7TXlQ7o1275fZSbR4KHEsmmrmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ydLYk1WANgaMukVqQFrxhg-1; Wed, 26 Aug 2020 10:37:53 -0400
X-MC-Unique: ydLYk1WANgaMukVqQFrxhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 913221005E5B;
 Wed, 26 Aug 2020 14:37:50 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-59.ams2.redhat.com [10.36.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6A276E00;
 Wed, 26 Aug 2020 14:37:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v6 03/13] hw/alpha/typhoon: Mark all IOMMUTLBEntry as
 IOMMU_IOTLB_NONE type
Date: Wed, 26 Aug 2020 16:36:41 +0200
Message-Id: <20200826143651.7915-4-eperezma@redhat.com>
In-Reply-To: <20200826143651.7915-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:16:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ri5rKH0dY0kZ

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/alpha/typhoon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 29d44dfb06..b1e6c4e929 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -615,6 +615,7 @@ static bool make_iommu_tlbe(hwaddr taddr, hwaddr mask, IOMMUTLBEntry *ret)
         .translated_addr = taddr,
         .addr_mask = mask,
         .perm = IOMMU_RW,
+        .type = IOMMU_IOTLB_NONE,
     };
     return true;
 }
-- 
2.18.1

