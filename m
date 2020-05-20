Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp578314lfb;
        Wed, 20 May 2020 06:26:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWr1PKv+7706hsc6o2hvRO8sa60vf294ZIi3r0yNT5eYiuZh54BkOFbN3S3naSCBDi+dbm
X-Received: by 2002:ac8:4cdc:: with SMTP id l28mr4706380qtv.213.1589981190723;
        Wed, 20 May 2020 06:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981190; cv=none;
        d=google.com; s=arc-20160816;
        b=COwj7UBriamYB2T2ww40nnacqMqDM1+N8klgMPst2JY0DzENc682Hah4lhmTg14b4w
         i6h1Tx3XmngxOkWvGeMTzEK25ZGqGfsoWSNPj8Xd1EcdTAXe9dInWBxHn0UZR+0r7mvD
         zDLy+Y9/TlSafkFAudVHlB1tKV3WfNPMTJAykGrgQ1sMH2G9x8WN8vHPowgdwwlhoRWQ
         ITX61/yhzjugONOnNJS7LY5/gvGemGXLVOYM4LOTZ4taCZG7WUMOzYvyUiz2Fdy3IHqK
         8yMjd3FJEUFblGnShLaatSoKkyUU/jd69zxZYOG9/WeCAbaeyCokSo4YuN8bnWLVK2UP
         wkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=2msO/1+vqpbDkNl4/pvOT0xxBfnL++oCQrrjhXIepns=;
        b=NHOJPk8mt+9mD3rol3Sc6v5tFJTyH6xl7DXWHF+yTWTus9vTemw2Qrc9BqWJO2BrPZ
         lbESIubZWn18TP1fN/A4UVrPTAkXpKX/nHFFQudLzWEViwTKuJ7YbimycqiJ/1RPu2Me
         CuAo1QxOZNRUFgrMNTLIkAvXKSbbzu19KvwYcm90bCu5SRCt+IhVqVmeLcSSr4dbj6JF
         FScpFI3IUz+ZAdcsWZ/rtag+CC5A4VdGqKfz4ZiAlhusGi+Mwcclyh7c03nsw0wPn5Xs
         BSu2j29WYJihjzNSm/khe9HEEJYOpDlPZZ14sdfT0HVLtD5kNicgP+Ht9LAEp7hTaO0G
         SSgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KZUW3r32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si1515703qtb.237.2020.05.20.06.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KZUW3r32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOju-0006nF-38
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeL-0002Px-15
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32719
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeE-0000KF-Gx
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=2msO/1+vqpbDkNl4/pvOT0xxBfnL++oCQrrjhXIepns=;
 b=KZUW3r32O4spS+ma+vZE2FPg9w1wjrcbIuJyrp0O/mtcMkClmtZJWD9UMU9MBAjMw3PlIS
 DkN1XK2mbieiLa6d6VcqlPTH0y9eet6WUOvNURHVqDKy+R6BeYVgcGiT3wuj7mU8ksd78M
 nXdPOzfjk31F76BWUuk0sncthQrzZIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-tONqx_N0Nry61XJifatxmA-1; Wed, 20 May 2020 09:20:33 -0400
X-MC-Unique: tONqx_N0Nry61XJifatxmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 648551902EC6;
 Wed, 20 May 2020 13:20:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57E8C60C84;
 Wed, 20 May 2020 13:20:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F9679D72; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/22] microvm/acpi: disable virtio-mmio cmdline hack
Date: Wed, 20 May 2020 15:20:01 +0200
Message-Id: <20200520132003.9492-21-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0GuRVwoC3Zo6

... in case we are using ACPI.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index ddb8570a2915..602c6a8f75f3 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -362,7 +362,8 @@ static void microvm_machine_reset(MachineState *machine)
     CPUState *cs;
     X86CPU *cpu;
 
-    if (machine->kernel_filename != NULL &&
+    if (!x86_machine_is_acpi_enabled(X86_MACHINE(machine)) &&
+        machine->kernel_filename != NULL &&
         mms->auto_kernel_cmdline && !mms->kernel_cmdline_fixed) {
         microvm_fix_kernel_cmdline(machine);
         mms->kernel_cmdline_fixed = true;
-- 
2.18.4

