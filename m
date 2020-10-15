Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp500965lfa;
        Thu, 15 Oct 2020 04:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUJGw3BAWY6wVykKNiGwOIu82+KylA9NvbWmnMdbAQWQreMHZcAMV17UwBkjsScryb1yDf
X-Received: by 2002:ad4:4eaf:: with SMTP id ed15mr3974360qvb.40.1602762844972;
        Thu, 15 Oct 2020 04:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602762844; cv=none;
        d=google.com; s=arc-20160816;
        b=McIDSQyL0I49ZBOBRHX5OmWTP8JCJ0STf4acXRTgjR0MKDmDpXYkjliv00o4umOUNO
         JKEPjnHJOK+oxVg4Y+L+8sFWrzkO0lDn3P1oSJv0NBsnvt7Pgz+FHuVx7H2SMg+7LsNg
         IIc3QUXioJ7hZYiNrWd6kscgCBUJFIFALV6NasOauiGUwX7W8zs3pSyLoFPrGa6JECoD
         5opemwJ8dZJpZ9tY678aQfA1DxD2kjnzQ4twv9l9cyZfACd8SoC9QyyYT/DhDUlREgW+
         LnzDJ6w7bCr1UnDfIht/z3dYfJ6TG6uFLbabANiKvvsPJt0B3SolIm2cHmi24Oa37hOJ
         Jd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+GpNs/t/qJwV7hmRrMsEBIPirpG4deXYMjvFLM1k6to=;
        b=Cms7Uy8rdBCVH/YWApewXx8LDIHCbwKRxFlSQKycdYpJoB7r5tcsDkJ6Ye8AaqQpes
         mJjceLXHWOdIwN2L7FGUI5qY20qXl2hPBmXiMeffEno+P2TR9dY5r8IkLtQ+4rse2p+T
         VHcvDknuyiyTkO81s0vDI5XOlIBwju+dz7xc/C3OL3rWNDbg0yirS9KgyVdp1JRTEOoL
         OCB+i9Gcui8L0+WjP4+ErCjyZQ1RN1L0xh3TkLsWXGnusz8rYtrM0yl0JL9w0SHtL4Mb
         27e8cczw3a3wRhz3C2DQf82mLqwTlEPa3XimvtFesFmerc+E8d6cNDbEb9NovbwOWYkR
         t7yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cI/hWOdv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si1338572qkg.151.2020.10.15.04.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 04:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cI/hWOdv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT1pc-0002v8-Bc
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 07:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT1pQ-0002uK-6p
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 07:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT1pO-0003J8-Ji
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 07:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602762829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GpNs/t/qJwV7hmRrMsEBIPirpG4deXYMjvFLM1k6to=;
 b=cI/hWOdvhMAEj1LTGz29b8Zovn1Y0CZJvkVimR4lNgwSVLb+fMIMEKmi/QpSTKWWz8Ongq
 IVu1uEnfe6TW4IaiRvwkD9E4lWE34IOx1WUsGnkAfJiwkjepPWAjKHe5Nc1FgGBpxz4pKV
 LzCxLu9WpC8m1dN/Mc953vaFiuNQXNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-jKVuRGcDNo6QZprJR2FBHA-1; Thu, 15 Oct 2020 07:53:48 -0400
X-MC-Unique: jKVuRGcDNo6QZprJR2FBHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08CE31091070;
 Thu, 15 Oct 2020 11:53:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F337366A;
 Thu, 15 Oct 2020 11:53:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [RFC 1/5] block/nvme: use some NVME_CAP_* macros
Date: Thu, 15 Oct 2020 13:52:48 +0200
Message-Id: <20201015115252.15582-2-eric.auger@redhat.com>
In-Reply-To: <20201015115252.15582-1-eric.auger@redhat.com>
References: <20201015115252.15582-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:38:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qWoOL5sMKtPQ

let's use NVME_CAP_DSTRD, NVME_CAP_MPSMIN and NVME_CAP_TO macros

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 block/nvme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index f4f27b6da7..e3d96f20d0 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -728,10 +728,10 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
         goto out;
     }
 
-    s->page_size = MAX(4096, 1 << (12 + ((cap >> 48) & 0xF)));
-    s->doorbell_scale = (4 << (((cap >> 32) & 0xF))) / sizeof(uint32_t);
+    s->page_size = MAX(4096, 1 << (12 + NVME_CAP_MPSMIN(cap)));
+    s->doorbell_scale = (4 << ((NVME_CAP_DSTRD(cap)))) / sizeof(uint32_t);
     bs->bl.opt_mem_alignment = s->page_size;
-    timeout_ms = MIN(500 * ((cap >> 24) & 0xFF), 30000);
+    timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
 
     /* Reset device to get a clean state. */
     s->regs->ctrl.cc = cpu_to_le32(le32_to_cpu(s->regs->ctrl.cc) & 0xFE);
-- 
2.21.3

