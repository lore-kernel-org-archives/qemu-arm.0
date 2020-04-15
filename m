Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp264324lfm;
        Wed, 15 Apr 2020 00:50:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypKpAIOHrq3JjvInWfu8Aldch4j8mGNnhzlI21ow4ko4TVUuVlYLuLI6SFDP36Yc+/po0XcG
X-Received: by 2002:a37:809:: with SMTP id 9mr9685889qki.93.1586937025526;
        Wed, 15 Apr 2020 00:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586937025; cv=none;
        d=google.com; s=arc-20160816;
        b=F/opUv8807B9JmbhqzGtgkVbPnLZiwRt4VtW4f2lwzOGXu839uWrFZzkLmzuOLCeon
         YZYWrwUepNxOTCHjERz3VOTwqmVwAJ9DMiADRM2ykQXKHcH5+Txx6MGFI6udPD2tRNKh
         uD/yR0kRiVsF1eSE9ydcdHfLqB0ptOy/hvkEu/yycIjdfPDq58ed1jXm+EV9QlEI+Aum
         3W0VjfeesYgXUfR5mz9NZE4xMBBInVYafnxBXGh/s3XkYbnNCH+GBaXBBpGstdB9Th+4
         jnSKtij8XnezWOpW0li0fI3QhYgrXWcJO3a/IQ0sS/TKgFhHi1iF8X7uP5qXXvN+kLAf
         Lm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=mmJHXHdD4QU7Gdo7nDTOIAjIq5b7q8VQHzwvcapnh/M=;
        b=BawPl17FDhWWerh1wUe8+vmifLAZNnTVe4QYXynn4Xznba+7L+3qdYS2UnHr84sryn
         wi2LPhjNxGwGbvBxuJ0tAKQcTEkeONARBukMcS7kjcNXBx2ZlV7sbWwSlnkgv/aQxjDp
         weYkgIiBGBXsWe8UtZRLmdwB4cvYjUMAZBMW3W4IHPdkeeBCgsAjEyyEB+fDiaI9Eugd
         TYwYxNkFK0t4lWYckaMNK/x924GllKEGKda9Nur8BRtZh8NqC9gILm+UvvkLlTZThIvV
         bApuBPMVRwWlVevdb3H8IjH7SNHE17F7TXbwDHYTUKUqoLdXFoVJ46sV/DuqOgwFmszX
         dAig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si8804376qkk.44.2020.04.15.00.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 00:50:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOcoS-00076s-Kf
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 03:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jOcn6-00053d-O6
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jOcn5-0007C2-Pu
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:00 -0400
Received: from 12.mo6.mail-out.ovh.net ([178.32.125.228]:52686)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jOcn5-0007BB-Gs
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:48:59 -0400
Received: from player794.ha.ovh.net (unknown [10.108.35.215])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1AFAE20B308
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 09:48:57 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id C91BCE662EB5;
 Wed, 15 Apr 2020 07:48:00 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 1/3] target: Remove unnecessary CPU() cast
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1a7f2324-4264-e23f-b218-beeb50051cce@kaod.org>
Date: Wed, 15 Apr 2020 09:48:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200412210954.32313-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 13576101080511187955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrfedvgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.125.228
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lXe7eD2hRrmg

On 4/12/20 11:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The CPU() macro is defined as:
>=20
>   #define CPU(obj) ((CPUState *)(obj))
>=20
> Remove an unnecessary CPU() cast.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef CPUState;
>   CPUState *s;
>   @@
>   -   CPU(s)
>   +   s
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  target/ppc/mmu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 86c667b094..8972714775 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState =
*env, target_ulong BATu,
>      if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
>          /* Flushing 1024 4K pages is slower than a complete flush */
>          LOG_BATS("Flush all BATs\n");
> -        tlb_flush(CPU(cs));
> +        tlb_flush(cs);
>          LOG_BATS("Flush done\n");
>          return;
>      }
>=20

