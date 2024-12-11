Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3877674njb;
        Wed, 11 Dec 2024 00:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3RjPRFyLQ9ySyFDAbeK/wzdhFxLWutxKQBpgRouAvqSgL8rG53ATEjXtOqEWzGqesrSSPRylc9wkQgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGejuJ5pXWbRuyrX+NmrW6KUm+QlH6grD0kYxAKPNe706R/bXmMJo9UMG+PKplQxX1vppip
X-Received: by 2002:a05:6102:38d4:b0:4b1:242b:4e2 with SMTP id ada2fe7eead31-4b12904037bmr2127312137.13.1733904115806;
        Wed, 11 Dec 2024 00:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733904115; cv=none;
        d=google.com; s=arc-20240605;
        b=iIyfWo7sxeaM4ImyZ/8DE8Shx4qTFRNb/1sPrmE905Eh6DaqdhH0ouKDx5AndJTrhc
         i18P2C3p+eu6/URb8WAQMmlL7MdTx+bv88ZbfQTQj3O4XqebOO42JS7Hp+R/adJk/gze
         fwRFd3z24C1XmlMVtUGS/pv57iFFB5xqHyNfxGnr65NQZIEUj1M6Vv8ANKl52DPUQRqt
         zwHN6m6/nAw+FzopssB2AEd/4vieQCpc624/4LnrQ6KwF1p2jRFfd0b466nBL5Hj1Yow
         pcIKjYTFKtOzRRdTFRdQ1VuhhYDYECBWGU2jlF+SK0OWulAqvP3tTGVzjqopZs9tZ12E
         SNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hcc+omil9zLZ86uj1io+vFVrjtyesKucHo4fjI37lzI=;
        fh=mrLZ08o9GLILUTdqKBvWmnumrQHIzD2lbCs4PSTqSDw=;
        b=UeUfp3c7Iqf/a1odVYgJXXgresq3Fxirqi2aWLtuYIjtHS8RviYqBtrHlU8ci+TpCS
         Zk/h2PIwHklsHd418LEZLeFqL+BiB6Vgc4zMgxR2q6J+NteK/3SRveG19jVwVPCbFhlM
         UV45oy/zSxc2QYWvl4of2ZyuXkKlGrD3FQbM4vQmiJzdjlRImt/j+tiudv7TW+X+kcN/
         fvxH8vGXMkUXdW2e0+k8wmyOKHVxtFDAuDMPbTgc6gHTdNn5yeCTGN3aZddO7GBRlbPe
         c4WhWU8RaB9WR2kUOJys3WUelLX502aEBxRYi4KSpM7EO66kqA7vESm1xn0g/eRAYv6Y
         ny1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZafsEIPP;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b11c32dac6si889358137.566.2024.12.11.00.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZafsEIPP;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733904115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hcc+omil9zLZ86uj1io+vFVrjtyesKucHo4fjI37lzI=;
	b=ZafsEIPPNl93ydFeWLS4LKtkcjayrEZfrHXeTeEQyoiB+t4vviXEEPlp+3kIW/D0lUvBU/
	srbibpguHzsSaRQo/qHgXjTJrCgviULrmWVO6bZAM0qC5BHuK7tZ+SNeYkfrW+j3y+JKAQ
	u5EzbiFAaX3oQr1FlnGq0qb//vqTIaE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-Nh76YT4uMsmEkIs4oDfkoQ-1; Wed, 11 Dec 2024 03:01:54 -0500
X-MC-Unique: Nh76YT4uMsmEkIs4oDfkoQ-1
X-Mimecast-MFC-AGG-ID: Nh76YT4uMsmEkIs4oDfkoQ
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so6840492a91.3
        for <alex.bennee@linaro.org>; Wed, 11 Dec 2024 00:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904113; x=1734508913;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcc+omil9zLZ86uj1io+vFVrjtyesKucHo4fjI37lzI=;
        b=GEcAjZ5Q7nm8S5juzFlG/gJPytNEekmLh6MCLy/98NLdZ19QlWfsenivaQfrO30o4u
         mQIo15hTB2TCiBlaUFs2gYgVl73VOwaqy96Rzqfwm0jpccevBu6Bhj22JMaTwceSqg/m
         iptibSgcOCRTsqnrYzZghnEv+ZfjtDDfskTeJT3iPbbHY6zBJmehCQXOwi/YktZiUlb5
         cuiUflYJIo7sGUVlGKOFFiPclhs91PsvuaOwgPbjvGSvgMB1AKmCDrnZU1jxVusZjld5
         XLWmm9zjMUqmD35iSOyrGCTgI3YUSa3ZyllM1RfQ1Ty0oAYqDViA5vDCap/zkWfpaQU3
         TWTg==
X-Forwarded-Encrypted: i=1; AJvYcCVB7wQ/7bitaLuwhp8sinEJyPkU8tf8Rj0p7DocL9BN3l7rUmzlqFTupHa+Trk9RN3Q9WIDTeGK9I9aDw==@linaro.org
X-Gm-Message-State: AOJu0Ywe9woxlFr6WNeoMFOPBG6bIqGhbN0b+Ckp51xBVbhQhAWUMhbs
	pTQnabrxFJCUr3AV6s8bN1n9w4Ij9vHjOMutAtmr8gOf8ncbZ38trd+GM2mFYP4fiR8pNL9wN0K
	0A9+JSr+U7mmxpt2B0smWv/2uRlxLPEvot83YSKZhB0XsPzHlcENtew==
X-Gm-Gg: ASbGnctaX7fd2PZk1Bjrutzi5GcXH5zNb9hWtVogmAMBmx5SPaV4gSFJGt+PY5tyf1Y
	ZmJ4/91ntjROloVb+HYAxpfp/hzUgdJMMw8uIw8C+b75KOUT+gjT+AzWYFl/b25FGESDp1ZYMA6
	IS5OIwlr9Vip81QMt5YogSZji4mQqzzkfkUuh9n/COZBrRO7UBXm7UwoJsXeUNDN+L/OVF7eF0r
	r2XiPKCDQM0jY7x/NDTcxfR0WFiVCVzOYaKhY2s7Jt8Qa4LPJ3a7Q==
X-Received: by 2002:a17:90b:4d04:b0:2ee:cd83:8fd3 with SMTP id 98e67ed59e1d1-2f12804a589mr3034313a91.33.1733904112923;
        Wed, 11 Dec 2024 00:01:52 -0800 (PST)
X-Received: by 2002:a17:90b:4d04:b0:2ee:cd83:8fd3 with SMTP id 98e67ed59e1d1-2f12804a589mr3034273a91.33.1733904112511;
        Wed, 11 Dec 2024 00:01:52 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [10.72.112.56] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef26ff97f2sm12981054a91.11.2024.12.11.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:01:51 -0800 (PST)
Message-ID: <cd4c928d-83ea-4e63-b35f-69b71963c929@redhat.com>
Date: Wed, 11 Dec 2024 18:01:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/26] arm: Run Arm CCA VMs with KVM
From: Gavin Shan <gshan@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex.bennee@linaro.org,
 Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Gonda <pgonda@google.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <8504f92d-03fe-4a0c-a647-0003d9c8772c@redhat.com>
In-Reply-To: <8504f92d-03fe-4a0c-a647-0003d9c8772c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WhKa6ldMIYBbviSAssIOYTfVUSrrPKcD3a1GxZQEpJM_1733904113
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 69wIaVdECEIn

Hi Jean,

On 12/11/24 1:01 PM, Gavin Shan wrote:
> On 11/26/24 5:55 AM, Jean-Philippe Brucker wrote:
>> This series enables running confidential VMs on Arm CCA. The host KVM
>> support is progressing but still under discussion [1], so there is no
>> urgency to upstream this series. I'm sending this new version to give a
>> status update, and also to discuss remote attestation below.
>>
>> Since v2 [2] I addressed comments on the QAPI patches. The support for
>> running Linux in a Realm will be in Linux v6.13 [3], so the guest-facing
>> interface is now stable. One important change since v2 is the requirement
>> to initialize the whole GPA space in RMM before boot, which we do in patch
>> 9. The 'earlycon' kernel parameter now requires an unprotected address
>> parameter (see Documentation/arch/arm64/arm-cca.rst in Linux v6.13).
>>
>> Documentation to try this series out:
>> https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/Building+an+RME+stack+for+QEMU
>>
> 
> I followed the instructions, but encountering some issues. First of all, the
> recommended TF-RMM (branch: cca/v4) fails to be built. After switching to the
> latest upstream TF-RMM, it fails to be initialized.
> 

Please ignore the issue. The RMM service can be started successfully with your
recommended tf-a/tf-rmm repositories. I don't know why tf-rmm wasn't built
successfully and all looks good after I reconnect to my x86-64 server. So
it seems the environment was corrupted.

https://git.codelinaro.org/linaro/dcap/rmm.git (branch: cca/v4)
https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a.git (branch: cca/v4)

Logs from the host side
========================
INFO:    BL31: Initializing runtime services
INFO:    RMM setup done.
INFO:    BL31: Initializing RMM
INFO:    RMM init start.
Booting RMM v.0.5.0(debug) 4e2e764 Built with GCC 13.3.1
RMM-EL3 Interface v.0.4
Boot Manifest Interface v.0.3
RMI/RSI ABI v.1.0/1.0 built: Dec 11 2024 02:52:28
INFO:    RMM init end.

Thanks,
Gavin
