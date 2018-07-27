Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp311023wru;
        Thu, 26 Jul 2018 22:26:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfM5PPjTLVxzWYE7dLr6LlX3KrVxGFcgStj618tgOZVfNxUbsotxHquwMxQt++TvYpM4EP5
X-Received: by 2002:a37:2fc6:: with SMTP id v189-v6mr4535483qkh.433.1532669214521;
        Thu, 26 Jul 2018 22:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532669214; cv=none;
        d=google.com; s=arc-20160816;
        b=esWw1cENzSriqJQBxh5KRB5pYHMTqc0vnG7KGX2NP3BPvTaZvrJ/coTotpfi9YRL5q
         bDABSYYCqcATTKPPABraTuaWc6l34PNEN1UdyjA6Aml42pm25WQmde3/6ToGNQKkeeog
         G0+V3pfzQqp/Ec5+e+vXLzgPgurF3npQLD6VYLupqgPtDX8WHi0jAcLUchHihURHchQR
         RJwRgkzLYOWNlg8GM3PNmxKdO/ZfHCEG4VnFVbjG3O9e7tjTFbQm1bdX9D6UUXecSH9n
         4sCxP0XpgFA2HpvXC3p2/wod5hIUmSZ8No/qgN6r4nn2toF2XJZ8QYCdQRJEcjp7cMBM
         2vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=92h/xuAlq0vNa2s+gNfA/1MwsLXYblLFDcgU5YvRmlg=;
        b=H0VBe4eLDx7FRYhe7gYaHT+cfwOsbmXvkSyR15p1Q00iNX+sbbAAB7+ysmEAjZbjqi
         dxv1EkNjeE15blqw2Jix+iyR0i/7KRmQWjohu1dvYCNnUKLU1Maq4V9bbKsDocfanwdE
         3oQKNC+DzEfO9YxP6yWe1WvoC5Bzuz8uAYvE7QxQHPllL3vMZZ3SAEHRgXdY2gfBhd94
         n6ZLeMutmIphP91zDzG8xXuPEoXpalz+FKZXPieptorDPZkhM3EQ9UWXKVbGIUWn2lRr
         nMt2deSwxZI1l9i4djrehsy3yLOwucAWgiHzVOU4kj4Ig4j/9S7USulOo5TsOzfoWztl
         aesA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JwoZfCU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3-v6si3002766qvm.158.2018.07.26.22.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jul 2018 22:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JwoZfCU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fivHC-0003Zx-2n
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 01:26:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fivH5-0003Zk-OG
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 01:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fivH0-0005jM-QL
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 01:26:47 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:35224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fivH0-0005j2-JW; Fri, 27 Jul 2018 01:26:42 -0400
Received: by mail-ua0-x242.google.com with SMTP id q12-v6so2613268ual.2;
	Thu, 26 Jul 2018 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=92h/xuAlq0vNa2s+gNfA/1MwsLXYblLFDcgU5YvRmlg=;
	b=JwoZfCU0aPJRlD+Cv8sF3IbU2IyNOftCJe/YtN0FlU+UPIl7W1MkN0ERR/NxNy9vAn
	VakujX9VUqDhvAl8lY+ZnudcPl55i4t3CcavHemHrM0y8iu2n27fydC5AbibPwIYUuGo
	8dLB/mMQl+1zFxuR0BIfKnJAz6mj8T4PXS/0dnrPdOKiNmHo2MZL63vntM+2TV9ohs0j
	nom2iwcYnt7J1GyJzTolD1V4Ps888/ZoOeUnkbf6rrePJdwjW3avpVdQtLuPDRL6Oe1e
	vfUy9Sv+2fr+YQPl5C2lIBXGpOuRQMEUVkCL6jFVbF6CeXWLpAHL8wUA74kBUXcvuY3S
	EfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=92h/xuAlq0vNa2s+gNfA/1MwsLXYblLFDcgU5YvRmlg=;
	b=gAs59V6097A0oT8WLuSZGfPOMOkHlsGLPc4TIOOHtpIryCxe7JcYgq5kvCu/aBW4Z4
	usXAxmkDnKtWOTou67iMsFoL+ZEoj7L2S+oD0IoAzSbcf9iQzqDsitENxPrfRRmMoAD6
	qMDKUBi2cnm5pemcRVy7WbwuZcdyxhva0ZGdeZXprY0IQm5M5MsdxgPAch9l+16wycvG
	qLmyXR52+TYSRuZUrYm8AffscyvfNOTOPDyCzuHgS2QNZ+GCCXfpQ8drS4qYTYMVhkPf
	YSja9NDCieNrjBv/oUJokbCpC17JefytdrBAPGJ1ID+S3OLFX09cRrzxNy44MZ16CTij
	RaGw==
X-Gm-Message-State: AOUpUlFxsES1tvDA6hWX7MpEqa60NNHjLM8+T7t+4BHoEhZf5nqq6fwf
	cTQdBCEFYyZKsA7x++b2Vlc=
X-Received: by 2002:ab0:5097:: with SMTP id
	c23-v6mr3368683uaa.43.1532669201965; 
	Thu, 26 Jul 2018 22:26:41 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x67-v6sm943177vkx.48.2018.07.26.22.26.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 22:26:41 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-5-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <829318c8-9921-b856-e2bb-86583f43a8e7@amsat.org>
Date: Fri, 27 Jul 2018 02:26:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725085944.11856-5-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-arm] [PATCH v3 4/7] target/arm: add "cortex-m0" CPU model
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
Cc: jim@groklearning.com, mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XTH6vg97ajLZ

Hi Stefan,

On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
> Define a "cortex-m0" ARMv6-M CPU model.
> 
> Most of the register reset values set by other CPU models are not
> relevant for the cut-down ARMv6-M architecture.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  target/arm/cpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 3848ef46aa..7e477c0d23 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
>      cpu->reset_auxcr = 1;
>  }
>  
> +static void cortex_m0_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_V6);
> +    set_feature(&cpu->env, ARM_FEATURE_M);

What about ARM_FEATURE_THUMB2 (T32)?

Peter: Since the M0 (optionally?) supports 32x32 multiply, should this
cpu use the ARM_FEATURE_THUMB_DSP feature? Else this might trigger an
'Undefined Instruction' in disas_thumb2_insn().

And what about optional ARM_FEATURE_PMSA?
Oh this would be cortex_m0plus_initfn() for "cortex-m0-plus", ok.

> +
> +    cpu->midr = 0x410cc200;
> +}
> +
>  static void cortex_m3_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -1845,6 +1854,8 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
> +                             .class_init = arm_v7m_class_init },

What about renaming arm_v7m_class_init -> arm_m_profile_class_init (such
your patches 1 and 2)?

>      { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
> 

Regards,

Phil.
