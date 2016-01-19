Received: by 10.25.159.19 with SMTP id i19csp2581516lfe;
        Tue, 19 Jan 2016 08:09:43 -0800 (PST)
X-Received: by 10.55.33.202 with SMTP id f71mr38557941qki.18.1453219783639;
        Tue, 19 Jan 2016 08:09:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si38155350qgh.33.2016.01.19.08.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:09:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLYql-0002sT-1v
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:09:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYqa-0002Vs-Qm
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:09:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYqa-0001H0-5I
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:09:32 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYqa-0001Gp-0x
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:09:32 -0500
Received: by mail-vk0-x231.google.com with SMTP id k1so350765219vkb.2
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 08:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LqknjCjUX2VTl1MyYpe0pbnNMiXzbekBpvX8MUTfYK4=;
	b=N3Uq0UcG2nr7/u8pnxFcjO2nNfnwoCsZ5CwGXs+TRjfSjObf1KkAWh8bUOAoDtPX8Y
	Lhw5TYxpoyHGLY8D1kZMcsr7JF4rHkGhrS6NdS9clva+qvc3BL0FAC7wk1kemO+UIw35
	7eSfaWHToK7Ac3N4Ig17GTQhJMmkQS0166m8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LqknjCjUX2VTl1MyYpe0pbnNMiXzbekBpvX8MUTfYK4=;
	b=RVoYk5tpdy1+tg2h2rFi3ztDknmy/N/IelXdWc1+uDtzBywU6mQkpPxuVnOCOQlIoY
	sh9T6dZwbqV2J8XJUaPDuN1OMJHSRusaIhS8of3Nyt7Zn9QdaiYQz42V14fzwdhMv6Da
	XxdraAZvxjeRBALJCNa//dD8D1fwImignWjytz5YWR3krV4FEmYspeiCV2Wr/knpRm6F
	yZoy9EgpbvMzUi+B51j/RkR/kN2drMKJZb3pL37Vtw8FzBNwgRem6LgBaNrO3/LpQ1NR
	rRfRNSA1RCEpeukoZGQxgHKX4CMh4c92IJN5hPqaF3c7CP1bhvnbC3qzjNR+8Fd4chgI
	zMew==
X-Gm-Message-State: ALoCoQm79kLz9FEh7mFP4wXD7YvZMnla6DQaBzwCJBC3ROu7hnAJHwqt7rwaBHSrBwLHDEe9BKWpPEL4G+XkDE8GVjHpzmyzCCZhjc7l8QHASNm10s9NZAo=
X-Received: by 10.31.52.147 with SMTP id b141mr20846435vka.82.1453219771817;
	Tue, 19 Jan 2016 08:09:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:09:12 -0800 (PST)
In-Reply-To: <f4c3a866026a7246ab93dcb5202ce750d90d5029.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<f4c3a866026a7246ab93dcb5202ce750d90d5029.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:09:12 +0000
Message-ID: <CAFEAcA8HbrVGTEys4=WoVeVNsPEROk456D73YF61GspwbLQN6Q@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 07/17] target-arm: a64: Add endianness
	support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8HzmwZ7NRqVN

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Set the dc->mo_endianness flag for AA64 and use it in all ldst ops.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
