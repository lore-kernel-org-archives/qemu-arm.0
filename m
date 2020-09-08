Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp547926lfq;
        Tue, 8 Sep 2020 05:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1guvFTMfSk0tPDqmwPO1pWQ6aCB4Jxju/rZqCbsCjyf85T/5CNXL330PpISOkC+42DOEY
X-Received: by 2002:a25:e4c5:: with SMTP id b188mr14595605ybh.79.1599567219436;
        Tue, 08 Sep 2020 05:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567219; cv=none;
        d=google.com; s=arc-20160816;
        b=b0aYPa2WoVY64zgVaF6uSDO6p2f19LU1nhZu+agKnJKhDoBL1BXWUGm8gIFdExNBoP
         Wn5O/DE5e0U/JspNcnTGyn+J2IGtdybwE/NZUKvTogWLrp/Xd3nknUkXfj6f044Z5SeR
         dMSVMTlNJIMqtp910igQ9J9nSPzBwQfiXGw5imuJihYijJ/UXJJRGI7OHgHaKAn3lBBC
         BR66N6Tq6ieILhJNjcloD+KyfZaUDsBAfIBjJRs6qcVdXAPquU1xzN6U/kmMuM+i8MZU
         MFJzr8XbljrsmJjUrRGkTybefzjgLkyq+JJ/45itc/an0e+4M3wp97bupGfync5S4wVX
         HMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PRyKGHLsJskIKUHli+58EMbYUqU6UsfTTA6h02HEG90=;
        b=ehVIFEMYsH25UhOQRbidNArSFzFIBo9fpXEQ2dIqWohaW/a9FyED9NWip499sDLZqF
         xQKrGEEq+LWkI9bKVC84xMalt2Yjph2jZCaFqAeqzRokFXRLFyg4xBY6+hluzAongmpL
         QbRAXFWoPle4UfnjrBR3sSmMNw8U1Ox8Galq8oyEHFyEk0402vVO5G0wKl56mRLusr/A
         bUMqppgayo3Q0llt0VTu5aNQNepjQB77iGrfXQWM7VaZ13xnGUgFH/Nedag7PriFN6/X
         gwOR2pyNoxFZ2NlAMFPe4L5cAVfaGgt1Z3NechYfbBlpNkbA8yguej2wk6brjozfbRgy
         usqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S0FRAM5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si22830043ybt.414.2020.09.08.05.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S0FRAM5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcVG-0004Yh-Rz
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcTC-00015A-Oi
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43119
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSy-0005g8-PC
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRyKGHLsJskIKUHli+58EMbYUqU6UsfTTA6h02HEG90=;
 b=S0FRAM5ZlJOZajtR4jynCn0aBGSr1l19ua8xtTULRva6kIyqNCwm7yHPgoO4MsxzpYlEhx
 Xe0bS7+wTzk+t7fqb1UZ+iLsuqY4EEfiIHgX6vGw6o+VFnjPNoUP7OhF3M9SvDIhea9/32
 +LxCxGA36SxcF+cGo2CLB+6UzOJk7c4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-8hkzMuabMlGF0j69SZRWAg-1; Tue, 08 Sep 2020 08:11:05 -0400
X-MC-Unique: 8hkzMuabMlGF0j69SZRWAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7189212CCE0;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 239085D9E8;
 Tue,  8 Sep 2020 12:11:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 004BC31E66; Tue,  8 Sep 2020 14:10:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/21] microvm/acpi: disable virtio-mmio cmdline hack
Date: Tue,  8 Sep 2020 14:10:41 +0200
Message-Id: <20200908121050.1162-13-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EtUMvuYAFoAg

... in case we are using ACPI.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 hw/i386/microvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 54510a03f754..04209eb38fbe 100644
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
2.27.0

