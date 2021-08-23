Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2037587lfg;
        Mon, 23 Aug 2021 09:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnfUoZDUdHfQaUyc3HZGZb096U7RswG2wt9r2GE2y+wHAZc1JGvJt47N4o9wlQSE9/7oCt
X-Received: by 2002:a37:9643:: with SMTP id y64mr21361164qkd.213.1629737749111;
        Mon, 23 Aug 2021 09:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629737749; cv=none;
        d=google.com; s=arc-20160816;
        b=JD2fbaYkX479r/rxnGG+c7Xe2hK+Hky1+j2l03j61mCtkyZxxIOahhuIwpHzfARgCL
         5Dw125vf1EHNSRc0hk+VAhtr0E+2xwZRr0ipd4dIoig6skAkQ7pBotOUMQ6oe82b4yyA
         /1li9dFKQIntJi4/uga4DUVoK5iUFAGn2ANQvip3UE7PyDTf7Mqc1v0BkDHAwW0DoHg6
         1g/loicxuDSDtbBK/pQKm99EaDwr7EGFVKMCWv8Me0di+Dw1qiQf6rCn6kg4SKmXANqs
         CebVaBHFJHQIV8Y/dgoxKb2XMEAd1x+t5o95sUtIFfXpaZ228LMJhbeoYB1kkjYNXQEs
         xx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U6o7mUiS+x+yoYgYKCe3zRTvEmO9Jt50OpWWKAuJ49Y=;
        b=HauUG2EMw2g2O8OvVNZv2t9o+VlCHpSyf8fv1EXoJlYa5sP8ff9Lmb57b1AFYShZ1o
         ZtvHIpvT8615TSWzC6LC2/1GH/gmRxQX1QsFc+Yur43B1T2cA8ihmzZmefbpvYrQ8DPw
         UJPhrbcs+XWSIec0TSkyzKtzazbtcdmvrTmlEp6h+SVlGJTqRNZUV5XmaTUYsGLJ+dbl
         OhEkxai26/HL8GBEYU5snmsdTaJdq24hqwNhhEWnIwVxfHSA298nFT8yhjy4lr0LW5BI
         OCAM6Ix7HrR+FCfuP1YCOELwyB5JQ51NOKtebF5LYq1s/JUP5uSOin521zCsZTOIsSW+
         vcfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PCGBpfpF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si8967714qvm.67.2021.08.23.09.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PCGBpfpF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIDEi-00026Z-D3
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1o-0000bZ-34
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1l-0007VE-9x
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6o7mUiS+x+yoYgYKCe3zRTvEmO9Jt50OpWWKAuJ49Y=;
 b=PCGBpfpFaZLjYasU8P5D1Q+PzXu937UUu46siQYfyNn9ReyHMrp6FZArgH1c0PPcS/eZD8
 riJXLViy3LbYIXSuwWpZWl1GMSqjpfIjtQmvUctFHEHZtydeMOIytXt5kwqCJl4BBEQGq2
 fFjY3MoBGTGgYd3a5NeSxQu2jw0cSZA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-i3HOse9INgSZJqdnkBSYxA-1; Mon, 23 Aug 2021 12:42:23 -0400
X-MC-Unique: i3HOse9INgSZJqdnkBSYxA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso5168014wri.18
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6o7mUiS+x+yoYgYKCe3zRTvEmO9Jt50OpWWKAuJ49Y=;
 b=VJMLPlYJvLeBRArnn9fxB62KIUuoFCj1xDILPUv1dx2TNm+vwSjJZ3HYijeLmuPoOK
 JMSjNcGIidZynhX6B2E2PkdwPMlLUZvtqRtvYhOxq8THo7jkuajVUOHnaArNeyZprs/o
 /oNYMuVwX+76c02tsnaZ8FI2Ctf20k7MCG32zLJCrUzL8PORtzIWv2vMulcO+72dfWpa
 GyGpGHOKe0SsAIWAlrSNlIYpZzWRIBJTWcIW88eLDSo+ezjExiXRHkuIQ8B4xjjQZPad
 XFCY9rKJKVFO9OuiSGrvllEjJlfNHkb+W8R8SD1PiiCr22NxA9eukWV/8M0Q5FN0F/jr
 apfg==
X-Gm-Message-State: AOAM533H3TpI+GIrKEiusoDDq1DsiSCWX/EVJKDNc815qHB55j3S11VM
 7NNMZjPPSnElUJ9etrGzgO6G4ogYnnKwLKVZUMwLtZDdZDZ7iXb769rD911exHdhYMMJfsPcIK0
 aLESLJK7Da+UY9gZ68KnrOPD+cdtdGNRWOMXewpC8D8sKwRR2RAMhB9WhCFcyJ8pn
X-Received: by 2002:a05:600c:241:: with SMTP id
 1mr11269913wmj.93.1629736942376; 
 Mon, 23 Aug 2021 09:42:22 -0700 (PDT)
X-Received: by 2002:a05:600c:241:: with SMTP id
 1mr11269882wmj.93.1629736942128; 
 Mon, 23 Aug 2021 09:42:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s16sm8505653wrw.44.2021.08.23.09.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
Date: Mon, 23 Aug 2021 18:41:57 +0200
Message-Id: <20210823164157.751807-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WsQn4zMswi7w

Check bus permission in flatview_access_allowed() before
running any bus transaction.

There is not change for the default case (MEMTXPERM_UNSPECIFIED).

The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
using it won't be checked by flatview_access_allowed().

The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
using this flag will reject transactions and set the optional
MemTxResult to MEMTX_BUS_ERROR.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0d31a2f4199..329542dba75 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
                                            hwaddr addr, hwaddr len,
                                            MemTxResult *result)
 {
-    return true;
+    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
+        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
+            return true;
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Invalid access to non-RAM device at "
+                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
+                      "region '%s'\n", addr, len, memory_region_name(mr));
+        if (result) {
+            *result |= MEMTX_BUS_ERROR;
+        }
+        return false;
+    } else {
+        /* MEMTXPERM_UNRESTRICTED and MEMTXPERM_UNSPECIFIED cases */
+        return true;
+    }
 }
 
 /* Called within RCU critical section.  */
-- 
2.31.1

