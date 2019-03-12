Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp593868wrs;
        Tue, 12 Mar 2019 08:06:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCm3GYbilEL92t0AnGUG4VzJjY95R8mSr1Sf5aSIkdiGdCiZgIxAJsNAJxxBDvaLLhw+PT
X-Received: by 2002:a25:ba8f:: with SMTP id s15mr9713219ybg.411.1552403208298;
        Tue, 12 Mar 2019 08:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552403208; cv=none;
        d=google.com; s=arc-20160816;
        b=sLnVlG1CyxcbjPQ23MRCku0wDANMVa4bIUkP9XN3mn3VvyFxxbpfB1k8ifycYe7XWD
         uvtqK5e3EJ9rvWMtP8Kmv3fkK2z3iIiog2+jG+9yGx+0/ONf5xZF18YnBFKoDVhg8PsD
         UXeNCdv1Ux7+9d9Lq12nGfQKLGExC5+kYI5nkJc/oVdQaM4eJ+LeZcrZ6nTptJPq0J2W
         ktzWC15GK1ACI8zBYzj2f40Wjmt2zNL3kdk+gN1CO7X5m8EB3XM6wjXpfLuWToOtIStl
         uqXY1KmNWQaY9v/t3xIhROl2pftOE6i2wU0O/OPUoeOQUTZ1e9xtU8Hcq1+axtEr6gZI
         Rofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=yYnhpwTDXa8RIySTpTsksZmDUuWBUEgheJk2BuBktQ4=;
        b=n6QAksN99KHyNfSlaN10HMqaxS3t1sCRkFysZ4aoGqD5C6rOXtggnuJCPl0+5IFiD7
         eQeQXHWjO5JtP13OG7n7W56YOw8P3a64t/6XDtMkJNm4Jl4MUIPaIYfzYEcQCV0y+KGI
         bG47g+eR5ZKvFmyEdT/84hZvF41dKB2KKHp9rtL3e21CGnE/VZCq8o4GWRzgdYZ26VaJ
         c7zLP6c3Co3TJ8VN6hvJbjon+QzJtzWWLSr4PHdL9PhzS6MOrR06+toJYCQ8c4o5QJLQ
         9GpAhIqbsmpDZSRm19KtQbMdRC+WKJ5io+TsnQIc7ipBEfwm67/1z7QO5+lsuQXHYNVS
         trHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QYVO5M6/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si5000358yba.190.2019.03.12.08.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 08:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QYVO5M6/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3izP-00021g-OZ
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 11:06:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h3ise-0005Cr-DN
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 10:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h3isd-0000DL-Md
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 10:59:48 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h3isd-0000AQ-C5
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 10:59:47 -0400
Received: by mail-pg1-x535.google.com with SMTP id a22so1998758pgg.13
	for <qemu-devel@nongnu.org>; Tue, 12 Mar 2019 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yYnhpwTDXa8RIySTpTsksZmDUuWBUEgheJk2BuBktQ4=;
	b=QYVO5M6/cS8UbyZJ22h2zXUdRKzuDFKEDmt3rLD6E4Emo3slWxeHdJ57xevbcenPCy
	b4Ea03bYfOg0u9o6GzKYeoyNSnJmksK9Qqo6EsWcT10/3ltZh181hn/7kAWysgtENJ+H
	YJ03wpOD+1DyMREslY9mNDfRHaQDvgssCU/dLBpxYiNamhYXS5hJVQIzFns9z0YLLoRV
	yAQYjCLw5lc2VxShpf3Vglz3wQg6HZg8gZOvxMhVEKvqN6WRQdxWD/Rq3OVAQ4G2MiXx
	X+k44fFr2sfs0KpbtVZwRly+FXeuNsdVAdKWJA0Z+wJebi6mqU1NNj4kiQf6YQxH1pye
	MCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yYnhpwTDXa8RIySTpTsksZmDUuWBUEgheJk2BuBktQ4=;
	b=Qd5xcxtBSESJmF9dYjAnwbmD2zYMF6k2lFehAGoUBpuevBcwEYHxV48RB7I1tRHBAV
	Zm6pldLJfFqLv2yiKueEVmdi/qFFsk2P0d5fWjsdhzcwTrc/D8uz03xOYslG+KFIThiR
	iE4I7S7HLM476Jsxgen4+J+M6Wyhub3rIdAijwJvIRIWSLH2Tcw19BbAougBwsCDzP3y
	tbeTvzQ5wXrIGff7kB0z8BgxSDX6GoaBYb6I+a8yhTMbf2PzL6noEIzdvzGLuZ6IiFpv
	EYekd6Vx09wQaqgxk+QZkRpD7ttZFvqr+KxXH7AOkqDc2itNQ9uSRA4wUUfMvj0Fw/GW
	ZJZQ==
X-Gm-Message-State: APjAAAW2LYk/48vWHXK1F0p8ZocFZWAbZx2TlTT04Q1K98uMWuXH1nPG
	6n8VXyoD2LRcxO9GbMfEE2thZw==
X-Received: by 2002:a17:902:28e6:: with SMTP id
	f93mr40783765plb.264.1552402783134; 
	Tue, 12 Mar 2019 07:59:43 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g67sm21045514pfg.13.2019.03.12.07.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 07:59:42 -0700 (PDT)
To: Heyi Guo <guoheyi@huawei.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1552377439-24640-1-git-send-email-guoheyi@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f0ac8cee-dd04-f15f-9073-d076a3d8b567@linaro.org>
Date: Tue, 12 Mar 2019 07:59:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1552377439-24640-1-git-send-email-guoheyi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::535
Subject: Re: [Qemu-devel] [RFC] arm/cpu: fix soft lockup panic after
 resuming from stop
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
Cc: wanghaibin.wang@huawei.com, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pce/BSrDVo3i

On 3/12/19 12:57 AM, Heyi Guo wrote:
>  int kvm_arm_vcpu_init(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      struct kvm_vcpu_init init;
>  
> +    /*
> +     * Only add change state handler for arch timer once, for KVM will help to
> +     * synchronize virtual timer of all VCPUs.
> +     */
> +    static bool arch_timer_change_state_handler_added;
> +
> +
> +    if (!arch_timer_change_state_handler_added) {
> +        qemu_add_vm_change_state_handler(arch_timer_change_state_handler, cs);
> +        arch_timer_change_state_handler_added = true;
> +    }

Which means that this will not trigger for the second time that you pause the
vm.  You need to key this off of something else, like cpu id 0.


r~
