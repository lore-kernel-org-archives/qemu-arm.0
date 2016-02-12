Received: by 10.25.159.19 with SMTP id i19csp950092lfe;
        Fri, 12 Feb 2016 09:25:01 -0800 (PST)
X-Received: by 10.140.219.208 with SMTP id p199mr3588226qhb.80.1455297901171;
        Fri, 12 Feb 2016 09:25:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l62si16610310qhc.126.2016.02.12.09.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 09:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUHSm-0008HS-Jn
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 12:25:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aUHSj-0008Ek-W5
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 12:24:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aUHSf-0002Zp-RX
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 12:24:57 -0500
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:36117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aUHSf-0002Z5-Jb; Fri, 12 Feb 2016 12:24:53 -0500
Received: by mail-lf0-x229.google.com with SMTP id 78so55896355lfy.3;
	Fri, 12 Feb 2016 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=H+zZCvpDGK1A7dtT9r50ocAuzUpmcTtObLa9mjsM4QM=;
	b=LQplF3d3DwBgw93xLBheB8kgRpc8SjiavV6oiCqCpzsMhuywinKRTzEHjCR++kh4wt
	tFlZE028dWcOJZCUzNnFF01hM66UKmCr89PcfPmCWxuc3M5uGNIsEPIjXFDbEBRQOnsy
	dEcYIL5iQ49HvMzzy/M+RwMHzNK7Moy5MLbU6T1Ia/jyq0D1LRT9NekfMhxvUYinvSSz
	kAnuMuyL1fwzjvyw/Frd/bVMRCKbLYuzUjo5Qc4D9LGgC04nVuGY6t5AY8t4gEBVKrJQ
	3g9yVf9RW9mu9YDyaEJSYn+7+DIc0gSYgkDYkRvmrrJNI0aj4+i87VdijL6qUMLVxmQi
	HurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=H+zZCvpDGK1A7dtT9r50ocAuzUpmcTtObLa9mjsM4QM=;
	b=cAt8f1UqgegqGp0KWGunlRZI1OMSUzosSDw0vY468mLEBQwGu8OKcUGVT2ec2y04GV
	dsQcCr288iKLxDPfJyDh3laLCgZ8j0E1yyxIGvCAIafbCx3x9WVbLs5b7Iqtk7UgyiwI
	swY05KRUqt7Q94a5DS1H6HVZwG3h9+/gjzpshB5dEL3w/J0KvvFXO2jDRcsu77M7JA2h
	ccneFL74hNHozofYp5GzVMUrwNd6mDXAPi8C9BIoE0x5jPQoIcFTOiJ6ArfAp50xfxGT
	8hfJEv5ENY2fJ0945v0a3z0Ixm6qm2jx+QfPSQi/Bp7KODN8nGFKADP+fEN0nkyMfzAQ
	Xo+A==
X-Gm-Message-State: AG10YOQE/N/GLum8fu2AokFqZERPUjcroeiYmcjHGwhJnmx9nhsTGIArM2MHIhOKl3awAg==
X-Received: by 10.25.18.33 with SMTP id h33mr1190826lfi.11.1455297892445;
	Fri, 12 Feb 2016 09:24:52 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	ph5sm1008720lbb.44.2016.02.12.09.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 09:24:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455292245-30461-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BE1561.2060000@gmail.com>
Date: Fri, 12 Feb 2016 20:24:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455292245-30461-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::229
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH] target-arm: Move bank_number() into
	internals.h
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
X-TUID: nwxCb2aT7jh3

On 12.02.2016 18:50, Peter Maydell wrote:
> Move bank_number()'s implementation into internals.h, so
> it's available in the user-mode-only compile as well.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
> Embarrassingly light on testing on that last change.
>
>  target-arm/helper.c    | 25 -------------------------
>  target-arm/internals.h | 26 +++++++++++++++++++++++++-
>  2 files changed, 25 insertions(+), 26 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index c46e3d0..a420a2a 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5378,31 +5378,6 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>  
>  #else
>  
> -/* Map CPU modes onto saved register banks.  */
> -int bank_number(int mode)
> -{
> -    switch (mode) {
> -    case ARM_CPU_MODE_USR:
> -    case ARM_CPU_MODE_SYS:
> -        return BANK_USRSYS;
> -    case ARM_CPU_MODE_SVC:
> -        return BANK_SVC;
> -    case ARM_CPU_MODE_ABT:
> -        return BANK_ABT;
> -    case ARM_CPU_MODE_UND:
> -        return BANK_UND;
> -    case ARM_CPU_MODE_IRQ:
> -        return BANK_IRQ;
> -    case ARM_CPU_MODE_FIQ:
> -        return BANK_FIQ;
> -    case ARM_CPU_MODE_HYP:
> -        return BANK_HYP;
> -    case ARM_CPU_MODE_MON:
> -        return BANK_MON;
> -    }
> -    g_assert_not_reached();
> -}
> -
>  void switch_mode(CPUARMState *env, int mode)
>  {
>      int old_mode;
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 70bec4a..2e70272 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -109,7 +109,31 @@ static inline unsigned int aarch64_banked_spsr_index(unsigned int el)
>      return map[el];
>  }
>  
> -int bank_number(int mode);
> +/* Map CPU modes onto saved register banks.  */
> +static inline int bank_number(int mode)
> +{
> +    switch (mode) {
> +    case ARM_CPU_MODE_USR:
> +    case ARM_CPU_MODE_SYS:
> +        return BANK_USRSYS;
> +    case ARM_CPU_MODE_SVC:
> +        return BANK_SVC;
> +    case ARM_CPU_MODE_ABT:
> +        return BANK_ABT;
> +    case ARM_CPU_MODE_UND:
> +        return BANK_UND;
> +    case ARM_CPU_MODE_IRQ:
> +        return BANK_IRQ;
> +    case ARM_CPU_MODE_FIQ:
> +        return BANK_FIQ;
> +    case ARM_CPU_MODE_HYP:
> +        return BANK_HYP;
> +    case ARM_CPU_MODE_MON:
> +        return BANK_MON;
> +    }
> +    g_assert_not_reached();
> +}
> +
>  void switch_mode(CPUARMState *, int);
>  void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
>  void arm_translate_init(void);

