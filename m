Received: by 10.223.172.38 with SMTP id v35csp951643wrc;
        Wed, 20 Sep 2017 10:22:17 -0700 (PDT)
X-Received: by 10.200.20.136 with SMTP id l8mr8651388qtj.98.1505928137029;
        Wed, 20 Sep 2017 10:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505928137; cv=none;
        d=google.com; s=arc-20160816;
        b=skID295dGsdJiAl6ijbVw/80WTyUmVXUifCjUbYayT1hXN6e8OldX5IZH1VpRrKqwy
         P7Ee5ZrQwJ6uoYGMj0cDqUbQ71usVPzGpSy9B98Tc2QwI3vk8QO7/I0RuRXpR7juylxg
         Or8fFNVjvYXcrm2r0TqRjiBi6WmgzU/elq4PBO3svo8Aa1pv/zmEqdjFA2jh2hI8grtJ
         oIn63w0/EUYAMTBAC6Bnm0Nflg8An9gG24DhQsBVSWaKe5hjQ95OV+iBQhkgLvELsOfM
         T4JQ9q0HditL5PbVKxM3oVdDSoDGZMPBAf/FhvNad5QA1sCqozF/3f1jD1kQ+gf7L6Hw
         i7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=OrJ5uMlRKMMl++TWoSOvmuGCPCwv04nPYssFLzFHwO8=;
        b=Zztcwi+NZV5b2riGcNDPu0BQ5oQ0elAVQsyMC16yTrMwKV8/H+Nvz4Hk8puqf4KoWU
         sXmDJIpjoYxyZpbYXbSUTD7w/k/qu/pY0QgIQ3Z2l+5EsmG7vCfpjSPOOm/k45LQ25OS
         6U5RV7Bck7PKzkHUlpLUC/kYvjehPoUW7TADBMwcI8HEZD8T/KEzUcw2LdqvyOZ9WIqT
         mW15LLsL3VsIvHrsKIq9zzc6NX/z2FFxbg9a27V97T89G3uGgrUJsbEPBltQldDxd5Yn
         0OEqib1z2aKH6DgXluMxJc36V2d1NhJjvE8j06Xsqbkj+7rnSyr7M4aBzqV9nz6ORLCb
         Rl1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g4DoVNZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si2207670qth.150.2017.09.20.10.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 10:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g4DoVNZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duihS-000422-MC
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 13:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duihH-00041j-3a
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duihD-0004pj-Oc
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:22:03 -0400
Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c]:54558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duihD-0004pD-IE
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 13:21:59 -0400
Received: by mail-io0-x22c.google.com with SMTP id h66so5116123ioh.11
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OrJ5uMlRKMMl++TWoSOvmuGCPCwv04nPYssFLzFHwO8=;
	b=g4DoVNZLonDiaH4AdLF5f708ZsyZth0a1xHxH94R/lMdiX8HC7ZKVb0P/3gTjZD91i
	FApe+4iglfFcclrlDP3cPfA9UeFpBsY18F89PfHBpMEt7UNOTo3lAX/Q8eVsleMArp2J
	7uojkhA6RPa5cGnz+w+TZA+/94mqajGnwoOtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OrJ5uMlRKMMl++TWoSOvmuGCPCwv04nPYssFLzFHwO8=;
	b=mbSdlnX7x2a68icReiGSlG4J2IEGKK70fWSLYJA7zKopwaQHD+uWpUsfkB5ADzrKBY
	W0iPtoMSFkwyxj+keq88XH0sYp5al+nHnhyWomjsyCb860bJ4vrwRmNzNp+uGsZU9hJ6
	CizmbKg6CplLY5BBB9kRCFl17U/W459GDdje21tTA4/J8/qpVBDAdmziBaOdj10YS49z
	KiOf4YbNIs36IcAofpXIRxahD532Jn8mDMuZaVd7MOfJ5r5nmOjVTOphAYQvMDWLYnW/
	LKotKGPmep/g2onp0YhJhoaE8XcjUJLSAlHmLGt/6kgN/zzBkx5XkRrlmC34p36A7OWS
	U/gg==
X-Gm-Message-State: AHPjjUikIUr7UquuNuSYJI4FeyooubH5xe2yhqcJmCpedymM95r4BHxi
	LylMZANB35DAXbEh2g9IAyi7pA==
X-Google-Smtp-Source: AOwi7QD8n9rS3eDA36G3XLrQFfSwFYdMrw+aZ0wfN1dIWHfjGcg0AtBt+D8f2sBDwJUapUulAv1Wbw==
X-Received: by 10.202.188.2 with SMTP id m2mr7095877oif.126.1505928118772;
	Wed, 20 Sep 2017 10:21:58 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	t205sm1666337oig.53.2017.09.20.10.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 10:21:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-16-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32822ee7-ab8d-7455-e6ad-ac705fc54c4d@linaro.org>
Date: Wed, 20 Sep 2017 12:21:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-16-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/19] nvic: Handle v8M changes
 in nvic_exec_prio()
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
X-TUID: Ly96urBlTvrH

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> Update nvic_exec_prio() to support the v8M changes:
>  * BASEPRI, FAULTMASK and PRIMASK are all banked
>  * AIRCR.PRIS can affect NS priorities
>  * AIRCR.BFHFNMINS affects FAULTMASK behaviour
> 
> These changes mean that it's no longer possible to
> definitely say that if FAULTMASK is set it overrides
> PRIMASK, and if PRIMASK is set it overrides BASEPRI
> (since if PRIMASK_NS is set and AIRCR.PRIS is set then
> whether that 0x80 priority should take effect or the
> priority in BASEPRI_S depends on the value of BASEPRI_S,
> for instance). So we switch to the same approach used
> by the pseudocode of working through BASEPRI, PRIMASK
> and FAULTMASK and overriding the previous values if
> needed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 51 ++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
