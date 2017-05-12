Received: by 10.25.0.6 with SMTP id 6csp18373lfa;
        Thu, 11 May 2017 18:32:16 -0700 (PDT)
X-Received: by 10.55.147.3 with SMTP id v3mr1326753qkd.165.1494552736703;
        Thu, 11 May 2017 18:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494552736; cv=none;
        d=google.com; s=arc-20160816;
        b=L5nwlKquitb4ufu90OIC6hgiO0SjnVwLi434Dg0mH+CapIb4rogTNK5zt9coVcHb8Y
         laETzt5geWMA/76gmZDoNo6Na3IXRKVRiv1nVtnTdFlymmYdSScS8kKiBl4qzH6eq8U5
         ckxrF0bNUsPLfsEI/jK5a2aAreMKu3blwG+r5Dfbzlyp+yGqUQLV5at2ZOZfqYnc+DcE
         Ytgxh9D7r94iRKWrsxA7llyRc0NwAb6vcLYR35pmPjzOrkPCz7tV1GB0h5MKAAzO4r8C
         HsVJCZlfEFZYga8Q5ND/saq/v6wNbm65XkvXfXRT1ClDFa2bJKoTs2ubuqXzE7Rv4QtN
         Me1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=4RBgMKAwDCcBZuA4aIgf7gY1tiWtrD2ZgLnarb2BmbA=;
        b=bc+grhf6QOwzONTP8GINqcHYSCoWWoetKLSSCppuR9M4y6VW1Np4SVzKca3D/0LjA9
         WScsFcz9TjKYU1l1MwpPheRVcxr1FgNB8Rvi+uhKRk8h15DcNgvS4cjW0ZpUjTJqIU6V
         SoFB8To4Uznmt87yYCkpjb9wQxHJV5uaPVwUaMAZnmQok60LkW/6y11JMmadI0STp4me
         dApf79sp3W1lGO6g302an7nXu8ppEDLFvVqV/AZEL3D38fx4t+O4SYVNdeY+6QVyfpYs
         OZnxWVXmzs0eKe4/CQmE8TdcyTrtL7p42BWAdzOfbb1pY4FWCf6d2pT7PgXE6QZZ6m14
         ciYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si1813331qta.245.2017.05.11.18.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 18:32:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50869 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8zRI-0003r3-4q
	for alex.bennee@linaro.org; Thu, 11 May 2017 21:32:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8zRB-0003qf-Pl
	for qemu-arm@nongnu.org; Thu, 11 May 2017 21:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8zR7-0004Lz-RX
	for qemu-arm@nongnu.org; Thu, 11 May 2017 21:32:09 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8zR7-0004Lr-NK; Thu, 11 May 2017 21:32:05 -0400
Received: by mail-qt0-x241.google.com with SMTP id j13so5111544qta.3;
	Thu, 11 May 2017 18:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=4RBgMKAwDCcBZuA4aIgf7gY1tiWtrD2ZgLnarb2BmbA=;
	b=bB7mD2vvU6/G7gDHXSPDNJ+0ZlXPN+xu3OOG/c5LgZ11/mTWEdqVpOf0o2mCYueyLK
	R01BRO2zmJdbBqth4LLrxDe5a5wLEue9PFCPzVURVVSw2B0Pezlq6n8LpZLDqSvaxcCt
	hpFgE/tKPwy2Q1y8/+xwPPcFOxM+IjqTZdBbdxovUaWbzZLluTkaCfybbuh5CcZrfxth
	sPFXuz71jNgAxzhMsQquXgg1gxMlm0vbHj91NHzUmGFsHpsURrDJ0AEfPoWOOoPN8ihx
	vir15nJ2MwB0NK7+mvwIDLtNwaO+w0QSz4sDAkAThY33lp0aFqXO0/PDQ6Cyq8hrlgvC
	gkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4RBgMKAwDCcBZuA4aIgf7gY1tiWtrD2ZgLnarb2BmbA=;
	b=F1RbCEglsafKxFioYe7HLqcM5An03P3B/MQ4oL/oWLhfa3lwwr+qrcA+kqh3q/qgdo
	gFKSDLmfcnjsO+cvIDENSJI4TEwlwHofPe+wdKJ2esE5H1IKd/6C5fIXlh41XnNrZJEt
	xod3+dlRi8fP9OHluhSgNCudFUDE0jwC9WnYqqVV46wuhCNX2LNE9Ujdj9BeU8NhudqC
	BZlEQJFJyEI/x2eG/5/1on+YN4pC4V/bj4UKChuIAw/1hJ479Tpd/0s5HmRL8fjfHTJ/
	wWa6oGGa/LUk4tGhn0Y004jOtkqPNNJ6RSIX7XESteseJq6T3BfesiSyxXZwJ/Bz7AKL
	RBgw==
X-Gm-Message-State: AODbwcBK6hS9+P5/ck4zXowzrYfdQL2op7i2Sll4xPjoNYnOx/cnkvy+
	4Stv+HMlqNgHFA==
X-Received: by 10.200.49.194 with SMTP id i2mr1579659qte.156.1494552724931;
	Thu, 11 May 2017 18:32:04 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id u8sm1383414qkg.59.2017.05.11.18.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 18:32:02 -0700 (PDT)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20170510200535.13268-1-f4bug@amsat.org>
	<20170510200535.13268-3-f4bug@amsat.org>
	<b258b01d-74f9-e412-5367-d8e1d72eb159@twiddle.net>
	<c58cdae9-5043-2506-9a91-f35f2da51e20@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b02f363b-bc10-7591-682d-dc8857031890@amsat.org>
Date: Thu, 11 May 2017 22:31:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <c58cdae9-5043-2506-9a91-f35f2da51e20@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 2/8] target/arm: optimize smul_dual() and
 neon_trn_u8() using extract op
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9n8tnuiP0wd

Hi Richard,

On 05/10/2017 05:32 PM, Philippe Mathieu-Daudé wrote:
> On 05/10/2017 05:20 PM, Richard Henderson wrote:
>> On 05/10/2017 01:05 PM, Philippe Mathieu-Daudé wrote:
>>> -    tcg_gen_shri_i32(t1, t1, 8);
>>> -    tcg_gen_andi_i32(t1, t1, 0x00ff00ff);
>>> +    tcg_gen_extract_i32(t1, t1, 8, 0x00ff00ff);
>>
>> This is very wrong.  See my previous comment.

Indeed, after correcting the script:

$ docker run -it -v `pwd`:`pwd` -w `pwd` petersenna/coccinelle --sp-file 
scripts/coccinelle/tcg_gen_extract.cocci --macro-file 
scripts/cocci-macro-file.h target/arm/translate.c --in-place
init_defs_builtins: /usr/lib64/coccinelle/standard.h
init_defs: scripts/cocci-macro-file.h
HANDLING: target/arm/translate.c
candidate at target/arm/translate.c:4703
   op_size: i32/i32 (same)
   low_bits: 8 (value: 0xff)
   len: 0xff00ff
   len_bits != low_bits
   candidate is NOT optimizable

candidate at target/arm/translate.c:342
   op_size: i32/i32 (same)
   low_bits: 8 (value: 0xff)
   len: 0xff00ff
   len_bits != low_bits
   candidate is NOT optimizable

>
> Arghhh I see, I checked manually and though I had it...
>
> I'll first check with the cocci script if it can handles this better
> then review the serie manually before bother you again.
>
> Thinking about it, this should be quite easy unit-testable somehow ...
> Not sure if I want to start this path although.
>
> Sorry for the noise and thank a lot for the review!
>
> Phil.
