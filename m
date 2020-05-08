Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2669258lfb;
        Thu, 7 May 2020 23:25:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJVdLtDmVUWxxCRZmCPAMGfDkDoCZyY7uluJpWGbkCrhUv1tBMx55HbtZKs0d0r/KJkjFOr
X-Received: by 2002:ad4:4943:: with SMTP id o3mr1270573qvy.234.1588919130803;
        Thu, 07 May 2020 23:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588919130; cv=none;
        d=google.com; s=arc-20160816;
        b=qZSiYNicFGrsVfiHOUtXCitIvzPNjDL3AM4ed+RgqAW5FpaGqRWfWfOi10mCIyLCKc
         wwjNrw1QAl3uGjTDS3Ab9u3cu1FI0YVP+KUuT2JHj6v9yVu6ayRlVDHeXXT/DNIZYJ5U
         HLTA6YsBRuw2yb39VuJGB15hFcQ2WXXZGBpN8oehc0ttQGXuVcFHr9QStABt0O6am5iB
         8xba1qPVxKyadF1kioS5k8EruQsjrgmGfCN44DQHM+cVY9WQJtpckKLNQyx11oMjAT6y
         as7yWrnN5XooQTCJv37xHozeP7I9E829MIUQ65WzEzZkfkL2KLHRBygkJWabX6JO2Gbp
         U6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mGx/dTXfQHoDJmnNnl9rdEL+ySusKrZpYaooZdERTQg=;
        b=sAHoUEYidPq+sY1AH7ThAWwa7EWmiYNYN9yl/k+EXbXpyNiQ+TvrdQnUDAXQKYIbxA
         uY7Cd8AzIV0qDD/iHGM5Vzn3OPnoQV+Hm7+dEuxCEGSpxr/73m3wEHzFHwCewLt9Xmfc
         oaK98N+Rd5r3btu7/Z1SmW5Awa7tc48BX1BR1OQ1aBlRwYcWnI6VTYjQ9LvJydbYTx3y
         Ux+mgmXwwFc/gpgjrs5aPl7dwrx+Kx7FsbK9uUw0Q5t9PaWKFe1GscUXAHdqX/UtNAJf
         Rs4CuJqaBDsZRxZsLmnHCyQzypB2Yzgin5v/dh7TvAmqbOTJn0pjJnAuECHPIqTnXJhG
         joXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BKIisuaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a21si374462qkn.218.2020.05.07.23.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BKIisuaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwRu-0006dv-5q
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRf-0006Qk-Q5
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:25:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33981
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRe-0001hR-S1
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGx/dTXfQHoDJmnNnl9rdEL+ySusKrZpYaooZdERTQg=;
 b=BKIisuaKYe0PYc+XvzEbVYiUqybncWaUOhKQh6zjPSScFnSb4xgzBrDofYuUIKzOzIWMiw
 zzfqv+zXY8mcNVtiP7ndsOocUb9pEz+I2pinM+IcYek+vhp49985J2l8W2bfo3ItCMs78W
 LHmAg6QzcBakMwaWmHBDALqAPwN0xww=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-Gs6gBkZ7NKeuEyY-rz1wXA-1; Fri, 08 May 2020 02:25:12 -0400
X-MC-Unique: Gs6gBkZ7NKeuEyY-rz1wXA-1
Received: by mail-wr1-f71.google.com with SMTP id 30so389330wrq.15
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 23:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/X92jlC3Vu/v6alIjmmIBaqm0/vlTOTw1XjNVQ1CnQ=;
 b=O7d4vSFWeA3lIL2CkCeEHf1kzOimcH9G2ruQBZRgFkcKFIv1BHbUtpP4lJYuEqnc64
 sX61HDuMjSBnHY8h8Y8S+VKcqjyLscpObU9dnH+SFFhZ40M2dg5XdFH15ERkySboQqqj
 4XXsH1kFl1MfNxi//n+RER39NVlnXFVtJHcsB3nCnw/SbLtuetq91hM1N73Ay9+Dtd6y
 tDKCZr7VFsUez/uvkgb13lwO5GprG2GlBk4Tz8+0rMilkIOjBMRTgIqPd6zzBuVkmb3k
 DJt4i8Q4HbEzdyhRwyCorEAjlmCpmqciblzlBC6xDLcKYHwLsUSBdYhgbPQJ9nwfxOXs
 nUdA==
X-Gm-Message-State: AGi0PubdTPbHM6kokokruBoYbscdTCdNiUdbBkrlgN4OFuarxEspTcJv
 1xfuumEFL6Md2qD01To11L3Of9MPWk+HmKXvG9HtrOcs4tv4UTVKHXhof9F+js111eJAUG2C86c
 f4L223S8FvJxu
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr13518164wmc.114.1588919111424; 
 Thu, 07 May 2020 23:25:11 -0700 (PDT)
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr13518139wmc.114.1588919111241; 
 Thu, 07 May 2020 23:25:11 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id d133sm12809537wmc.27.2020.05.07.23.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:25:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] memory: Extract memory_region_msync() from
 memory_region_writeback()
Date: Fri,  8 May 2020 08:24:54 +0200
Message-Id: <20200508062456.23344-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200508062456.23344-1-philmd@redhat.com>
References: <20200508062456.23344-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NCEJWrHoXR7K

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/exec/memory.h | 13 ++++++++++++-
 memory.c              | 10 ++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 1b7cfdd5b6..3e00cdbbfa 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1473,8 +1473,19 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr);
  */
 void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize,
                               Error **errp);
+
 /**
- * memory_region_writeback: Trigger cache writeback or msync for
+ * memory_region_msync: Synchronize selected address range of
+ * a memory mapped region
+ *
+ * @mr: the memory region to be msync
+ * @addr: the initial address of the range to be sync
+ * @size: the size of the range to be sync
+ */
+void memory_region_msync(MemoryRegion *mr, hwaddr addr, hwaddr size);
+
+/**
+ * memory_region_writeback: Trigger cache writeback for
  * selected address range
  *
  * @mr: the memory region to be updated
diff --git a/memory.c b/memory.c
index aa1f807392..ed26514c89 100644
--- a/memory.c
+++ b/memory.c
@@ -2197,6 +2197,12 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_=
addr_t newsize, Error **errp
     qemu_ram_resize(mr->ram_block, newsize, errp);
 }
=20
+void memory_region_msync(MemoryRegion *mr, hwaddr addr, hwaddr size)
+{
+    if (mr->ram_block) {
+        qemu_ram_writeback(mr->ram_block, addr, size);
+    }
+}
=20
 void memory_region_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size)
 {
@@ -2204,8 +2210,8 @@ void memory_region_writeback(MemoryRegion *mr, hwaddr=
 addr, hwaddr size)
      * Might be extended case needed to cover
      * different types of memory regions
      */
-    if (mr->ram_block && mr->dirty_log_mask) {
-        qemu_ram_writeback(mr->ram_block, addr, size);
+    if (mr->dirty_log_mask) {
+        memory_region_msync(mr, addr, size);
     }
 }
=20
--=20
2.21.3

