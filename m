Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3080659wrg;
        Fri, 24 May 2019 07:11:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDu/zrSIyGS+4j38Y+++SUmg1Lz5JEystiWY/pDrYRNzFNjKjGRgjRxZjgcIDzU8r+U+1b
X-Received: by 2002:a67:8e04:: with SMTP id q4mr16995925vsd.161.1558707111092;
        Fri, 24 May 2019 07:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558707111; cv=none;
        d=google.com; s=arc-20160816;
        b=dF4M1VyfTqMz/MTZKCI8l3O4sQbtNjsBi0BL9IJ26TAiz0QwT5+YNYruxYEzPaVFJZ
         ItmZLxpG6mBuN5+9sKmUp4c3KeEoBJ2xfyJq1GroWYzz13ig5s7piE0K/CFwfgFDEoDh
         yLOBClv7Sbt8cOAHq3jmmB2jw+VkvrEoBlah2TbAHWNSANujo3vTzHJ/Lqua3iaYZRJo
         nBbc7F2zfHCcd+ExELQ3cuGwJ/XxiNwYxkCyuQyEAekDBOJeKxUQ/cTEqof+sc0ojG4F
         2ID05YB8+QNyDS6kIof/MjRdS/OfrFCBy2wDWZbXa8iL4FiWzeVTtzo/ul8DaGfZfL2u
         +sdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=3YcojsWuq8JB5Y0frFBBdnWCQ7SllCJjk7WGcO4evZ4=;
        b=qb5S/7xrFlXubiGtPfQcUyCJLfMGRuVLNDFWVskn1/8cH5G4js8+YpXJJ3kF5dpKhn
         YP1Uvm2E/vrx1svEZtih3rRZ0v7+N/flaDUcN5gr8Xcu3T+0WSooGfG1AvN4D0vIRV6v
         zVjbF9izAcoXU63R5kbBQUUDyl/ANzUCpYVPzMCjhpjW8HzPA/fu3EfjKzlM4H+60w9e
         9CKN1KrebQHMsEmw8J5WTUP9v6P40cc5GvURiYW3Cz/5y7S+DVXg/lPufPKqyfaBmPsH
         sECrD0xlnF+LhggWPQngT4Ghs16Et2fMaNFLXwrgpdU1OHHHIGzDX1whkmQtLekVZxXd
         hLRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d200si603325vsc.52.2019.05.24.07.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 07:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUAvG-0000yT-4d
	for alex.bennee@linaro.org; Fri, 24 May 2019 10:11:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hUAoY-0003KZ-8w
	for qemu-arm@nongnu.org; Fri, 24 May 2019 10:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hUAjd-0007G1-DC
	for qemu-arm@nongnu.org; Fri, 24 May 2019 09:59:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26279)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hUAjd-0006re-6t; Fri, 24 May 2019 09:59:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF90430820E6;
	Fri, 24 May 2019 13:59:21 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CE9910027C6;
	Fri, 24 May 2019 13:59:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190524124829.2589-1-peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <79be2f7d-d9b6-4742-e116-078ce937a051@redhat.com>
Date: Fri, 24 May 2019 15:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190524124829.2589-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 24 May 2019 13:59:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/smmuv3: Fix decoding of ID register
 range
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v0qiOvpmHBdT

Hi Peter,
On 5/24/19 2:48 PM, Peter Maydell wrote:
> The SMMUv3 ID registers cover an area 0x30 bytes in size
> (12 registers, 4 bytes each). We were incorrectly decoding
> only the first 0x20 bytes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thank you for the fix.

Eric

> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index fd8ec7860ee..e96d5beb9a8 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1232,7 +1232,7 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>                                uint64_t *data, MemTxAttrs attrs)
>  {
>      switch (offset) {
> -    case A_IDREGS ... A_IDREGS + 0x1f:
> +    case A_IDREGS ... A_IDREGS + 0x2f:
>          *data = smmuv3_idreg(offset - A_IDREGS);
>          return MEMTX_OK;
>      case A_IDR0 ... A_IDR5:
> 
