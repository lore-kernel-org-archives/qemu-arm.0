Received: by 10.223.197.9 with SMTP id q9csp1648016wrf;
        Fri, 6 Oct 2017 06:25:28 -0700 (PDT)
X-Received: by 10.55.43.75 with SMTP id r72mr33208072qkh.307.1507296328560;
        Fri, 06 Oct 2017 06:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507296328; cv=none;
        d=google.com; s=arc-20160816;
        b=U+Eg3714f0D7w/d+LsltxlAWl8gGQja6/uGLp/T9Q47IfRdIGgz7mrW1H13Aq+2CS+
         2Ic77k+jt/+Lobv8BR56C6XOPyhdnGOLXD08oCQG7xTbbYzDA26uFpI3zx4UFdYsZ5j9
         QdfUk4eMTLFi3jG3sN5gc552VtjTWE1wgOXC4/LcUgnhhDbO+eoHA3TlsE8s5kSxOym7
         g0cVdQSSb8REcaLSd2I7xNUaY4Ji/DoYDUfvFkwSq0b2eNXxdacGFipLO5xsG1B6RAyS
         5Qdsc4CTL3HrzgPY2r5rtumW6TgZ/K0SKoxYPgVq69pPbTiiBs3tujqlxMFYrIKgWR34
         dgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=zeyloMazLX4NnLlH1MJoyG9juXBNJrjhCgAN5P2uOtc=;
        b=jFtf9kyHpD4B9Vs4BwU3Oh69T0RtqNdWNMiL/JSVjzqAy7ICciSv9JFO6ZVtw1fEjZ
         91rIN+imgI07SFFvMOptLS9d9/7VWZvMFbS2ndwX8Cm3RRfRCQ8+HnEC8Ej3dYuZOQni
         L+Raqx4jjRICOs6OD4J56aFe2OVmuSCK7ULPBjRdikQWVdtFZlK0MJPwzCPWvN8gRF9a
         bytKoi1ADvN7x7OZ80Zy2WQBdd5KwjyqL5W5haQk6GWAmBGBJZkR3tIBaeAZajwGT1v/
         A4Lpa44VJ0rDv8HlozvmVk7pji/zwjSUT941AUVHHaaQJ1exMGs77nHVQFrK+yLi4WTq
         T4BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CoAOCEHi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23si1288665qtk.92.2017.10.06.06.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:25:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CoAOCEHi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Sd6-0005uU-0k
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0ScE-0005Jj-Hj
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:24:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0ScD-0005xU-C7
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:24:34 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:55317)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0ScD-0005x7-7r
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:24:33 -0400
Received: by mail-qt0-x229.google.com with SMTP id x54so31279448qth.12
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zeyloMazLX4NnLlH1MJoyG9juXBNJrjhCgAN5P2uOtc=;
	b=CoAOCEHiVJCpqyhXovlQWUoiLUye5VrmrA+0kMr4L4cQtPzLj4CuZkc7m3VNQfMvc8
	cKtgubqxy7vsZRxhCxwR893byJffNmoqeUazrSDjQjkw+rjhd+KGGJqKWB9/0+t/TKdl
	7mDYgzJcZO01UZSSYeZZvKJmbWIoEv/ax/YaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zeyloMazLX4NnLlH1MJoyG9juXBNJrjhCgAN5P2uOtc=;
	b=YTdwj6YDZ8gGBnl4cXFiMOY5omez9ugmfkuJaZ5UBNALO8NWr/iFMtoVSyehzpy9tp
	hJGS/6iRk04lBOcKWjUkeWenrbP5qwbaVmSf09PpadBxQVV9nuH6Y5wPO/GDLSVoznWN
	ELzejmawg7jYbWxuBsxOZEO35LJQbHCwQB0X/xY6+2h/x0fxOBusGa+39hNS8NzkbRMk
	ZuVyPx7WHZvlaJVCCsH7TcuxKI2Cs92AsDik/xYCv2niW6Glz9tyNruVzBjAPTak+ZQ2
	7JoMM9cz1nkwg2N/cGgrQgyhQAHX7CEVJWpJ3wmusMiC27C4bVL/u3rkBAXr2mdWE8oQ
	Inag==
X-Gm-Message-State: AMCzsaXbp9ppndai9cdF8U0glRw/aisDSERHUbiTbxfcTcGjSdknu2aH
	I4tzUunS2tyzLJq8qKAtpvhFLg==
X-Google-Smtp-Source: AOwi7QAk6y/JcRFzrgFIwn6VgKC7iFjRdEL8JGNmwnSPTRiz3RYbu4N4RObXWe99yfnNfp0Il77WvQ==
X-Received: by 10.13.214.211 with SMTP id y202mr1624620ywd.344.1507296272701; 
	Fri, 06 Oct 2017 06:24:32 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	b138sm2275315ywa.37.2017.10.06.06.24.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 06:24:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
	<c0b514b4-6474-87ed-6fa0-c109761d243c@linaro.org>
	<CAFEAcA8dmJLEz_J5z8hCipmPgjxm5WE0D-6DPs5mA3HC_5ou6Q@mail.gmail.com>
	<CAFEAcA_H_cgEPs1+aJ4fWzPys8-0Omyn_BtHGhJVwWuNbrr=gQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf724dc3-027e-c2ac-61e2-5ee0576de7b2@linaro.org>
Date: Fri, 6 Oct 2017 09:24:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_H_cgEPs1+aJ4fWzPys8-0Omyn_BtHGhJVwWuNbrr=gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/20] target/arm: Don't switch
 to target stack early in v7M exception return
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cBWBckU9GflA

On 10/06/2017 09:22 AM, Peter Maydell wrote:
> I'm going to change this part of the comment to read
>      * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
>      * Unlike that pseudocode, we require the caller to pass us in the
>      * SPSEL control bit value; this is because we also use this
>      * function in handling of pushing of the callee-saves registers
>      * part of the v8M stack frame (pseudocode PushCalleeStack()),
>      * and in the tailchain codepath the SPSEL bit comes from the exception
>      * return magic LR value from the previous exception. The pseudocode
>      * opencodes the stack-selection in PushCalleeStack(), but we prefer
>      * to make this utility function generic enough to do the job.
> 
> which hopefully is a little clearer.

Much, thanks.


r~
