Received: by 10.223.172.38 with SMTP id v35csp2800705wrc;
        Fri, 22 Sep 2017 00:27:26 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDgvtschn/4dUYyZF+3zWdmTw8pTDsERcjliTy4mnAJFMNo5eBkGNcqD8mw/Oyi32y+Y/XB
X-Received: by 10.200.42.92 with SMTP id l28mr7436422qtl.137.1506065246212;
        Fri, 22 Sep 2017 00:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506065246; cv=none;
        d=google.com; s=arc-20160816;
        b=EwX9W9uQpROKwh5c2xmMpDjby2SCXbas9MtwGlx2abvk55f4cYD+LPYxa/+v7XQ/CK
         bAG0wyTYWEs9uShvkVb7JuX05CepW905Bz8xltxq6NetJZPITy4zOC2yS78xys9s3Euf
         1UBqzUSZdLPAqjML7v0Opnsvxf5mTAefVy2RdXTbBY42Ss9wsJu1PdVRFuz8T+ftYWf8
         ZvWg7JPwexCIeJKmXuIKtRKf+iU0tq1RlodWho/Ky244WM44pcAM+j6JPxfhJNHUOdfC
         9VLh+9xhTlIoSx9fqSkotcWQmGuHDxhtOLYnb90GcGohIYxIbSEN0Xq/xJ2cWHDBej45
         FDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=y/gTwVO9ykD91/7mSuBQ8lkr7jl9H5ynv8BG4LAPa+8=;
        b=xfZytY9IV589n5yjFnHd2R+D93i2KqFrlArQpBXb+g0bIwGOWHZtfuzoSTNqhjdwd2
         CXa33OP9BEczkVBk9X/OLMTirnUzgEA59z3fNQqxvZinnecvzo13AqolTampIUwNUuFS
         tE/ZOB6ab9g56+7EtWahYdBjzgsXL7jemQzpmjCxpo2yKfLoHeIPoB1K55IZEd1VtTAJ
         7I1ue0JaMUpDUMadBvuH+V4iVdkF83gyy+UjFv+K/LY8SQ1q6JAYdyq7K13ih0o8fSMY
         JFJQRiK4KhB4ZU49eegxcSecgtsBc6whtVxRvpftuCSvc37uvwxmws0PE5V0V8dbEz2Q
         DcaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m92si2988567qtd.220.2017.09.22.00.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 00:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvIMt-0007jg-HL
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 03:27:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dvIMl-0007ia-Gx
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1dvIMi-000577-AX
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:27:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1dvIMi-00056a-1n; Fri, 22 Sep 2017 03:27:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62A2964D87;
	Fri, 22 Sep 2017 07:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 62A2964D87
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jasowang@redhat.com
Received: from [10.72.12.19] (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE725D6A5;
	Fri, 22 Sep 2017 07:27:08 +0000 (UTC)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-5-andrew.smirnov@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dbc5a135-10d5-e332-94b3-4e59596f1d76@redhat.com>
Date: Fri, 22 Sep 2017 15:27:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918195100.17593-5-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 22 Sep 2017 07:27:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 04/17] imx_fec: Change queue flushing
 heuristics
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /gbmYbbXk5Gr



On 2017=E5=B9=B409=E6=9C=8819=E6=97=A5 03:50, Andrey Smirnov wrote:
> In current implementation, packet queue flushing logic seem to suffer
> from a deadlock like scenario if a packet is received by the interface
> before before Rx ring is initialized by Guest's driver. Consider the
> following sequence of events:
>
> 	1. A QEMU instance is started against a TAP device on Linux
> 	   host, running Linux guest, e. g., something to the effect
> 	   of:
>
> 	   qemu-system-arm \
> 	      -net nic,model=3Dimx.fec,netdev=3Dlan0 \
> 	      netdev tap,id=3Dlan0,ifname=3Dtap0,script=3Dno,downscript=3Dno \
> 	      ... rest of the arguments ...
>
> 	2. Once QEMU starts, but before guest reaches the point where
> 	   FEC deriver is done initializing the HW, Guest, via TAP
> 	   interface, receives a number of multicast MDNS packets from
> 	   Host (not necessarily true for every OS, but it happens at
> 	   least on Fedora 25)
>
> 	3. Recieving a packet in such a state results in
> 	   imx_eth_can_receive() returning '0', which in turn causes
> 	   tap_send() to disable corresponding event (tap.c:203)
>
> 	4. Once Guest's driver reaches the point where it is ready to
> 	   recieve packets it prepares Rx ring descriptors and writes
> 	   ENET_RDAR_RDAR to ENET_RDAR register to indicate to HW that
> 	   more descriptors are ready. And at this points emulation
> 	   layer does this:
>
> 	   	 s->regs[index] =3D ENET_RDAR_RDAR;
>                   imx_eth_enable_rx(s);
>
> 	   which, combined with:
>
> 	   	  if (!s->regs[ENET_RDAR]) {
> 		     qemu_flush_queued_packets(qemu_get_queue(s->nic));
> 		  }

Not familiar with FEC, but if you are tracking 0->1 transition, why not=20
simply introduce a parameter of imx_eth_enable_rx() to force the flushing=
?

Thanks

>
> 	   results in Rx queue never being flushed and corresponding
> 	   I/O event beign disabled.
>
> Change the code to remember the fact that can_receive callback was
> called before Rx ring was ready and use it to make a decision if
> receive queue needs to be flushed.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>   hw/net/imx_fec.c         | 6 ++++--
>   include/hw/net/imx_fec.h | 1 +
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 84085afe09..767402909d 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -544,8 +544,9 @@ static void imx_eth_enable_rx(IMXFECState *s)
>  =20
>       if (rx_ring_full) {
>           FEC_PRINTF("RX buffer full\n");
> -    } else if (!s->regs[ENET_RDAR]) {
> +    } else if (s->needs_flush) {
>           qemu_flush_queued_packets(qemu_get_queue(s->nic));
> +        s->needs_flush =3D false;
>       }
>  =20
>       s->regs[ENET_RDAR] =3D rx_ring_full ? 0 : ENET_RDAR_RDAR;
> @@ -930,7 +931,8 @@ static int imx_eth_can_receive(NetClientState *nc)
>  =20
>       FEC_PRINTF("\n");
>  =20
> -    return s->regs[ENET_RDAR] ? 1 : 0;
> +    s->needs_flush =3D !s->regs[ENET_RDAR];
> +    return !!s->regs[ENET_RDAR];
>   }
>  =20
>   static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf=
,
> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
> index 62ad473b05..4bc8f03ec2 100644
> --- a/include/hw/net/imx_fec.h
> +++ b/include/hw/net/imx_fec.h
> @@ -252,6 +252,7 @@ typedef struct IMXFECState {
>       uint32_t phy_int_mask;
>  =20
>       bool is_fec;
> +    bool needs_flush;
>   } IMXFECState;
>  =20
>   #endif


