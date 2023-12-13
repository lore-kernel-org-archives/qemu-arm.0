Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1876651ejo;
        Wed, 13 Dec 2023 12:08:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU6EuRT74vGciiF62WJny/Oh9x6CYcyXBIZCDz3MRbzaf74f+FGppf48Oc/842GRxSJi8s
X-Received: by 2002:a05:620a:1aa8:b0:77f:36b3:639f with SMTP id bl40-20020a05620a1aa800b0077f36b3639fmr9852752qkb.113.1702498131579;
        Wed, 13 Dec 2023 12:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702498131; cv=none;
        d=google.com; s=arc-20160816;
        b=xAU9D9g73bavtpQvPoV3Us/4Ary0ok8CfEiOYCzf4rZ4z8YraxFVHOWJfXh65GnkyY
         oDydyC4ibWvC1kcZbfjFUBHKai6WRNGipy9cOmPd/9bwdode9QTbcO1L08Oqn6On5R/r
         QfU3qz7G15xlydzbXfzD5PNbkq4QRNl8EdtyTlJMEXIfVvidKTtp9yt0jvoeDvatr8SG
         AZP/C6WgF6d8NYBfzlmRb3uCmxoXyEG5KnPoLs08735xfCfS4+Svcq8FwBwTUxEfYfeU
         fPeY0QQVvb8WTspqMkiXPrTMXvi5jWS0tF+F0eXr7JrmWlznIW+mml/ih8FHzFwT5Miv
         4opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=oaPLT/w+GJhxx6euDyuvXTKoL3tEsYpftnOe2O3RcpI=;
        fh=C5+GZ70v8taSp7zpwLKXc8bpiBfIg8q3rcr1RGDPm8g=;
        b=K4Wbjf6/vQluE4sXR+/pE/gU5lGkf+uRJwxIrugKVwN872jsgHA9fh82UYhe/Q6HdG
         YQvrt7qaqiEO6bDjUz1ijkk0YfMm3NIhWm0Vt6O0UJ+m/fJ12SwG+Jn/cu47fhF857E+
         wDzUrjglUr5Dwe/QVSejJI9CHMA6HBMlfvYUGsZ/AlP4Ki7eC+8YbP2WT/m/XJzkdmuk
         f7DTPhV48RKV9BLfjuLB8gEulG8V5UlYEDala6g7cMHq7hHrANVoZXy+ogDrbgPFFaS2
         JPeUZ23eewr++Fb34YHOqKtpPGyZFk6IX7q0AZOsKi++2tnOt3JfkkzUQ89f3XHvsyFp
         yEhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q20k+MmV;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j8-20020a05620a288800b0077da5cf0e36si14128944qkp.354.2023.12.13.12.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q20k+MmV;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702498131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oaPLT/w+GJhxx6euDyuvXTKoL3tEsYpftnOe2O3RcpI=;
	b=Q20k+MmVOoMixOuONEBKqYT3UtZ0OhyEnHHEUsQAzzDHLT7SOJGqLRpjY/ybIDzH9wr6oF
	LrHsn6FURs9AFYPeJd2LCKpbRFwZoD0g/vypbKFE8HoNuuwnF9QQj9KeUDfQdoLxoet0aQ
	PiAMi2Hh8T2LkRwbM1b9W/a26RMyN9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-tr7boWT0NyC4lFUxfgo2Cw-1; Wed, 13 Dec 2023 15:08:45 -0500
X-MC-Unique: tr7boWT0NyC4lFUxfgo2Cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D00978910C2;
	Wed, 13 Dec 2023 20:08:44 +0000 (UTC)
Received: from p1.localdomain.some.host.somewhere.org (ovpn-114-21.gru2.redhat.com [10.97.114.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1324C3C25;
	Wed, 13 Dec 2023 20:08:35 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Eric Auger
 <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw
 Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Beraldo Leal
 <bleal@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
In-Reply-To: <8734w8fzbc.fsf@draig.linaro.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-4-crosa@redhat.com>
 <8734w8fzbc.fsf@draig.linaro.org>
Date: Wed, 13 Dec 2023 15:08:26 -0500
Message-ID: <87sf45vpad.fsf@p1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-TUID: L2bzoNhZIlMg

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Cleber Rosa <crosa@redhat.com> writes:
>
>> Based on many runs, the average run time for these 4 tests is around
>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>> default 120 seconds timeout is inappropriate in my experience.
>
> I would rather see these tests updated to fix:
>
>  - Don't use such an old Fedora 31 image

I remember proposing a bump in Fedora version used by default in
avocado_qemu.LinuxTest (which would propagate to tests such as
boot_linux.py and others), but that was not well accepted.  I can
definitely work on such a version bump again.

>  - Avoid updating image packages (when will RH stop serving them?)

IIUC the only reason for updating the packages is to test the network
from the guest, and could/should be done another way.

Eric, could you confirm this?

>  - The "test" is a fairly basic check of dmesg/sysfs output

Maybe the network is also an implicit check here.  Let's see what Eric
has to say.

>
> I think building a buildroot image with the tools pre-installed (with
> perhaps more testing) would be a better use of our limited test time.
>
> FWIW the runtime on my machine is:
>
> =E2=9E=9C  env QEMU_TEST_FLAKY_TESTS=3D1 ./pyvenv/bin/avocado run ./tests=
/avocado/intel_iommu.py
> JOB ID     : 5c582ccf274f3aee279c2208f969a7af8ceb9943
> JOB LOG    : /home/alex/avocado/job-results/job-2023-12-11T16.53-5c582cc/=
job.log
>  (1/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu: PASS (=
44.21 s)
>  (2/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict:=
 PASS (78.60 s)
>  (3/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict_=
cm: PASS (65.57 s)
>  (4/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt: PAS=
S (66.63 s)
> RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 255.43 s
>

Yes, I've also seen similar runtimes in other environments... so it
looks like it depends a lot on the "dnf -y install numactl-devel".  If
that can be removed, the tests would have much more predictable runtimes.
