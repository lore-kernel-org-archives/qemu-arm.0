Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3112265lfq;
        Tue, 15 Sep 2020 05:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/f2W2cHquiPjZJjtf5R+rIShtWCOAPLu73VCpPXau8cyytDI/OhTRLIvdMmQHxyJW34jY
X-Received: by 2002:a25:c00e:: with SMTP id c14mr21426434ybf.262.1600171960898;
        Tue, 15 Sep 2020 05:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600171960; cv=none;
        d=google.com; s=arc-20160816;
        b=03s4qiJ31EgJ6B5IwcrWQgOCTplBjyn6sGLuALgKIYMtHb3BQejjps0FdvSBxL1duW
         TCH2Tr+S6MqWyJhXOaDZbRZKDwLpN3HLKXfZ70RqBOW/9RtxliUum8bZz11TTlrCqOqI
         fbmkscaZ7+jVDi9D8zsueS+/PUZf+Q4s75lquT1bjy92JO4osLgDkk27QG491HMGxuiM
         mibL6qipUcPml8Uhxe5BtCckOih4Q6FmEj8mFPNa8bUvkR4aUkG2b8pn8//Su1tc/U3U
         Ul/vMYKAMkd/tbx6/GsbRhYwnAQ7gZQn1gvfRFoZkdHPt2snUmFmC+2EW1fKhXe3E1ZX
         xmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PRyKGHLsJskIKUHli+58EMbYUqU6UsfTTA6h02HEG90=;
        b=xjw4qEHFWOSjtLo1t2fjbsdu1dQkKHmCxHeqXomPlkF9KaJXhZolftNPz2gezd99SR
         EKT9AwN/KcM0SN0ahdsl2nDCrfEe6xp9dMuPUCNa2duKSi+5OAYR9uVgQgMRcGi0V5JS
         9vejdfRpUYNHWKRT3+dHG2Z2s6NlByKFJXJFuCEwVw131GjxpEZXAz5kvijMsYov7yl5
         18E5qtWMwMmuGtzN4dMiUNoupisTKmib1P3prMM27rK/Lrnb+JW7F6GwbDGLEqWDjtw1
         EAxeVuDkgkG8ZPzcCZEKtpmFWPTSeNxID9CgxjfnTutv077wuroNmhgVzGe++PazGalo
         N01A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PjKDvk7+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f93si14223248ybi.316.2020.09.15.05.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PjKDvk7+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9pA-0006J3-4U
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9mF-0003uL-Bn
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9mD-0007SX-Nt
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRyKGHLsJskIKUHli+58EMbYUqU6UsfTTA6h02HEG90=;
 b=PjKDvk7+b0fxXduhB2rf503YaHSpVXcKb7+T0woV0iGoPoZlM7XcijB/qdaYv5T0qHabUY
 m5MGivliv6G9416kpptD/rIasH3lQKynXhpdKJVID/npA8don+uvrFL7ug7dnE5IGVx/v9
 woWYsZtayjPyzmOKHwWndbdrxWhMrv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-YWWPk67dNImDxVM-L_znBQ-1; Tue, 15 Sep 2020 08:09:33 -0400
X-MC-Unique: YWWPk67dNImDxVM-L_znBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC3018BA28F;
 Tue, 15 Sep 2020 12:09:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808CD5F704;
 Tue, 15 Sep 2020 12:09:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0740040844; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/21] microvm/acpi: disable virtio-mmio cmdline hack
Date: Tue, 15 Sep 2020 14:09:00 +0200
Message-Id: <20200915120909.20838-13-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BIoi02n0L/J9

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

