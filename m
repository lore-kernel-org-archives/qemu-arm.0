Received: by 10.25.159.131 with SMTP id i125csp536394lfe;
        Wed, 7 Dec 2016 13:02:56 -0800 (PST)
X-Received: by 10.200.43.5 with SMTP id 5mr62026231qtu.279.1481144575955;
        Wed, 07 Dec 2016 13:02:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n80si15427600qkl.10.2016.12.07.13.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 13:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEjMc-0007dW-Uu
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 16:02:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEjMV-0007ca-4g
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:02:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEjMQ-0001JL-EJ
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:02:47 -0500
Received: from mail-wj0-f193.google.com ([209.85.210.193]:35376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cEjMQ-0001DN-7V; Wed, 07 Dec 2016 16:02:42 -0500
Received: by mail-wj0-f193.google.com with SMTP id he10so37658768wjc.2;
	Wed, 07 Dec 2016 13:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=b5g1I/QJcP8lNWf+EXlgtJLGi+8XFEmBQ4kbBrTrgTo=;
	b=iLTqqR1L0aULipE5rJ3OZCjlqpOToVDhMCwVMTFkdaX8v+jNzmNOnJ+8Q9FSQDuMwM
	xL4CAHLWOaALhX8yhD8svSazUGlbK07muN/jEQPER3fG6ixE18Ba2qkpiEbFWRXlGMvL
	I7Ag4ZxX0/rEEDtAQAfl4XedKvp5tcHbuP382q8PvMii2HeRswk5nMiPHsTKlKDmVMBt
	Aj01ixrAGA1j9TqKmk79z4K5GEXQCxp2nxMdiJhQw0d9IJ+tJZ/kkGc8EP11N8RxMbRa
	KIsrlHVYJVoMDMGKhrLyCZjJndSi3LVTFyivPkso4x8r2oE3tGLRWCXwpEpVnn157sHi
	h5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=b5g1I/QJcP8lNWf+EXlgtJLGi+8XFEmBQ4kbBrTrgTo=;
	b=W5HEpRvMVk6XQwOFrgyr5Y0VZGhLGGbHTksGGk1PtRZm+K0VdFxLhRG7EqdSfoQkDa
	fDDLDxpmPUvYW6EW6mGyHLyTvP2yZPpzaMJ6oWW8vc7AEM/vg4bBqIefiJ8YZ/a5v79G
	njXidJ5kMl8BKUJWIJpbPuZZuS0Ch5KCCs8rBlncd9v0+hDpTPANzGuG9TZrTA1Gw3kv
	U0j/QKUA+dm4ELj1Avo8fzt33SJ/g3C6g8tR6e2PdBg9zXZKds4+vxexi+JFVwqo8b+f
	kjDVjJNRErCdcpg8Qx4gJIWmfw+MjbRilP4dvI79M78S5zyyxnEJ2vheFdSIJP0Nr38k
	6PKA==
X-Gm-Message-State: AKaTC00rNWu+v5jhDvY8hIxunORPdtFWyTLLWgnLe1ihfDxiqNYV1xv3OBzzwYHX98yVXA==
X-Received: by 10.46.75.10 with SMTP id y10mr32066912lja.65.1481144479809;
	Wed, 07 Dec 2016 13:01:19 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	m81sm4870828lfd.45.2016.12.07.13.01.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Dec 2016 13:01:19 -0800 (PST)
Date: Wed, 7 Dec 2016 22:01:18 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161207210118.GE9606@toto>
References: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
	<1481046379-32632-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481046379-32632-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.193
Subject: Re: [Qemu-arm] [PATCH 1/3] target-arm: Log AArch64 exception returns
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zm1M+U1d6uJm

On Tue, Dec 06, 2016 at 05:46:17PM +0000, Peter Maydell wrote:
> We already log exception entry; add logging of the AArch64 exception
> return path as well.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



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
