Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6281186lff;
        Tue, 14 Jan 2020 17:17:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwubSKdqrMNsi6z7KTE+x4cLbuQCEMum0bKzAAvuRhlwsKTz2BR2LzNVCJ9pf4ivykOAMMm
X-Received: by 2002:a17:902:b78b:: with SMTP id e11mr23723466pls.129.1579051067717;
        Tue, 14 Jan 2020 17:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579051067; cv=none;
        d=google.com; s=arc-20160816;
        b=tB3LRX7TPHiWhOtHyf07DbwyGVKS3RdlgNQewcl0dDJODFPM89lKnrlYVsJjfjqn5n
         locRpOuxcFLe4QCSgr/nUL/rlB+h0ukaWIs3pJG5yziG/y7aykcesEWJgjW+f47qIOUN
         a67R+COv3BisiP/Q4bEdaRzLaGnVhtepv6SLaXYV4frbmMRyIPhRtPY9zKu18WlKiLm8
         VvQxpq1K+CZOAklXrXH9Hsv/5kn9AU1XgmL5uH3ax6J4GxB1U7rDx7s8Xk2cX0UX1qMb
         6DfmmU+/dSHUCSe4+lizWnS4mt2ifbcVJUIrijG8b9iXVA222eUaupXQ13F9tyVloQdq
         Mxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id;
        bh=99gkGnuR+fyCUwBo9q2bFUdH+iM6AxI4x010jvqGRk8=;
        b=0Uo9TXSy5WoaKLl+cX8IVvhkRntUzLHi4Kp7kqVOsCTSTOHW9DkrKg35BfmXYsPtv6
         H2MvH1hHt7wqdDE0lq0RmSqo9qc4edKoUWefVmwpnCgX5GKIdaIsJocEHqMJ3HjSD7PX
         2d5XLJquSxTcObX0OtVnzRKSsa0bazaEYlGu+r1iPkn4tyjwXj23eu6Tkyy2tE0qzRn1
         djZQ/oA4RbeRjHmWxVyq3NsCK7oe6kAqjoMpGDjDUxJ8kS0FCJCJGTaAewVRQnw/r2Gr
         k5MPhD2mShavTEoMSQ3knkbYz5BygUsaPrpwYIPK8Fe5sOmXPMG9IIKMNNbU8F/t3jno
         CnYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id j8si15699007pfn.138.2020.01.14.17.17.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 17:17:47 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00F1HbRe009195
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jan 2020 19:17:41 -0600
Message-ID: <3ab2ca1f7a9b37b201a58f3a817edc5193e8b1f4.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini
 <pbonzini@redhat.com>,
        Keith Packard <keithp@keithp.com>, qemu-arm
 <qemu-arm@nongnu.org>,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>
Date: Wed, 15 Jan 2020 12:17:35 +1100
In-Reply-To: <CAFEAcA-A_caQgwi5DzExdZChoTg-Qa73hq7Ho7dPLiN633Yj1Q@mail.gmail.com>
References: 
	<11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
	 <CAFEAcA-A_caQgwi5DzExdZChoTg-Qa73hq7Ho7dPLiN633Yj1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: NroBzZf/n7Sa

On Tue, 2020-01-14 at 09:59 +0000, Peter Maydell wrote:
> Note that semihosting is not a "here's a handy QEMU feature"
> thing. It's an architecture-specific API and ABI, which should
> be defined somewhere in a standard external to QEMU.

There is no such standard for powerpc today that I know of.

> You need to start by having a definition for PPC of what
> semihosting is. If you're starting from scratch there, there
> are some important things you should do differently to Arm --
> there is no benefit to repeating the mistakes of API definition
> that we made! Most notably, you want to specify and require
> that any unrecognized semihosting call function fails in a
> clean and detectable way; you also should have a semihosting
> function for "ask for a feature bit mask" so you don't need
> the silly magic-filename approach Arm had to go for. You
> also want to standardize what the errno values are, which Arm
> forgot to do and which makes the errno handling in the spec
> pretty useless.

Keith and I are somewhat of a different mind here. From the perspective
of the user of that API (picolibc is one), it's easier to deal with a
single one and have everybody inherit the same bugs.

Now I understand the point of wanting to fix the mistakes made but I
would suggest we do so by proposing extensions to the existing one to
do so.

> TLDR: don't start by writing code, start by writing the *API/ABI
> spec*.
> I tried to push the RISCV folks in this direction as well.

AFAIK they are still just doing what ARM does for the above reason.

Cheers,
Ben.

