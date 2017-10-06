Received: by 10.223.197.9 with SMTP id q9csp1670391wrf;
        Fri, 6 Oct 2017 06:48:59 -0700 (PDT)
X-Received: by 10.200.46.233 with SMTP id i38mr3150245qta.330.1507297739506;
        Fri, 06 Oct 2017 06:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507297739; cv=none;
        d=google.com; s=arc-20160816;
        b=pf+2cdvHh+VFw88IVoUmGeNmUW6tu40DRg80U8PKD6BV6ppNu1qz17BFPqfGgNN5ij
         LA1qz0gm185LnJUrrjfJZlZTvoeDle6Rkdda7bJwDdETBPwmeuV1ZeiidDmVdnJdjlie
         I1KJWn2/n0GJYPQOsDYO10DZqzIeDEKh/hReKnitbPFmXi3FaX/t/xX2oWXj9GnUzvzX
         v+tfiI0q/Ty3qE6+y3pHvTD+0YPnu3snEQvBZfkiPkh62lf2ofCvV+XHz9ZNnlAJzGgW
         Vge987h9A91ecCwNrYF0nNPPSAd0URFIPVkJC5I4BUpakdj5r93Mldw/bJ7qmeTxbZjd
         t6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/J5dvBnbGmaPgqEEm2Sxw7gFB9zuNMpeC0gVBt9Bw1w=;
        b=nhU+HZSKxklvhfLVKFWlzlns/Il+K6NI+3E2L+oq8IxfOpjlLd1seorgUjxw2Fwuc8
         FgAfNuN6SxBl6pwXtjfMAsRRdY8kgF2wdRQb67LW9wYvNTmWvQVaCI9vTLF3czIkYGYp
         el0WH5FPiGGFMMRjAU4iwAe3aEJ0gIVmwJeVgaDtJfnqrAFMCwPexXkosNdfVLp1K78Y
         jyq/SEMbwtbJyTStQVYcYNynmw4RCq0Uh6pfzUA61xs5M2KdWll3Y6kiWc6DDloXjInl
         zlrpUqpM/0uPJdAXU84Q5cDSAjj9xsd7XR73lCcHUGBhBkn3UH2ZfNdb5A/3DRpq1tH8
         UT8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d+eJLjhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e123si718285qka.489.2017.10.06.06.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d+eJLjhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Szq-00012Z-Tn
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:48:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0SzY-0000xl-Ri
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:48:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0SzU-00058j-L4
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:48:40 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:45755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0SzU-00057o-Fr
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:48:36 -0400
Received: by mail-wr0-x22f.google.com with SMTP id k7so2082044wre.2
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/J5dvBnbGmaPgqEEm2Sxw7gFB9zuNMpeC0gVBt9Bw1w=;
	b=d+eJLjhJEnLknOSoJKEyLfPiarETB7GjFzMvakKMuFhH31ztOjdsMxCHroHv8x8c3O
	yFCfv4ZT58L9aUDChQuA9AaPVTb9rQlC/9/qm4Psz5EbU8F3OIahlLzZIHAxbXYuGLuZ
	ObNMCS+7nS6IxVFbGvT5BAgh2RSZ3AA69WwII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/J5dvBnbGmaPgqEEm2Sxw7gFB9zuNMpeC0gVBt9Bw1w=;
	b=tsHUmW+6ACp1kVH1p61x2OUzgxd5oKMhkQEdX8C75BT5/xVqyRgdCLvkE6kTNLQtaA
	UOmvcEEWWFeVr9BpLoPbSiUGEsjhheUU4hv38lmOWBcqkXpmpmQhgoAgQ/IaPMgTSVC5
	FZlLU63CazvTxRYp6REBr9ufKouWAKUHRvWp2rslS5eKzuPfwI32yP/ps1ZywnQ20gzo
	CIHOegjacf9aM9CbL6jFSPB3rgTgDaN7YnUEytBQqTVh1fogFV90RIDTVcjf366EUXAc
	58pEVdAO+rgkkx66YEE3TgIFNuUwrQfgMm06QkUp3HT8q07qKUj6MFUic56ftc4EY0so
	vBoQ==
X-Gm-Message-State: AMCzsaU9o3dcVm4duKJN57gzY1GCHUzXPueksNOwLSkE9T9l7DnvCdjf
	1WMvCG9if1haD2POk6Z+ZOrgrh3UPDDcMtzC+Os1ig==
X-Google-Smtp-Source: AOwi7QDfmkopBb9mcNsfyZlJW9rWy0jZzTDfwZdy9mwrhnh2PMBoyXuMEDJUGRAtcxDVkjTu5vjkUVoOYtBeyWZMXao=
X-Received: by 10.223.147.166 with SMTP id 35mr2361495wrp.90.1507297715384;
	Fri, 06 Oct 2017 06:48:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 06:48:14 -0700 (PDT)
In-Reply-To: <20170918195100.17593-3-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-3-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 14:48:14 +0100
Message-ID: <CAFEAcA9M9ZpcAHB4eZ2zh9jA6YSWpLoEPiAznnL2-SSdJoW+Mw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH 02/17] imx_fec: Do not calculate FEC
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
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMFn2QHM12pA

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Save some computation time and avoid calculating CRC's frame
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 88b4b049d7..75822344fc 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1032,9 +1032,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>      IMXENETBufDesc bd;
>      uint32_t flags = 0;
>      uint32_t addr;
> -    uint32_t crc;
>      uint32_t buf_addr;
> -    uint8_t *crc_ptr;
>      unsigned int buf_len;
>      size_t size = len;
>
> @@ -1048,8 +1046,6 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>
>      /* 4 bytes for the CRC.  */
>      size += 4;
> -    crc = cpu_to_be32(crc32(~0, buf, size));
> -    crc_ptr = (uint8_t *) &crc;
>
>      /* Huge frames are truncted.  */
>      if (size > ENET_MAX_FRAME_SIZE) {
> @@ -1090,9 +1086,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>          dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
>          buf += buf_len;
>          if (size < 4) {
> +            const uint8_t zeros[4] = { 0 };
> +
>              dma_memory_write(&address_space_memory, buf_addr + buf_len,
> -                             crc_ptr, 4 - size);
> -            crc_ptr += 4 - size;
> +                             zeros, 4 - size);
>          }
>          bd.flags &= ~ENET_BD_E;
>          if (size == 0) {

This looks a bit odd. Doesn't the hardware calculate the CRC here?

thanks
-- PMM
