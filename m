Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp823474njl;
        Wed, 2 Oct 2024 06:43:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU83IExa+K28fBqGbeNrFaTlEBsuTur7MNPt2OB1rXp7HMvYUXyiOhZUBwvorYiCKgZ0n9shHsO9GBNSg==@linaro.org
X-Google-Smtp-Source: AGHT+IFKMJfhq5A72KuSWPmF8IulBdLzpnn3m/IGGvv4xpLj/u2XBt+2sS7mFjeiywAd4iYqelF7
X-Received: by 2002:a05:622a:346:b0:458:2b0f:6b59 with SMTP id d75a77b69052e-45d8055d3d2mr43864061cf.48.1727876580844;
        Wed, 02 Oct 2024 06:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727876580; cv=none;
        d=google.com; s=arc-20240605;
        b=K+eArrudcvMl2+v9DDA1XMybtEGwoBI2dZOu4S3PayGcA4Uc1URG3dVctIrRzquITN
         s6JlWMErVDxvhZBPrMfvJnR524sL4gSTNf2DAciH07bfVhFqP+bb9XqzQ8V1mqnJlpq5
         DSQviP6YG9ldtaSp6llEAY2LSsvlRD7+AZ/+y9IBtnaGxSY6byDuE4O9kAUgwU/QtACU
         OWopT/aeHdnhmzLbAicLphYVylQiewSkp9yhJrGYRgTSg9mJSioaWOWndeGDJdM87vNu
         i6bodm4Tve0NWNaAUCJhzCDILmwyeeVc5+ZJFd6ZLhemURMziKVmW1eOrzge9kyc9YCn
         T6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=6Fb/y5yvx0N7qhYFWCGLS6xYK9c5/NuNTUJKmqX+Cuc=;
        fh=pSKEnZIo/VdD6WIYczYhtr0lD4xEKmi1POYwB2P2j9M=;
        b=KSzYpsbqdCfFBEPbISgDHBYllrbUPSP7EVBCDujduZbSs0t3QXtcigMTFNjlxNwFUH
         e4iurAZ05f3RL3hI1tSFOO7KN3o2HCH0+FtH3kRhMc08FIVTTT/vQABwFJbgRVRD7Tnt
         evnpBgsA9kHESp4qcaPoaQx7zO0xOvDb+VIgjnWS8yHqVOInbr0vnbznVyjtiW9Ak620
         OUB+bjPJQPURYvZE5TX+GZgMiGzUa3LB6H3t+U3RkUNpCikOwLGQhgRi++7gmpRw4ANr
         WSamMrdbUvpxYuGEo+HKyXjGuN+x6VTUS8y7lcWhHOEP61rTZ/4ebfgv9xtd3qY0pA0X
         aMjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZAQAgY3w;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f290809si149760771cf.22.2024.10.02.06.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZAQAgY3w;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727876580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Fb/y5yvx0N7qhYFWCGLS6xYK9c5/NuNTUJKmqX+Cuc=;
	b=ZAQAgY3wicmKFSipNK4WzkXVBbCfgMEzzrZG0fQY4LgzFbpYDv/+K9vsJtutMEy8yAUw4D
	vQG6v97MvlCz0MVwSHia8OqhaVpUE/yFXx+ambHHquVkx18+hoNIAj6HrH0wqNtjmDRoaw
	wKxn+DcDUiA9OW7NkfiAKebg/atnilw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-5JLUlNadM2q8xmAwOmLmDw-1; Wed,
 02 Oct 2024 09:42:57 -0400
X-MC-Unique: 5JLUlNadM2q8xmAwOmLmDw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A18631944F07;
	Wed,  2 Oct 2024 13:42:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.48])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69C1C1956054;
	Wed,  2 Oct 2024 13:42:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>, Ganapatrao Kulkarni
 <gankulkarni@os.amperecomputing.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
Subject: Re: [PATCH V3] arm/kvm: add support for MTE
In-Reply-To: <f3da8f58-615b-42ed-a99d-20bfd9ec6b56@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
 <87tte3sxkx.fsf@redhat.com>
 <f3da8f58-615b-42ed-a99d-20bfd9ec6b56@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 02 Oct 2024 15:42:49 +0200
Message-ID: <87a5fmsjs6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: Z/BqplNx6y4F

On Thu, Sep 26 2024, Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Cornelia and Ganapatrao,
>
> On 9/25/24 14:54, Cornelia Huck wrote:
>> On Fri, Sep 20 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:
>>> +
>>> +        /*
>>> +         * Clear MTE bits, if not enabled in KVM mode.
>> Maybe add "This matches the MTE bits being masked by KVM in that case."?
>
> Clearing the MTE bits is also necessary when MTE is supported by the
> host (and so KVM can enable the MTE capability - so won't mask the MTE
> bits, but the user didn't want MTE enabled in the guest (mte=on no given
> or explicitly set to =off), so this comment is not always true?
>
> How about something like:
>
> "If MTE is supported by the host but could not be enabled on KVM mode or
> MTE should not be enabled on the guest (e.i. mte=off), clear guest's MTE 
> bits."

s/e.i./i.e./ :)

Otherwise fine with me.

>
> I do assume MTE is supported by the host (i.e. MTE bits >= 2 in the host)
> because otherwise condition "if (cpu_isar_feature(aa64_mte, cpu)) { ... 
> }" is not
> taken; and at this point cpu->isar->id_aa64pfr1 is set from the host's 
> bits via
> kvm_arm_set_cpu_features_from_host() and kvm_arm_get_host_cpu_features ().
>
>
>>> +         */
>>> +        if (kvm_enabled() && !cpu->kvm_mte) {
>>> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
>>> +        }
>>>   #endif
>>>       }
