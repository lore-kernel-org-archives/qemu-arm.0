Received: by 10.223.161.27 with SMTP id o27csp4047658wro;
        Tue, 31 Oct 2017 11:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QYnUIN4jushkDi/nrPog3scY7J7vy/9wjbxAXzM7QfOR5wLLJKNrzyx+Ejv7/N1Sitz0fY
X-Received: by 10.37.186.76 with SMTP id z12mr1853855ybj.274.1509475896549;
        Tue, 31 Oct 2017 11:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509475896; cv=none;
        d=google.com; s=arc-20160816;
        b=l8TicC7bop9hG8GU2evYi+chy90dvZwpE8dlS0ZwGsRK98qYwlBEB/5e5oV50gxQ+a
         CsNtWi7eUhPsoqzbrJ6+fYNnFkaFvJkiL7fbLggav8ofHrxmRx2wrDqKjgsuziH87GYr
         SFeZP+CAsYqtOlz7QXzTKSRE7k69LQiquWU9svxIuKKZnw+P9EH/wpUGb/X9UBznYfHS
         WoHDEoy8WJktr5ZFcs+cBcLcsRpN02+eUL2/3/3RDwQernF5DtJE/DSivlWbsjV4ZTfq
         m7Y4KzKvny791pT93LmB/sfCN3sRFUoyfidS+fL3OwDpQ/eLmiiEzo395dSaPAT3hVza
         fQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=Pp9atuY5JJ3qCplPsPiC7cPjJip642HKwTLpd+5maqU=;
        b=Ni0Zu+Q4LfqpEaA1p1PZg0hp0Z3TOervLyzWHT2AR8qZtnzdB2QxPHEG+4pyhvH0Y+
         oeiy6dJ8JBJMn2/RPwrfNs0Gv2K13Iz2VHp5qW5xi6cH7t5JwqKZkbUYU/6qOZS/z1oO
         BV4CZ80m6fjqF6fMVuqc2kp4FVykuaPOFJ9sGfx+Z/5baMdjWRK17642WlxkTIvlFzdM
         xYuxz+Fp6fYsZhUpauWMwRhWuIh/GmibB5FZn8QVfyMwELWb21//OOjxiO1jsWJ0X97b
         Xl3WnHuWqsI3D4ODJknoF3wJ82xILyEg0ntp5KuO0vnJnc2qBhpKGxGNLs6Vn2uGbRMa
         I/Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14si539833ybn.522.2017.10.31.11.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 11:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9bdQ-0004Ba-1G
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 14:51:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9bdI-0004BS-Cl
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 14:51:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e9bdF-0001OC-9C
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 14:51:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:49238)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e9bdF-0001Mm-30; Tue, 31 Oct 2017 14:51:25 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7A19521871;
	Tue, 31 Oct 2017 18:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A19521871
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 31 Oct 2017 11:51:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_8cimWtic=2OdvCmAN-mJ5MGGnVzDGYA5VgXGJG-fKhw@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710311147570.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
	<CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
	<alpine.DEB.2.10.1710310959490.13766@sstabellini-ThinkPad-X260>
	<CAFEAcA_8cimWtic=2OdvCmAN-mJ5MGGnVzDGYA5VgXGJG-fKhw@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: julien.grall@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rCi4Nx3xRVeh

On Tue, 31 Oct 2017, Peter Maydell wrote:
> On 31 October 2017 at 17:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > Fixing QEMU is harder than I expected. Would it be possible to update
> > id_aa64pfr0 at CPU reset time? Like cpu->id_aa64pfr0 |= 0x01000000; ?
> 
> At that point we've already called register_cp_regs_for_features(),
> which is where we read cpu->id_aa64pfr0 when we're creating the
> cpreg. So if you change it after that it's too late. But that
> function is called at CPU realize time, which is before we've
> created the GIC object...

What about something along the lines of

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b41..0851071 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1401,6 +1400,10 @@ static void machvirt_init(MachineState *machine)
             object_property_set_link(cpuobj, OBJECT(secure_sysmem),
                                      "secure-memory", &error_abort);
         }
+        if (vms->gic_version == 3) {
+            ARMCPU *cpu = ARM_CPU(cpuobj);
+            cpu->id_aa64pfr0 |= 0x01000000;
+        }
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
         object_unref(cpuobj);
