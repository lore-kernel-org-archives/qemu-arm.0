Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1713526njb;
        Mon, 29 Jul 2024 03:58:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtWN7+WNqDk3kwpuW73MakXxkTF7+6WraLjdGOdh1SWq84ss+werhEpIh+TnnMNN+hGQHoRuLnQpdb79Z5/qzQknfOqJF7
X-Google-Smtp-Source: AGHT+IFfS+8AcU4tR8CmKoQJMUi7+F21GOw798olAnTj2kAgYHujPFsGNTHHJXQuxbA85EpfsUh3
X-Received: by 2002:a05:6102:944:b0:493:b055:bf56 with SMTP id ada2fe7eead31-493fa61c12emr7875230137.2.1722250720778;
        Mon, 29 Jul 2024 03:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722250720; cv=none;
        d=google.com; s=arc-20160816;
        b=wtyAG7CunUAOHKs5S69as2Itc3YNOhOrkQYiBoDH5iXlMZ+eBUhzC4VBqZTA6guQvX
         zeb5vdWE7cvdBnyAd5AfqFK8xULPGL7yfdBJHiMakQI5bnrvbfxs6PUWBFDykA7SmG4p
         hekswoiKuUbYYcefyWLZK2CmvvbZTktU9FpCw32BA5e5VRGb3QTTHnDCJCAZ6uH+mrXx
         8YfiBtKkG8pV5cQOWvdVBvpRwhXNZWoQmkB5YmHtpldA50iOVn8Hdje3+AgfgW55jFMu
         pkIq0CsMPnzomIoERSyXNRlhcIIQKzb/SoYSprmKeS6Wjd/yMYCwoxOiCXrOTBioi833
         z4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=DJVO6EmDnCOMxh1KXNwzZT/gFc6L6PBNcI8l/LMriwE=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=cKRvLlfpc7v/lc21eCNK9cnvts94HrvGoBj8DPQ/fuuo1zXcx3bP8Sd/X1fOlf7DeQ
         6hx12/aiW5UdGN99J6JDAvo2che88xrHT4fF7+Xwh9e/Z7j5I5rWgi1QU46z/4JhsWzj
         v5CQdcYkxikkoB9NrgCe59Sv8S9CWDiVMRYJeV6nUC20iIA0t5QkfMfKYKkf21BvP5MD
         iO5n0v16h8BB5Ds8q/wxLlgsjCMxr1CVFuwAO0VitRVhprpMZ+Hq5wuRAVvhCQ0qXC5c
         6AVF333ReMCTYAHysEytQnciNAA0jbMKWJny2ayVXUwZdcSvejGjZaX4C+8XX4nlHchC
         s0+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+rj4uWW;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7446602si1025174985a.282.2024.07.29.03.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+rj4uWW;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722250720;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=DJVO6EmDnCOMxh1KXNwzZT/gFc6L6PBNcI8l/LMriwE=;
	b=F+rj4uWW9NhIF5Zbtli5NNaCXjm5VFshJNtvj4Qp68hwbfQU5tzCDFcixgKDGkEZST1Kez
	kg8IQrfLkwKTZqnessrBzpbc5fhmQPHyRG1J1XFfbXq7OB79jkBCpG5P7hUxEEAXbVu4T3
	+1QKBkXDsk/17B1nwFRMx3Qz+Lm917Q=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-K9OQYNd9N4WF8lqAdILW2g-1; Mon,
 29 Jul 2024 06:58:38 -0400
X-MC-Unique: K9OQYNd9N4WF8lqAdILW2g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44C981955D53;
	Mon, 29 Jul 2024 10:58:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A70FC19560AE;
	Mon, 29 Jul 2024 10:58:29 +0000 (UTC)
Date: Mon, 29 Jul 2024 11:58:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 07/13] tests/avocado/kvm_xen_guest.py: cope with asset RW
 requirements
Message-ID: <Zqd10nIix4gXKtDw@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-8-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726134438.14720-8-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 4PU8TTajQitf

On Fri, Jul 26, 2024 at 09:44:32AM -0400, Cleber Rosa wrote:
> Some of these tests actually require the root filesystem image,
> obtained through Avocado's asset feature and kept in a common cache
> location, to be writable.
> 
> This makes a distinction between the tests that actually have this
> requirement and those who don't.  The goal is to be as safe as
> possible, avoiding causing cache misses (because the assets get
> modified and thus need to be dowloaded again) while avoid copying the
> root filesystem backing file whenever possible.
> 
> This also allow these tests to be run in parallel with newer Avocado
> versions.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/kvm_xen_guest.py | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
> index 318fadebc3..d73fa888ef 100644
> --- a/tests/avocado/kvm_xen_guest.py
> +++ b/tests/avocado/kvm_xen_guest.py
> @@ -10,6 +10,7 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  
>  import os
> +import shutil
>  
>  from qemu.machine import machine
>  
> @@ -43,7 +44,7 @@ def get_asset(self, name, sha1):
>          return self.fetch_asset(name=f"qemu-kvm-xen-guest-{name}",
>                                  locations=(url), asset_hash=sha1)
>  
> -    def common_vm_setup(self):
> +    def common_vm_setup(self, readwrite=False):
>          # We also catch lack of KVM_XEN support if we fail to launch
>          self.require_accelerator("kvm")
>  
> @@ -56,11 +57,19 @@ def common_vm_setup(self):
>                                            "367962983d0d32109998a70b45dcee4672d0b045")
>          self.rootfs = self.get_asset("rootfs.ext4",
>                                       "f1478401ea4b3fa2ea196396be44315bab2bb5e4")
> +        if readwrite:
> +            dest = os.path.join(self.workdir, os.path.basename(self.rootfs))
> +            shutil.copy(self.rootfs, dest)
> +            self.rootfs = dest

This is a very expensive way of creating a writable disk. Better to
avoid adding this 'readwrite' parameter at all, and instead create
a throwaway qcow2 overlay for the image for all tests. That ensures
writability for everything in a cheap manner.

>  
> -    def run_and_check(self):
> +    def run_and_check(self, readwrite=False):
> +        if readwrite:
> +            drive = f"file={self.rootfs},if=none,format=raw,id=drv0"
> +        else:
> +            drive = f"file={self.rootfs},if=none,readonly=on,format=raw,id=drv0"
>          self.vm.add_args('-kernel', self.kernel_path,
>                           '-append', self.kernel_params,
> -                         '-drive',  f"file={self.rootfs},if=none,snapshot=on,format=raw,id=drv0",
> +                         '-drive',  drive,
>                           '-device', 'xen-disk,drive=drv0,vdev=xvda',
>                           '-device', 'virtio-net-pci,netdev=unet',
>                           '-netdev', 'user,id=unet,hostfwd=:127.0.0.1:0-:22')
> @@ -90,11 +99,11 @@ def test_kvm_xen_guest(self):
>          :avocado: tags=kvm_xen_guest
>          """
>  
> -        self.common_vm_setup()
> +        self.common_vm_setup(True)
>  
>          self.kernel_params = (self.KERNEL_DEFAULT +
>                                ' xen_emul_unplug=ide-disks')
> -        self.run_and_check()
> +        self.run_and_check(True)
>          self.ssh_command('grep xen-pirq.*msi /proc/interrupts')
>  
>      def test_kvm_xen_guest_nomsi(self):
> @@ -102,11 +111,11 @@ def test_kvm_xen_guest_nomsi(self):
>          :avocado: tags=kvm_xen_guest_nomsi
>          """
>  
> -        self.common_vm_setup()
> +        self.common_vm_setup(True)
>  
>          self.kernel_params = (self.KERNEL_DEFAULT +
>                                ' xen_emul_unplug=ide-disks pci=nomsi')
> -        self.run_and_check()
> +        self.run_and_check(True)
>          self.ssh_command('grep xen-pirq.* /proc/interrupts')
>  
>      def test_kvm_xen_guest_noapic_nomsi(self):
> @@ -114,11 +123,11 @@ def test_kvm_xen_guest_noapic_nomsi(self):
>          :avocado: tags=kvm_xen_guest_noapic_nomsi
>          """
>  
> -        self.common_vm_setup()
> +        self.common_vm_setup(True)
>  
>          self.kernel_params = (self.KERNEL_DEFAULT +
>                                ' xen_emul_unplug=ide-disks noapic pci=nomsi')
> -        self.run_and_check()
> +        self.run_and_check(True)
>          self.ssh_command('grep xen-pirq /proc/interrupts')
>  
>      def test_kvm_xen_guest_vapic(self):
> -- 
> 2.45.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
