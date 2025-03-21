Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp406941njc;
        Fri, 21 Mar 2025 08:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULh9qdpFekNzOfoCoYGHvQwXjKAcCEWdYTSY1+TQTFHghaTBw2Y+eadnvXhdrsAft23KxSiT+LdcWiVA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4/8/nrlgGQofWOsxU5P+0TKilCUm0AUXSD2xl1bnSsVoxx53Zi6XBuQDkGwoUNJsWpf5+
X-Received: by 2002:a05:6902:2382:b0:e5d:cdc6:7ad2 with SMTP id 3f1490d57ef6-e66a4fd0aebmr4229994276.46.1742571722339;
        Fri, 21 Mar 2025 08:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742571722; cv=none;
        d=google.com; s=arc-20240605;
        b=eosVOhuo6h/Pzith/Kj0G0FeIvKDxZLxLqt06b8M3MPAw4/jAOh2eNTGoGwTQ8dOUA
         mqFsdTbSVA1GrwF7jLhP6cbEORcM4KpmyHBQ/Ju06559na6BEqNf5EzvR1vxBiJ/HmYU
         4ll4Q4bcx5k32IuJT78MnERhSi9yiO2NzMV+diFCTyQS+NwDZlkek2U+yF5XDYTxipp5
         KdGQ2xx5UqXldO6BuQOd8179qe6fn2Sfq/pwCnocZOew7wl5ugA2kS9PbYb157J/y9y8
         F/xXBwsU3JbXyrwnp/X/HaCg0TjiX3WCyQSZCyKpzMS8nKcDBzPMOcEdecDYUy6X9mHg
         dSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=rLAT+xNg6mpfaUskN/9jAwU3yywlq9mFubt3CKsbvCQ=;
        fh=0U8LTlSH/uwceEZmrxihEpL94sypADyLZ9l1MmaQxsw=;
        b=Ufi2rr9t5RNhbY4OSMMk5JNIXaopAcQs+wjN+acgc7Op4vOtx6KyJ0Bk8n222DTS99
         joQToLyRqRTzkazYSg0+fPhPX+UwRujrzBfzMZn8DGfh7WHwEkOFNFu43tsTZ2rWnBpK
         Y7HZw5GLNc5k4HoDALgzr0K1dqSuYrNtmprF7y3mVzXjhN/prTJrfTozVbFhpmHJPu9d
         uV69PL5Dk95CrsFKHEc5KlgrE8rLVrY1UMENteywiv6SKT0bgHtakUewk8t3QqvXOJSc
         1NE93EgxV+LVB1kE/UBEleNc9IZEKSEVG2iZ6CXSsYDaSQ9PndRLE+lTvFHb4sHI4DbH
         ivqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJb6ptRS;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e66a44c8f81si1907340276.438.2025.03.21.08.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IJb6ptRS;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742571721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rLAT+xNg6mpfaUskN/9jAwU3yywlq9mFubt3CKsbvCQ=;
	b=IJb6ptRSO7DhQ98azllrll4gxCmdBQVIMZtyZJ4tcsyTAyCckrtqVUmO/bYN23vd5nY81P
	dCP41ghPFySJRbu6NvE9TsjqWRkvrtlXmxJ7iEFCpUBmJidy/fjRgc32S36G1NEc23+WGp
	sN6W7VhkCBGfJaHujQf/pbhJactD55A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-8FF16d2HNbGhKlCiBp_JZw-1; Fri,
 21 Mar 2025 11:41:57 -0400
X-MC-Unique: 8FF16d2HNbGhKlCiBp_JZw-1
X-Mimecast-MFC-AGG-ID: 8FF16d2HNbGhKlCiBp_JZw_1742571715
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE6B0180AF4D;
	Fri, 21 Mar 2025 15:41:54 +0000 (UTC)
Received: from localhost (unknown [10.67.24.51])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43B16180175A;
	Fri, 21 Mar 2025 15:41:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 13/14] arm/cpu: Add sysreg generation scripts
In-Reply-To: <17649857-752b-a149-3935-5bcbd5c50627@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-14-cohuck@redhat.com>
 <17649857-752b-a149-3935-5bcbd5c50627@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 21 Mar 2025 16:41:44 +0100
Message-ID: <87pliatmpz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: mJ+OXptLV8HA

On Thu, Mar 20 2025, Sebastian Ott <sebott@redhat.com> wrote:

> On Tue, 11 Mar 2025, Cornelia Huck wrote:
>> +++ b/scripts/gen-cpu-sysregs-header.awk
> [...]
>> +BEGIN {
>> +    print ""
>> +} END {
>> +    print ""
>> +}
>> +
>> +# skip blank lines and comment lines
>> +/^$/ { next }
>> +/^[\t ]*#/ { next }
>> +
>> +/^Sysreg\t/ || /^Sysreg /{
>> +
>> +	reg = $2
>> +	op0 = $3
>> +	op1 = $4
>> +	crn = $5
>> +	crm = $6
>> +	op2 = $7
>> +
>> +	if (op0 == 3 && (op1>=0 && op1<=3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
>> +	    idreg = 1
>> +        } else {
>> +	    idreg = 0
>> +	}
>
> This doesn't seem to be used. I guess this is in preparation for later
> usage, when this can do more than just the plain register definition?

In fact, I might have got muddled a bit in my scripts, let me check. (I
think we should simply skip out-of-range regs.)
