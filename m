Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1842092lfm;
        Thu, 2 Jul 2020 13:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNxKv25lZgToI67oBg8mEarKyFDBgpPwV//AdF7NVVdopoeOwcJ7WnSBZ0N7QmrVDaZbyD
X-Received: by 2002:a25:6c4:: with SMTP id 187mr29140460ybg.416.1593723533351;
        Thu, 02 Jul 2020 13:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723533; cv=none;
        d=google.com; s=arc-20160816;
        b=fFOh1LDRHQM0jx7L+CpTrZ24A8JpFYkS1MOLLjH4W+weuWV5/PzZx43IjyTc5ydvJe
         VvWn6pxBl59gnzxc2c5A+h6ekgtddrl0HkmnIXm5WKDYu6wFhySJqPhYGhIR1Xs99kDv
         MGk4kSb3GcPPpvGZ0XjJVdMOPk7PvnsYFQVTEytRKgSVqyPIukuie5q9nuGL3IGEVS0r
         LHWLVb7DM8YWH55Zw3SoOgsrCXE4i/5AK16D4w+sbFUO5RbsWhPj+i7UtmjEccMbaTbd
         eYWGrdnBoI98UifUQvohjJ2WlXlI1hvUa1CkFmRpUw18q7yqAMN5BHffHV6a8n+9U75A
         vfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=sQJ0YdLK1hV5ZbuEPLWSu+ZGB5W4m1BLGPxWcQ/+h54=;
        b=IaQ7IMHObuA8904EBoTPTQUIo2uw9KYYKigigmI3DpXKsea3bPRfGKsEXEXIf4Pqw1
         q4IR+vbpEvb41tBWgJeJBneQqMNkDERgUL0TQQPfUNVnGZtwkRJ2magc1eLoYa71rJJ3
         4EmRa5gO7/ERyn+sLB3vJ6DckQPFun8Q4Dp8kSJ41Rsrx59qFXrrEU76whRefKDWneiY
         LwRDzcTduuhK/W4bDQAU+ay+cm3sSG++0Ovr+sY3WdCkVBTm62CAVs1Rksh3ePhKfREp
         jb8qFOo5ke4TS/UwJz+hlEXb0a4DGd+5wtkEm0boW24QScQAsNjpxV78ujPDMnJpyqiD
         WOEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OcUz8kMi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si9918974ybc.15.2020.07.02.13.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OcUz8kMi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6IG-0003ur-Nk
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69D-0004cB-Gw
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41942
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr695-0003Yu-St
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=sQJ0YdLK1hV5ZbuEPLWSu+ZGB5W4m1BLGPxWcQ/+h54=;
 b=OcUz8kMiwcK8VmNC+Qf/LljNHCp1TcR0jQoiVhHF1HJcbCg+czAbmuOGhWhaA7j2Zulpvw
 1PnRfIfRB7VjbaaQDAM6Cxa3myvMGkmu+V8be0RGAKJ013dg2al3ngE0qUnhOUvLl3YAOE
 TX8dyj2cSTjeXQk7fCjvUHvromtDhmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-4RO1oTLeMEa74voM8PRBkg-1; Thu, 02 Jul 2020 16:49:22 -0400
X-MC-Unique: 4RO1oTLeMEa74voM8PRBkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B16A7107ACCA;
 Thu,  2 Jul 2020 20:49:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 261B67788D;
 Thu,  2 Jul 2020 20:49:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E1AF31EE5; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/21] microvm/acpi: disable virtio-mmio cmdline hack
Date: Thu,  2 Jul 2020 22:48:50 +0200
Message-Id: <20200702204859.9876-13-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v19acBgj9xoU

... in case we are using ACPI.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index ac605d92b984..fbda323f3b2a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -343,7 +343,8 @@ static void microvm_machine_reset(MachineState *machine)
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

