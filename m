Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp141000ejr;
        Sat, 29 Oct 2022 15:44:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PkWkbzMh+K9MD+8Y0rnc4E/cNwKosGv6UGY5l+6qV4+sjAFDYKgzXJ1ZkMw5MJLLOcNA3
X-Received: by 2002:a05:622a:44e:b0:39d:c1a:3282 with SMTP id o14-20020a05622a044e00b0039d0c1a3282mr5284349qtx.75.1667083471055;
        Sat, 29 Oct 2022 15:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667083471; cv=none;
        d=google.com; s=arc-20160816;
        b=f3t6ZVYP0kJhzU3GFJt3D61czaRgFun4YzYbVpzVW6xsycablycunONa61geqhEQxp
         /zyBcfIef8b6ZKRcs1QlT0u2TwR8eniB7eLU3Sjk8joUEc1xtQ5y9cjOL9+LC8F4yhaI
         Q7u+8Jg3J6ls7L1I/BicHve8/mRjeGWX0I1yeBDG8vRhGrnpG/hdfDx/rv+g6rFfucwp
         gu0vknOwfiouebeoVzp7YP3Gs/wehnAOYllOZO+eK+i0JQC4Ph7bf1gQEdpcQ8/4D+ei
         XzFNgWtvDjw6t2g/vfk5KHDDx+el6XPAw7PcvrIM0We34OgUc7QEtGsvlhZPAiHoriNc
         lKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XtppCYzGlk35Wk54LJpdn1fGqWDPjd3eZWIzxHdp0uI=;
        b=fM3CRk5SpSOp1fF8CnjJ75aLK+U2BcajvDozofadl72DQdlPmjJaqbbxjiqswXSlN4
         eEgthdAjILrMNU4sJ3hnqGLa/lnQuHDgcpi6Nn5oY/UccnqCm+/YqQeC26uyCVwv1e2U
         QVFl4UTumJe2o7i7N7Z1+c3zYLNtUS+0CT7sn587XDc+mfH7tHJ+HB9p2TI7kGLweH8R
         UhJe1ypDUgvZwGE9XZAVeLtVFjtawOc73sf3DXH8udb8nFmChlzjnpY64JaCP+9uKHGx
         uuLMCGyO/qVnZOOzbyjamhiWnCJw50Gy+PKLow4XHLDTDv70Bfcz1hUCF75jMzpB96ZC
         KK3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gzh9ketJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26-20020ac8441a000000b0039af09c94c9si1392709qtn.395.2022.10.29.15.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 15:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gzh9ketJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oouYF-0003XJ-VD; Sat, 29 Oct 2022 18:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYE-0003W2-Mu
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYD-0002Zo-AW
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtppCYzGlk35Wk54LJpdn1fGqWDPjd3eZWIzxHdp0uI=;
 b=Gzh9ketJ7HXRzNxj1BVVdy7zhqtKnFVogMKRCwdxiGJf5LTxMKbx2lvinupqRyGDPCu2G9
 T+YyrImWQUuJb+tMYDQhaRlzAGsRA7qT0mj1OSjmf/Epq3w3aBGGU1DGAGXEMgD4cFybfh
 G9y7eS/v/iUgrW1oVREhjZVz/Opd7qk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-W91vSkEEN1CK_wE1Cy1N4Q-1; Sat, 29 Oct 2022 18:43:31 -0400
X-MC-Unique: W91vSkEEN1CK_wE1Cy1N4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9853D1C05133;
 Sat, 29 Oct 2022 22:43:30 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08DC2028DC1;
 Sat, 29 Oct 2022 22:43:26 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 3/7] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Date: Sun, 30 Oct 2022 06:43:03 +0800
Message-Id: <20221029224307.138822-4-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
References: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gzqh5hk72s7s

This introduces variable 'region_base' for the base address of the
specific high memory region. It's the preparatory work to optimize
high memory region address assignment.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e2ae88cf8b..0bf3cb7057 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1692,15 +1692,15 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
-    hwaddr region_size;
+    hwaddr region_base, region_size;
     bool fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
-        base = ROUND_UP(base, region_size);
-        vms->memmap[i].base = base;
+        vms->memmap[i].base = region_base;
         vms->memmap[i].size = region_size;
 
         /*
@@ -1709,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + region_size) <= BIT_ULL(pa_bits);
+        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + region_size - 1;
+            vms->highest_gpa = region_base + region_size - 1;
         }
 
         switch (i) {
@@ -1726,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             break;
         }
 
-        base += region_size;
+        base = region_base + region_size;
     }
 }
 
-- 
2.23.0

