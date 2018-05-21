Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp439870wme;
        Mon, 21 May 2018 09:06:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpeYGwH/T/YJc8XUWfybDCAJbSYJ5qjuq87+68hAzZxqFbHBBj7wjCZWld4j/sH9z2WWNOu
X-Received: by 2002:a37:7b86:: with SMTP id w128-v6mr17802064qkc.15.1526918807650;
        Mon, 21 May 2018 09:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526918807; cv=none;
        d=google.com; s=arc-20160816;
        b=IdcizZSBpZfg5QGzsLTBWQgpQxyGzP0EhbhLI05OA96201NRxnnU5B5SF07xvMzs1x
         xiFbbXDregyGWyuQHA/LGzXCyZ9n7i81EUcd0jt2405ucUlPP7TuLzzWsuQCnPWmb4Yk
         NzANy9ZsSL/BIzqI4+2m9aMJR8jHldbUilyI+tzdBU7yNNSzRQNsXaE6Ulw9Z2ipdFyU
         nZNJla4MgLyXNdunyWOUAFt+tyQDS1f22F1mWTeFDy2O/CMGcGC6bqmuzq5DJ9XSVFEb
         tYhXYsm0zwRKvt5MtOFPc4cZT72jVri/UHdKpFdnS+iV+5KnL2SjKV37ziUXRcixgIKp
         m+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OIxs6iCzBZMo88llenxjQ8un7SG7dUdyKJ2HhSMpiiM=;
        b=hDt/zB+wC9s9Eh0IcUfVzJyk1RJOp2wWT6+4cGmOBqxh99/YhR2zplolRSlT7g5JWQ
         mpROPlvnb3WPq5V114UzCEBPGEk6qxPauoihPcWKP32C2ZLldH0aDrmlQLriDbGVLCr5
         +3ADtOzB5t1hGwgh49YNFo/2MN+36bjqD+bAWzHEKao5CMhrFddKX3RxEX/zvq9B3YVV
         3R5SPwDXr36+ZKm918oj74EQc+H8lDqwvBnSvKG1eb7PEtrcLdEk2ZMm1rU9ufMGsJE1
         FtKfEaRBbfL7bAdgLYbIsqVf3ySVRQNjgmtaeBJRJgTDHRoWJFP5ac1RH8SsTdC3HUjZ
         1HUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhB68tCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6-v6si12287404qva.1.2018.05.21.09.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 09:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhB68tCw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKnKg-0005Aa-8l
	for alex.bennee@linaro.org; Mon, 21 May 2018 12:06:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fKnKX-0005AQ-38
	for qemu-arm@nongnu.org; Mon, 21 May 2018 12:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fKnKW-0001we-50
	for qemu-arm@nongnu.org; Mon, 21 May 2018 12:06:37 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fKnKW-0001wB-0B
	for qemu-arm@nongnu.org; Mon, 21 May 2018 12:06:36 -0400
Received: by mail-oi0-x242.google.com with SMTP id y15-v6so13430566oia.13
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OIxs6iCzBZMo88llenxjQ8un7SG7dUdyKJ2HhSMpiiM=;
	b=BhB68tCwYZTQd/yKKzODwrx6J1PeEMcFM+csuERlvLLftaL81Z6FV2YEnwZRtWoNZB
	FV2VqaHViv0kAYgMDZa/19MLYa9TYbteU31thF7l/6txB8Iiqo433PHJ7ZdlC/DyMPoo
	l4UErVRxUba8cBlOCIGJqoilE7VseKJ4Cs2W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OIxs6iCzBZMo88llenxjQ8un7SG7dUdyKJ2HhSMpiiM=;
	b=JjVSMKqnPx8qugpeYCF/kS9vqRgwXm6TYRi+a+/psDdGkRINKWcjKWOUMEcmEPkogH
	BQ8QJFhe/HXTJYLMslzYRHLMEvlKPzsdCOE6YqWjZWyEZ+zWIGB8SI2rRknVvsouyKrC
	/x3V1NLasAxhRL4wkU+I5n4TySeEcLsaFLXOeC3jRNFEZaw1t9HR3b22ely+XyUHAAfQ
	NZomnYFFXgWA6QkjJVjudc/tIaOhtzNMZ8AanTPATIyt/5hGfk68m0RxD5cqz6SF3J0g
	coYnwKJTKRo+dB05JQ7zs9KK0dqQbg1PAumgNBbw6pUbt0joSKwRLMFDOrKVmjGcV+Kr
	WBQQ==
X-Gm-Message-State: ALKqPwc5hexkj0GivKdRq8SiW1SNkQ6J4lEDZ36fJA6pcC4+NRylVTrm
	hkQscgl/CER8ZqZU/8/T2BsKJBzsqpqOMa8ayT51QjqL
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr11145775oia.164.1526918795242; 
	Mon, 21 May 2018 09:06:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 21 May 2018 09:06:14
	-0700 (PDT)
In-Reply-To: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
References: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 May 2018 17:06:14 +0100
Message-ID: <CAFEAcA8hsrXXBp_KRxqjg5hj8L8Z3Pd5wNfbwnkxJqLJivFupQ@mail.gmail.com>
To: Elliot Buller <elliot@tinylabs.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] ARMv7-M MemManage vector trap
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LXNAJjBIOMXk

On 21 May 2018 at 16:31, Elliot Buller <elliot@tinylabs.io> wrote:
> I'm working on a body of code that relies heavily on the MPU faulting
> mechanism on cortex-m processors. This makes debugging other aspects
> difficult as GDB often traps in MPU fault while single stepping.
>
> On a real target it appears I can mask this by setting bit 4 of DEMCR (Debug
> Exception and Monitor Control Register). This looks to be unimplemented in
> QEMU. Does anyone have any ideas/guidance of where I should start looking to
> add support or another mechanism for disabling GDB trapping this ISR vector?

Is this gdb connected to QEMU's gdb stub?

DEMCR is part of the architectural support for halting debug. We
don't implement that, and our gdbstub doesn't work via halting
debug, so DEMCR is not what you're looking for.

I think that gdb-triggered accesses shouldn't actually cause us to generate
guest CPU exceptions (because the virt-to-phys calculation goes through
arm_cpu_get_phys_page_attrs_debug() and cpu_memory_rw_debug() rather than
the guest CPU's load/store codepaths). But it seems reasonable to me
that if the guest CPU can't read from an address then gdb reads should
also fail: this is how we handle it for other guest CPUs, I think.

thanks
-- PMM
