Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2052092wrq;
        Thu, 7 Jun 2018 05:42:14 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKxODE8/rSRNaN2ibdPcBmUwR30UR76PZJD/SLQeVLuKSOIDH/bhzOK/UAJCSoFhw5aW5jV
X-Received: by 2002:a0c:bfd4:: with SMTP id u20-v6mr1474797qvj.102.1528375334318;
        Thu, 07 Jun 2018 05:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528375334; cv=none;
        d=google.com; s=arc-20160816;
        b=CmFQTAc6mpaPmOKtj0NVgfyeUd/aI/+czK2vUU/1KomPQ6SfdG7Et9Ojz/d3Lq64T9
         LTxZQB0l2MoUCGtFwfv/lgsj4UxNH2wVu+98pcxXAq1iThkt3Gg6CahI3FUi2tUZIBdC
         k/Mcsa3eGqQU7subFIIYuf2z679PETxWtLRf+vF+M1Vv8mpKXdOuLt+kPeSMj0HWnmjM
         tWr01qMye/XklYPdxGqn81Aho2Q2rrwZSywwPUkAafKNkMji33FoP0mpBeHAhigAqVPS
         SnF54onD+qcItD+nim6motVl+/8ZAiBeOSv7ry5ASbxJKwfYFTjNmJB2NUHmCNhksOac
         zi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=PH4fsopBvSaA4R6d81dLvnw2c8swOOo9MPE2h5f1XzU=;
        b=q6jaUPMrmUkyVsIvn0sbK/b6KeL5Z2TRwyblne3uhBIILN04+8o9wPk+kw+dyiC2Iz
         Q4o97zPgDoUdO6CPmkClSGkzSwA56AgNMM1zyRkja6PHyuZJ9Z5JPU/2l+bwn+G+HlP/
         rPLqjnxx/VioR18D7Up0eolNlICfiAcHxeKm3SzAaZNdytrUlcr5Cidi8ixXezt1srbm
         0SQYTV1n4Mse2oo0HP4BnOs/sFj9XTEFW5h4PzV7UfTPfHYA9U+y2hbttZAX4S8MYPNc
         i466NIkeWzoUMJjAQ5dZwZdAtkuYZ/5PFfDVjKac2dq86B4CgeV9l3QT/hM3XeSL6eLh
         u0LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hGmMoRTo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w17-v6si7610705qtk.146.2018.06.07.05.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 05:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hGmMoRTo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQuF3-0008Lo-QR
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 08:42:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuEq-0008GA-VV
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:42:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuEq-0006FI-3P
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:42:00 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQuEp-0006Ey-T6
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:42:00 -0400
Received: by mail-oi0-x243.google.com with SMTP id c6-v6so7343507oiy.0
	for <qemu-arm@nongnu.org>; Thu, 07 Jun 2018 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PH4fsopBvSaA4R6d81dLvnw2c8swOOo9MPE2h5f1XzU=;
	b=hGmMoRTo2XVRjHdPtWSFIl37N8bpRytXx/EOaU/BVF7u+WV2Wkf1WvE9/8llNNgSyM
	FK12IVV5i8HVIQ0zPuUVebiZdRfJNbXNC0XVrDUjmbh3pG/SWS5b4YLzNg7m3ZmyVXSZ
	pWIa4voohjkHu3Kdh3vMrLJgCFx6SQEupjeKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PH4fsopBvSaA4R6d81dLvnw2c8swOOo9MPE2h5f1XzU=;
	b=D5t2KHVBSw+VacsRiTFhm+eMusJNT1QD8qM5dNLLorptUmv6KaSnV8iA9UZ0ZA0hpO
	ogWOlOvnIndWUEpSr98rMQI2fYAGevI7cddwNZZkJlooTwBB3e7dcKfmULu+swSmSenn
	qtz1m5MpCQrMW4M93wVnR7N+o9hSPdZ6FeoOfO5Ng+zNehkBh2LslEmuUorPtYIE7dYm
	Ev5kEFhU+j2OnWg25cxgBh7nL4qF61+fZYQhzWpOYTZGNa8LZwEXP7uMJtnz8bIRotLo
	75/pUPb0swc3MUJf8eSG6XFhuHzJg14pt7WiZ5Qq2FuJe/QV4nK0K/if5J7Kd80aiOWo
	Lzeg==
X-Gm-Message-State: APt69E2/LgS4PM9GVR5iHocLVx3muO7okiPGlqLN9CHdvVAFYT/wYgNO
	zfeJcTmmlU0FAxCmB9Y9N8LCkhPmRKLWTbrqd6m54A==
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr723311oif.337.1528375319043; 
	Thu, 07 Jun 2018 05:41:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 05:41:38 -0700 (PDT)
In-Reply-To: <20180530061711.23673-3-clg@kaod.org>
References: <20180530061711.23673-1-clg@kaod.org>
	<20180530061711.23673-3-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 13:41:38 +0100
Message-ID: <CAFEAcA-=ViCUNBj3H6q0h-=k5ROG=RKy50TRFVd_9aNPiu7Fdw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/4] ftgmac100: add IEEE
 802.1Q VLAN support
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TyPD03ukVzI+

On 30 May 2018 at 07:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
> has a control to remove VLAN tags from received packets.
>
> The VLAN control bits and VLAN tag information are contained in the
> second word of the transmit and receive descriptors. The Insert VLAN
> bit and the VLAN Tag available bit are only valid in the first segment
> of the packet.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> +        /* Check for VLAN */
> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
> +            bd.des1 & FTGMAC100_TXDES1_INS_VLANTAG &&
> +            be16_to_cpu(PKT_GET_ETH_HDR(ptr)->h_proto) !=3D ETH_P_VLAN) =
{

This is kind of bogus because there's no guarantee that h_proto here
is sufficiently aligned to do a halfword load. However this is
a problem common to all the PKT_GET_* macros so we should probably
attack it separately to this series.

Getting the ethernet h_proto field seems common enough that
something like

static inline uint16_t eth_get_proto(uint8_t *pkt)
{
    return lduw_be_p(&PKT_GET_ETH_HDR(pkt)->h_proto);
}

would be handy in eth.h.


Anyway, I've applied this series to target-arm.next.

thanks
-- PMM
