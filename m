Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2930829lfg;
        Mon, 1 Aug 2022 21:47:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6JN/rH/rqDFKZa/tjP5rmtq0LH401pcqAKYaz4Hzedqqw2qju3XjUZdDvIISAu7+Vef1MD
X-Received: by 2002:ad4:4ead:0:b0:474:7bba:9865 with SMTP id ed13-20020ad44ead000000b004747bba9865mr16555108qvb.58.1659415657003;
        Mon, 01 Aug 2022 21:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659415657; cv=none;
        d=google.com; s=arc-20160816;
        b=YfVzhJy3z96c3wcfxpl27/na9nsr18m21ohW+tPxy0fws5LPSdmnHfLuUetKN+3aiH
         xf2xmBD43LR0qR6OYZN5BZpPMg9yz2XAJs5dxRm31rMbET4tqO6y9UK0ep7b7gOZvN9k
         7WIX6h7gErbvSEdLJNLKhdJ5Q7g4u2+VFCLurUKQ0U5BhZOnmiSu6CtzJeKxR4XVdyyN
         QQND+pODyUtHZYFOXYJXm9r/mEmCAnDCsBCgBjCT8X3LKwoa6BwpAKtIfrk5z/33izkp
         R+pHksHydhZCTGrf+E1N57n9W5DlrocPGuldQiVnyLSk9ZZRjiyTTwSdl0Ky2m1WGRaH
         HEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OzSd66vMiAGfWp3SjT783MBf4FZiMzQ6hwrmJytEckg=;
        b=LV3NZS+n8KwuI7fCC2Dr/GC0P97EuARS0ZOgxe2CPgDlCbqCJM9fj9nn+QDAIVX35Y
         d3JoHhY2/PwhblYCHV9EtWUzjbLO6hBmriSPsg2t/RjFypLirjM1OEi3yka+YPTfBYLJ
         QLgVus9y+p74o8IJ+hj6hAGn3jNgWpCTPcb7jncvDxTFhNoAOrhk7YrNBKNVIA4K7W6T
         lk4VT5fYG6u7aE+/yHFcKKde2618xzR1pevziv/3fPwBJSWlGUAk4XL9csi4e6JG2rRy
         GHuo4onG4gzmW29l7pSqjGeX2W/b2Att9kkksp02xc9J2qjAgxLM6q3h6+6oMQY9MmjQ
         qUcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMDRPsqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a05620a298400b006b24707f999si9916947qkp.116.2022.08.01.21.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 21:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KMDRPsqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIjoe-0008Ch-EZ
	for alex.bennee@linaro.org; Tue, 02 Aug 2022 00:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo8-0008C6-JS
 for qemu-arm@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo5-0004W8-Js
 for qemu-arm@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659415620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzSd66vMiAGfWp3SjT783MBf4FZiMzQ6hwrmJytEckg=;
 b=KMDRPsqS6IDbxPw+hL8nW/yAnKcRrpc8HRmlBoSK5qN6cLbdK8izEtyXdgWr8AXNv4WM0h
 lxR56Nf/5L5oWZa0/qD3zaGE1c9yZ3ElGtv//DGn9QjWTBNU5L2x7Qtg+P8hzWvncFVltg
 d8b2/oGGQAhI9uzWenkvS0yezhEvMQ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-Dfl41vLYOuqBMYLlAUmkDg-1; Tue, 02 Aug 2022 00:45:46 -0400
X-MC-Unique: Dfl41vLYOuqBMYLlAUmkDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D9833C01DF7;
 Tue,  2 Aug 2022 04:45:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-18.bne.redhat.com [10.64.54.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0570B492C3B;
 Tue,  2 Aug 2022 04:45:42 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, eric.auger@redhat.com, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 2/2] hw/arm/virt: Warn when high memory region is disabled
Date: Tue,  2 Aug 2022 14:45:29 +0800
Message-Id: <20220802064529.547361-3-gshan@redhat.com>
In-Reply-To: <20220802064529.547361-1-gshan@redhat.com>
References: <20220802064529.547361-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cf8Yv1DzEOiE

When one specific high memory region is disabled due to the PA
limit, it'd better to warn user about that. The warning messages
help to identify the cause in some cases. For example, PCIe device
that has large MMIO bar, to be covered by PCIE_MMIO high memory
region, won't work properly if PCIE_MMIO high memory region is
disabled due to the PA limit.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bc0cd218f9..c91756e33d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1691,6 +1691,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_memmap_fits(VirtMachineState *vms, int index,
                              bool *enabled, hwaddr *base, int pa_bits)
 {
+    const char *region_name;
     hwaddr size = extended_memmap[index].size;
 
     /* The region will be disabled if its size isn't given */
@@ -1713,6 +1714,23 @@ static void virt_memmap_fits(VirtMachineState *vms, int index,
         vms->highest_gpa = *base + size - 1;
 
 	*base = *base + size;
+    } else {
+        switch (index) {
+        case VIRT_HIGH_GIC_REDIST2:
+            region_name = "GIC_REDIST2";
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            region_name = "PCIE_ECAM";
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            region_name = "PCIE_MMIO";
+            break;
+        default:
+            region_name = "unknown";
+        }
+
+        warn_report("Disabled %s high memory region due to PA limit",
+                    region_name);
     }
 }
 
-- 
2.23.0

