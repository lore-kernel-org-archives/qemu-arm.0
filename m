Received: by 10.25.205.13 with SMTP id d13csp531244lfg;
        Tue, 17 Jan 2017 06:49:54 -0800 (PST)
X-Received: by 10.233.223.129 with SMTP id t123mr17020787qkf.191.1484664594117;
        Tue, 17 Jan 2017 06:49:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o19si16728635qtb.315.2017.01.17.06.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 06:49:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTV55-0006fn-D7
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 09:49:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cTV2h-00059y-QV
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 09:47:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cTV2d-0003Iz-5v
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 09:47:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cTV2c-0003Im-TY; Tue, 17 Jan 2017 09:47:19 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E877B1555C;
	Tue, 17 Jan 2017 14:47:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0HElFPd006884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 17 Jan 2017 09:47:17 -0500
Date: Tue, 17 Jan 2017 15:47:14 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170117144714.jejlwes3pkd4foh2@kamzik.brq.redhat.com>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-17-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483977924-14522-17-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 17 Jan 2017 14:47:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 16/18] target/arm/psci.c: If
 EL2 implemented, start CPUs in EL2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, patches@linaro.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LFPJx4Hb2EdJ

On Mon, Jan 09, 2017 at 04:05:22PM +0000, Peter Maydell wrote:
> The PSCI spec states that a CPU_ON call should cause the new
> CPU to be started in the highest implemented Non-secure
> exception level. We were incorrectly starting it at the
> exception level of the caller, which happens to be correct
> if EL2 is not implemented. Implement the correct logic
> as described in the PSCI 1.0 spec section 6.4:
>  * if EL2 exists and SCR_EL3.HCE is set: start in EL2
>  * otherwise start in EL1
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/psci.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)

Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Andrew Jones <drjones@redhat.com>

> 
> diff --git a/target/arm/psci.c b/target/arm/psci.c
> index 14316eb..64bf82e 100644
> --- a/target/arm/psci.c
> +++ b/target/arm/psci.c
> @@ -148,17 +148,28 @@ void arm_handle_psci_call(ARMCPU *cpu)
>      case QEMU_PSCI_0_1_FN_CPU_ON:
>      case QEMU_PSCI_0_2_FN_CPU_ON:
>      case QEMU_PSCI_0_2_FN64_CPU_ON:
> +    {
> +        /* The PSCI spec mandates that newly brought up CPUs start
> +         * in the highest exception level which exists and is enabled
> +         * on the calling CPU. Since the QEMU PSCI implementation is
> +         * acting as a "fake EL3" or "fake EL2" firmware, this for us
> +         * means that we want to start at the highest NS exception level
> +         * that we are providing to the guest.
> +         * The execution mode should be that which is currently in use
> +         * by the same exception level on the calling CPU.
> +         * The CPU should be started with the context_id value
> +         * in x0 (if AArch64) or r0 (if AArch32).
> +         */
> +        int target_el = arm_feature(env, ARM_FEATURE_EL2) ? 2 : 1;
> +        bool target_aarch64 = arm_el_is_aa64(env, target_el);
> +
>          mpidr = param[1];
>          entry = param[2];
>          context_id = param[3];
> -        /*
> -         * The PSCI spec mandates that newly brought up CPUs enter the
> -         * exception level of the caller in the same execution mode as
> -         * the caller, with context_id in x0/r0, respectively.
> -         */
> -        ret = arm_set_cpu_on(mpidr, entry, context_id, arm_current_el(env),
> -                             is_a64(env));
> +        ret = arm_set_cpu_on(mpidr, entry, context_id,
> +                             target_el, target_aarch64);
>          break;
> +    }
>      case QEMU_PSCI_0_1_FN_CPU_OFF:
>      case QEMU_PSCI_0_2_FN_CPU_OFF:
>          goto cpu_off;
> -- 
> 2.7.4
> 
> 
