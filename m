Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp456975wru;
        Wed, 25 Jul 2018 01:48:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdMscmSePymIzpo29ooW/gw4tVUQTITFIaJqnir+2tnPJ3OafOq0DZvg+OGd8c5tYri54Wn
X-Received: by 2002:ac8:16a5:: with SMTP id r34-v6mr19764338qtj.62.1532508511680;
        Wed, 25 Jul 2018 01:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532508511; cv=none;
        d=google.com; s=arc-20160816;
        b=YoS2pTO/GLcOJsUKxdnKv6j2maJPVSFki3N08O44bWfWf9mMi0wnTXEV+K8I0kriqz
         cSsheu4y4D4V+AjkciFzsgkzdPWaaCSfg72iPfIR8RRWYNFdErpkeZ89lrIb2PrVviri
         yNNkZN0O60x7/wvoGLevp/SC+d4DNqTSqEAN57rVFhnP/6/kaKrdobP1CFF9JsQ2IMAR
         SwB7w4m47sIW87Z9Jdo4b+tgE57RSzLbFvD7LCa6+1vJZJc7gFx678qbaXRB1Cp4ytBE
         AzTQV2nBhBivW2i9aLn6hxH1rKuLvbaeYeERG/sY/NYd/4CYGJt+7BtflSYYV8bvW8VM
         Zhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=MJlEQjIvY4fmBctvDVzn8CynbLlTKo2oQ96e95LAtZA=;
        b=woLxjDKpegcorqciiUEXCGchonnVH4oAZqosDjJtphx5kf7G9PeXQ5sNvZPZtkHc59
         waGap10JFsmOvk2NHW45Kvd8WNLWmD0JTfQjMtWIP6UnIm5mY6I/vMScfLyDrexTy1U4
         J7fpaurCUypD6nFatHz4NlGzQfqvmzxc+E7LMtnbyu+tJeFrQouUUHxy31pakRW41vx4
         7dWAIhCwTMYjEF0LLdUww13VO+P+JDowyOlRy0HvwwkGJ9jjL/ZMuRs2YMxk8qy2Pn6T
         sP0CNRTW4LL+wqlhTgS7+voqi1YFwbqD+0bA2gSAGYoPWLQA8fbRgeCyzw71AzOo4xop
         GWfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id r20-v6si5222248qvl.133.2018.07.25.01.48.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 01:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ED4D81A4EA7;
	Wed, 25 Jul 2018 08:48:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF92E111DCE8;
	Wed, 25 Jul 2018 08:48:27 +0000 (UTC)
Date: Wed, 25 Jul 2018 09:48:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, radoslaw.biernacki@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725084824.GA12855@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 25 Jul 2018 08:48:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 25 Jul 2018 08:48:30 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: a5l33h/vrv+O

On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
> 
> This patch introduces new machine type 'Enterprise' with main features:

The 'enterprise' name is really awful - this is essentially a marketing
term completely devoid of any useful meaning.

You had previously called this "sbsa" which IIUC was related to a real
world hardware specification that it was based on. IOW, I think this old
name was preferrable to calling it "enterprise".

>  - Based on 'virt' machine type.
>  - Re-designed memory map.
>  - EL2 and EL3 are enabled by default.
>  - GIC version 3 by default.
>  - AHCI controller attached to system bus, and then CDROM and hard disc
>    can be added to it.
>  - EHCI controller attached to system bus, with USB mouse and key board
>    installed by default.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>  - No virtio functions enabled, since this is to emulate real hardware.
>  - No paravirtualized fw_cfg device either.
> 
> Arm Trusted Firmware and UEFI porting to this are done accordingly.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
> Changes since v1:
>  - rebase on v3.0.0-rc0
>  - introduce another auxillary patch as 1/2, so this is 2/2
>  - rename 'sbsa' to 'enterprise'
>  - remove paravirualized fw_cfg
>  - set gic_vertion to 3 instead of 2
>  - edit commit message to describe purpose of this platform
> 
>  hw/arm/virt-acpi-build.c |  59 +++++++++++++-
>  hw/arm/virt.c            | 199 ++++++++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h    |   3 +
>  3 files changed, 255 insertions(+), 6 deletions(-)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
