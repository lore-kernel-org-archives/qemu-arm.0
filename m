Received: by 10.25.0.23 with SMTP id 23csp219021lfa;
        Sat, 10 Jun 2017 09:59:23 -0700 (PDT)
X-Received: by 10.84.209.228 with SMTP id y91mr46989897plh.210.1497113963811;
        Sat, 10 Jun 2017 09:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497113963; cv=none;
        d=google.com; s=arc-20160816;
        b=VuCQvx75WMELtafjACoeUi1Icv8AeJaF7ebe7Chy2YaPUGmIonP7mhE9HtoEenbgs/
         DtIG0/KwBKIOwW3qP924o+vhJ2a7Po+FxtMjqD/jd25GWZYTHt++mxyB962hkyzWoyuS
         xTYBxXNmDy4pov9W9B0rP6QNE+TIthCkg15zksBJZZ6QGBMWSnYiK5A0GBl9Ww1ZzU+j
         xdPvpa7amPi8WZxk++A++m8NZ6+Cm1487RlLXyBM/s4iPl8A5DhtnWwqAS6c9buy7thl
         vxG77M7Dj5ALT1Yk3NBSYtRCwLP5ADoqJmpgXbJPUnr0mcLIJPp8BWV+WSK/8HJi01IO
         wtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=ZnK72iCxkC8IDlI7fNIolO6IzrWw9hDtcuCyzHGTV3w=;
        b=xwgIVBA2c4jGXfviVtBEWFr/w+WR9/7PgBSGiq36fJUqRMm+rT5nQW4w1YsF03nhJX
         mxd6JXJXuSLAJBpJkSQAiwLs2CQpE7CTEo9WTt1N/dLHkUJ3o4VWznMmST/BU9oNMwCO
         jMY8cCEDdEvcXcOpY4RKqKefr0f2ltd/Woo+jeYqO5ib8+RA5P464B7lYTt8fNfWVvlJ
         QRtO5vxrHx71Ui40T96/0kIvYAdoUnDhZeuBEmYKw8ySWRXR87Jnf+/UJXfuf3kjMHyC
         iIB8vQ1S//ZQbTv9vXZkfuz9p+pAdt8dTjQ7heGyHmoZq3qmuUdLKojz13WOtMHeNhyr
         nV+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com. [2607:f8b0:400e:c05::242])
        by mx.google.com with ESMTPS id p12si9463749pgs.309.2017.06.10.09.59.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Jun 2017 09:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) client-ip=2607:f8b0:400e:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x242.google.com with SMTP id a70so10506978pge.0;
        Sat, 10 Jun 2017 09:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZnK72iCxkC8IDlI7fNIolO6IzrWw9hDtcuCyzHGTV3w=;
        b=nbkJ2JnyMpqUMa9R+6J0cL/8kp+K5EvNChuQBMJd31rnW/bY2gRmgDUOp2fOlu37OV
         7tpgD4QDgCo3pf029Fgwp8epxwzKf3N/oeHE2wSaZ/LViUNue5q+dmS7oZAMINqPUH/n
         UFIdxqllYNF3n9btzYK2K/KKk+tOeQ2UxyLXJ+2VRNr+VUo5LVNZzIweTZKO3UC0qkQA
         IbjWF9lAuQQWmDqPuAoZz5JYktRQoA5pMG+thljEohGhEdxGbfbjiaWl6QXSsag6ihxh
         Y8x2Rr4OAeGwJ9NYwNhlDotLyukFFtEznPQyVxt+BZvGxhQWvwgrip4psPe1g02wdsGy
         UP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZnK72iCxkC8IDlI7fNIolO6IzrWw9hDtcuCyzHGTV3w=;
        b=DvicvS9Y6lGgDH/UdbxavKiWMXA+0C6Rxl6uCbqCVWbpDdC6xhAKBlBfsj8H2klO5F
         VnMPVSz3SYC5GKgDQh6GULk1EGNkcxI9+1/Y5CMgi0v66nu7lVjbCg6PkSmiexfd6yV1
         v8W9qxIq19YJZox9682vO463A/xuGyi4jWyQ+DMTDRRqfZWxipwICcXmAlsLT30O7Weg
         sKy06KtgmoYKElPAsove5T4H9Zy61gd2DngYfBegiHum/cOdpMTaOc/FRpydJzPh/eUi
         s25aIoibQAaBCECKPKEPWpX4F50VybxldXofXHP5lgTuPGCkIm3/n9yGGs8vbO6lo6n6
         sTcg==
X-Gm-Message-State: AODbwcAKPk/QrNo0cDCfLqzcv5ZnY2U0mL08pQwpsrTu7jqgqq0y/OxH
	+K7jLEzqwz5QIw==
X-Received: by 10.84.210.33 with SMTP id z30mr47975609plh.235.1497113963297;
        Sat, 10 Jun 2017 09:59:23 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id e124sm8790830pgc.17.2017.06.10.09.59.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Jun 2017 09:59:21 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC DEBUG PATCH 3/3] translate-a64: fix lookup_tb_ptr hang
 (DEBUG!)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, edgar.iglesias@xilinx.com,
 cota@braap.org, qemu-devel@nongnu.org,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
 <20170609170100.3599-4-alex.bennee@linaro.org>
 <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
 <87vao4b4z5.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net>
Date: Sat, 10 Jun 2017 09:59:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87vao4b4z5.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bIrITIgfaXNr

On 06/10/2017 01:51 AM, Alex Bennée wrote:
> 
> Richard Henderson <rth@twiddle.net> writes:
> 
>> On 06/09/2017 10:01 AM, Alex Bennée wrote:
>>> THIS IS A DEBUG PATCH DO NOT MERGE
>>>
>>> I include all the comments to show my working. I was trying to
>>> isolate which instructions cause the problem. It turns out it is the
>>> RET instruction. I don't understand why because AFAICT it is a
>>> pretty much a BR instruction.
>>
>> Yeah, same thing for Alpha.
>>
>> It has been my guess that not chaining through RET means that we get
>> back to the main loop regularly and often, letting interrupts be
>> recognized in a timely manner.
>>
>> I can't figure out why that would be, however, since interrupts
>> *ought* to be setting icount_decr, and the TB to which we chain *is*
>> checking that to return to the main loop.
> 
> Indeed - if that was broken a lot more stuff wouldn't work.
> 
>> Since changing the timing affects the outcome (e.g. -d exec), it
>> follows that this *must* be some sort of race condition.  But since
>> this still happens with single-threaded mode, I can't imagine what
>> sort of race condition it might be.
> 
> Apart from timer expiry I can't think what other interactions the other
> threads have on the main TCG thread. I guess there is IO but my test
> hangs way before the kernel starts poking the disk. Is there an
> interaction between IRQs and QEMU's serial driver?

The Alpha hang appears to be timer expiry.  In that it happens as soon as the 
kernel spawns some kthreads to finish up the boot process.  The kernel then 
sits in the idle loop for an unreasonably long time.

But, bizarrely, it will complete the boot eventually.  But it takes ~5 minutes 
to do so, when we ought to be able to boot to prompt in seconds.

>> More data points.  I removed the tb_htable_lookup, and that by itself
>> is enough to fix Alpha booting.  But it doesn't help the aarch64
>> kernel+image that I have.  Which does still boot with -d nochain
>> (which, along with disabling goto_tb chaining, also disables all
>> goto_ptr).
> 
> I wonder what is different about your aarch64 image and mine then?
> Because mine works just with suppressing the chaining for RET.

Oh I just tried -d nochain because it doesn't require source modification.

>> Not really sure where to go from here.
> 
> I would agree with Emilio that we revert but I can't quite shake the
> feeling we are missing an underlying problem. Would just skipping the
> htable lookup (but keeping the tb_jmp_cache) be an OK fix for now?

I agree.  It seems like there's some real problem that this is uncovering.

Dropping the htable lookup is certainly ok by me.  If that's enough to un-stick 
your regression testing for aarch64 guest.


r~
