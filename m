Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1277962lfe;
        Tue, 17 Mar 2020 02:10:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt3AdkjsDHWiM2vh7s52+ESOthTMQuvMHWDkPgfGR1Qwwm9Idf0Bv+C3BmJ22eI1tw3P5To
X-Received: by 2002:a25:b7c1:: with SMTP id u1mr6490389ybj.378.1584436200932;
        Tue, 17 Mar 2020 02:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584436200; cv=none;
        d=google.com; s=arc-20160816;
        b=D7ldcOSvWlH9UBZa6T2IJ7Id5HwtxQymt092wyjsELCmNxX0AwH0JXe9FvloqrlOSb
         uXwgjI2Ee6Sj8mJUiaFmwn2RFoKu9hafS2IVowUy28vpTV/w0MdlTTZ20ffA7U1DCFZU
         jIC0pItUkSf4x0fOYlikE94DjSNIj1eySZT2ji6jxJD352BsXTgQ87uTuhv1uLVgK4Xo
         U/iRXHC9l7clet1gHC4mOCPljqaku5J1j84yja+tXbxBPuq+RqlEplyXKhuoMwcvH42F
         FwfFTAdegKzbqtAFNgx83LhQSREMSV87SSnVYlXs326qSkTWeAT/NuNkbWoBDe+knoLa
         Z2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AiYdozBARCeTEYQgpxtk+UHw18e8cr3OkMZXSlfhe7s=;
        b=0VnBSo6WqvDMPoWld2rYhXI5y+pXIwcivb9DPNuazzqnNdbZH3claOpdjfQh5D2knl
         1DT6bXZYnbtH6IdaawYt5DPoLsm80eqdcBiigu19rqQMWdxDmEC0wARUT6mC48jSPGNG
         fFt23MWIBI437iZxWWsj1+C6aYVaeUYFpLJP6EcQhim8qdkzvnEcihDBz3UbJ4ssne7g
         a1lOeWs0LsWI5JxAajopR52GWCjJXVtvJzzXp+VapPlFkY0nPEGapFGdFfot8xyfdIhd
         fLNZw2V38D1QAT9Jll1Or2W1+I7FDOk9E6BZTG1nmXQLgdg1Pn0iikb7wn6ohqmabvO+
         eLMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d90oVx/r";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id q3si63917ybo.350.2020.03.17.02.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d90oVx/r";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584436200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AiYdozBARCeTEYQgpxtk+UHw18e8cr3OkMZXSlfhe7s=;
	b=d90oVx/rZXGZsAxqS122rWDIyrqIvceJ3EIBuj3Fcu0L9BGtmIbB9Ha77dzhFCWY/2wZ1d
	y4wS/8BF2vJe2BWroBdSY7xrz5IpIS+ngBJsmd2j5CQr41lEKHE/metvMBLTcRfLmXlbDy
	wtN+UKIItq20l7GlGI/1QKvE/UwbHew=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-VhKsqmJUMFCh-dOv9I5IeQ-1; Tue, 17 Mar 2020 05:09:58 -0400
X-MC-Unique: VhKsqmJUMFCh-dOv9I5IeQ-1
Received: by mail-wr1-f72.google.com with SMTP id h17so702994wru.16
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 02:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=33HOQxyjSNkaXfQU6fJkB48HoXWoJZs0ADNmqK4BWjc=;
        b=myzU64g7Nm5Bfh6N3amSFS+JFwGS0+o6IXvMk53H6MZYfL4HXRX2aB+pcwP77otLsv
         z/VtM0qWMo8JeZIuZL3pTRTdL5uaiM8TIGhLh2Fp6uchcSShQPbdTNGJQOEETdQIaaIX
         +uzSatmYjKa+Hvd7mXQJ+DM2nI0XpzZd/CoRnw6EdoJQXJvSHXFUo7r6sCBwJpDdQOSZ
         qHxrhOi1kYRt0Texntlx6t9CG0U6bgRfIE4reDCoZhjFp1r1R9mlFqVzqbFDgHBJu0+y
         /WwTN4lcn1w1nYx2hi6vzzqJwHKo0KE3KMxv3ElP/rvE3meofifuzQ/0AT0MIY/XvgMn
         0XuQ==
X-Gm-Message-State: ANhLgQ2G3gcwa1I9ZEcsmXYKhbNhCj/vZEsl6KcA2AQdAVflINoR6LVR
	qD2IWy7uFftCoqHNuQAp7QHjeGT2XV+xCDn7TyGJQ7eqbgNgpf681VcWM9OuKMSdL3OPF8KtPBj
	gjYUn3VXnUNUmjvdb
X-Received: by 2002:a7b:c552:: with SMTP id j18mr4165514wmk.42.1584436197474;
        Tue, 17 Mar 2020 02:09:57 -0700 (PDT)
X-Received: by 2002:a7b:c552:: with SMTP id j18mr4165486wmk.42.1584436197243;
        Tue, 17 Mar 2020 02:09:57 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id s1sm3673452wrp.41.2020.03.17.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:09:56 -0700 (PDT)
Subject: Re: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as
 kvm_set_feature()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-2-philmd@redhat.com>
 <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3dc0e645-05a5-938c-4277-38014e4a68a3@redhat.com>
Date: Tue, 17 Mar 2020 10:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: NcfJaOddGxND

On 3/16/20 9:16 PM, Richard Henderson wrote:
> On 3/16/20 9:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> +++ b/target/arm/kvm32.c
>> @@ -22,7 +22,7 @@
>>   #include "internals.h"
>>   #include "qemu/log.h"
>>  =20
>> -static inline void set_feature(uint64_t *features, int feature)
>> +static inline void kvm_set_feature(uint64_t *features, int feature)
>=20
> Why, what's wrong with the existing name?
> Plus, with patch 2, you can just remove these.

The prototypes are different:

   void set_feature(uint64_t *features, int feature)

   void set_feature(CPUARMState *env, int feature)

Anyway you are right, I'll use the later prototype instead, thanks.
