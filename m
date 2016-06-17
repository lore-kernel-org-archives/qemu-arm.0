Received: by 10.25.21.96 with SMTP id l93csp360690lfi;
        Fri, 17 Jun 2016 10:03:40 -0700 (PDT)
X-Received: by 10.140.82.49 with SMTP id g46mr3354705qgd.58.1466183020174;
        Fri, 17 Jun 2016 10:03:40 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v141si25763188qka.149.2016.06.17.10.03.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 10:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1DAB64461;
	Fri, 17 Jun 2016 17:03:38 +0000 (UTC)
Received: from [10.36.112.68] (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5HH3UQB031009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jun 2016 13:03:33 -0400
Subject: Re: [RFC 1/7] cpu: move break/watchpoints into arrays.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, mttcg@greensocs.com,
        qemu-devel@nongnu.org, fred.konrad@greensocs.com,
        a.rigo@virtualopensystems.com, serge.fdrv@gmail.com, cota@braap.org,
        bobby.prani@gmail.com
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
 <1466181227-14934-2-git-send-email-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, jan.kiszka@siemens.com, rth@twiddle.net,
        peter.maydell@linaro.org, claudio.fontana@huawei.com,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Riku Voipio <riku.voipio@iki.fi>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:ARM" <qemu-arm@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1083a5ee-1898-391d-9d08-d65a30bf8a6d@redhat.com>
Date: Fri, 17 Jun 2016 19:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466181227-14934-2-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 17 Jun 2016 17:03:39 +0000 (UTC)
X-TUID: YG7S3Ogv+a66



On 17/06/2016 18:33, Alex Bennée wrote:
> Before we can protect the lists we need a structure a little more
> amenable to RCU protection. This moves all the lists into a re-sizeable
> array. The array still only points to allocated structures because a
> number of the architectures still need to look at the results of a hit
> by examining the field.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  cpu-exec.c                 |   6 +-
>  exec.c                     | 167 ++++++++++++++++++++++++++++++---------------

Can you look into moving this to cpu-exec.c? (or cpu-exec-common.c
perhaps?)  It's TCG only, so it doesn't really belong in exec.c if we
can help it.

Paolo

>  include/qom/cpu.h          |  22 +++---
>  linux-user/main.c          |  22 +++---
>  qom/cpu.c                  |   2 -
>  target-arm/translate-a64.c |   6 +-
>  target-arm/translate.c     |   6 +-
>  target-i386/bpt_helper.c   |   6 +-
>  target-lm32/helper.c       |   6 +-
>  9 files changed, 157 insertions(+), 86 deletions(-)
