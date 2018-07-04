Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp504746wrq;
        Wed, 4 Jul 2018 05:52:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfnPAnR6kU8VxIoJMHvJMGdwcDyWyrXZ9qTsKMA7hkjnZxm083WZ1JCzwp4Pk4o5vkyQln7
X-Received: by 2002:ac8:172c:: with SMTP id w41-v6mr1517251qtj.32.1530708775465;
        Wed, 04 Jul 2018 05:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530708775; cv=none;
        d=google.com; s=arc-20160816;
        b=eHDLRvmrghd2QgI6u7iv1KN+3VILk2d5AJO75Dc5SLv6YNxuNf4Q9AjeUeqoxzWYLt
         k0ghGjdZVy+KulsMA1jgbncm8bz+V/+8LXdrFe2ZbrItrh4ekMLUl59xmisWQ6PbFXVB
         BB4ezSEeqJ2Sjfb9sLMCE8TuCFPcBFNBrQR2VoBkZFXfTsoJc1/QrwE1/LVAow/cKY38
         OeaqWWbmP4YPPhAmKEOHrKqxIt6rXarh6oZmHVLWBle/jb7QHEEgLd+IBM8JrqzxCLWZ
         8dIMFrTjnyw54B/hFXKheBjlIOjPc4xr+V3oIFInqh94zc5mmlwmW4uZiRAtuWHzJxbM
         pY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DERraeF5ZRNBQ0Yv80gB3t/MbPf2l3ge86Ds08zzZ8A=;
        b=tMFRKcqGzjs2VrzBbuF1kLgqG5se69aqLiZHLtAqfJiaWKyyIPdzOZ1RbUb8P/STz8
         kZtZfVqjrSA6LftKK52F0sndoxV4bLA/jHs7sg/4M8LdVPxTMMyAn4blSTkChf7hYSCi
         uE44GdkIwCXu6yMHaPKwKy7MEglpQDR1uKwlTV/M5o4HzGTT6oN8mgWXeZ5BDIiRajkU
         hjQvk+4LJsSZw7IZbBubKkfb3s6gBFQN5U2PyD19Rk7Vka3oR6dDrwC7WeMJ6QC4BtLf
         G8kKNsrx/NlnlAgARGZi4J6Wuk6aYTv1tjkTddV1QCrybg4m26vGgXScoCCym0fl7RR+
         c9Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r37-v6si3469724qvc.85.2018.07.04.05.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 05:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fahHC-0001er-UN
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 08:52:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahE3-0007ZM-Dn
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fahE0-0000Vf-Bp
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 08:49:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40644 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fahE0-0000VY-7J; Wed, 04 Jul 2018 08:49:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B91C74067720;
	Wed,  4 Jul 2018 12:49:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91E212156889;
	Wed,  4 Jul 2018 12:49:34 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  4 Jul 2018 14:49:23 +0200
Message-Id: <20180704124923.32483-7-drjones@redhat.com>
In-Reply-To: <20180704124923.32483-1-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 04 Jul 2018 12:49:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 04 Jul 2018 12:49:35 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC PATCH 6/6] hw/arm/virt: cpu topology: don't allow
 threads
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7pwezamXXAO

None of the cpu models supported by mach-virt support threads.
Furthermore when running with KVM and cpu=host, while the host
processor may support threads, we don't yet support telling KVM
that we want the guest to see that. So if the user tries to
select more than one thread for the cpu topology, just error-out.

We'll remove the restriction for KVM guests after adding support
to KVM and QEMU for userspace controlled VCPU MPIDRs.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6c5fecdd61df..8fc2751ab4bb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1390,6 +1390,19 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (!vmc->ignore_cpu_topology && smp_threads > 1) {
+        if (kvm_enabled() &&
+            strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("host")) == 0) {
+            error_report("mach-virt: KVM: user controlled MPIDR.MT not "
+                         "yet supported");
+        } else {
+            error_report("mach-virt: CPU type %s does not support SMT",
+                         machine->cpu_type);
+        }
+        error_report("mach-virt: smp_threads cannot be > 1");
+        exit(1);
+    }
+
     /* If we have an EL3 boot ROM then the assumption is that it will
      * implement PSCI itself, so disable QEMU's internal implementation
      * so it doesn't get in the way. Instead of starting secondary
-- 
2.17.1

