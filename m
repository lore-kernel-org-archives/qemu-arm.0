Received: by 10.80.166.35 with SMTP id d32csp1405632edc;
        Fri, 21 Oct 2016 08:00:51 -0700 (PDT)
X-Received: by 10.55.74.6 with SMTP id x6mr1670898qka.316.1477062051494;
        Fri, 21 Oct 2016 08:00:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h67si2139926qkf.178.2016.10.21.08.00.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Oct 2016 08:00:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxbJT-0005Sz-0U
	for alex.bennee@linaro.org; Fri, 21 Oct 2016 11:00:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bxbJN-0005RH-Os
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 11:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bxbJM-0007ZH-N4
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 11:00:45 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bxbJM-0007Yy-CB
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 11:00:44 -0400
Received: by mail-vk0-x231.google.com with SMTP id 83so119380908vkd.0
	for <qemu-arm@nongnu.org>; Fri, 21 Oct 2016 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZTi4tevjjThtjPPYOz1PVkoOtkSAVutt7R5RC/0UbFE=;
	b=O5G2Oidj0Qokzlup1jNDurm+cLisy3P7Erza/baykt2O0i55xVnyupAH5S2wCNy2VW
	Yfoy4cvY0wHueaCKii1nTamDo86NFe4HlAmM0v3H5d78TeG9a38Mf+59HEwJ0gD53rXx
	WiPhxVtUDkceoBYpAVTZ501rxhE5dVfjWUTno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZTi4tevjjThtjPPYOz1PVkoOtkSAVutt7R5RC/0UbFE=;
	b=HajuJqcdEMM90HG0YLRWVLlZKGcWdJQA2sanMiqLeP/KDQNp2jUXIETEwWSHMVxV4J
	SMr8w7KogpjauakTxiNZrPWgaYOR8vKDl/yAnqKfTBBr5kGWKqDlj6xZqBvLDB1ylx0c
	w932AwYbmBDNsH+DrqJn2QezYSDW1a6EkxP1qYuwICEmJF59AFnAu6gL9nUPdq+ulp+y
	6afiXzRkpNjc+aYlE8gRGCkLvtQ0lerEiZ+5mVFmIjDWSQ9Qh3XtJ8p5YbPECfdG8g8J
	mc5fO7NQB42WEnMXsdcCTiegI6YALpiT/pyDPP6f1RNpmJkbon1snVqDHMbE9oOj2jRS
	BBXw==
X-Gm-Message-State: ABUngvfzwf3/sZPD0xXngOrrAWCiUeduuORizcCIjujPUx8s1ZdVhOZCdOpqHD6Ww5/7QOpmyRxNSUBkVyaX5rSS
X-Received: by 10.31.165.74 with SMTP id o71mr1139984vke.95.1477062043209;
	Fri, 21 Oct 2016 08:00:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 21 Oct 2016 08:00:22 -0700 (PDT)
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2016 16:00:22 +0100
Message-ID: <CAFEAcA-B02O59nTVYorqqoPjYrzCX4bQhbZkgvFAg2si+oJL1A@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v3 0/7] Runtime pagesize computation
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 89djZm9iqbzO

On 11 October 2016 at 18:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> (I posted version 2 way back in June...)
>
> The basic idea here is that:
>  * the target CPU implementation has to opt into variable page size
>    by defining TARGET_PAGE_BITS_VARY, and then calling
>    set_preferred_target_page_bits() in its realize function
>    with whatever the CPU as instantiated actually requires
>  * the machine also has to opt in, by specifying a new MachineClass
>    field which states the value they guarantee will be no greater
>    than the preferred page size for any CPU they create
>  * we finalize the decision about page size in cpu_exec_init_all()
>    (and then later attempts to create CPUs which can't cope with
>    that decision are failed)

> REQUEST FOR TESTING/PERFORMANCE BENCHMARKING:
>
> I have only very lightly tested these and haven't attempted
> to measure performance at all. Further testing and
> benchmarking reports are therefore welcome.
>
> In particular I would like to know how much of an
> effect on TCG performance the assert() in the definition
> of TARGET_PAGE_BITS has, so comparisons of all three configs:
>  * before this patchset (ie TARGET_PAGE_BITS compile time const)
>  * with this patchset (with assert in TARGET_PAGE_BITS)
>  * this patchset, but with the assert commented out

So I found the time to do some benchmarking. This is of
an ARMv7 guest running a workload that is "boot up
kernel and userspace (via systemd), run a compilation,
then shutdown". This took about 5m9s to run with current
master, and 4m14s with this patchset, cutting nearly 20%
off the runtime. Removing the assert from TARGET_PAGE_BITS
was barely noticeable (down to 4m13s) so I think we should
leave that in.

On that basis and given the code review from rth I'm going to
put this into target-arm.next.

thanks
-- PMM
