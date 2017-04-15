Received: by 10.25.0.144 with SMTP id 138csp623665lfa;
        Sat, 15 Apr 2017 05:31:52 -0700 (PDT)
X-Received: by 10.55.46.194 with SMTP id u185mr1660960qkh.168.1492259511949;
        Sat, 15 Apr 2017 05:31:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b43si50279qtb.70.2017.04.15.05.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 15 Apr 2017 05:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czMrn-0000Nh-FI
	for alex.bennee@linaro.org; Sat, 15 Apr 2017 08:31:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1czMre-0000Mk-0n
	for qemu-arm@nongnu.org; Sat, 15 Apr 2017 08:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1czMrd-0004zc-2x
	for qemu-arm@nongnu.org; Sat, 15 Apr 2017 08:31:42 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33686)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1czMrX-0004xG-Pk; Sat, 15 Apr 2017 08:31:35 -0400
Received: by mail-wm0-x241.google.com with SMTP id o81so2296039wmb.0;
	Sat, 15 Apr 2017 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ApJr3miNtcUc5H5RVFkVl15MT6VH/dUegom2F4MK9Mg=;
	b=Yn4yhPJAHOqia3zIqeYHgD+EWRfUt5h9Y96TelssvLFj52h8VEVoAzGNX9VdJcj4cM
	QC6TT4kSixne1QGQOrqp5vtdUyc6VUdvg+3bmuQFnQbqs6EABIHuPpkISkL4Qb2987b8
	raf8V10aBWgsluTPvLLDj5Ax3RVcGQAgKCIOtEMJUrDibzzcfSJQsIs7Ev5dKRZ7dhgv
	xHfJdcI5kKET0tVNEBPar03KUcAl7wil/G6BJtMaOYLKp25ZC5Z6JsUfuVDIrWY4J8cl
	x3bvfEjB3V1Eras59SK1ty80uQF7fx50Xt4vfw3ZAQs1p1s7k/GCt5QWo5AR/PS9/sEP
	pcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ApJr3miNtcUc5H5RVFkVl15MT6VH/dUegom2F4MK9Mg=;
	b=kstB7tM/eTBB5GbykEreHKNO+aI6RBbbgiVkYxAHrNBC4L1Q6wq84bXVRFMx5g3iM4
	H8qm8uc2sSPwPqn43y5dfi0FsuV2sEd84aU6NXyQCho5P7uk6iZnH7f38p9kdKbdYN4n
	h4o252oSKaRaYsniP1qARiSTUx4ntWLiaQ4bs/j1H6T0RSVJv3stIFCPBwA+WLN+WmdH
	RwnFqUto5qI99BUcDssyHxR9IamCEwy7NsMNANnGiyLk1O09X+v18/Yiw7EE+5EXi+mj
	B5OBgK4zIljrjJkCxJ+iugR+1/dtxf+oReSQUyyWtlhdSKOCZFkTta8+y4qiy7cxDs/4
	9iiQ==
X-Gm-Message-State: AN3rC/6wk7UYT6B4Nx6jmMWT3kRP79TX0HDAhMNn84GWZMWaNJO1jYB1
	+rjvHF4WJ0C4cg==
X-Received: by 10.28.195.7 with SMTP id t7mr2478873wmf.62.1492259494659;
	Sat, 15 Apr 2017 05:31:34 -0700 (PDT)
Received: from bigtime.twiddle.net ([87.111.149.139])
	by smtp.googlemail.com with ESMTPSA id
	n6sm6244913wrb.62.2017.04.15.05.31.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Apr 2017 05:31:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0f3ee3f1-5d73-79be-2e7d-45c0385c6758@twiddle.net>
Date: Sat, 15 Apr 2017 05:31:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/9] arm: Implement M profile
 exception return properly
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/QUdlJz3JV3

On 04/10/2017 10:13 AM, Peter Maydell wrote:
> Peter Maydell (9):
>   arm: Don't implement BXJ on M-profile CPUs
>   arm: Thumb shift operations should not permit interworking branches
>   arm: Factor out "generate right kind of step exception"
>   arm: Move gen_set_condexec() and gen_set_pc_im() up in the file
>   arm: Move condition-failed codepath generation out of if()
>   arm: Abstract out "are we singlestepping" test to utility function
>   arm: Track M profile handler mode state in TB flags
>   arm: Implement M profile exception return properly
>   arm: Remove workarounds for old M-profile exception return
>     implementation
>
>  target/arm/cpu.h       |   9 +++
>  target/arm/translate.h |   5 ++
>  target/arm/cpu.c       |  43 +-----------
>  target/arm/translate.c | 181 +++++++++++++++++++++++++++++++++----------------
>  4 files changed, 138 insertions(+), 100 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
