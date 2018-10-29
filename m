Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4285834wro;
        Mon, 29 Oct 2018 07:25:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fGTGvdbBRb8gOorIEQLQFB/XNE5R/WIgdYahnJdqxQpgBI9BuWkCE6G7oU2n2s8YK3QkrQ
X-Received: by 2002:ac8:72c1:: with SMTP id o1-v6mr13194060qtp.134.1540823150507;
        Mon, 29 Oct 2018 07:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540823150; cv=none;
        d=google.com; s=arc-20160816;
        b=qNo1tinWY4a1RdjnF6sGNVsM5iM10J404v2cJk9bpKK9T18H4gerMJ+bNpRimNBr9j
         MikndU5iwd7C6+RwkaPJi5U4fC7uUctID20GTh6M9jAPS3pmuZluXuTGi4GPROSxeQs/
         I5JhfyF5ejiBQpfDsrgC8O/9x4KFjnFWngXC3I5z9LDP88axDvM88zFlRlMwB9jJp/ac
         pVQX92WVv/HjLP65mq7Z6mycxcazgWDI8aaDwPk4S7oXQrNEWUeXe+ny+JLIyVFC5JXs
         K2eagqjTIuXro0eC0ibe7eRGjn1Tv+yaKEyydQwJHQPQ7uRGxmO/3nomoLv9bsVaYY6B
         oi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7xrldP4RNMK8V+iZBladrxFVbVmFtSnoyKAIDI7wM9c=;
        b=IZL3inb0PnsZ6FOdPydqcf4QHRBALjd5ohLE8RW8wLGEaaxXlF2FWTCvqBKjWvPDS2
         t7c+6WdMdao6vWpm4hRkQmts3ArKQCrhgRvA69xMLgagK9NJfqijlzuAMfifQjyqrIby
         pKXjL4KCRvDBx5t9hlTiZbFjDESxiUCoWAofqzpvKgCO/MRXVjnArpexvWyimZnwXfv4
         rFccOey0sA6T7LJhC9IsG95CMw5seY7PURa/FINpht8FEBz5FQzJYBeR0yMFLlX1L+IF
         d9XOmS9SAVsVUWD9aCja93+6fYes51DREEwbWV7mUxrjeUoqCfloWt6Y2dfuOgRTv6Zz
         wwsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="X/pbUozn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r30-v6si3231831qta.244.2018.10.29.07.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 07:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="X/pbUozn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH8UH-0006jq-UM
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 10:25:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH8QX-00039r-Uc
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 10:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH8QX-0005a4-2q
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 10:21:57 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gH8QW-0005Zi-GT
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 10:21:56 -0400
Received: by mail-oi1-x241.google.com with SMTP id v83-v6so1237626oia.5
	for <qemu-devel@nongnu.org>; Mon, 29 Oct 2018 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7xrldP4RNMK8V+iZBladrxFVbVmFtSnoyKAIDI7wM9c=;
	b=X/pbUozntf+xbnRhkNYjbjQOaDjdPzc+6d1lvfbq8PYipYTawkVY7e7/92ukwvWm6Y
	1JQhhfOlX5eEWQt4yiJo2fx2KSlEXCy0LUIbyDSWSE9KCxbPz8k1nB83KzQ4k+E2sw/H
	GKG7qggdydYNYMEw4GYOylvxxQgWEfCeQk2Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7xrldP4RNMK8V+iZBladrxFVbVmFtSnoyKAIDI7wM9c=;
	b=GoGO5db6WZgr8CiZTPHlRfMiR6j948jSnhDCpTh0iYsIWZg2IWB/9cMisHCHOs+kYr
	9vMEvkDM+ZVme5i9b0kEULPLijMITemPv40zugBO2L9Qgs2k/sS7XtcQ/ThRO7BP8CRu
	tqKaSFbUjpIsnYmK0ImZvLhoFq1u++YmLAMJSXAMFkALVJrmIPwOs5W9gAbcd6Ji6Oip
	ZYBYfWw6qvXLWcOK3g6mspRfM/Fiz2kqg0cuYheNok50nX6ivsbPFMNElzBzpC7OqEQd
	y3BwEo6Oq0uPLMywf2qoiLG1zshmfyNxRNSp3ypgJbYtQ8Iv5N5pojAo2dl+3mcH8+6o
	S4lQ==
X-Gm-Message-State: AGRZ1gKUhJ0zp7SzzBnGz0H6bkpkbCb3w6VqlucRJ+PVtgUmSvZRYkaZ
	ehnIRC4b6paRGoK1bSdeUaulo+Rflh1jmIkzV/JlVw==
X-Received: by 2002:aca:f1d6:: with SMTP id
	p205-v6mr5958795oih.332.1540822912470; 
	Mon, 29 Oct 2018 07:21:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 07:21:31
	-0700 (PDT)
In-Reply-To: <20181022173559.17111-1-edgar.iglesias@gmail.com>
References: <20181022173559.17111-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 14:21:31 +0000
Message-ID: <CAFEAcA_i0MHixDocr95Dhedj1jqHxA7JPg_1qbW+eAK8qQefcg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v4 0/4] arm: Add first models of Xilinx
 Versal SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H37sgSkzyLL9

On 22 October 2018 at 18:35, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This patch series adds initial support for Xilinx's Versal SoC.
> Xilinx is introducing Versal, an adaptive compute acceleration platform
> (ACAP), built on 7nm FinFET process technology. Versal ACAPs combine Scalar
> Processing Engines, Adaptable Hardware Engines, and Intelligent Engines with
> leading-edge memory and interfacing technologies to deliver powerful
> heterogeneous acceleration for any application. The Versal AI Core series has
> five devices, offering 128 to 400 AI Engines. The series includes dual-core Arm
> Cortex-A72 application processors, dual-core Arm Cortex-R5 real-time
> processors, 256KB of on-chip memory with ECC, more than 1,900 DSP engines
> optimized for high-precision floating point with low latency.
>
> More info can be found here:
> https://www.xilinx.com/news/press/2018/xilinx-unveils-versal-the-first-in-a-new-category-of-platforms-delivering-rapid-innovation-with-software-programmability-and-scalable-ai-inference.html
>
>
> In QEMU we'd like to have a virtual developer board with the Versal SoC
> and a selected set of peripherals under the control of QEMU.
> We'd like to gradually extend this board as QEMU gains more support
> for Versal hardware components. QEMU will generate a device-tree
> describing only the components it supports and includes in the virtual
> dev board.
>
> Before adding Versal support, this series starts with a few fixes to the
> GEM that I ran into when running recent kernels on the Versal and ZynqMP
> models.
>
> I also noticed a problem with HVC insns not being enabled when using
> QEMU's PSCI implementation on CPU's with EL2 and EL3 enabled. This causes
> problems for Linux/KVM guests, also fixed in this series.

Applied patches 3 and 4 to target-arm.next (1 and 2 being already
in master), thanks.

-- PMM
