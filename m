Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1948452wru;
        Thu, 16 Aug 2018 07:57:48 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz41G+KLeJ1/fqIsbM89I0tAtfaiY5RGb/dvStoJ4pKQiAwpmRPZoew6oU2//1+SYLA63M/
X-Received: by 2002:a37:9187:: with SMTP id t129-v6mr27761910qkd.112.1534431468881;
        Thu, 16 Aug 2018 07:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534431468; cv=none;
        d=google.com; s=arc-20160816;
        b=ppL0GFQBe2DQRCV3vhrE3fmyfciraS3il0Wqima+XMnWvfrlMmcjHrajhg0oYcNKDS
         C+N5jC/gUYt+xz0niOcb1UOD5YhecJmdfD+V/qqURQKuPp87K4fRhKJzrCvn85BerGKl
         6egBeMYIJRijo3gbfpTTOoDYilw176kdfF0JLlJQrxKGeNReW2bsZwMjvNsOsEynqUfc
         uUCClJl4XQODopDtJJO9zmGs+rv7AyBLuLqPC74Rguqzhrd8o4HGHUBqKfq7tz3BSJE9
         qZM8F+B/r1xdp08dxjsXq3jOQ+kKHu88xSv+WOdhAw+CQuN7zIL6IpSy/og39e00LL27
         e6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=aIYAwY+Iduba/ZeOYMjFdW8f2k/t4+4VOcmRT9xvdmM=;
        b=WFNxTao8n1P3YVZW6zk5L1ux9Ch/2c6PSNt5P9nZEE3giDdj1xRfHtUzgfNORLwNJA
         aTgStgj52W0I4PRLynGVO06Y9u9cKY4gKulKe2Filh+k3hv2wKg+6L7PXtyFx5tLCKnO
         GFYx+cThTBdUDaB1j1UUq0zqRqafy/dZ95Z0+8UjvrYwEvMHPhugIxt+1KOl8k644TzL
         kTG7ck8mUqU1ujGAujYVZ6zwIZoCVUeM2OSyGON3kfAPRkK/Af2UqOIG5h/qZWHji0gG
         GFYMbfDJrGmTw5SUydX/khA+/ZHIsx7xkSJkiNGVVMxNWHoWclD/gRYUwM+HUw+TtTnI
         zIgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BAlcYyVS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17-v6si2017814qvj.165.2018.08.16.07.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BAlcYyVS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJie-0003bk-DA
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJiH-0003av-1O
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJi5-0006z7-Ev
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:57:17 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:45807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJhy-0006wr-Ik
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:57:07 -0400
Received: by mail-oi0-x243.google.com with SMTP id q11-v6so8489439oic.12
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aIYAwY+Iduba/ZeOYMjFdW8f2k/t4+4VOcmRT9xvdmM=;
	b=BAlcYyVSprS7aa2PZGK+7BG82hjvaeFANEe+S7/YGzniWA/yV0UUKufQkT+HmuS72Y
	+pJ3ycSzdO0njM0sxgfUxflH0KiL0XFYrlwCezciNrmeTer0SU2DHhp0ShhoboQO+Txy
	P3YpRExVvrg3kZ8SQLQCvKIjeSpDuPPhmMFJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aIYAwY+Iduba/ZeOYMjFdW8f2k/t4+4VOcmRT9xvdmM=;
	b=HaH2da/5dMhTJpu9vP4KZepdsiCt+oM5DymesTrmEfpNYqua8zClh8i96aTGVDlEoF
	G0JQPRoKZvZLADlaMhtx9uiRK7WdFX+6wRLwABZUVh7uG74fqvCZLhpGEvL30MCPqiTp
	NpSQ31WYZT6TUYE9+5i0gPVbyI6En+wf3lw2CNMxtlqLKUj3tnaY5jgRN++5Fkt05tmK
	K855PE/jzNguKhg2IJ/tzT0JZp8sSoTGrfvS+8l/xrCbapfDBBfy+b2hFjWlUnASh0c8
	h+Rrlloy7Ad1CkAjNuBFxD0q+zVP9H1MRsK3RY1zq42zarV3F+WFO1chRt+jldco/OWv
	aHtg==
X-Gm-Message-State: AOUpUlGbqIVvu9K8BNL7X/ECjQyehhOBX4bOykXhikQTyuO/pknrtYOI
	YQaIRI1VT60qdvL2+kqGpn4qMJjHwaSAxFi2s9NjqA==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr30051845oif.212.1534431424553; 
	Thu, 16 Aug 2018 07:57:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:56:44
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-2-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-2-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:56:44 +0100
Message-ID: <CAFEAcA-9ZXojPExwPpzWWYka8QPByYj0D5a2eULzgHTtcDj4SQ@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH 1/7] hw/arm/nrf51_soc: nRF51 Calculate
 peripheral id from base address
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+pkQxBeooG5

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> The base address determines a peripherals id, which identifies its
> interrupt line, see NRF51 reference manual section 10 peripheral
> interface. This little gem calculates the peripheral id based
> on its base address.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/nrf51_soc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 9f9649c780..441d05e1ef 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -38,6 +38,9 @@
>  #define NRF51822_FLASH_SIZE     (256 * 1024)
>  #define NRF51822_SRAM_SIZE      (16 * 1024)
>
> +/* IRQ lines can be derived from peripheral base addresses */
> +#define BASE_TO_IRQ(base) (((base) >> 12) & 0x1F)
> +

You could also have macros for getting the base address
from the peripheral ID and the IRQ line from the
peripheral ID, but this is fine too.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
