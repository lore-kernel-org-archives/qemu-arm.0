Received: by 10.103.86.17 with SMTP id k17csp268001vsb;
        Tue, 20 Dec 2016 07:31:22 -0800 (PST)
X-Received: by 10.55.43.149 with SMTP id r21mr6391097qkr.123.1482247882295;
        Tue, 20 Dec 2016 07:31:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s23si2711991qka.36.2016.12.20.07.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 07:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJMNs-0006Lf-0i
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 10:31:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cJMNk-0006LY-Rn
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 10:31:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cJMNi-0000nP-7D
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 10:31:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cJMNi-0000kq-1o; Tue, 20 Dec 2016 10:31:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E70FC05AA42;
	Tue, 20 Dec 2016 15:31:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBKFV3CT031204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Dec 2016 10:31:05 -0500
Date: Tue, 20 Dec 2016 16:31:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161220153103.mkhz74wlkr3dfrxt@kamzik.brq.redhat.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481625384-15077-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 20 Dec 2016 15:31:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/23] target-arm: Log AArch64
 exception returns
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+fVlRx5bLL4

On Tue, Dec 13, 2016 at 10:36:02AM +0000, Peter Maydell wrote:
> We already log exception entry; add logging of the AArch64 exception
> return path as well.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/op_helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index cd94216..ba796d8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -17,6 +17,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "cpu.h"
>  #include "exec/helper-proto.h"
>  #include "internals.h"
> @@ -972,6 +973,9 @@ void HELPER(exception_return)(CPUARMState *env)
>          } else {
>              env->regs[15] = env->elr_el[cur_el] & ~0x3;
>          }
> +        qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
> +                      "AArch32 EL%d PC 0x%" PRIx32 "\n",
> +                      cur_el, new_el, env->regs[15]);
>      } else {
>          env->aarch64 = 1;
>          pstate_write(env, spsr);
> @@ -980,6 +984,9 @@ void HELPER(exception_return)(CPUARMState *env)
>          }
>          aarch64_restore_sp(env, new_el);
>          env->pc = env->elr_el[cur_el];
> +        qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
> +                      "AArch64 EL%d PC 0x%" PRIx64 "\n",
> +                      cur_el, new_el, env->pc);
>      }
>  
>      arm_call_el_change_hook(arm_env_get_cpu(env));
> @@ -1002,6 +1009,8 @@ illegal_return:
>      if (!arm_singlestep_active(env)) {
>          env->pstate &= ~PSTATE_SS;
>      }
> +    qemu_log_mask(LOG_GUEST_ERROR, "Illegal exception return at EL%d: "
> +                  "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
>  }
>  
>  /* Return true if the linked breakpoint entry lbn passes its checks */
> -- 
> 2.7.4
> 
>

Should we output both the destination PC (ELR) and the source PC (where
the eret was)? Otherwise if there are many erets to the same entry point,
then the logs won't fully enlighten us.

Thanks,
drew
