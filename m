Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp271019lfg;
        Thu, 18 Mar 2021 04:31:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcBoSEkYZxL2vV3k04eq2icMDKL7C94qpqiSu4mGUgylUTzKRhyOaY8QdhH7mZ89jxpnX5
X-Received: by 2002:a05:6402:430c:: with SMTP id m12mr3120191edc.138.1616067078843;
        Thu, 18 Mar 2021 04:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616067078; cv=none;
        d=google.com; s=arc-20160816;
        b=KzqZEKEqvNre2ud9PQ5mHjFp8fyrgp5u+VaGRDQrXmyD3C5L6JI/EpvV3v/Z7/lYg2
         RkdtceteppxThZ+9MMjVupiNBRVItTkeJ34QJG09E5ZWII4l4go4flKoWlirE+Y6Bq98
         4sembzHSoONBwFlxQFgy5+d05SiyspDZe3dqC31b0QSBbs92nm8PFGyVifnNwQvOVoIk
         XwR7fAxJ0TI8uEeCgc2D/UT40ugMY+ggQi2aWQJ34moeVwSkWlUeGrPrQ4p/yZ1z7gFK
         qUG4pQN+PQJRv92TSssHIKIO8Gh+eUhT6eMk2ZMP+LivMWPZY7lzo+NckZ48iPeJ5Mpw
         22Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+ysM6uPvCTnBFvFlgfILPpEME73b7cXiBO8cNe3ntmI=;
        b=KymgnrAvTbyyta29DIXTKLFoWdfXKLcAg0JbhN3VTsh9QMJ/YUtEQLCgK9uri2KoTT
         p+TDcVCtWbPqze1UXz7o3zMb7w7r4T3lq9SR/FK2jxJTwoETxbpti+fm744Pmlei9mlb
         fhEmt+Xq15fiyvOtPpcNMoqtbol8KNxgI4cxLqxfrJ36yaOXhPDvgqdaBvyVnnBOuA//
         XpjMsrFlIJA2q1452j2c5khiPD520yGIJWyPti1HGz9xTu+JYCp7TS2S0t3DMiU+0s4I
         mMGabiHld3H6K76otjyP2S4z97UfGhy6rZVc49dVBcwZ8lGbZqigWvE+ZLaqlVg4SO6Z
         P/mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RfSDghIn;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c23si1434500edv.312.2021.03.18.04.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 04:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RfSDghIn;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616067077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ysM6uPvCTnBFvFlgfILPpEME73b7cXiBO8cNe3ntmI=;
	b=RfSDghInSnoQxROlYM+HoJZcv4AMAEYm+icHeNT2ArEzR8XfOhDmG1EMxHXA9u4GOw35Ng
	QQ3oAJ+sqfkNaZ9wZ1ZOq/W64nbsELYJq5QGJr0N3VP4l7Lpr/3wbPbSFmAjzMP9XNdD3M
	WFkD/fKIJq12mu2TBXibEfx62uV6Ni4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Kn7Bh11nPBOcd-nrXudR6w-1; Thu, 18 Mar 2021 07:31:15 -0400
X-MC-Unique: Kn7Bh11nPBOcd-nrXudR6w-1
Received: by mail-wr1-f71.google.com with SMTP id p12so17373075wrn.18
        for <alex.bennee@linaro.org>; Thu, 18 Mar 2021 04:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+ysM6uPvCTnBFvFlgfILPpEME73b7cXiBO8cNe3ntmI=;
        b=WORi6H+VlO4/rbDWHMeTeDC3ypvHvXS3+d5Lwkqvp3+BqOzELtRUwzz2wiZia+gU9S
         wQEps7pXfA6xTZXuzN+6yXeE/T/akDwsveey5SpH0Udi2DXclMzQY4S91PWFpYiLVb89
         NpRLAFZeuNIHYnOUV1b3zAweykzuARxMjyHFePfNqbGoGYtIfYHcS/8Fnm9hQx4uN1In
         uyqSaeh85y8TyBEhlWW91HJj7fP9+I+TuR7MfDKwTz62L25HUBCSaYSFWFEsJC6y7yPH
         PyaXfZI7CW/hlIL3YqsYSgkslypwm+RY9Hink97KDL+yv+Ns1P6V69WwpLgLdZClwbgB
         B4aw==
X-Gm-Message-State: AOAM532aDG8Q+voIvPJctytRnn+n5en89kSv1ENz+qJlmW2kbGbjI3Xq
	XM0uFmLURQzaMExisd6TBkGr8BYILZ8XBkZ2I3WB7jaYprf4WZ1BrB8KwwBd0Ghxu5feyn35iWd
	r+C39882y/HGmzgfssrm4A9Q5Bvx0qXJGEXJ5sXCN/U0VRL7UVICuxfzaC1oUePkx/Q==
X-Received: by 2002:a5d:538d:: with SMTP id d13mr9349477wrv.92.1616067073740;
        Thu, 18 Mar 2021 04:31:13 -0700 (PDT)
X-Received: by 2002:a5d:538d:: with SMTP id d13mr9349439wrv.92.1616067073452;
        Thu, 18 Mar 2021 04:31:13 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id p17sm1886330wmq.47.2021.03.18.04.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 04:31:13 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <drjones@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
Date: Thu, 18 Mar 2021 12:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uQBSFbqruRHr

On 3/18/21 12:21 PM, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 11:09, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> Still, I'm not sure it makes sense. If you want to migrate a such
>> machine, KVM can not virtualize it, so you'll be forced to use TCG
>> right? In that case cpu_tcg is built in and you have the A15.
>>
>> IOW the problem is not this patch, it is that since 82bf7ae84ce we
>> can not migrate A15.
> 
> Do you mean "we can't migrate a TCG A15" ? That would be a problem.

No problem here.

> Or do you mean "we can't migrate a KVM A15" ? That's entirely
> expected when we drop support for KVM A15 :-)

Yes, this is why I mentioned this is mostly a problem for downstream
distributions.

> Or do you mean "migration from KVM to TCG doesn't work?" That's
> a pre-existing thing I don't expect to work (we don't put anything
> in to stop it working, but I'm pretty sure there will be a bunch
> of things that mean it doesn't in practice work.)
> 
>> So we need both 1/ revert 82bf7ae84ce and 2/ be sure the kernel
>> support 32-bit host... Am I missing something?
> 
> We're definitely not reverting 82bf7ae84ce if we can avoid it...

I tend to agree. The problem is for the running VMs started before
82bf7ae84ce (so up to any fork based on v5.2). I don't know what
the forks are supposed to do with the running VMs if they want to
migrate them to newer QEMU (or upgrade the host QEMU).

I don't expect a guest being happy and reliable if we underneath
change its CPU by another one while migrating it...

KVM to TCG is not tested much indeed, and I don't think the performance
impact will be well accepted :)
