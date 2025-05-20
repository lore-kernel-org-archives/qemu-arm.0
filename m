Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp525212njc;
        Tue, 20 May 2025 07:05:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXefhXMy1MLr0f0jX9a0WeMk/9UaQk82fTqN/ydPaat8cTHIXmM6KSK4Vz8X5y44PT7G4W8biLOpGEzAg==@linaro.org
X-Google-Smtp-Source: AGHT+IEBpl/ogE4UU/+dFo0U4ZR7tEJ5xZetZDbRl1rLy5g6XIfVe85fVQTXtr0ub1rYuEU9u3jm
X-Received: by 2002:a05:620a:1982:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7cd46af8c77mr2683763485a.8.1747749915729;
        Tue, 20 May 2025 07:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747749915; cv=none;
        d=google.com; s=arc-20240605;
        b=ezdtDEw7Tt5iB3Kx+AKsvhD0ncJlm5j9KJJuqofOkh0TFG9hYqIS0Wlp0mWmqMMsAN
         RRyXrjNWTGgJnAxRMvAU3tJgvl2JzHTLWPtf+yoM5vbS047WBTqjNvPXl8i1OiWEeTTb
         k1OxdrTdkmZQi8Yrb9Gp636Tqyf8gsr5SxeCqw7fp/ZH8F4qxqjRcHvi5htaQfWd9+u5
         HI2+WCWPmkBqo/cSf9tRJpB3w9LREOnM2EEoMnf28BhVwzehxiAg6qJKGi8vckVG0P+A
         4hrWpW3VR93lA/0dnYcLlqtBlZvncE2NkL37d6hSlZxlEGsOtJAZRKAvKNXt9PAItcYB
         V6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Dqea7MZDYhyQlC4xKO8LGx5epUTJ/uHF9sDafau5YHY=;
        fh=iQ7n1v0snccwxUvUyN2HRcGQY4i7GKA5J/Y52/7OCuQ=;
        b=OJdKEZSU9DeP6hNTm2H125Mkp8PpEtrK03wG6Fkdn/46SwogaoFgF0/52Oyqh+R77N
         m3YpFWWHwrt8MqTV16i0Vwr1xMv7lNjw8blraTWSqNJBocdgJdQYoB5t4+cTHdn7hWHZ
         4KPfSly1a+9JVZ6vycg25ApJKqyErzaU5GfiBsz/xQyHOVXvXR37BcjSmnNuPBXBDfmS
         FAOW3OiyKlt+NaJQtZEoEhCFJs5agbREHMHSnvR1aTMbSlQgOe+Ge9dmSi+Azn6WWiEd
         4TbumHszfw58X7ejt8e4HOI2u6heKuxKsrFndwKOOHYBVQwy4KRY4WkL19FLI3pAHcQ+
         sN1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3NHKvsq;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467e8546si1049223885a.150.2025.05.20.07.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3NHKvsq;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747749915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dqea7MZDYhyQlC4xKO8LGx5epUTJ/uHF9sDafau5YHY=;
	b=N3NHKvsqUNEHNnFJDHitsvkJJkSS3XHQQPVbsgWFoCreZf53ujKto1hJIxbycY4fdVQ1Di
	/PGLpOI9YTVInvZVVPFTT6NDvDnvM+zKYoP/S1darOcyC4q5gQ1tJ2yWclu60HR8C4wX/b
	keKhfFwUQQPxCJSbKRiQS2jhY7VSKU0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-bVnTc1EAMAylZKevhQ0_1Q-1; Tue,
 20 May 2025 10:05:14 -0400
X-MC-Unique: bVnTc1EAMAylZKevhQ0_1Q-1
X-Mimecast-MFC-AGG-ID: bVnTc1EAMAylZKevhQ0_1Q_1747749911
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C7151800874;
	Tue, 20 May 2025 14:05:10 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 693CB1956095;
	Tue, 20 May 2025 14:05:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 06/10] arm/kvm: Allow reading all the writable ID
 registers
In-Reply-To: <a706e9a2-0a49-4296-ba0a-8001f433b8b8@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-7-cohuck@redhat.com>
 <a706e9a2-0a49-4296-ba0a-8001f433b8b8@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 20 May 2025 16:05:05 +0200
Message-ID: <87jz6bbcoe.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: Y6HZAtlCNZM6

On Tue, May 13 2025, Eric Auger <eric.auger@redhat.com> wrote:

> On 4/14/25 6:38 PM, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> At the moment kvm_arm_get_host_cpu_features() reads a subset of the
>> ID regs. As we want to introduce properties for all writable ID reg
>> fields, we want more genericity and read more default host register
>> values.
>>
>> Introduce a new get_host_cpu_idregs() helper and add a new exhaustive
>> boolean parameter to kvm_arm_get_host_cpu_features() and
>> kvm_arm_set_cpu_features_from_host() to select the right behavior.
>> The host cpu model will keep the legacy behavior unless the writable
>> id register interface is available.
>>
>> A writable_map IdRegMap is introduced in the CPU object. A subsequent
>> patch will populate it.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu-sysregs.h |  2 ++
>>  target/arm/cpu.h         |  3 ++
>>  target/arm/cpu64.c       |  2 +-
>>  target/arm/kvm.c         | 78 ++++++++++++++++++++++++++++++++++++++--
>>  target/arm/kvm_arm.h     |  9 +++--
>>  target/arm/trace-events  |  1 +
>>  6 files changed, 89 insertions(+), 6 deletions(-)
>>

(...)

>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 775a8aebc5d3..8717c5e7695b 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1088,6 +1088,9 @@ struct ArchCPU {
>>       */
>>      ARMIdRegsState writable_id_regs;
>>  
>> +    /* ID reg writable bitmask (KVM only) */
>> +    IdRegMap *writable_map;
> as it is KVM only we may put it in ifdef CONFIG_KVM block above

Forgot to reply here; the CONFIG_KVM block is gone with a725f3710231
("target/arm/cpu: always define kvm related registers")
