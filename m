Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp559363ejc;
        Thu, 19 Jan 2023 11:07:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQLJ1oldCOIJ5u+KPSlNX5FB95ncf0/7v0yTnEKpoipwrSVY6+K6MqtADkmB/YpyxA3nz6
X-Received: by 2002:a05:600c:3495:b0:3db:a3a:4594 with SMTP id a21-20020a05600c349500b003db0a3a4594mr10170049wmq.28.1674155276905;
        Thu, 19 Jan 2023 11:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674155276; cv=none;
        d=google.com; s=arc-20160816;
        b=C9EcrrLJgPmLND4mzBjeGfuKMl/pbN5NLw1bPFFl2tndFN9uIY2gbbTwTOOXAyXZPa
         /1mNBU0Q0JYp9UwgmoH+qZ2uwqnY6T40PKIjzoVXIT+8V1GQB4KLgpcpXgdCJb1CGT3X
         2frWFbYC6pEnhvJ4sHc7BIgD/E8mnYfZ12Cdth/gzdQ5sUtsaiM+FdSNbUcNFj9KTbhg
         ckMl1/ZmwKQz/DnykU9zSdb2bwzdVUS5DrYKLlwcT0IPfrnmPfCksNFhye7ws9eZl/pd
         DOfFPvcarK1s6D2S523caX1v6IuY1kbAwzeHai4RyhRIF+l3XTyl4xOLxJM/hGDw0JhA
         Ox9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=w7I1W5CWg/LENy6VDuyLGzRAH+xMKRQ96FXlbBo05pU=;
        b=vAUVTsFXSPrXoPdLdi1HWyiOF5Jkcmr5UVumvE6oydnqMiW5DCDvTTPB3qo4dXogHb
         CoV8xKZ2RA/KSqpTnIggljibwxKBIhjHnFXATGnwpos0yBSCELhjB//qUiMROw+PWt05
         pcpdk/XoJg/qVLPjAmIkEnvwLkp3Eo7MegX0zArFVsQY5PEEZs6cxHZpHjMwceDzYeuj
         EP/NVG7NVElr8ngM0fESCq3M+TjIYaUiP5SsqaBU2iaemMjkd4jeBdajN2fbB38BGfxw
         HY0o5D8fj+/PZ3Uvr0C5eBl4IumMGB3hfOX3bAjJzCDOp9fwSBRaJ6egc+tRZrBcOu0L
         POdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=T+1pxWUd;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id j20-20020a05600c191400b003d1e3e54bcbsi66582wmq.9.2023.01.19.11.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=T+1pxWUd;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B1FA21A09;
	Thu, 19 Jan 2023 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674155276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w7I1W5CWg/LENy6VDuyLGzRAH+xMKRQ96FXlbBo05pU=;
	b=T+1pxWUdpyet95C+SyxNVVEq1hiKdyHeCgdvWIMn/lrwdMIQ49DYWoeENxa7vXynJq2Udy
	f72WUM1i484eHq/yajRPIaZBLQvHSxLHbUSQmELd0GW65EyNWhALs5Jeevtt+YcRp49V3j
	sR0uiTt5FiVU3dSxlXniekXpCR+d/GE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674155276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w7I1W5CWg/LENy6VDuyLGzRAH+xMKRQ96FXlbBo05pU=;
	b=dyMEzC3RjDnxl6JaQgnOwAenmF6hmFhylWEuFWMQwxSz4dSQgIk0qnHaorD7QfzFw7fxrd
	aPsI74hHkWTa5KBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7068139ED;
	Thu, 19 Jan 2023 19:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7JSkHwuVyWOiNQAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 19:07:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v4 01/15] target/arm: Move 64-bit TCG CPUs into tcg/
In-Reply-To: <6fb8d60e-4283-1429-fd15-f8b799d277cf@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-2-farosas@suse.de>
 <6fb8d60e-4283-1429-fd15-f8b799d277cf@linaro.org>
Date: Thu, 19 Jan 2023 16:07:53 -0300
Message-ID: <87mt6e4a2e.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 5YjIPxvCCG2b

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/23 03:54, Fabiano Rosas wrote:
>> Move the 64-bit CPUs that are TCG-only:
>> - cortex-a35
>> - cortex-a55
>> - cortex-a72
>> - cortex-a76
>> - a64fx
>> - neoverse-n1
>> 
>> Keep the CPUs that can be used with KVM:
>> - cortex-a57
>> - cortex-a53
>> - max
>> - host
>
> All of those cpus can be used with kvm, if and only if you have matching hardware.  There 
> is no rationale for considering any of them differently.

But is that allowed by QEMU today? If so I must be missing something. I
see that kvm_arch_init_vcpu looks at cpu->kvm_target, which is only set
at kvm_arm_set_cpu_features_from_host, called from aarch64_host_initfn.

    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
        !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
        error_report("KVM is not supported for this guest CPU type");
        return -EINVAL;
    }
