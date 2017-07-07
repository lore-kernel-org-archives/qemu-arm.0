Received: by 10.25.44.15 with SMTP id s15csp379351lfs;
        Fri, 7 Jul 2017 10:54:31 -0700 (PDT)
X-Received: by 10.200.41.238 with SMTP id 43mr66884432qtt.168.1499450071784;
        Fri, 07 Jul 2017 10:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499450071; cv=none;
        d=google.com; s=arc-20160816;
        b=jxqVxPHKY+zo5T7YYO84NWsCT/So301JDxE3QleUwbEmhraD5vAUK0uOVbxfBSA/vg
         WfYc+1cli6qrWnCSLPjC9JOl3MbEiDfLSlnBGKlrL4Gbv4mMkCyWaWjcRbu+2bzUXDUf
         IzK+HONCWSRLIGxLo8bLHZ0pE+UvSDibWRvr5kVNXNZk8n7DvMYEbghWIf1y3/8iLqvQ
         hkFBaquMPjhP318S5BhYOQIlrgfGW1acq8XsL5UmQTSLgv6E67HH0N/Jyu1bHUzoljBX
         1IYScIWFFOWvMUJO7kTXryeBaMFjn3LIbrsJa9sXWdcTkSQ72tSX7FE9JYqfiiYErkzV
         CAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=vAEuE6LqS7QOedaYiadQkQQw+uzfcVLiUe/aKUz4qi4=;
        b=0bAm65eGcpInDHFymAu1BxYv9e4dJPcknNqUP5oga+4J+HO/5auHm9tp+E1XIOCLls
         oS/wZt4T4XpkTnXR85eesxr73lK8you7eOi1XQDQUoTpLAEisPK+dkcJM1YwDWC9A2la
         gvz5om3U6zEjn7JdI2sOuhEx6zQAW0Ijtgo24zvH88RJ0U+5d9ZwlwoFZiH+qu+Si5xq
         4Z8bC2fptnKHsWWALP1zKtV4U0RL/db2O8fDrjiCVw7eBthzv6gINlt9nUx2JOgib+7T
         fvNWpNsjilHP37QVh1FQ2u91pGo+bdri9zIA7nKaf8mL2pSZ67sHFwUu8wikigGw9CiE
         EJVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=mOxrO4XJ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id c41si3735100qta.350.2017.07.07.10.54.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=mOxrO4XJ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id w12so5135607qta.2;
        Fri, 07 Jul 2017 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vAEuE6LqS7QOedaYiadQkQQw+uzfcVLiUe/aKUz4qi4=;
        b=mOxrO4XJk+p/KvOM3lJzBQcWlykDpqplCoMJlFnL4SIHqUCV5ilfPypuPnX+4jN2qP
         UPWIWDRJ3X3uXJKOi8XjTTdbWt2ZSJGQ2GxC9BlYldtmDj7MzNtlDs9ZR41ztm28kEAj
         7N/VzY6rLeM+CcLcj8SBf4UGRVM4p6oyTzJx0B3veYwFwQhgSnzF8zI+Otchw/KT68cv
         GyIsW9jaPQwGtMO9KtSF6faqCD+4WDwmtZbfa2qe5IOv0MecTpj7zEZlf3Wv+CX3hr2P
         Z+mNHruw0mlkAH2pxNH9ybhymuvqK/wBBr+mKxPFQvoYA2LsQuxXAYg0qeyHfxejEMzg
         idZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vAEuE6LqS7QOedaYiadQkQQw+uzfcVLiUe/aKUz4qi4=;
        b=nlfcHvAAdFngYpX5H2viZsC2XLqlpcg6IygOQUSywMP/B+z0QM0ibAzxruSJjc0rPr
         rR4jlTJl20MNHej06KyMau/39YMoRK+bPzgKGLRw4N3HoGZdcoRlj25DwnPh3egEORW0
         wwYVobfVJlJ1kkOUsfX8GICIgat5UkD8mgWWhT0vdbe/pGH+Cb2BShKSEsVoMHrp70X3
         KcEtvM904GOfwswIv8gKfM9pVqznKM5OB7YAoESCVH4P7K591ys1/Xu6Pj0+ENAFwWrZ
         tJpWzCTK5xwOJW6yqN8mLA2rwFJJl5Nw4jQmdeU6I8vTVte0gUyNUUK3u9OnlDZWpKVQ
         3F3Q==
X-Gm-Message-State: AKS2vOzV4FLp1zutaElh74xLZOGObmos6NlMGCSVhzyWWpepCPYeDnel
	WBiSVc8upz3S6ccKbOo=
X-Received: by 10.200.46.253 with SMTP id i58mr72116645qta.89.1499450071318;
        Fri, 07 Jul 2017 10:54:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-66-91-136-156.west.biz.rr.com. [66.91.136.156])
        by smtp.googlemail.com with ESMTPSA id n11sm3161615qtf.45.2017.07.07.10.54.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:54:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH] target/arm: ensure eret exits the run-loop
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Joakim Bech <joakim.bech@linaro.org>, "Emilio G . Cota" <cota@braap.org>
References: <20170707161822.29659-1-alex.bennee@linaro.org>
 <87inj49mr1.fsf@linaro.org>
 <CAFEAcA_YvS8OQVTPnvRtWyVuAKO2bccyNALOs1Oq7snTO1WwkA@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a391e7e5-0be9-0863-bfb7-88d9168484f3@twiddle.net>
Date: Fri, 7 Jul 2017 07:54:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YvS8OQVTPnvRtWyVuAKO2bccyNALOs1Oq7snTO1WwkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /abXI4aGnNsp

On 07/07/2017 07:36 AM, Peter Maydell wrote:
> On 7 July 2017 at 18:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Given the wording of:
>>
>> /* is_jmp field values */
>> #define DISAS_NEXT    0 /* next instruction can be analyzed */
>> #define DISAS_JUMP    1 /* only pc was modified dynamically */
>> #define DISAS_UPDATE  2 /* cpu state was modified dynamically */
>> #define DISAS_TB_JUMP 3 /* only pc was modified statically */
>>
>> I'm thinking that really these DISAS_JUMP's should be DISAS_UPDATEs and
>> we need to disable the TB chaining optimisations for this. I'll prepare
>> a more comprehensive series next week. However testing this patch for
>> known failure modes will be useful.
> 
> The problem I think is that a lot of our current code assumes
> that DISAS_UPDATE means "go back to the top loop".
> 
> In any case I think you are right that DISAS_UPDATE should not
> allow chaining to the next TB, because it implies that perhaps
> a TB flags bit got changed, so you need to look in the hash
> table again.

Changes to TB flags are not a problem; helper_lookup_tb does examine them, and 
indeed go back to the hash table.  The only thing it doesn't do is re-evaluate 
the interrupt state.

Naming all of these different exit conditions is certainly non-trivial.


r~
