Received: by 10.25.159.19 with SMTP id i19csp1432171lfe;
        Mon, 8 Feb 2016 08:40:22 -0800 (PST)
X-Received: by 10.55.76.73 with SMTP id z70mr34995854qka.105.1454949622863;
        Mon, 08 Feb 2016 08:40:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t191si13633199qhb.81.2016.02.08.08.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 08:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSorO-0005Qi-92
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 11:40:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSorL-0005Pd-0g
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:40:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSorF-0000bR-UL
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 11:40:18 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSorF-0000b8-Fc; Mon, 08 Feb 2016 11:40:13 -0500
Received: by mail-lf0-x242.google.com with SMTP id j99so5330593lfi.2;
	Mon, 08 Feb 2016 08:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=sALZtrm553gsYGvPKvDrgRp3siyCBeW83lDWrR0JcOk=;
	b=x7yDXU0tTLpOkb2z3VaTaJFlzUzo/v3B0HLdKf2oQoZfbsjTJmYNKzOFEcbkAbyl/w
	fMC1cKD7jRa0PqfFFSGg/skG8zAU0IEo6GDTZA2W4CbOU3xadcjbLrBKMRmBHmdA418s
	jAz5ZvsDR7ER+ABuiUmp050W5cIIRrp7rsKxBXK2QohvshVuU5Jz/OV27G2gm0lM3/0n
	dev3Xu4uLYk/iKJWSvq9e7laEmDZMGEofmw+d6yMezh7qqFjbLVnn7ey5k9RmuRbDGGN
	3/rKhtTW2fNqJJymHH9H7t6wmQzMFspz678Ox9QNU6SkhHOIXnHdB/b4i9pi2gWq3E9/
	PMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=sALZtrm553gsYGvPKvDrgRp3siyCBeW83lDWrR0JcOk=;
	b=KfoGaHwCsIEUMVZ5WKg8sz8LW6okUsFBM6sjrtgodhTopf8mBvev9vlhH1JbKdymDY
	n3i/0BAMdlyZto2pATRTZGVZjKs/k/k4nQ3wmDdqaRtko6PpiDSE7vVqXB0B/5JSaMYI
	b/8c5qbfDNLpd5V0Ij+C8SkVR/uBWnsUOQzK0J6tJVbOivrFc7Z+uNK9/eRIetLdkyPz
	6MyAvNcvgguSEQYn9FMzurjXLlGrctMbqYDqyLcJ2T2dNvfRWz7Ek2rKsuugGHA9EuTQ
	E1RfXnvY1g+5sZGg3gU7AlLggX2OMk1Te5OhAk01KiLRhzRVGmFhK2UvJvOhauhXwenK
	QK4A==
X-Gm-Message-State: AG10YORqid/oi3cNsgk69oLkdZ8xUp+25NhIITUehvydYjs/KouCA/WcYeNroQMXnA7tbw==
X-Received: by 10.25.23.24 with SMTP id n24mr12206483lfi.66.1454949612568;
	Mon, 08 Feb 2016 08:40:12 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	jm8sm4127311lbc.12.2016.02.08.08.40.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 08:40:11 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-7-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8C4EA.3090504@gmail.com>
Date: Mon, 8 Feb 2016 19:40:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454690704-16233-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/6] target-arm: Report correct
 syndrome for FPEXC32_EL2 traps
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d8AT83VeBznO

On 05.02.2016 19:45, Peter Maydell wrote:
> If access to FPEXC32_EL2 is trapped by CPTR_EL2.TFP or CPTR_EL3.TFP,
> this should be reported with a syndrome register indicating an
> FP access trap, not one indicating a system register access trap.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/cpu.h       |  5 +++++
>  target-arm/helper.c    |  4 ++--
>  target-arm/op_helper.c | 13 +++++++++++++
>  3 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index d1d6886..a959ad6 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1322,6 +1322,11 @@ typedef enum CPAccessResult {
>      /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
>      CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
>      CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
> +    /* Access fails and results in an exception syndrome for an FP access,
> +     * trapped directly to EL2 or EL3
> +     */
> +    CP_ACCESS_TRAP_FP_EL2 = 7,
> +    CP_ACCESS_TRAP_FP_EL3 = 8,
>  } CPAccessResult;
>  
>  /* Access functions for coprocessor registers. These cannot fail and
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 064b415..163a72a 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3012,10 +3012,10 @@ static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
>                                       bool isread)
>  {
>      if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
> -        return CP_ACCESS_TRAP_EL2;
> +        return CP_ACCESS_TRAP_FP_EL2;
>      }
>      if (env->cp15.cptr_el[3] & CPTR_TFP) {
> -        return CP_ACCESS_TRAP_EL3;
> +        return CP_ACCESS_TRAP_FP_EL3;
>      }
>      return CP_ACCESS_OK;
>  }
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 4fedae5..754f080 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -500,6 +500,19 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
>          target_el = 3;
>          syndrome = syn_uncategorized();
>          break;
> +    case CP_ACCESS_TRAP_FP_EL2:
> +        target_el = 2;
> +        /* Since we are an implementation that takes exceptions on a trapped
> +         * conditional insn only if the insn has passed its condition code
> +         * check, we take the IMPDEF choice to always report CV=1 COND=0xe
> +         * (which is also the required value for AArch64 traps).
> +         */
> +        syndrome = syn_fp_access_trap(1, 0xe, false);
> +        break;
> +    case CP_ACCESS_TRAP_FP_EL3:
> +        target_el = 3;
> +        syndrome = syn_fp_access_trap(1, 0xe, false);
> +        break;
>      default:
>          g_assert_not_reached();
>      }

