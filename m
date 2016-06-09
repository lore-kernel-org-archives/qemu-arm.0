Received: by 10.25.27.66 with SMTP id b63csp462893lfb;
        Thu, 9 Jun 2016 11:36:56 -0700 (PDT)
X-Received: by 10.200.53.39 with SMTP id y36mr11308085qtb.92.1465497416323;
        Thu, 09 Jun 2016 11:36:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si4118239qtc.51.2016.06.09.11.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4p5-0005y9-LA
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:36:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bB4my-0004ib-Hm
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:34:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bB4mw-0005LR-8Q
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:34:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bB4mq-0005Bm-Ab; Thu, 09 Jun 2016 14:34:36 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 151ABA78D;
	Thu,  9 Jun 2016 18:34:32 +0000 (UTC)
Received: from localhost (vpn1-7-121.gru2.redhat.com [10.97.7.121])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59IYVeM000322; Thu, 9 Jun 2016 14:34:31 -0400
Date: Thu, 9 Jun 2016 15:34:30 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160609183430.GC17952@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465226212-254093-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 09 Jun 2016 18:34:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 03/10] target-i386: cpu: move
 xcc->kvm_required check to realize time
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IjZevRwqfme1

On Mon, Jun 06, 2016 at 05:16:45PM +0200, Igor Mammedov wrote:
> it will allow to drop custom cpu_x86_init() and use
> cpu_generic_init() insteadi, reducing cpu_x86_create()
> to a simple 3-liner.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Eduardo Habkost <ehabkost@redhat.com>

This triggers an assert when trying to use -cpu host with TCG:

  # ./x86_64-softmmu/qemu-system-x86_64 -machine accel=tcg -cpu host -nographic
  qemu-system-x86_64: /root/qemu/target-i386/cpu.c:1558: host_x86_cpu_initfn: Assertion `(kvm_allowed)' failed.
  Aborted

I will squash the following fix in it:

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 3f886a5..dcbfa0b 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1555,16 +1555,17 @@ static void host_x86_cpu_initfn(Object *obj)
     CPUX86State *env = &cpu->env;
     KVMState *s = kvm_state;
 
-    assert(kvm_enabled());
-
     /* We can't fill the features array here because we don't know yet if
      * "migratable" is true or false.
      */
     cpu->host_features = true;
 
-    env->cpuid_level = kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
-    env->cpuid_xlevel = kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
-    env->cpuid_xlevel2 = kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
+    /* If KVM is disabled, x86_cpu_realizefn() will report an error later */
+    if (kvm_enabled()) {
+        env->cpuid_level = kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
+        env->cpuid_xlevel = kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
+        env->cpuid_xlevel2 = kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
+    }
 
     object_property_set_bool(OBJECT(cpu), true, "pmu", &error_abort);
 }

-- 
Eduardo
