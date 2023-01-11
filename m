Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3957722ejc;
        Wed, 11 Jan 2023 04:36:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuTpVCMoR5XSbkI06o65LB345Xyr7pBO5/iGl1NHUxia7fz3y3lDfmt+erXvBDyOnvCYREX
X-Received: by 2002:a05:6000:257:b0:2bd:c6ce:7bfb with SMTP id m23-20020a056000025700b002bdc6ce7bfbmr951708wrz.28.1673440607494;
        Wed, 11 Jan 2023 04:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673440607; cv=none;
        d=google.com; s=arc-20160816;
        b=esi+4sgMKXPb9PBChAAU/0+F1Mx4NgWkQWWq2F5EvPy1+v3wNdR4oKdNt2NEQ0NlNe
         XrijlCv98SsWziSJux/rJk8BZZLwqsfnUKLsqjMRMbMyc9ORDshZ8felfMnAD52nExFn
         zpDmY1gbm26Dt0IZ8HdJFVySuNh80B0AdeO/ta7JwvXR37vNuOV52r+kZYLeMxzmi9kp
         qJdnwTHtlYlyxLsOqSiBkMlbQrShMM+QcIEyoGO8BABFlQ/2xGEM/JboV1ux3TvLZPMP
         Trjt51AqRPvemq4z1wcbyI6/c53Vn5pLi6THRH3SaeVKeN9BSYdiJCmdTSDGVuLCJ84N
         GFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=o7+hc/DFjslwrESw5agfyTFCIkxacbwjNjx4lyXZbpM=;
        b=IQxgsSaHQV4rGnOfgbg74g1x65JHIyF+Wpwda5fQa54UkFE5G58jZ4grpLA60Cu3A1
         /fr0cXviG4LSK0Pn6HQVBV1d16PZmOLHb9GCy2rG1W7ul+V3aAnnkW7R0BHLVovaTIP7
         LQ93nLCPNHOv22pKV0+l/hAA6kxcwe2edHxMsgPv6E7gY1mLh8NmI/s86hUlBxBTgaHJ
         Dd4qqci3w+mNjHEx+2KtYxOLB+eN6GFQEJhQBDiVT8o2SL/vQF61j/WiDhva0lTV5KCp
         ZoPGhdTzqVDUG8NwboYi3VnbQet0bYx8/vx7c/oGJSdaryjiMfg1OSajiDczqNHjqKuN
         EkRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rMURa6f+;
       dkim=neutral (no key) header.i=@suse.de header.b=DJkV+XDh;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id u6-20020a056000038600b002bc7d10a3fasi6080127wrf.332.2023.01.11.04.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rMURa6f+;
       dkim=neutral (no key) header.i=@suse.de header.b=DJkV+XDh;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBA527593F;
	Wed, 11 Jan 2023 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673440606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o7+hc/DFjslwrESw5agfyTFCIkxacbwjNjx4lyXZbpM=;
	b=rMURa6f+YYpM4kpj0XrLxuFq2uYH4JtmcZDiKC+61MNZMYh16QePKUM+lG7rKMXlCI7aMS
	H0Cwo7NgoyXsye+AB7tOVM50DaOduMP7qDkD2swPUBO2z49NFY2rCMZ9iuuaY4EWGjsYoE
	G0/7w9+r6VbktnA3fQNZ78Kw1TKJ0dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673440606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o7+hc/DFjslwrESw5agfyTFCIkxacbwjNjx4lyXZbpM=;
	b=DJkV+XDhpUkb6QoJ/td1s/muOmB4QV09Tbfta3NlF/4fhli+Vl4CQdhTqLyW3dxn+Kt+WW
	x5TIa6BcpYIeP7Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66DB313591;
	Wed, 11 Jan 2023 12:36:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Gj3QC16tvmN3TgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 11 Jan 2023 12:36:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Laurent
 Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
Date: Wed, 11 Jan 2023 09:36:43 -0300
Message-ID: <87fschcko4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 7emTcxA5Z6sm

Claudio Fontana <cfontana@suse.de> writes:

> On 1/10/23 15:02, Peter Maydell wrote:
>> On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>>>>
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>
>>>>>> On 09/01/2023 23.42, Fabiano Rosas wrote:
>>>>>>> From: Claudio Fontana <cfontana@suse.de>
>>>>>>>
>>>>>>> on ARM we currently list and build all machines, even when
>>>>>>> building KVM-only, without TCG.
>>>>>>>
>>>>>>> Until we fix this (and we only list and build machines that are
>>>>>>> compatible with KVM), only test specifically using the "virt"
>>>>>>> machine in this case.
>>>>>>
>>>>>> Why don't you fix it immediately? ...
>>>>>
>>>>> My idea was to have in this series the minimum to unbreak the
>>>>> --disable-tcg build and later bring the rest of the changes
>>>>> incrementally.
>>>>
>>>> This test is basically checking "all the machines should
>>>> work". That's an important invariant to maintain, so
>>>> I don't think we should just skip it for Arm targets.
>>>
>>> But what does "all machines" mean in a no-TCG build? The original intent
>>> of the patch was that only 'virt' should be present and therefore the
>>> only one tested.
>> 
>> It means "every machine the user can create". If the
>> machine can't run then either we shouldn't compile it
>> in, or else we should be compiling in enough extra stuff
>> to allow it to work.
>> 
>> -- PMM
>
> Hi,
>
> once upon a time there was a series by Philippe to accomplish that (KConfig) right?

Is this it?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html

I have now moved the cpus into the tcg directory:

# ./qemu-system-aarch64 -cpu ? 
Available CPUs:
  a64fx
  cortex-a35
  cortex-a53
  cortex-a55
  cortex-a57
  cortex-a72
  cortex-a76
  host
  max
  neoverse-n1

What remains is changing the Kconfig to not bring all the
machines. Nowadays for KVM is the 'virt' machine the only one we use? I
did some tests yesterday by keeping only CONFIG_ARM_VIRT and was left
with this:

# ./qemu-system-aarch64 -machine ? 
Supported machines are:
none                 empty machine
virt-2.10            QEMU 2.10 ARM Virtual Machine
virt-2.11            QEMU 2.11 ARM Virtual Machine
virt-2.12            QEMU 2.12 ARM Virtual Machine
virt-2.6             QEMU 2.6 ARM Virtual Machine
virt-2.7             QEMU 2.7 ARM Virtual Machine
virt-2.8             QEMU 2.8 ARM Virtual Machine
virt-2.9             QEMU 2.9 ARM Virtual Machine
virt-3.0             QEMU 3.0 ARM Virtual Machine
virt-3.1             QEMU 3.1 ARM Virtual Machine
virt-4.0             QEMU 4.0 ARM Virtual Machine
virt-4.1             QEMU 4.1 ARM Virtual Machine
virt-4.2             QEMU 4.2 ARM Virtual Machine
virt-5.0             QEMU 5.0 ARM Virtual Machine
virt-5.1             QEMU 5.1 ARM Virtual Machine
virt-5.2             QEMU 5.2 ARM Virtual Machine
virt-6.0             QEMU 6.0 ARM Virtual Machine
virt-6.1             QEMU 6.1 ARM Virtual Machine
virt-6.2             QEMU 6.2 ARM Virtual Machine
virt-7.0             QEMU 7.0 ARM Virtual Machine
virt-7.1             QEMU 7.1 ARM Virtual Machine
virt-7.2             QEMU 7.2 ARM Virtual Machine
virt                 QEMU 8.0 ARM Virtual Machine (alias of virt-8.0)
virt-8.0             QEMU 8.0 ARM Virtual Machine
x-remote             Experimental remote machine

But qtest dislikes that even more. I need to figure out why.

The approach of that series seems interesting, moving CONFIG_FOO=y from
default.mak into Kconfig as 'default y if TCG'. Maybe that will yield
better results, I'll try to follow that route.
