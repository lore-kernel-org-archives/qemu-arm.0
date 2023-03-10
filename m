Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2023170ejc;
        Fri, 10 Mar 2023 07:18:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9HOZGx7dAKA9wZWIrIaEMZHwm1/tnVUvLUHawaknDzmFSYfWHLLJTMY7v0FgLnLFNeE36G
X-Received: by 2002:a05:6214:2aaf:b0:56e:a832:928 with SMTP id js15-20020a0562142aaf00b0056ea8320928mr4190498qvb.24.1678461482931;
        Fri, 10 Mar 2023 07:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678461482; cv=none;
        d=google.com; s=arc-20160816;
        b=KdCsloXRaeV1mlsisGu99cakgmCWR7/Cj5vH2/9Kf0Q0RxUFSgTH5LL/rQ6FMoFgT9
         cQoyfrmCokI8PFh8tswukvgiG0ViFGK3AaB8anP/PTVw3MQEESkbFmHYNhhIoMSQNTPm
         m1cGCmWlljvgC7uXui2jpIj+OCjDnpDXO28DXxp9c/44/G2XUYtBQuQBuWuR+Q5sqbJz
         kXYcjIe60BzRQAvx8CXnnAZsrASGFdCmeXTuDQWaG18QMZVxLeRlPNPGO7Kv6WkoYEnU
         kdy9wHaoIR2ESZVLqWw/ytw7F3I/zJjZCIqG6OfamP4qdESg0JXOKwhiKAVgdlAyPp+t
         pk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r4duduEoAxMdu33kZxVuJL774cJlzxpw+p9v3Ihfwfc=;
        b=dwKa4HjyeS1BeWxdwzK+oyDuLCSWymCGs7vUN85BX6MMLAWe8Bp+SaKXJLqSgvSCwi
         o9CnCR4KFMivFOcpRnyoSNpDM6AVPg3H6cH1Ub3TKepHfiyrga+Hho4Sj3cyckTcHMDD
         vXb+64uk4TRgVNJrlJ4XTK35q9IGE0lFodvWVSpoitMdibBUzJjyM3B1tp1PdfbbRyMk
         jBgB6ERMtT+oeM1KQX/APYLBKw1hPMKhQQSuhlKAZT4AWkO2iJ9zvZYVutHoJiYWQMWM
         YkyCS8vENv3lZwnCfnCqkRfliC5B64kzIvyE7v0kJrKKGxpDBseR+vF3nazRSX2qkeOu
         zmgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=atW7uGBS;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y79-20020a376452000000b00741524b75e7si1519094qkb.686.2023.03.10.07.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:18:02 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=atW7uGBS;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678461482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4duduEoAxMdu33kZxVuJL774cJlzxpw+p9v3Ihfwfc=;
	b=atW7uGBSDYXqXs6YN/cOn1+ZiwsEjzsV6BiMuKKAazw6CUKMLrLEz3ZmofxUerPa+TRel3
	GkzPWxf5jm41itdZ/37qrdg0R7A4O3BxJmb9DKjaVWshZdeDNKQz+2jztlldBQhJejTLF/
	+52AJhIlrL583vSFgE3mIlCm/tEripY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-wcr4ihzeNLCzfsm4_sgyKA-1; Fri, 10 Mar 2023 10:18:00 -0500
X-MC-Unique: wcr4ihzeNLCzfsm4_sgyKA-1
Received: by mail-wm1-f72.google.com with SMTP id s18-20020a7bc392000000b003deaf780ab6so2096522wmj.4
        for <alex.bennee@linaro.org>; Fri, 10 Mar 2023 07:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678461478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4duduEoAxMdu33kZxVuJL774cJlzxpw+p9v3Ihfwfc=;
        b=WW8gePlihaF8ybO8hrqT/Qu0OOTSnxMHg1c6EYxEvoJD20xiYqf2rPgSuXGUs/BVFz
         cCHzn+DCD37kr1ziljZUPk9R8ehCkTlxuyej+Nbvr3CpnvpjE3IlY7eUySQKqop5OG8m
         qxmdeC/lyh7wS4lzTSjAB9xqOzRbsJ1+33S7jyvbuzYcPt8MEqW7VyQRikGR5dsyHX6H
         H6t7vsELTpYs+Xg82wcJHxu4GeecwLofYBy9UDEMrp7KCI622tFmQVsDkqujcnvAgyQp
         Z5W0rJwHJSIInrW9Uo5CEkfZnUmQDgY79A69LmgrWFCSaooJT3ktdBu6w2wtwo3Cs3hF
         869g==
X-Gm-Message-State: AO0yUKVykwaHpQh1CAQUPp70GFZe+jXU+5HTy/6bdP8mQ8/hBjCjJmi6
	W7HXCPaEEcxSkn+yxBfBQUggUtsMUhiYZWWztbF6qPpy93X8eYsvzKw5MU8QYr64K+Y+Ou/xed1
	LzWYNzZI5pcf9da9x
X-Received: by 2002:adf:f812:0:b0:2c7:17a2:b70 with SMTP id s18-20020adff812000000b002c717a20b70mr16624214wrp.69.1678461477898;
        Fri, 10 Mar 2023 07:17:57 -0800 (PST)
X-Received: by 2002:adf:f812:0:b0:2c7:17a2:b70 with SMTP id s18-20020adff812000000b002c717a20b70mr16624198wrp.69.1678461477607;
        Fri, 10 Mar 2023 07:17:57 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.2.110] (p549d1c92.dip0.t-ipconnect.de. [84.157.28.146])
        by smtp.gmail.com with ESMTPSA id r12-20020a5d494c000000b002c59e001631sm41201wrs.77.2023.03.10.07.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 07:17:57 -0800 (PST)
Message-ID: <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com>
Date: Fri, 10 Mar 2023 16:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
To: Fabiano Rosas <farosas@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87h6useoxy.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +2wb/KRsX6iU

On 10/03/2023 14.06, Fabiano Rosas wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>> It is possible to have a build with both TCG and KVM disabled due to
>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>> host.
>>>
>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>
>>> Fix tests that crash or hang in the above scenario. Do not include any
>>> test cases if TCG and KVM are missing.
>>>
>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>> printed before other messages") to avoid TAP parsing errors.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>> I don't like it that we are hard-coding the list of accelerators
>> like this. Make a wrapper?
>>
> 
> Are you thinking of some sort of "has_any_accel" wrapper?

I think in the long run, we want something like what I described here:

https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/

>>> @@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
>>>   
>>>       g_test_init(&argc, &argv, NULL);
>>>   
>>> +    has_kvm = qtest_has_accel("kvm");
>>> +    has_tcg = qtest_has_accel("tcg");
>>> +
>>
>> why are you moving these? init at declaration time is
>> generally cleaner.
>>
> 
> Thomas had asked me to put calls to qtest_has_accel after g_test_init. I
> just brought the existing one along for consistency. From the commit
> message:
> 
>   "Make sure that calls to qtest_has_accel are placed after g_test_init
>   in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>   printed before other messages") to avoid TAP parsing errors."

Right, otherwise this might cause problems with the latest version of glib 
(in Fedora, I think).

  Thomas
