Received: by 10.25.221.202 with SMTP id w71csp2525383lfi;
        Fri, 4 Aug 2017 13:27:13 -0700 (PDT)
X-Received: by 10.200.33.188 with SMTP id 57mr4804488qty.101.1501878433708;
        Fri, 04 Aug 2017 13:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501878433; cv=none;
        d=google.com; s=arc-20160816;
        b=N4PqfyNyWrrT+fmqImVZj92FfGhGFNZ7S4p9XQhgtRIl374muTWO7UWC6DqTKFbEx8
         bd76MSsZAWyywnQzwFK2RiPLaJfMAJiruh9uRdCsXcJteRRzg+NwaU+5FW9Eoa0iibzc
         a2uC70DWy05DloelQWis9RdELue0f+UqzuBPoCS+6ynKbPYnjRdRY0ko29l+gG6LtlCG
         kj6K9C5CZrYm5IUZpEx22TtqiqkOaR7d/VS3AXZvnD6CxVUsNmmixsYGmsi9VCmMwPtA
         K1rAy9HAa5CvWp6iRjNY6FIb4NjwJYiQBgOIuDnszH9dR6n/saZN/Tw1w43wWCXZaWyy
         gRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=G+LM330PIVd/Gi9p85VJa38/0wBXPz6uMD4eqrcYiuU=;
        b=LfcB0l12bNmF19qAVi4m5NcCpnWE0X6mzS+0Xz6UYEjHh8zZQ0wi1dGKnwfKmKVUCV
         iG/5nJQ+opLB5osW66dlDEvwxN19LseUyoytX0BuW0pyMbGpaRnCnYpO5c41xw9yfURS
         nHBhT6Rio6KA30r+2h9l6ub6eR+yXDUFhSks92hFc6ofYHVSkeScrQIyqzPiGJxTJ2FR
         UMrV8GR0NwfngQbot9GCsKI2Nd6u3GLWESEBZCgD5CQYCO5DFlO9y/vf48ARdSrXmlrF
         ofXuaypZVNejSJIdsF+bWisZH2RH6CCqxns0J2k6h8Te+ZYbZBUFp3dYsprZQavXC+nq
         A4Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=I/pv/GMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i186si2089051qkf.465.2017.08.04.13.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 13:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=I/pv/GMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddjBe-0000Zo-TQ
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 16:27:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddjBV-0000YU-3z
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddjBR-000132-7l
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:27:01 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:34462)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddjBR-00012c-1G
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 16:26:57 -0400
Received: by mail-pg0-x232.google.com with SMTP id u185so11976027pgb.1
	for <qemu-arm@nongnu.org>; Fri, 04 Aug 2017 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G+LM330PIVd/Gi9p85VJa38/0wBXPz6uMD4eqrcYiuU=;
	b=I/pv/GMzhjixCbPNn3yxDpeFErmQZe4zsnuPyvGX+Yh3j4dlwBKjiwCumqk7G0gB7b
	01+jP1/HcgqvJGNCfDb8BR453bzKOBr6O+AB4Aopb+5ogNMZm4Z7xxEQfJRfF52B6lIf
	HyJ/Phqp4VXzc0eaeLon/kqyWsaWCbQU99ros=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G+LM330PIVd/Gi9p85VJa38/0wBXPz6uMD4eqrcYiuU=;
	b=NDS2t0D3vr5cZ82oE0CdEHw7buNUFK+qVHNmiSZYpb9QVO/+3RPBe6wHYe48hjRE2J
	qnfGTDGN3DivIV4kTAUQUsgMYpTFNwHH0rylNsuaGq0y/0hdYtAKHCbfMvwy+tswU1XY
	82aboxTheB7h5LlUaTN2UuqxMVSt0qHruocCYN2/sACbIW70shFb6kn+xPXh/xrw0Oum
	NzCWoJGyC2BnwwLpaz+kMkoLiNVvI5kdjpL0xVpaV06FY4WGsBu/EeOM03crqSzrsboZ
	LY75kk4z9GSaoftjS5wLiR5SSQegTJA6kgxwfM5mZK7MtxA9ZEpK65eNHWdGOZ6nK+bE
	puMw==
X-Gm-Message-State: AIVw113DsG6nIAq+bnuAPCdki7Jfgtk4k0GkS7wsa8tA+smUEVQgUoXW
	4NtenT/m6vsfcRKs
X-Received: by 10.84.178.4 with SMTP id y4mr4163783plb.135.1501878416069;
	Fri, 04 Aug 2017 13:26:56 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	c69sm4089805pfd.76.2017.08.04.13.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 13:26:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-9-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17d709e6-7f71-1d5b-1bdd-57b0323d2bcb@linaro.org>
Date: Fri, 4 Aug 2017 13:26:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501867249-1924-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: Re: [Qemu-arm] [PATCH 8/8] target/arm: Implement new
 do_transaction_failed hook
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MSGuNB4G6ChW

On 08/04/2017 10:20 AM, Peter Maydell wrote:
> Implement the new do_transaction_failed hook for ARM, which should
> cause the CPU to take a prefetch abort or data abort.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 10 ++++++++++
>  target/arm/cpu.c       |  1 +
>  target/arm/op_helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
