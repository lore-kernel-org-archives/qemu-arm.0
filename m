Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1271806njb;
        Wed, 14 May 2025 08:26:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz849VpB6JMWrpWgGG44ZD+1qPIHx0x6zIEbyt/giGXC51N4Kq1+K5Imh3WVt5Ve/gDxdHiwUgRqghdw==@linaro.org
X-Google-Smtp-Source: AGHT+IGkce16dijuWlhUf0QDf5M86mFy3a65hY8wPEY2R2nCC+RHoRbdY6VadJ0kwgobTcIF32T8
X-Received: by 2002:a05:651c:1549:b0:326:e80a:46c6 with SMTP id 38308e7fff4ca-327ed20c401mr16203401fa.34.1747236370418;
        Wed, 14 May 2025 08:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747236370; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8Kohio53HnXumP80zw7tfKxtqBwHeTK2AIHfzrBBw/tc3Lb6AJgVEmJHDukfQJBOu
         A6Ow/9iJdn+zYDhV0KTnzLVmNCfOSl16y48dinyBasl7iT3FYWMh1Qzv3zj3pzlTFKZV
         pNcevdfSVHpm54zSCREAgNtHQJpmHOXMOvH5fsUTtml5i9uXtuPRswJKb9yId/79snUe
         E41pqj4Ju+CYx7T+fDbuTQ9wk+4qTPRmhamCfG5oVQ9Ig4eMleeLMGWCCaXWAm1Ndqkb
         RAWtiK2qiejr5+fB1Fny/OjuIiQUSXaT0l77gdMguNV6xs+dxlAqgPq86qqkuhF4e6nM
         SzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=QTW8LjvZra41+tt3U/t37D/X61KI8S/1vdXHso4lMuE=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=dmpLLsojtHciQx/sy3XiD6uxOal/PDYfKbxrshpjps6iMSwcdzvEbeBvoykT4kaBlN
         RQ0wz1rwQ7GSYDO8OI1sVCCDzff8cblO+JhamQKiCSNJcdq0juZF4CmxFR+sT6RuYDME
         Q1Lobhh1+9SKKpKbKtstpvKjqNJ0ux3mU5vlLeN+xstNSg2isWsuSIVjMBwcEKehgeYw
         C/S1HwIrtnTjpWJ9trVZi+/6fddILFkN5H1d/7gkQm1fuNbXMdD0S/ylxW92SiL7FBin
         SH67+HxFwUHB7FxsU3DelkdvW9K48Ng1f/rO0aLTVCggx5E+RerFL6RrQyB3SjVBC/1A
         5ufQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0oq9qV+;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-326c35bc8d5si53642091fa.465.2025.05.14.08.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0oq9qV+;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747236368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTW8LjvZra41+tt3U/t37D/X61KI8S/1vdXHso4lMuE=;
	b=C0oq9qV+53YTT3wBcxPpxQUCwzlWJCZW41uobs/UjdO1pzzb5Gbr3tUHk5v9+ql9q1oByd
	j8G7XVIom3WBcg4uG9vDxQgMfc2J6V4a0QjvCgA8uEmp1oLy0q3J9W4U29uT7siHkBN8bA
	s365xRIiB0nzTqFMbjuM4ebyUieKZ1E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-ek8D87iENguM2airTLJE2A-1; Wed,
 14 May 2025 11:26:07 -0400
X-MC-Unique: ek8D87iENguM2airTLJE2A-1
X-Mimecast-MFC-AGG-ID: ek8D87iENguM2airTLJE2A_1747236365
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A557218001E0;
	Wed, 14 May 2025 15:26:04 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D8E51955F24;
	Wed, 14 May 2025 15:26:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, agraf@csgraf.de,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
In-Reply-To: <aCNj4dFWLkBZrmmh@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-3-cohuck@redhat.com> <aCNj4dFWLkBZrmmh@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 14 May 2025 17:25:59 +0200
Message-ID: <878qmzciyg.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: UY3dTs17xG13

On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Apr 14, 2025 at 06:38:41PM +0200, Cornelia Huck wrote:
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
>>  and properties]
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
>>  scripts/update-aarch64-sysreg-code.sh |   5 +-
>>  2 files changed, 329 insertions(+), 1 deletion(-)
>>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
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
>
> GPL-2.0 is a deprecated SPDX identifier. checkpatch.pl ought to
> have complained about this, requiring GPL-2.0-or-later as the
> preference, with GPL-2.0-only requiring justification in the
> commit.

GPL-2.0 is inherited from the Linux script mentioned; not sure if
GPL-2.0-only would be the correct fit here?
