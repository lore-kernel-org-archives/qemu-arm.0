Received: by 10.28.71.27 with SMTP id u27csp2590305wma;
        Thu, 15 Feb 2018 05:36:22 -0800 (PST)
X-Google-Smtp-Source: AH8x226IlW9d4Dn2U0IxJJh7waoUs37JmL9ZeaVDycZLBucDHf1ktZj4C+2raWpBavRbF9nbGEaW
X-Received: by 10.37.233.16 with SMTP id n16mr1944004ybd.72.1518701782274;
        Thu, 15 Feb 2018 05:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518701782; cv=none;
        d=google.com; s=arc-20160816;
        b=Xf/3o30rQejByNxxvMYwID/aNeLzTmVGr076tAa/h3MC8eJ/Pt4oai/sKgBR1OcquC
         kcOBfAAudIQzhWgxsMaT5bYg5Voc+tBWUPjyhY2i7vqXnX68MreEpYuSv0N40R3oZP7A
         Tz5PKI2zdsEu/rtlhZVKYXmpxHZtzaXrj16gQtI7HL4nI7h8nKWp1uVcFr87md7bkvHP
         drn6ggPo3+AolIL5KapbMqaJHMPKDeXOMNetmi4/XV+OR5MP9Hc5+rpOrT+tz3Hhkv74
         u0FaLvwnKquuIqeDJorEcqoBbSsHMvQT35tPwgwL1B/fUf4t1KMYdjWntWjmdFjFA0xX
         oOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=h+jwCeVY852z/kSQhVKbB03oThK6VmPeWlPEHz543GA=;
        b=Nb9sGAdd2LDKO5L7wDz+b0Yn0+3M3yyHbzohWHeSpTOE/eyCqoX+l8I94PClzCllcd
         nlUrj7LSryl6CHtsBYn67RkfBuUZpcCOLVpwMIHbMufmIc+FGYtrSs3CyQfqFNkrR7vL
         lMiBRhRRD3O8vPRR0XVFY4M+pP/by3L/Vj45K1bWBjCXijf+yQjJe26YXWXXNhb/nyf5
         5f/t94tpJF7p9yUpOzeqf8KLSA97pyW3THW7GSxbWhFQEafPIktJHipO55M6Dy4Pu6j9
         Ml6CG/oFRaMZEu9RGS+bKONWaZkDLVECkyPBIj8KV/EfMcqjjuZug6OO/BhN4I4KrpIt
         U1Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cI1zm+Xe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si1614727ybm.632.2018.02.15.05.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 05:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cI1zm+Xe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emJi1-00051Z-NZ
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 08:36:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emJeZ-0002RC-Lu
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:32:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emJeV-00035k-R5
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:32:47 -0500
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:41544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1emJeV-00035X-LW
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 08:32:43 -0500
Received: by mail-oi0-x236.google.com with SMTP id t145so1217058oif.8
	for <qemu-devel@nongnu.org>; Thu, 15 Feb 2018 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h+jwCeVY852z/kSQhVKbB03oThK6VmPeWlPEHz543GA=;
	b=cI1zm+XevBxIkhzjBcUu4uigMlfPzaXT96nQfrckqk673jsRCoE787QaWNUwVw2zEw
	EKH6uXWB4eSiWpIlU/ogj71FbPPdHVaW1G1ZTB6DHSwdmY6ouwe2seQ8LzOXholqkVii
	Lz7RezOJgXt0JVIHU2JL1QyntQXDDOPMw3K7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h+jwCeVY852z/kSQhVKbB03oThK6VmPeWlPEHz543GA=;
	b=q5i4M2ssMFgS6FLRv6ShOb9l50bKJmboixaz5RRdbQnKgshcNrViX/dmgjBdrpX1Xq
	iN/zdusiLr5PU9WklnFHFzEpjxgYGceBOdBWb+BMQ6fEZPrP/oysH/AEXT917B+CKfZQ
	fx12A7hf1b3rdSt1YnXfwDQ+0jasG+8+eBcHEwDzJ00wRkYRH2CKfyONy5LTG6ZA96ie
	PQ6Ox1YQ6XkNsAg1Pmg8cT4NT5IYN4EInVIVt5Z2LwJ3PAuWbtI20sTq2/BFhgqn0hYn
	2nbvCyoPGeaedHa08Iyyz0+pmS5R8mWFO75EdBPZYRvQ2y/xsWKmyqfVQ/EeGKcsszCi
	ssyQ==
X-Gm-Message-State: APf1xPB9puObL0TnBGEyWNGgJd/uERJ4hnPcy4idUcHGqJfHKUGI5UBo
	YzcVOi7C+75qtu5rhsFWJsfKiZZYo2ZGY6nS4LRxng==
X-Received: by 10.202.96.196 with SMTP id u187mr1676791oib.63.1518701562965;
	Thu, 15 Feb 2018 05:32:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Thu, 15 Feb 2018 05:32:22 -0800 (PST)
In-Reply-To: <20180211205848.4568-1-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2018 13:32:22 +0000
Message-ID: <CAFEAcA8J6D2Cq5D27eL9vB5jfUG4QYirzgvCNz9Y5yhWKpX+nA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-devel] [PATCH v2 0/7] target/arm: More SVE prep work
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /0WinjUrj5IW

On 11 February 2018 at 20:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Changes for v2:
> Include signal frames and PR_SVE_SET/GET_VL.
>
>
> Blurb for v1:
> First, we had noted that ARM_CP_64BIT needed to be removed from
> the ZCR_EL registers, but the patch set was applied without
> actually fixing that.
>
> Second, there's an existing bug by which the FPCR/FPSR registers
> are not properly trapped when FP is disabled.  Fix that with a
> translation-time check.
>
> Third, my attempt at using .accessfn for ZCR_EL fails to take
> into account the two different exception syndromes that must be
> raised.  Although they probably aren't as important as FPCR/FPSR,
> handle them at translation time too.
>
> Fourth, when writing to an AdvSIMD register, zero the rest of
> the SVE register.
>
>
> r~
>
>
> Richard Henderson (7):
>   target/arm: Remove ARM_CP_64BIT from ZCR_EL registers
>   target/arm: Enforce FP access to FPCR/FPSR
>   target/arm: Suppress TB end for FPCR/FPSR
>   target/arm: Enforce access to ZCR_EL at translation
>   target/arm: Handle SVE registers when using clear_vec_high
>   linux-user: Support SVE in aarch64 signal frames
>   linux-user: Implement aarch64 PR_SVE_SET/GET_VL

Hi; I've applied patches 1..5 to target-arm.next, and left
review comments for 6 and 7.

thanks
-- PMM
