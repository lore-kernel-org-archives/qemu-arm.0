Received: by 10.25.159.131 with SMTP id i125csp1661144lfe;
        Mon, 5 Dec 2016 09:15:30 -0800 (PST)
X-Received: by 10.237.36.208 with SMTP id u16mr51502585qtc.213.1480958129915;
        Mon, 05 Dec 2016 09:15:29 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id z129si9354867qkc.25.2016.12.05.09.15.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 09:15:29 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id y205so40328050qkb.1;
        Mon, 05 Dec 2016 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=ZkRzYkgWz6ZsdiUU0+AVmtqhuI+h4mwazA4M46nmwak=;
        b=b3TyHmqKqVCvczoZZ8Wr0RASI7qoCvd4DFepNdbrdZ+RJwV/w6vTosaZKjmA45hxkv
         cuZvPKPZpeqHbBmqwprglQRVSDFJvRaEq+PzZWV1+cH781Oh/nW9ceASSFxltA8hjK3h
         t0U6DwjtVVR/wIBRjm7AL29QsbjNjlHVc8ikUVn2TIlT0TgkzFNfTqn+GRnnOcou3zfM
         iezOQVbQMsCzEay2YYiJ1TLHjpUmidxw55tCgShBvkYHrWvWrfQ9tWEwfzQF7Wbl4Oi9
         ccspdabJt2uA3hQPbC2Z1DUmXysvRzHfaZ2OAGzXNK7UzjM1aMd4t4ruWMrhdlMmgKn0
         IY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=ZkRzYkgWz6ZsdiUU0+AVmtqhuI+h4mwazA4M46nmwak=;
        b=arcpaalYFuyknSlGvNdHvfuAGTxHNsC8DLihUSupUz82+eTwIoAFwteceRRcCK5B1D
         zqqz8akqrBrgvFM1DPiL/+KrB8dLnJXzYSu0jTPEQSgfdFb68ni/3rR117pt0R1jROjS
         gx05q0A+E414Kj7/oqfK3gyk93qzjJQd+NUiyIYabpfSPdVIHhJq+pWrRwqEY7FjbdBy
         qbFi2BFrPUXmLbPeDyVKyfDmkerdS/P1EqxAfIAA5YmjMVJI/DguCJibTACcYJwXdxJj
         uH+uGsGUryqGlT7wJnu5S3d+ThonhOAVRUXltw7o3234tdlL9BmMYWdfmARrwDA6Zimt
         HI2A==
X-Gm-Message-State: AKaTC01K02nEHqUIb/XrDELvIsLNj/u/WPMFYj/TCFp6bj1VwnJYKw/hK8kmU3WCJZ1GsQ==
X-Received: by 10.55.149.134 with SMTP id x128mr47790286qkd.263.1480958129462;
        Mon, 05 Dec 2016 09:15:29 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net ([2602:47:d954:1500:221:9bff:feff:8add])
        by smtp.googlemail.com with ESMTPSA id g46sm9862339qtb.44.2016.12.05.09.15.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 09:15:28 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH for-2.8] target-arm/translate-a64: fix gen_load_exclusive
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20161202173454.19179-1-alex.bennee@linaro.org>
 <8737i21vl8.fsf@linaro.org>
 <b6c3b949-ef2a-31f4-ce86-712ce7b64a3f@twiddle.net>
 <87twaiz4r6.fsf@linaro.org>
Cc: stefanha@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 cota@braap.org, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <90d8b147-209b-adb2-de81-f3c02c381d26@twiddle.net>
Date: Mon, 5 Dec 2016 09:15:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <87twaiz4r6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: qrph1haEwtvL

On 12/05/2016 09:04 AM, Alex Bennée wrote:
>> It's not trying to be "clever", it's trying to be correct, giving an atomic
>> 64-bit load.
> 
> Ahh right I see. What happens if the backend is 32bit, will it issue two
> loads anyway?

Yes.  I did bring this up when the atomics patch set went in.

In principal there's no reason we can't handle this like the 128-bit path, with
a special helper for a 32-bit host using __atomic_load_64 if available, which
it would be for i686 (via fpu) and armv7 (via ldrexd), or
gen_helper_exit_atomic if not.

But it's nasty and slow, and work that's unnecessary if we simply decide that
32-bit hosts cannot run mttcg.

> I don't know how often these load-exclusive paired operations are used
> in real code but I think we should at least fix it so the values are
> loaded properly for 2.8 and do the proper atomic fix for 2.9.

Yep.


r~
