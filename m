Received: by 10.28.71.27 with SMTP id u27csp857141wma;
        Fri, 23 Feb 2018 09:34:01 -0800 (PST)
X-Google-Smtp-Source: AH8x224s6TJNnafNYF19g5ooa17+5QHvnTQg4JYOX/bcqWxmaxe/0hcvfd2nk4UrOz2TlDOu6iZF
X-Received: by 10.13.211.132 with SMTP id v126mr1697616ywd.128.1519407241549;
        Fri, 23 Feb 2018 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519407241; cv=none;
        d=google.com; s=arc-20160816;
        b=mV8hLLXg1pRpX3rAO64lJCgE1SDJt8SREt+k9ueD2PpRrZVcCC+JAkcjt8qxK8afcQ
         770N3L8NAW/Xiwp1hTqCDjegd5SHftggkSIEHSzPKqccVv/R3G8Hc+VJzlOqIz6Y1nSx
         Zrf2+6KcDhIM7nZLx6+yHhAqJMf4b+0LHcUV4ppKSoq8alx1hEv9FQEFdeH7uRgO/lN3
         Rv/+8AOgLAFA1AbCjvQjIFseh8cIsP7FpquLxt5yNecNHmHe/Y+wOZrxewwethL5Pt4P
         fka++fV1o5zUlUyquENguqDrZpN7Ukb40jgoDB6X9egE9YFnlWI0j0h/FvIwtS2l424V
         Ax8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=E5GvBxrOb3UPEM95jzwprEWCIRqU7oAWtIMgrKoTOHo=;
        b=SM6BMf+DtVylLlQVjPC3rl4XHRlTt2Lm4LXesyGKejZ2Faw6PzQjILr+R1uFF/6GSy
         AwLFnyGjkd5LzwB5KjNAd1JNuPd9dA7x6VFavaEXrEQAh8w2XaM8KbuOGTmcWM5T77rn
         ogi1/54+3MFjfEulgW/TbORqEsVHDJmmEZvmG79k1kM6OJu0P1lQN4Fp4Lrgmdoje7sr
         56DhYRlUyE/E7waywyZ05ItpN2RuLdNF3sFrfDbCnDcst99jJyuiXf5NsC+a900ZhWuZ
         BNxnajUIwH3JBP1/fLLGWLHdlF5h8zXk6i676rrYDsc0ugp0E1wLyQq+tP2jYMXkiNjs
         wcMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhRvqpBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j124-v6si478375yba.695.2018.02.23.09.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VhRvqpBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epHEO-0006By-SA
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:34:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epHBl-0004IH-78
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epHBk-000282-6u
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:31:17 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:35316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epHBj-00026w-W0
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:31:16 -0500
Received: by mail-pl0-x243.google.com with SMTP id bb3so5266930plb.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E5GvBxrOb3UPEM95jzwprEWCIRqU7oAWtIMgrKoTOHo=;
	b=VhRvqpBMf0cGHZ/L3av2IGpF2E2pOEGsBXtB7cdNuyCMzIKdKM1QiLvHxn8gRENEj3
	yx6jvmSWP+lUrwUtm/Rp9qyUZhvA8inXNU9jXIJdk7k/0c5t0BP8BtnPpUQVoi1DkrKn
	fm81j04J+7y9yz8QzQMPxAO/w6GvTno/jnyWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E5GvBxrOb3UPEM95jzwprEWCIRqU7oAWtIMgrKoTOHo=;
	b=V4Vd5riWmFklm18JlZ3R/UywdHgw5OgsH9fGYEhwogifxPOVzbdchqbIhbtLLdV9dI
	t27oCDldanwuhuEsnvdyPOITe9q/RNXAZgHgb2/xDWEX1oBm2qIMTqojUvUlspJUsCn8
	a4UhjJIw88f2iNsUJaYMQLOzv8Z8GGqUV5fqRo0oUVVpbNUYl6pJaSev4Bo17egEs9Xu
	5d74KL6Yd3Kk99DjkVv0w4ymfE6zjLj35MgcJlu4NRqkB2ywmg/Bm/+UGVixDDrWwU5D
	rgUzwO/DH74FKFPkCpGadgu/zs8uq5E4kq7H0Ko0tdiQFTv2PVaVAx0Mnwalvo0OLJLu
	IKtQ==
X-Gm-Message-State: APf1xPC6/yTz66r1fIBthAQQMgmoXFn7Nw7RgJPCbu2ln+Hs+8w7a85I
	lKp8YukWDGy83eMlObdgCr1YmF590v60h6qr4XOSRg==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr2428750plz.436.1519407075090; 
	Fri, 23 Feb 2018 09:31:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 09:30:54 -0800 (PST)
In-Reply-To: <d778b0e0-fafb-5e39-76e5-054722210c62@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-15-richard.henderson@linaro.org>
	<CAFEAcA9wa32T_vjH2NVxnsW3jzDw6nwPjMXuAdaBfrAXfCdHEw@mail.gmail.com>
	<d778b0e0-fafb-5e39-76e5-054722210c62@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 17:30:54 +0000
Message-ID: <CAFEAcA8hPuKKzQSfxVK9Njip7GNsHJqaXx7vNtpP9fULduuMug@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 14/67] target/arm: Implement
 SVE Integer Arithmetic - Unary Predicated Group
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
X-TUID: tCPVt6VA/Rp2

On 23 February 2018 at 17:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 02/23/2018 05:08 AM, Peter Maydell wrote:
>>> +# SVE unary bit operations (predicated)
>>> +# Note esz != 0 for FABS and FNEG.
>>> +CLS            00000100 .. 011 000 101 ... ..... .....         @rd_pg_rn
>>> +CLZ            00000100 .. 011 001 101 ... ..... .....         @rd_pg_rn
>>> +CNT_zpz                00000100 .. 011 010 101 ... ..... .....         @rd_pg_rn
>>> +CNOT           00000100 .. 011 011 101 ... ..... .....         @rd_pg_rn
>>> +NOT_zpz                00000100 .. 011 110 101 ... ..... .....         @rd_pg_rn
>>> +FABS           00000100 .. 011 100 101 ... ..... .....         @rd_pg_rn
>>> +FNEG           00000100 .. 011 101 101 ... ..... .....         @rd_pg_rn
>>
>> Indentation seems to be a bit skew for the _zpz lines.
>
> There are tabs in here.  I know they're not allowed for C, but this isn't.

I don't think we should have tabs in these files either for the
same reasons we don't have them in C code.

thanks
-- PMM
