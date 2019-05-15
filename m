Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp297710wrg;
        Wed, 15 May 2019 01:04:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzNwTX4e8JXPJcXj/SiA7mHhlEkJ811zhV99ltMVz0tAYgJL1wTMjMCirUokGwn/LY+3/j
X-Received: by 2002:a37:8e83:: with SMTP id q125mr1003884qkd.255.1557907442457;
        Wed, 15 May 2019 01:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557907442; cv=none;
        d=google.com; s=arc-20160816;
        b=uuevbAaC54m0CddA9p9FGjC0tk9wFrv0t/VssskxwQuTl0BU1HGE8edBsasyWC2jfH
         MY9H2UcCyGSh0K+lLQh4S9LKLQ5txJdp+FIS5MZUeoQ09bSo6aLclujBqe72ltTRxnWz
         AIniVUiwVFyCpEjixFWfU4JXERC785TXf7WizAiYoq74mInsA4czSdvrqSsj59v43JfX
         3XSh1McoHI6++H5bYNVckdTk83DAZicEiDaDzcu2f98Jtea721VgiHkiehszmzMzogdl
         Ak4I/8cDA6Xgc5nKte6tdyH+59zkS94gjvHVZ3LfLMK0DtFD8yV15qhTLGvJajrQ98sk
         P22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=D6hbPy0BGKgSNsajxkHhaHJCJOUct31tlL5M7JsYqgk=;
        b=CTb4LjI+NOwmjjUC7GYRgUnq8JZB45cTwbMaGIeMMY9zMGv+GaL/c2JbkCCtVMLNg4
         xqCWa4ayHwhJuX9sIs9QAzvbbF8a1yGSKLclHuxDXtZmfc4QZ+yyuhjJJGjXz5Z49pig
         TSGDuySt0a5GZzoKvn8MA2y2AeaUy9bRgQ5eOnStLq8jRusLhaXCK2hTg9l1/GYBfmLs
         /I2SPcF3BPzeGiidxSgWPrLSZjEQT7P4xR0ucQPCvxW1KImHbPKndCaTCsShMTQeGVUq
         Ho+Vgh+yJnOiTfGr6j4Ibl5l28BFPKspi80A/uU1Mq5RPPX8+3i22AfvM12A8Ru/OUC1
         eiLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <abologna@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e23si674298qtq.100.2019.05.15.01.04.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 01:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91FC3307E04E;
	Wed, 15 May 2019 08:04:01 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2FBA19C69;
	Wed, 15 May 2019 08:03:59 +0000 (UTC)
Message-ID: <a24b6d34b99835ea38b021896a57c7af8bf4747c.camel@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
From: Andrea Bolognani <abologna@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, Andrew Jones
	 <drjones@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com, 
	qemu-arm@nongnu.org, alex.bennee@linaro.org, Dave.Martin@arm.com
Date: Wed, 15 May 2019 10:03:58 +0200
In-Reply-To: <1cd94ba6-2bfa-645e-1034-dd05e8a77000@linaro.org>
References: <20190512083624.8916-1-drjones@redhat.com>
	 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
	 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
	 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
	 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
	 <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
	 <1cd94ba6-2bfa-645e-1034-dd05e8a77000@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 15 May 2019 08:04:01 +0000 (UTC)
X-TUID: Ly4APcWq0Svo

On Tue, 2019-05-14 at 13:14 -0700, Richard Henderson wrote:
> On 5/14/19 9:03 AM, Andrea Bolognani wrote:
> > On Tue, 2019-05-14 at 14:53 +0200, Andrew Jones wrote:
> > > We already have sve-max-vq, so I'm not sure we want to rename it.
> > 
> > Oh, I didn't realize that was the case. And of course it already
> > takes a number of quadwords as argument, I suppose? That's pretty
> > unfortunate :(
> > 
> > Perhaps we could consider deprecating it in favor of a user-friendly
> > variant that's actually suitable for regular humans, like the one I
> > suggest above?
> 
> Why is =4 less user-friendly than =512?
> 
> I don't actually see "total bits in vector" as more user-friendly than "number
> of quadwords" when it comes to non-powers-of-2 like =7 vs =896 or =13 vs =1664.

I would wager most people are intimately familiar with bits, bytes
and multiples due to having to work with them daily. Quadwords, not
so much.

-- 
Andrea Bolognani / Red Hat / Virtualization
