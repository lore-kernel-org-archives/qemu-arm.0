Received: by 10.223.161.27 with SMTP id o27csp2109487wro;
        Thu, 2 Nov 2017 06:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RzZJh4K6nyuCxVPfFcJrBj8Ol440R2oRknyXhxsd+RDGbZq6ahBxG1HsoGGXM5DVs3aVKL
X-Received: by 10.129.154.6 with SMTP id r6mr2221946ywg.135.1509629924532;
        Thu, 02 Nov 2017 06:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509629924; cv=none;
        d=google.com; s=arc-20160816;
        b=Vxqnl7ElHFKB9F2ti8Osy+6GtGrn+3n6BWik+rgwvJR5CJu1kUCaCXzYfBjJMixDl8
         +4ptmA17pYqoKjwG+D24wi4aA49gKsb1w5O1rR0+5Z4ljAKGMPpwkOXY2+Rfu3v5YNl8
         KLGODqklFYzmhBknHtwiT2NI3E5sM4FsG0XsK+e03UkQEtQ2xGZaIllPtVryivb6qEIj
         9y0K8X205eO/qkCbfwXm3f0piflsdt63MjJLGmMIC5nx9RSSH2g1cb8T7siXNeubuchD
         TShT2LrlZf08ok1Pxgupk2K4LWYhcutss9snx7frPTQKd9SpT0qABrIlHDjOcYcoIgu6
         Xhjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vZn/mvSfnxPzllRus3a6HAnMlJJX+RNgiq7ESg0n3iM=;
        b=xqsLkQi4+E04o7DuAJEkW5EuY5s2YDSKs0g/+xIqW5NAvW577BCWnGRJRGvP+G7q2o
         tBcOrg7a2OhKQcqjJZSlXOoXPZccS5tualMmSkWYmhCmPvxJ1GOzVf/JIAC22HLvePok
         Wqs/YhZPSflLTUj9T9EMYyMdptIOSSTQIRF3z9ONj/h94JQr59RZ9wAdj7tJyrSb2XAZ
         /LohpT7R/omTe0C8sw7DzoFWxnJsOEHFRBtu4Uz8RrWrHRfgCL+nUvoaL2MQs/PLC0Xh
         qkzLL3w/vF4V8hpEsnNBzERcI8uhYo8CMcKuKiadbB+LM+8uomiOZoY6dcDudz1LIW1q
         f25A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NTMtMn/f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si808472ywc.799.2017.11.02.06.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 06:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NTMtMn/f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAFhk-0006BY-0T
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 09:38:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAFhW-0006Av-Rk
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAFhV-0004kT-Sl
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:38:30 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:45593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAFhV-0004jC-JU
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:38:29 -0400
Received: by mail-wr0-x244.google.com with SMTP id y9so5051669wrb.2
	for <qemu-arm@nongnu.org>; Thu, 02 Nov 2017 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vZn/mvSfnxPzllRus3a6HAnMlJJX+RNgiq7ESg0n3iM=;
	b=NTMtMn/fp63WbAWA/F1/eOre3UdBm3Wfj0BSxIhrYBlArg0P1om3pp7MpLBlOtzrQ9
	bN9pOwlygpzt5fdDn1jFVy3j0OET6YDseO71M6u/MvyiKg+HresbOkqPDmBBWO+dSF9V
	77zfzTF7i/MqSkrMF4cYg1X7+cM8KEFIWphDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vZn/mvSfnxPzllRus3a6HAnMlJJX+RNgiq7ESg0n3iM=;
	b=FxDm4sYCzlrLiizN6U1xcGU+vhp1e54vIJKKbaYqS2sTDRxLrVN76sx49qNYNsCggY
	Tb6c71d8aYqjicH6dfQ5eQKFD/4qS/t2yvnxWS3PZQLJSliiY4PJ7ycEgGUSCuqa2ejg
	FD6T5BFazQ/YGdH4Mb6XxdXmDcPiKhyhmNYG6+Sy33Hq5SU/nAQ8e1q+DtOHv6oGGK82
	ZYOW63bXyyQLm3dn/nDQkIxePHE0Ss4Poi0iMTsh2yZ2//wqXL5f+u3RDrJq35kshcTO
	V/v6bOwJ6BCk+fkgVXVOnQHz6ENignGDs6y607npqEVAR45Lhj+mLwM7ASp4rOMtaWlJ
	kiPQ==
X-Gm-Message-State: AMCzsaWxrWcVWHq3HzsGCsMqPyPEp+89qFXVWreGSqv/GDmlBxipo8tA
	joV5BiPZa6gTj2TZV/Nz0fCNzh/8wS6vg2O0ClWozA==
X-Received: by 10.223.157.11 with SMTP id k11mr3121386wre.281.1509629908463;
	Thu, 02 Nov 2017 06:38:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 06:38:07 -0700 (PDT)
In-Reply-To: <20171101203620.GA17963@flamenco>
References: <20171025093535.10175-1-richard.henderson@linaro.org>
	<4ab3bd81-925c-a281-614c-2cd87fce38b5@redhat.com>
	<20171101203620.GA17963@flamenco>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 13:38:07 +0000
Message-ID: <CAFEAcA-CX90dLbR8ypEidniFmORRZ8u7Pzc3fcaKJSeF9zTK1A@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/51] tcg queued patches
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qZv5erzryHrd

On 1 November 2017 at 20:36, Emilio G. Cota <cota@braap.org> wrote:
> On Wed, Nov 01, 2017 at 18:34:23 +0100, Thomas Huth wrote:
>> Seems like something in this patch series broke a couple of ARM boards
>> (smdkc210, nuri, raspi2, xlnx-ep108 and xlnx-zcu102). With current
>> master branch, I just get this error:
>>
>> $ aarch64-softmmu/qemu-system-aarch64  -machine raspi2
>> **
>> ERROR:/home/thuth/devel/qemu/tcg/tcg.c:537:tcg_register_thread:
>> assertion failed: (n < max_cpus)
>> Aborted (core dumped)
>>
>> Could you please have a look at this?
>
> Turns out some boards initialize a fixed number of vcpus, which
> can be > max_cpus.
>
> The below fixes the issue for me, although I'm not entirely happy
> with it because if -{smp,max}_cpus < machine_class->max_cpus, some
> TCG regions will be wasted. Not a huge deal (in most cases it will be
> 2MB per unused vCPU), but a better fix might be to just honour -max_cpus
> for these boards. We might just not care enough though.

Maybe we should allow machine models to specify:
 * max_cpus (the most they can support; 1 if not set by board,
   as in current code)
 * min_cpus (the least they can support; 1 if not set by board)
 * default_cpus (what you get if you don't ask for something else;
   1 if not set by board)

Then:
 * these boards which always create a fixed number of CPUs
   should set all three to the same thing
 * boards which only create the CPUs requested by the user
   can leave them unset (as today)
 * the generic command line parsing code should stop with an
   error message if the user sets max_cpus smaller than
   the board's min_cpus setting or greater than the board's
   max_cpus, or if they set -smp to less than the board's
   min_cpus
 * the TCG code can rely on the max_cpus global being right

Incidentally every time we add a field to MachineClass we
should add a doc comment giving its semantics.

thanks
-- PMM
