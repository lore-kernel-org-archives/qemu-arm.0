Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp373459lfg;
        Thu, 19 Aug 2021 07:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyVSQzVWPeUy2YTc0u8zBt5yHchoiLBv0xHKfODMrxq6gGhIODiroCFHn12MZr6/hLYmsL
X-Received: by 2002:a67:2684:: with SMTP id m126mr8118544vsm.30.1629382872526;
        Thu, 19 Aug 2021 07:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629382872; cv=none;
        d=google.com; s=arc-20160816;
        b=nQ4nuk8RaDv5WBMp91lamxG3zfqAe+sKzEt7T7V5Q0nqEqDdUgPnr2e8+6XQkYyKDn
         XUTAR0k8N8JGz7FO/ZYqdue5nqMMhLn+XEarv6s1lXn0DfMobDcXvqTWe6/pJ2CQhu8p
         mQ0eHICc54ebsUhYUgVbbeObAA18GV+9/Ld/Ry7ju+r9rkvKNQ9CMC97ZIvIQqWho+r5
         DTB60AL9yJRXhRw1eShgAl8s2n41yfTb05Y5qsOQYEXmn0RjlfwKM9jVGTX9cWINyuJq
         yOVLOvi4MMZQt8j3Z2kbTlf0cOb6MxKn0EU1V94x9Q8SzP/vGJSL9NzaiKvuO4OBZvOZ
         wmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S5J953m8jthIx8YKw7RXWxnSJEtO9PzEi6CmU+gZmWk=;
        b=lxnvtZJBftQSHthd9x+B+z4R8KY2oQneJm5qgmAoYk5kYTm5g3mTKTcJL3RVpT3r3I
         u/SRAV5+duDHfb4GT57hpRHhQti07p/l8EbbZw3ibhJfMRVA16IqO6b88UbMWVJXR/iL
         P9pFfVT587A2JReDPzB5wwCB59VUtdJXtXLjDA0Zdc5S04dp0Zkn1deamoD5B1HK/dat
         NLHVCb8Qs7lC2fFRooOBD91Wxlq/V4LKqawCpgXgmIuuSoZDQ2rdl+9XC8P8wS55tOok
         qqvUe2kAHJJGkCg9nFvXEWKA67cSU066fp08GB61NJ+k3XDI8KDXVpyYr87SiMpDjqaP
         hm9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B2nXs2/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si1871786uae.207.2021.08.19.07.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B2nXs2/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiut-0002sS-Mw
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuf-0002lr-2x
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiud-0006PR-Ig
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5J953m8jthIx8YKw7RXWxnSJEtO9PzEi6CmU+gZmWk=;
 b=B2nXs2/wnXkL8ocPPSKkwFP/eU0ogdX7ruMTgb/Sk6bpVNgY7sgo8ymDtst7DXBGI2FfdU
 p0LcqK4bcbteHVwZIuyTAVIYgweoXmaw0MZuBGiZHoWlFAdZHLImpyJifSPA7JgCvKRSRE
 GgddaWTs6+D2fxmWGRH8KIYaA91HjO8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-KIvUpzFjNXaOc8pfXhguvw-1; Thu, 19 Aug 2021 10:20:51 -0400
X-MC-Unique: KIvUpzFjNXaOc8pfXhguvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 g70-20020a1c20490000b02902e6753bf473so3572388wmg.0
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5J953m8jthIx8YKw7RXWxnSJEtO9PzEi6CmU+gZmWk=;
 b=ODFpVGtiUcutYkEv+IPQVs3uzQpbsjMGMsYcm7Src9wgO/vwMhS3e659c+RMdUXDzj
 1ydho7nXaO39qGAiBUStLWr5/oh1n2UYxBZ22J6jk5rQ/YMUuP98dDYEzfezogJ4seJw
 64QQWZhF/CLpXR9nyOU6D+O8jC7N8PPplGA8XQjkRwiYwnYMYiWM05dzEvj/KOOX1AKo
 4DWhcs/WtLP4dYQuyg87A7teX61NRSQQ8cr/gjn5z+WW0mPvi0wft5SuYrcjU4jtNuni
 bhIdkTdZu1C7mKyVdJr01H2+xyjVA0+njmWKSA7KFGvPCc7M9JXrn+PVYuIB1cU9RHXf
 W3VA==
X-Gm-Message-State: AOAM5333xFeDs16hd8V3jjfBCBEviTAxpGlok0bkW6QiDHVGJH46WN15
 WwRljg/hVRYi+u3ZFBQg6zHsEoELTN0WCKjlbeeSx77jjeujsSILr67mGNMz5DwPZ00x+P525gH
 QBh66TdN8gMJl
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr13857462wmh.99.1629382850632; 
 Thu, 19 Aug 2021 07:20:50 -0700 (PDT)
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr13857427wmh.99.1629382850326; 
 Thu, 19 Aug 2021 07:20:50 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n10sm2984641wrw.76.2021.08.19.07.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:20:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] memory: Introduce address_space_create()
Date: Thu, 19 Aug 2021 16:20:35 +0200
Message-Id: <20210819142039.2825366-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819142039.2825366-1-philmd@redhat.com>
References: <20210819142039.2825366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: icvCP/4wFD+0

Introduce address_space_create(). In is similar to
address_space_init() but returns a pointer to a heap
allocated  AddressSpace.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 14 ++++++++++++++
 softmmu/memory.c      | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317f..b353a48c25f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2418,6 +2418,20 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
  */
 void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
 
+/**
+ * address_space_create: Create and initializes an address space
+ *
+ * @root: a #MemoryRegion that routes addresses for the address space
+ * @name: an address space name.  The name is only used for debugging
+ *        output.
+ *
+ * Returns pointer to initialized #AddressSpace.
+ *
+ * The caller is responsible for releasing the pointer returned
+ * with address_space_destroy() after use.
+ */
+AddressSpace *address_space_create(MemoryRegion *root, const char *name);
+
 /**
  * address_space_destroy: destroy an address space
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 185f978c925..16a2b518d8d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2937,6 +2937,16 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
     address_space_update_ioeventfds(as);
 }
 
+AddressSpace *address_space_create(MemoryRegion *root, const char *name)
+{
+    AddressSpace *as;
+
+    as = g_new(AddressSpace, 1);
+    address_space_init(as, root, name);
+
+    return as;
+}
+
 static void do_address_space_destroy(AddressSpace *as)
 {
     assert(QTAILQ_EMPTY(&as->listeners));
-- 
2.31.1

