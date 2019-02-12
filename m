Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1029690wrp;
        Tue, 12 Feb 2019 10:31:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaCvQHoMCoUeAxXfOfj03xsLkU5siwbrbrNecAVt5L5XVhcm9W5R4CBOsV/vLJRqQF3PsxN
X-Received: by 2002:a25:4055:: with SMTP id n82mr4217642yba.132.1549996280020;
        Tue, 12 Feb 2019 10:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549996280; cv=none;
        d=google.com; s=arc-20160816;
        b=Tp9P5tYW7r1vAf25avNZkZxcESsROCubP56oVE+JYrcrspyD34IkAYJKaQURuLey/M
         nTYzbA9tXg9QfUzB1LU46YJchKsYblhyv0wFk8pie44iL5pGK4HnCImri9Kzafg6Jhid
         FiiyqRE1F3p0Wly0Gp/li3HJ6Ygza5iF6xpgCoye1u6RmAsjnXqa9aR8xRKrndkUgaKa
         E+oc9N1HqtHGSu9LbuuJpyaDQnCS2uApizIqzBFtj4GKGbtlvbO78Iv5FswQW3y4nrGI
         N3VTwcp/XCtQ0yv/nkrFlltf6L+rjh+1cNTMlkntQucrBbdbBG2yhEQ7ZLmzQ2tLqsJo
         VDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=FZvPyPO3/X3ygBTpzKevT/iReWgATVrKgGgD4hjx5cU=;
        b=rWNCsDFbErf7WuZMgZncvMPYHCE79vFIVqjfRfpzHmYD8mZYj7FV3CJ1YCA4oUVEAs
         BXslZ7OPX7VpwrQyflZxC1EqFO629BVTTBFBfFamft2wZpE2/DydmEy0wyAmQ1Cw9wdZ
         CEVNQ0tylwiGZqcbM3vyESnOBh173bW2eBPZCdBPUe23qFvo2u3Au/VrxRzEwK2z16C4
         /i9W61kLKO8KG4lnHIaMklA6spWocOT5cyxifdVf5g7vosjwlzjhT/N6dG8Y6TIs0s7Q
         KL0sMbnTqzsUHSpfbqx4myGqyHQ09yE4tmfErVRdrt5lNHkh0COBGEIaf7PPB3GJn+E6
         rnew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si1290784ywa.456.2019.02.12.10.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 10:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtcpz-0006Ei-D5
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 13:31:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtck5-0001Xq-6H
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:25:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtck4-0004NK-Cx
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:25:13 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtck4-0004Hv-7O
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:25:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id x7so4093449wmj.0
	for <qemu-devel@nongnu.org>; Tue, 12 Feb 2019 10:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FZvPyPO3/X3ygBTpzKevT/iReWgATVrKgGgD4hjx5cU=;
	b=CH0VO/Af0FJIVUIDurSV7zFn6rPtvARUym1cw1vQU1cwPpb/bwJRI3ZofRb7di4j2x
	xVlhqsiyKIPNJFrlBEOM46X7XJHcoKsHZ2ZJLGyhOB1Kj4JGs66Wk988LWnpXGM35zLw
	udE7Uhb/7GxSnHwxOAE90zk+Cp/LV6Zc/ufCUVdYdiXsOkuFYYoY0PFtpPIXZUcxZSZI
	obD/iNcRvWRiBdCse4zid0S+JrYL6IZjvR8JGAxmK3Sn02I8eUIj1jqpwirgj/hTfmsJ
	N0lDIIUMw8uGHBaDNyZlPNlVC6u8KkvIbEGGONaTcLUVDcXQEKKyPBHb2OLF2tWXZSHI
	yaTg==
X-Gm-Message-State: AHQUAuaIsZwRLTRqdomYod9MxY3N+x05QSXTDcw11pg5Zrz1JTtDSJHh
	7ltSKJHDQPRRmwTCwWoT9a/d3Q==
X-Received: by 2002:a1c:7dd7:: with SMTP id y206mr116597wmc.123.1549995907214; 
	Tue, 12 Feb 2019 10:25:07 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	c139sm5883570wmd.13.2019.02.12.10.25.06
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 10:25:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190212181917.8322-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fdf9bc20-2694-107e-4e27-d5db7616a367@redhat.com>
Date: Tue, 12 Feb 2019 19:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190212181917.8322-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH] hw/intc/armv7m_nvic: Allow byte accesses
 to SHPR1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Julia Suvorova <jusual@mail.ru>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VImPg3eEHQuH

Hi Peter,

On 2/12/19 7:19 PM, Peter Maydell wrote:
> The code for handling the NVIC SHPR1 register intends to permit
> byte and halfword accesses (as the architecture requires). However
> the 'case' line for it only lists the base address of the
> register, so attempts to access bytes other than the first one
> end up in the "bad write" default logic. This bug was added
> accidentally when we split out the SHPR1 logic from SHPR2 and
> SHPR3 to support v6M.
> 
> Fixes: 7c9140afd594 ("nvic: Handle ARMv6-M SCS reserved registers")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The Zephyr RTOS happens to access SHPR1 byte at a time,
> which is how I spotted this.
> ---
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 790a3d95849..2fd40f9dc4c 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1956,7 +1956,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
>          }
>          nvic_irq_update(s);
>          return MEMTX_OK;
> -    case 0xd18: /* System Handler Priority (SHPR1) */
> +    case 0xd18 ... 0xd1b: /* System Handler Priority (SHPR1) */

Can you fix the nvic_sysreg_read() case too?

With that:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          if (!arm_feature(&s->cpu->env, ARM_FEATURE_M_MAIN)) {
>              return MEMTX_OK;
>          }
> 
