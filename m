Received: by 10.103.86.15 with SMTP id k15csp281122vsb;
        Wed, 14 Dec 2016 10:08:07 -0800 (PST)
X-Received: by 10.237.59.186 with SMTP id r55mr87126170qte.22.1481738887641;
        Wed, 14 Dec 2016 10:08:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v127si30471309qkh.28.2016.12.14.10.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 10:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHDyG-0005Bm-NV
	for alex.bennee@linaro.org; Wed, 14 Dec 2016 13:08:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHDwg-0004YX-GD
	for qemu-devel@nongnu.org; Wed, 14 Dec 2016 13:06:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHDwd-00010C-BX
	for qemu-devel@nongnu.org; Wed, 14 Dec 2016 13:06:26 -0500
Received: from mail-vk0-f47.google.com ([209.85.213.47]:32827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHDwd-000102-7T
	for qemu-devel@nongnu.org; Wed, 14 Dec 2016 13:06:23 -0500
Received: by mail-vk0-f47.google.com with SMTP id 137so40185325vkl.0
	for <qemu-devel@nongnu.org>; Wed, 14 Dec 2016 10:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OAJDl52+IgVEcp6sbwvnvYKDZWFGpcKg8M2ztzHFnPU=;
	b=NtcspHlb/5cVUUXu5jNMH3oRuKR7OVO/xpRR64Ygd5dRmvyKyF+ai9NcmMFvr7lcCU
	R5ZKQ7kZn6qsmcr+vQir1tF22PNoGzVcx/8B3PH2CA/DcXXJeaWEpQCqISLQPdmsyXt6
	8Hyn47HqcqGm2aIO9wR74DTOTDFr4Z1oCOERw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OAJDl52+IgVEcp6sbwvnvYKDZWFGpcKg8M2ztzHFnPU=;
	b=UmG8/aCUHVnA4tfjKhPpf61CmzClvhJV66CCUAr6r//CpKYD2AXoLGJUVaQ3led88Z
	kFL4sxrRG9SnWQFASJRgiwPx6e3U0IrTE/2vzVEaFmhoalCbEtiACqO36Uszfs2WxClc
	2sVWgLot2oj14/Hs0TUqSC1WflQZ0yrw5Dn4c0i1LDYTqyyWwIkZAh8xqGrg5B/d+S45
	t7tKpEvp5ESr/UNnIsbYYsvThXsPp+In5HFCmsBEBHTrntBoMaVc6LYCqPhEvVIjQBD0
	4WA8DOg9ptymPbwcvRFIpPIKP6ag6MU74tzFpcDGNP6UuF5qZ4AqlMEfPWRbXfNr18ii
	H32Q==
X-Gm-Message-State: AKaTC01Ru4HFZoAi8tMtiE1Rmo0VpPUaLZqo5CSMQZe3B9y/viwCUqpNtZNwNxu8iLNUDM2I9H3b4Ef85B6vV5z+
X-Received: by 10.176.88.65 with SMTP id p1mr11732361uac.175.1481738722683;
	Wed, 14 Dec 2016 10:05:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 14 Dec 2016 10:05:02 -0800 (PST)
In-Reply-To: <20161202054617.6749-3-alastair@au1.ibm.com>
References: <20161202054617.6749-1-alastair@au1.ibm.com>
	<20161202054617.6749-3-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2016 18:05:02 +0000
Message-ID: <CAFEAcA-X-V6gX89xOvTW_=hOC51-=fZXieaGSPEPEYT6JS0Swg@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.47
Subject: Re: [Qemu-devel] [PATCH v3 2/7] hw/arm: remove trailing whitespace
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oh1Q4lmiN+yS

On 2 December 2016 at 05:46, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Remove trailing whitespace in hw/arm/pxa2xx.c
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/pxa2xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 21ea1d6..8aa0f8a 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -2070,7 +2070,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
>      }
>      if (!revision)
>          revision = "pxa270";
> -
> +
>      s->cpu = cpu_arm_init(revision);
>      if (s->cpu == NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
> --

Applied this patch to target-arm.next for 2.9.

thanks
-- PMM
