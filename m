Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4835534njb;
        Thu, 12 Dec 2024 06:47:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtl72gBSYB7tNZQwqKbon9dHIrEFYY28W3WR2aUzvAnrftLK8dGJ8U0Ct9oHQlT3DdQ4s4trvCJnAj8w==@linaro.org
X-Google-Smtp-Source: AGHT+IGjcNsHsi806ei54YwVrO0TL7x8clAYNDuwWxINdwenEynOjNQCYAieQbXOVD6nOSPXStcm
X-Received: by 2002:a05:620a:a00d:b0:7b1:ae66:e8cd with SMTP id af79cd13be357-7b6f89bcd6cmr101272985a.44.1734014841611;
        Thu, 12 Dec 2024 06:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734014841; cv=none;
        d=google.com; s=arc-20240605;
        b=B5l5HxjdLKs/uUv81a0MH6Iqzaa85AG2HMHczgyjl5Cydv7jNNvKXLY7IOty1UmP3U
         c1iIHK9CiY9hkwEVZEONTiQaC+GnYw2vs6dOKChMUp73+Ijd2Dv1N/KYjjbzVKkef2f6
         r2ahZFFYRo3qQf+oZxciNaP0mMbm+OC8uhUmv2e9XIMJaNQS3hRR6i65IVhHuqkblI6e
         GKEZI5GAFk7gdVRgWifzHAzENNlvaMFlHRG5gwGdLg2byzrIVLg0RAbesX9bjB7HxVEW
         mHF5mUvWLN2szOYQN+LQYv3gpIqB67yLx2ClOw0D+0n8Nc4BY2BqmV/37t37OKlj47II
         yxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=QNyu7PrLKlSrIw3AX5TXyxxmoYr6/tZMz1aY7e1v5Yc=;
        fh=uASjo3aLPHXkx3j9O0X2FJMn8d4LSmv1eoYwKquDSdA=;
        b=lQ/RuQmWcKu+54FmjTOotWDFxMV3JmWCHrZFbg53gCxyH9nB8497JkopoID9GfaJ8W
         H1rw8Qj5m8dcmjEEoZ5J4vsHsj6ARSvafe0EXl3P8rUyaMmKtOlBbTY/Po8vqXQgBn+5
         u4SGKk4LkMIH2hRxaagUB2eyuemSXf5zLuUQgfzvHL73tY4isFHV4HrR+eJM7l89vOpV
         v/rOs5iofrjMrj2UJ/4mA2++oVQJAjL+EDHkaFrT9KSKQ9iVxPY1QMlCpyWuEW2b8zmi
         fIuSoIskfTp0ni3a8ln1P8gQfaj4smjr469Go/qsBrZrbLT4pX8T4kTF0JuLC7g2O9C+
         1tOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gz5YxHvy;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6f568d943si123416185a.673.2024.12.12.06.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gz5YxHvy;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734014841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNyu7PrLKlSrIw3AX5TXyxxmoYr6/tZMz1aY7e1v5Yc=;
	b=Gz5YxHvyh1MDuRaNE9UDLLas5Cq8TXd3c3ja2dqXtkonma+AiH7prPR7BW6UbS63Zg7+rN
	fiAtN0rscfYmhlVPIIaNfVo7XNYJDjwn92ZnKSEA48bIZWFDi4CsOMH6bF0offPkZlKmN3
	bb7QN5OgojKEjmIIJWTYhhhV1c79MBM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-jpxLElgtPm6A4DdBYkvaPw-1; Thu,
 12 Dec 2024 09:47:18 -0500
X-MC-Unique: jpxLElgtPm6A4DdBYkvaPw-1
X-Mimecast-MFC-AGG-ID: jpxLElgtPm6A4DdBYkvaPw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 096A2195606D;
	Thu, 12 Dec 2024 14:46:59 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EFF8F300FA97;
	Thu, 12 Dec 2024 14:46:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64
 KVM host model
In-Reply-To: <90431f60-e366-50e9-e95e-2ec9c6812056@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241206112213.88394-1-cohuck@redhat.com>
 <90431f60-e366-50e9-e95e-2ec9c6812056@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 12 Dec 2024 15:46:55 +0100
Message-ID: <878qslc61s.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: uTIgbbXxqKpI

On Thu, Dec 12 2024, Sebastian Ott <sebott@redhat.com> wrote:

> On Fri, 6 Dec 2024, Cornelia Huck wrote:
>> A respin/update on the aarch64 KVM cpu models. Also available at
>> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>>
>> Find Eric's original cover letter below, so that I do not need to
>> repeat myself on the aspects that have not changed since RFCv1 :)
>>
>> Changes from RFCv1:
>>
>> Rebased on more recent QEMU (some adaptions in the register conversions
>> of the first few patches.)
>>
>> Based on feedback, I have removed the "custom" cpu model; instead, I
>> have added the new SYSREG_<REG>_<FIELD> properties to the "host" model.
>> This works well if you want to tweak anything that does not correspond
>> to the existing properties for the host model; however, if you e.g.
>> wanted to tweak sve, you have two ways to do so -- we'd probably either
>> want to check for conflicts, or just declare precedence. The kvm-specific
>> props remain unchanged, as they are orthogonal to this configuration.
>>
>> The cpu model expansion for the "host" model now dumps the new SYSREG_
>> properties in addition to the existing host model properties; this is a
>> bit ugly, but I don't see a good way on how to split this up.
>>
>
> I gave this a spin today and successfully migrated a VM between 2 similar
> machines that only differ in the DIC bit of the cache type register using:
>
>  	-cpu host,SYSREG_CTR_EL0_DIC=0
>
> This allows me to get rid of my horrid qemu hacks to achieve the same.

Great, thanks for testing!
