Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1534264ejc;
        Fri, 3 Mar 2023 12:59:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+tEglMbezxc33OMcvH/3KVlkcls7x9p4b457SiQMa0U512VgHU7SnxAf4MLOS4zcLVRI7I
X-Received: by 2002:adf:e78b:0:b0:2ca:e856:59d with SMTP id n11-20020adfe78b000000b002cae856059dmr2100829wrm.1.1677877174079;
        Fri, 03 Mar 2023 12:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677877174; cv=none;
        d=google.com; s=arc-20160816;
        b=Wd9X0d/D2DDuyaT5GP+rfBIVORZ5n6UK8liy3fR2X8b690Ap+BvJjMGwA8Qt6p+ow5
         HyAlVKYXAE/vglk7G7kJtez/ZHUM1HcXGMxWGCQKSZSMirPkJ2WWltz++jYHzz+bezOP
         nv0LAOR9YommptDiE35M8q5e15OzO/gckwbzKKpB2/5hOsTIImOqhzvg1wkTm1A2Ijx0
         kKyvIpRXofRbm8IJDxVjSmYSZmicr1dEZI0PnWxzWht9vkqI47crUBq3OgoACFa/yWJY
         lEYg60ssmqHaUMDdoYfykTzeDIfIe4w6D39AOFnK+V7mhvwtEh7rD+m82fgU0SsaB5Hi
         pi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=5/F8bcSdTvKkxYkAx6kmxgBeHgBpoB3AT/OMccsBdoA=;
        b=vv1CE96jULh5nTrmd2SYwD5Tf7gLrm9OS/6hTkpTkJwh/E+ARgo9BqilLqFXZ3FW84
         zGKaAP9CtY7EwSXLewTdRzJgczBOd9ZjxKU+jYc2r02iSRRqfiM+QDU9uOrT1cgfEDsp
         IhNGyrXpRbB4SVJTrWn4CvuUelAXLZ/QlAGyRBUKsAA3uuJpCzQBbbtvleLff9galCRd
         +W3Bp4b0i5nSCX6EhE1CThRDkOTssxbd3/01dV+7W6J0TiVTPNFpuL8bTZurmn33fzdK
         TpGwmdErw3gtPS3Ljl2WHXmPyUgTGvzi4oGs1y+O1S4Eb9yFGRs53ZcAuiS/gSn0DkYE
         OCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HLMggIjg;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id h12-20020adffd4c000000b002c59f18673dsi2303805wrs.290.2023.03.03.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 12:59:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HLMggIjg;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B5FA1F750;
	Fri,  3 Mar 2023 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677877173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/F8bcSdTvKkxYkAx6kmxgBeHgBpoB3AT/OMccsBdoA=;
	b=HLMggIjgsyZ8FUpEAbrqZfKCpBuYVzBzjgaj1n68DazuWZJDe9xWtik/gLQMcP1iqV13L8
	Nf3NVrw9nJwAgGYoy2o+iUV9D8usUP4lBvUyXzRhiC+Fzw/Jr5BFPTnlvs1gRxFWpeEXz/
	XqZ6c/EucTsZvmITrIt3cdTG6wisbcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677877173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/F8bcSdTvKkxYkAx6kmxgBeHgBpoB3AT/OMccsBdoA=;
	b=9SvSFgWzGtYOWrA+4fmEEkU7Gup68p1WgJeIZHjxpc+vXwmGlULZ8B+SuTHLcyBhevz3lO
	ft6/azhgbj479lDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90B3A1329E;
	Fri,  3 Mar 2023 20:59:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id O05dFbRfAmRYUwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 03 Mar 2023 20:59:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to
 migration test
In-Reply-To: <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
Date: Fri, 03 Mar 2023 17:59:29 -0300
Message-ID: <87pm9pwnym.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 3Ofgk/rESgqt

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> The migration tests are currently broken for an aarch64 host because
>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>> line.
>>
>> Add a separate class to each architecture so that we can specify
>> 'machine' and 'cpu' options instead of relying on defaults.
>>
>> Add a skip decorator to keep the current behavior of only running
>> migration tests when the qemu target matches the host architecture.
>
> I still don't understand this patch. Don't we run the
> migration-test on all hosts already? David ?
>

We run on all hosts but for each host we only take the QEMU binary that
matches the host architecture. So if you want to test aarch64 migration,
you need an aarch64 host.

If you run on an x86_64 host (without this patch):
$ ../configure #all targets
$ make check-avocado AVOCADO_TESTS=../tests/avocado/migration.py

You'll see:

 (1/3) ... migration.py:Migration.test_migration_with_tcp_localhost: PASS (0.21 s)
 (2/3) ... migration.py:Migration.test_migration_with_unix: PASS (0.18 s)
 (3/3) ... migration.py:Migration.test_migration_with_exec: PASS (0.21 s)

All three tests ran using qemu-system-x86_64.

The issue I'm trying to solve is that when run on a aarch64 host, the
test will fail because (being generic) it doesn't pass the '-machine
virt' option and there is no architecture-specific information in it at
all.

If we need to pass '-machine virt' to the arm machine, then something
needs to change to add architecture-specific knowledge into the test. My
first version hardcoded the usual "if arch == foo". That was frowned
upon, so this version creates a class for each architecture like other
tests do (e.g. boot_linux.py).

The downside of this is that we need to explicitly enumerate the host
architectures on which we want the test to run. I chose a few of the
obvious, but we might need to add more.

The upside is that we could now enable the test to run with all the
targets present in the build. If we remove the @skip decorators from
this patch, we'd get (note the arch strings):

 (01/12) ... migration.py:Aarch64.test_migration_with_tcp_localhost: PASS (0.19 s)
 (02/12) ... migration.py:Aarch64.test_migration_with_unix: PASS (0.16 s)
 (03/12) ... migration.py:Aarch64.test_migration_with_exec: PASS (0.20 s)
                          ^
 (04/12) ... migration.py:X86_64.test_migration_with_tcp_localhost: PASS (0.21 s)
 (05/12) ... migration.py:X86_64.test_migration_with_unix: PASS (0.18 s)
 (06/12) ... migration.py:X86_64.test_migration_with_exec: PASS (0.21 s)
                          ^
 (07/12) ... migration.py:PPC64.test_migration_with_tcp_localhost: PASS (0.20 s)
 (08/12) ... migration.py:PPC64.test_migration_with_unix: PASS (0.17 s)
 (09/12) ... migration.py:PPC64.test_migration_with_exec: PASS (0.20 s)
                          ^
