Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2599457wru;
        Thu, 9 Aug 2018 20:38:41 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzukxPgIt8gSic++3kh2Jk7TTAgE2Fzw6LoLqselUbrTZsdJL+90Otu/DjB9vIMQ9uN8dBS
X-Received: by 2002:a0c:81ae:: with SMTP id 43-v6mr4354528qvd.129.1533872321345;
        Thu, 09 Aug 2018 20:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533872321; cv=none;
        d=google.com; s=arc-20160816;
        b=v59kcM6sFLj8sCB3IEaN3KhGEQbe7ZLrsVnVZEmcOCIPwIm3BsFPc8/9nUzsn8ceu0
         L04uVj1kWsck6cIesOM4neeY/4svxyXGTYBEhSsD9e8V6BZC8OVPya5Ks8aQMmBFr/hM
         IlhVOpUJyJfQOch4MKd3uL5T2eRxunlnng/2KziniG240zaDzkTms0dILvXYss8P5AtG
         gLKO7jg9bOWziuhHr3r44Q83LsZm2CUSg2x7rh2qaMp+TYM6zRrvXl/YGpe1HXZOw6y1
         QSvJsJjcf198W1ehufS1Z5nrH6WiLdwSGZlLNToiLvoDtpMnV1eB7tnuZiBHjf57ClWs
         VNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=fBzRW8myEIkOEX+LgsoL7l59GqZ9AqrJFocn4tIzPEo=;
        b=wIDTu22MSSy5AwSrdoUrzueis8oZD3YNqbYzdDP+ncRF+Uz23bXi7ufr0+Whw7sS5V
         Hd4Eksi1hXWWJGZh9rcjJq0CVzpqY7vTPEJ28vansosqLFo2/pGR/ua06giYf5OGoF2i
         8IuPaSRnKT1QnY8qZJAiYnH7UdC6CGTCcHEjJRQ/zbkf6Q7AmBJlTKTKy58CCcBu8/W0
         DVUW7dCyTtk5LPEsDlkbnR+DH93p1DOVms91Vk8QPfhk0I4zofRDCaNX4O3PT3f9G0D1
         FrO0g+Lq2bXJcFn/mu682V5Wg9OJtwurTjbqlSE6VsRfjem/zc4/+TKnoBBxd/Jskeco
         XlMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ijhout5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n11-v6si7148064qvo.33.2018.08.09.20.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 20:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ijhout5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnyG8-0006ka-L6
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 23:38:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyFy-0006hz-24
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:38:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyFu-00041w-UB
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 23:38:30 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:39709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnyFu-00041h-PA; Thu, 09 Aug 2018 23:38:26 -0400
Received: by mail-ua1-x944.google.com with SMTP id g18-v6so497793uam.6;
	Thu, 09 Aug 2018 20:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fBzRW8myEIkOEX+LgsoL7l59GqZ9AqrJFocn4tIzPEo=;
	b=Ijhout5ceRjgfJUGRftjUshGyQ23Gt+uSrqhmDvK/+iFFhTVn3lsVisI9CCG8ajASS
	1/znj3VrVZ8b+2Inh8HNMMiqUfKxUh66eB8ebZPFNOjwvkgRSgM4V680T6RefzvY/2C1
	7VT+6n/7by/l3O8A+ujfM1ZXpEtbb4QPmFZ7Wz3BdgaHS2IBiIarjn6fVttL3hEjX0rX
	VDM1CEUudsHp1YIsUZI2XJWshYiAU2Zbwf8nBHp/xmUGG3k5TOjO+NJdmME+cf6CayJ1
	eQCAl4G2fJ/39/NbNo+4TNfs5JT3D6ZgfdK5NDy11MlBG9sTwT6U47Fw/8QtlscxeS8s
	EvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=fBzRW8myEIkOEX+LgsoL7l59GqZ9AqrJFocn4tIzPEo=;
	b=m+zjFWXhKzwJJVTFewmQghe740EOcy/IFzB0l5B3ov7Mj84iFot1SKNvJERbMdUPbK
	H3xNK7REOdo96ZIVA5KeiRfw7Td8Vokus4ZvgLMDt5Th9fBLTQ0ufv/f4Kwk93CBq9cW
	r1QTuU5mDuA+Reii0qJ7WtMkpgYhlRkmsULqowWmPXGWHdJ6bkD13iuKbTUSPd52F8OM
	3vQWOx5iZUqoiyciUZK4O9y7+MFx27noQgrbjj5XL1ArL1K9A4YU8sJtB0haeLGuAs/K
	dF5jREEncucDvN+07qQ7u71w+VME5WAwU5AF2ajrdpBmxmaMppgTsQYAtl6W0MBhNaCC
	hveg==
X-Gm-Message-State: AOUpUlH2TQqtuCjonK6iz8VcQTkoRXxc775RW9m5sR69a/h1N0OBmOlv
	J4ejVF6q8MiKwyKRONktHSb3VFln
X-Received: by 2002:ab0:18a0:: with SMTP id
	t32-v6mr3255840uag.110.1533872306116; 
	Thu, 09 Aug 2018 20:38:26 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm1318172uam.24.2018.08.09.20.38.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 20:38:25 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-3-stefanha@redhat.com>
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
Message-ID: <e00e2807-e0ef-0c76-a09b-aec66177f9eb@amsat.org>
Date: Fri, 10 Aug 2018 00:38:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803144721.17036-3-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::944
Subject: Re: [Qemu-arm] [PATCH v4 2/6] target/arm: add "cortex-m0" CPU model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o76KOMkiSW1g

On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> Define a "cortex-m0" ARMv6-M CPU model.
> 
> Most of the register reset values set by other CPU models are not
> relevant for the cut-down ARMv6-M architecture.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
>      { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
> 
