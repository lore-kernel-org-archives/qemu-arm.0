Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6965770ejc;
        Wed, 1 Mar 2023 05:31:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9u2VgbVaEqtB933Len/gyAEdN6L9Hh0HGf5F8UrkqPbKc6stkLeFYBC9ETBhRFNv8f3cPM
X-Received: by 2002:adf:ce10:0:b0:2c7:e05:2d1b with SMTP id p16-20020adfce10000000b002c70e052d1bmr5079608wrn.50.1677677503774;
        Wed, 01 Mar 2023 05:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677677503; cv=none;
        d=google.com; s=arc-20160816;
        b=IYV9QPHRy5auF2j8x3rJl5hlCtNICgGwtIBLKwBhCJlsTP65+dYmCKDpzUI+kl1vMn
         le+k7c0DezhOYSmLt7lQojg7evVQKRe2ULKenTAHKHBurTrEF1+z+u5+4mdC19PUKSVY
         e0cEG9s7ukZawrFUqsBhvFzwXuCjpJ+avvX9hxVASOogICHjSDDIzCtga8ZEQi4SGuW0
         xci4ZC0RjTHt5TDSKDyHM/9Hm03j/RwXMCRjsAPDVxtTTbPNK00Afw57BU5bHAcBh4sO
         di7GEPMp5hCx5PTlrmFN85rvJpb2P0n60THueRNyFBjEo+tFtDm0YEGIy6aS4PoPZDe3
         vuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=6VQYdMFvHstlwEIjDgGv8K4OCyV74uU2y1WlLgWMGC0=;
        b=bWEbGj3dgju/fKVa9EPRdsa+SzMg6nh8Fav2acofCcB3s5QbNYYS+ETo4TtMWwiFrP
         E4mrUrYiybVaYHDqc/m/Q+M3eU7twNIah6+2HkIbEfsM/Uh/OxOyiCbY65u4hZlDYP68
         xYAXcRzC0GlT6h0H3KqtpjWnCGAUu9jiFz/xZ1cKuRGwYTx8hKFJ0MVZU+fBEpXZT8IS
         ZY2CZWCvS9lpWxzPwkK+seDn09dJ1VuhHehHr+zbJT/aKLCGmDmz2sdhX84BaQQ1Nl6x
         9/BFKein+MtO1s1C4t5hk1kV8JOrAF6b+2xQ5hKEjOxp9X++1o53252RHqhZouTCw1gp
         axRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xZQmeGyc;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id k2-20020adff282000000b002c54eca9f49si11944022wro.1003.2023.03.01.05.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 05:31:43 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=xZQmeGyc;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1CEFA1FE14;
	Wed,  1 Mar 2023 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677677503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6VQYdMFvHstlwEIjDgGv8K4OCyV74uU2y1WlLgWMGC0=;
	b=xZQmeGyctAUwtU6tqcjnCjz9RFKq+LNPfShkiELj846u99LrMMHKHc1VQeQjWO1rclbdMJ
	2e9gwzz6ZQM7i0ptp9NzT+s3xa5TYBTu952ebz5ubeszl+s5nGczAsxm1DEBcchseN4TZ6
	pUcWRFODmkNXVUZX/6W0vjzFB3aPwLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677677503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6VQYdMFvHstlwEIjDgGv8K4OCyV74uU2y1WlLgWMGC0=;
	b=7z9lC47ScL8RQM2USWoI1/tvh9yYD+kxukRdYWU1u0BwcVGB+rnd6HkcMu2uiZ5GjFDRR1
	Id/yLZQnlZKSqeAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 946EA13A3E;
	Wed,  1 Mar 2023 13:31:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xK1+F75T/2PiFgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 13:31:42 +0000
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
In-Reply-To: <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
 <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com>
Date: Wed, 01 Mar 2023 10:31:40 -0300
Message-ID: <87v8jkk37n.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: oJBG+YilgbwS

Thomas Huth <thuth@redhat.com> writes:

> On 28/02/2023 20.26, Fabiano Rosas wrote:
>> It is possible to have a build with both TCG and KVM disabled due to
>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>> host.
>> 
>> If we build with --disable-tcg on the aarch64 host, we will end-up
>> with a QEMU binary (x86) that does not support TCG nor KVM.
>> 
>> Fix tests that crash or hang in the above scenario. Do not include any
>> test cases if TCG and KVM are missing.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
> ...
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>> index 3aef3a97a9..45490f5931 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -17,6 +17,9 @@
>>   #include "libqtest.h"
>>   #include "libqos/libqos-spapr.h"
>>   
>> +static bool has_tcg;
>> +static bool has_kvm;
>
> Any special reason for putting these here instead of making them local 
> variables in the main() function?
>

Yes, Phillipe was doing work in the same file and I put it here to
minimize conflicts.

https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org

>>   static const uint8_t bios_avr[] = {
>>       0x88, 0xe0,             /* ldi r24, 0x08   */
>>       0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>>       const char *arch = qtest_get_arch();
>>       int i;
>>   
>> +    has_tcg = qtest_has_accel("tcg");
>> +    has_kvm = qtest_has_accel("kvm");
>> +
>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>       g_test_init(&argc, &argv, NULL);
>
> Could you please put the new code below the g_test_init() ?
> Just to avoid the problem that has been reported here:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html
>

I could, but I don't understand why we need this. What does having
"code" before g_test_init() causes? Should I move the qtest_get_arch()
that's already there as well?
