Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp707310njb;
        Thu, 27 Feb 2025 21:55:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXY5vsL6dVsTKg99KFLEA7xUH5vha706CLGRjTjCYUQohziXOgFe+LVhE+8pBNYfxioEfPBYFTLNTjJ3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGU6IaJmV2rclbUzdxRIxsIGZ7yFuZKVJrtF1PKV0ol7qP6jAHwUVU4Yww+ihe2hjeIFmH2
X-Received: by 2002:a05:6214:2462:b0:6e4:2f4c:f2d2 with SMTP id 6a1803df08f44-6e8a0d4a85dmr43047166d6.31.1740722105095;
        Thu, 27 Feb 2025 21:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740722105; cv=none;
        d=google.com; s=arc-20240605;
        b=Vw2ehnF6/t+8xGeE4tCUEdTGNMTeTIyWorJF91sKWDe4eof5n3S6vERvZ8UHkasTrU
         RB2J/gP28Ogs+THMIsfEahL9ZaNM8zDRy7eWgbbVcv5bDBNzH5D4ElKVsVu9i+iwcDDA
         EOvS8KNhjYT3e6hhqU9OOLuSgrOSuB/n1q7WnILmNyTZgXDdCwynKhzf2iZXhvoLWXmR
         zuZAymIRqDlYRkIvUfpk4nYwZdWNSgn1h2EfV+MwdEPCdzLv4gp84dc6bDOeRUWUQw3H
         EEdw7Emc4RKYWykHgQjzhHJy27cOt9aRlCC7+JzCI4G6FkWpfqJSaIRasmwv8lIw+wLn
         icyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=xpduKm2nv+BgraP+yHh2zp7BXHZ0LEneJBstQyufPjs=;
        fh=AfhOETca6ZVLCtFZYCvRw70/NS11b2Vc+1+WLo0crDI=;
        b=E7uePwdAi2f//CUhew39xc3LqFr1tb9EbDpwSimfM8q9l6pts0duEA4xXradAG7M3v
         7fxJcNviziwX+ICGBdXq2e0Qj266sQ7IBcUrlMpDfR5Or8mvg1HdWbS0+JH7Aq0wqpBM
         ZH8qocfT+2yY24HKQcSAb04MnNMR++iCKf/ODIEzJlwDJhO23NFhtZPzLWz6BNW9WEE7
         kxytOMRMCLBhCaLuBlNoWGmXiFiTQO1NxldUuF7UhFNKIEESZRCovNwX/qn5NSNCG0Dr
         ESeDQEQccB6J7pKJMqOxORYt4RYtSSl3le+115psaPVNJ4ljinMF2SpkhPwwYm4kWo24
         ju5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b="FeO6H/qD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e7465si26100176d6.32.2025.02.27.21.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 21:55:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b="FeO6H/qD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tntKq-0004Nf-VY; Fri, 28 Feb 2025 00:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tntKn-0004K6-Im; Fri, 28 Feb 2025 00:54:53 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tntKk-00016A-49; Fri, 28 Feb 2025 00:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1740722081;
 bh=xpduKm2nv+BgraP+yHh2zp7BXHZ0LEneJBstQyufPjs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=FeO6H/qD4zPUZSUEslLVj3qb1hZKYk1Y2sfbzyWhqca28lBNx4ti9rhv2AOfMryEv
 rqVa4dLyTCYjKb+s9cjrk0QuR5wQiHqER7NAfeAB4LP+9Bpn27LpQlAxb8Hko1eBi2
 W9NqH0Rtl8PdZINwLHLIldjEAI9a+lmsgaMge/IwHCFMCGScG9RHNwUaMD15PQz6i6
 r8WBKNPfKSVK/Zy2NAv5gniEwqhHCpfB/sB7VYTNyHt3ihxQvlerB8XqhsBlFbfibQ
 n+Is8AhWQAzfZbs0I8k6hsjpsHrwOJDAXLOC2/aH8bIgTjj2ulauAFiq8UsKTy3O7O
 PjwrnVj2k6CvQ==
Received: from [192.168.68.112] (58-7-146-131.dyn.iinet.net.au [58.7.146.131])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 23FEF77DAB;
 Fri, 28 Feb 2025 13:54:39 +0800 (AWST)
Message-ID: <b300117fa0fc207eadccb663cdb043663ca79025.camel@codeconstruct.com.au>
Subject: Re: [PATCH] hw/net: ftgmac100: copy eth_hdr for alignment
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org, 
 clg@kaod.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, joel@jms.id.au
Cc: jasowang@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 28 Feb 2025 16:24:38 +1030
In-Reply-To: <20250227154253.1653236-1-venture@google.com>
References: <20250227154253.1653236-1-venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XwAj+HULauCv

Hi Patrick,

On Thu, 2025-02-27 at 15:42 +0000, Patrick Venture wrote:
> eth_hdr requires 2 byte alignment
>=20
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> =C2=A0hw/net/ftgmac100.c | 15 ++++++++++++---
> =C2=A01 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 1f524d7a01..a33aaa01ee 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -989,12 +989,16 @@ static void ftgmac100_high_write(void *opaque, hwad=
dr addr,
> =C2=A0static int ftgmac100_filter(FTGMAC100State *s, const uint8_t *buf, =
size_t len)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned mcast_idx;
> +=C2=A0=C2=A0=C2=A0 struct eth_header eth_hdr =3D {};
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if (s->maccr & FTGMAC100_MACCR_RX_ALL) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 switch (get_eth_packet_type(PKT_GET_ETH_HDR(buf))) {
> +=C2=A0=C2=A0=C2=A0 memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sizeof(eth=
_hdr) > len) ? len : sizeof(eth_hdr));

I don't think truncating the memcpy() in this way is what we want? The
switched value may not be meaningful for small values of len.

Perhaps return an error?

> +
> +=C2=A0=C2=A0=C2=A0 switch (get_eth_packet_type(&eth_hdr)) {
> =C2=A0=C2=A0=C2=A0=C2=A0 case ETH_PKT_BCAST:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(s->maccr & FTGMAC1=
00_MACCR_RX_BROADPKT)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return 0;
> @@ -1028,6 +1032,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc=
, const uint8_t *buf,
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 FTGMAC100State *s =3D FTGMAC100(qemu_get_nic_opa=
que(nc));
> =C2=A0=C2=A0=C2=A0=C2=A0 FTGMAC100Desc bd;
> +=C2=A0=C2=A0=C2=A0 struct eth_header eth_hdr =3D {};
> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t flags =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t addr;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t crc;
> @@ -1036,7 +1041,11 @@ static ssize_t ftgmac100_receive(NetClientState *n=
c, const uint8_t *buf,
> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t buf_len;
> =C2=A0=C2=A0=C2=A0=C2=A0 size_t size =3D len;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t first =3D FTGMAC100_RXDES0_FRS;
> -=C2=A0=C2=A0=C2=A0 uint16_t proto =3D be16_to_cpu(PKT_GET_ETH_HDR(buf)->=
h_proto);
> +=C2=A0=C2=A0=C2=A0 uint16_t proto;
> +
> +=C2=A0=C2=A0=C2=A0 memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (sizeof(eth=
_hdr) > len) ? len : sizeof(eth_hdr));

Again here.

> +=C2=A0=C2=A0=C2=A0 proto =3D be16_to_cpu(eth_hdr.h_proto);
> =C2=A0=C2=A0=C2=A0=C2=A0 int max_frame_size =3D ftgmac100_max_frame_size(=
s, proto);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ((s->maccr & (FTGMAC100_MACCR_RXDMA_EN | FTGM=
AC100_MACCR_RXMAC_EN))
> @@ -1061,7 +1070,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc=
, const uint8_t *buf,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D FTGMAC100_RXD=
ES0_FTL;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 switch (get_eth_packet_type(PKT_GET_ETH_HDR(buf))) {
> +=C2=A0=C2=A0=C2=A0 switch (get_eth_packet_type(&eth_hdr)) {
> =C2=A0=C2=A0=C2=A0=C2=A0 case ETH_PKT_BCAST:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D FTGMAC100_RXD=
ES0_BROADCAST;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;

