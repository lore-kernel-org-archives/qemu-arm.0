Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1440233ejy;
        Mon, 19 Sep 2022 16:19:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ugYEJDcNtlwpO47c140Av3U/vAfFtqoeLxGzd3Z+3dtK3wxpX76+1lKr4PNEM1g4Yx87k
X-Received: by 2002:a17:907:da9:b0:780:5fe8:f8d7 with SMTP id go41-20020a1709070da900b007805fe8f8d7mr14655468ejc.357.1663629591140;
        Mon, 19 Sep 2022 16:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663629591; cv=none;
        d=google.com; s=arc-20160816;
        b=gjJ54IjlLY2l8ZaUOyopbGg/yVfTW1vDujBIms5f934gJn6OeSGwd5c8wzM3m5yQIA
         iNPzcqtud5Zvg+6fqYH7vWf5TriBqI5M/3mKh3CRlczkG2Bet1jzNS0CyylDbuMWf5C7
         kaSNrIw54y1LaGTGwiRJA8I+ICGYyRJu6q4sZlScMxpf10R6Kp215MHl0Pgi3QVbk4eQ
         xXUzLhMmgDJnuRkSTY3j8TnJBIw4P45UWfiYq8Wi+Orf53RgI9jiGKtA8nJJycTgMeBo
         8bFEaKkG+nSVrfUGHvUQKxi/pKmR7RHl6MDkUiI0Gosxz1ZJdzS84Fl+OKwnvIDnaHg+
         W8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=CsS8/+NcmmUwF5Nr1L7YiFLpUSnCt26Ro0cbZ1iTpA0=;
        b=vFz+M+jAz54LcgfkGYxNP99VAe0ww5hEtqdVJMAy9nkXF42MyInzS+lkY7O1o8EoRD
         oR6eMm0otFVfIc8KySm+dh7Ts7LEOgIxBb47b8GnkHU/BIWK+yuM95l3c/jlHgehZaHx
         mlei1UHoBfQxuomz9a0x6CcqLJqPazLVQSW25/0h0FwQcB7SHjEJERIehyIPMoQ4V2gh
         STw0nLcjiyj3e+DouaBK5xw5mvqFpgYH6B2frp5kO0tI/jT8IVDYtRKu8xt4Ks/p9bub
         4JiXmu1XUJqasX3qW61QGUknecoZu/gZ4Yc7ONSBYDWtgSKnIAbQYaye7emrLqJIb/pj
         KZtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvQxLOmJ;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id hs13-20020a1709073e8d00b0078049ab4bbasi13406517ejc.526.2022.09.19.16.19.51;
        Mon, 19 Sep 2022 16:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvQxLOmJ;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiISXTr (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 19 Sep 2022 19:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiISXTO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 19 Sep 2022 19:19:14 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FE95019A
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 16:19:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id q21so1351622edc.9
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=CsS8/+NcmmUwF5Nr1L7YiFLpUSnCt26Ro0cbZ1iTpA0=;
        b=LvQxLOmJmGVQ6sYu0MsAHfg8Ds6mykcGi7e3toDd9OFsfFEnWXTEkQZsRgcA0qsBVK
         Ax5qZ/FGRkcXZjgQXjmpXzOndgONzyLEOfYdR+g0wP59Ui6GKvlOYss+hr/WgF94LAQG
         ax/WwLFBL1+LRyQIy+7lhc0PSm9DLccB1NsqeZVjbmbqGQFnyw6exKqa/w0WN+cCU129
         HszwSLx/FOWeL2QB5xupKDxKOyewPDDsvvE6piEkWTsl/i3Bmnlz2slYtvmUZUAw6hb3
         NZGTv/8KL9eBHuB2KB1+1rAmJut32xrcuUgfT1HQYK6PmCKcw+vZEvVx72whU341ZIbN
         rvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CsS8/+NcmmUwF5Nr1L7YiFLpUSnCt26Ro0cbZ1iTpA0=;
        b=h9iPQz+FG/q72vFI1qLOYe2y2zVUh5zjlu1Nw6nnlNSqzGYwqruSjFrX3phtV5hKY4
         VtD9GF64Z7ywg1xeFKAfIfOAsWKrw3rnScsP/G8bHNO13k6zPAUPv96FuDey2CsKJaWn
         cB7HqrbBcqRrXOtPV650rCt6yYb+nDSU49vhgKJ81F0nXtharpSmQzpov5MlVOZCn9eP
         +gqjZv4XjmCFSkAEHL9RKdnaqwAhLHaSLLzPN6UOkWZ+HYZCcs+y7v+kTk2kD+UKewXp
         d+gop5cIH41RtH8phnEdJ2FrbWSXvZ5XPENSVNzGLbzHJjGBn+9oR26yt+A2uAjiKS9U
         FJQg==
X-Gm-Message-State: ACrzQf2aUUqhDv65PoMIel0OBXYXiDJzLkjrf7CBsD/IgbDtyzHffVEU
        wcOZG050jz3IquCZzx6WEaY=
X-Received: by 2002:aa7:da83:0:b0:44e:69ba:81c7 with SMTP id q3-20020aa7da83000000b0044e69ba81c7mr17400003eds.323.1663629551883;
        Mon, 19 Sep 2022 16:19:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
        by smtp.gmail.com with ESMTPSA id rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 16:19:11 -0700 (PDT)
From:   Bernhard Beschow <shentey@gmail.com>
To:     qemu-devel@nongnu.org
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Bandan Das <bsd@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Sergio Lopez <slp@redhat.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Xiaojuan Yang <yangxiaojuan@loongson.cn>,
        Cameron Esfahani <dirty@apple.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Song Gao <gaosong@loongson.cn>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Greg Kurz <groug@kaod.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Markus Armbruster <armbru@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
        Eduardo Habkost <eduardo@habkost.net>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Helge Deller <deller@gmx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Havard Skinnemoen <hskinnemoen@google.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Alexander Graf <agraf@csgraf.de>,
        Thomas Huth <thuth@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Eric Farman <farman@linux.ibm.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Alexander Bulekov <alxndr@bu.edu>,
        Yanan Wang <wangyanan55@huawei.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        xen-devel@lists.xenproject.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Snow <jsnow@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
        Qiuhao Li <Qiuhao.Li@outlook.com>,
        John G Johnson <john.g.johnson@oracle.com>,
        Bin Meng <bin.meng@windriver.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Alistair Francis <alistair@alistair23.me>,
        Jason Herne <jjherne@linux.ibm.com>,
        Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 9/9] exec/address-spaces: Inline legacy functions
Date:   Tue, 20 Sep 2022 01:17:20 +0200
Message-Id: <20220919231720.163121-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: XRJ4sjCmBBtM

The functions just access a global pointer and perform some pointer
arithmetic on top. Allow the compiler to see through this by inlining.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/exec/address-spaces.h | 30 ++++++++++++++++++++++++++----
 softmmu/physmem.c             | 28 ----------------------------
 2 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
index b31bd8dcf0..182af27cad 100644
--- a/include/exec/address-spaces.h
+++ b/include/exec/address-spaces.h
@@ -23,29 +23,51 @@
 
 #ifndef CONFIG_USER_ONLY
 
+#include "hw/boards.h"
+
 /**
  * Get the root memory region.  This is a legacy function, provided for
  * compatibility. Prefer using SysBusState::system_memory directly.
  */
-MemoryRegion *get_system_memory(void);
+inline MemoryRegion *get_system_memory(void)
+{
+    assert(current_machine);
+
+    return &current_machine->main_system_bus.system_memory;
+}
 
 /**
  * Get the root I/O port region.  This is a legacy function, provided for
  * compatibility. Prefer using SysBusState::system_io directly.
  */
-MemoryRegion *get_system_io(void);
+inline MemoryRegion *get_system_io(void)
+{
+    assert(current_machine);
+
+    return &current_machine->main_system_bus.system_io;
+}
 
 /**
  * Get the root memory address space.  This is a legacy function, provided for
  * compatibility. Prefer using SysBusState::address_space_memory directly.
  */
-AddressSpace *get_address_space_memory(void);
+inline AddressSpace *get_address_space_memory(void)
+{
+    assert(current_machine);
+
+    return &current_machine->main_system_bus.address_space_memory;
+}
 
 /**
  * Get the root I/O port address space.  This is a legacy function, provided
  * for compatibility. Prefer using SysBusState::address_space_io directly.
  */
-AddressSpace *get_address_space_io(void);
+inline AddressSpace *get_address_space_io(void)
+{
+    assert(current_machine);
+
+    return &current_machine->main_system_bus.address_space_io;
+}
 
 #endif
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 07e9a9171c..dce088f55c 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2674,34 +2674,6 @@ static void memory_map_init(SysBusState *sysbus)
     address_space_init(&sysbus->address_space_io, system_io, "I/O");
 }
 
-MemoryRegion *get_system_memory(void)
-{
-    assert(current_machine);
-
-    return &current_machine->main_system_bus.system_memory;
-}
-
-MemoryRegion *get_system_io(void)
-{
-    assert(current_machine);
-
-    return &current_machine->main_system_bus.system_io;
-}
-
-AddressSpace *get_address_space_memory(void)
-{
-    assert(current_machine);
-
-    return &current_machine->main_system_bus.address_space_memory;
-}
-
-AddressSpace *get_address_space_io(void)
-{
-    assert(current_machine);
-
-    return &current_machine->main_system_bus.address_space_io;
-}
-
 static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
                                      hwaddr length)
 {
-- 
2.37.3
