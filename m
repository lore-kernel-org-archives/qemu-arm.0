Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5827310wre;
        Thu, 31 May 2018 04:50:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKthrTGPi6LDgcFt/d5t0uRb51IB5jOTRmOVgsBuCGnU5yXih1ufeyAZk3FuAIEoq2R1r+7
X-Received: by 2002:ae9:f402:: with SMTP id y2-v6mr5205407qkl.75.1527767406538;
        Thu, 31 May 2018 04:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527767406; cv=none;
        d=google.com; s=arc-20160816;
        b=F6SFJh0ie5CCIGbNGCRJY4GzPy7ILrhAUxwQwOVcOUkaYpjSfA9X0bJ9EVEf9X5Qx5
         20uq0g8Hzv/qGmd7WJEChqFQ9NzU1mlTS1Pz9FK5wyim+XxQ1no5LOgGfbBlCsI5V73X
         jc6EYUBlWaC4g0cKvHgY5UclpsMBCw4q8zQBSs6XPTBf8iTGcxkLGJ5nj4Puo3MSyDnX
         V8P5NrriJuF+IxpGBUe6cdCojr3XjHPbNjCchSXC4HcoDD/aL0O7JKrXFRzKgjnJ0fJE
         3e7JdP5nA4QjJTkGAtyNywZOeHJAi+ig/cOjrN+1CvkjDwB89gnVognoxiDzGpeOzUU9
         2euQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:arc-authentication-results;
        bh=WoOAHhTPleG1EXBDC29AJQsWYjV0KoOrDeODlakKnhc=;
        b=EkibHIVZWCk/lkYUKTwGG05T2HATqpPaWYBf/ctHx0v8j6bGR1XmKBSE9yHgwK8UuE
         IdwiTa7yIy2Qghae/wqdbgAcUVTlgKoFBHfUfxXGRMzFsWrq1Yj3kC/jy5W4RBsEi/0f
         5Nsimj5cfIn3c1rEDXMem4jnjosnJHObVgTupLIoO7TK6JsySCEGaSEFBuGX+waxxGCd
         zd8V2GzyP+c2YdY6X2w0MNCt6rH0bF4kCqyziJaua20L+E8KgCVoFNNjzjETrnpoLnNo
         81mM14Y8p3/yvSh+RwjTq4eVtnWR9TTkgnd23xB1tlbSvpVE2+DEQnPDQp2EYGBWjh0J
         D7Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id o71-v6si5953133qka.401.2018.05.31.04.50.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 May 2018 04:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEE6A859B5;
	Thu, 31 May 2018 11:50:05 +0000 (UTC)
Received: from [10.36.117.47] (ovpn-117-47.ams2.redhat.com [10.36.117.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A30D205D521;
	Thu, 31 May 2018 11:50:04 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 23/27] hw/core/or-irq: Support more than 16
 inputs to an OR gate
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org>
 <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
 <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
 <530bef1b-a143-1566-3089-32629ab250b8@redhat.com>
 <CAFEAcA94JAccGhbhSrBkTHUV+dLR-EvYQW_nuB9FodtLTDQPZw@mail.gmail.com>
 <c7e4c537-2174-005b-fa15-0e8286e540ad@redhat.com>
 <CAFEAcA8p=PzfMbzbE6zQ-mAhP-vgvDRvPTjharRD76BFLyS_fA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <35601960-682e-9ccc-c724-2c6504e8cc2c@redhat.com>
Date: Thu, 31 May 2018 13:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8p=PzfMbzbE6zQ-mAhP-vgvDRvPTjharRD76BFLyS_fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 31 May 2018 11:50:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 31 May 2018 11:50:06 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-TUID: U+RTCWSBYekf

On 31/05/2018 12:50, Peter Maydell wrote:
> On 31 May 2018 at 11:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 30/05/2018 19:35, Peter Maydell wrote:
>>> On 30 May 2018 at 17:59, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>> On 21/05/2018 17:02, Peter Maydell wrote:
>>>>> On 21 May 2018 at 15:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>>> Why do the levels have to be migrated at all?  It should be enough if
>>>>>> the IRQ level is either migrated manually, or restored (e.g. in
>>>>>> post_save callbacks) through other data that is migrated.
>>>>> This is standard behaviour for devices: they track their
>>>>> inbound irq/gpio lines, and then that becomes internal state for
>>>>> them that must be migrated.
>>>>
>>>> But or_irq's input are another device's outbound lines, so tracking them
>>>> should not be necessary.  The other device would do it for or_irq.
>>>
>>> There's no mechanism in qemu_irq for the destination end to ask
>>> the source end about its current value. The information flow
>>> is strictly one-way.
>>
>> On postload, the source must call qemu_set_irq and that will cause an
>> update of the or_irq, won't it?
> 
> No, calling qemu_set_irq in postload is a bug. (You don't know
> which order the state of the source and destination devices is
> restored, so asserting a signal in postload would have different
> effects depending on whether the destination had already had
> its state restored or not.)

Hmm, I suppose the x86 world is a bit more "hierarchical" and you cannot
create a qemu_irq loop - and creating the sink always before the source
ensures that migration works fine with post_load.  I'm pretty sure that
there are devices that do that, and an interesting case (for the sake of
this thread) is the IOMMU, which prompted the introduction of
MigrationPriority.  Thanks for the lesson! :)

Maybe we should add your text to docs/devel/migration.rst, under "Device
ordering", because it explicitly mentions interrupt controllers.

Paolo
