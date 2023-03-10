Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2180147ejc;
        Fri, 10 Mar 2023 10:00:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9JoWrN1shi4lVoDtIPJ1Lh6IR1iOCu3D0w3YCK/rB1KpBI+p8KYHJ+wMghFHQS6/5h40Ce
X-Received: by 2002:a05:600c:3b04:b0:3e2:147f:ac16 with SMTP id m4-20020a05600c3b0400b003e2147fac16mr3624589wms.10.1678471224023;
        Fri, 10 Mar 2023 10:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678471224; cv=none;
        d=google.com; s=arc-20160816;
        b=nd2VjNBemixlmggfR0Ckfe6ti3d2B6BXa7KSmEzljiFI6/prTfNY+ApFvwvnSGRyNV
         T44AON8OoizkvByGdXHmxvb7/EsPwjUy++j2CKGGLEERUobMq84SCqMrzba48Lntz+sV
         n408qIQiHVqPsxjyEfG8yQ+5Ah3mQoLIiUegXTzi7rbDHArzPa2J9oqQUmj3st9rnpYW
         j8re7v4NbNive9ozpWg4NtT27LU0c/eezl8mW82qchHvV/5coUypXUe1+yvZE0jnvNWr
         OMpzQDlKDFpC0co/f9TGekuc57z2IPg8+5IB8y8W7o7KrMY6h65ViFu029XCtSi0zVev
         +XUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=E/saJCBwrEs1HH5uGjAvb60G8XbPyPe24BP9OJOZZIA=;
        b=cJNGEQEdC3E2o1TJ/SXJ1B9HpnSHEAiHM0XICvpLHvYg/3rhUItsnukXggk+xSVcuB
         QZFwgcYVdhZDFhP9gF4Vquwvm4ZLxMgSr8v/ehXE6y+7xTHowARuUJBdqQGNz7vgrndV
         5+5BF15vD1yzf5gMs+kRv0mRFBtZFFOTfRtkXGymCC/rNrf+ESEWrSWtxgJZq9OneNPo
         t40visaBAq2Lo+a/d9pfztfkcGSK+PRX9KL14bwFszIBp5AFLdu5lj8XVuzvxRUXo1OF
         E65JASYAo0dwhhqxy2NY4ZIv3TeSXnLxBV8vxHK9PRwqCpzbOCFzN/Sc2aut5XZExtPo
         8smw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JcETQc7O;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id q13-20020a05600c46cd00b003eb01dc046bsi502216wmo.124.2023.03.10.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:00:24 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JcETQc7O;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5CBED20664;
	Fri, 10 Mar 2023 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678471223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/saJCBwrEs1HH5uGjAvb60G8XbPyPe24BP9OJOZZIA=;
	b=JcETQc7O7fdvlqWc5Ru4K+2HHB/8wjclWifQ88JAzO1lYpYgBQQOJHJ82vEB/X1ZQRklAw
	En6sKg9j7hYoqZ4mnXtwZYmFp+7e7y7kthIXmuweh5HAOUcvgeyc66xQ6QxumYaCjjfoZ9
	hgc3Rle+br5INJNf1V8rPi5O/vR9pkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678471223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/saJCBwrEs1HH5uGjAvb60G8XbPyPe24BP9OJOZZIA=;
	b=ODlDWOLKWMbKvaGZNwmuneSzxcpt4reANqKfPk3nvTmYiHc7svScIVWRH1Yo69SA7IdOzY
	wDsIfVG1x6LRhzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA45E134F7;
	Fri, 10 Mar 2023 18:00:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GFYQKDZwC2SAUAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 18:00:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm@nongnu.org, Peter Xu
 <peterx@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Cleber
 Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
In-Reply-To: <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
Date: Fri, 10 Mar 2023 15:00:20 -0300
Message-ID: <87wn3ocwqz.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UQEvF+IMkfxN

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> You need a very new gdb to be able to run with pauth support otherwise
>> your likely to hit asserts and aborts. Disable pauth for now until we
>> can properly probe support in gdb.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> If it makes gdb fall over, then shouldn't we be disabling
> the pauth gdbstub stuff entirely ? Otherwise even if our
> tests are fine our users will not be...
>

Have you seem my message on IRC about changing the feature name in the
XML? I think the issue is that we're putting the .xml in a "namespace"
where GDB expects to only find stuff which it has code to
support. Changing from "org.gnu.gdb.aarch64.pauth" to
"org.qemu.aarch64.pauth" made it stop crashing and I can read the
registers just fine.
