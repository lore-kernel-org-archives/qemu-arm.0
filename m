Received: by 10.25.159.19 with SMTP id i19csp1400844lfe;
        Mon, 8 Feb 2016 07:40:31 -0800 (PST)
X-Received: by 10.140.19.132 with SMTP id 4mr3838948qgh.56.1454946031607;
        Mon, 08 Feb 2016 07:40:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u21si19797635qki.75.2016.02.08.07.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:40:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSnvS-0007ir-DK
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:40:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSnvP-0007g2-Ks
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aSnvM-0001Pm-CI
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:40:27 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:34732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aSnvM-0001Pc-3w; Mon, 08 Feb 2016 10:40:24 -0500
Received: by mail-lf0-x242.google.com with SMTP id 78so5281110lfy.1;
	Mon, 08 Feb 2016 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=NsSba7l3ir0ho/1pbRIv7gk6nbVWobhzvryOoykwdIQ=;
	b=kDevmDkUHhTxBtykSNhsYFnT/zEJ42bHCAr5i2DIInee8jSRCCm77x2gUs50VuCufA
	6Z1oxlnu1igYO3nD2DNnzEAUQpcB7RbeABOn9Zsl7MGoCo4UVcps3rxBTNFiPR7DYWhv
	4mYYGy950XrheU27mT/JIJwo+q+rlnF18L5P79wAqz4KJH115O9LUq+N2zBSr8vk/euG
	8AxLtjkMg1n2pYhZiSdhKs16M+ClLwBtNrhj4eVFSMdiWHM9BJFaalr2aQvqUDOkGOLt
	o0Z7BLr0Nv1TqsMfFvFtO1CECu5fjS/LQMc0QRRDYArnU6pk1eNWhgUHzOXABX2QWCZF
	gBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NsSba7l3ir0ho/1pbRIv7gk6nbVWobhzvryOoykwdIQ=;
	b=Iegw7PHOEZ9hFhLqtLpjbqZCnw1ZGupKZeOlPg6z6yTTHt/bQ4Y/2LE3Oot9w8avxv
	PM8/0w9+Qj+LMZ82s0jLWZFKRia23VfgoKUDIes7G4z7IdYFFt+Gv78FRa2gAGJMbih6
	JrfMfA9lNdcG7UHqiMcYln/j69GGOOgGSl+wsUzwjKeFTqbH8n3WeSlor7IXj+UtukW3
	YPv6gzmIy6LdG0xZKv2sWVZp2MgOVwMp+IyPn7rNWt6nD9dmqXS7qUkKZG1vxNPysrGD
	7l30GJ0Po9x92dQsCS0p33rGKR+v0H3jV0+kcFWu0b++Q0zxKn2SSo8d47ROMAR9P9n/
	qZRw==
X-Gm-Message-State: AG10YOTlXmQPyB+NAsJ/pLlnsapCdCh6jBcu6tgNcINYkntQ/gf++y/rjc+SREsd1dH/Hg==
X-Received: by 10.25.16.30 with SMTP id f30mr12656928lfi.126.1454946023333;
	Mon, 08 Feb 2016 07:40:23 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	l8sm4150951lfe.24.2016.02.08.07.40.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 07:40:22 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-3-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B8B6E5.1060809@gmail.com>
Date: Mon, 8 Feb 2016 18:40:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454690704-16233-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 2/6] target-arm: Fix handling of SCR.SMD
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
X-TUID: S9cwtjNoi7RF

On 05.02.2016 19:45, Peter Maydell wrote:
> We weren't quite implementing the handling of SCR.SMD correctly.
> The condition governing whether the SMD bit should apply only
> for NS state is "is EL3 is AArch32", not "is the current EL AArch32".
> Fix the condition, and clarify the comment both to reflect this and
> to expand slightly on what's going on for the v7-no-Virtualization case.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
> The bit about forcing SMD to zero confused me, anyway, since I
> expected it to mean "in this function", not elsewhere...
> ---
>  target-arm/op_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 313c0f8..4fedae5 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -614,12 +614,14 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
>      int cur_el = arm_current_el(env);
>      bool secure = arm_is_secure(env);
>      bool smd = env->cp15.scr_el3 & SCR_SMD;
> -    /* On ARMv8 AArch32, SMD only applies to NS state.
> -     * On ARMv7 SMD only applies to NS state and only if EL2 is available.
> -     * For ARMv7 non EL2, we force SMD to zero so we don't need to re-check
> -     * the EL2 condition here.
> +    /* On ARMv8 with EL3 AArch64, SMD applies to both S and NS state.
> +     * On ARMv8 with EL3 AArch32, or ARMv7 with the Virtualization
> +     *  extensions, SMD only applies to NS state.
> +     * On ARMv7 without the Virtualization extensions, the SMD bit
> +     * doesn't exist, but we forbid the guest to set it to 1 in scr_write(),
> +     * so we need not special case this here.
>       */
> -    bool undef = is_a64(env) ? smd : (!secure && smd);
> +    bool undef = arm_feature(env, ARM_FEATURE_AARCH64) ? smd : smd && !secure;
>  
>      if (arm_is_psci_call(cpu, EXCP_SMC)) {
>          /* If PSCI is enabled and this looks like a valid PSCI call then

