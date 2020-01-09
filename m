Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2264647lff;
        Thu, 9 Jan 2020 07:22:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkcbHI04Ia6ga03h1a3lpnMUGcUZBaTFTv1WYxDFuzf0pGsCj2JXMQ4FPd/6mcPQibCFB3
X-Received: by 2002:a05:6830:1e8a:: with SMTP id n10mr8832708otr.303.1578583379648;
        Thu, 09 Jan 2020 07:22:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578583379; cv=none;
        d=google.com; s=arc-20160816;
        b=Poi7TkMJKketMgci1PGRMOMdJVF+vOjMyq25pY7kVD7BYAYG2g0b+SqxtBHaykzLl4
         DhvNNquTzUwdnxj2CsLNEHlQilSCmwejV4m1NPhXGxfGkBzn2ybf43eW55vyeiVqQI7w
         v26qbOHFxdxfbir1mWBVJn0e6Oz7gmHgVpQNChcsAiqJ+cwUqunAZGnuMXQugHtA7dSH
         4T+hsnpdIR+0ssWOrCusE/ZWWxvwLxKvVVPtslPkoo1ZyAumFSlTYdzoSebPZhp/WMTk
         1DRyNuHyES2hizN4PmaSw2IRo51dYQZrdw3ZXeJBmaFLGxZKqjNwXUjjpDXvm6LHdz8w
         CRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=H5HnxoPdzrltmBx4GJfO10Gs5/HVEMyNIWg08Qb03H8=;
        b=BKdPYXyMi0YGqDVyi6fCs3yA6W1DLf+24FviYzkUqp4NCkGYnUZziBT+XFerKaTOLg
         GjGncn42zqHujfv4OaA7NbVkpYzBEjyUR+dHdqFveeLYM5hIpe7BsrWLKXh/LnVs923x
         HJwgFKLQFwSKOTowA8Z+NyT5B2rlUTeVudx39aACWlf9BlY5KqO6HqJt6xURZE1qQEYS
         EZ3z9gdoDEFYjJa36pH0CKD3GVAzhQ/omL2Ie1zPuPJAsxLznzmCBAiWD8Kqe+m9Gz6p
         MHR3jof9mC56WaYqZ3snWuu6n68CPEte/WDn9uYUYlkC3OGVshPoZuWct9xYHbO6u17T
         2h8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gx+M2YOv;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s3si3502134oic.108.2020.01.09.07.22.59;
        Thu, 09 Jan 2020 07:22:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gx+M2YOv;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732339AbgAIPW6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 9 Jan 2020 10:22:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23454 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732329AbgAIPW6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578583377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H5HnxoPdzrltmBx4GJfO10Gs5/HVEMyNIWg08Qb03H8=;
        b=gx+M2YOvq6X7Yjgu47VSjPOymnQH5VJep4a38gamElsj0qiJaYw7T1SkgdjmbuXoawinPo
        v1hifi6XikgOZm66kwFEWdfP2fI5UlOOpDuX46wmD2AWHmH0gqz1TO2XA+zrlXwxYfU2eW
        kZb7o9s6mu8Oz8kY4nU+hb8vkop6X/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-Hjxm58MoNNa7j3wVE--rPQ-1; Thu, 09 Jan 2020 10:22:54 -0500
X-MC-Unique: Hjxm58MoNNa7j3wVE--rPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894668C4B52;
        Thu,  9 Jan 2020 15:22:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8E61CB;
        Thu,  9 Jan 2020 15:22:43 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Eduardo Habkost <ehabkost@redhat.com>,
        Juan Quintela <quintela@redhat.com>, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        qemu-ppc@nongnu.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 08/15] target/arm/monitor: Replace current_machine by qdev_get_machine()
Date:   Thu,  9 Jan 2020 16:21:26 +0100
Message-Id: <20200109152133.23649-9-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-1-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: poX7BOSeDNsn

As we want to remove the global current_machine,
replace 'current_machine' by MACHINE(qdev_get_machine()).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/monitor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index fa054f8a36..bcbf69802d 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -136,7 +136,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(=
CpuModelExpansionType type,
     }
=20
     if (kvm_enabled()) {
-        const char *cpu_type =3D current_machine->cpu_type;
+        MachineState *ms =3D MACHINE(qdev_get_machine());
+        const char *cpu_type =3D ms->cpu_type;
         int len =3D strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
         bool supported =3D false;
=20
--=20
2.21.1
