Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp549378lfq;
        Tue, 8 Sep 2020 05:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoR3YYgqQt6nk6oDyeOnBbLhFFy9ArPduIDHM3AYKOYounxAnRLwObDP8cobVIrRSGpMR5
X-Received: by 2002:a25:d113:: with SMTP id i19mr34572711ybg.452.1599567338526;
        Tue, 08 Sep 2020 05:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567338; cv=none;
        d=google.com; s=arc-20160816;
        b=vXPzZPwHOwLNsbZL6k7cr+/CnS5H6Ekn01S310HZwyP86TcHW1mW+K2mjiNnruyEe2
         QmEtSfWazs5fRiiAyGCdP/335uCMOYgzrh2PJ10G9mCueJYOqOXC1NVGkG4KbX8ni7tB
         qDGXJclYOZ2JsaaoQ+a31I8SUaEXoAKTU3O41z8pcnajNJYaNLdpDso5ifSkpyXqcmZv
         H4KLac5aaaWL8KMfAMYEP1AL6DlSD93pKGAllvVBtWXy5Urlsc0CcQgiAIolPgctk/0p
         983BQygJEZ+c0P4JEOtTELoQPmbk/OC2jR1XmPdpijVFpKCYhCGdFKjXpsSVSKS5Bk46
         +50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XodglbknydKLB1ivUZim6r2Uu4EdKznXo82Ez5O130g=;
        b=rcxUXmOltjm+sWkqE7kihYUgRySXGxd3uuwWIrRBJPfDc1wGfgW3CJtHosYmEQl4CI
         Dt/acE6eJu/pzuYWLnc6Kn4VM48vGbCFoxm2CAMqDDt5mYDpWDtkKa8jOJRM3fcK0xAg
         8H604utvT3wY4IwkR/BAluLen3LaGjTFzPZaY90Ie4gcVJvbc187aeDPPPifmrJzxx5D
         E+yb1yqFgcX68IFw8Az75ovOaqMCfajiOeK4tb77xmLT8Ci30jgezt2ADY4RqZdJXn8S
         /Yi7bC31XMi3PC4elwH29EN7rzVmiP479uEt/stRGkhVql7d/WeM2D6zMIw/EAQOJ3lx
         ahwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GI3qOMGn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v143si17166227ybv.255.2020.09.08.05.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GI3qOMGn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcX5-00072z-E8
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcTH-00017l-Th
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40697
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSz-0005fe-6U
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XodglbknydKLB1ivUZim6r2Uu4EdKznXo82Ez5O130g=;
 b=GI3qOMGngzsXjWHU/S8Z+ZTscdxI1N2Wb2zKWO8vZRMp1mh80VhD+HUdHnq5ZETi/5F8Uz
 LSJgPzKQz51URIdHMNhdN6qpRTsOXCLr+S3WkTZihiXr8LttZd7b7rPTMIxcDD5Gg8bgKF
 5oHC5HSPD3C8MfaISMVDB8ve/GFd3Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-Dzg564u2PZy4MeqPQxKc9g-1; Tue, 08 Sep 2020 08:11:05 -0400
X-MC-Unique: Dzg564u2PZy4MeqPQxKc9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE6310BBED5;
 Tue,  8 Sep 2020 12:11:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4325C26C;
 Tue,  8 Sep 2020 12:11:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B28F31E67; Tue,  8 Sep 2020 14:10:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/21] x86: constify x86_machine_is_*_enabled
Date: Tue,  8 Sep 2020 14:10:42 +0200
Message-Id: <20200908121050.1162-14-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BPEptZWQbcM5

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/i386/x86.h | 4 ++--
 hw/i386/x86.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 4d9a26326d31..b7ee3be5ab1b 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -101,8 +101,8 @@ void x86_load_linux(X86MachineState *x86ms,
                     bool pvh_enabled,
                     bool linuxboot_dma_enabled);
 
-bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
-bool x86_machine_is_acpi_enabled(X86MachineState *x86ms);
+bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
+bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 
 /* Global System Interrupts */
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c1954db152eb..e2a5005f389c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -821,7 +821,7 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
                                 bios);
 }
 
-bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
+bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
 {
     bool smm_available = false;
 
@@ -863,7 +863,7 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
 
-bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
+bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
 {
     if (x86ms->acpi == ON_OFF_AUTO_OFF) {
         return false;
-- 
2.27.0

