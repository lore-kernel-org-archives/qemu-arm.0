Received: by 10.25.159.131 with SMTP id i125csp1613199lfe;
        Mon, 5 Dec 2016 07:42:53 -0800 (PST)
X-Received: by 10.233.220.71 with SMTP id q68mr50874988qkf.153.1480952573850;
        Mon, 05 Dec 2016 07:42:53 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id s28si9129467qte.238.2016.12.05.07.42.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 07:42:53 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id x190so39914773qkb.0;
        Mon, 05 Dec 2016 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=rY4xtZ+LaxAI9yBcVMX5XmlVS5O4dKhUJndTmoVKpXw=;
        b=y2bgriyrteQR2zu+fp0HnXNabPN56pvKGHLOqCozJpvQ4mpe4cl5cUXN62MFKW3O+n
         fWkBEPk+knyxaJwlEyXnU8YnDMmldpiQTcQMOYW6O5pu4AGQSJEjm4miIxSiWz/Mhu8N
         oMSIZwobK98ee9rVSNHa7R6RwQawSrsv8joDAhKsQm4NlqP+LlQuGTRC/a0f8L6Dgav7
         vZGRpc+Y4n76qrjuCw7rSKJJpAL7jQ2ELE+pYbd4y9s5JTRS0m7ra58KXPoNUZywLY/P
         ZaHdbPHjqZxoQvetvo4mL/ys2MTpki/VId99InR5a9jVm4RzQsyWcLsR96+0iTnNRqOh
         0KnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=rY4xtZ+LaxAI9yBcVMX5XmlVS5O4dKhUJndTmoVKpXw=;
        b=K+TUx7Dk/o55ASHdwwO68AncdQuxpDvLGFj1Frj3cWzP7ovLjaOcLrnt1ES/zVy8M1
         WJRf0GYrysoDdtTJLq3JS/zgQDXryTIToeoEmz+jZh1af3Y+Di4Q3kfwoLTO3DgysWFH
         +5mnmpm7LYKVWxsrs8d/PXscZMgSCdDJJYr+sLIxNiejXVlWp6qdxNHsZo/0ngVEaPP5
         bcasj8J7+/AbjChdrGlzBS3vbZv0E/BTQQT7WAyLv1/ElCzDoh/B+zby4iB41Ql7YxLE
         jkDWb7a5iYYLG87rsG6KPnr7bA4X0c51vvfoCjRfrEJU07FraxBvI/vw8EnG285Qw8xr
         JGIA==
X-Gm-Message-State: AKaTC00DHg7+wJ1uiiIHpiQiHIQiFOZt7dA09eHxj6XYqzCH69lc4GywlPDIwmy78ymP1w==
X-Received: by 10.55.64.69 with SMTP id n66mr48864967qka.20.1480952573488;
        Mon, 05 Dec 2016 07:42:53 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net ([2602:47:d954:1500:221:9bff:feff:8add])
        by smtp.googlemail.com with ESMTPSA id w34sm9704994qtw.10.2016.12.05.07.42.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 07:42:52 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH for-2.8] target-arm/translate-a64: fix gen_load_exclusive
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 stefanha@redhat.com, peter.maydell@linaro.org
References: <20161202173454.19179-1-alex.bennee@linaro.org>
 <8737i21vl8.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, "open list:ARM"
 <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <b6c3b949-ef2a-31f4-ce86-712ce7b64a3f@twiddle.net>
Date: Mon, 5 Dec 2016 07:42:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8737i21vl8.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: GJnVQoCTzqQD

On 12/05/2016 03:09 AM, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> While testing rth's latest TCG patches with risu I found ldaxp was
>> broken. Investigating further I found it was broken by 1dd089d0 when
>> the cmpxchg atomic work was merged.
> 
> CC'ing Paolo/Richard
> 
> Do you guys have any final TCG fixes planned for 2.8 that can take this
> fix for the ldaxp regression?

I don't have any pending patchs for 2.8, no.

>> As part of that change the code
>> attempted to be clever by doing a single 64 bit load and then shuffle
>> the data around to set the two 32 bit registers.

It's not trying to be "clever", it's trying to be correct, giving an atomic
64-bit load.

The fact that we didn't attempt an atomic 128-bit load here for the 64-bit pair
is a bug.  We have support for that in helper_atomic_ldo_le_mmu; I'm not sure
why I didn't use that here.

>> As I couldn't quite follow the endian magic I've simply partially
>> reverted the change to the original code gen_load_exclusive code. This
>> doesn't affect the cmpxchg functionality as that is all done on in
>> gen_store_exclusive part which is untouched.

We'll have to fix it properly eventually.  But perhaps 2.9 is soon enough,
since that's when mttcg will go in.


r~
