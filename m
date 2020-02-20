Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp332179lfg;
        Thu, 20 Feb 2020 01:10:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuWWQmOrDC+jmNvtbCReUIytOS3ziRm52XDjsnt6LhTQwpkOOqjGXWLJnbMhs8pp+NERM4
X-Received: by 2002:a05:620a:41b:: with SMTP id 27mr27684031qkp.349.1582189826210;
        Thu, 20 Feb 2020 01:10:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582189826; cv=none;
        d=google.com; s=arc-20160816;
        b=gwYrJh2o9ryWiWw/xc7bkIwj8IwhCiHGsVT4nckq1mu3FqDXce7jP5RW7JFqRYaDhn
         TSIFNkRmWzvuU46t7KK9Ci64dsF4jHN02BW2cyz5bdtr9Jk4Vmx+CC2Sydh+9CQvXP5i
         +/KNvNiKccU9T+bnyvP++TYoTUGJceGeNiWMUwCWCSbWm1jEpS2S3xr0Y8tdJEF5VrRp
         dNUY4asw/DpMcv6sPRjJRFiEGEekR5VMnQNN4RkXTUm1YpVZkYvohU35nHgVfc46f9g/
         xH/znHuBA3vSKDGWmfSrwSFENASSc9H4Ifkxk27VnyxwThN0C14xlwQB/A9kNrpwp3Fb
         0hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:subject:to:from:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=o2+TYBPrZCp9Bh2XyuOTGOlLmppoFkDkYmDX5B/5NIY=;
        b=V6Fp7SXc2SR+Z8mN+6WzTgDIRVZxEznBkhknt16qXUIIIYpt4VvxiMyhvhhg1adTfu
         ktJJRhwQlg7nmo2hJY9EiOIMeSakdhMjnVrAwmDPpG82flk9RkCgCphiGe+gM50IfpFX
         KUyP6zwTLw4Cal1pUSTrfJcohPe+2wMQC9UFb8Lfbix0MPcVCMV/UX85gipMFtgiZzzN
         FpQXYF3dmMCttslk4Jj1P08IdxNjbpUgT5OcjhSb9CiCFmBNLIxxXgiY9Lzl+oR/TqgM
         /t+HdwCbuGVgvJV+uyDyc6600jVNPfRquKA1SDAQ0qL8WwUkQnCgQyIWoXXeD68fuJLn
         2oXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=WiO9w2jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch20si1151879qvb.166.2020.02.20.01.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 01:10:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=WiO9w2jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4hqj-0008Ht-KO
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 04:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1j4hqa-0008HE-7s
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 04:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1j4hqZ-0001p9-2l
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 04:10:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:57702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1j4hqY-0001of-TF; Thu, 20 Feb 2020 04:10:15 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06CE424654;
 Thu, 20 Feb 2020 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582189813;
 bh=S4xwGPUGD3p5Ihpe7YUXIIMFa3a+ojBjLfvLPwI8ePQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WiO9w2jbrkEaHAQv1auP60n5GoiNg9hUKWrMKPy8kIDdXUO2WslanW/cYM/c6AZAl
 fnED3pBCHyrqmZwF0sjhw+uzfBpF5RCdc2/9PHJ+PynzOQ0/s+H4zdXblN/RvYOKQU
 0jTqWRK1YzOw3W0XHhpMIjIdxWwo6+Obvaj0R/sM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1j4hqV-006gwK-3O; Thu, 20 Feb 2020 09:10:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 20 Feb 2020 09:10:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
In-Reply-To: <20200220060108.143668-1-gshan@redhat.com>
References: <20200220060108.143668-1-gshan@redhat.com>
Message-ID: <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: gshan@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GjXZGLEFdQw3

On 2020-02-20 06:01, Gavin Shan wrote:
> Currently, PL011 is used by ARM virt board by default. It's possible to
> block the system from booting. With below parameters in command line, 
> the
> backend could run into endless attempts of transmitting packets, which
> can't succeed because of running out of sending buffer. The socket 
> might
> be not accepted n server side. It's not correct because disconnected
> serial port shouldn't stop the system from booting.
> 
>    -machine virt,gic-version=3 -cpu max -m 4096
>    -monitor none -serial tcp:127.0.0.1:50900
> 
> The issue can be reproduced by starting a program which listens on TCP
> port 50900 and then sleep without accepting any incoming connections. 
> On
> the other hand, a VM is started with above parameters and modified qemu
> where the PL011 is flooded with 5000K data after it's created. 
> Eventually,
> the flooding won't proceed and stops after transmitting 2574K data. 
> It's
> basically to simulate tons of output from EDK-II and demonstrates how 
> the
> tons of output can block the system from booting.
> 
> This fixes the issue by using newly added API 
> qemu_chr_fe_try_write_all(),
> which provides another type of service (best-effort). It's different 
> from
> qemu_chr_fe_write_all() as the data will be dropped if the backend has
> been running into so-called broken state or 50 attempts of 
> transmissions.
> The broken state is cleared if the data is transmitted at once.

I don't think dropping the serial port output is an acceptable outcome.

If someone decides to log their console with something that is very slow
(because they decide to carve every bit of it into stone), it shouldn't
be QEMU's decision to just give up on it. Specially if the console is
over TCP, which garantees no loss of data. Someone wanting to have the
behaviour you describe would probably use UDP as the transport protocol
and deal with the consequences.

Similarly, QEMU doesn't drop data on the floor when a write to a disk
image that results in a block allocation fails because the host 
filesystem
is full.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
