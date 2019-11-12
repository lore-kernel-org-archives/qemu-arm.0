Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2365346wrr;
        Mon, 11 Nov 2019 23:52:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwof1vib5jBBCk8rxV94FwCOVmXwcCHDUTjXqkBrOzRB/J/7mf5pw48MUR3AysOTSblVhzG
X-Received: by 2002:a17:906:70e:: with SMTP id y14mr26574313ejb.70.1573545157674;
        Mon, 11 Nov 2019 23:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573545157; cv=none;
        d=google.com; s=arc-20160816;
        b=e5kNVE2Ba0W+eJKVoO1W737HCBac5u36w/o1Zs9lLacC49iWL3odWgoRL5UU9lfdkn
         BUddYaOWPR/99OjG7TJTWsVO32RxrGI2+r3WW2UstyCZ6Xyzw0RwRMKsrH3lwXbakp1M
         VKgQZrWQkUvOx4gwaa7yCJRJGMZN/65oT+GOJnwd+W95fQUcxih6lECj7zjUjbhIpEAi
         HezOlkFOOxErtLC6BckReseTLHTTmA+t9ieAupF1X+lr/qbX+LUS0sEJXgCQqu41ZxxE
         y2SkCpvic4z1u3EwSwAkqormUBbA/WcVwcE3/OXitUFRtWycVOMwBCiGuE+QvRPJKURG
         Oj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=KgrssHllgclFcZQDGq65t+oAM0plqwKHb45wD/PkeVY=;
        b=MOkEtFXi6YcrS97F6Y5uUSu4gmy83IB4iidrmKgnbEMD1ITYskld+eavPymcnkMjQJ
         Oc5T4yvISFmTlO3d6BR9O8gTCVuVNlVO33XE9c7BwCoEP73hLcWURjpLHjqHEQMbNsiH
         msbUhQDYAuImBM+/ruSdJrbLzqQ42ZVLVS6FR1hFC2aLr7EWPxP9xXo1ZnqRuoMGvuy8
         B1k76V47QKBMtHl4NZnkDlH+SBHpCAKKC9HjIYB6Rfs+gP1xtJjp6qmjLNlaFbi72HPD
         5kBMJ7u8rT0mjrg0WJXFxgpUPeJy2iI3rx+xLB3Ha0rEYXJi0yY9RPMIB6+0zBcZPDBd
         zMBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si12064497edm.269.2019.11.11.23.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 23:52:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUQya-0003QL-MO
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 02:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iUQyP-0003Ou-VD
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:52:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iUQyM-0001EU-LQ
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:52:24 -0500
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:54551)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iUQyL-00018h-6p
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 02:52:22 -0500
Received: from player762.ha.ovh.net (unknown [10.108.35.110])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id D1353712E3
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2019 08:52:18 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 4A60DBFD8BB1;
 Tue, 12 Nov 2019 07:52:13 +0000 (UTC)
Subject: Re: [PATCH 3/4] watchdog/aspeed: Improve watchdog timeout message
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20191112064058.13275-1-joel@jms.id.au>
 <20191112064058.13275-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <036a1f38-6258-fad0-bc45-0e3cfe0a93b7@kaod.org>
Date: Tue, 12 Nov 2019 08:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112064058.13275-4-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7255861952999820096
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.52.203
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wfoUBolyUOLW

On 12/11/2019 07:40, Joel Stanley wrote:
> Users benefit from knowing which watchdog timer has expired. The addres=
s
> of the watchdog's registers unambiguously indicates which has expired,
> so log that.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>


The format below should be using HWADDR_PRIx. No need to resend.=20
I will fix it.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

C.=20

> ---
>  hw/watchdog/wdt_aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 145be6f99ce2..5697ed83325a 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -219,7 +219,8 @@ static void aspeed_wdt_timer_expired(void *dev)
>          return;
>      }
> =20
> -    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
> +    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer %08lx expired.\n",
> +            s->iomem.addr);
>      watchdog_perform_action();
>      timer_del(s->timer);
>  }
>=20

