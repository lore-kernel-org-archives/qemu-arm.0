Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp739741lff;
        Wed, 11 Dec 2019 06:58:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyv7CrZsjrm/WnmqJVK6MIwwWFb/kDbV9NMkEtM+2Hl8aL+YRV/7w/mUyPOR70DvE+mKdpS
X-Received: by 2002:ad4:4364:: with SMTP id u4mr3410723qvt.27.1576076335868;
        Wed, 11 Dec 2019 06:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576076335; cv=none;
        d=google.com; s=arc-20160816;
        b=KZPT4qglJ0w16LVvQrRBWQDX1sqd5Ycbzwdh3GWD+OCaofk9OPmZtM9ODDUyflYJzl
         8RmrDwhpenF68l2Jz9RCs5TaOUlxQI8lLE/qywwOarMYi23nQ3FwNHPyxDXuZflDj0gh
         wBIrL3vbdazEEW3Q/vBwQgkaGGhlUovr+36BoDW3J16UclO74i2MjZT+B/NEFZhc1Ty8
         28HR1kVWs78BuIoFXf6JrdtFShOzbf6iPiIOic951L+kxfbBFCSa54KdI+hKe+qcHuMQ
         MWsTDOmlBPGGEZ607h6ryrIjvW2cf43s2Vi4CxibZochfa0idHEYRyjUPQUIGB5cMn1t
         4ZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=syWV6RethZ9zkiIkM27Et4g5OSvaauBfpbT1hVu+9aY=;
        b=e1ThwvI2583/21sayoj3h7vT3CQHLEGzGHhZnxAhIBEh8EvnBQoiLikxZmNJUCJC4k
         aoFvIWIzODJmo472kpyxYAmliOD/kX/4n0te96D1PF8mj8SAh5v16hWQYbQoLwz4tGJg
         dYO2t2qROmQNZK5SiRigVcW5yhaun1FcBBbNbNOOm6Vm9qM1VQ36aM3YAViHbEuZh/u8
         rZt4b4r17bGor2ZNXu17DdEfZppmIjaInsFPUaARnVP27cIkte0XqbzH1Grum2ArXiUH
         HFnsmk2bcVmh9+GShntUssKEw1G/SMsZhgTF0/vEgt5W/IGiaP7jWGFIBBsSS6RXR95m
         lPVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=Ud4yWMct;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si1038306qtn.402.2019.12.11.06.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 06:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=Ud4yWMct;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if3S3-0005XO-7p
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 09:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3Rb-0005VT-JF
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:58:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3Ra-0001be-IB
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 09:58:27 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:60967)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3RY-0001YO-8Y; Wed, 11 Dec 2019 09:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576076304; x=1607612304;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=syWV6RethZ9zkiIkM27Et4g5OSvaauBfpbT1hVu+9aY=;
 b=Ud4yWMct5kmOFiH3Ispu0ZWbHdQG1c1y0CMUt0VhOEv6j4646r/6AGGd
 rhdIFPZXO+xFBlO7LFjg3BRbpSD3TemKKNPVjTWLSn6UrVw68FUqQOf69
 brMwslAkXa8jnCf+WLAUovHM4CEZe97lzSUpkymdPY2em2hFLA6waIRmv U=;
IronPort-SDR: 5U4PCsk5faTlsL3Cto8jsoKGs1PL+7+mTrFEHbg7o+uX5q2rZ64rYnPXCTiHqUCp9Udm/yoNQu
 fzb7kbt/0GiA==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8624211"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 11 Dec 2019 14:58:23 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id AC093A1C74; Wed, 11 Dec 2019 14:58:21 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBBEwITa019099; Wed, 11 Dec 2019 15:58:18 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBBEwIVR019077;
 Wed, 11 Dec 2019 15:58:18 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 1/6] hw/arm/smmuv3: Apply address mask to linear strtab
 base address
Date: Wed, 11 Dec 2019 15:57:35 +0100
Message-Id: <1576076260-18659-2-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576076260-18659-1-git-send-email-sveith@amazon.de>
References: <1576076260-18659-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.48.154
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jxsKpFYukKi7

In the SMMU_STRTAB_BASE register, the stream table base address only
occupies bits [51:6]. Other bits, such as RA (bit [62]), must be masked
out to obtain the base address.

The branch for 2-level stream tables correctly applies this mask by way
of SMMU_BASE_ADDR_MASK, but the one for linear stream tables does not.

Apply the missing mask in that case as well so that the correct stream
base address is used by guests which configure a linear stream table.

Linux guests are unaffected by this change because they choose a 2-level
stream table layout for the QEMU SMMUv3, based on the size of its stream
ID space.

ref. ARM IHI 0070C, section 6.3.23.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e2fbb83..eef9a18 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -429,7 +429,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
         }
         addr = l2ptr + l2_ste_offset * sizeof(*ste);
     } else {
-        addr = s->strtab_base + sid * sizeof(*ste);
+        addr = (s->strtab_base & SMMU_BASE_ADDR_MASK) + sid * sizeof(*ste);
     }
 
     if (smmu_get_ste(s, addr, ste, event)) {
-- 
2.7.4

