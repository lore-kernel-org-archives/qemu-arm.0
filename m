Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1403317ejb;
        Fri, 3 Feb 2023 05:45:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8QVgkug0f8v0ctxFiRAWqFIYSa5tcuoxRg5n6ajxbde1bgFwsnBXrxLBO44+JCtl3imfsh
X-Received: by 2002:a05:6a20:ca5c:b0:bc:e98a:8ae with SMTP id hg28-20020a056a20ca5c00b000bce98a08aemr8979403pzb.59.1675431940956;
        Fri, 03 Feb 2023 05:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675431940; cv=none;
        d=google.com; s=arc-20160816;
        b=xnWFTJygslntIVjWXaQzmUtwJYNcJl/FnUEE4lhnYaJbDQyzcVR4crVZ9pHu9+GCHG
         QghBbuplI1EoUvjSJSznqAAJwpfO5MCORVIRhQd8iVgkLE0gGTr8rA7BpIjRPKMflHXT
         d8BEDNHEueqId2GkeAukdvVZSb86hiG7+EGIipjZ8uPbBaeFLpxnZwb/ax6nDJMd7HXr
         6xQUmbNsxyA0r6vKyat4R/YR7D2dDlDgx0uz+PubNSZMvrCEB47sStUtP7N6ymWTNI8T
         V6kKGVhMkmpwrSVs5BYrMRJyrCsBljmxtNwqdzYe0aqeeV60ioz5WC6b5xJ2ncxHUshu
         76+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=3O8Hu2Eff4RtUTfyebeMbncBmuF855AAStNr0xiY9Dk=;
        b=q4JC4jeQta3dG2LJO5XbwgVen1wsJLyXv83iYqpkNaSDsQN+O5/3eLktegYRq477oN
         7wpwXPzPQNVhe0hR48bQNvtng9K9s64YlWN5bY5rRqlHlxp22WQnvhO+RbQOj+TQu5Kr
         DYgGQkJxTdl74PljOCFgBKAlphgUrvKMdAdT/iNwqlOUw17mLJhofkIggfwNzkpwHPjd
         zPBBrddUkEiIKpD81/RXF8x44qHmqbygkDYWsVkA2m59BVXLgvAkBTd22bBklI4UXij8
         HgVq7UO1g0fLV9uW0FcR1qkFATQZ+osLJrw9RIPGyOkCQCULJZLed+Ki0cu4Rp6H+5YU
         dFyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IZ7sI51U;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id f12-20020a63754c000000b004d81d4a54eesi2642135pgn.327.2023.02.03.05.45.40;
        Fri, 03 Feb 2023 05:45:40 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IZ7sI51U;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbjBCNpj (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Fri, 3 Feb 2023 08:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbjBCNpg (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Feb 2023 08:45:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37128DAC8
        for <kvm@vger.kernel.org>; Fri,  3 Feb 2023 05:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675431887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3O8Hu2Eff4RtUTfyebeMbncBmuF855AAStNr0xiY9Dk=;
        b=IZ7sI51UcGYI3AdxTWoX4zZGbQhFl+6h38nUO/ev5rGDH9ZH4T5dKTr7zcF//Sn1aTvAJ0
        4KJcJ3oImxn+LCACrRuNO07RpaYdQze6gVW3t8CHyZ8jJY25XLOtkDhfQe4zvBmTBtCf9V
        1VqXfHqZcO0X4egUX/JtvvP2+bT3cGE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-2I4wLs87PpOfqkIBVRLcmQ-1; Fri, 03 Feb 2023 08:44:46 -0500
X-MC-Unique: 2I4wLs87PpOfqkIBVRLcmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13C9B811E6E;
        Fri,  3 Feb 2023 13:44:46 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.192.149])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 23E22408573E;
        Fri,  3 Feb 2023 13:44:44 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v5 1/3] arm/virt: don't try to spell out the accelerator
Date:   Fri,  3 Feb 2023 14:44:31 +0100
Message-Id: <20230203134433.31513-2-cohuck@redhat.com>
In-Reply-To: <20230203134433.31513-1-cohuck@redhat.com>
References: <20230203134433.31513-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: r2pVTHciHWwh

Just use current_accel_name() directly.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0bad7..bdc297a4570c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2123,21 +2123,21 @@ static void machvirt_init(MachineState *machine)
     if (vms->secure && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
     if (vms->virt && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
     if (vms->mte && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "MTE to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
-- 
2.39.1
