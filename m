Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp607438lfq;
        Thu, 17 Sep 2020 07:01:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjOnL3bTOOl2UGnlsVmc9it9vmN+xykAs4cVXRfGe3rbOCgnQeUtbSiMHbXQY65OMqhzkg
X-Received: by 2002:a25:bcca:: with SMTP id l10mr41806099ybm.408.1600351280186;
        Thu, 17 Sep 2020 07:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600351280; cv=none;
        d=google.com; s=arc-20160816;
        b=akHQ4M2A1lf5HHjokH5HW5eDIe7C8X+KT1GyaUW0peHg8JDr/3cAFAcDnu8HDlOraV
         chnDhr/o3GS7xOeplGCXKeVO16BpIPIqlRcIpRdd6z6s0Pv67oUOiaov0XVQynMUOTbs
         WucnEJzVWF9mgkHhBw0BYwcTWW/3d2tIGqmUsdRd5McMB/Q9h+MI2MLVWMxUCREjna1f
         37NL1rlx2q73WvZEBwmD0wKmuTOO9tVVQhgxZz49yK4MhrMoVWbNwYuskr92HlVhJKfQ
         /ZdAdIEJ7UR+rYZJ9awy+SJcprXAD84NkV+T4XXIMNrmUKfsU8y8H/NpgAwfIFFgHON0
         zwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UGLxMrpkKhqK5mTfhq0kqEXzGV/9xdyAKVyd1JQHn40=;
        b=cVwsTEoBvFcq63+dHSIhfQGkKQQ6eCuJOtrIj6unecwn+R3ZYC112QQWQMVfUZdk2N
         nu/FcjYBaXTSyfS1ic0NIlMUEN2HARcmm/+k3NPzIiXXYD+OEdudBpUwHdX6TNVgon5J
         UE3IPr4HlNoa3q3zDK0H9zLuhjZeUx7bSFrQq3tIpFn00aqawjEd2113uf2vx5MsBrlM
         XDOumOayo46F8yPuHZOjOu2FYu1B2UFdE46d4zwSIxtsafhbLS2Wd1TH3DlZHlgLWo/0
         JroQbyrdSEisI/9kD9pieuMZtN78QhzxsIaM+GuhhDt09H/ecjac9xkxuS29IsaHGdz8
         qV3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y6A9izbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si21969158ybf.35.2020.09.17.07.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 07:01:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y6A9izbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuTP-0000x9-Fn
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 10:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM7-0008Ou-IP
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM1-00083M-Ip
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGLxMrpkKhqK5mTfhq0kqEXzGV/9xdyAKVyd1JQHn40=;
 b=Y6A9izbADhMFeceMRp/spC5NuV7YWtM9LO5dn/SWhjMKLLE9lkoMotOhV4/8rSxwXLQht+
 LEe2MFy50zYX1bGBFL6AKX8pPjTmRB2TVHjLGw++VFNJQOblM9uCDQ00QOqtTqK92Ku2AD
 97TQyIqWq+HYDS0snuJeyKhnZ3cYp/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-xpIHZYRjNsaCLYb1-e4kjw-1; Thu, 17 Sep 2020 09:53:38 -0400
X-MC-Unique: xpIHZYRjNsaCLYb1-e4kjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A0964098;
 Thu, 17 Sep 2020 13:53:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BE4E19D7C;
 Thu, 17 Sep 2020 13:53:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C29031E63; Thu, 17 Sep 2020 15:53:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] microvm/acpi: disable virtio-mmio cmdline hack
Date: Thu, 17 Sep 2020 15:53:14 +0200
Message-Id: <20200917135323.18022-13-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 31frBdmMHQI1

... in case we are using ACPI.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20200915120909.20838-13-kraxel@redhat.com
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

