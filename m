Received: by 10.223.172.38 with SMTP id v35csp3157640wrc;
        Mon, 25 Sep 2017 21:08:52 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCx6FsKJD7i5bP++Vu+S6IW1HBNwSz/3R3oI9rWnKGBO733pnSKtDSV7NgJSDl1EjiOCBeD
X-Received: by 10.237.33.162 with SMTP id l31mr15237748qtc.255.1506398932214;
        Mon, 25 Sep 2017 21:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506398932; cv=none;
        d=google.com; s=arc-20160816;
        b=iF29aKcCfBpWALqnhtahLdEBoAUlBts7GLDP+VP2jDlaU1ikWzwHMRcGOHurgXV6mr
         LTYV4P8y6f7UCmaCMSPvxqKpVJ4a8D18Qus2wiE8xtRvM/+Ew7PnRFx4MZ7lqoz8IWt+
         LOVPgwwyS2cWh2zBo5xaDwI3yKV/DkzIFTaJNzbjoBby/errP2XQTg9rt2FAw+/TwW80
         HHSZtwBlBfAv5bG7ay9riZ/x9s0r5Hcs7jReR/jmXfFinqp9igx8mFd29W2mZSzhfo7M
         16EnlLTIecNdJgYm1/IUUWy6j9iNR+qDgIugV7bBpIosyXHHVpChrOsoGlOvT6JaRN2i
         YFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=nnvizzr/UBP1/9cPi5w3jVOzrhOu8KJbbD3O3ETlnRQ=;
        b=KAoGPI7VKOV8dRQHtaP3Ec9VqMigesMvvu4rkPK9zDjstQiHcYv1lqAHAkYwqhN/34
         4Wnx63/vYFRfAX34+ST+0tqJCA8BKCnNLndlqQHvPWAdnlDpVdp3zkBSeO/WTcjy83H8
         TwwTeoWGAs1459pUys6nl+ldXkJUvbQE2xapxPQbSWxjT3rQsNmWSdNC3V2VFkr1TPF5
         Yf9NSH7Y6onjUE6biFML7ZzRM9s4bgdT5Xev/In4hF1ab62zCigUn1itqwP0y/Wfhhcn
         uwman4g0ohUe5q5slO39ezwcZLvFDA/2zFSz5Pt4Gn0V2boBZpUFx0AOqISzwMKUE0AM
         +nUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si2484038qkg.64.2017.09.25.21.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Sep 2017 21:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwhAv-0007H3-Un
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 00:08:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwhAo-0007Go-KF
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 00:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwhAl-0002kU-Fo
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 00:08:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwhAl-0002k5-6n; Tue, 26 Sep 2017 00:08:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9297781E06;
	Tue, 26 Sep 2017 04:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9297781E06
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.28] (ovpn-116-28.ams2.redhat.com [10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E9F469FC3;
	Tue, 26 Sep 2017 04:08:19 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<5ad72536402da2879d49b58753cc709a8ff22de9.1506384415.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <adae1793-1a4a-7107-7676-f6dbaa26a9f4@redhat.com>
Date: Tue, 26 Sep 2017 06:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5ad72536402da2879d49b58753cc709a8ff22de9.1506384415.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 26 Sep 2017 04:08:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 8/8] target: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, armbru@redhat.com, alistair23@gmail.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8SVK3BP9ij/i

On 26.09.2017 02:09, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
[...]
> @@ -9281,18 +9281,19 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>          case POWERPC_FLAG_PMM:
>              break;
>          default:
> -            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
> -                    "Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM\n");
> +            error_report("PowerPC MSR definition inconsistency");
> +            error_printf("Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM");
>              exit(1);
>          }
>      } else if (env->flags & (POWERPC_FLAG_PX | POWERPC_FLAG_PMM)) {
> -        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
> -                "Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM\n");
> +        error_report("PowerPC MSR definition inconsistency");
> +        error_printf("Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM");
>          exit(1);
>      }
>      if ((env->flags & (POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_BUS_CLK)) == 0) {
> -        fprintf(stderr, "PowerPC flags inconsistency\n"
> -                "Should define the time-base and decrementer clock source\n");
> +        error_report("PowerPC MSR definition inconsistency");
> +        error_printf("Should define the time-base and decrementer clock"
> +                     " source");
>          exit(1);
>      }

Replacing fprintf with error_report+error_printf is kind of very ugly.
While error_report adds newline to the output, error_printf does not (as
far as I can see) ... did you check how such a message looks like when
it is generated during runtime?
Also, the strings belong together, so printing them with two function
calls sound wrong to me... maybe they should be joined without newline
in the middle instead?

 Thomas
