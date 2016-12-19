Received: by 10.103.86.20 with SMTP id k20csp92315vsb;
        Mon, 19 Dec 2016 13:53:20 -0800 (PST)
X-Received: by 10.55.201.8 with SMTP id q8mr1525997qki.42.1482184400391;
        Mon, 19 Dec 2016 13:53:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a15si729170qtb.226.2016.12.19.13.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Dec 2016 13:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJ5ry-0008Av-5I
	for alex.bennee@linaro.org; Mon, 19 Dec 2016 16:53:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJ5qp-0007XF-6N
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 16:52:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJ5qn-0005Aw-Tn
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 16:52:07 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cJ5qn-0005AG-Od; Mon, 19 Dec 2016 16:52:05 -0500
Received: by mail-oi0-x242.google.com with SMTP id v84so21295254oie.2;
	Mon, 19 Dec 2016 13:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0jjsYakJAWAmrEt+KvUcIuYTHe5fd/3YXB+7JEdII7o=;
	b=orpZJdbJWMjpI7CZ38uF1ABwUXBTMIXx4k2hUH2NT8jXhOHtdx5nOP2+rP+nDEKFZR
	3My+msDiqnoeD18sdQK5sSGk8+2Hgfaczf+Qct203m3qYmBNV3e5SzfYqDfXLEsDFV/a
	wzon5fjmVxASShHaWeMPaU90eRk61YGV0W7X7wox7fiVCKytnRNDFB5vUhLXlzpOjX2W
	1IAhffh5IfUDBbHaiYwPL1g/xmFRYjmdtosrOGy/BsEaVYeCt+4df+3JOp20A5GUab9L
	7/Yk11sHE2BHNuosKjnO5kKLWx+Us/7RU/sYeKlSpMNRtUxEGwc+84eCYnKk17ZyVz35
	YpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0jjsYakJAWAmrEt+KvUcIuYTHe5fd/3YXB+7JEdII7o=;
	b=mzz2tEyQVCL9FpEZijkO6GtD5spkM+C2OZC0fd7M6LKz32tZiU1kZ/LXOGzcmIzRnm
	zYCYLU+EEHbz5Kpl3amcuXIHdZg7zDuEKBoJPvEsghahMdL+5eKCdSaHBS9U5HI4tt1w
	Xrm6QQPewPi+UjztL7iLyVBU62aouQp8szJxYfbNqLS5kQL3rUqd4ug66ADZpxyFXGQ3
	f2Og8XvuzwOVyFOW5nYa95hJyHDy7/62nlMIr5Mmhn7sbVwaXAMwduUSiOjewis54q/y
	wpvkQsiBpuOY6JKEveVvR8BUIT7+P0zsU2XMtQXjQkWTw6jXMMM/62bxzFo1/Gzrct5G
	ZUEQ==
X-Gm-Message-State: AKaTC029PYJzsP1waADXGGU2g8wNKnlWP/p2O2lSZAYn6/EM605urajWa2O41QBHwBsOIBkr5L24ovfMxAVTLw==
X-Received: by 10.157.27.218 with SMTP id v26mr11594227otv.218.1482184323442; 
	Mon, 19 Dec 2016 13:52:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Mon, 19 Dec 2016 13:51:33 -0800 (PST)
In-Reply-To: <1481625384-15077-2-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Dec 2016 13:51:33 -0800
Message-ID: <CAKmqyKMLCYLdqGmXdAFQqxqpwuyY0VHpiu9GOd0mjXyJV6tyQA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eDr62bwovYm6

On Tue, Dec 13, 2016 at 2:36 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> We already log exception entry; add logging of the AArch64 exception
> return path as well.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

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
