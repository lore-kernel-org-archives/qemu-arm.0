Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1248151njb;
        Wed, 14 May 2025 07:54:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqCd/I9ylTIGD8ylYqAhYmO8FLMhXYMiy1ryh04yx8Bf6TbtmaHrSDVbs0hjnWK0h0F2gwuq3bo0pyrw==@linaro.org
X-Google-Smtp-Source: AGHT+IHpDB+mWjTMfAOYbEkvdn3qtj+fup0pnl3NIVZe+W6JC8VECTVNza2NO16tlmjPhYHIPP77
X-Received: by 2002:a05:6214:500d:b0:6f0:e2e1:52a7 with SMTP id 6a1803df08f44-6f896ec06femr58405566d6.42.1747234464800;
        Wed, 14 May 2025 07:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747234464; cv=none;
        d=google.com; s=arc-20240605;
        b=bcjJ+AC/sM4XdOUzh3+QNtgvXCzPH+aInx99TSTY8YJG5c61bJ4PljyosAiMA2GGVo
         TrUjbSiCG56GMDhmRNnzPyLXeC0QvlQf1BnQy0ubeoWh69LrfVnxyR3ONplDVj2gGv0h
         KT+Fn0gA3n+XWURh4oyERn3s7Z+Px/V36vBciNYA7PzqnE6KV297GWVACVLBpMZw9It6
         ykzZlusAlIe4EZnHi7rVt5O7CVW3CDbFpUsofS+O8FUZG+rcW6AWptEm8FCNJb3Ui48t
         T5NnjlZhqbndO+VXPVa69b3FMeQN7bxKkT2dxflGPFqum142TDDQWdGGlw+4wkLU/TEQ
         srfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=KF6lDVwcE50AHlY5Ciik4TP5xsofh1kR+7PtPFs+N2U=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=RChp0YSGeMaS08YysdbFV8USfKlSqwfKtoZ4kx6sz783I+jDOQJD8CxcWT4and0/Vc
         n83exI8dFGGabviGutP03neLslV/m0wltejpoeA3axxJtGRj+AlExFtTP4iNAT68rAHP
         uRJz3ikTvbTUYMtI6bc95N/BbOBJSBwI+5VRpW3mHMljS2l3oKydI+eQGj8fp5mdyzjG
         Vl+eX1+YmIXxLbNbTU++4D+ByEXtFxJw6OC6ASWXjQN3WsLytAv6SFNrTUc1H2CUaKZn
         Yh3gQJBrDtQ3kgle4DE0AJqe+Ssi6US6hhbrR7ykd7LoLVVt526vRo5NWPARqY6kx8Ss
         kG3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8jLcYan;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e79a121esi128073716d6.466.2025.05.14.07.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8jLcYan;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747234464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KF6lDVwcE50AHlY5Ciik4TP5xsofh1kR+7PtPFs+N2U=;
	b=T8jLcYangM8Xmxi3z8Dx1JNCmSaGwmCEeshHV+vku0OcEnQqNYRzARmj/zvqbisR3owCgm
	DRGnEP3yNnIachGOFKhfdMcaJBHDTBrOLmhSxkzi50dSq3sLCAOMzDxLATLU35htiJLb7P
	8JbXxmLqQNYwInlZTf/vaS9JXKZgMBo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-TdhHYpF5MzyBlTdPUz-4JQ-1; Wed,
 14 May 2025 10:54:23 -0400
X-MC-Unique: TdhHYpF5MzyBlTdPUz-4JQ-1
X-Mimecast-MFC-AGG-ID: TdhHYpF5MzyBlTdPUz-4JQ_1747234461
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A45A1956050;
	Wed, 14 May 2025 14:54:20 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C74DC30001A1;
	Wed, 14 May 2025 14:54:17 +0000 (UTC)
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
Subject: Re: [PATCH v6 12/14] arm/cpu: Add sysreg generation scripts
In-Reply-To: <aCNwKBDtJES0GX3q@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250506085234.855779-1-cohuck@redhat.com>
 <20250506085234.855779-13-cohuck@redhat.com> <aCNwKBDtJES0GX3q@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 14 May 2025 16:54:15 +0200
Message-ID: <87ecwrckfc.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: nO3oOjif2OsO

On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, May 06, 2025 at 10:52:32AM +0200, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>=20
>> Introduce scripts that automate the generation of system register
>> definitions from a given linux source tree arch/arm64/tools/sysreg.
>>=20
>> Invocation of
>> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
>> in scripts directory generates target/arm/cpu-sysregs.h.inc
>> containing defines for all system registers.
>>=20
>> [CH: update to handle current kernel sysregs structure, and to emit
>>      the re-worked register structures; cpu properties will be added
>>      later]
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  scripts/gen-cpu-sysregs-header.awk    | 35 +++++++++++++++++++++++++++
>>  scripts/update-aarch64-sysreg-code.sh | 25 +++++++++++++++++++
>>  2 files changed, 60 insertions(+)
>>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
>>=20
>> diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysreg=
s-header.awk
>> new file mode 100755
>> index 000000000000..b6b207e3c0fd
>> --- /dev/null
>> +++ b/scripts/gen-cpu-sysregs-header.awk
>> @@ -0,0 +1,35 @@
>> +#!/bin/awk -f
>> +# SPDX-License-Identifier: GPL-2.0
>
> Invalid license name here - hopefully checkpatch.pl is warning
> about this.

It might not check .awk scripts?

>
> Same issue as in the other sysreg script in the host CPU model
> series.
>
>
>> diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarc=
h64-sysreg-code.sh
>> new file mode 100755
>> index 000000000000..721f41a9a516
>> --- /dev/null
>> +++ b/scripts/update-aarch64-sysreg-code.sh
>> @@ -0,0 +1,25 @@
>> +#!/bin/sh -e
>> +#
>> +# Update target/arm/cpu-sysregs.h
>> +# from a linux source tree (arch/arm64/tools/sysreg)
>> +#
>> +# Copyright Red Hat, Inc. 2024
>> +#
>> +# Authors:
>> +#          Eric Auger <eric.auger@redhat.com>
>
> Although its fairly short, this still deserves SPDX-License-Identifier
> to be set.

@Eric: do you agree on "GPL-2.0-or-later"?
