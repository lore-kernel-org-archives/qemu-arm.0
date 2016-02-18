Received: by 10.25.208.211 with SMTP id h202csp736489lfg;
        Thu, 18 Feb 2016 09:45:07 -0800 (PST)
X-Received: by 10.140.94.176 with SMTP id g45mr10372222qge.59.1455817507792;
        Thu, 18 Feb 2016 09:45:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si9062888qhu.7.2016.02.18.09.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSdX-0001Zt-7I
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:45:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWScp-0008Uo-Tw
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:44:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWScm-0001wP-PA
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:44:23 -0500
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231]:33402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWScm-0001w5-HE; Thu, 18 Feb 2016 12:44:20 -0500
Received: by mail-lb0-x231.google.com with SMTP id x4so33411367lbm.0;
	Thu, 18 Feb 2016 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=lpEp1Il4mx5Cho4BtllIizXVxq8ppEUZScCOT1NK2pg=;
	b=02WgvszIJ5xLeyb12IaYVxB+at6S1lF3YPH4gG/9clyMNqBroCfCH+ej8ooBL7JKo0
	sCi1lRdyuiMgP16sueo0Mdg8w9C4lt27hEXpiUXurnfJ2GqHW50snHEuc5YKZtVoZ17G
	16Z8x8dScimax41e/xvpSORNdhy+iubxUqh5pT7ALSdjLrWEmPKHyivEFKPCtbdwNQIa
	6gxprX+rrYz/gj2hYmzZpGeuV8t8Z0XKqzs5ht7fw368k+inCMGhCHa7j1KlTH9LquoD
	bxJxXsDgFIT5bocjgecZLeVrQfjmGhnTkfUAnnb5PDmgmf+Xwuw9Sm2zWaHT1yGooQvy
	+dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lpEp1Il4mx5Cho4BtllIizXVxq8ppEUZScCOT1NK2pg=;
	b=CwQ/Ek0X+8xcafsgx2hQD1xpSoVnRQUX2f68TCve69we5Ic/KLFahMglKl3yqk/6Kh
	X3O2NUryZ2dusQzg5jjyBmicU9l4Wq6Nrl3Y97K9z0Nkg2ed8A7smAuvYjQq9X2enFXC
	ggIi0+015ZY4z1q/Uepq99I7vi+AEyhL/Sjno8nMRiM+qGlqkuJ4kcOzo71PywkaQj0V
	9K8lM0IhGTkEZWG9mOeL8L9ktoppGK7nKCB8/3a3rm6OvcgGrRZSUv8i6EgXXMJNqeIU
	7eqHVtIPNp8UmRU0bc/6jdECsPEXgjIEDfla7cHMtXk44uaYQAb5fX6sJXFUyftwKbhA
	EEsg==
X-Gm-Message-State: AG10YOSIm2KoT5d+3JEMg2lepzw4xho9vGS9u6rnge05Rhd4MoQv0qGkRlzKkFO7Mur5lw==
X-Received: by 10.112.130.193 with SMTP id og1mr3701444lbb.97.1455817459770;
	Thu, 18 Feb 2016 09:44:19 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	e66sm1074662lfg.23.2016.02.18.09.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:44:18 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-11-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C602F1.5030903@gmail.com>
Date: Thu, 18 Feb 2016 20:44:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::231
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 10/11] target-arm: Make mode switches from
 Hyp via CPS and MRS illegal
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
X-TUID: SR6MBxDoG+f3

On 15.02.2016 20:22, Peter Maydell wrote:
> Mode switches from Hyp to any other mode via the CPS and MRS
> instructions are illegal mode switches (though obviously switching
> via exception return is valid).  Add this check to bad_mode_switch().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 69e93a2..e1af9d5 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5166,12 +5166,20 @@ void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque)
>      /* Helper coprocessor reset function for do-nothing-on-reset registers */
>  }
>  
> -static int bad_mode_switch(CPUARMState *env, int mode)
> +static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
>  {
>      /* Return true if it is not valid for us to switch to
>       * this CPU mode (ie all the UNPREDICTABLE cases in
>       * the ARM ARM CPSRWriteByInstr pseudocode).
>       */
> +
> +    /* Changes to or from Hyp via MSR and CPS are illegal. */
> +    if (write_type == CPSRWriteByInstr &&
> +        ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_HYP ||
> +         mode == ARM_CPU_MODE_HYP)) {
> +        return 1;
> +    }
> +
>      switch (mode) {
>      case ARM_CPU_MODE_USR:
>      case ARM_CPU_MODE_SYS:
> @@ -5290,7 +5298,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>      if (write_type != CPSRWriteRaw &&
>          (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
>          ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
> -        if (bad_mode_switch(env, val & CPSR_M)) {
> +        if (bad_mode_switch(env, val & CPSR_M, write_type)) {
>              /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
>               * v7, and has defined behaviour in v8:
>               *  + leave CPSR.M untouched

