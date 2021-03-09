Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2655985lfg;
        Tue, 9 Mar 2021 02:30:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLHKyChp0IiXlC7JB5fXyD3adUyxDOYR2NzzcSV+veq2kFc+usj+td/fsqdxuEPH7QJhxX
X-Received: by 2002:a05:6e02:1544:: with SMTP id j4mr24297377ilu.29.1615285802185;
        Tue, 09 Mar 2021 02:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615285802; cv=none;
        d=google.com; s=arc-20160816;
        b=RXChU1BAwxU90DS2MfpjggMTvLxXOmd/JuRLIArf/MS9U9QzecLfWWtEmsHfqiY6KB
         BWIJF45LJbcnJKcWoW7MXO4Ajp65ssVukwKkPKgRpNOfBt0SlDm9AkaK5gGZewsxJ+lU
         9ga7s+Vn84FZAtlfNRMprbEOov+gZR/ioLn04URzPkR3LAL9e6UspjWam2T6P+30LYOY
         SX0Gl6ZHoPZrt8kAEE915Mh8iY7B1CdQz/UF28ztdXPRD7zVM2N+7ZSCxz7LZ5bsLJiS
         QR3lW6O76BJSTs2lehqnnvsNrl3XE0JPQ7NbsVTgOHsF718H4tcY8u56Q191KxMLajdr
         avkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MJ7TYibJkeU3EVVD0ygt9kCwRtbkam9/TntZSjYi9Ws=;
        b=kX574aiZ9RHKgvilgdgU8lYwqsDamXNNja923/1Nthp+uNbX4CxDETedaEHVD8uAuG
         f23rnBQDPCEzhNDU62xoyymBEi39dK860ni2rlShtWLEHMc/r9zfKwPb7dR/mnmLHDVF
         4iZ9uEBDNvPN4P7wypX5mttoxxjuY0kIFCMy0BUe37mVZh3XYmZfDCovKygShRlKLMEk
         hw0EbyukC+hZdNYTpofYWRlHmO0okMLe8WXDETssn7J4KnmKZRYZ1GmUfOAqGxwQzS1b
         yFnVctP0Ebgka0AOXGgguCV+53UPFLNtRWKDYbR/uqcfPTl0ruCdTCSkmdAoqN8hbyEH
         BVfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d1cLtZN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si13324467ioc.83.2021.03.09.02.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 02:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d1cLtZN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJZcn-0006mn-FC
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 05:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZb0-0005Fw-Kv
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZaw-0005Wq-FX
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJ7TYibJkeU3EVVD0ygt9kCwRtbkam9/TntZSjYi9Ws=;
 b=d1cLtZN58f91PJk0zN7V9IUpX/T/Bd8Ii5Q3PkfdkNDcFdnU2Bw92dH5xjn53IpctyL4Xa
 o3i0VImDICIund0h0FxCC/k/6Df/nWVwqARx1Eu2y/qr14+1Em0fyzKDH6EAS4/lxqvkBl
 Dxur4XmTEHzobvynTTBfNRA9Uav3NPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-s4hFKVxxNZeXa8GRopaDNw-1; Tue, 09 Mar 2021 05:28:03 -0500
X-MC-Unique: s4hFKVxxNZeXa8GRopaDNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33694108BD08;
 Tue,  9 Mar 2021 10:28:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292F51F4;
 Tue,  9 Mar 2021 10:27:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 1/7] intel_iommu: Fix mask may be uninitialized in
 vtd_context_device_invalidate
Date: Tue,  9 Mar 2021 11:27:36 +0100
Message-Id: <20210309102742.30442-2-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cdNlUoMNNLUd

With -Werror=maybe-uninitialized configuration we get
../hw/i386/intel_iommu.c: In function ‘vtd_context_device_invalidate’:
../hw/i386/intel_iommu.c:1888:10: error: ‘mask’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
 1888 |     mask = ~mask;
      |     ~~~~~^~~~~~~

Add a g_assert_not_reached() to avoid the error.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

v2 -> v3:
- Added Philippe and Peter's R-b
---
 hw/i386/intel_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b4f5094259..3206f379f8 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1884,6 +1884,8 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
     case 3:
         mask = 7;   /* Mask bit 2:0 in the SID field */
         break;
+    default:
+        g_assert_not_reached();
     }
     mask = ~mask;
 
-- 
2.26.2

