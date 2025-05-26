Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4172325njc;
        Mon, 26 May 2025 05:44:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLHExhZmA2gfzsChZ2ZHv3qAAPItXO7nlYDRCg28FpfPpYJkx2Ei8yp8A/KiHRw2hSo6Adi+EV9CyZCg==@linaro.org
X-Google-Smtp-Source: AGHT+IHPty7myCVB6S735vPSoMZ1iavp+f+MPRf+U1swm55ZfCkaRzBTVuR+wcVq67+1iTi2Hy+j
X-Received: by 2002:a05:622a:2594:b0:476:903a:b7f1 with SMTP id d75a77b69052e-49f462512ffmr168489701cf.11.1748263455311;
        Mon, 26 May 2025 05:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748263455; cv=none;
        d=google.com; s=arc-20240605;
        b=VcBCZqQU2Hz7PamlmfqtpGyZ/6FeesLpvklSzClFzAcCmA1hgk55sZ6Q15rbiDXdWU
         Og2NsS/9uY2+gNTgIela5jieXbh/v+dg9SeCrTItDRcE02Q+vZr0uwQCh8FlIYWRKpOZ
         4kCGaATiLw2sTJbRtupguIX18i35rOxGE/M9v+gOhsHpw8t0BbIKfYsMCTiiQYRPPbOy
         RXw+yijeVZUluMBzxmdeNXRwEoAqqeEjZZxPSqSt7mxpul8u1Zzz/CGMIQ2jFktNv5mu
         ZRWwLP0HUYcGh/HV+Mc1iwtZirgzzm0SOy0qFKrNYAa1oeT+uh1hwb+TZEhOrn9IMF4g
         75xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=3QKPLW6aaHPX36hnLpuBW8AALVcYrg6oBYgcThXgBJw=;
        fh=uUgmBcpPiEzoB3irIM2kUq+agorKl8/NGcKuh2OB9CY=;
        b=FIiFZNNZndCPjOyVphf2xfsNH48OSJHaNtBMSvalDtp+eVrBCFbDNGsCDoiOBpNuXB
         AptE7wAPshE3sGY6SZc3QpEM8CQWZ+YG3skUJdvXnn+N28Yhi2ftKfdYEuFgWFJaaZTo
         J3bxf+Rx9rK2gsrtffR1tTReZGU059Nh6EzBGhLRb8O+FNi4/fTutqGD9UeU8Xu8F198
         kcRTyFgrTB8DdYw21K4TDg2HY0cmQxtzuH9shWwlIhW2PWEJXU32HqkLmdJemsBcZsm2
         ix/oDDf0Fa6GSlQF+KmCDiUCGDue34zlJ4R15B+yACTCRqkvO/WA24OYOrFTDh5hBNK9
         cvww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aN+lkm1N;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae592c1dsi234016591cf.492.2025.05.26.05.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aN+lkm1N;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748263455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3QKPLW6aaHPX36hnLpuBW8AALVcYrg6oBYgcThXgBJw=;
	b=aN+lkm1NCa+nOqTjK7hO7oVajhmmMcILS09u4C54/qeFWfO3Fr0PUz+i3iVrjc72q7K5Wz
	OeTLToJDz7D/p/eE6B6qXo6t0zknyXPF5gFC7/2ACqpM3LiAn2NRCj66p1lcSgvfU4JPaf
	bznV51Q00gEVk3IHeAo5Xt9wQctq84Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-dMj72G03M5yEDm9qF2LNeQ-1; Mon,
 26 May 2025 08:44:11 -0400
X-MC-Unique: dMj72G03M5yEDm9qF2LNeQ-1
X-Mimecast-MFC-AGG-ID: dMj72G03M5yEDm9qF2LNeQ_1748263449
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC4E4180035E;
	Mon, 26 May 2025 12:44:08 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D22FD180049D;
	Mon, 26 May 2025 12:44:06 +0000 (UTC)
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
In-Reply-To: <de7db6bc22ad4f0a8ac1fac718c810a1@huawei.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <de7db6bc22ad4f0a8ac1fac718c810a1@huawei.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 26 May 2025 14:44:04 +0200
Message-ID: <87bjrfbkyz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: hthkff6ijV9p

On Fri, May 23 2025, Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi,
>
>> -----Original Message-----
>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Monday, April 14, 2025 5:39 PM
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> alex.bennee@linaro.org; maz@kernel.org; oliver.upton@linux.dev;
>> sebott@redhat.com; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; armbru@redhat.com;
>> berrange@redhat.com; abologna@redhat.com; jdenemar@redhat.com
>> Cc: agraf@csgraf.de; shahuang@redhat.com; mark.rutland@arm.com;
>> philmd@linaro.org; pbonzini@redhat.com; Cornelia Huck
>> <cohuck@redhat.com>
>> Subject: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
>> host model
>
> [..]
>
> )
>> 
>> Code also available at
>> https://gitlab.com/cohuck/qemu/-/tree/arm-cpu-model-
>> rfcv3?ref_type=heads
>
> I had a spin with the above branch, but Qemu boot fails,
>
> ERROR:../target/arm/cpu64.c:57:get_sysreg_idx: code should not be reached
> Bail out! ERROR:../target/arm/cpu64.c:57:get_sysreg_idx: code should not be reached
>
> From a quick debug, it looks like the below path results in an invalid ID idx.
>
> kvm_arm_expose_idreg_properties()
>  kvm_idx_to_idregs_idx(0)
>   get_sysreg_idx(0xc000)  --> id_register seems to start at 0xc008
>
> Haven't debugged further.
>
> I am running against a 6.15-rc1 kernel after updating the Qemu branch by,
> ./update-aarch64-sysreg-code.sh  path_to_6.15-rc1
>
> Not sure I am  missing anything. Please check and let me know.

Thanks for trying this out; I'll try to re-create this here.
(I think I've messed up those conversion functions often enough...)
