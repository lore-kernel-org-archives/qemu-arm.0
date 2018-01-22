Received: by 10.28.71.27 with SMTP id u27csp2890784wma;
        Mon, 22 Jan 2018 06:54:39 -0800 (PST)
X-Google-Smtp-Source: AH8x225hfwt+uTaPORXe+Un82+udy7dklEyuHZ2pmFsErHkHdNolrQ2cZJaTURuwvPDracfCaQC9
X-Received: by 10.37.79.130 with SMTP id d124mr5535574ybb.150.1516632878927;
        Mon, 22 Jan 2018 06:54:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516632878; cv=none;
        d=google.com; s=arc-20160816;
        b=sMWhMUYdlS6KgXW+S+wYR0DGLTpi9GYhkIpJ7gMPkPSV+jNmwcMFNSUF272tfMOdGj
         ux6croEUZGIOgMZ8E674EB5rmNncKkW6QMncpFOple17uRykD0dKvy2xSkv7jBOjQWqT
         s8eTvYI4PlAv0HAszXQJx+jdqkhUaS2Dicn93WYB1nHNYHRHOIAvD7GAsyb9Ony0WTTg
         qYRSKqBtoIlQR6w6uCTRC2Ic/OQgNDOCS2j1/JWAmBGWBLKfrPutLZfpk+n6EcUcuwsH
         hhRLFKXP9zblr3cMi92sP9CTIT0jgZH6N/zo/kHdtF4GOvjWOUZGs1Z2Wuz6bQ3HxhWK
         A81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=186ns97gYHWwW7l6MmZXvbuyTI6mJjjxLJkKHqoIv58=;
        b=z+6eNDlwHV2cTCKNV1zfJcfP4eYfne1XE23bX0hFxDFvnU6fzi2+kB9MLYj6o5FYqO
         V0pnscof/q6LGhIYd1dwSFgB7svc8UQC/EDMLl2ir/EpsilT6EiZgaXhAB5zoBKuGU1S
         mJJ573OMJl5/RL2XJRRQTqcwDJBUUSyDr++xOTAiu+BV+bINoKi6A7wXLB+hgm1Z7j5f
         UFcMMnfygvovt46suc93dTEaDtyzoteEYbSlh+4hMBg8Jk0B6tvms6kksG+qHY0AAt7c
         q5PEZTIkQxh2OUvfxfbhWVGN6Zh+W9/iEoHHcMTpRGogz4z01/MlSHgpw6cjV2H75nzk
         788w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nxOgAGmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si1995307ybk.653.2018.01.22.06.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 06:54:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nxOgAGmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eddUc-0007TP-EJ
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 09:54:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eddUS-0007Ru-K4
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 09:54:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eddUR-0004UK-Fg
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 09:54:28 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eddUO-0004TP-U0; Mon, 22 Jan 2018 09:54:24 -0500
Received: by mail-qt0-x241.google.com with SMTP id c2so21356227qtn.9;
	Mon, 22 Jan 2018 06:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=186ns97gYHWwW7l6MmZXvbuyTI6mJjjxLJkKHqoIv58=;
	b=nxOgAGmmJtPBuate2qdofMHUWLtKm6+txXDUb3DQ4uf3IjBOPav3fEB3qiImgoIwmD
	sepUUPgoJoOLamXQOrhBHO6a99xe/bWn1zbXGAGfmyv65j7dDI8gqEqeeuEgAP2jutUj
	kEgYLaM0qNa5H/1vSAeqbqVYoyjjLroQUilyOhPHXotr4XsyvTRPWYdVUYtOSOF0XaVU
	IFWg29CWwtbm/lT/tzr0bNb6WLI/Vb3JhB7R9NKcN3YbrhrQizgiUaf9ilCJfPFc/v1o
	I1pquBZ8WhNNkNQYD6XBjINtZMbcVQ42Y7VEKLmQBb8ntQtCgJ3xHWTY1JgkGQWeVL3d
	AbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=186ns97gYHWwW7l6MmZXvbuyTI6mJjjxLJkKHqoIv58=;
	b=DjjkME4XUBw04WiV498NX5kVrNLYP2UplCYUTtY4pU2s5lLmsM3inn5tAcxMB+nAHC
	T5IuO7rRhKdl5VcWrvOz7HoU6QZ04beEvPyqnfJZKydgPbYjWirccxYhYPPLw7vF/LBZ
	YVG/9bdfKEvNaCHm+LNp1XyvSfB5lNotz3/Hcm9B0MxtiEVj3GjqhhY6xdL2Gf/F9fmw
	O9m/wBr7vOlAI4Vd2sSlZ+gGALFuJ+S5Q5QB1fEvyh6qEAqTGfabfMo7E9aDmc3JenUu
	Id3UBitXZ0R9zpfPVqWFFz6i7LVFluMn0gvjrRo1KFJtNkojIwtRWdZ8J4SewpMvqkpZ
	6+Lw==
X-Gm-Message-State: AKwxytc+ucs58pEKChCudx73q7twG7m0VCW98E6IUAf46qfKe86NZLkZ
	b2bpZVFxTEMnTTd+AOogTTkPNbEPS9Vc49N0X4Q=
X-Received: by 10.237.51.35 with SMTP id u32mr10877052qtd.112.1516632863897;
	Mon, 22 Jan 2018 06:54:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.113 with HTTP; Mon, 22 Jan 2018 06:54:23 -0800 (PST)
In-Reply-To: <CAFEAcA_epX=BOj5sxNVB2z-k3wQ+RRAry=OQi2b=i0d9pJaSeA@mail.gmail.com>
References: <20180113113445.2705-1-jcd@tribudubois.net>
	<CAFEAcA_epX=BOj5sxNVB2z-k3wQ+RRAry=OQi2b=i0d9pJaSeA@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 22 Jan 2018 06:54:23 -0800
Message-ID: <CAHQ1cqHXHxSH4LxSu0Jjug5hy1FhMYF-O2FtYbjpnm68VjTDpA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v2] i.MX: Fix FEC/ENET receive funtions
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
Cc: fyleo45@gmail.com, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ahckfxUDhmaH

On Mon, Jan 22, 2018 at 3:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 January 2018 at 11:34, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>> The actual imx_eth_enable_rx() function is buggy.
>>
>> It updates s->regs[ENET_RDAR] after calling qemu_flush_queued_packets().
>>
>> qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
>> is going to call imx_eth_enable_rx().
>>
>> By updating s->regs[ENET_RDAR] after calling qemu_flush_queued_packets()
>> we end up updating the register with an outdated value which might
>> lead to disabling the receive function in the i.MX FEC/ENET device.
>>
>> This patch change the place where the register update is done so that the
>> register value stays up to date and the receive function can keep
>> running.
>>
>> Reported-by: Fyleo <fyleo45@gmail.com>
>> Tested-by: Fyleo  <fyleo45@gmail.com>
>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>> ---
>
> Andrey, do you have an opinion on this patch, since you've been
> looking at i.MX code recently?
>

The rationale makes sense to me and patch looks like a good cleanup in
general, so FWIW:

Reviewed-by: Andrey Smirnov <andrew.smirnov@gmail.com>

I also gave it a spin against my i.MX7 changes with doing basic things
like ping and scp of 1GB file, so I can give my:

Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>

for that.

Thanks,
Andrey Smirnov


>> Change since v1:
>> 1. Rebase the patch on the updated master branch
>>
>>  hw/net/imx_fec.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 4fb48f62ba..9506f9b69f 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -595,19 +595,16 @@ static void imx_eth_do_tx(IMXFECState *s, uint32_t index)
>>  static void imx_eth_enable_rx(IMXFECState *s, bool flush)
>>  {
>>      IMXFECBufDesc bd;
>> -    bool rx_ring_full;
>>
>>      imx_fec_read_bd(&bd, s->rx_descriptor);
>>
>> -    rx_ring_full = !(bd.flags & ENET_BD_E);
>> +    s->regs[ENET_RDAR] = (bd.flags & ENET_BD_E) ? ENET_RDAR_RDAR : 0;
>>
>> -    if (rx_ring_full) {
>> +    if (!s->regs[ENET_RDAR]) {
>>          FEC_PRINTF("RX buffer full\n");
>>      } else if (flush) {
>>          qemu_flush_queued_packets(qemu_get_queue(s->nic));
>>      }
>> -
>> -    s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
>>  }
>>
>>  static void imx_eth_reset(DeviceState *d)
>> @@ -866,7 +863,6 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
>>      case ENET_RDAR:
>>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>>              if (!s->regs[index]) {
>> -                s->regs[index] = ENET_RDAR_RDAR;
>>                  imx_eth_enable_rx(s, true);
>>              }
>>          } else {
>> --
>> 2.14.1
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
