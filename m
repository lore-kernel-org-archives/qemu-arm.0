Received: by 10.223.172.38 with SMTP id v35csp3344067wrc;
        Fri, 22 Sep 2017 10:20:38 -0700 (PDT)
X-Received: by 10.237.39.135 with SMTP id a7mr9904839qtd.84.1506100838754;
        Fri, 22 Sep 2017 10:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506100838; cv=none;
        d=google.com; s=arc-20160816;
        b=Rw+nyBNCR6P851xsRJomb4LwP/AMbjRdT3s4k2mprdw51fS4UQbP9sBDrbawXWBrc7
         HNzdOCLSzmoO4NlMMPJACHc8WI8Qk1yXDG4KcatC8kfgcRx5ZKG14HqcwYZSTKGvvH3d
         W6rUovWG0bEOLP0CmHaF2r8bT1D8MTPjw5vJuaXHujMxLo+2KT4LgehtVk8s1aXDSnHs
         unGW7tAsCiQMOCZLT13e8Jq3I+vkAVAV9wILP/xxp2D1sWRnkako6v6O+uXrkI1bpOVJ
         6LP75cEHL7rEc3z64JHM8l75cPP82qFNHM6swKgjrBUOBTBGWlSoEBeThvAIXQ3YCDJ8
         Y/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fVPlhoLvnPfyWM2OvGoT3y03V67w7GUjZr96dSxnCpI=;
        b=l3jtBAXsFHg1mjBTQenuIQDfnTWJV0b4HNV+VRZv0mJdDepQ5AHtHIbULOskxSq0fz
         SZgTLFuDkmTcPH/n7DpORdgeJG/uNG6lls23XN9wu4ZRMAtjFQmmW1mNphCatXv+0dGD
         /iOnKViRYYBojtXOdoIU0iXjnGg4qcBZBInVDNJd7qqwzmQ5hBlDAmpPLzhJ0ddysSuA
         0YYkgRa+Y+OBFRMdPw6pVnWgUnpobDwEl7UW6w8ZbB7sZSpf4RjbjEPRfN61Osy9Fhzx
         Vn//eMeOBrHsWQjFiM4FHa8NGuVMK0npg6RJvrtqDsMXOb5jDTqp9/6KCELR7Gun/G05
         +UaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmc7KF41;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l27si107391qtl.35.2017.09.22.10.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 10:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmc7KF41;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvRcy-0000tp-GA
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 13:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvRbF-0008GF-VN
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvRbF-0006GW-1v
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:18:49 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:46613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvRbE-0006FI-PN
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:18:48 -0400
Received: by mail-wm0-x22f.google.com with SMTP id m72so5751402wmc.1
	for <qemu-devel@nongnu.org>; Fri, 22 Sep 2017 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fVPlhoLvnPfyWM2OvGoT3y03V67w7GUjZr96dSxnCpI=;
	b=jmc7KF41GIEtzRro3139BtSnvJi6DNqhfB3G1gJXqVNWq5zudOuQiGCxk5bc8dkjvb
	Qg05XGRt9qCf06awetz1DCUtu8s7CTNU7624P6Z43ClJqoGldS4fFPkxar3/BQPc0NRb
	5tJrRDr54rYZMSUWhnSYAznsPxKKHJnRt/ppA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fVPlhoLvnPfyWM2OvGoT3y03V67w7GUjZr96dSxnCpI=;
	b=Jj6btG18uoRl8APlW6Fc6TE/tl95CEqTzH8WikEZvz4CGL4ZFJAoKWkYOlpti0zI0U
	gnwtR4DfNu92QvmpWL+SVsoXsRidQdJzDmIlLeJVXGp7Mu5VEJMkOteJQYcr9fyTLhtY
	s8QCnIUQLvmJpZQ4uFArgrPk89vze1nEx8CYdTJqQ/+lqDY8gdvLVI7XyEnw9YEXrqMZ
	ETQECTLXL1CXmWhZKat3RTGLlYBVt+ObXBz6kg1WuVUO+fRXPJti59jH28cj59GsTOJK
	lx7RA3GIb/gr2a2wD0IT2QyI3gdYfkJiEpLpWv9bbG6g/Ivp2iASVlR6yaIu2NDlwxSP
	o7sA==
X-Gm-Message-State: AHPjjUhx+G63OqKgAA0JHCDKjLJn5VHB1opOlKRlqrq0/skzfEqy3aTj
	b/9qj3ISCPXEF+njngV+7GyNHRxAtxsw+CEXhZLtrg==
X-Google-Smtp-Source: AOwi7QBfC4VellGQf6u14sdpCKsvfNW+MplOCpKoAvDzp/mFmT1RgRk8+H6IvpXYNGtPf1zjg04xCoGNwHOvHvgpfsU=
X-Received: by 10.28.103.195 with SMTP id b186mr4406509wmc.101.1506100727615; 
	Fri, 22 Sep 2017 10:18:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 10:18:26 -0700 (PDT)
In-Reply-To: <1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 18:18:26 +0100
Message-ID: <CAFEAcA8n+M1hA3SKVJr-pEEaB5hJ_aKS6UK_wJ1g46rmjmHpMA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 17/20] target/arm: Implement SG
 instruction
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X7pkLVbjfX0r

On 22 September 2017 at 16:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> Implement the SG instruction, which we emulate 'by hand' in the
> exception handling code path.

I've just realised that this patch is correct as far as it goes
but it only implements the common path case for SG (where it is
in S&NSC memory and executed by a CPU in NS state). There is
also defined behaviour for:
 * SG in NS memory (behaves as a NOP)
 * SG in S memory and CPU already secure (clears IT bits and
   does nothing else)

Those can be implemented in translate.c in the usual way;
I'll put a patch for that in the next set (or in a respin
of this set).

thanks
-- PMM
