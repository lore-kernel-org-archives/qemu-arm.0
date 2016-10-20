Received: by 10.80.166.35 with SMTP id d32csp774345edc;
        Thu, 20 Oct 2016 04:26:28 -0700 (PDT)
X-Received: by 10.55.157.215 with SMTP id g206mr282578qke.12.1476962788111;
        Thu, 20 Oct 2016 04:26:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s129si13129219qkb.141.2016.10.20.04.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Oct 2016 04:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxBUR-0001eN-JE
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 07:26:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bxBUM-0001e0-NN
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 07:26:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bxBUI-0007NY-Gz
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 07:26:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bxBUI-0007ND-7u; Thu, 20 Oct 2016 07:26:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 332F4C04B30E;
	Thu, 20 Oct 2016 11:26:15 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KBQ40x019916; Thu, 20 Oct 2016 07:26:05 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2016 13:26:01 +0200
Message-Id: <1476962764-12166-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 20 Oct 2016 11:26:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 0/3] Split cpu_exec_init() into an init and a
 realize part
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
Cc: Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 39zDwwzn+HlG

Since commit 42ecaba ("target-i386: Call cpu_exec_init() on realize"),
, commit 6dd0f83 ("target-ppc: Move cpu_exec_init() call to realize function"),
and commit c6644fc ("s390x/cpu: Get rid of side effects when creating a vcpu"),
cpu_exec_init() has been moved to realize function for some architectures
to implement CPU htoplug. This allows any failures from cpu_exec_init() to be
handled appropriately.

This series tries to do the same work for all the other CPUs.

But as the ARM Virtual Machine ("virt") needs the "memory" property of the CPU
in the machine init function (the "memory" property is created in
cpu_exec_init() we want to move to the realize part), split cpu_exec_init() in
two parts: a realize part (cpu_exec_realizefn(), adding the CPU in the
environment) and an init part (cpu_exec_initfn(), initializing the CPU, like
adding the "memory" property). To mirror the realize part, add an unrealize
part, and remove the cpu_exec_exit() call from the finalize part.

This also allows to remove all the "cannot_destroy_with_object_finalize_yet"
properties from the CPU device class.

v5:
- rebase master
- arm: define ARM_DEFAULT_CPUS_PER_CLUSTER, ARM64_AFFINITY_INVALID,
        and move variable declaration into the "if" block.

v4:
- arm: update mp_affinity in realize only if it s not set by the user
- i386 and ppc: add an parent_unrealize to call the Device unrealize
  because it is overwritten by the CPU unrealize
- update commit messages

v3:
- reorganize the series in 3 patches:
  1- split cpu_exec_init() and call the init part from
     cpu_common_initfn()
  2- move all the cpu_exec_realize() calls to the
     XXX_cpu_realizefn() functions
  3- create a cpu_common_unrealizefn() function
      and call the cpu_exec_unrealize() function from here,
      except for ppc64 and i386 that have their own XX_cpu_unrealizefn()
      functions
- rename cpu_exec_init(), cpu_exec_realize(), cpu_exec_unrealize()
  to cpu_exec_initfn(), cpu_exec_realizefn() and cpu_exec_unrealizefn(),
- move cpu_exec_unrealizefn() to the device class unrealize
  and declare it in qom/cpu.h instead of exec/exec-all.h

v2:
- rename cpu_exec_exit() as cpu_exec_unrealize(),
  as it un-does what cpu_exec_realize() does,
- remove cpu_exec_exit() from ppc_cpu_unrealizefn() as
  it is called from cpu_common_finalize(),
- add a patch to move all cpu_exec_init() from
  all XX_cpu_initfn() to cpu_common_initfn(),
- arm: move setting of cpu->mp_affinity to
  arm_cpu_realizefn() as the cpu_index is now set in
  cpu_exec_realizefn().
- update some commit messages

Laurent Vivier (3):
  exec: split cpu_exec_init()
  exec: move cpu_exec_init() calls to realize functions
  exec: call cpu_exec_exit() from a CPU unrealize common function

 exec.c                      | 12 +++++++-----
 include/exec/exec-all.h     |  1 -
 include/qom/cpu.h           |  4 +++-
 qom/cpu.c                   | 10 +++++++++-
 target-alpha/cpu.c          | 15 +++++++--------
 target-arm/cpu-qom.h        |  2 ++
 target-arm/cpu.c            | 45 ++++++++++++++++++++-------------------------
 target-cris/cpu.c           | 15 +++++++--------
 target-i386/cpu-qom.h       |  1 +
 target-i386/cpu.c           | 15 ++++++++++++++-
 target-lm32/cpu.c           | 15 +++++++--------
 target-m68k/cpu.c           | 15 +++++++--------
 target-microblaze/cpu.c     | 14 +++++++-------
 target-mips/cpu.c           | 15 +++++++--------
 target-moxie/cpu.c          | 15 +++++++--------
 target-openrisc/cpu.c       | 15 +++++++--------
 target-ppc/cpu-qom.h        |  1 +
 target-ppc/translate_init.c | 11 +++++++++--
 target-s390x/cpu.c          |  8 +-------
 target-sh4/cpu.c            | 15 +++++++--------
 target-sparc/cpu.c          | 18 +++++++++---------
 target-tilegx/cpu.c         | 15 +++++++--------
 target-tricore/cpu.c        | 15 +++++++--------
 target-unicore32/cpu.c      | 18 +++++++++---------
 target-xtensa/cpu.c         | 15 +++++++--------
 25 files changed, 169 insertions(+), 156 deletions(-)

-- 
2.7.4

