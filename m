Received: by 10.25.0.147 with SMTP id 141csp170564lfa;
        Sun, 19 Feb 2017 10:11:30 -0800 (PST)
X-Received: by 10.36.79.13 with SMTP id c13mr16050412itb.103.1487527890843;
        Sun, 19 Feb 2017 10:11:30 -0800 (PST)
Return-Path: <mdavidsaver@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com. [2607:f8b0:4001:c0b::242])
        by mx.google.com with ESMTPS id j7si7876998ioo.214.2017.02.19.10.11.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Feb 2017 10:11:30 -0800 (PST)
Received-SPF: pass (google.com: domain of mdavidsaver@gmail.com designates 2607:f8b0:4001:c0b::242 as permitted sender) client-ip=2607:f8b0:4001:c0b::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of mdavidsaver@gmail.com designates 2607:f8b0:4001:c0b::242 as permitted sender) smtp.mailfrom=mdavidsaver@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-it0-x242.google.com with SMTP id w185so2601553ita.3;
        Sun, 19 Feb 2017 10:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=lbCd/Gj4WRXz2SlBO5oZm9Z5hSuJqNAq7i7JB2D/MMg=;
        b=dB3IGeVVB/Tl3t2EEpSAlVmNy0bt0WeX2pXTTpv7cTmTPnuE9/P9knWMGFWMcpbJuH
         M7UsVOEcQihH/WHIzXmzPMCm10HdiYAGfrncJaWSfAuzPjhUcilsiSwqN2JzseSm6x49
         2hcguOc7MynqUkdhOlnC/30V7AN+jpxhAHJH9LIoi8RxPuX2WiJ8BoopHQrB1b2Xds3d
         3MSzArl0KE9trbOpBXAVPrZO1kRehYehj87Ie3pHR7CeWTAV4fFdGBoe2QM6+ohaQ3RT
         6gWZkhuIlwx7msUihWkcTQtQxjf+PY+o9Fn/K2DIjfd5t7hYrYM0QX7/MlqlS3SPfOrZ
         G7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=lbCd/Gj4WRXz2SlBO5oZm9Z5hSuJqNAq7i7JB2D/MMg=;
        b=bCPzEjBATxSCObZn9hdcuyXrJUX0V5T1KpuyZ9slUWlse94ZYXUDAg7AnBhj41TJJZ
         bhW6VAalpOsaWBpa2BGW8jstj7DTfHohTepnzhul+nzaWLwUmhKEtvD4NmkTMse8pSwq
         yX2oz7JaFwVk8hO3lUTMvQbwvHORcqqociiCM9R54TwO0VD20JrMcOBmie4dZrnfYvip
         PjXN7IG9jjEY0iml36yNKr+0iPymg89PDeuh7rKgYIjxjZEGakrh2cMl159wPygjGg3w
         9GBmi1/F6zCvy7MimfdF7P2wzGZFplROhcrV/3+grE5IXgLpagG/xx726UYq5f00BFCv
         J9Eg==
X-Gm-Message-State: AMke39kATseY5gZ/8D3Uas2CXowJZ6RxnPENO+n8FWvpmJGbDhbzjIQPSYe2xixwvvsbaA==
X-Received: by 10.36.141.69 with SMTP id w66mr16208995itd.96.1487527890460;
        Sun, 19 Feb 2017 10:11:30 -0800 (PST)
Return-Path: <mdavidsaver@gmail.com>
Received: from [192.168.43.106] (mbc2836d0.tmodns.net. [208.54.40.188])
        by smtp.gmail.com with ESMTPSA id x128sm3937477ite.11.2017.02.19.10.11.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Feb 2017 10:11:29 -0800 (PST)
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
To: Peter Maydell <peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-4-git-send-email-peter.maydell@linaro.org>
 <87mvdnvcxx.fsf@linaro.org>
 <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
 <CAFEAcA8X1qvweDHBWQjZwH68xWdn4K+Wfqv0yRhjM5QCxd=VBA@mail.gmail.com>
 <1e2962d7-1b50-9543-3e1d-9c388d4167c3@gmail.com>
 <CAFEAcA-9w-bKJY=gb9Bo9c45vLParh8zVwit3t4GPHqTJZxnJw@mail.gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>, Liviu Ionescu <ilg@livius.net>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <e4c435ec-a0fa-40a6-a20a-88ac2fa2cffa@gmail.com>
Date: Sun, 19 Feb 2017 13:10:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9w-bKJY=gb9Bo9c45vLParh8zVwit3t4GPHqTJZxnJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: MmmTzMil0WK1

On 02/18/2017 01:38 PM, Peter Maydell wrote:
> On 18 February 2017 at 17:45, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> On 02/16/2017 09:11 AM, Peter Maydell wrote:
>>> I haven't actually checked real hardware behaviour, but I think
>>> we can fairly safely implement this as not checking the IPSR
>>> exception field. (We might as well go with the "reads 1 in
>>> handler mode" choice of UNKNOWN that the M3 documents, though.)
>>
>> For what it's worth, I dug up my TI TM4C1294 eval board and re-ran
>> test10.c [1] which is designed to probe this behavior by nesting
>> exceptions PendSV within SVC.  RETTOBASE is 0x800 in ICSR.
> 
> That's a Cortex-M4. From the test it looks like it
> has a different choice of UNKNOWN behaviour for
> the value in Handler mode, so real code in the field
> isn't going to be relying on that and it doesn't
> matter what we choose.

I've been away from arm/m for too long to claim any detailed knowledge
of the documentation.  My intent here is only to provide a data point w/
real hardware, not to interpret it.

> I don't think the test looks at the "what happens if the
> exception in the IPSR exception field isn't actually
> active" case, right?

Correct.
