Received: by 10.25.0.23 with SMTP id 23csp2661532lfa;
        Thu, 8 Jun 2017 09:29:50 -0700 (PDT)
X-Received: by 10.55.127.199 with SMTP id a190mr47780480qkd.100.1496939390478;
        Thu, 08 Jun 2017 09:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496939390; cv=none;
        d=google.com; s=arc-20160816;
        b=u1OjL3+pg2qnxMETN6fmF+muadewg7V4dlqUBxFu/YXgTNfrHQFhmXLJPNKqgZa8jT
         Orex5zIxzkQc0R4vQYj4MYV4uMZOyrY6rTIY70nAbuDNeN0W/YJSJjTPncHV9cFuBooV
         k2Vw4KBkO6um+Ltw8+Cy7QnqnL0gTXmvlpu+ol8BGJOC4BiBMJi8Sllh5xjLcQ4AgwIJ
         cgt4lU6uOYoVoiu/LWZD+0eGaD+F4xc9AcUbxy8tx6T/5C2kperXipWK6YZOyRV1+r4e
         OyrUgXRYL4DBHZS3JRYeJr6xKMKtV58qcqNgqUG3wBDprpu2IqMm/o4fyHLG3CDaJrSu
         jo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7ZWmtjTkZijPZ+9dPQ79Z0ObsY+jWHket6m/W85rAdI=;
        b=mxC2aPWGFRNCM5mMuYymLMw/NbRMt1XfEt+neCFRyqtasbuvQKuapd5+Han2kf84N8
         5rIGdxH/Bie7P2Hjl+wi060XwGr+ynwQZdHlTsC4oF+3B9trNY8dl3IXoJo9LpiRrJn1
         rCBzTMYznqYpo73DoKFXPMolQkt2l5BmsxuSxdlYOtV4tC7W1tOYZLGs+zzRKQO4ZmFZ
         t6y6CwbTu1FeYT8filaWQH/VF+N0q0XD0VPYiaTQvDuAGEN/LiL9NL1R3ZZKJGYiQe6Y
         2gZvTLxUUEqR9U5r8G0O9CZZs4FGuRwMdZrpNgatAXIn5h20Zm6x2Y+2Q/gB7gRfGx4h
         x7GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h134si5740453qke.104.2017.06.08.09.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 09:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJ0Jf-0007CI-Lv
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 12:29:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dJ0JX-0007AV-Fi
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 12:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dJ0JW-0005V7-MQ
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 12:29:39 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dJ0JU-0005TX-Fc; Thu, 08 Jun 2017 12:29:36 -0400
Received: by mail-wm0-x241.google.com with SMTP id x3so8140487wme.0;
	Thu, 08 Jun 2017 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7ZWmtjTkZijPZ+9dPQ79Z0ObsY+jWHket6m/W85rAdI=;
	b=MwAKjmUYL8yembiVX1PANMm7nIv5Wkga8qSMp17lFe7IWd4jIDQ/dQERTiegJ2F64Z
	nCVYc/ANQweQmI10TvE4KMjdKhpXk+XfS/qkwPJDJOcUB7E5Re4hWINnj0TyWx0wkHJt
	Ot4xAdWnwuM5iwEQNPnSDROPdHn9WZ/EISpIKuTuIiY67BFrU/D+e/LiL73347Dbs4fG
	oPiq3BF3iYSKapW9+3FerhG+TuL9drPA+QsRpuKf40IBKg+gIh/g+Me4eQFImhBxr5w8
	WsQmFxkp0Xl6CCQcb10U8d/6v/Z6NIB2e4+gErEsw364FWPXB69/9EmRuho9xGKRtTPj
	wFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7ZWmtjTkZijPZ+9dPQ79Z0ObsY+jWHket6m/W85rAdI=;
	b=EcTaiwtKTGjRJClBOPp9U0lDcy+Uk2tZ1j65sM2bjt88q9zbLQILOSNeIaOTDsAfXf
	6lzoBZl9jxpRCA8MFKrBVzF/fHSPvmrTtBttyhWgtgN21Htrf/iXz0NL7KNkE0gQ8FZm
	D89NeoIXXpacc7KxYiCchxaBVyHYKBNY4jQkRNJb+MNs7bizg8/edqUQW235KjHeU8fz
	5WYrCpY+ffBwL9hayV2eFtnIcGHhVsh+vpjc1K1ijQlXwu38EMU+iKlUiJpvGFLHukTN
	Rvf9FcP7RRNuSmgl2AlcXs50JkATCNe14tcwFs6aXWc2fN2g+7U8aq1wShAnl6ZP9t9F
	xcTQ==
X-Gm-Message-State: AKS2vOw24JCqwrAwYvgbXKcOFZK10usHVTFqEX49WrL11F8asR0iyuDb
	IXoIjvF0SWtCDbj29O1iIXut1qdiFQ==
X-Received: by 10.28.15.67 with SMTP id 64mr4416020wmp.61.1496939375427; Thu,
	08 Jun 2017 09:29:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.181.82 with HTTP; Thu, 8 Jun 2017 09:29:04 -0700 (PDT)
In-Reply-To: <20170608133906.12737-2-ehabkost@redhat.com>
References: <20170608133906.12737-1-ehabkost@redhat.com>
	<20170608133906.12737-2-ehabkost@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 8 Jun 2017 09:29:04 -0700
X-Google-Sender-Auth: yPNadpYrgHf48BNJLSV03hbVVCM
Message-ID: <CAKmqyKN==edon2NC4wBNidsHChzbJ8CMvWgjvT2+LbjXOgwrOA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] xilinx: Fix error handling
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
Cc: Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9PdWqCPpEod

On Thu, Jun 8, 2017 at 6:39 AM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Assigning directly to *errp is not valid, as errp may be NULL,
> &error_fatal, or &error_abort.  Use error_propagate() instead.
>
> error_propagate() handles non-NULL *errp correctly, so the
> "if (!*errp)" check can be removed.
>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  hw/dma/xilinx_axidma.c  | 4 +---
>  hw/net/xilinx_axienet.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 6065689ad1..3987b5ff96 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -554,9 +554,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>      return;
>
>  xilinx_axidma_realize_fail:
> -    if (!*errp) {
> -        *errp = local_err;
> -    }
> +    error_propagate(errp, local_err);
>  }
>
>  static void xilinx_axidma_init(Object *obj)
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index b6701844d3..5ffa739f68 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -981,9 +981,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>      return;
>
>  xilinx_enet_realize_fail:
> -    if (!*errp) {
> -        *errp = local_err;
> -    }
> +    error_propagate(errp, local_err);
>  }
>
>  static void xilinx_enet_init(Object *obj)
> --
> 2.11.0.259.g40922b1
>
>
