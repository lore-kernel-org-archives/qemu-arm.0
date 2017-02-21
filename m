Received: by 10.25.0.147 with SMTP id 141csp627414lfa;
        Tue, 21 Feb 2017 10:36:12 -0800 (PST)
X-Received: by 10.200.45.59 with SMTP id n56mr16749968qta.203.1487702172476;
        Tue, 21 Feb 2017 10:36:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e66si15669810qtb.311.2017.02.21.10.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 10:36:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgFIH-0006SH-TN
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 13:36:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgFID-0006SB-3U
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 13:36:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgFI8-0001lu-W7
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 13:36:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cgFI8-0001lk-PJ; Tue, 21 Feb 2017 13:36:00 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB5C280F7D;
	Tue, 21 Feb 2017 18:36:00 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC304877A;
	Tue, 21 Feb 2017 18:35:59 +0000 (UTC)
Date: Tue, 21 Feb 2017 15:35:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170221183557.GI2778@thinpad.lan.raisama.net>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
	<1486996099-15820-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486996099-15820-2-git-send-email-peter.maydell@linaro.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 Feb 2017 18:36:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/4] cpu: add cpu_generic_new()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EaZuDQ6KaCy3

On Mon, Feb 13, 2017 at 02:28:16PM +0000, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
> 
> Add a new API cpu_generic_new() which creates a QOM CPU object
> (including calling the CPU class parse_features method) but
> does not realize it, and reimplement cpu_generic_init() to
> simply call cpu_generic_new() and then immediately realize.
> the CPU.
> 
> The motivation for this is that there is currently no
> way for board code to take advantage of the cpu_generic_init()
> convenience function if it needs to set QOM properties
> on the created CPU. Instead it has to do it all manually, which
> is prone to bugs like that fixed in commit 00909b585861 (where
> a board code forgot to call parse_features which meant that
> command line +feature,-feature flags were ignored).
> 
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: renamed new function to cpu_generic_new(), rewrote
>  commit message]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qom/cpu.h | 17 +++++++++++++++++
>  qom/cpu.c         | 27 ++++++++++++++++++---------
>  2 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 45bcf21..e900586 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -599,11 +599,28 @@ void cpu_reset(CPUState *cpu);
>  ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
>  
>  /**
> + * cpu_generic_new:
> + * @typename: The CPU base type.
> + * @cpu_model: The model string including optional parameters.
> + *
> + * Instantiates a CPU, processes optional parameters but does not realize it.
> + * This is the recommended way to create a CPU object which needs to be
> + * configured by then setting QOM properties on it. The configured CPU can
> + * then be realized in the usual way by calling
> + *    object_property_set_bool(cpuobj, true, "realized", &err);
> + *
> + * Returns: A #CPUState or %NULL if an error occurred.
> + */
> +CPUState *cpu_generic_new(const char *typename, const char *cpu_model);

I am not sure we will stlil add this, but in case we are going to
add this helper temporarily until we have Igor's generic
cpu_model parsing, it would be useful to make the function
signature be:
  CPUState *cpu_generic_new(const char *typename, MachineState *machine)
and parse machine->cpu_model inside the function implementation.

This way we could replace the helper with
  object_new(machine->cpu_typename)
more easily once we add Igor's cleanup.

-- 
Eduardo
