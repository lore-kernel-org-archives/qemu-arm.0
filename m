Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp357099ejc;
        Tue, 11 Apr 2023 01:58:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YTXE+PyH/DtwboblLYdCZTG0AZOruiicKbe1selTTKvlDxmr0cUenFb3hQMELF4LhkWMTC
X-Received: by 2002:a7b:cd02:0:b0:3f0:7e63:e034 with SMTP id f2-20020a7bcd02000000b003f07e63e034mr8111708wmj.29.1681203498559;
        Tue, 11 Apr 2023 01:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681203498; cv=none;
        d=google.com; s=arc-20160816;
        b=zYnGAynGb1p1lvpKxmzoogMPcB2FyA3a/o6Xv6IlxhLV90e/h6eqUhUDqnmfCacPei
         B50w9GA4I5Cjvb/dCqwS6kZGcKmkohrygvjnS+Tmw5gF3x3ynCN7tckbMoRTCZw7tyVE
         2oXrK4LH3wXQa1Rq8wMaHJ/f+ym4QQ2ikedp+Q/MmfavocnolF0Q/pjlFvSjGz4C0oOq
         K9kQAxZ63/nwdqeTAGDVt6BMVPId3AgDozmPzVofK61aZcNTTbqKI4+nbcQBfOhIHSWq
         v1Ug5BSRbspJ105RUVqvb6UV7O1BJQSWEHPjex/FW/+TFeHmZLiZrS+3iv7f5oxzxZDe
         63UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=tYQNARfOa8tbEcaqHz6ILgvSCbmZ1g80hA9Tr6Qv/7s=;
        b=WIsIBGFkVnr4624rzzUg3ByQlKjJ7cG0WtLwuVyFXmA9g+vmaI+4MJDigK4nhWodPS
         0k11Un2kbLj4JunLlY4EH0Toft3ZG5/+IzQWvOSZQ2ZNf6GTvLqvetiK9/Wlc6jClORp
         LtAwUay3GzYmq/tR5K8QXDmZHSVWJ/LhNErPv06mDSujTxRNym0D0HrMZs4O7FK/Yr7e
         QyXHA0syLXycpq9GbMU45hGlPrNbhY7FKiEmKm23FTG53tO0I0gNEfZ1h3W7cI9zII9E
         e9YgZ0+KCBgOGA3ZYUoO0JpjQUlTgYGZMq6eMvdtBp5eNqhRTCZDBG2/+H51oW17YwGQ
         xzAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=neUyHC2H;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:203:375::27 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-39.mta1.migadu.com (out-39.mta1.migadu.com. [2001:41d0:203:375::27])
        by mx.google.com with ESMTPS id f1-20020a7bc8c1000000b003dc5301b8cesi9035777wml.165.2023.04.11.01.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:203:375::27 as permitted sender) client-ip=2001:41d0:203:375::27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=neUyHC2H;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:203:375::27 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 11 Apr 2023 10:58:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1681203497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYQNARfOa8tbEcaqHz6ILgvSCbmZ1g80hA9Tr6Qv/7s=;
	b=neUyHC2H2EsgiXEob5Mtj9hBifKo5nO/AW+si/QiXgKpMGVBSXS6fKnfwNsh5oUKuyF78L
	DUFGK9EJGWKuLswoWD4ZB5wdvUzRTogHYq8CcRFcDPN4wjxdzuiDVukunMGou81d2jatm+
	+LQm1blIm0+lxk8up+SHqnX/vxRknY4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, 
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev, qemu-arm@nongnu.org, 
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Message-ID: <cw7kze4l7nhttr74j6hkojkyr4nuidxryyzvvr7vcxtu3ihi34@sy6hcuphtlff>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
 <20230321150220.mfrvgxg3ebju5e6k@orel>
 <87ile2rffl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ile2rffl.fsf@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-TUID: gDbZcEMxoHuj

On Tue, Apr 11, 2023 at 09:26:56AM +0100, Alex Bennée wrote:
> 
> Andrew Jones <andrew.jones@linux.dev> writes:
> 
> > On Tue, Mar 07, 2023 at 11:28:42AM +0000, Alex Bennée wrote:
> >> This adds a fairly brain dead torture test for TLB flushes intended
> >> for stressing the MTTCG QEMU build. It takes the usual -smp option for
> >> multiple CPUs.
> >> 
> <snip>
> >
> > BTW, have you tried running these tests as standalone? Since they're
> > 'nodefault' it'd be good if they work that way.
> 
> It works but I couldn't get it to skip pass the nodefault check
> automaticaly:
> 
>   env run_all_tests=1 QEMU=$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 ./tests/tcg.computed 
>   BUILD_HEAD=c9cf6e90
>   Test marked not to be run by default, are you sure (y/N)?
>

I think

 $ yes | tests/some-nodefault-test

should work.

Thanks,
drew
