Received: by 10.25.21.156 with SMTP id 28csp1231465lfv;
        Mon, 25 Jul 2016 08:24:57 -0700 (PDT)
X-Received: by 10.55.134.3 with SMTP id i3mr21826923qkd.74.1469460297860;
        Mon, 25 Jul 2016 08:24:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si18212846qkb.256.2016.07.25.08.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 08:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRhkX-00044E-7V
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 11:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhiy-000390-AU
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 11:23:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhiw-0004ll-ET
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 11:23:19 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhiw-0004lZ-AE
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 11:23:18 -0400
Received: by mail-vk0-x235.google.com with SMTP id n129so202541283vke.3
	for <qemu-devel@nongnu.org>; Mon, 25 Jul 2016 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/hRYLXfhDP25D04P5eF9/NfyGN9j+gg/NOHsuGWuJZ4=;
	b=CzdrZ63vuUOhw9CJHpvMUtGJaweHD8tZNcBo/TFxWshji6SRGgteV37Au0faq/JMfw
	1as3bsDEzgXsliViQtTDegv+ViWfkLvwbuVIQbvC3NN/4fLTnY7kAghLWHQQbrCzDF/L
	w6yfZ78EhVNE7f0YlRNp8vS3HFxiwjyg7Q1M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/hRYLXfhDP25D04P5eF9/NfyGN9j+gg/NOHsuGWuJZ4=;
	b=lVdN4jLLkBkex5D6NdLETIesreDN+HcldRTkFVII6rs2VymZZMfI+xucsJJyHBzII6
	jUs5xAf87RcnqEdPNXrjsd/xwm2uGzizIAJ7KOeINNtadDKr+S79tyk0p5jShetVIXvr
	W4b0WcORNqWOafyb/06baj2byWiA2rBAWLWfs/IWeCxwG4/M1Dqp9BqjPSB1HYEM1yul
	kRs3vXBXPLzpSHLnxsWRnQh68uWiXRih4bD6EE4pnTtlSvEz/G9cKoeiqPClvYBZBy1J
	h5RzIm3HuHY9JgvcRxb+SYa+mGJfCtiEv51Bg8P1kgt0fzl68CjIIVkdJO1GL6nGaGkZ
	6O2A==
X-Gm-Message-State: AEkoouuUSteVTa6xTY3FVT+HTXZrsX84/8ivQ58zl5eGOss4CkG8tIhvdotEjgw30Ap9nS8oquV/a8SN0umB3DB0
X-Received: by 10.176.0.208 with SMTP id 74mr8997042uaj.64.1469460197921; Mon,
	25 Jul 2016 08:23:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 08:22:58 -0700 (PDT)
In-Reply-To: <4f9d6af885632f6fed07d88e43a870b32f782122.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<4f9d6af885632f6fed07d88e43a870b32f782122.1468279072.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 16:22:58 +0100
Message-ID: <CAFEAcA_zb+7aCPdkUj1Gi5mOUfy2GdmqmsArdKU3ChzR+HfXNQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-devel] [PATCH v1 2/5] cadence_gem: Arrayify
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1StUBFuxSrAj

On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Arrayify the Cadence GEM device to prepare for adding priority queue support.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
> This patch has no real effect, I used it to help debug some issues so I
> figured I would leave it in.

An expanded commit message here would be useful, something along
the lines of the hardware having N priority queues and that
the behaviour doesn't yet change because we only use queue 0,
or whatever. The subject line is also a bit cryptic.

> @@ -1247,8 +1249,10 @@ static const VMStateDescription vmstate_cadence_gem = {
>          VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
>          VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
>          VMSTATE_UINT8(phy_loop, CadenceGEMState),
> -        VMSTATE_UINT32(rx_desc_addr, CadenceGEMState),
> -        VMSTATE_UINT32(tx_desc_addr, CadenceGEMState),
> +        VMSTATE_UINT32_ARRAY(rx_desc_addr, CadenceGEMState,
> +                             MAX_PRIORITY_QUEUES),
> +        VMSTATE_UINT32_ARRAY(tx_desc_addr, CadenceGEMState,
> +                             MAX_PRIORITY_QUEUES),
>          VMSTATE_BOOL_ARRAY(sar_active, CadenceGEMState, 4),
>          VMSTATE_END_OF_LIST(),
>      }

You need to bump the vmstate version numbers if you change the format.

thanks
-- PMM
