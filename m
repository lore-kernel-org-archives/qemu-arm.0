Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3079292ejn;
        Sun, 23 Oct 2022 23:42:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77Myj62EcYW2F2zKlhagiTX32MLpEMcB1e9+Nx59xZyfkvYnY+oZVQlomRSxS6n2xJ9Nfk
X-Received: by 2002:a05:622a:1a1c:b0:39c:d784:66f5 with SMTP id f28-20020a05622a1a1c00b0039cd78466f5mr26726739qtb.341.1666593761261;
        Sun, 23 Oct 2022 23:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666593761; cv=none;
        d=google.com; s=arc-20160816;
        b=VpSsWukM+qA0eqQrnBPs1cGW3BZmgoo5m9dVpVZAu5plXDhXHb5Lx3ADKMpuoHqaZ2
         didWG6uaZQf8U9Ktgy56Cb21eLiTkBouvstKbx/g+pwjZvtBiiSYC7HvmGJpufDCZwQJ
         JKvnTrQ3T1ucjiZMP8oLMu7eBvSVFmd5uJrked+6uMS9vvgl3/7X6G+v22LaF/HGkIMN
         drtnTrbKsBv8+y1QljagWM58Yz6WnIPVBli/r3TCqwaiTxyez7OogVIJdQ7zfts7mwYx
         she7M4XpKFvIZALi+dES6dp+RLGBYGpqUgihqlN8732clbCY+BKQA081F8hFpay7coPP
         RHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BJ57TJbYSzGwdVgx3REDNP22E1p8XARhKt6nl56mLwI=;
        b=TK43YnO/mzpGYb0eeYjeWTqjN8Rp2nUbvhMutmtQHi5lCOXo4Y+ERZhCl6JxjqVcnO
         XlwHCbVLf6Ak5qVn0dGxdS+vRD7I6Mn2a+GnVP2hXVfIBk+ZLGtW9BH9owcb2qOaWQJ8
         Ms60rYtkQqmfCVuUa1n7uf5o6uBl+ukyYYgc/+2FqTFx+0nkwzwFnlci2lm3rG/hPcN/
         2CWExuWNRZtxDBLYLVNidfJxgjH9KPLDrWsM+XfSGNfx7KA9TqPpaeu4HjHjbrBoK5NW
         tQtssnK7lbfzey4TVGkMquLZjoy4jrQE6WmNeofPjSNU+blZJH+nLsi0YEQEVBtTyP2f
         WsHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TmWlSpnB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a05620a28d100b006eed4e0de3csi17000520qkp.546.2022.10.23.23.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 23:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TmWlSpnB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omoXx-0008GO-0t; Sun, 23 Oct 2022 23:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXv-0008Eb-S1
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXu-0000gG-Ev
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJ57TJbYSzGwdVgx3REDNP22E1p8XARhKt6nl56mLwI=;
 b=TmWlSpnBdYe42JBrths+yLOyGkLTP+r5ZMFxZmm85jCAKcnKFPakge/WrAeNk/I65COp6P
 UbJeGd7Fgjph4mKszy5yDB5HePoGI6Z7oHdYM3wQm5vX5gJkxmhd15YeVja9H0j/2j2LJ4
 icjKTWx+8SE5a+InaaVhWWoflfCE1vU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-C3AJLYbWOBCSFX_AnIY-xg-1; Sun, 23 Oct 2022 23:54:35 -0400
X-MC-Unique: C3AJLYbWOBCSFX_AnIY-xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D00F8811E67;
 Mon, 24 Oct 2022 03:54:34 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F8DB40C6E16;
 Mon, 24 Oct 2022 03:54:31 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 2/7] hw/arm/virt: Rename variable size to region_size in
 virt_set_high_memmap()
Date: Mon, 24 Oct 2022 11:54:11 +0800
Message-Id: <20221024035416.34068-3-gshan@redhat.com>
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
References: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NUcBZzNCKg0j

This renames variable 'size' to 'region_size' in virt_set_high_memmap().
Its counterpart ('region_base') will be introduced in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7572c44bda..e2ae88cf8b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1692,15 +1692,16 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
+    hwaddr region_size;
+    bool fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr size = extended_memmap[i].size;
-        bool fits;
+        region_size = extended_memmap[i].size;
 
-        base = ROUND_UP(base, size);
+        base = ROUND_UP(base, region_size);
         vms->memmap[i].base = base;
-        vms->memmap[i].size = size;
+        vms->memmap[i].size = region_size;
 
         /*
          * Check each device to see if they fit in the PA space,
@@ -1708,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + size) <= BIT_ULL(pa_bits);
+        fits = (base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + size - 1;
+            vms->highest_gpa = base + region_size - 1;
         }
 
         switch (i) {
@@ -1725,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             break;
         }
 
-        base += size;
+        base += region_size;
     }
 }
 
-- 
2.23.0

