Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2349604wrq;
        Thu, 7 Jun 2018 10:11:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIfxFdYhNXtlKz4Bo1VN5q594BZF5jvNQ9vvMz0eeZNPjCXjtqupkkwh0EMFQ+AOT7P9VHi
X-Received: by 2002:ac8:1188:: with SMTP id d8-v6mr2627552qtj.352.1528391500465;
        Thu, 07 Jun 2018 10:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528391500; cv=none;
        d=google.com; s=arc-20160816;
        b=JSB9iJ40z3WCsM9+RFVJ3aCEXPtsTN6qKEVbZJO0yMswbWlAZR4b5RXoz04wVTaQ5D
         2OOaTI3SNZnWoQQ9EPDRH48qL60BQpAkXwVAjv+ucuepW6ZpEHx/rFYolyzuqAcjGs4e
         6aEuE+wMQWAJ2tKqMGoWGZkriEHcaX1E7GqBEg8eF0QbU3hUAZmSSPdbF23SqmObPNRw
         EOsOYPpHtZAuQ/LwDEqovQbYESYazlRallhKKfl9bI83/GTF3HPHipOnKCheYZ+6QjUU
         gMnzewc0XK7mR3ufF/hko0aPyYkbtU2ygIR47Gj5Bt+C4Ot+2Gj3lm7pSl51L8QX+nKE
         OCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Vdl1PuWzgvTzoA1VM9QyvpBz31SbsOWWueAiYKXzCd4=;
        b=fBIJon9I7JQ9uvKjL+h3Ved3jsAfxWC6g/1g9dIcuW4XJcFd9YYN8eTli6OPTCkWeH
         FeytVvOOG/7wt2V2JqbEWb2mJmZkhDAkytNjA22piKrzmT1ybQdlReLnJIUPjsgdshh1
         EO1+aVgtx5HB1hFHIpSJF2D/uaIWyUYvThjTfX7uMbLaQpPfaJstcSofKoMH795t/kwY
         gvgpC9pvw07ZBo3/JfxEzAmmF3aSSrCzeGzV8RczW7Eebjymq5bhYPE0K7DOJNmwhlvy
         B8oofLgBri8AjvBUIrFy49lM4MdlMTluHsQKeisH1hUXK0r6ytrdoTeHoS40v1Z5qhht
         tl+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5-v6si14012656qtj.136.2018.06.07.10.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 10:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQyRo-0005c9-0R
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 13:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fQyMo-0000sq-BH
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 13:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fQyMk-00020J-W7
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 13:06:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47822 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fQyMk-0001zb-Q2; Thu, 07 Jun 2018 13:06:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A7C34187E53;
	Thu,  7 Jun 2018 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0DE6F9E5;
	Thu,  7 Jun 2018 17:06:24 +0000 (UTC)
To: Jia He <hejianet@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1528378684-14487-1-git-send-email-hejianet@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a1e699ce-c6c3-c21f-41eb-5664f52c2b86@redhat.com>
Date: Thu, 7 Jun 2018 19:06:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1528378684-14487-1-git-send-email-hejianet@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 07 Jun 2018 17:06:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 07 Jun 2018 17:06:25 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/smmuv3: fix smmu
 emulation when guest smmu is in passthrough mode
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
Cc: jia.he@hxt-semitech.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TOwcbaVgT7Bt

Hi Jia,

On 06/07/2018 03:38 PM, Jia He wrote:
> There is an exception when I passes iommu.passthrough=1 to guest's
> kernel boot parameter(host QDF2400 kernel 4.17, guest kernel 4.14).
> The guest will be hang when booting up.
> 
> When guest smmu is in passthrough mode, entry.perm will not be assigned
> to flag in smmuv3_translate. It seems not be correct.
> 
> After this patch, I have tested in 4 cases and all passed.
> host smmu on/passthrough + guest smmu on/passthrough
> 
> Signed-off-by: jia.he@hxt-semitech.com
> ---
>  hw/arm/smmuv3.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 42dc521..5c46102 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -560,6 +560,12 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      }
>  
>      ret = smmuv3_decode_config(mr, &cfg, &event);
> +
> +    if (cfg.bypassed) {
> +        ret = 0;
> +        goto out;
> +    }
Thank you for spotting this bug. Yes you're correct: on bypass we
effectively need to set the IOMMUTLBEntry perm flags.

Reading the code again I think the error handling logic is really
confusing and if you don't mind, I suggest I submit a global fix. On
bypass we should rather have a bypass trace event issued instead of the
translated one. To me the aborted case is not properly handled either as
we are going to record an event whereas we shouldn't. In case of
abort/bypass translation structure decoding should rather return 0 I
think instead of returning errors. Please let me know if it suits you.

Thanks

Eric
> +
>      if (ret) {
>          goto out;
>      }
> 
