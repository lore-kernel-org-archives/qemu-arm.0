Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4166706njb;
        Mon, 19 May 2025 07:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJq9dPyFRLABnIuEKM1fOQcUHwyX5eihXPHuw4vL0bLLfbvbP0oSdyIw52mR0aa+uMHfum+6xH/TOAYA==@linaro.org
X-Google-Smtp-Source: AGHT+IGe4L4DCSGQ4ZRsQGhHSCuDRRyLRe37FMGGrSJES7Ygz8+3cIhAETUccNx1fWsGgqwiu+NO
X-Received: by 2002:a05:622a:4d05:b0:494:9908:d74d with SMTP id d75a77b69052e-494ae42d2aamr266315601cf.37.1747666185124;
        Mon, 19 May 2025 07:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747666185; cv=none;
        d=google.com; s=arc-20240605;
        b=GyimrB6mFezjWrVy7OftfzPr21nDKlwaYB6cfbdv4aSddP378Ps7N/LuHP+VyhB69B
         DnbSzlN8TqbRWHGnbMA2UOjnJm41xlEaOwuA9nUxT3k4Ebq6VuDbH7sRiiQ5AH3uuzLg
         W3Oykamh6Xnk58n4mLQZNGhIaK+ec1iOzksEeGzZ//URIUmEMjWwRDd6yQiFe62UW60c
         C7oXxdewWcVHbRFNBMHACO+MqadRF1nWSZjb9VPHKz95atBWND5ntQ8UVEIKnbG4rDaw
         K8JAPQB5h6VntV1cUAR9WeONuIMfI82QnVWk0Ua+jr7SUve8vNbam6a2fsKViOnUCgb/
         g6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=tRyjY+JWvC1SFU2iPZWdTV9D8qwkGz6FhpIexNifnV4=;
        fh=NYR/i0hCuykZbKQfuL9okEilyP5UINvoOTnEK6qJ6Ms=;
        b=K9VFZIseIYXAO7TQ0GVVc9E+N2HDhbC9K1w4yeFF7dWnTCGxM+PsDEKyraEXyZ3/gh
         a+PwTVgjbsNskIKJN044opH++jweDzOGESc6z6rILnUNV+kdEhpqItLVSti9o2g+qmG/
         KNFy5fXs1SlzH45WQMdtKi6AfUxe5aZ25kCuXhdspWNwdRNqVLFx1VXrq+IhXD93POAT
         +le7OSuTmGrJpS4Wui1BwZf6KCmqvNFP3glH0cQRGMJ7SnWxS4tELQtrN12iEmUoHm4T
         IsHy9OD8vgmzKjWxIZ5tA+5mX0P+qnfFZZtp7xa6tipHdR9C5Ut8K3UDLSmjHvVy2ueB
         pJOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=budQm7lj;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae5602besi87076791cf.309.2025.05.19.07.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=budQm7lj;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747666184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRyjY+JWvC1SFU2iPZWdTV9D8qwkGz6FhpIexNifnV4=;
	b=budQm7ljhowXNKKQvsa4XpILsXuf637hW0+XOYuZk/R4VAe8nZlLUv6P9vl5RedRCsXLHV
	6ScGu177h0HBY3H88yt54oKM6RRsZBWw7j7m5A3HH0cjEyvqmUexEdCDNeEWVh2VhBIJhk
	i4KvtoZbIPEV44TGIoGn6IUSJU4Zclg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-O8UDVZr3PySseP2kZxhRsw-1; Mon,
 19 May 2025 10:49:43 -0400
X-MC-Unique: O8UDVZr3PySseP2kZxhRsw-1
X-Mimecast-MFC-AGG-ID: O8UDVZr3PySseP2kZxhRsw_1747666181
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EE48180045B;
	Mon, 19 May 2025 14:49:40 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B7A41956095;
	Mon, 19 May 2025 14:49:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
In-Reply-To: <0fb4cd74-bcbf-4063-bc3b-0e8359d04117@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-3-cohuck@redhat.com>
 <0fb4cd74-bcbf-4063-bc3b-0e8359d04117@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 19 May 2025 16:49:34 +0200
Message-ID: <87msb8bqpt.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: aQdM+u6m7zMm

On Tue, Apr 15 2025, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 14/4/25 18:38, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>=20
>> Introduce a script that automates the generation of system register
>> properties definitions from a given linux source tree
>> arch/arm64/tools/sysreg.
>>=20
>> Invocation of
>> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
>> in scripts directory additionally generates
>> target/arm/cpu-sysreg-properties.c containing definitions for
>> feature ID registers.
>>=20
>> update-aarch64-sysreg-code.sh additionally calls
>> gen-cpu-sysreg-properties.awk which is inherited from kernel
>> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
>> the original author of this script.
>>=20
>> [CH: split off from original patch adding both sysreg definitions
>>   and properties]
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
>>   scripts/update-aarch64-sysreg-code.sh |   5 +-
>>   2 files changed, 329 insertions(+), 1 deletion(-)
>>   create mode 100755 scripts/gen-cpu-sysreg-properties.awk
>>=20
>> diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu-sys=
reg-properties.awk
>> new file mode 100755
>> index 000000000000..76c37938b168
>> --- /dev/null
>> +++ b/scripts/gen-cpu-sysreg-properties.awk
>> @@ -0,0 +1,325 @@
>> +#!/bin/awk -f
>> +# SPDX-License-Identifier: GPL-2.0
>> +# gen-cpu-sysreg-properties.awk: arm64 sysreg header generator
>> +#
>> +# Usage: awk -f gen-cpu-sysreg-properties.awk $LINUX_PATH/arch/arm64/to=
ols/sysreg
>
>
>> +BEGIN {
>
>          print "/* AUTOMATICALLY GENERATED, DO NOT MODIFY */\n"

Makes sense.

>
> Should we keep copyright?

GPL-2.0-or-later, I guess?

>
>> +	print "#include \"cpu-custom.h\""
>> +	print ""
>> +	print "ARM64SysReg arm64_id_regs[NUM_ID_IDX];"
>> +	print ""
>> +	print "void initialize_cpu_sysreg_properties(void)"
>> +	print "{"
>> +        print "    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NUM_I=
D_IDX);"
>> +        print ""
>> +
>> +	__current_block_depth =3D 0
>> +	__current_block[__current_block_depth] =3D "Root"
>> +}
