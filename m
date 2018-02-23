Received: by 10.28.71.27 with SMTP id u27csp392360wma;
        Fri, 23 Feb 2018 01:56:39 -0800 (PST)
X-Google-Smtp-Source: AG47ELu9E/Bk4S7YR/0zFzSSE/Aq0e0CSyd5iZCEbOU0ET8n1WUngg6YSwl5IppBem7AkiulUJ36
X-Received: by 2002:a25:5406:: with SMTP id i6-v6mr599203ybb.92.1519379798960;
        Fri, 23 Feb 2018 01:56:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519379798; cv=none;
        d=google.com; s=arc-20160816;
        b=cOFnLZ7xo+ZJhBzQL8KqhzyHTylkb5xhGeYX1afPuYobpdim0ZKQE4NacA4ucxIIP3
         2Nl//N2gMNURuib4MyxFengZ3jmWJuUEPce75Pun+B+tgt6/4aR18Exh07bCkP75EjAK
         Plx3iMf1ED55atF/fwn/00hjorrbpY/VfEmHAQ5jflG3BCmDaFBAs0An3FZM8MSESQRG
         uLzQB44c+A5YBjf+OFb5G2wN5ORme8QRMuP7KP/DGyMbNmEo/jxXaozrzg6uzgIHmbig
         vVNZ9L6RPTsdA59psAkVNDbRR8+xZC7w8S3hb7q1vSUh1VCMEY+D1n77UWqMfRvawlfK
         1llA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=71fgWY/iKptIzoKt7hin91/jYHC+ZQln7g+yYfXnkeo=;
        b=R0D9uyRPy3mzJkAbTdLu2tdI1kKS2Aox3Lmh2u5L+M9kdkIQMo1IRK7dbEI+mcWsAt
         P+lmZUNlV/EYeEi0V8OUCT782feZn3wpnOw3chm2llFvY/YJ/q0qGMoXeubT7W35u4UO
         BJry1BCGz5em7Q6MS7XJDaSe0q7rTz4Ypww4SPic0qHXWFy/tX9VnKxpYsbHbpw/GmiC
         Ak1E84Ja12/fMvF1qOdxCmo13UvQLRw74psVINPsi69R8tqCVNRnjAIGeoQzpKqE0y7d
         dW6MU9iJ2v5Pxa+nt4+iu2SEWQqlssiK7DO5AwN5GcwTrRCRHB9U7axpZ4stfBWR61AM
         xZQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ejW9Xukj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2-v6si30001ybj.57.2018.02.23.01.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 01:56:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ejW9Xukj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epA5m-0006YK-Dt
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 04:56:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epA5c-0006X9-FW
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 04:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epA5b-0006i8-SW
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 04:56:28 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:41844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epA5b-0006h2-M3
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 04:56:27 -0500
Received: by mail-pf0-x243.google.com with SMTP id a17so3317411pff.8
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 01:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=71fgWY/iKptIzoKt7hin91/jYHC+ZQln7g+yYfXnkeo=;
	b=ejW9XukjxI6CKTJdmszvlmwo+6krAlJl1/ea+Wm9zD6GzoRKFopgUk4hszCCxLl4Dz
	MxavKYe8qnnBQQiePKZx8qLF2eI7G8x48tk8li5KsWFpczj2ANVjNqzWB1Ul3mFzHH7J
	goKxwBLOBiGzTReWKIaIHI/kkEBDAlMVsRFJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=71fgWY/iKptIzoKt7hin91/jYHC+ZQln7g+yYfXnkeo=;
	b=n5ntaL2TY84VcSrt3s/0ysXXJQJ61PCmt8+oLljG09qfqKTZMCQd7RRLSMwDD03Pw4
	okH6m2ov/ZcS7UX9hWaldOhWztiPaBDrG7vgRmZg20/hnVWKiaPwo7xprXDphiy2ITBV
	tM6ah9n4Sh37SFPHJupmsSJS+q7tJOI4plNjFOzw9uGU5M+2ekVPUdbL0/9d9rV4IYRi
	vui4bzdmqo1txztWPdsMXqSL5qHaPW9QrGxF9oHoxwn6uHrke2nmfOKCTRRRbRjAlSK6
	sWxIfuxybBuivKp9EN3sAmtNs4MIgT9sy/oubA7LJPzxZTUYpWWeHJspFyuxzwtgSyMP
	Ix/w==
X-Gm-Message-State: APf1xPAH0PKuLkK9HT79bQNm1iy0Z9OYTyi1uJYag5vogMRznZw6hWiS
	Qa2UXs6qOoetdfJUGb88bAOJgg0kxEyuIWCE++pqaw==
X-Received: by 10.98.32.200 with SMTP id m69mr1208446pfj.82.1519379786576;
	Fri, 23 Feb 2018 01:56:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 01:56:06 -0800 (PST)
In-Reply-To: <739b0a8d-eea3-c934-8f38-6fe609056c07@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-8-richard.henderson@linaro.org>
	<CAFEAcA-PzKt-gZe2FjvqZuJqFmgoziNKaDLyen9o+hToMboQWw@mail.gmail.com>
	<739b0a8d-eea3-c934-8f38-6fe609056c07@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 09:56:06 +0000
Message-ID: <CAFEAcA9zRC1tRPhywOKBC3GAgFgV7aFr6OE_xCJQePo_a4Fgzw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [PATCH v2 07/67] target/arm: Implement SVE Predicate
 Logical Operations Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1cfw0zgTx5S3

On 22 February 2018 at 19:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 02/22/2018 10:55 AM, Peter Maydell wrote:
>>> +# Three prediate operand, with governing predicate, flag setting
>>
>> Three what?
>
> Feh, typo for predicate.

Oh, right -- I'd thought it might be some mashup/typo of something-immediate.

-- PMM
