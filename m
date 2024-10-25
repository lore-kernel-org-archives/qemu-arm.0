Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1206419njx;
        Fri, 25 Oct 2024 10:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWleK/u6gr+sBoe3wletqCljOk7y2JgIhBjDH8R/tMula/q6CzKUiMXlK/+wTsf0jlM86S5vljD6C66Jw==@linaro.org
X-Google-Smtp-Source: AGHT+IH/9dqqXWwQcKWyDnwVVcHodx2P0j7YD1IiBHY5mKWJYTENkFLqBNstjLtgJzHq2gZLytxv
X-Received: by 2002:ac8:5795:0:b0:45f:7f0:c3fc with SMTP id d75a77b69052e-461258cf3e2mr78602591cf.28.1729875908586;
        Fri, 25 Oct 2024 10:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729875908; cv=none;
        d=google.com; s=arc-20240605;
        b=YM6J1TqcEhk7Nez/mM3aBvi5PhpnEz/akh/J0ln7Cr4GWLkxW1fo3ZIo/88nY4IzoO
         gBhXFqY0gq+F4nJGALc/XWHueZkXVmZ0ZcBcjHyVqyv7er8EfJHDzgmBjC95V5IvX9/f
         vPLxB53FJUvqJglYEWgeprZHWn4q1f5JIuEURiVNlxbs0xZ353apCT+Qr7IFPF1jjGnk
         FivMfd6I98rVjndReW/N3uAKhO1y/zPzU6Ho5AeNszQwxKn7PrOygvuBMPNl2pQwfmMv
         dCgKaRAaZEQtGy8oZm1IKB+8xVtUCp+A5mCh7VtS4a6FhGaaj8kkwnIQthG0qKtEFZOl
         UkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:dkim-signature;
        bh=7n16jx+AM4Q75TF9/4pFmgqIdwkyIqPYbvGYkDGNvgg=;
        fh=TdyXTmdLqzwlDDWpF7QQ46aVNhC8CcvlAiVWl47ijyQ=;
        b=Wu9Qk2B/N2c+fgPwy076utz+ftI4Nszpa8ZYKK7/yr+BGV1/L5B/c1OmKM9IJCUJiB
         FW0amExR3lQbvbgHtYhXwl6e1xSTq0ymxGVocRQdCeZlC16x02lRYJtnPNX/d17lI6kX
         wz/Wsz1hNdl8z5xx+1qkASz3Me+CRgGMxnyMOpyKhcIP0HKsSxGcriV9d6kXUS3/DnF6
         OPsUYTm4cpUoACm4OadvfrxQKY6xXfYM05DlVRh4Jg2ZB1gMLXHSy47vuHTpZJW9c0nh
         FToduKvmJKP3MK7HPyz8jE1MlhEto0tu+ezbVA4mrkXjIixpUUFfjLm/1yw7UACr4Dlh
         0JTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JNy0FXX4;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from nyc.source.kernel.org (nyc.source.kernel.org. [2604:1380:45d1:ec00::3])
        by mx.google.com with ESMTPS id d75a77b69052e-4613213a5e2si18030561cf.185.2024.10.25.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) client-ip=2604:1380:45d1:ec00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JNy0FXX4;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:45d1:ec00::3 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49662A4315B;
	Fri, 25 Oct 2024 17:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16391C4CEE3;
	Fri, 25 Oct 2024 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729875906;
	bh=VAh/4/78mDGKWgIG/y/D4fuPPawGrBhwtluopSQMBjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JNy0FXX4xsONOYlDh5s2CmGeGT+GDA9VoqdO1EcCSbmb6yvktqAly8Cwm+wk7/LET
	 PYPmNfTCnKP1iNCpMseKsv6qG3l5tfK4lNoHOc3D2ABCZ3+y/72XT5ysRwu45aICdf
	 izgbH7mHJiMYcf31kQiNlCOFQJsoycMKUBQZQE7WPgHSaxcToQmY1qaomaxL2qshCu
	 WYYzXNC2csxIfGDGhN/GkbNPwwetYtjAnpJZt0GEfr9hvriYH6mnoZo58CvD6VBNUa
	 fKzpqwnodvXZRAEF3Ek5kY6AiSlGVSLjErUY+SzvjuasM5WVQSjvDfaH1/XkCpZ48G
	 rz1cCwjEXmXAA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t4NkF-006riz-RU;
	Fri, 25 Oct 2024 18:05:04 +0100
Date: Fri, 25 Oct 2024 18:05:03 +0100
Message-ID: <86frok2jwg.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 14/21] arm/cpu: Add sysreg generation scripts
In-Reply-To: <20241025101959.601048-15-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
	<20241025101959.601048-15-eric.auger@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: eric.auger@redhat.com, eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: /6VExwSYtf5H

On Fri, 25 Oct 2024 11:17:33 +0100,
Eric Auger <eric.auger@redhat.com> wrote:
> 
> Introduce scripts that automate the generation of system register
> definitions from a given linux source tree arch/arm64/tools/sysreg.
> 
> Invocation of
> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> in scripts directory do generate 2 qemu files:
> - target/arm/cpu-sysreg-properties.c
> - target/arm/cpu-sysregs.h
> 
> cpu-sysregs.h creates defined for all system registers.
> However cpu-sysreg-properties.c only cares about feature ID registers.
> 
> update-aarch64-sysreg-code.sh calls two awk scripts.
> gen-cpu-sysreg-properties.awk is inherited from kernel
> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
> the original author of this script.

You really want to be careful with this. Both the script and the
source file describing the registers are submitted to regular outburst
of churn (I'm currently sitting on such a series). You really have to
be prepared to see things breaking on each import.

That file has also been known to contain annoying mistakes, as it is
all written by hand.

Ideally, this would be directly generated from the ARM XML, which is a
public set of files. However, the license attached to this package
strictly prohibits its use in QEMU (or anywhere else). One day...

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
