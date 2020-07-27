Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2821394lfy;
        Mon, 27 Jul 2020 05:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BfCxRjVTm0TGDmg/HwrRR2/V6o9vOjJDYOOL4SRbBTOqIjbn008k3eaa/7X5hEepaQyG
X-Received: by 2002:a05:6402:22c2:: with SMTP id dm2mr10512551edb.182.1595853847097;
        Mon, 27 Jul 2020 05:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595853847; cv=none;
        d=google.com; s=arc-20160816;
        b=RR1Zkn/sTBGfhjqpJKCekrG+ibxWIkCBhx+olf1B2wRv7xZapBE4aJxJKHgDkvb7E3
         2s1eguTcpAcZxqqus4zxF0edTbQNEFvpSTCn4iEAkej85D4dxKMUFATfkvKQbJ31b4PF
         4qvZ7NJSFTkjpaMWHzZNXP8it6oazb/WBGwC9W90DEdTOAveeOkVHfXDTShFi7nZ/C9x
         UpGtJWyOiVD8oaosEQVTP73dE3sWIB8MWxN4DQ1K3KJuqAL+ASfLHY5kwR4H035t9adu
         O9m7tQ/yuWvoKvDDDlYBwQcDSYH23EeuBeRTtLJFOuMe8Xx9oKcxG9dra+0Dsif9CxmR
         9OIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=8UktG/rL55bXgnNPU45pe0OjKIi67+A/EjE2HdLjkX0=;
        b=pVGJGi7A7FrrnuYIrZtxaGJ4yn9W789gTsVwl87xX2MGDC5mDgc8QG9Q2N1DTYOEdy
         rcVEsrlYmEdLIe7Cp5sdHTY/16zIW8++KTHK3oMsxaTyk4vUPNC0wwjWfpLFf6RU7cnr
         v1CKLfmwYP9DpV8XModUH2oBfrPPbJHx5mO2isXD/zio+3DW2Qx2hzPwm9UKcVpivv2h
         bOFOYgzg/u8OcftCiLiEgA+fcr3SH06SxGe6d67pJKOhJznnzYAiNZcmCHYzrNr2RXXY
         p4BPa7zsM4w9jVwDJbcz2o7tWcJ/lELQGNcpRBRlqcNudlkcnQLqADqjURlP5Tn7LrUd
         vTcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lnb3uOdi;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id u8si5565232ejj.221.2020.07.27.05.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 05:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lnb3uOdi;
       spf=pass (google.com: domain of cohuck@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595853846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UktG/rL55bXgnNPU45pe0OjKIi67+A/EjE2HdLjkX0=;
	b=Lnb3uOdiof0SgYj/vfCglUrrKwE8C/N+rNrwSMdOe4Yf93NauY2MpJ/hhufZ3j+TUPfouI
	E04t6cqA46YA8tmDBpo4OBWaS6GAjQLavoEWv+mdHqDvieF6ABPV2PEZwOa6t3DAG2KOPN
	Fsl4ab3VnkOYJC5fm319n+7TyCQSv3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-tulNhLGzPa-jaJ4AJvsSqg-1; Mon, 27 Jul 2020 08:44:04 -0400
X-MC-Unique: tulNhLGzPa-jaJ4AJvsSqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14E558017FB;
	Mon, 27 Jul 2020 12:44:01 +0000 (UTC)
Received: from gondolin (ovpn-112-210.ams2.redhat.com [10.36.112.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C963712D8;
	Mon, 27 Jul 2020 12:43:52 +0000 (UTC)
Date: Mon, 27 Jul 2020 14:43:50 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, Paolo
 Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Greg Kurz
 <groug@kaod.org>
Subject: Re: [RFC PATCH v3 8/8] target/s390x: Use start-powered-off CPUState
 property
Message-ID: <20200727144350.47abd7e7.cohuck@redhat.com>
In-Reply-To: <20200723025657.644724-9-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
	<20200723025657.644724-9-bauerman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: CUoZAHngJhde

On Wed, 22 Jul 2020 23:56:57 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Note that this changes behavior by setting cs->halted to 1 on reset, which
> didn't happen before.

I think that should be fine, as we change the cpu state to STOPPED in
the reset function, which sets halted to 1.

> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  target/s390x/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.

No noticeable difference under kvm, but running under tcg seems a bit
more sluggish than usual, and I saw some pausing on reboot (after the
bios handover to the kernel). Not sure if it were just flukes on my
laptop, would appreciate if someone else could give it a go.

> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 08eb674d22..73d7d6007e 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -291,7 +291,7 @@ static void s390_cpu_initfn(Object *obj)
>      S390CPU *cpu = S390_CPU(obj);
>  
>      cpu_set_cpustate_pointers(cpu);
> -    cs->halted = 1;
> +    cs->start_powered_off = true;
>      cs->exception_index = EXCP_HLT;
>  #if !defined(CONFIG_USER_ONLY)
>      object_property_add(obj, "crash-information", "GuestPanicInformation",
> 
