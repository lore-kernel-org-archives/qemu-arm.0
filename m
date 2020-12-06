Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497021lfb;
        Sun, 6 Dec 2020 10:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyYpIgEGhReR14qZgxwFf+hLkl3mIbEqVeFxylNSenHzjXCsAGO9dPtZZMGoRkP7k/fPBn
X-Received: by 2002:a5b:78e:: with SMTP id b14mr18491081ybq.24.1607280917337;
        Sun, 06 Dec 2020 10:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280917; cv=none;
        d=google.com; s=arc-20160816;
        b=r9OWgdrdKtuZ9eEIxtQinHbhiy86HLmHt0nAGIXhjsVR/YcPdV3nkqt+tK2YAcT+K+
         S5Wv5IMgBiIK9PPbYXoTDPI8Rmjp4wwiQiO6BOTi8tkRhhzBTITdEVqri7QSTgfFDu+6
         N4BdygN0eVR0IIsPDEJBdTaHnloS7OKgyrg5oJdXk/f/G9Xn9W0gPccE2FhOOEG4OxJB
         NRPutWvVAm7EpEfh2jlgQJVozYwOG+ERxDw4wzPXZrp0TcRTsQymU6CkobgIocg1IDRB
         bLc9PNLTtYWGqYX3jx0SZDWX8SxFcZkDAwmQ/gCO6o5Lh17eSGkh1JA7XKxPHPIqzqny
         wR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=oz3755FMu8d1x8s9I95QQZsr6H/EfAu6k1jRrCig21A=;
        b=MBGL0LLqCjaiSyXOSkyuAo8S3bLAfzL6CehUHXwrlCIGJUL63IXvGIH8g0UVuf8VPi
         ycniF3GpdEFlzFu/YS/T8pJdYdgKCERRjyq6lG+RjsosRa43szrg9eRHl4lAxR5IJqnh
         Bmu/rP2/87sTXl4cQj6/gIFNi5imbY5G1VMy5Zs7GBck5A2sEQOSiBZd8EdCQl0G3B/1
         83oPbKMCt15pR4W4BwB1JFe3+obxm7CRBLDWpSKHXZU32v8E2ly/qODg0eDGcAcjgFMb
         L2p62Z+UERAHGTjn5RIy4a3Xx4H6jwAVpcNtnulpmywvSI2DLvbmcNy4b5DZVE6Bd4Wy
         4waA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XyghoQpJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id g13si8638748ybe.100.2020.12.06.10.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XyghoQpJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oz3755FMu8d1x8s9I95QQZsr6H/EfAu6k1jRrCig21A=;
	b=XyghoQpJOR7foFreAGe7UDE001khSSSlAROjw6uvCKkckAFGGEcV5IPsSmM7gGJmntHc6M
	2Sf9i2HM5letzyg2Zn0pLuaQGVKTVfL+zG5Ds6wGSy8h2+GR/WWanJ1kkbf4b2igTxKCV3
	tzHo0duse6WOtB4RdKMpiUNeatJ4BYU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-oCOsWyWwNICPrDgTBuBnQA-1; Sun, 06 Dec 2020 13:55:13 -0500
X-MC-Unique: oCOsWyWwNICPrDgTBuBnQA-1
Received: by mail-wm1-f72.google.com with SMTP id r1so4333704wmn.8
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5L9zYVEk7UDV9e8J6jUWmDLNneFBSRjTDjE9eeZGMJ4=;
        b=S1VRGV5/Uu+rgQP2RTH4dMDY+Kq+HJmaoCDo4RaONvnkAnbaexBpkLaMtkmYXotsVP
         Fs4vkGGNOOK2M/9qkNM9tMjt+hbWb0UXHFyBIlFmvmOBgP5Jcf7wO7nN5d7rsAjhH1M0
         e6F3jZ8+eklXDjgPEmMnr4sMZLpgxMeWfuieJ5hPVL8ciRE/BqGyqxPToNohiAoZ2TOp
         ZoP8DBB5uwJYnq1DEQr/bdXbmZJRnjESdl26JcWx4ODGi5BcFObZX+cH/0CTNZ8WojVo
         3mIvga6ZDgZ9QxI7FuKOFzkPmMO4KqBNKxEtvjPABXwb0MZIEwdtWqigouBJAKo4rrdm
         5sBA==
X-Gm-Message-State: AOAM530/+btVKihlra/UsFFa4r2rZRPWGdoCiEWlzLxAiWH2KhpOb9+L
	O+lbfWVNIX69CynPZW2EP7k6HvxwjkhqwFgCy7EW+wf9Nh25vhNJGyeAy86AtVuj1vnOZ31dyOO
	6OS1GReICI25AxPT/
X-Received: by 2002:a1c:6056:: with SMTP id u83mr14528845wmb.90.1607280911966;
        Sun, 06 Dec 2020 10:55:11 -0800 (PST)
X-Received: by 2002:a1c:6056:: with SMTP id u83mr14528834wmb.90.1607280911735;
        Sun, 06 Dec 2020 10:55:11 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id a62sm4051738wmh.40.2020.12.06.10.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 0/8] gitlab-ci: Add accelerator-specific Linux jobs
Date: Sun,  6 Dec 2020 19:55:00 +0100
Message-Id: <20201206185508.3545711-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5GEf91IMZ7Z6

Hi,=0D
=0D
I was custom to use Travis-CI for testing KVM builds on s390x/ppc=0D
with the Travis-CI jobs.=0D
=0D
During October Travis-CI became unusable for me (extremely slow,=0D
see [1]). Then my free Travis account got updated to the new=0D
"10K credit minutes allotment" [2] which I burned without reading=0D
the notification email in time (I'd burn them eventually anyway).=0D
=0D
Today Travis-CI is pointless to me. While I could pay to run my=0D
QEMU jobs, I don't think it is fair for an Open Source project to=0D
ask its forks to pay for a service.=0D
=0D
As we want forks to run some CI before contributing patches, and=0D
we have cross-build Docker images available for Linux hosts, I=0D
added some cross KVM/Xen build jobs to Gitlab-CI.=0D
=0D
Cross-building doesn't have the same coverage as native building,=0D
as we can not run the tests. But this is still useful to get link=0D
failures.=0D
=0D
Each job is added in its own YAML file, so it is easier to notify=0D
subsystem maintainers in case of troubles.=0D
=0D
Resulting pipeline:=0D
https://gitlab.com/philmd/qemu/-/pipelines/225948077=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1] https://travis-ci.community/t/build-delays-for-open-source-project/1027=
2=0D
[2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Introduce 'cross_accel_build_job' template=0D
  gitlab-ci: Add KVM X86 cross-build jobs=0D
  gitlab-ci: Add KVM ARM cross-build jobs=0D
  gitlab-ci: Add KVM s390x cross-build jobs=0D
  gitlab-ci: Add KVM PPC cross-build jobs=0D
  gitlab-ci: Add KVM MIPS cross-build jobs=0D
  gitlab-ci: Add Xen cross-build jobs=0D
=0D
 .gitlab-ci.d/crossbuilds-kvm-arm.yml   |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-mips.yml  |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-ppc.yml   |  5 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-s390x.yml |  6 +++=0D
 .gitlab-ci.d/crossbuilds-kvm-x86.yml   |  6 +++=0D
 .gitlab-ci.d/crossbuilds-xen.yml       | 14 +++++++=0D
 .gitlab-ci.d/crossbuilds.yml           | 52 ++++++++++++++++----------=0D
 .gitlab-ci.yml                         |  6 +++=0D
 MAINTAINERS                            |  6 +++=0D
 9 files changed, 85 insertions(+), 20 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml=0D
=0D
--=20=0D
2.26.2=0D
=0D
