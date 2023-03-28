Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2802687ejb;
        Tue, 28 Mar 2023 09:59:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set9SH39DxV6S8mfawbiHikHxyH2mkmr2yaYfamUkWJlfwj106/p5Aqd40TpEBjML9IoSbTpd
X-Received: by 2002:a05:622a:314:b0:3e1:90e4:c20 with SMTP id q20-20020a05622a031400b003e190e40c20mr29186757qtw.66.1680022792877;
        Tue, 28 Mar 2023 09:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680022792; cv=none;
        d=google.com; s=arc-20160816;
        b=nxFvFb4skgoM25OmdJ+m+qFuNWkBndtexW+2YxRtsb7qi3Qf7ZH3+ljppyid7Efj9B
         tt/X2/SC3Kq480X9ZmTWcBPl36r1Yp6SzcluGqNjst3qZfziVt4C/T9JbukBwqwEY2LK
         Zv5ajsSU9Zd4SKzRK+5LfUF6rTF5ze6Z+Xmnvpm3D3pN2LikMp41wIvvaXzhc4QDa6Y+
         7dgG5xyS+nje+LVv9C0CDhmzMoQNYqD8hVvsv0Yrdh9qDI29+4hI1LW4wDB1zCv91/fo
         khUpwwiNSwrJYfrq89yr4QMOcuP2YiywvD/2+3b4idB74SafS6HrMOPKH5KRZOO4pgFT
         mFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZX54ST6vtoGysVY6Zx2mPJQ+6LQziA8dRagxLmo8s/Y=;
        b=iWJgaWAvD8UdPBIyVshFYTC3fe2o1agWLRkVGiCUsj00YlAcvQgRTOMTwMGly6qFbd
         VGrFLKDPnZUJrk705zz/ChZQ53/1kLIlE54VryHmfnh8JV+YnitLqV5Phzw2soAUEgvh
         MvR/2XX+JrCU52s4f4lUh0eacIc3xHaRI3r9KlLfLiiy39wcvZi4rT7AoE4hm58+nym1
         Q0+pe7DrjiNLq1R9mrzyKt4fgQNLy+nijTT34ETm8BGmq0bHWO7NCRGqSy0x4jF+PiOt
         kpTOA5xUQ1Sc9oQ8kkR+gGOoW+3IkvTtCvMQTxCetPezg0gH0GiqwtYZSnDoD9qBPnBV
         Wa1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xh0cFCzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a05622a025100b003ba35839eabsi21116375qtx.451.2023.03.28.09.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 09:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xh0cFCzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phCfg-0007TW-3y; Tue, 28 Mar 2023 12:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phCfe-0007TB-Ku
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 12:59:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1phCfd-00058e-6o
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 12:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680022780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZX54ST6vtoGysVY6Zx2mPJQ+6LQziA8dRagxLmo8s/Y=;
 b=Xh0cFCzGDRSpolyeedU+RvlmA0QB2s2wLRqfrBVGnOlzu2uclPGtMHRd0vFsIMJZnM/apb
 0cVzk37KKQsTyfLan6w+9/dMuz7dOmG9/XACpKhXVb5BMYZYDYixduRPJvzW25cYRLGYbn
 4/X29iQl8zRv1K3/SamDVUbmkd5mXQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-E5DR60d5OuKBx7JuIq3fmw-1; Tue, 28 Mar 2023 12:59:36 -0400
X-MC-Unique: E5DR60d5OuKBx7JuIq3fmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36919801779;
 Tue, 28 Mar 2023 16:59:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1706C18EC6;
 Tue, 28 Mar 2023 16:59:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B80621E6926; Tue, 28 Mar 2023 18:59:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Tue, 28 Mar 2023 18:59:35 +0200
Message-Id: <20230328165935.1512846-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 37wPJO5xOSfd

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

Since monitor command 'dumpdtb' was introduced a couple of releases
ago, running it with any ARM machine that uses arm_load_dtb() will
crash QEMU.

Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
of freeing 'fdt', assign it back to ms->fdt.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
Reported-by: Markus Armbruster <armbru@redhat.com>i
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/boot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 50e5141116..54f6a3e0b3 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
-    g_free(fdt);
+    if (fdt != ms->fdt) {
+        g_free(ms->fdt);
+        ms->fdt = fdt;
+    }
 
     return size;
 
-- 
2.39.2

