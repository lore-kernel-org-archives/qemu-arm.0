Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4489977wrh;
        Tue, 30 Apr 2019 02:19:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwhNxPzaYQ5/osnhMoAXNAYlg2nRSeB9eXDCU9yOWrNfDUDi0q4DeFa/16hRUaHQ+TTPUX8
X-Received: by 2002:a1c:4d04:: with SMTP id o4mr2424289wmh.126.1556615945944;
        Tue, 30 Apr 2019 02:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556615945; cv=none;
        d=google.com; s=arc-20160816;
        b=D3KmzIf7TUPYUk64WyauLnV8yZ9djwvwEBukTgX9prkaH68ZuY+992tbfd+ytxeIWV
         2dWqN9rqPoBbfi4aZ1VH1QdylR+UeFFQV5ccBMliVLtBA7SQCvBjGsiOWNsbvWT+GmYn
         VRl65z5hsuUkd9Nq6IsM/3jpXO6WUKayiRJ7N9GA/kdiZvLz7sxahWcTUzxb0CcRR8Aj
         jW8FyU9fIfqrc3rdc1Oj2GrYRCt7L8Bx7ISIBEm9joBoV+7Z7mV9p7k8D3iuHpNhl4sS
         /STByJwV9PEf93/N3ixGQOGIQpyN0jzmiIN13WqyJQyP3FG/1K6bDxhXs8HPUCjFvM3E
         po+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AippH7xrGuSrR1A+ImmCYCJ5URYBDU6FLhOh1qpyWNY=;
        b=09CPIdZe7koeulynngS5Bywuzlo4aJ/MumIATTSqMY/KE7t16WG3/wjSHmZ2Veyxff
         4Fscb6wrFNiM0fWuvI8phqTHHeyUpwZ8Rk7mt7CQUnHFqRLCpNsAiiLwREE7aVuI3lQS
         u5ZaEPBwjgkTc8iqh4S5aC4L1KMkQUqjT7AJEWnhbTRt91NtzmRN0SlZCNT3re9POhmp
         b8fbGmmggRf5qJCTbv8rNC0Ain5jHZDgVg91DLIkZgReoe46sNp4Y7iMiOukW5Tzp+wX
         gQ4hZHyobwNlJk/4s5W2uAD2P80pLYK8EEVRHyvGLxEODHG2BI2Klwn+NzFlbWnPnA26
         kbBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jncnwjbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si1246151wrt.67.2019.04.30.02.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 02:19:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jncnwjbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:41971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLOun-0006Lo-1p
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 05:19:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLOuY-0006Kh-8U
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 05:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLOuX-00079Y-Fq
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 05:18:50 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLOuX-000795-A0
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 05:18:49 -0400
Received: by mail-oi1-x241.google.com with SMTP id d62so4795770oib.13
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AippH7xrGuSrR1A+ImmCYCJ5URYBDU6FLhOh1qpyWNY=;
	b=jncnwjbheqcuaBZP6rga5Rm7yaSF3ZWi/jLvRoR+W9e9cGdd6JjE5HI9CUS9agQerU
	AMgaABu5MduU/jATV+kUitUK6Tz3DohMTBACcKuRQAs9+BnDPoFjZ6fYphhN6VGbiJKr
	zuNtqz7DbqB+gkiHhJ7If7yFBwCLbdVFCxU8jtVkdDolM5Nruyz1gjB8LPyJ3dc0PszN
	KMHqPE64nylR+S8zHYOd7Rwap5U6qcIJAqUti2uLrY7aHlRhENfX3CLH3A7Y10Wjt5v6
	jgJorM96YeiTStH+PR39bMGL+r5HURVb6fhMZ516AOLO1rGsGRqyaApu9YY7v5FuPFPm
	k8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AippH7xrGuSrR1A+ImmCYCJ5URYBDU6FLhOh1qpyWNY=;
	b=lj5m0hrP0N3yyS7GIZ1jR6W2af0yDMzn759aSTaQ0sAaHOHoaU6057GfHGGZFW/rgq
	ep0qR1t0z9tvrMbNRMIya2YyGjLDRfbo8sLcJ33FdmzgStPm1rkZSIr9wTd6OAZ/t6vz
	lVzZ4g+UVXhxCWYeh4O85E2dJZAHc7FTg3wnJQ8SWJ99X08kDaL9Z3TRjBllHCaFp0ub
	4oz7j45HHZvbD5YUN/BOcoZCh6FgrhPz4ILKLbVy+3ESDt1l4uSEgR5bif5QqRGHIFre
	SNzVoF54FQPVhSae31+ezwX5S0xJNk+hTF5lndNaLG9sDzOy7t6PgFHs3qROAflfuKJn
	GrOg==
X-Gm-Message-State: APjAAAV/TNusTA2osM+qY37kjazVS1xGcly6hUz+IafJ7601hhiWE3F/
	sb/i05DaEhYjMTW3rKjtAm/QPJSsoJMHdQFidpxi8w==
X-Received: by 2002:aca:ab12:: with SMTP id u18mr2138249oie.48.1556615928276; 
	Tue, 30 Apr 2019 02:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <1556614240-36369-1-git-send-email-like.xu@linux.intel.com>
In-Reply-To: <1556614240-36369-1-git-send-email-like.xu@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 10:18:37 +0100
Message-ID: <CAFEAcA-SFrcbQMdv19tJw_baGR8c_ngR2CtsgZKVXMALOo=zoA@mail.gmail.com>
To: Like Xu <like.xu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/fsl-imx: move cpus
 initialization to realize time after smp_cpus check
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l4bRgd2EprXt

On Tue, 30 Apr 2019 at 09:52, Like Xu <like.xu@linux.intel.com> wrote:
>
> If "smp_cpus> FSL_IMX6_NUM_CPUS" fails in *_realize(), there is no need to
> initialize the CPUs in *_init(). So it could be better to create all cpus
> after the validity in *_realize(). On the other hand, it makes the usages
> of global variable smp_cpus more centrally for maintenance.

I'm not a great fan of this. I think that where possible
we should init child objects in the parent's init
function, and realize them in the realize function.
There are a few cases where we're forced to do the
child init in realize, but this doesn't seem like one of them.

thanks
-- PMM
