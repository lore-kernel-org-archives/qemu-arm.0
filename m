Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6967677ejc;
        Wed, 1 Mar 2023 05:34:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/oFjpM28UkBtlzqBlVqKg6RORagYYKDg5e6RnvbWvAodhcP6LWg0nHjN5UqTUS6itTseZm
X-Received: by 2002:a05:600c:4da3:b0:3ea:e4f8:be09 with SMTP id v35-20020a05600c4da300b003eae4f8be09mr4853534wmp.30.1677677651511;
        Wed, 01 Mar 2023 05:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677677651; cv=none;
        d=google.com; s=arc-20160816;
        b=Kvsx0XtY2qpHbnEZGcg1eq1f9e1q16RZb5xLeJglmSbeKgMWTkuWYNyx1zo/RYQcj/
         VzMkTDk7OiJdNcVHzc26WfN16lCUi356LD5S6HxRPf8I7arU4ZzucUZ56sMk0srSU4V8
         jzKVLKNRwIgSZKc1utVbimud+Bk0nyZm7HRIOY1YeghnwYFRO+OBT6i8PZAJtqpl1GMP
         pwlm5P35XTWbN9MAQmWTjllySHw7iXgYQZ1hCcy9TAGcNWHwp8yoWJoHosEn/iTWvwtR
         sI8MTLMGavOXV9earZZRolZmHQbtRy7s1JSSY3i6PPa0YUZJcYmq0yYzGcXSz49J0HkG
         nL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=HQToDHtmwapBTDABhT2cShca3Pt9qH7zdZGlVftR1AI=;
        b=FEx9MmJtqCHp6z46VeckqgPnDzp7YDUL+96meqSRdG6XL/BWirZi5atKougJvvJYsF
         /jDLcffLL+9jvLgFhaefmbDRI+M+u7KQFNH5JiQoQRtczRCHMu6BBUJZTeqE88IN81lT
         qq68R75aGGNOn2PZhdkm8imyntbOueWbE9KEUqhVmRAQ8/AigL6g5XuQU2t4cSEQ+xf6
         7ZPYE+dNx8YSpjbNVRCmNFYgHIfaGgsL8kDJm3qS+QOC7UGjIjFglZUWW0HUVCK9MmaQ
         Z6Z2ZIxkXv2uEtZhvcVnk764NC/VW/5BWVoELhfr73vadMLB+L7ztJt0exGU9Py7PfQA
         pNHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fmru5pdb;
       dkim=neutral (no key) header.i=@suse.de header.b=o+W5hIZM;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id v11-20020a05600c444b00b003eb420f7cc8si9604652wmn.168.2023.03.01.05.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 05:34:11 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fmru5pdb;
       dkim=neutral (no key) header.i=@suse.de header.b=o+W5hIZM;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1CB3921A92;
	Wed,  1 Mar 2023 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677677651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQToDHtmwapBTDABhT2cShca3Pt9qH7zdZGlVftR1AI=;
	b=fmru5pdbF0jewraO6ffVW0AIaPBBZp3aqYbiSTMu4DpSBJvJW6NFMzgCpK6I5EcveyVw4C
	R5l2TYmMTisCdgsFEhsbyPRM3YWaxF3EsrfGGYcvgwBj2w/GW1RgVYBKb0GB47Nx7nCkCK
	C1Yn6ZxOiDIemzi0DYGRN1NjWIIqDLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677677651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQToDHtmwapBTDABhT2cShca3Pt9qH7zdZGlVftR1AI=;
	b=o+W5hIZMedZas0s+S6NnxbN3hqptpVo2M4mY+i8CtH+f20vs47Rp17CJy3X+WZicnlBI8Q
	yCCwr9FL1v5bmABg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A021813A3E;
	Wed,  1 Mar 2023 13:34:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 44Z+GlJU/2NKGAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 13:34:10 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio  Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas
 Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan  Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <87bklcd3x1.fsf@linaro.org>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de> <87a60wk6st.fsf@secure.mitica>
 <87zg8wk69m.fsf@suse.de> <87bklcd3x1.fsf@linaro.org>
Date: Wed, 01 Mar 2023 10:34:08 -0300
Message-ID: <87sfeok33j.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0wSXZwrFoXN0

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Fabiano Rosas <farosas@suse.de> writes:
>
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> Fabiano Rosas <farosas@suse.de> wrote:
>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>> host.
>>>
>>> Ouch.
>>>
>>> Just curious: why are they needed?
>>>
>>
>> From https://wiki.xenproject.org/wiki/QEMU_Upstream:
>>
>>   Why is qemu-system-i386 used even on x86_64 and even non-x86?
>>=20=20=20
>>   QEMU in a Xen system only provides device model (DM) emulation and not
>>   any CPU instruction emulation, so the nominal arch doesn't actually
>>   matter and Xen builds i386 everywhere as a basically arbitrary choice.
>>=20=20=20
>>   It happens that the Xen DM part of QEMU is quite closely tied to the x=
86
>>   scaffolding for various historical reasons, so we end up using
>>   qemu-system-i386 even e.g. on ARM!  There is no practical difference
>>   between qemu-system-i386 and qemu-system-x86_64, they should be
>>   interchangeable. However only qemu-system-i386 is regularly tested by
>>   Xen Project (via osstest).
>
> That said with the xenpvh model that was added recently we should be
> able to finally build a Xen only qemu-system-aarch64 which while
> functionally the same will be less head scratching for users.
>

It would be nice if we could eventually restrict the x86 build to the
x86 host and the aarch64 build to the aarch64 host like we do for the
other HW accels.
