Received: by 10.223.188.70 with SMTP id a6csp1904261wrh;
        Wed, 30 Aug 2017 22:23:13 -0700 (PDT)
X-Received: by 10.80.135.242 with SMTP id 47mr509260edz.224.1504156993029;
        Wed, 30 Aug 2017 22:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504156993; cv=none;
        d=google.com; s=arc-20160816;
        b=mOtzn1Qth2C6rQwn7bfWNmGaT4ErfGSIqZm0RiNjphpSnrCNMQTJfalLzo9Bj4ekSz
         jTZeF4Kow0uww0pyXX+miNnWmfEAiHphFPRxJfaN+7VKEHeqc+MVsD8vJ9t/rZ02njUh
         xL7qXS2AK35ORjxLcZHdH7eqFFm9y8hY5Uz8BOx2XArk0BKGuNxtuJigv8IChxSqLBLC
         jUwOQtnZ0Ah4c4kuuwBNag4ByU9rjlNM8E0kXBcYG/xti01GujmCR1n2E7pioLspQG68
         uec8tQ0kaxgIHIzG14Df5ywKauX4YuINc1bkDbXyN/9O7eafp9NjYLAw/WG+zgRM2tUu
         /vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=hZRc4mtBHF/Hy9u4TDJR1yCj3zEp49FTw2CI9JKEwA4=;
        b=U3iHug7UGS3JzTVUuPX8vcJNqfe+jjj1yLTiYd5Vozbm0T5O934651cZugVQjo+lY3
         eZdopkw5NkJ2aM7f/wV7HAJz6d4psjxRW4jnNSjYlN0JfQgCWSdM+IqX4yMiTUR7ijPz
         VNJ6qy5RFwdt8FG+2n3KrLSsHNGdObsAlkgvp2ENYdbHliQKiGdfQtQhyML7iP+dhXQj
         5N2kelg0B+LBkGFxDCqShnI2seBw4OSG2gj8/HDZpJe/yh9uP2iLAM/k4vDpg0su4dEf
         CsHBaFQrhhi+aK18wLINkDch1/cPM1KTgE22W23Kb0ra0yhu2APF1A3L83TuL+Q98pbJ
         7WMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p30si6071262edd.429.2017.08.30.22.23.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 22:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnHwe-0002Q7-00
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 01:23:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnHwX-0002Q0-73
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 01:23:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dnHwS-0003gT-Vp
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 01:23:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dnHwS-0003fk-Pm; Thu, 31 Aug 2017 01:23:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCC0481DEE;
	Thu, 31 Aug 2017 05:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BCC0481DEE
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.27] (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A825C881;
	Thu, 31 Aug 2017 05:22:57 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3b185bc6-d5ea-85dc-8635-e9d21914d011@redhat.com>
Date: Thu, 31 Aug 2017 07:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170830215523.25278-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 31 Aug 2017 05:22:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 02/17] MAINTAINERS: add missing Versatile
 PB entry
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k73MK8v031pl

On 30.08.2017 23:55, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b363e1b9c9..5b7891addc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -515,6 +515,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/versatile*
> +F: hw/misc/arm_sysctl.c

I think you could also merge this into the previous patch. Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>
