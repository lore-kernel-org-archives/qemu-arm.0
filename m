Received: by 10.28.4.212 with SMTP id 203csp896003wme;
        Thu, 19 Apr 2018 10:13:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp1Hq5icFD5vZqGIY/mpC0Bsd4b7YlheTQJygMIAA3KcN/ptixDLzXLHhxJrsmt221vSvIT
X-Received: by 10.55.174.3 with SMTP id x3mr2352755qke.255.1524158021361;
        Thu, 19 Apr 2018 10:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524158021; cv=none;
        d=google.com; s=arc-20160816;
        b=hfNwM1y88Z+fivJ348V0C0QQBj0Cw16SJQ63oWgYcIH64Bd6vAGoGVAD9bVhIF/Mbu
         NYYxvHufRce6zwgHuF3BJlRMYZMwLE3L4CzSTAZbFV3VXzRoWimDYnq7qTOq4xGMY21m
         jz1GETEQOzC8zDmgvF/mAWx0FCUcWe/CmFO2e0UyR5Q/T9GVgwPZDXHL7kgEYvNDpfCZ
         BpSo3Gm7I9E6H/kGadIKYvUqNb53T25Vma4JSTqQ2WlWYB7WDg7N2KNf7SBTQvUrXXy6
         RUVrTrjjqvwLpLagsT7G8TU3DvH7afHL7tgz1qgPEaKLMX1C8R87F1OU0Qz7m9d/VXqx
         d70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7pK9EQpAlrofutg5T67khg2VyHrfe3xKs/wyTbS8cZw=;
        b=rTbSLHhME/aFHZ6TbnKRawFhYgyn0JWbF8+GP5t3RwQtkjzZn1D0ADyhMXPr8oBxWZ
         mM3pPk2vH8qMhNtvMQw2CdXTYzncmqw5Ywd2o7ww2yGaBqN1cUCp1sr8Ksk7cEXwkTJj
         T3JifMa9j8ClmC5eHFGTkDMxL6zEHRSFclI66MqJgQz5VlzV9K7+YiftVTpYgcY+sID1
         xh0pi03h9cTqxmm+M6lEihD+8XEyDe2VS/kzlR6jB6V19EXt1JKHztsBpvCh9MTqrOuG
         St4TykqoXkiBy89tCUY3c0AIcJkztsBBMjvsi25T+enClRHjDZbQIm5Cs7j4kygqvisC
         JwWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=May7H1qv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o186si2236414qkb.68.2018.04.19.10.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 10:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=May7H1qv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9D7s-0000kw-KY
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 13:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9Ctn-0005He-LO
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 12:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9Ctm-0007qA-TX
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 12:59:07 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9Cti-0007oF-DC; Thu, 19 Apr 2018 12:59:02 -0400
Received: by mail-qt0-x242.google.com with SMTP id w12-v6so6532760qti.4;
	Thu, 19 Apr 2018 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7pK9EQpAlrofutg5T67khg2VyHrfe3xKs/wyTbS8cZw=;
	b=May7H1qvke4rhkMEsrL2+QGDtvxo30UtmiEWDQmUqYIycEtk8WtbkijeOTRPOJpQ5p
	kjKiKFakvO2185R2iQq356rglhz6hmfNQ97ZETp5wOcuRAzwj60tpQVaHBekMFEf+35Q
	aTuYJFbdo6XCETtX81u9kZuDhhdEmtMuKbcguOQwbIx8/13Hmn45iyz7lLzpBXYJpVZb
	+Eud23lW9DT6EGS6zPCU+6y04atpbZfdbXnMJpr31aIca65gP9m9GPHy+lZlCbM5vrtO
	dH5aYgHAf6eIzM3kP4syywBxxq4lANCub8aLs9ourtjo2K/hRaQYAtmqsZ/NBOaJHisM
	labA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7pK9EQpAlrofutg5T67khg2VyHrfe3xKs/wyTbS8cZw=;
	b=THWE9hyvaf54Cup9CRBDLTjkXvcJ3q7tMwH01IVXCcuNLxegEyB5MMhn1pR4fQ2Fp/
	giSuKbgfeMmD1//cEeSFQzg3DeP64rc//lRSctuXFiFNLmh2VwQBTR5/7iUfDJ84G3wR
	ZuQjxUKnwrcSxMF/DnPJNPg6YioH2YQ2jUA+GBgKlL07VXpQV7dJahjLRzhejU1mEQCy
	92DmBs/UehExjgG8LtdjkIxMLcICmyiu3aKR2lMBDURjKXHoDGwwtrc6hmjSaSgSzQOH
	6i3pEZqFy0lZGJmliP2A/VCLM/Gc7vKZgLsYxgRu1AEUAVjWLi4CqUvUmTiHqEsvLXOG
	pWew==
X-Gm-Message-State: ALQs6tBEzac9dmD3n9AphgCZ5zyOjmFs+k8es4snrgB12AAlJvK1NpLn
	On4Dnugp7a4Z5Y5w3AVL9EQ=
X-Received: by 2002:ac8:1e09:: with SMTP id
	n9-v6mr7152179qtl.418.1524157141816; 
	Thu, 19 Apr 2018 09:59:01 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	n3-v6sm3044391qte.87.2018.04.19.09.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 09:59:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180419142106.9694-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <fe11dfb7-a5e9-1b85-3f65-e3639f463558@amsat.org>
Date: Thu, 19 Apr 2018 13:58:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419142106.9694-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Use
 v7m_stack_read() for reading the frame signature
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
X-TUID: kpMGhqnZodYf

On 04/19/2018 11:21 AM, Peter Maydell wrote:
> In commit 95695effe8caa552b8f2 we changed the v7M/v8M stack
> pop code to use a new v7m_stack_read() function that checks
> whether the read should fail due to an MPU or bus abort.
> We missed one call though, the one which reads the signature
> word for the callee-saved register part of the frame.

Good catch.

> Correct the omission.

I checked, this was the unique omission.

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b14fdab140..2ebd086ef2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6913,7 +6913,6 @@ static bool v7m_push_stack(ARMCPU *cpu)
>  static void do_v7m_exception_exit(ARMCPU *cpu)
>  {
>      CPUARMState *env = &cpu->env;
> -    CPUState *cs = CPU(cpu);
>      uint32_t excret;
>      uint32_t xpsr;
>      bool ufault = false;
> @@ -7112,9 +7111,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>              ((excret & R_V7M_EXCRET_ES_MASK) == 0 ||
>               (excret & R_V7M_EXCRET_DCRS_MASK) == 0)) {
>              uint32_t expected_sig = 0xfefa125b;
> -            uint32_t actual_sig = ldl_phys(cs->as, frameptr);
> +            uint32_t actual_sig;
>  
> -            if (expected_sig != actual_sig) {
> +            pop_ok = v7m_stack_read(cpu, &actual_sig, frameptr, mmu_idx);
> +
> +            if (pop_ok && expected_sig != actual_sig) {
>                  /* Take a SecureFault on the current stack */
>                  env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
>                  armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
> @@ -7125,7 +7126,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>                  return;
>              }
>  
> -            pop_ok =
> +            pop_ok = pop_ok &&
>                  v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
>                  v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
>                  v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_idx) &&
> 
