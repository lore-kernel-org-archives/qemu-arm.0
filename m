Received: by 10.25.159.19 with SMTP id i19csp1051703lfe;
        Fri, 29 Jan 2016 08:50:15 -0800 (PST)
X-Received: by 10.55.77.206 with SMTP id a197mr11678282qkb.43.1454086215373;
        Fri, 29 Jan 2016 08:50:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m90si18490562qge.24.2016.01.29.08.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCFS-00067v-VP
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:50:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPCDW-0002er-CD
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPCDV-0001cK-Gw
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:48:14 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPCDT-0001a6-69; Fri, 29 Jan 2016 11:48:11 -0500
Received: by mail-lf0-x244.google.com with SMTP id j99so2347931lfi.2;
	Fri, 29 Jan 2016 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=MqzWxsC9hUgVV54QhmBHcNlcggu/q1fldL1/sMJoSlw=;
	b=rHCLzTcNpvVMmsCDwaHpW8grxl0RxQQnwLS7weNSbswhIbt/TXSuMY/70GBDAXqs33
	Qcx7RkPFPH+vv19UNjKV9wAQrVVgPVDKV5rEJpx6QHXhcsurDYfsAh1y4nPS/MtWVa3I
	AWGYsxo6H+fklrk5pWVUp6eY/Wovz3Ke2xtkWwf4WvHK0BMFryZaIeMQYF03fQQmXCXy
	/l3H1IP03C+LCe2e4tuDfqea8Qyw+iPXSK9dNtKCWlEtimcdXDwuEQUkk4YIpDkJhCQ5
	lVLG6nZyMaK4Fp8Dzo9OCa2HJuPudZ+TK61HKyTAv9/M2O2PKXxvoegkojj/DJnz8zsn
	1kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MqzWxsC9hUgVV54QhmBHcNlcggu/q1fldL1/sMJoSlw=;
	b=OtzYjxl7m+/thbmcdNERh4lxPF6zpd0uv8sWSkpouIRO0e3JwhrMTfHZwIjLp9ZoUh
	+e/pKqCnsv5/lSzTnCUN+WX82wIPA5MU2FtuPbne8rhui683gHy3Dn+eM/GvoRdXurq/
	ZowERuaUWXvYZJtGZw7JgC5WmU6RjwnBdlFmWHwV2E8eYkqvYZesAeAE9ZX6s61Zz0cL
	4Xbw00RVn/EKefshgjR/uJtXDm+hGjW05Ntfxo0Ag81n95NLDvAE6jujaXfs8PUIJXxF
	OWtvwn8FONTqLXZznf4fqufzmgFS+hwEG/XuxMJdXPqhwhsn06VNB/dAqzfyxpjaDilN
	Skww==
X-Gm-Message-State: AG10YOQ37VQJen/9q8XwjzqpAKI5JrcQLDdDAWAScoEXbIWWrowCYdECVRrJNZOYkFODIg==
X-Received: by 10.25.147.139 with SMTP id v133mr3930198lfd.161.1454086090416; 
	Fri, 29 Jan 2016 08:48:10 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	b5sm2131788lbc.14.2016.01.29.08.48.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 08:48:09 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
	<1452796451-2946-9-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB97C8.7050809@gmail.com>
Date: Fri, 29 Jan 2016 19:48:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 8/8] target-arm: ignore
 ELR_ELx[1] for exception return to 32-bit ARM mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RczeWoqPWmDw

On 14.01.2016 21:34, Peter Maydell wrote:
> The architecture requires that for an exception return to AArch32 the
> low bits of ELR_ELx are ignored when the PC is set from them:
>  * if returning to Thumb mode, ignore ELR_ELx[0]
>  * if returning to ARM mode, ignore ELR_ELx[1:0]
>
> We were only squashing bit 0; also squash bit 1 if the SPSR T bit
> indicates this is a return to ARM code.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/op_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 5789ccb..171d6b8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -738,7 +738,11 @@ void HELPER(exception_return)(CPUARMState *env)
>          }
>          aarch64_sync_64_to_32(env);
>  
> -        env->regs[15] = env->elr_el[cur_el] & ~0x1;
> +        if (spsr & CPSR_T) {
> +            env->regs[15] = env->elr_el[cur_el] & ~0x1;
> +        } else {
> +            env->regs[15] = env->elr_el[cur_el] & ~0x3;
> +        }
>      } else {
>          env->aarch64 = 1;
>          pstate_write(env, spsr);

