Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6977505ejc;
        Wed, 1 Mar 2023 05:50:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+LIzhS/o38MoJ5ZciP5HK5i/ndub7L/BVJ3GVEFJUs/IARpDEM8Wirpc8aFkVinUN9oEwk
X-Received: by 2002:ac8:7e82:0:b0:3bf:c994:c9b6 with SMTP id w2-20020ac87e82000000b003bfc994c9b6mr11882596qtj.29.1677678606700;
        Wed, 01 Mar 2023 05:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677678606; cv=none;
        d=google.com; s=arc-20160816;
        b=ZM3H1IcntDsJ16X8TuYIE3947U6FNy/B1T+uaso+hLiDEk1Dqj9u3yP92rAFDt9xTx
         XsOZdtBPJ610WdGnHlpPvxVpp45DsvG+XIK6+r+gh0HxvyTfKjkqf3BURf+TOl9prc7g
         XcMWVECKDluBrdD7HluBFrhnivGRR8LXpK4w60sj//XzKFKG+230M51u0hGhsBBfjLbF
         Ab94ZlDdWy59pROJVjmZT+yXxb8mnEUmHCXBVMgoWZe6wkmF0DBNJwBJkzQPfCuhsGVJ
         aw3P3fCKulKBSTduOXx4epKui2FW3jytlraqMLiLL5Y/fW2RC3lSHgHWKELrKVmlqX7v
         jkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ARl01kO4NQHL5LufhXit3RCoBBsu55tMIA+2UZWr3wE=;
        b=X+3O/2nfj5/gVkYPRj/A36YdSXF4VjEbi8ywRcOLoNFRslhgYjfbau7unS5K4aXKwF
         W4IevP8e3syQW+CMXdh6xzrbrLGJOQKANwMPOLWF9dZE+t2uUXtx8IG6IPGEV4geeJCI
         Gv6njOegUE3Kzezh/P55h2AhxWK9j2mWrH6z53Et80CPRQtfT5HgPbk1TCxW2UVGwr2H
         CbWZsVQpJFuj8OjEsTwUBux8nXBbrtlbZq9QK9G9rqOPb/WZeaWCJ+IxWBYGlp8SYitK
         UPWn5M9BvVJfVXMd8zChpHnTgp6OCsWZ69cGk0pjORiGZo0TTlUIDULHZPHxe4vyRIbE
         jf+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hLrB8fbi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g11-20020ac87d0b000000b003b634a2268esi12166872qtb.643.2023.03.01.05.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hLrB8fbi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677678606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARl01kO4NQHL5LufhXit3RCoBBsu55tMIA+2UZWr3wE=;
	b=hLrB8fbie+YeLsilVON9j7iH1yYvTiR3Ho5A90uK3pRuDoukkKGgbLmk1YpuHNS2S7AGxI
	+GlOE0pSkrWxgH3UjVHAdQPV2KLmXU4293Mn2TsnmTCghX10ZCcF3lG0Gg7+8zZ8On4EHy
	A14W+yZEFD9jUH2EIKzhmpiNK0Wgd4s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-H3Y9OooTNZyanPpWrprIkA-1; Wed, 01 Mar 2023 08:50:05 -0500
X-MC-Unique: H3Y9OooTNZyanPpWrprIkA-1
Received: by mail-wm1-f72.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso8372026wmc.3
        for <alex.bennee@linaro.org>; Wed, 01 Mar 2023 05:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARl01kO4NQHL5LufhXit3RCoBBsu55tMIA+2UZWr3wE=;
        b=gdp8h0e/1r9ILdDw3jo/Ii3sx4IWk46Bv0AZE3u94lGfd+sq6lyYTNg82E7nS19YQ3
         z9Id02JLtqQowyqTRPPi8rL83UxL5PnaypoioMlN/yA7eCsGtwVYQP3d4XirFsh0JnC/
         NhUiluPJeDY0koJ9CxrtGbnS5dtUc7vLDoLymmDu65hbtlZisVyw+CIy51o3R0GDAw2V
         H3vsaLXI4O7Xffgh8vxzQ6VumMlLezzhpdCDoFCQNISYSaiKTHzvUqtr7MVARJejPOHy
         mVHyEEW1gllzYqrj4VbTWoiOEPbyeHonvFQ/yefUXHnaFQfU+tF18/OHGZZk09So8L+0
         tsHg==
X-Gm-Message-State: AO0yUKW+2WmnnwNl4zdxJ8ixhp8jhUV18exOCEl9zAdXckp5sVXGR2YM
	hRDrCKT5u0/y3hw9wYR9Sa7SBGfFcoOlsHIg7PAnkg5nbzjKljLmEDccyIlHETrwGvPbM/jssFn
	y+TcOVUdwYo6UAfCU
X-Received: by 2002:a05:600c:1817:b0:3da:28a9:a900 with SMTP id n23-20020a05600c181700b003da28a9a900mr5151728wmp.41.1677678604165;
        Wed, 01 Mar 2023 05:50:04 -0800 (PST)
X-Received: by 2002:a05:600c:1817:b0:3da:28a9:a900 with SMTP id n23-20020a05600c181700b003da28a9a900mr5151715wmp.41.1677678603817;
        Wed, 01 Mar 2023 05:50:03 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com. [80.187.122.219])
        by smtp.gmail.com with ESMTPSA id c20-20020a7bc854000000b003dd1bd66e0dsm15663143wml.3.2023.03.01.05.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:50:03 -0800 (PST)
Message-ID: <eae501c0-ae00-e357-e04d-d34832c5a85e@redhat.com>
Date: Wed, 1 Mar 2023 14:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
 <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com> <87v8jkk37n.fsf@suse.de>
 <87o7pck2o7.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87o7pck2o7.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8H5Zw/aa3Zdt

On 01/03/2023 14.43, Fabiano Rosas wrote:
> Fabiano Rosas <farosas@suse.de> writes:
> 
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 28/02/2023 20.26, Fabiano Rosas wrote:
>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>> host.
>>>>
>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>
>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>> test cases if TCG and KVM are missing.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> ---
>>> ...
>>>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>>>> index 3aef3a97a9..45490f5931 100644
>>>> --- a/tests/qtest/boot-serial-test.c
>>>> +++ b/tests/qtest/boot-serial-test.c
>>>> @@ -17,6 +17,9 @@
>>>>    #include "libqtest.h"
>>>>    #include "libqos/libqos-spapr.h"
>>>>    
>>>> +static bool has_tcg;
>>>> +static bool has_kvm;
>>>
>>> Any special reason for putting these here instead of making them local
>>> variables in the main() function?
>>>
>>
>> Yes, Phillipe was doing work in the same file and I put it here to
>> minimize conflicts.
>>
>> https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org
>>
>>>>    static const uint8_t bios_avr[] = {
>>>>        0x88, 0xe0,             /* ldi r24, 0x08   */
>>>>        0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>>>> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>>>>        const char *arch = qtest_get_arch();
>>>>        int i;
>>>>    
>>>> +    has_tcg = qtest_has_accel("tcg");
>>>> +    has_kvm = qtest_has_accel("kvm");
>>>> +
>>>> +    if (!has_tcg && !has_kvm) {
>>>> +        return 0;
>>>> +    }
>>>> +
>>>>        g_test_init(&argc, &argv, NULL);
>>>
>>> Could you please put the new code below the g_test_init() ?
>>> Just to avoid the problem that has been reported here:
>>>
>>>    https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html
>>>
>>
>> I could, but I don't understand why we need this. What does having
>> "code" before g_test_init() causes? Should I move the qtest_get_arch()
>> that's already there as well?
> 
> Oh, the issue is the early return? I guess it makes sense.

Yes, as far as I've undrestood the issue: If we call a function that starts 
a QEMU subprocess (like qtest_has_device() or qtest_has_accel()), then this 
could spoil the output since the TAP version from g_test_init() should come 
first.

qtest_get_arch() is not a problem, since it does not start a QEMU subprocess.

  Thomas

