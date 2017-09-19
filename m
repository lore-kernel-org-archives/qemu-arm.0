Received: by 10.223.172.38 with SMTP id v35csp5238962wrc;
        Tue, 19 Sep 2017 11:19:45 -0700 (PDT)
X-Received: by 10.55.72.81 with SMTP id v78mr3228530qka.333.1505845185430;
        Tue, 19 Sep 2017 11:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505845185; cv=none;
        d=google.com; s=arc-20160816;
        b=F4Nflp49AD1Un+qIbKE007gKZjp89GKZEsQLWK4G1On7HXf4s7/O3FRb9UZarQ7KqS
         WH129tKqg8fOF9xQXwH10Q6dTAsviWR1biN2GqY1UcE+qH9T6hQB5axZjj59H/UHdL9r
         6v4vMILC3J+oMKkV/7ImUSaogo+86N2LQxFwIWGqH9yCmpE+n+ZoqCVic3F33xDhILF8
         gLdKEBKfsekbozgLyUH+iWYLR6R1LAWD60s5f8gEHk3S/FlTZGwUggHd3FC964dPhUlr
         doLVl5Ak9eePy+Pz++sS9uofMhCDq6liEP/aqHkSOlqyuRhjG3D5uHnYbFQbpzsgi0Db
         nQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=w9hY5tTxpYfM88/OVdlmkp6b/k2rxpuQX4zAm776pAg=;
        b=JpUagMztehu96c1wBvEDJBUnC2n3vQO1/RGBkmxa6kkFAFeKskbDZ3C29DKhBc5tZL
         Gj8adM0QUxvKS+BrcGszf7nGgO9rUBIDaW2uagXhPhC8BrhO51fY6qJOzPeOcCH4MOWx
         u8r5B+O0fF+0WViOEA8EjhUOwKjxugcYakl8m8UrIr/FGBfeAdKbbxbhddFOYG1dhvJ8
         /6IYCmaOEso6bXXOb1glpqCzz/FrDVIA/cMxUhVkvvMj3bpE2ZyQD5SVwpZTErLV0vg/
         irNIXSj2LXF6TTE74efUj4Ib+htJ9PabS6IDkGH2sAdl63ZeMn4vSGhaazPvpXkVzcyE
         UfNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eF4pgU1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22si1547595qtb.155.2017.09.19.11.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eF4pgU1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duN7X-0000w6-4Z
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:19:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duN7O-0000vk-He
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duN7L-0002h4-70
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:19:34 -0400
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:50041)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duN7K-0002ff-Sc
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:19:31 -0400
Received: by mail-io0-x22a.google.com with SMTP id 21so1147320iof.6
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w9hY5tTxpYfM88/OVdlmkp6b/k2rxpuQX4zAm776pAg=;
	b=eF4pgU1sWFVX9nzs5w8MU0ArZbCCYB9DpQLllcd8w8n5C2E7q2E+zw//NcMV3Fc30j
	Kr8TMGnnbGxRM7w+r64dpsMUYnMOO92ExcdTFJbi1AQw96tR7aRb6lo1tcVFc4i55JH9
	v79NSFl2Td5vLAeUngoMvzadRfC+VlJvQ+yEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w9hY5tTxpYfM88/OVdlmkp6b/k2rxpuQX4zAm776pAg=;
	b=JMrxGURCxXX37xiDE+9TXWxLp8UX79RyuJlQMZKwy/nHDefDJ3SYeohsGdFYntrbM+
	SfNOeHCFEDR35JvZfjkc06yroii8I3X0no3yiNMncgRW46+vc+2bD2/eC47E8gcCTy3z
	rEyLB5w3W+2t0bN+HiQgOS6UNo1PZy2OFdO501nJZPwLRysvb98ip1SEe1Il+V7x3sAt
	X3EuFTMhwvNU1SxKdgSiU4rCA3d5qs6V7ARCGUJFSGvEnZK1wE/QjLdfF5/6PnOR6oe0
	I/cyg6DjrSJ/G7vgAzoDW3Fj19UKBfdf59JXbNtl2s9gxHdwCb9BtIIvhmxbzBwoRATt
	OSEA==
X-Gm-Message-State: AHPjjUiEyJwxLPcOfr/uXAykmKsxvPPKjnrEcum2lSamYRKxv+2n3aoB
	lN/zDIs4x0/aybUjYBhxnAJKSw==
X-Google-Smtp-Source: AOwi7QAAlY1Xnwncr3CjRDPxmKi5XtXNeseBXRAin1OWSvoKvUb77ZoKlBA5Ufl1oAl3MrpSOdLI1g==
X-Received: by 10.202.88.137 with SMTP id m131mr2840362oib.178.1505845170086; 
	Tue, 19 Sep 2017 11:19:30 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id q3sm586330otg.52.2017.09.19.11.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:19:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <712822df-6575-070a-a7fa-5ed9298ab2a7@linaro.org>
Date: Tue, 19 Sep 2017 13:19:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/19] nvic: Implement
 NVIC_ITNS<n> registers
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
X-TUID: ir4LFI6A+qat

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> For v8M, the NVIC has a new set of registers per interrupt,
> NVIC_ITNS<n>. These determine whether the interrupt targets Secure
> or Non-secure state. Implement the register read/write code for
> these, and make them cause NVIC_IABR, NVIC_ICER, NVIC_ISER,
> NVIC_ICPR, NVIC_IPR and NVIC_ISPR to RAZ/WI for non-secure
> accesses to fields corresponding to interrupts which are
> configured to target secure state.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +            s->itns[startvec + i] = value & (1 << i);

It probably doesn't matter, since a functioning C99 compiler will do this
transformation during conversion to bool, but (value >> i) & 1.


r~
