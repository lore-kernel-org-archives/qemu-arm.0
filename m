Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4185641wrm;
        Mon, 14 Oct 2019 02:14:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXwofNMnd8locWfJuEUT5BOrRuqyou79v6WYFq9Qdxi7SpKE8iSQ1t0KO/dlYQupoW9LB5
X-Received: by 2002:ac8:2ccc:: with SMTP id 12mr32180527qtx.49.1571044459334;
        Mon, 14 Oct 2019 02:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571044459; cv=none;
        d=google.com; s=arc-20160816;
        b=O3FNOd6JHvsYL6w1uTzrSTGeRQzX4J1qTeTmFWtusFqWnFZLN7HmROw5LlgUGOz21U
         JiA5cIwL/kvVL7prD+HMzExJOtVtkZ1Ha3fSAIfvalCy75FWOQekJm3nsAHYEnOjMZVl
         UTHy54dfWPxOCZnYiR2kyO4qzpf5qIUR7ireeXbbu9p33a2oRB7vi3kXv/YN0tYQAbGK
         Cefz750NmCtdS6A8r8lZsGNUDRJm3Cl/TrekFLHHIU2QVdYI0JPukmVsvJ9IgJEdQykb
         rqu3nyfxSoi5fatewP4N2FRv6XgxBwoEgs75Rp1Zyv5b3c5tbvQ2lstCdHwokpQ3Izph
         iLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=NiDpAutNA28HkXnx1Mc/aO5M7Viqdip7pPUKbBpOrm8=;
        b=HYNPEud3nhFhJjk8IDFLkd9jIZUHp41hswrEIelwxZ/vdpLM275VAe0xf9HcJgjT1s
         2aK+Ap27THw+NeFgKws2oAcA5GdcRI50YKbtlyE22FaGI1D2iKSI4SDESkmi2SA9WeNq
         a+5c6xq335Xg5E4XVPKb7n7bvKuglUT4STYYYVQq354O1bX1yU3YgZctGYqfimupwhm6
         fyggViZIfiCsdsg9gVNAiirAxBn6gSIFnSbOrWEcphb+zQvMRzG1t2IvM5VlpLbX/RtQ
         +T3gEAw63Db9Cftj06qu2CQAswA8alwe/H2ADEgOCGwcghcdJ5dk8tzyatKUCV/y9gyy
         F1PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g125si17479783qke.26.2019.10.14.02.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 02:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJwQk-0003y0-Qq
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 05:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iJwPP-0002om-1d
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 05:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iJwPN-0007s6-Mu
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 05:12:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34404)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iJwPN-0007qk-GC; Mon, 14 Oct 2019 05:12:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8495C800DF4;
 Mon, 14 Oct 2019 09:12:51 +0000 (UTC)
Received: from [10.36.116.245] (ovpn-116-245.ams2.redhat.com [10.36.116.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0353600CD;
 Mon, 14 Oct 2019 09:12:47 +0000 (UTC)
Subject: Re: [PATCH 0/2] use helper when using abstract QOM parent functions
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <daaf9908-027b-3e91-9145-2fe96bd91be0@redhat.com>
Date: Mon, 14 Oct 2019 11:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 09:12:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, hpoussin@reactos.org, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dre9REnFaWoU

Hi,

On 10/12/19 11:43 AM, Mao Zhongyi wrote:
> Philippe introduced a series of helpers to make the
> device class_init() easier to understand when a device
> class change the parent hooks, some devices in the
> source tree missed helper, so convert it.
> 
> Cc: eric.auger@redhat.com
> Cc: peter.maydell@linaro.org
> Cc: hpoussin@reactos.org
> Cc: f4bug@amsat.org
> 
> Mao Zhongyi (2):
>   arm/smmuv3: use helpers to be more easier to understand when using
>     abstract QOM parent functions.
>   isa/pc87312: use helpers to be more easier to understand when using
>     abstract QOM parent functions.
> 
>  hw/arm/smmuv3.c  | 3 +--
>  hw/isa/pc87312.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

for the series:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
