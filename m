Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4891210ejc;
        Mon, 6 Mar 2023 09:06:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+4wHvNO0VLZmQd/+tufaaW/+A8WoH0mL4j6584bWI/VGeGRjdZFqlMz+LxZf6MAa/k6Zo2
X-Received: by 2002:a05:600c:3148:b0:3eb:3fea:a2ac with SMTP id h8-20020a05600c314800b003eb3feaa2acmr10192358wmo.22.1678122409437;
        Mon, 06 Mar 2023 09:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678122409; cv=none;
        d=google.com; s=arc-20160816;
        b=rIU5XZFmwamdZ1b9J2qtRp3oeohAEmeyPvTLml++CVtdVDJ4b4niBxMSaFwNNlknAc
         ZeDpdEQD+Oh+IWHtApwKLfQr5jgvc1numfAFAQSThOkBMxIiWtGCSo/YRhySHXwkCyb4
         6flPV4wcvKwdPh8jiywI5eJVTfm9Kc56Fxz58cQxk0wEcna//FhKyck2gvc/+mUPqYnw
         h91n3gS/QIuEv4Bmxhz9HcJYoa51FIy3Qr+Kn1QYA0S/BX+LqMXePpklcHjv/9Y7Ta5D
         tiHLbnqE95kft9k1XC/3k01Pn5iKdOa7asYzh98NTCVE8o+wicsWacnPl4VFNunGCUp4
         pXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=SY+TKppUIcSBDyyUoeQbDlkZUeIJF/QuMMulTiWFZWM=;
        b=tMqf8LXETMR4ynwJQUXa+pEs+Pci3WJQugPaEVi2HaaU1O1LupPrhQDgJnX8Bfgxvo
         JfX/vHcLjw6ztxu20syuU0CnnbUGnh0XSkvbJrV1GdCMq2O8+QWikCPpfX2qiJsDd+ys
         H8zPQHIQ5qrOdssP7qdIbFmlmLJ/f167JRTUnzVjYctp8Xn0aTQ0rSctly12TPbYva/o
         P8Xpgc1y8PF/eyfw7oO9y54erRKp1fdmgdK9fQujfbUTJvpEyIk0Xv0LGv2g/S8nEJ3O
         JBSAcdfQ701ms/5vN3cGn/4ISmo2f6hXrJS1fbA9fCTQH94OqDCwWDPTYghW8gp3zgcM
         T5HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="bwg/7eKH";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id i4-20020a05600c354400b003eaee9e0d31si10679319wmq.85.2023.03.06.09.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:06:49 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="bwg/7eKH";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDC231FDE3;
	Mon,  6 Mar 2023 17:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678122408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SY+TKppUIcSBDyyUoeQbDlkZUeIJF/QuMMulTiWFZWM=;
	b=bwg/7eKHQ/SijSmlNBTza/TrgfVVgyJIKJ199kCJDvJs3MXP/sRgUGMsiqtUwIhr6h1MUo
	HGWyn3MYrlAutn6/SxDD1OsRuF57wB6khVP8CUFOg208g3EQYkG9vZYrrlzhrkuMDn9SFv
	QUApvRhWTrPehsdFGfKKekgGQLnyPqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678122408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SY+TKppUIcSBDyyUoeQbDlkZUeIJF/QuMMulTiWFZWM=;
	b=KSkOPCDKvnUUDjZNfnAapupiAN6DqRdzUu3cdy/CV2oBvgw6tDUg3OUJx+zfeICnO7pELg
	0TENqACOa4ncc3AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7694B13A66;
	Mon,  6 Mar 2023 17:06:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EdT+D6gdBmTrZQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 06 Mar 2023 17:06:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to
 migration test
In-Reply-To: <CAFEAcA_aw6mc_FM00MqOcOzqFP=xktpq6+Z-_uhhEHKbw-bKNA@mail.gmail.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
 <87pm9pwnym.fsf@suse.de>
 <CAFEAcA_aw6mc_FM00MqOcOzqFP=xktpq6+Z-_uhhEHKbw-bKNA@mail.gmail.com>
Date: Mon, 06 Mar 2023 14:06:45 -0300
Message-ID: <87jzztstay.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 8QYzSw8iYjhR

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 3 Mar 2023 at 20:59, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
>> >>
>> >> The migration tests are currently broken for an aarch64 host because
>> >> the tests pass no 'machine' and 'cpu' options on the QEMU command
>> >> line.
>> >>
>> >> Add a separate class to each architecture so that we can specify
>> >> 'machine' and 'cpu' options instead of relying on defaults.
>> >>
>> >> Add a skip decorator to keep the current behavior of only running
>> >> migration tests when the qemu target matches the host architecture.
>> >
>> > I still don't understand this patch. Don't we run the
>> > migration-test on all hosts already? David ?
>> >
>>
>> We run on all hosts but for each host we only take the QEMU binary that
>> matches the host architecture. So if you want to test aarch64 migration,
>> you need an aarch64 host.
>>
>> If you run on an x86_64 host (without this patch):
>> $ ../configure #all targets
>> $ make check-avocado AVOCADO_TESTS=../tests/avocado/migration.py
>>
>> You'll see:
>>
>>  (1/3) ... migration.py:Migration.test_migration_with_tcp_localhost: PASS (0.21 s)
>>  (2/3) ... migration.py:Migration.test_migration_with_unix: PASS (0.18 s)
>>  (3/3) ... migration.py:Migration.test_migration_with_exec: PASS (0.21 s)
>>
>> All three tests ran using qemu-system-x86_64.
>>
>> The issue I'm trying to solve is that when run on a aarch64 host, the
>> test will fail because (being generic) it doesn't pass the '-machine
>> virt' option and there is no architecture-specific information in it at
>> all.
>
> But my point is that we already CI on aarch64 hosts, so what is
> happening there that means the test doesn't fail already ?
>

I don't see check-avocado on the custom runners job descriptions
(.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml). It seems we
don't run avocado there at all.

For the regular jobs, there's the avocado-cfi-aarch64 job which depends
on the build-cfi-aarch64 job that is being skipped at the moment. But
that wouldn't catch this bug because it runs on an x86 host and this
particular test gets skipped.
