Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp605938lfq;
        Thu, 17 Sep 2020 06:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgwP9CZOLxrqGRVYUqmhHq9Aq0oGQwjxallMLd/leZo5uxaLVgRFtjFcjsi74mLxR4SXkD
X-Received: by 2002:a25:b948:: with SMTP id s8mr13731869ybm.443.1600351173664;
        Thu, 17 Sep 2020 06:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600351173; cv=none;
        d=google.com; s=arc-20160816;
        b=nDIPO8vcrgAb1bTwuwJkN+DzOAf4p4tTpowBKU0tpDHAKvZQa7Ziz9q7VMydl/uid3
         6REAxHiVr4xpwhhUYDiR6TInOq7HTb+jIz0bq6HWsV8Y2TRSbmWxW6hWEy9e1FCqb2U+
         Ub+BW21iaihig0+iI9CRcVgU/rIDFblPSh4gmH0hq5A13DSeD+B+zsXzYLfM9OG4XuP+
         K1/dnLZG5l0/pFk8YJChHgbtC7uUH1VkdU/bdlbTp9VlA84CSJwpjMKktlYeM+iVTJdy
         rOHzhsJYfJYi5xa4pKK+FbePBSw65vE+1t1SYwfgVenz2u7mSSAItQDz1Yqr4oYn5WTb
         ldyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8thKQIwuLTZAgWNn8lV+yrwLMliMZT2x6MVCovLEtGY=;
        b=EII2rYiNtRvTKbKM7/9GBAKguI+9SITfJHcstmQ7nOIxt/S6dyLtpcmyy/h8aILB3u
         Gymrjmz4kh+mTC93Eua9SjcMRY2upaAEIsXa+K+DIEjWSuqnrcqZnMVw/QdUxuCykFzs
         9xWNaYKRTiZD0shW5swaScRf3bSBC25rCkX0tc/qa34hLnXaMta2YysJOSgXo3XMRmue
         Fe68VA4G7Vr5xAIz7wF3DXX47sx2ThCN1AnFnbGGjVBpZ08Reuunr4ZBBRJXBqso+6GD
         C4CuLJChWaC3pOyUyI9ETOxq/6PJE3TsUFgDn93SywaPPBwwl2XnI+5K//6NyS+++s9J
         5EuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UEIDPH4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si21964546ybf.35.2020.09.17.06.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 06:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UEIDPH4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuRg-00088H-TE
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 09:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuMK-0008Uf-6w
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:54:00 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55108
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM3-00083z-LR
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8thKQIwuLTZAgWNn8lV+yrwLMliMZT2x6MVCovLEtGY=;
 b=UEIDPH4+t81MZOisE0AXSTwAisEFiWjFxf8UPsyPSGB2a022+MOXXWji6Mvui8t6ZVEWit
 QLIt+CHVNrpZIDrjfAfJbEKewMEY+4Aty8lMr/lxSNkgFlAqKnzRh20uKkxPbd1tD3p+kB
 zpXiOEeXTuREpurxUWoRfRNXKEVtVDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-ftRE2BA7MQeOchJ8njL67A-1; Thu, 17 Sep 2020 09:53:40 -0400
X-MC-Unique: ftRE2BA7MQeOchJ8njL67A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1962D64142;
 Thu, 17 Sep 2020 13:53:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 352D019D6C;
 Thu, 17 Sep 2020 13:53:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 26CF931E68; Thu, 17 Sep 2020 15:53:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] x86: constify x86_machine_is_*_enabled
Date: Thu, 17 Sep 2020 15:53:15 +0200
Message-Id: <20200917135323.18022-14-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:47:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fV0Upjr+a8dJ

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200915120909.20838-14-kraxel@redhat.com
---
 include/hw/i386/x86.h | 4 ++--
 hw/i386/x86.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 1a188a7deabb..25c904638c11 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -100,8 +100,8 @@ void x86_load_linux(X86MachineState *x86ms,
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

