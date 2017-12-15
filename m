Received: by 10.223.159.74 with SMTP id f10csp208559wrg;
        Fri, 15 Dec 2017 02:07:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBota9JmX30ClWC2vo1+0rXUuluxVlzmlCQ94qx42oZgxTCpqSfy0FL/osdGVZmqnqP9NTvuS
X-Received: by 10.129.80.130 with SMTP id e124mr6234976ywb.489.1513332425207;
        Fri, 15 Dec 2017 02:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513332425; cv=none;
        d=google.com; s=arc-20160816;
        b=AVgti+ormMQKY6AVeLPR7JhJMQ3cTenjtpE6SD47RbuiG+gdKQQfOD/vHGGYwqtbJ9
         qJQl8fGyz3Sj2v8q8c4ABVeF7B5mHiK9hGxdI3TGh1kPDnTVWALBKE1x/ZEqoLdiZSh6
         +3qrdRDarbj1tHKE1bek97lgptrLvaZ8coif5PAMCkp1h9hLuZPJ/AJTjUCxOfDz2Fr8
         DLlY3KEJwE1jFB6HSbVLRgMDS+suUDrmI6RxP7HDtlbQULVsXolQXSelltAByMPU2UQU
         W3jbYsgV6icNTk1gNRH3tKsYLIPf9GHQMq9EmgEy40jhxfObRVJVSbI4JQyfwbaPPhUm
         41dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zxOuKoCyG4JRnChZrmdLtxwVC37mH4qJDZLNMdsVj4E=;
        b=pgLBk/j3T+xrJo2psbfwvdfFYilKWYHEBgmwJlpgKt741AumBEb7yhKviltFcvgShg
         oGtdWdK3lx+GrZ2n1w8Hj0WgHHRC4nkax9k25lP0r7gC52xkrw2JUFBTU+CZhBNo/XVC
         GlpB6QHG+AXb1cAKUArOhGus5epgtOcaI/wngGhVhMIZ+u1Kd2NfPfQY9iIJHWVtKUb4
         VKkvolaJiSgyIhPp5hL12gIKJ3W0IHfSBSHtNr9OPiIloNjzAlRLI1iK9xf+3hMIYCZ3
         aGA5PGVGj+K+eLY9/HL3cIvWUKjb6OKdKWkjYv4jgW0iKQv9NIr6D1SV/0tBXKy1Gitv
         wCmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iwo+352Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si1209338ywf.102.2017.12.15.02.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 02:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iwo+352Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePmtU-0006Sn-Ko
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 05:07:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePmtB-0006Ow-RT
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 05:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePmt6-0002h6-5b
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 05:06:45 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePmsx-0002ZN-4M; Fri, 15 Dec 2017 05:06:31 -0500
Received: by mail-qt0-x242.google.com with SMTP id d4so11419065qtj.5;
	Fri, 15 Dec 2017 02:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zxOuKoCyG4JRnChZrmdLtxwVC37mH4qJDZLNMdsVj4E=;
	b=iwo+352QzHUPuuFi6Y/9dAPIZ1wFzg4IZkJKHwZfFXDtSeslPXOTrhwzCWhW1TKzhK
	J8/oBYoaS21Q1rAxqDSv4+VUePxfDnM/lS41MGrqTIO9PGGFuKy4SUTDKm8jt2W2Y/If
	dJ4ixH1N4TTGq5ToX97q7sFMrm5SLdzOdJKrt/n+1l28sqlI1ySFq+BGDIA4AfPwyFW0
	VBBcbBTrNt6J1zifOUfJgEkBcg9mHwzM7vTZYondmVBp9AMX4iRXgjKxyjKKnaIRxaTu
	8n9dx/UL37JwGgE1Fg5gXiiz4vm+Dghyb9hiWgfIbf2vWNtEAuIEw8NDa3zwsfFUuFA3
	uE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zxOuKoCyG4JRnChZrmdLtxwVC37mH4qJDZLNMdsVj4E=;
	b=kGsmPpc+ef5X0Kw2Ob5keWWGrH8XYEqaQIoENYTde8FibuO5QtgAeRAWEJ4BKcFCbl
	PRiDPYi2fe2ugqThnX6GILbNxfdl1tDFQ0wruLehn+OAgwTdoEH6IRgINhQ4PWgj1asl
	Lm0Y+NefyvKz+PnQ+jpaQ7b0JLbw6zJ+bhI0Tqimf9eTTrDCpEpLPtqx2jqKtPEYjewH
	2jDFGUER1dzyeyAsUjvGy27kGzXsdla2Wfmu1LB2wPsnyz2Nmbbl6HxzvYTkGATtuGKf
	PJcfE7buzKPZAWhP7PX25kQgStLIhEetSDrdLT23eAepmGTW+nnOPt67hhBCSCSih4PE
	wuQw==
X-Gm-Message-State: AKGB3mKrXZyY5S5We9zHI+LCalI+qI8YOZJQT867TlODfs+h4Ziykiud
	PKzML6LQYPoZi+N/7solWsw=
X-Received: by 10.200.38.130 with SMTP id 2mr21306550qto.72.1513332390571;
	Fri, 15 Dec 2017 02:06:30 -0800 (PST)
Received: from [192.168.1.11] ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id k3sm3650172qtj.40.2017.12.15.02.06.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Dec 2017 02:06:29 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-3-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0f0bb800-af8b-d36e-c8da-10b0f2bd1e09@amsat.org>
Date: Fri, 15 Dec 2017 07:06:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171214145255.31545-3-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH v2 02/15] imx_fec: Refactor
 imx_eth_enable_rx()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3XUfNR+5UaO

On 12/14/2017 11:52 AM, Andrey Smirnov wrote:
> Refactor imx_eth_enable_rx() to have more meaningfull variable name
> than 'tmp' and to reduce number of logical negations done.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/net/imx_fec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 88b4b049d7..8b2e4b8ffe 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -536,19 +536,19 @@ static void imx_eth_do_tx(IMXFECState *s)
>  static void imx_eth_enable_rx(IMXFECState *s)
>  {
>      IMXFECBufDesc bd;
> -    bool tmp;
> +    bool rx_ring_full;
>  
>      imx_fec_read_bd(&bd, s->rx_descriptor);
>  
> -    tmp = ((bd.flags & ENET_BD_E) != 0);
> +    rx_ring_full = !(bd.flags & ENET_BD_E);
>  
> -    if (!tmp) {
> +    if (rx_ring_full) {
>          FEC_PRINTF("RX buffer full\n");
>      } else if (!s->regs[ENET_RDAR]) {
>          qemu_flush_queued_packets(qemu_get_queue(s->nic));
>      }
>  
> -    s->regs[ENET_RDAR] = tmp ? ENET_RDAR_RDAR : 0;
> +    s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
>  }
>  
>  static void imx_eth_reset(DeviceState *d)
> 
