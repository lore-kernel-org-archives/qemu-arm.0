Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4704825njc;
        Tue, 27 May 2025 03:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKzydus1DKRb86j/cbc5E8B+ZM0HRoR/LmimceVqsYwP4l6zjY34lpcVyNW9ePExN3jcZepuP3pNkyZg==@linaro.org
X-Google-Smtp-Source: AGHT+IFWJaxGKAyhcs1B75GQGy/LdUPoFGFvdI/ETD0bqUyCkO49nHkkabuxs9hxL3nKB7FieOP+
X-Received: by 2002:a05:622a:6107:b0:494:7970:f27c with SMTP id d75a77b69052e-49f46d32e09mr205165861cf.27.1748340429329;
        Tue, 27 May 2025 03:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748340429; cv=none;
        d=google.com; s=arc-20240605;
        b=jOsk9reSYz8D6Fi1jFeFURa6lF14i9SPUo6bQNJ271v5X6JncAMv2zlci5mFWue7Xq
         mtbq5QaIUEyhOLo4E3LOnSjELhAsQ2UPApVqHnbKdnHyXZne2E3sKr4JUDTHnZBKt7mb
         PGl/lgUpa1599nk6ZjvNI3cBK2o4Gqk1dpDachm458DQU4RGdXvHdHYsdyiGSPYqe663
         vc2K8NwDR7ltZCdCLZLNROh4YmDchDH2zRBY9rcWJpEJaQBH7Q0ImiQ2XjHwgRUFUxLy
         HVtZXKu54DTo0knJPy/EMcqY0W2PM4MD8rBQDjG9t297Vho7iQDiTtZ2D7X/AuUGnzml
         ZK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=HknLfGhWrCtmGXx/VCFJmPd/NUIKIcmMxx6r3LCgYjI=;
        fh=uUgmBcpPiEzoB3irIM2kUq+agorKl8/NGcKuh2OB9CY=;
        b=Z5gxvrg5vyXwZjkAH5Ihpsl/vaXP4arL40Dhhw63rYn4fruG/5755u2VS8li5MzCvc
         FGA8pOBFOPUa8vIci9AD19X/NtZKWhlJ2oYBo55JdMShlDGXDgpJfe96AWKsB12EdZwa
         nbaJzEB+RhPZFrn0Y/yyMNnR/DZAKu5yDZ8+RDOuhr8Bw97QSsW7iaUlbTyMydwkj/0o
         dFzdEK0GVjRotr4S6lRPXXpPKhLZfgbW4da4xCNy0AySZx0MYr8gpyHNPCNFVXdCefr3
         DEwU/Bis0fPOdYtpr9FtswqDwEphZvO/+IbxnVUkwn2KhjUC9CK84RRDdXYCH8lXOBCB
         lMVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NeTynO3X;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c8f1si257139181cf.4.2025.05.27.03.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NeTynO3X;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748340428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HknLfGhWrCtmGXx/VCFJmPd/NUIKIcmMxx6r3LCgYjI=;
	b=NeTynO3XeTHBWPGJjtQYIi50Go67c+v83smayfUELPWuw6luMIJfP+opa3drqVFdJyMbt+
	SqDeb5/oN4+kZTOy/XaxNOL5hvKOCrpMdGAtwD3KhRs1qryiVkPkAG7M0wdTnImfZg8ZqP
	XR9yfqpV48SyVz6cEHvMoK8zDeIrvTE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-4AEKlbMTN5ObR0CfXOENTQ-1; Tue,
 27 May 2025 06:07:05 -0400
X-MC-Unique: 4AEKlbMTN5ObR0CfXOENTQ-1
X-Mimecast-MFC-AGG-ID: 4AEKlbMTN5ObR0CfXOENTQ_1748340424
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D94B180036F;
	Tue, 27 May 2025 10:07:02 +0000 (UTC)
Received: from localhost (unknown [10.2.16.9])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B217630001A1;
	Tue, 27 May 2025 10:06:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "maz@kernel.org"
 <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "sebott@redhat.com" <sebott@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>, "jdenemar@redhat.com"
 <jdenemar@redhat.com>
Cc: "agraf@csgraf.de" <agraf@csgraf.de>, "shahuang@redhat.com"
 <shahuang@redhat.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>
Subject: RE: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
 host model
In-Reply-To: <87bjrfbkyz.fsf@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <de7db6bc22ad4f0a8ac1fac718c810a1@huawei.com> <87bjrfbkyz.fsf@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 27 May 2025 12:06:57 +0200
Message-ID: <878qmibc5a.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: JtXeTS2bX5AK

On Mon, May 26 2025, Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, May 23 2025, Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>
>> Hi,
>>
>>> -----Original Message-----
>>> From: Cornelia Huck <cohuck@redhat.com>
>>> Sent: Monday, April 14, 2025 5:39 PM
>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>>> alex.bennee@linaro.org; maz@kernel.org; oliver.upton@linux.dev;
>>> sebott@redhat.com; Shameerali Kolothum Thodi
>>> <shameerali.kolothum.thodi@huawei.com>; armbru@redhat.com;
>>> berrange@redhat.com; abologna@redhat.com; jdenemar@redhat.com
>>> Cc: agraf@csgraf.de; shahuang@redhat.com; mark.rutland@arm.com;
>>> philmd@linaro.org; pbonzini@redhat.com; Cornelia Huck
>>> <cohuck@redhat.com>
>>> Subject: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
>>> host model
>>
>> [..]
>>
>> )
>>> 
>>> Code also available at
>>> https://gitlab.com/cohuck/qemu/-/tree/arm-cpu-model-
>>> rfcv3?ref_type=heads
>>
>> I had a spin with the above branch, but Qemu boot fails,
>>
>> ERROR:../target/arm/cpu64.c:57:get_sysreg_idx: code should not be reached
>> Bail out! ERROR:../target/arm/cpu64.c:57:get_sysreg_idx: code should not be reached
>>
>> From a quick debug, it looks like the below path results in an invalid ID idx.
>>
>> kvm_arm_expose_idreg_properties()
>>  kvm_idx_to_idregs_idx(0)
>>   get_sysreg_idx(0xc000)  --> id_register seems to start at 0xc008
>>
>> Haven't debugged further.
>>
>> I am running against a 6.15-rc1 kernel after updating the Qemu branch by,
>> ./update-aarch64-sysreg-code.sh  path_to_6.15-rc1
>>
>> Not sure I am  missing anything. Please check and let me know.
>
> Thanks for trying this out; I'll try to re-create this here.
> (I think I've messed up those conversion functions often enough...)

The conversion functions are not at fault here, but we're missing
registers. If we have MIDR and friends writable, they show up in the
masks returned by the kernel, but they are not present in the kernel's
sysreg file where we generate our definitions from, and
kvm_idx_to_idregs_idx() asserts instead of returning an error, which is
kind of suboptimal...

So I see two possible ways to fix this:
- add MIDR and friends to the kernel's sysreg file
- add MIDR and friends in QEMU's cpu-sysregs.h.inc file, and only append
  generated definitions there

First option means one more round trip, second options has more
potential for messing things up if we keep stuff local to QEMU.
