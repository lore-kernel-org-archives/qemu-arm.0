Received: by 10.25.208.137 with SMTP id h131csp1381088lfg;
        Mon, 16 May 2016 11:14:42 -0700 (PDT)
X-Received: by 10.55.56.133 with SMTP id f127mr33215393qka.51.1463422482707;
        Mon, 16 May 2016 11:14:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n24si12135080qki.144.2016.05.16.11.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 11:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2N2Q-0001w1-4U
	for alex.bennee@linaro.org; Mon, 16 May 2016 14:14:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b2N2I-0001hu-9g
	for qemu-arm@nongnu.org; Mon, 16 May 2016 14:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b2N2F-0004iG-Qg
	for qemu-arm@nongnu.org; Mon, 16 May 2016 14:14:34 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b2N2F-0004hf-Mx; Mon, 16 May 2016 14:14:31 -0400
Received: by mail-oi0-x243.google.com with SMTP id w198so31418786oiw.2;
	Mon, 16 May 2016 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=YcSLfciILNU4bZ/dmP4+XbnLw3DaMt+iLCyJcx/80J8=;
	b=aqF6FcgR2jX5m2AKQcFTBEahh1wcu0kxD92uWY6ryafOZ8/5XXwSGYE6L/dP7lK0Nt
	nO+OyNJtpzS749tSq7UBNJw5H1vJjUJ3lU8yxdQRdWgUmv45kWaNP/09gqt220kN/kYF
	iqwOplNjic0xiuffvb+RjQhf8dvoBn+m87K3TjjGAa5Vi62Y7N6x7Hmi45eAeIGcXcB6
	aAneLAMQLxc1bHhDePYt7dx6DJMnc73NLotFHZ/sj2V28aDg38+geDUwr0tQUFfulxpS
	x+9rOhkCY9WAi2FqkKltUQLGhgcDpAFFhWg5F/OPtaEn/XJJB3Si5x6QAFIaErJAjdHE
	O/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=YcSLfciILNU4bZ/dmP4+XbnLw3DaMt+iLCyJcx/80J8=;
	b=Jgh8tSBEMR3Cx7jkNw5gburqNd/FWz1NYD2HO8ortfxI+52srg+iH3Ap9jK8QH2PVf
	S4U7sgu3DqRQx/u//BA7DSt9c0oDD7JS7UpFv42UVuNyigSPzU8+386XCT8wsFnak/Op
	5c6GzxqY9ZQsuNc5zy+YUaMXhufN5cp0hm/TppbMaVw57d8nlJUiZhX4z05b1AenTCPd
	KGLOxKH89m7dh7PfFzPGewk/rmwa1uhH3EX909inrD0inh/96JKN9ZxITHPgf0QMxwxf
	UqQ08axeoKPUY/MVUt+0d9SmgRwfiMreQxHyaeMlcT7O5DQWfe8C0iEMbGkCPKo75Lq+
	LqEQ==
X-Gm-Message-State: AOPr4FUn+fnybCr98Gjc60W1M3wvCaPNTiFvNlJZ7oziBj87Fito7bOlsjG/NXJH7X7pF8KjqxOJCkjaJVnSBQ==
X-Received: by 10.202.207.85 with SMTP id f82mr18678298oig.44.1463422470988;
	Mon, 16 May 2016 11:14:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.193 with HTTP; Mon, 16 May 2016 11:14:01 -0700 (PDT)
In-Reply-To: <CAFEAcA9HJwJqrmJeF7yD6juO4gmt2fqQ_Wo9cVhh7c=Vp1AWcA@mail.gmail.com>
References: <ea5aae4b10283de4705b864fe9d4bd2eaddaacae.1463174342.git.alistair.francis@xilinx.com>
	<CAFEAcA9HJwJqrmJeF7yD6juO4gmt2fqQ_Wo9cVhh7c=Vp1AWcA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 16 May 2016 11:14:01 -0700
X-Google-Sender-Auth: _KGq3fOBxk2Ei9f50B0gucE3DS4
Message-ID: <CAKmqyKNcXqr3YyYwb852yq0M6LEdcaJqFgsm=d+SjpWV249PnQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/1] target-arm: Add the
 HSTR_EL2 register
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8WGnNDhOAlvj

On Mon, May 16, 2016 at 10:43 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 13 May 2016 at 22:28, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Add the Hypervisor System Trap Register for EL2.
>>
>> This register is used early in the Linux boot and without it the kernel
>> aborts with a "Synchronous Abort" error.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>
>
>
> Applied to target-arm.next, thanks.

Thanks Peter

Alistair

>
> -- PMM
>
