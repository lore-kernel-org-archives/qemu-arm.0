Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1533535wrx;
        Sun, 17 Feb 2019 10:17:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IakNMzIva8tshdA/gfRsajjy40BBMvAeS/Uadh2HvjtVEt44CrEuJVlCX3mBDDFHI9iOo4Y
X-Received: by 2002:a81:5ed5:: with SMTP id s204mr16186181ywb.17.1550427454503;
        Sun, 17 Feb 2019 10:17:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550427454; cv=none;
        d=google.com; s=arc-20160816;
        b=jgmA0NfZY4j/wa7TLaprxVq09P1uFq/6tu75YDR0JglE3mec8tNR2yG2bCeitbrisb
         J4cl+H8/Vq/wZ8LRR4GZPLxuu6hvpfyOHelV09Zb7ocEKprvWlaPuLvv+QjTjty0/VMI
         0aT72tqMyp2AsXc0nwXo3x4ZQsHU7tiR7c4dh6L63vOiSSCuBp/DneQpYd9aROdnL2dW
         x6dBNU0vnno0VoyiqrcXGvYZWB2LQ4j+rhnqlnnJ8mxKP478Dm9qzaqccHQjAd4JyWdT
         d5dpTWWGS6W5FeTsRYKJsiEsKDaCToFGiBcFH/Wv7cf67pWCmf8N3MDn3bj4Sli43zb/
         Ffbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ZJxxbVSD7hNZ95mP8dLuxzxvFx+SyUfnIH3d8KluUvc=;
        b=GqRiBX/g10GDpxPL2fAXJVQ+VCwDVFrK1CxYoWMduEIRtZ5hk0+NvXZYfVKbwXfHPP
         t8bK+r/o61EdntTFTsigHjhVfyloxygtDp/wQC8tZKp57uKtyJftKaeCw3lfN9o/F1+U
         400oTPWlXDhZwzMbI/Nj0UqSt9u0iRFYjV4m1ermMUd4hL/2cgED353P0xjLXpnVX/Ii
         A9Hccox+HdZwIMATw0stH0sw1iH1nVb97gmwwTd11oAm/IC1QgkqP3rFJ+pdgJJNOqdZ
         n/rkW+SC0IybIjUJ8pFf7BHaAYGHxLK+L20Qqw9d+KAG0xy7poTYhzEG448PutNeotCt
         Zbog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bEBSlRFo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c124si6893033ywf.270.2019.02.17.10.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:17:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bEBSlRFo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvR0Q-0005YV-0M
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR0D-0005Xs-96
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:17:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvR0C-0005TM-M6
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:17:21 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43595)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvR0C-0005Sl-D5
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:17:20 -0500
Received: by mail-pf1-x444.google.com with SMTP id q17so7352724pfh.10
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZJxxbVSD7hNZ95mP8dLuxzxvFx+SyUfnIH3d8KluUvc=;
	b=bEBSlRFoHa+NqlL6hhdU2nf497DPOSQI6ptQHLzSZtvPL66IVs/z2cKAnvbr+dXIyi
	Mf+DceXNlp5NXO9ZwGwGqWuS7n9/JFrL29unrf0KOcblQsXreuLYnoaKJj7ZztkADMQu
	HEFFJIn2kmD5EJ43z8JHDZuQxtI7kDaHicaiW+uUWi9DqfW3kjd49yV2eYjH9x/iIPtL
	CCgAPCaXHUn0fTrug0iGmFqe9pCTMhKwa9Fwovv98rb0Zv7VBmuFEGrJ5Vx+DuDABXX+
	yAWVoKmReEhPoNQX/CYIARn47NvBloRITLSmduToYttC+2zBqEgQUIeMIDMQIQl163WJ
	ng+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZJxxbVSD7hNZ95mP8dLuxzxvFx+SyUfnIH3d8KluUvc=;
	b=AF8cMIio66gIr5Z/4kTCO6aR/btsGtHl1xVde3mXuk6iyFW6QrSOKjTvUGiFQDeVfl
	8/hbEfzgZ870SaTb8Ew2qqOgiSeorq8KrNTnkzkaTezBruy71jubnPesgquOLzwIwkyh
	0/WxUF00vaKixmnNEmAesffl0rbNJnPR6qEclV6pif35VVRyP7Sn6LO5Fq2nVVWQILFY
	gR+KGdAIbFOoLZlr5aIAkmxshEgr0JThpSTaZcXT7XGflH7Z0ZjPfAhkB7bDEvPY4NJw
	yyIukcA77+GQqmPo+MmdtKv05DwJ4FR/NiXQkeqwTvPaCb8t/blh6YInRB+GDJiyjRa1
	tOCg==
X-Gm-Message-State: AHQUAubsTyqLgZ+u3SdNpEZYkcBYocTB6sledcgQha91DNLL8KDlC79Q
	yxO/WyBPjLRyNSolQ7BHnfTetA==
X-Received: by 2002:a63:ed42:: with SMTP id m2mr15207700pgk.147.1550427439491; 
	Sun, 17 Feb 2019 10:17:19 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	d88sm18397945pfe.19.2019.02.17.10.17.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:17:18 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9e3271ea-9f3f-bfa0-4170-6f75255737c0@linaro.org>
Date: Sun, 17 Feb 2019 10:17:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/14] hw/arm/musca: Add MPCs
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXbMz3s1YHFq

On 2/14/19 4:51 AM, Peter Maydell wrote:
> The Musca board puts its SRAM and flash behind TrustZone
> Memory Protection Controllers (MPCs). Each MPC sits between
> the CPU and the RAM/flash, and also has a set of memory mapped
> control registers. Wire up the MPCs, and the memory behind them.
> For the moment we implement the flash as simple ROM, which
> cannot be reprogrammed by the guest.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/musca.c | 155 ++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 147 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

