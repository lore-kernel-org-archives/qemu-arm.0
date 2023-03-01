Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6973045ejc;
        Wed, 1 Mar 2023 05:43:24 -0800 (PST)
X-Google-Smtp-Source: AK7set83I+eQIzwWSkYmrCiWxvzJDUR62nUgiE24QuZLfx5xIzHCImmgLGdy+KjbavvTCcZ2k5ja
X-Received: by 2002:a05:6000:1b81:b0:2c7:e26:97c2 with SMTP id r1-20020a0560001b8100b002c70e2697c2mr4785387wru.33.1677678204555;
        Wed, 01 Mar 2023 05:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677678204; cv=none;
        d=google.com; s=arc-20160816;
        b=tI3LcRBnEVSc3DCZvQGtTfoY2Hx8Z2QksFwbw3IJeSuDctrq5oeGodv7wjsRz+MokD
         wst7h+YkxmwtFHmOvUQsblX5ZvuirrfoflY6gw/JbQ8Kr76dfvFt2Zsizo6uRRd6RpFO
         hS1e6q49GI1241A38scejayMO7zgmXBwIbf4KGwRCBMk8KAJwoLYzWgNpDhK/E0dxn1g
         Y3W7L3N1L6hSdFXRH0lFptqCMYDa3YyrIbK65/x275zHnZTwRiLVIYhKSJup04A5ifFl
         gUiyI5rRVC8Y7f1103JsH3Vf3twJxDOj1XEfJ6AHyCE7QPCrwEPUWxJa8ajSH/nijUNF
         qp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=q2cQhrtzPh68xvCEtMo+2lOAGLfGo7T8/hYfaExXG0k=;
        b=cbxwQ69lvXdDYuaPY9RGvROWtx/3IK6jZjD0PNQXTI1pQ3WucSagr7Sxm41MNa+9ej
         5tc0W22ZONXU+Qlsi7G+y6ChQTC7m0TodHddLPaKl3zKaophicrM84ln9F7bhiU6MlVk
         1AcjPOBsQBK0ubwze2Q2G5UCtP194aKritPtOoCx3ZYKTCuW0jpc+kQ7h3/FQMVdPcuu
         Xx7SvgpauKGj0jX705j5Fjujb/uln2scDpZpniAiNtK5OYVjQQ1Gmu1acgukC/jF3WYB
         NaZaBwo62kbl0zHUgHyW910ZXYLF4NWXLBaO9PWp4JP3Xy4xlJiH99EOQ12St2ILdtox
         spsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QBV5dztP;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id h12-20020adfe98c000000b002c3bec9168bsi11505237wrm.769.2023.03.01.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 05:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QBV5dztP;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D8FE41FE14;
	Wed,  1 Mar 2023 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677678203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q2cQhrtzPh68xvCEtMo+2lOAGLfGo7T8/hYfaExXG0k=;
	b=QBV5dztPy0+2isxcwS5XREIsEdOEdxDQWacC4fwaM96kp27xJm3cbfN0lNb5UtcncrTr5f
	DQC8SdHqA2YiALAIwhLp9E1aglM7pgO6VssF7MIQISR5Z3cqxvHdACTYevQ1tmNZ8OlGKx
	nWjnX0F0hli54QjOVM4TRoWiyYe/5f4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677678203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q2cQhrtzPh68xvCEtMo+2lOAGLfGo7T8/hYfaExXG0k=;
	b=/zkKMxWqq3MwMzquArMUNVroZWYdGOs1oBamfcL/j6/WasA+YH/DDOx8Lyi444tVdYeyGO
	VbWiuIESfKRGBzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C34B13A3E;
	Wed,  1 Mar 2023 13:43:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 31f/CXtW/2NoHgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 13:43:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent
 Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <87v8jkk37n.fsf@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
 <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com> <87v8jkk37n.fsf@suse.de>
Date: Wed, 01 Mar 2023 10:43:20 -0300
Message-ID: <87o7pck2o7.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: ucv+cXlhjl+i

Fabiano Rosas <farosas@suse.de> writes:

> Thomas Huth <thuth@redhat.com> writes:
>
>> On 28/02/2023 20.26, Fabiano Rosas wrote:
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
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>> ...
>>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>>> index 3aef3a97a9..45490f5931 100644
>>> --- a/tests/qtest/boot-serial-test.c
>>> +++ b/tests/qtest/boot-serial-test.c
>>> @@ -17,6 +17,9 @@
>>>   #include "libqtest.h"
>>>   #include "libqos/libqos-spapr.h"
>>>   
>>> +static bool has_tcg;
>>> +static bool has_kvm;
>>
>> Any special reason for putting these here instead of making them local 
>> variables in the main() function?
>>
>
> Yes, Phillipe was doing work in the same file and I put it here to
> minimize conflicts.
>
> https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org
>
>>>   static const uint8_t bios_avr[] = {
>>>       0x88, 0xe0,             /* ldi r24, 0x08   */
>>>       0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>>> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>>>       const char *arch = qtest_get_arch();
>>>       int i;
>>>   
>>> +    has_tcg = qtest_has_accel("tcg");
>>> +    has_kvm = qtest_has_accel("kvm");
>>> +
>>> +    if (!has_tcg && !has_kvm) {
>>> +        return 0;
>>> +    }
>>> +
>>>       g_test_init(&argc, &argv, NULL);
>>
>> Could you please put the new code below the g_test_init() ?
>> Just to avoid the problem that has been reported here:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html
>>
>
> I could, but I don't understand why we need this. What does having
> "code" before g_test_init() causes? Should I move the qtest_get_arch()
> that's already there as well?

Oh, the issue is the early return? I guess it makes sense.
