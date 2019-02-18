Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2754942wrx;
        Mon, 18 Feb 2019 14:18:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia6utP+vixmQshIRp7yXQfWIJKSEEQNHHgw3ZMl4c7ScVYu7WZda/6+5bKsuEodWO0wxiAt
X-Received: by 2002:a81:2209:: with SMTP id i9mr20769919ywi.2.1550528326162;
        Mon, 18 Feb 2019 14:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550528326; cv=none;
        d=google.com; s=arc-20160816;
        b=oxVtKtwe3wNYjGwu3cyVPB8M3yMvs46NYeg1VDv78YLiQN7LDDsnoYpncsHodxFdQ4
         jvi+nMeyGLCuPrW5VXtSmT2NDTRxk/SGv72Huy7Y73GumR5dgfO338f9dxkk5zc2bBvL
         eps4o4x6UHY4XRxWWYxdCuKBv4y0S0QjfI7/NnNNi7zXgQ98AbqcKUNtJCr1rX4Vv08T
         zADabFpNtAQ38sFr/AxEW4OZj0hCmvOEJ7Af7yJ2ThOGg//VsmwjdayT0KudgM6MpWPW
         s/sArubcYQSFVgVMM7gy+JoeQDJ8bzDp81MNQmZz5eNIej4QbiMefwEtVNeZpW08kJNL
         f+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=pgnUHNMzVz3e/Hbn4lSJANMrf78BHvcWzAYPkQRCt1I=;
        b=DeabAXs4dHLm1Rji+zYDCyhiFPeQGBEJJ26p5vgV2PTAGzO+1ZeUXc+ZUXnbs7c+4k
         gGkr8td1hdEv4I3ztzOLttnmIah2DVkgtkL5HAjcExuSePp7c2u1q6JncGfYqWkYzh1d
         +j4ls68ckeTDP7k0jfUtctcypsFxuurMwrlTbTsDBs0NYaQWBqifxLRx+eCcjmf4faW6
         nOs7zBul2beT2a04Pe+DIrvXbucG4L+0dVBXeU/T1G/eAUGr4vz9wKxkFGGyqeXxsX/Z
         wqONh64WtMcdD6UxZSdII9FVWSYIObHooKn0DkGHXfuDeJJgHfXMnK02tbljPJzsGjM1
         7UiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si8293552ybr.285.2019.02.18.14.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 14:18:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvrFN-0008MP-IY
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 17:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvrB1-0005d1-Cs
	for qemu-devel@nongnu.org; Mon, 18 Feb 2019 17:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvqyt-0006cH-S4
	for qemu-devel@nongnu.org; Mon, 18 Feb 2019 17:01:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gvqyt-0006bS-HT
	for qemu-devel@nongnu.org; Mon, 18 Feb 2019 17:01:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id l5so18914656wrw.6
	for <qemu-devel@nongnu.org>; Mon, 18 Feb 2019 14:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pgnUHNMzVz3e/Hbn4lSJANMrf78BHvcWzAYPkQRCt1I=;
	b=ATOTzEe2Z5EuAa9JiDHOj/RtyUP/pu2veyNpnDtyG9y1FOL3hY3d/12ZXjlUHg4RDj
	QPOXRcfFSXhbZ7BIRma15FXEoiBQ6SvDsOpnl6+UmQX3mFi7UTjQgR3pm/3nwWo6GEio
	n+OlrRg2GRXrn+l4gPAp1zFyN5yUZfz3oxUWOWWISpCmJLlafPcU3PS7MLM+Py1E3zmC
	6rlE4aRxUceI8ueNcg5atHHiMgrTVChpdZh5NsbwhYQ8KDASW5ufoFzSwWjKpYy0EmA4
	EqURFcV7XLHICc4hcnFk8ueu6i02eCWAregC0h1hSe+6uD6/WNW+89D21PQYiDrXe8hN
	wXSw==
X-Gm-Message-State: AHQUAubOhXxhrxw8B0NOHmkomi7Zw6AJgKs2Lo+vNZsUeE744VrpCW4q
	NbPkJV3/ko8W2oSEVsHHGjVMMA==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr17432895wrs.209.1550527302279; 
	Mon, 18 Feb 2019 14:01:42 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	b10sm2658521wru.92.2019.02.18.14.01.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 14:01:41 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3f81d4c5-8c2f-f8b0-286a-ba732a2794c5@redhat.com>
Date: Mon, 18 Feb 2019 23:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 09/14] hw/arm/armsse: Allow boards to
 specify init-svtor
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FDlqonmQ7h9c

On 2/14/19 1:51 PM, Peter Maydell wrote:
> The Musca boards have DAPLink firmware that sets the initial
> secure VTOR value (the location of the vector table) differently
> depending on the boot mode (from flash, from RAM, etc). Export
> the init-svtor as a QOM property of the ARMSSE object so that
> the board can change it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/hw/arm/armsse.h | 3 +++
>  hw/arm/armsse.c         | 8 ++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index 444605b44dc..84879f40dd8 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -48,6 +48,8 @@
>   *    if necessary.)
>   *  + QOM property "SRAM_ADDR_WIDTH" sets the number of bits used for the
>   *    address of each SRAM bank (and thus the total amount of internal SRAM)
> + *  + QOM property "init-svtor" sets the initial value of the CPU SVTOR register
> + *    (where it expects to load the PC and SP from the vector table on reset)
>   *  + Named GPIO inputs "EXP_IRQ" 0..n are the expansion interrupts for CPU 0,
>   *    which are wired to its NVIC lines 32 .. n+32
>   *  + Named GPIO inputs "EXP_CPU1_IRQ" 0..n are the expansion interrupts for
> @@ -204,6 +206,7 @@ typedef struct ARMSSE {
>      uint32_t exp_numirq;
>      uint32_t mainclk_frq;
>      uint32_t sram_addr_width;
> +    uint32_t init_svtor;
>  } ARMSSE;
>  
>  typedef struct ARMSSEInfo ARMSSEInfo;
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 9a8c49547db..3040ea9324e 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -505,11 +505,10 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>           * the INITSVTOR* registers before powering up the CPUs in any case,
>           * so the hardware's default value doesn't matter. QEMU doesn't emulate
>           * the control processor, so instead we behave in the way that the
> -         * firmware does. All boards currently known about have firmware that
> -         * sets the INITSVTOR0 and INITSVTOR1 registers to 0x10000000, like the
> -         * IoTKit default. We can make this more configurable if necessary.
> +         * firmware does. The initial value is configurable by the board code
> +         * to match whatever its firmware does.
>           */
> -        qdev_prop_set_uint32(cpudev, "init-svtor", 0x10000000);
> +        qdev_prop_set_uint32(cpudev, "init-svtor", s->init_svtor);
>          /*
>           * Start all CPUs except CPU0 powered down. In real hardware it is
>           * a configurable property of the SSE-200 which CPUs start powered up
> @@ -1185,6 +1184,7 @@ static Property armsse_properties[] = {
>      DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
>      DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
>      DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
> +    DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> 
