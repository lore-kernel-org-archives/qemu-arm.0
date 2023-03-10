Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2128153ejc;
        Fri, 10 Mar 2023 09:05:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/YwespAxAPF3RdU0xBB8O06TQboKUQccqFcwhVU02x8f7qszhNd2wl2umDIQwz+nLzY4G4
X-Received: by 2002:a5d:4991:0:b0:2c7:1c08:121a with SMTP id r17-20020a5d4991000000b002c71c08121amr17403140wrq.68.1678467930592;
        Fri, 10 Mar 2023 09:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678467930; cv=none;
        d=google.com; s=arc-20160816;
        b=bVDDaN3t08SUCEzSB8LF+fHl7JHxnAePxleOQGtnEk3IraJEslUUaoxFlxm/D6gVU6
         eaawE3PmgRE7voyzIv9rZ88nDRXLmBdAckPJDjwLLQOKPjsNP96WpqtkBDF7kVECq59A
         k+aOnbqnWaHaczMTQQkCRdVwUTlJGZBQgIvL/f35mDtbiWc9/T+xW8BFIW8OqldixZr5
         oSJbeCzVM5ahevpVilG0v9jGbXUiSPIBtcydBV2GAJBsc2VbQ1oGO7zueOaM54bI34zm
         NW5Jz24kLvYHS2hr/scSWapi7UQNlxa5h4kgU55hHR5WJGzapPgtH+6b2oxT2Qkof35C
         X1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=EVAncZNqBk0mUyNzcMeXhZeJGn2eDOMqwSw7/zsFTrw=;
        b=FF5DOzuf+kqGBZDGuAsq1yltEx7OS0DaZxMrlgOfxB9Bp9XMQuyMdEfdteNOXYk9/z
         iZWQfxkutus0aI1McL0qBUrZoObRmGChrQRol1MpFZES0BidL/pXY1cyRWsHug4Kmcsq
         yAMQZj1YpWFQiBOlt6KwqmXzgzZkhK/CGQO1whGacE7amB5u4nVfoXNmO4YzIv9BZC52
         hWHQz1OgKbvUqC7SFIl1of1wEJL9wwlO69jXnD3kghd32PBYfUavNan4pLudy/6pb6qQ
         kDveizSXh27XD6p0KnJcG6UGCqb4RFYieMtwzQ2MKKhjozX1gteXyzX8z6FmB/o8Js4b
         49gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E1WgNLyh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id b15-20020a5d40cf000000b002c5544ace5bsi254815wrq.583.2023.03.10.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 09:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E1WgNLyh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAFE320660;
	Fri, 10 Mar 2023 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678467929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EVAncZNqBk0mUyNzcMeXhZeJGn2eDOMqwSw7/zsFTrw=;
	b=E1WgNLyhN6OVC/xv3sWK7opWClOISjb7MVWQ2PzCWEmaVtKxyFvfPQyz1Y876VD2yjbVTc
	BklwJAD6ebHrtotQtRj3s/3wf+Bf+DwleuZDXYAEmgX0M07VYjmJKbLQVBmL8BEb9Mt+e+
	rMai62YuHKai3ad13AoAEZWREh7yq04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678467929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EVAncZNqBk0mUyNzcMeXhZeJGn2eDOMqwSw7/zsFTrw=;
	b=UkJIuEqkuchUa8hY2PWuCy5IQmTsFm3ABRqbZh5h+/OXzcYUHyMPJJlyQGUv8AQWKetgBV
	WqrfA/SlaqdNi0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D11B13592;
	Fri, 10 Mar 2023 17:05:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FSO4AVljC2Q5NwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 17:05:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <dc35fc70-c609-09db-15f1-e59933cb1afd@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
 <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com> <877cvoehxo.fsf@suse.de>
 <dc35fc70-c609-09db-15f1-e59933cb1afd@redhat.com>
Date: Fri, 10 Mar 2023 14:05:26 -0300
Message-ID: <87zg8kczah.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 4c9nCk3OWKLu

Thomas Huth <thuth@redhat.com> writes:

> On 10/03/2023 16.37, Fabiano Rosas wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> On 10/03/2023 14.06, Fabiano Rosas wrote:
>>>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>>>
>>>>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>>>> host.
>>>>>>
>>>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>>>
>>>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>>>> test cases if TCG and KVM are missing.
>>>>>>
>>>>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>>>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>>>>> printed before other messages") to avoid TAP parsing errors.
>>>>>>
>>>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>>>
>>>>> I don't like it that we are hard-coding the list of accelerators
>>>>> like this. Make a wrapper?
>>>>>
>>>>
>>>> Are you thinking of some sort of "has_any_accel" wrapper?
>>>
>>> I think in the long run, we want something like what I described here:
>>>
>>> https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/
>>>
>> 
>> Wont't that function be too generic? The choice of accelerator is quite
>> specific to each individual test, some might not work with TCG, some
>> might not work with HVF and so on. There is no link between build-time
>> configuration and runtime test execution after all. We could always have
>> a build without an accelerator and then try to run a test that uses that
>> accelerator. And also have an accelerator present that the test does not
>> support at all.
>> 
>> 
>> For this particularly bizarre case of not having TCG nor KVM in the
>> build I'm inclined to go with Michael's suggestion of checking it at
>> build time and skipping all the hassle. This is what I'm preparing:
>> 
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 29a4efb4c2..e698cdcb60 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -27,6 +27,12 @@ if config_host.has_key('CONFIG_MODULES')
>>     qtests_generic += [ 'modules-test' ]
>>   endif
>>   
>> +# For x86_64, i386 and aarch64 it is possible to have only Xen as an
>> +# accelerator. Some tests require either TCG or KVM, so make sure they
>> +# are present before building those tests.
>> +tcg_or_kvm_available = (config_all.has_key('CONFIG_TCG') or
>> +                        config_all.has_key('CONFIG_KVM'))

Ouch, this doesn't work because one of the binaries could still have KVM
support and we build the tests only once.

On an aarch64 host:
---disable-tcg --enable-kvm --enable-xen =>
qemu-system-aarch64 w/ Xen, KVM, no TCG
qemu-system-x86_64  w/ Xen, no KVM, no TCG
