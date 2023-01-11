Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3937981ejc;
        Wed, 11 Jan 2023 04:08:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt3XNJjCzEPLcHwasT1S16fgIoXIH+0SQrKuv267dsBAOuobCJuamxOqfMSALAK53mP3le3
X-Received: by 2002:a05:6000:810:b0:29f:9832:ff96 with SMTP id bt16-20020a056000081000b0029f9832ff96mr21566313wrb.2.1673438887642;
        Wed, 11 Jan 2023 04:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673438887; cv=none;
        d=google.com; s=arc-20160816;
        b=SMG3MMVryJ2ZadUqmk1Hk9DU4uPKDM+bThSqxCLr6RldosNrz1OvbnOT1sK/hWGqER
         G3QV+ERQK0E1wc1bqt5eYwlGnbDrVurx05ujk8vp+I1GvkVuNfZFderVVqXQm6sXmr1R
         E2H74301/OVtOV6q8PyivdPwIUMT7ITknN0D/CKlaH7VtraDBTFB+NCzP6zmc6KkEBOm
         83XREsR666hh4x425G/Qg9y5778DzC/CgEzYC+sdvF3VMed5jZ3tuHqZ6lBueqCDYj1d
         inzO/vlnX65ytKHnKclWfsOJABorfS5yBYt9iBx2kzrtDGsK8H0UOqCbJ8WZZqjOuQa4
         soZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=+OR3He0NQHqUZ71pQDPF0fMGBuClDLcbxvhTMHf2g0I=;
        b=CE7YuqQcqcc0JmPJxxcncJu7ESy3Uyroac7hsOF+Jir8WvtDpRbKY9YNJUqDwvDGAP
         /eoLkHt9IDsAZfkN5tyPk5L2rSHnlX8L/z5LwIh8+g5jD7EC3FjiU7W7n081rOM8UZMs
         6HX3flSCs10IeTRJNkluKV9lm5bNLUsHBy/F1+zOJlx14238w6gaqRoxEz84kadIQTpE
         faKjlAfswuurqg08sC5bG5232IfWZLF2fqQFir4aLGShhSyP549PP9xRcujCNURsrahs
         KlOlnltOuuISvEzjoipf2ZmMYI7ho9mc8aXDeiFtuc9BPju/SjUc8MvVjjM0ZmcJHyR5
         CJXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=sbTaLm50;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id bo19-20020a056000069300b00284d336236dsi12187500wrb.54.2023.01.11.04.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=sbTaLm50;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B4A847FD;
	Wed, 11 Jan 2023 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673438886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OR3He0NQHqUZ71pQDPF0fMGBuClDLcbxvhTMHf2g0I=;
	b=sbTaLm50Rsh5Mv0il7T7jySdjvRisyGi14jR0VN/Xm7CrKiz+LBtQcthYbL+L+oR1Re035
	F0iFoT02RFzWIoGcnIMcqmf/8YFSWc4j3Fy5DTNAwmbmi0FJ/Dfo963YnGnJln+oUUXT8d
	eFEQImT62W/lcf5x7FQAvR2zV5wthAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673438886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OR3He0NQHqUZ71pQDPF0fMGBuClDLcbxvhTMHf2g0I=;
	b=0kETKk1rKQ6k/+dAAEEtmE5Odyyby8CgUVbRjYFwJ1SDJTDyQ/ZG3DWNmiko3ZkxH01wwj
	rHP9SAq+QK4P9zBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFA201358A;
	Wed, 11 Jan 2023 12:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0VNDKaWmvmP8PQAAMHmgww
	(envelope-from <cfontana@suse.de>); Wed, 11 Jan 2023 12:08:05 +0000
Message-ID: <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
Date: Wed, 11 Jan 2023 13:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: oZKNpOR9BH9t

On 1/10/23 15:02, Peter Maydell wrote:
> On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>>>
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> On 09/01/2023 23.42, Fabiano Rosas wrote:
>>>>>> From: Claudio Fontana <cfontana@suse.de>
>>>>>>
>>>>>> on ARM we currently list and build all machines, even when
>>>>>> building KVM-only, without TCG.
>>>>>>
>>>>>> Until we fix this (and we only list and build machines that are
>>>>>> compatible with KVM), only test specifically using the "virt"
>>>>>> machine in this case.
>>>>>
>>>>> Why don't you fix it immediately? ...
>>>>
>>>> My idea was to have in this series the minimum to unbreak the
>>>> --disable-tcg build and later bring the rest of the changes
>>>> incrementally.
>>>
>>> This test is basically checking "all the machines should
>>> work". That's an important invariant to maintain, so
>>> I don't think we should just skip it for Arm targets.
>>
>> But what does "all machines" mean in a no-TCG build? The original intent
>> of the patch was that only 'virt' should be present and therefore the
>> only one tested.
> 
> It means "every machine the user can create". If the
> machine can't run then either we shouldn't compile it
> in, or else we should be compiling in enough extra stuff
> to allow it to work.
> 
> -- PMM

Hi,

once upon a time there was a series by Philippe to accomplish that (KConfig) right?

Ciao,

Claudio





