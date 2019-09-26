Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2207629wrp;
        Thu, 26 Sep 2019 07:26:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqvPMG/pvPhqIqe+T0gqpt8UScioLhMvBtnSagjwwY4HtBhulXC6mtUow13YP41rSbDZZD
X-Received: by 2002:a6b:8bd4:: with SMTP id n203mr3737948iod.133.1569507971064;
        Thu, 26 Sep 2019 07:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569507971; cv=none;
        d=google.com; s=arc-20160816;
        b=xiHhEa6CJJzUjonmPaC4RW224KM+rxo9r5NqXRCnA/cs7fdaJQmaISstufUtWCN2qH
         ok3huhvB5fnfupKDRp74uWfzn/Du5uzZlSVRIaEHwYtNBR3NCavWEE9DYJrq18dk2wIz
         KPdvKDCD12IIpDmLunQow8EblomAYDmB41BnSaKtXJWInMRxbk7jJr1qct083JdZfmcJ
         Whjo+VVI9YEugVnLVMMxZu+Pls6J5IWvzmUxmuA/oRwNORbeX/eXGwfD/Xn0klFayt0V
         vaLzphV0Pb1DJrAm9tGeKshC3pExQDTMT6Xd/J8np7Bb72vxguigGNBHA5hgb+JLAdm3
         3kaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:cc:to:subject;
        bh=xRe0PP2JadDpEtrh5xeFQcBiSOFNYkjQhXdtuQPdgv8=;
        b=mAyUGPmjfXH6oqL9/+Sat2t+SrJRs8fJ1pm+OrOl2EllJWdcP1/r7o/cDaDYnRo3ON
         SVgxbY02CzVSfPUmk+7PA060yLH3FTojfBb4uomi/O0IzQiaeZXxzNbwDTOVRiIhvp1B
         fCFzPHu4+fYxPreFMky/l9vc3jMXsRTjgUyqsHOMl5uvTz58oNrq977kajYpiyHcIVbc
         1FOJp9EihFzyekU+p2f4t3/FoOA9Gsf6Amjq8wnn61SV808dR2eg4oHGpPD5+mgqQOZH
         c4S4IBryMtLn2MyQNzpsGwMfJrd5Q467daLJY/JmBtPR2UsIUhO5NaFhw+xmzOxYnXLi
         aLAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z3si3018361iog.74.2019.09.26.07.26.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 07:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D401305C3A4;
	Thu, 26 Sep 2019 14:26:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-127.ams2.redhat.com [10.36.116.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70BE660F88;
	Thu, 26 Sep 2019 14:26:06 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com>
 <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <19efe3ee-a532-cf66-a5a7-03a7c053737c@redhat.com>
Date: Thu, 26 Sep 2019 16:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 26 Sep 2019 14:26:10 +0000 (UTC)
X-TUID: YALO+olOzp4Q

On 26/09/2019 15.46, Christian Borntraeger wrote:
> 
> 
> On 26.09.19 14:58, Daniel P. Berrangé wrote:
>> On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
>>> On Thu, 26 Sep 2019 at 00:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>
>>>> The 32 bit hosts are already a second class citizen especially with
>>>> support for running 64 bit guests under TCG. We are also limited by
>>>> testing as actual working 32 bit machines are getting quite rare in
>>>> developers personal menageries. For TCG supporting newer types like
>>>> Int128 is a lot harder with 32 bit calling conventions compared to
>>>> their larger bit sized cousins. Fundamentally address space is the
>>>> most useful thing for the translator to have even for a 32 bit guest a
>>>> 32 bit host is quite constrained.
>>>>
>>>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>>>> ILP32 doesn't make much sense given the address space QEMU needs to
>>>> manage.
>>>
>>> For KVM we should wait until the kernel chooses to drop support,
>>> I think.
>>
>> What if the kernel is waiting for QEMU to drop support too ;-P
> 
> For what its worth on kvm/s390 we never cared about implementing
> 32 bit. 

Looking at tcg/s390/tcg-target.inc.c :

...
/* We only support generating code for 64-bit mode.  */
#if TCG_TARGET_REG_BITS != 64
#error "unsupported code generation mode"
#endif
...

... it seems to me that TCG does not support 32-bit on s390 either. I
think we can remove s390 (32-bit) from the list completely?

 Thomas
