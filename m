Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5959699wrt;
        Tue, 16 Oct 2018 07:08:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60sv6sbBRaEvA0ZvNBe4sHkorYuxTiAE3E89iWCcGkhmVmNwuWfu/CSzHt/fH2tILVTbOHM
X-Received: by 2002:aed:3539:: with SMTP id a54-v6mr20646080qte.153.1539698887303;
        Tue, 16 Oct 2018 07:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539698887; cv=none;
        d=google.com; s=arc-20160816;
        b=LooAjTxH5OrcgAclt6TsaAOI4SZQVZjCQmtDB4EPq9IzW8wCnAm7ak0aCWhyoFthHf
         TnULzDOnGiFagppL6g3ZhdRMeoIIXslNiMkVlnY2fsmVlNJzdytd8NvC9fOgrEtsvyKG
         A7E1yr4rl7vhqbuou89w+5abx4h2RNYSh5D6N5DDhavltl3veDBwg5IexNbXbTDve3a7
         W5jgU+6sQS2kfXgkq4PGF+wRnjcF5o1Xg1JvoUzFvOjlMylkcByZJW8PRbTpTt7uexfi
         4r6UAEMUrCK0HgOT0Fr4ZW8rPpWsBmthjg3Ml3EZjTpqDfPsG+JcqTj7KChBKV/pxyge
         goOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=zs/N+SZy0T+MduYrHypkYg7Aieh+dI0mndS/BmGBAx8=;
        b=xeiTHpikp8WmQYi6C1fC06Ly8znunDYriADXSqhV1aRpQoti11uGNUMLlE4zhJm4yC
         LUAuIGlhHbcwZUMDav2e2ffMoNBl94bF0ofgJDlxmSshNSIzXyKHJkaYvyjGCrPRnLSM
         M5KMXvXCsm6yNawBclzcN7mzALoQaM8DM9qqxB/ff+744N2h7ey+g3p4PhEQlpWx4406
         bxrn1DBY4Dt1qURyRFQG7u6573v5N8ooyAtedUejUrO8z6PKrzblumtlRe5t91ZZjjWX
         a6+ncYWAz0d2SxAjDU+yVcz8RSbXj7UoGXZkD4+No4Ndgg96FwPpj4srEBD074aIBlDL
         RZLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NEsvvgCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8-v6si5169570qth.404.2018.10.16.07.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 07:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NEsvvgCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCQ10-0007Ko-L8
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 10:08:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCPza-0006d3-CN
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 10:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCPzZ-0004Ov-KW
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 10:06:38 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCPzZ-0004O0-G0
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 10:06:37 -0400
Received: by mail-ot1-x342.google.com with SMTP id c32so22634909otb.8
	for <qemu-devel@nongnu.org>; Tue, 16 Oct 2018 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zs/N+SZy0T+MduYrHypkYg7Aieh+dI0mndS/BmGBAx8=;
	b=NEsvvgCm+pjS3baH3eFUwt5gqLj5q9rN9vFbP/Epn/X9XFyH5RD0HWOeMj+wxg0iQO
	j1854XqqXbmdSPUbuSxXoqLo6owUjYsTTuKK/H7saS7tl+BAuTTR6jhB5w1qI08vXjLK
	4ehn0C+LubiTRjvQXU6ISeB5HMl8iU7G7dQN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zs/N+SZy0T+MduYrHypkYg7Aieh+dI0mndS/BmGBAx8=;
	b=BBp95vEKvYQq3sKLyg5u0Oge+4DohXzCmF+RtU2b/QwIExZWODJwFodOjcPAPMN5tt
	h4SE9YC8zwXdTlYIi50JUmQHHT9xMOjWO5UmEXBiE1MCKy3IKiYoanLM0J2hkqULN23j
	EbknCoIK996O1CfWKoWccJVOAAvaM5Gck+rYaJyckGlkxqK0iJEBGZRBMDkS/A+GRlbQ
	saPmuAf3ym2QA/8mKDI6BMIficV4OtbaGk9hPyvkCjRXh4wW71Qc8d2G2yQdGnSfxPHN
	S1NMj4oMMNRP4VttYfL6Fx9TUbR+0UQhA354VbtFIJ7bWxkZK9aBkmZ11slQpRQxdvwu
	CwRA==
X-Gm-Message-State: ABuFfohcLHBC3ZKgkOX4XKTHZCPYK6rXn81QmmkRLQVtoj/LHIXM8PFp
	urfGzvx/geMBKKGvDoZR8eOeh+ttL70GQgAdC8MkVQ==
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr7728984otl.151.1539698796863; 
	Tue, 16 Oct 2018 07:06:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 07:06:16
	-0700 (PDT)
In-Reply-To: <1538067351-23931-2-git-send-email-gengdongjiu@huawei.com>
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
	<1538067351-23931-2-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 15:06:16 +0100
Message-ID: <CAFEAcA8PAuGQUTLNB_R8QRcpeATGP9yFm2ZXC-p32r=fyAvuwQ@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH RFC v11 1/2] linux-headers: Update to linux
 kernel 4.19-rc5
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
Cc: Zheng Xiang <zhengxiang9@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8PClz1K61db

On 27 September 2018 at 17:55, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Update our kernel headers to upstream 4.19-rc5
> (kernel commit 6bf4ca7fbc85d80446ac0)
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  include/standard-headers/linux/input.h |  9 +++++----
>  linux-headers/asm-arm/kvm.h            | 13 +++++++++++++
>  linux-headers/asm-arm64/kvm.h          | 13 +++++++++++++
>  linux-headers/asm-x86/kvm.h            |  1 +
>  linux-headers/linux/kvm.h              |  2 ++
>  linux-headers/linux/vhost.h            |  2 +-
>  6 files changed, 35 insertions(+), 5 deletions(-)

It looks like a kernel header sync has hit master since this series
was posted, so this patch isn't required any more.

thanks
-- PMM
