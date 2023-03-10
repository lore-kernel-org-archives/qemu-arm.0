Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1900841ejc;
        Fri, 10 Mar 2023 05:23:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9L6gkUg6G1YaqvoU2rMNAqnEJpbA4CfqFrAali4hte3S5pRyU64NC5N/YU7+TpLkyUhBQZ
X-Received: by 2002:a5d:6689:0:b0:2c7:a39:7453 with SMTP id l9-20020a5d6689000000b002c70a397453mr18372595wru.54.1678454617061;
        Fri, 10 Mar 2023 05:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678454617; cv=none;
        d=google.com; s=arc-20160816;
        b=iRYCOT8H5ndemxZv6tAxmuKjXKIbSstt5HZw11sukyS6yg5ZVm9OpaXYkwAQAM8C4B
         X77JCRwuDpiInAYZtzWP+l8LN4h3AYiT65tH0A0FYAvPgUsJnG7p9Y4VpcvXQfBlnA+X
         rvsh4nq/HR9OQ+z41SWVTGDieY9h5JvqW/wrNu0L6ICbfDdTrKUIJJtebvI3yw8jrfDC
         iY7iYHWIweKfBv57ifCNevcPe+Qh5SwxBo+e1mphwUQtzJ/dQljxCTwmePP9twFzy07e
         2iSx18/QcLGVgwM8Ow1O4p5Y7G/6qO/EAoowXBRbudkebLcfKzcNM87UD5bBahMQYtQr
         1JAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=6QMlg4L/jhkDbg3C/URkS1zZ4NTHj++tS2mG97UZEmE=;
        b=lGEi9bA3CDSlH5qyxXdr1/4ZoM1rD65UV72xzRCOqkoDyr8hK9uFFzclGOUC7rWMBG
         Sd1JGmrQ9IvGu0zBEP1TvbJEFujToMByOW9XCy9QmjfoSK1WFbx8y3Zf0iXlWljAebHx
         AzJdLe5INy4yc/m1ph/8wDV1PfrbbcxBR+kLtQyhTvFZ9b9xv/ISA1Jkp+sN07eGQMRf
         PLEc+nE/i0Vzb7nlVIhmK3JDqF+Ud6MqmFVj1YjjXFEvx057FOwetoEjVYOuwzLauLLi
         EWKkOWo57F7djVLTdKJz6sIpN1l23eIHwW3J5dms/rk9ICs1Hf3yrR+C9W+O4JWQlWD2
         NrbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ROhGunnE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=bM+AIP4g;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id o18-20020a056000011200b002c54aafabbbsi2088352wrx.36.2023.03.10.05.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ROhGunnE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=bM+AIP4g;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B02222ABD;
	Fri, 10 Mar 2023 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678454616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QMlg4L/jhkDbg3C/URkS1zZ4NTHj++tS2mG97UZEmE=;
	b=ROhGunnE+Z00HB5t8hrExDrH3whWmJavPJqDVEFbCRQHGzLE9RBvuEffX2plTowLeexLlZ
	z1cM//E+Zpv0kHp4o3/e51YMKaGM9wuJrwmFKhnKSO7Nso67Okb9QKwtgG8Ztwl56AEFes
	uZO2zPafNW/9tnMKwn5uzTGw7Zk2uI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678454616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QMlg4L/jhkDbg3C/URkS1zZ4NTHj++tS2mG97UZEmE=;
	b=bM+AIP4gIBPu0qBSI4Hs+cpxB1PQaXo8rlrXEf5cLPBfG5FiUKkBFHx+zc/4UCcq1Okj0i
	zXs/HI2GXExW6EAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D285134F7;
	Fri, 10 Mar 2023 13:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id E2SwNVcvC2QfPgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 13:23:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <20230310050853-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050853-mutt-send-email-mst@kernel.org>
Date: Fri, 10 Mar 2023 10:23:33 -0300
Message-ID: <87edpweo4q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: EgnoE9MoX2eY

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
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
>> Make sure that calls to qtest_has_accel are placed after g_test_init
>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>> printed before other messages") to avoid TAP parsing errors.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> I don't like it that it's a pass not a skip.
>

Noted. I'm always questioning myself whether to skip or pass.

> Also, if we are not testing acpi should we not
> skip building acpi?
>

Good point. I'll try to do that for the next version.

> Also, a misconfigured qemu would previously be caught,
> now it will seem to pass tests.

Well, we can only call it misconfigured if we have a specific setup in
mind. In the general sense there is never a misconfigured qemu unless
there's a bug in the configuration path (configure, Kconfig, meson,
etc). Then these tests would have nothing to do with it.

So in this particular case, the "bug" perhaps is that we're still trying
to build and run the tests even when the accelerator(s) they require are
not present. I think your suggestion above of not building the test
covers that.

> How about a special make check target that will just test
> xen things?
>

Probably overkill for this particular issue. I don't see any
Xen-specific tests yet. It would run almost the same set of tests.
