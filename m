Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4601249ejb;
        Tue, 20 Dec 2022 11:52:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5bhLV2oDmlCTip+4QRsj2zeCU4or/Qh3G+lDn+E/oExJPJcaxm6cWbgyxttgMe7D+akM6y
X-Received: by 2002:adf:e6ca:0:b0:242:63de:2f5b with SMTP id y10-20020adfe6ca000000b0024263de2f5bmr28514225wrm.6.1671565978380;
        Tue, 20 Dec 2022 11:52:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671565978; cv=none;
        d=google.com; s=arc-20160816;
        b=iKLa6cUHyjS0fh4y2BcZAlfVz8asGAnAvX6vDoORcpeTz4q6yfDpI6IH5Qy/7a/qlN
         ZpNeqUivtPFNpVOKT5RXaqmycZxtOt6/e6UdLde/y64IYV9nWHYol6Q9W4Vd0jpWCPnM
         tBppQnGCf9J6EBckPIYptxmZE4cDngz1CrUR6hZc+95D2ZhPZrJK4JT67X7U/m88EWGZ
         ZiEmO/26ixM9SfHL2FauX/tvq+siovYi7DVav9GsZMmKKqztiAQFVazwrUTtGD9j8oFD
         oiBtDM86R0VHxhB1R+zcOTKBX6iml7lQTyr0xPZkKJRTu2mJ8KiAz1IQpHTWnyAy9jNY
         cAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=bEOLelN3wJYyNhsrZ0aPqAGwsr8/x4El2iAwqrV1puY=;
        b=fMw5k4+Kt0Y5JbVrh3xwtY6YwS0esJ+5u0ceqHI7ATTCDcR+SR+qG3lDqBfYWX1ya/
         vvJWaGkZzQAZ1d/URRppk4Xcl6kEUHuCFNmXMY5jy5pxb1FJRUYmMKcM4JpsBVzLIbJ4
         89Pgh9mYjIQBpZHLf/7L44mV5O2CYArNRiXlfQPEV4JPrQaLZbzECqgZ8uPl5RFNyWYL
         TYy/aXTXbZex5G+Yi6XoUrzsVzdOyoQOyo1QrHFhnVllhhWBmrYKqbggECYK1XCeR7NM
         FeJQbqYdyf/bR2Jf4CzEiZ29EkjcvNXbg1k8/2ZrPMZUf6BBfN/eumSbRHbyTjYh8Ydn
         mOng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=eRe6EfWY;
       dkim=neutral (no key) header.i=@suse.de header.b=Xxeo7mNK;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id bk29-20020a0560001d9d00b00242750a5b49si9293520wrb.446.2022.12.20.11.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 11:52:58 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=eRe6EfWY;
       dkim=neutral (no key) header.i=@suse.de header.b=Xxeo7mNK;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B6841764E5;
	Tue, 20 Dec 2022 19:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671565977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bEOLelN3wJYyNhsrZ0aPqAGwsr8/x4El2iAwqrV1puY=;
	b=eRe6EfWYlk/8UIgPWe+oNRFtehA8ZCKkFrLkG8fgACwtjwC9I2umkPr8A3ZxzfWAyiXozs
	c46eLk+5fc6r1guGzXn3kowSkYsOUQJGlvwEMzhYgz42U4OIMonjkaSrAol+PpWJRLBcGK
	xSgKcc1s4B/hw2TcF3uI6WDqjXNEV18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671565977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bEOLelN3wJYyNhsrZ0aPqAGwsr8/x4El2iAwqrV1puY=;
	b=Xxeo7mNKV8t7XcQwk0WHV0pILXa8A5PKhKkYt/A58zVx1wBKYihTZ5VFFpPxloK9bPNvoD
	zGegudqopgOMy5CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 407D813254;
	Tue, 20 Dec 2022 19:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PkJhApkSomMmSAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 19:52:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alexander Graf <agraf@csgraf.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
In-Reply-To: <601ba0ac-cbcd-50d4-c295-5cde4a4d6e97@csgraf.de>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
 <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
 <76c8912f-4fb7-118a-2105-efe08f343f77@csgraf.de>
 <ced115e9-6bdb-fdb6-818d-b77e27b9ecb1@suse.de> <87r0wv8vsa.fsf@suse.de>
 <92da4de4-b00b-096a-8dd9-f4f2f9696598@csgraf.de> <875ye6rxk7.fsf@suse.de>
 <601ba0ac-cbcd-50d4-c295-5cde4a4d6e97@csgraf.de>
Date: Tue, 20 Dec 2022 16:52:54 -0300
Message-ID: <87wn6lrgx5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: CGqDZzdeBy5v

Alexander Graf <agraf@csgraf.de> writes:

>>> I'm confused about the patch ordering :). Why is it easier to move the
>>> psci.c compilation target from generic to an if(CONFIG_TCG) only to
>>> later move it into a tcg/ directory?
>> It's a simple patch, so the overhead didn't cross my mind. But you are
>> right, this could go directly into tcg/ without having to put it under
>> CONFIG_TCG first.
>
>
> I'm sure more like this will follow, and it will be a lot easier on 
> everyone if the pattern is going to be "move tcg specific code to tcg/ 
> and leave generic code in the main directory".

Ok, so I'll drop this patch from this series and resend it along with
the rest of the code movement to the tcg/ directory.

> Quite the opposite: Please make sure to move everything slowly at a 
> digestible pace. There is no way you will get 100 patches in at once. 
> Make sure you can cut off at any point in between.

I meant having code under CONFIG_TCG first and later moving to tcg/. So
we separate moving the code from figuring out if it should be
moved. There was no implication of speed, size or indigestibility =).

>
> What you basically want is to move from "target/arm is tcg+generic code" 
> to "target/arm is generic, target/arm/tcg is tcg code". You will be in a 
> transitional phase along the way whatever you do, so just make it 
> "target/arm is tcg+generic code, target/arm/tcg is tcg code" while 
> things are in flight and have a final commit that indicates the 
> conversion is done.
>
>
>> I'm also rebasing this series [1] from 2021, which means I'd rather have
>> small chunks of code moved under CONFIG_TCG that I can build-test with
>> --disable-tcg (even though the build doesn't finish, I can see the
>> number of errors going down), than to move non-tcg code into tcg/ and
>> then pull it out later like in the original series.
>
>
> I think we're saying the same thing. Please don't move non-tcg code into 
> tcg/. Just move files that are absolutely clearly TCG into tcg/ right 
> from the start. The psci.c is a good example for that. translate*.c and 
> op-helper.c would be another.

Yeah, I think we agree. Thanks for taking the time to spell it out.
