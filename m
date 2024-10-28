Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1765732njf;
        Mon, 28 Oct 2024 14:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHelFNbCaYHu7J5/4czRtkjVww/jQzwDsj4ip56/OMa0EWKO3bj06UubUAahrBREJoHPsa3XNb31B2+A==@linaro.org
X-Google-Smtp-Source: AGHT+IF69W8fqMgJTWClNGNe90WreDCvO7KvfQs4iTUdYJDq4p/WnmEymwLIFAXCgiphIuTTOFz2
X-Received: by 2002:a05:6808:3305:b0:3e6:4f27:5c7e with SMTP id 5614622812f47-3e64f275d5amr1319222b6e.21.1730150265874;
        Mon, 28 Oct 2024 14:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730150265; cv=none;
        d=google.com; s=arc-20240605;
        b=A/F3+2B+wVhJYBSI3aHjghm0Cs0DWTZlItme3sX0vQS33JRfzDTHDCFifLLcounjOl
         hDtFoWGdf6esfEAAjyCDLPtLvrOLTIi1xcINE3LJPuHXN9fx7a0i1vEe99EkVHdQV3Qc
         NxrordV9LTYaXNru8yTVCaUuXwElG/92wqaMabmXgiNGXP8qF1IOn1DmsCntEJKmoI2Q
         sz3/VZ9F1AZB1ECbYH+ZShk0s1VyO5EeqUrZK74Rw9R3zDMEJnSPOQR85oBaSF3qQ5ur
         /bFgeFFkkS9C5u2M0tnNKc+u+B4px0aHiStomNEln3sXT1+ZqLrnw1h1Eiodn7Lgbm1t
         EbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=x9yXQx6CUSGYQAyHhPOLAki9LUCVSXELr2t2+lTGyyk=;
        fh=j8iu9gnKkyKRCdyssngZ40t6wHCC1TYvXQdL2AD/0bI=;
        b=eBq3f7RDalhlPRVsYMY+tRcpE/QSNnm/5ae3trlyI8902HQHjMK4CxuRiQdSLOtWxL
         LRGA9sVkoUiQalxXbZexYB5XP1jkP69pDhMlo29FK+CP019UnHt8R2qKDRuXJTSDf3eg
         M2fsB5GNyHMzfuqZqVTclMMDRj/dwrjhOH2DWiE4udZ2qm/xF/pKrE0gu+yArkYcnP4G
         4a9gsWfYlSPqTUOQsBKwO+F+iSUWC/ubBZ2dkR/B+adw+lWXSYn33IFTl10gyq9GmDUL
         DoCCmdFFKwtqt6cMye4YY5HYl/rl4VLlxtQRpA9TICXALpRll4sY1P0SntcLFGdQ7PMQ
         Ok1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cl0wYMzs;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a12bf1si93486486d6.308.2024.10.28.14.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cl0wYMzs;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730150265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9yXQx6CUSGYQAyHhPOLAki9LUCVSXELr2t2+lTGyyk=;
	b=Cl0wYMzsEz3aNwOpCS2Tg/yL8AYkwLXAiBDKrw4QUcVL87pD7gxyeDOoBemQifu3Zv4xrC
	S5Rov8Too83TkpWaVNS5KhRbAMyiEJ6x38ip0xAISOI3TK8SR38/zKM9heOWeidQ1i8iIM
	FskXvrcM8zfYtnpXkCZY+5aF1p91d6E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-Pe_AsnNgMnuLHkrU2oYL-g-1; Mon,
 28 Oct 2024 17:17:42 -0400
X-MC-Unique: Pe_AsnNgMnuLHkrU2oYL-g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EA93195608B;
	Mon, 28 Oct 2024 21:17:39 +0000 (UTC)
Received: from pinwheel (unknown [10.39.208.6])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D291319560A2;
	Mon, 28 Oct 2024 21:17:29 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:17:26 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
	jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Message-ID: <Zx__Zi3Zpg1AspnE@pinwheel>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025101959.601048-22-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: tY53KSUgMz7z

On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
> From: Cornelia Huck <cohuck@redhat.com>
> 
> Add some documentation for the custom model.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index a5fb929243..962a2c6c26 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -2,7 +2,10 @@ Arm CPU Features

[...]

> +Using the ``host`` type means the guest is provided all the same CPU
> +features as the host CPU type has.  And, for this reason, the ``host``
> +CPU type should enable all CPU features that the host has by default.
> +
> +In case some features need to be hidden to the guest, ``custom`` model
> +shall be used instead. This is especially useful for migration purpose.
> +
> +The ``custom`` CPU model generally is the better choice if you want more
> +flexibility or stability across different machines or with different kernel
> +versions. 

Does "more flexibility or stability across different machines" also
imply "live migration compatiblity across host CPUs"?

> However, even the ``custom`` CPU model will not allow configuring
> +an arbitrary set of features; the ID registers must describe a subset of the
> +host's features, and all differences to the host's configuration must actually
> +be supported by the kernel to be deconfigured.

[...]

> +The ``custom`` CPU model needs to be configured via individual ID register
> +field properties, for example::
> +
> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0

If possible, it would be really helpful (and user-friendly) to be able
to specify the CPU feature names as you see under /proc/cpuinfo, and be
able to turn the flags on or off:
    
        -M virt -cpu franken,rndr=on,ts=on,fhm=off

(... instead of specifying long system register IDs that groups together
a bunch of CPU features.  If I understand it correctly, the register
"ID_AA64ISAR0_EL1" maps to a set of visible features listed here:
https://docs.kernel.org/arch/arm64/cpu-feature-registers.html)


Next, I prefix the below by noting that I wrote it before seeing
Cornelia's reply that the name "custom" is not set in stone:
https://lists.nongnu.org/archive/html/qemu-arm/2024-10/msg00987.html.

I wonder if the word "custom" is starting to get overloaded; on x86:

  - Libvirt itself uses the term "custom" this way, to quote its
    documentation[1] for the 'custom' XML attribute:

      custom
    
      In this mode, the 'cpu' element describes the CPU that should be
      presented to the guest. This is the default when no 'mode'
      attribute is specified. This mode makes it so that a persistent
      guest will see the same hardware no matter what host the guest is
      booted on.

  - Some management tools also follow libvirt and use the term "custom"
    to refer to one of two things, (a) a specific named CPU model that
    libvirt and QEMU recognize, e.g. "Cascadelake-Server"; or (b) a
    named CPU model + extra CPU flags, e.g. this is how OpenStack
    uses[2] "custom" to configure CPU models, and flags that can be
    enabled or disabled via "+" or "-":

      [libvirt]
      cpu_mode = custom
      cpu_model = IvyBridge-IBRS
      cpu_model_extra_flags="ss,+vmx,-pcid [...]"

    (Note the "cpu_mode" there: it is referring to the three possible
    modes that libvirt and QEMU support today: 'host-passthrough',
    'host-model', and named CPU models via "custom".)

    The above config translates to this QEMU command-line:

        -cpu IvyBridge-IBRS,ss=on,vmx=on,pcid=off [...]

Now if QEMU introduces "custom", it is likely to create some confusion.
But luckily, as referenced above, it is open to change. :)

    * * *

FWIW, I agree with Dan here[3] that it would cause less future pain if
Arm's named CPU models also decides on a "baseline that matches some
corresponding real world silicon".  I've experienced plenty of such
debugging pain in x86-land from years of troubleshooting live migration
bugs involving CPU model (in)compatibility.  (Often, with help from
DanPB and Jiri Denemark).

[1] https://docs.openstack.org/nova/latest/admin/cpu-models.html#cpu-modes
[2] https://libvirt.org/formatdomain.html#cpu-model-and-topology
[3] https://lists.nongnu.org/archive/html/qemu-arm/2024-10/msg00888.html
    — [RFC 21/21] arm/cpu-features: Document custom vcpu model

[...]

-- 
/kashyap
