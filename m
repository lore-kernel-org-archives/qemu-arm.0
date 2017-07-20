Received: by 10.25.44.15 with SMTP id s15csp2556757lfs;
        Thu, 20 Jul 2017 12:53:27 -0700 (PDT)
X-Received: by 10.28.96.197 with SMTP id u188mr872727wmb.73.1500580407157;
        Thu, 20 Jul 2017 12:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500580407; cv=none;
        d=google.com; s=arc-20160816;
        b=vcgy2UMU2qc7H++PO/RXMtqjyE5Gys8UTzYov5Wh7ZmZv3oLJJqclbdBIok+mdLxoV
         oTIypnZ1o6JrijmAOas6lMx6K9q7qvxdGJy0V274YdX+H66Vs1O1rtIOGJ62Cz4SJDcY
         a+LSuF0ZosnPK8Kz1DRtGcw/7Lj/4fagVYPmITRFW8X3B1HdvRdIpwbbNHBAn/edvEi1
         FabqcCfoZPmWSkvBK63hNPyHqthHu+pPLjXGN0CgyU0T8eHIPt0oky1rg9s5qYQBptFp
         9o6HLhaVwD0hP1hT9qH2LA9kN8RyZGdEoiKkpFgvmyTrWlP8DncWekPU+mZPZvqmyORo
         fSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=BnIO6CWH9Dq5LfHGHn0eu2WG/NH1hM35xOMq4p3Q/WM=;
        b=Jr5/lm3Vd5F9UXsw04/MvKJtoQSYKy1PBbBXENH0jeWe5O8oL3GDMXRiHQhFLV2JrC
         YQfjNcsEJQTJwJNc1RWzr2w0dTSgEkCnaur/jG3rg+DMMTtu60/DEgrg2lXygFYbeXUQ
         tfB3rjTS7or627al600jzK2TQ3HH2Q8cUOPab1swlMeyvXgVz3/LY3pJvXHFnhN9jkPq
         pfLEdqjcPaAS2hB3BsywyR/OEVB+X3dEaejrMmM5FAmviq8rjRs/E97z+2Fg8klYU2JZ
         Sh6TTSPZkfVT9qFkIyv7LYVoXNDEIs0F9ZZIrUi+ja9ZDVo12T5Wp3Q1DkY4HdBo1QXk
         SDag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Return-Path: <aurelien@aurel32.net>
Received: from hall.aurel32.net (hall.aurel32.net. [2001:bc8:30d7:100::1])
        by mx.google.com with ESMTPS id u10si6630265wrb.59.2017.07.20.12.53.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2017 12:53:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) client-ip=2001:bc8:30d7:100::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYHVm-0008KB-9b; Thu, 20 Jul 2017 21:53:26 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYHVl-000678-Ii; Thu, 20 Jul 2017 21:53:25 +0200
Date: Thu, 20 Jul 2017 21:53:25 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	rth@twiddle.net
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 00/23] Implementing FP16 for
 ARMv8.2 using SoftFloat2a and 3c
Message-ID: <20170720195325.pjxi45dbm27jzstm@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: bOXb7cLYINIM

On 2017-07-20 16:04, Alex Benn=E9e wrote:
> I then implement a few random functions using the softfloat3c code. To
> keep things clean the helper functions are all in advsimd_helper.c. As
> the two implementations are sitting side by side we need to copy the
> exception flags back and forth to ensure the virtual FPU state is
> correct between operations implemented by both libraries. This can
> obviously be removed is an architecture fully transitions to a later
> library.

softfloat3a uses a global FPU state. As it is thread local, that should
not be a problem as long as we have one thread per VCPU (which is the
case with MTTCG). However, how do you plan to handle the switch from one
FPU state to another for the architectures using multiple FPU contexts?
That concerns at least arm, i386, mips and ppc.

Regards,
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
