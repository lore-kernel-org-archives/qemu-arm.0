Received: by 10.223.159.74 with SMTP id f10csp3169302wrg;
        Tue, 5 Dec 2017 10:54:55 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZHlSDUx5d46HJD46EHAxksGlCkjShPUDPzKX8z8iyj0xeVxSiR0uEjssh1VQ1yPf0+jV7N
X-Received: by 10.37.20.9 with SMTP id 9mr13292511ybu.283.1512500095335;
        Tue, 05 Dec 2017 10:54:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512500095; cv=none;
        d=google.com; s=arc-20160816;
        b=he1bvPdnRR4/zK6PdTgUtOy7KZ+0U/7KNHrYC/eobjYvEIuCKktHv3xZxHC6QdNkIG
         9kF7XJB/sMISQHUL3Hy14UBave2kA0YOI4D/qRME40prE5EZkPvJvDcbnj22wHnyIeDK
         5szOe3cGXhkNCUh733nsYpT0PrJ2rPvc9zgc9yAIPbePMWwor2Sf4toHtane/JCvp7Oj
         +J87ysG8lIRElIKAtqCUZ0oInC5BWGm9uhv2oNDolIbeZGqc5wQx5631NlF8m7g6TWvX
         qKgSdy4lcEdr9NB94FEW5eEjKTCq4oyJBd68pHGcvSjbIw3Vl6ibSY3eSE3MsOtqMPFo
         0qDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pPSg+zsDLfTRKTnyeML4LyYiTfm8UH2e4rsfNlGPk68=;
        b=DnhEgqh8V6Oil1uY4U4HVWuwjvay82j6aqX4suuz/dzVMn+YQOT7u0FFQKBYNW+XGX
         hHAHKiXxhI3967WPlJ1G0N/B+zjLQOU/0YGck7M+G+IWuY6AITbAoDOUFo7P9PK58ZTA
         zYz7KjO5yTPwaDk01TtC/kGKoS+/R59GiH+MUXP2NYgXnFintlKM4N7DTe65uQAnjZrT
         EdFE1sDoF7YQDoDUmTJ7jcfCDnyWjZWi56iVu/Y+sSpo5cR7UUZ72HW0LwZPzd3XBlDw
         pOxitxA8+dpDvko0hpuM/4ZkFGJvwFsUx0pr9uorV5isZB5NtvK+UZIOIJx/ovkk3qPW
         AZZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vKs58vgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185si206674ywb.552.2017.12.05.10.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 10:54:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vKs58vgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMIMo-0005de-Qt
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 13:54:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMIMb-0005YT-8y
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 13:54:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMIMU-0001RT-Qo
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 13:54:35 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMIMO-0001OQ-A3; Tue, 05 Dec 2017 13:54:28 -0500
Received: by mail-qt0-x242.google.com with SMTP id m59so3175756qte.11;
	Tue, 05 Dec 2017 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pPSg+zsDLfTRKTnyeML4LyYiTfm8UH2e4rsfNlGPk68=;
	b=vKs58vgzSFPiYnZT2nnNWwNgLUlX8pdCBSKZgQzX/aNeWHxXADjxNkZWs/b3yGlp/R
	zhgOIxOzyauTdbGXAyCTLXoV2Iui1XhlkRPGFmA7/bT+I0xLDbuSHqCw3YYYOnOXl3o1
	ExadJI60HLR1D4JEqNwcSixDlVrR4v4jp28VYypQZVYvYv2QPU9koj1fdNX3vaJUML3c
	RUQyB5iPab8nYloSnkiY2S3Ck8z3LdyQAStZxxUtY+iXDEfqJOehEGvfYvB1Bx6xP+FH
	8i21kQVR1Ze2JV/0oR4Q+Yl1sH/A1NpwRECvv5z4UkLtu5QDbe2KqxATzO9DgkgSO7Ts
	iwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pPSg+zsDLfTRKTnyeML4LyYiTfm8UH2e4rsfNlGPk68=;
	b=VzVvJe3J74F9CgTkc+wsrrK2j3EgbnmE/v2epGfOM+8CeulhM8t02nsq36RNFuLAdc
	Nl6WMLUwAxcqN34QNdC7KTCjl2ReqkQYEC6ZmvmhHcBTyRidDjOztRkvYZt4oJ7SbJpp
	YezfYK8AH3FvOIliRa1Gjsnzm25jOOm6Nx22w9RA3sCQRZxdNsUhM1K2o+hxX6RB0Vv1
	uqlWUqUqmfODYQ6jY3lDMLRgNEViYweZP+FHPoBMHEZgXbO5BoNYwBnBnqnnsqQkbal3
	WkAgm+upt7FmUIKkxV+ccq0Gyw/j+UiZfWyOP5gymFw0ri9BwnguOx1ej2PnQoYK87lW
	Y5FQ==
X-Gm-Message-State: AKGB3mJuNMzRmnTZ9nqxYX39g82N6V6WMUPyPjLQmZy2Jw1BFCddWQ/A
	jCPTniac86Y64yPI10XKzLM=
X-Received: by 10.200.50.165 with SMTP id z34mr2988213qta.137.1512500067585;
	Tue, 05 Dec 2017 10:54:27 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id c21sm458108qkg.64.2017.12.05.10.54.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 10:54:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
	<1512153879-5291-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2d457a08-1581-6963-587d-d8d4b8367750@amsat.org>
Date: Tue, 5 Dec 2017 15:54:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 1/7] target/arm: Handle SPSEL and current
 stack being out of sync in MSP/PSP reads
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wuIvCCi9QNvY

On 12/01/2017 03:44 PM, Peter Maydell wrote:
> For v8M it is possible for the CONTROL.SPSEL bit value and the
> current stack to be out of sync. This means we need to update
> the checks used in reads and writes of the PSP and MSP special
> registers to use v7m_using_psp() rather than directly checking
> the SPSEL bit in the control register.

good catch.

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 91a9300..88394d4 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9953,11 +9953,9 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
>  
>      switch (reg) {
>      case 8: /* MSP */
> -        return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
> -            env->v7m.other_sp : env->regs[13];
> +        return v7m_using_psp(env) ? env->v7m.other_sp : env->regs[13];
>      case 9: /* PSP */
> -        return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
> -            env->regs[13] : env->v7m.other_sp;
> +        return v7m_using_psp(env) ? env->regs[13] : env->v7m.other_sp;
>      case 16: /* PRIMASK */
>          return env->v7m.primask[env->v7m.secure];
>      case 17: /* BASEPRI */
> @@ -10059,14 +10057,14 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>          }
>          break;
>      case 8: /* MSP */
> -        if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
> +        if (v7m_using_psp(env)) {
>              env->v7m.other_sp = val;
>          } else {
>              env->regs[13] = val;
>          }
>          break;
>      case 9: /* PSP */
> -        if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
> +        if (v7m_using_psp(env)) {
>              env->regs[13] = val;
>          } else {
>              env->v7m.other_sp = val;
> 
