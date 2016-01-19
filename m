Received: by 10.25.159.19 with SMTP id i19csp2581621lfe;
        Tue, 19 Jan 2016 08:09:51 -0800 (PST)
X-Received: by 10.55.73.85 with SMTP id w82mr39569830qka.52.1453219791528;
        Tue, 19 Jan 2016 08:09:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f137si38054922qhc.116.2016.01.19.08.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLYqs-00037p-VM
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:09:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYqB-0001fz-GH
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYqA-00014L-4v
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:09:07 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYqA-000147-0R
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:09:06 -0500
Received: by mail-vk0-x22a.google.com with SMTP id n1so196253832vkb.3
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 08:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oUZnUSAEWGbzJpBXNv/Ds41m7IKOdnWlO6UEBTOYlT0=;
	b=YYjfWrpZyB5oiRQeZ3lgDrvr0BFYeDFi6r8NYIKjbGkgQ5EgO5Bk7hYfnYJoxCKfgT
	G5Z14dxCFk/pLYKDeaItLKAFNoU1ZS+x7YNyjqhur1fCbQY41eUz0sHOBKyiE1VgsRsb
	rMaPeRNzXIfl4DfK7U/7VKuo7VKIou0zG6FpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oUZnUSAEWGbzJpBXNv/Ds41m7IKOdnWlO6UEBTOYlT0=;
	b=jKu+cY8Sdya9xijK7h2+tP01+RP86/0waHX7tWgta6rznD9w3Kni0/mZRPu1hRDgrn
	Ljcyta0mQcZ5qCyp0H4k1hDaw9WY9CNNvj+5yWTCyp5ye4KELb4swcNjvSNQp7WtYVXC
	0h2pTcbfXnZOVTYuCl8VzU/UUIba1+xrKNhi8T5UApVkAv6sXoYISv8Vzi1rc/carLlt
	JRSWnAQi7VRdxfHrU5EqtoBaIa4xKFLhJ2gXBYOyMBtZNsBhkazpNXyuehuGju6fQ5oZ
	RQ3UULemtUZ8iaIBwmUoYJZ1wxPlIIfBxGV7n9pyiYffVsEQPzbtKz9fThXEKVWQjs6G
	m6ZA==
X-Gm-Message-State: ALoCoQlJwZrofcXI1dbnn9LusC5WzmAzmMybsuFabHhTwH3HcWnGwNL7qMIDda8XqGnkqchvZ9T2PziqS9oN3++gnjFgNm2apajKrwmAnNJuFH6I7p/qlnY=
X-Received: by 10.31.131.203 with SMTP id f194mr21562096vkd.90.1453219745708; 
	Tue, 19 Jan 2016 08:09:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:08:46 -0800 (PST)
In-Reply-To: <293febec25123074218aa1016d208397873be90e.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<293febec25123074218aa1016d208397873be90e.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:08:46 +0000
Message-ID: <CAFEAcA8rTCJvy5bbnuqW5QhTVB=ArP515NM+qs0sTjMmT2YMhQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 06/17] target-arm: introduce disas flag
	for endianness
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
X-TUID: nLF6R9iOjFwm

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Introduce a disas flag for setting the CPU data endianness. This allows
> control of the endianness from the CPU state rather than hard-coding it
> to TARGET_WORDS_BIGENDIAN.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [ PC changes:
>   * Split off as new patch from original:
>         "target-arm: introduce tbflag for CPSR.E"
>   * Wrote commit message from scratch
> ]
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
