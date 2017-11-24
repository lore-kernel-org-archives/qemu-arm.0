Received: by 10.223.159.82 with SMTP id f18csp1875296wrg;
        Fri, 24 Nov 2017 02:17:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYHM3qCWdmPnOUQIedbPFcXqnaySOKmnlbS79xbhizGk+N1pOr1Fmzk9h16OqKqNlfKrXWj
X-Received: by 10.37.59.213 with SMTP id i204mr17409269yba.125.1511518627445;
        Fri, 24 Nov 2017 02:17:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511518627; cv=none;
        d=google.com; s=arc-20160816;
        b=ltnFhoWWbDzFvfUH9hOA6owFCaL+yvRgOLsIJXiCv4XLO7ant5pAq2+f6Pf9ns+QFz
         i9BrGToZDdSuDi5aYq8KO3fzH5kXoT+gm5B1mmQ2xFodpuIJUVaObPv27Xixt2uVWnbJ
         nYLHENU5IQdWH6BLgr9eRA/niTQzEr2PY0m18dTZ4674hdlLvhlc/JRE+44/YNcdmXwK
         EF/Bvl0cvnT5rpVlYpRaTgUjPheS8NP8eRdBHEWd8c7LbA3of7eU5EPNip+kuH6lcVVM
         c6E1BxOC/HcLVVTetH+O8hhnCzfRc8Tp36lXahJ0DPBpgz82+795kcykaIW41a0eWM5y
         e39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=guQbBE38pDkWsYXnFghWaZVIoZb4bDFXCB+H190U0RQ=;
        b=BYDTKYwGXViFd0NIMsp3M7fMg84LsQZBaVS3d0O1DR8LjaHGzzrFE8C6HtKRzuVmcQ
         09X4hKQIHlVcsyAtLQ+xHKOs3UkPn1VrkoN8IZxfhtQ1klJkFU05CwtEn8N0dMUnPm0h
         AHuffJ/KGsdFZxsHa+ZnZUAQ9Js3uJF663TRLIgTH3szHrrdjfz0BbSV/s36Hwzty5d8
         kJMueUnTCKhr3//GWh5UPzelsajwsbQxD1tlo/cvOm+boUWmPRicMHEVB0DbLIw5+Cym
         CHjrmZKl/nQ+YxSPbsn3MPdt3Kog2GqwCIM2gRWHmSf95Xu3tBmOsgaYBJ1cCMGWaz+i
         Dq3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l196si4612380ybl.40.2017.11.24.02.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 02:17:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIB2g-0000WQ-Tw
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 05:17:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIB2a-0000Uz-7O
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 05:17:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIB2X-0001yy-Ba
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 05:17:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51400)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIB2X-0001xh-5D; Fri, 24 Nov 2017 05:16:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 203B6C0467D8;
	Fri, 24 Nov 2017 10:16:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1EDF620BD;
	Fri, 24 Nov 2017 10:16:54 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1511516626-21178-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-Fjpg+KC4eUzupLFf7fAco2GDmZG8nWNqSARnn9vypxA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <20a7f496-5f85-f3c9-646e-aab32bdfad0f@redhat.com>
Date: Fri, 24 Nov 2017 11:16:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Fjpg+KC4eUzupLFf7fAco2GDmZG8nWNqSARnn9vypxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 24 Nov 2017 10:16:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for 2.11] hw/arm/virt: Add 2.11 machine type
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPjBQAE7qVA2

Hi Peter,

On 24/11/17 11:11, Peter Maydell wrote:
> On 24 November 2017 at 09:43, Eric Auger <eric.auger@redhat.com> wrote:
>> Add virt-2.11 machine type.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
> 
> Argh, did we forget this again?

Yes we did, please apologize for that.

 I think we should just
> make a rule that we have to bump all the versioned machine
> types when the dev tree reopens...

I can take this in charge in the future.

Thanks

Eric
I wonder if there's a
> way to catch this automatically?
> 
> thanks
> -- PMM
> 
