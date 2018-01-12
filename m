Received: by 10.28.173.206 with SMTP id w197csp2182934wme;
        Fri, 12 Jan 2018 10:44:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBovUwuZHL4YzM99AN8psYSYN0jiwCnXV1xUe5r7XflmTeTdccQcdXU01jYlGeAiLv6ubhMsH
X-Received: by 10.37.203.15 with SMTP id b15mr24937161ybg.386.1515782675965;
        Fri, 12 Jan 2018 10:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515782675; cv=none;
        d=google.com; s=arc-20160816;
        b=C4o+o4t7aaRnCVHQxf+vPjKjX68WBtMzhs+h44mtsuymKJDyRJNcwtuOjUC/0Ascy3
         EreehYz3ybq6YRiQQ21g6l2ahP5NcJ9McWy0fWub1pCy88MPZZ5vaM9JVyX7pj73gZWz
         UXXOvj9zwlR3u1mYweR2ry5wvEdXuCGHgpLPnRF7b2zFwVk5FwrSItLLXLYCPwfyB4qa
         1pkXhZ7AJ1ZiNt+uzRrHr0a7X7wL73GkkPBf3kE6X8C1xDofw6LFmWbGK2GszqDUK0wQ
         t8Le+t84ph08sDuFeumqdsVX5TKUeX1DknzBy/A0LjGw1Bi2z4mbWxiktCeMKpSG0jrl
         Eo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=uaZg5u4O01ZWai1ooNt7eA3vqDFDNvMRaGC1N6aefeo=;
        b=YH1XD4pPdxv1xpYLdx3S3O5wKkO94E4T7Z0YbS9jaH5k7utp4ywDTwedgTzkPCo98e
         aZ7xR1ROnKMI0xEg2/Ww3WsJ0W2eb4i3ys21oPvV8gYpKx0GCTOmaEPosq4dbU8uoqGJ
         TWSGbv7dfSzZs6+GfX/+f+Vgsc9ejTQywcQEDj46wddzskgv68oUoY+xQwijFQgJMPvN
         ynmM0XC/EtEbWzHBlgL7Qm5/TCU5j8Fwz2mQlIZXfcrBYactJ8ogHsma9KjDwn2xzLJI
         1KWQbjlPGQE6Z3O+cccd3PZF1EMbJVXPls3PoMPmegnW86J8HLMODqbaWUJrIhsnkgKG
         oNFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3c0jolS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20si1386278ywc.474.2018.01.12.10.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3c0jolS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4Jf-0005Ne-BD
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:44:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4JS-0005MD-0E
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:44:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4JN-0005n0-91
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:44:22 -0500
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:39351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ea4JN-0005mD-3P
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:44:17 -0500
Received: by mail-pg0-x22a.google.com with SMTP id z20so5096510pgv.6
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 10:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uaZg5u4O01ZWai1ooNt7eA3vqDFDNvMRaGC1N6aefeo=;
	b=M3c0jolSGKzMOmlu2T93mDg1d2cQR/K5F5Wa4AP46fKEX3HEtl2jJx+yCscHJfd2b7
	ATQMk93tSlTIYFf7mSjHjgOH/chvJd0TP7cylfv6pxTDOjMjIy5UJAhyltVH0utYtH9i
	KaWHnP0/oTprE4PM2pujjahy0iXtIstocJ6LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uaZg5u4O01ZWai1ooNt7eA3vqDFDNvMRaGC1N6aefeo=;
	b=E2WOBEQpvcA1hteq+cHLrYiksLo+CGKPLYgYIz/QAT4O/y/Vcr6gfts1sbScy4T6TX
	3lDaDFesJPmGji0+9F4K4n+Oh1ofXFuHN2DmCM7KnnXB0qO6mSCbhSE8mkqQl6AO9FIa
	EgwDrTa129D+O6XXBzVfHaAFLERsp4arWCo9r+JqW/jtJrzqv4m0TYXkbLjn8iE0EVvH
	kofxoDACfHYYu3Y4wTitVuF1Aeol5dQxI0r9TTgO+Oc8HzbHHEYDqiCY1UcdQ5SBYTM6
	nScD7/RM5TTFEvBS1x0OLWpyPuW69OBAN+76xjcQrFVmCBCPJlA1h5ZKnivXJlaftGrU
	kV8g==
X-Gm-Message-State: AKwxyteRbxnZhPeHOChnLw5vs6EOc3D6H2JH8j1g3wf47L0mqc7I+zlb
	LxrIXeFORKnoPeOf1Un5Z+408Wngxy4=
X-Received: by 10.99.176.69 with SMTP id z5mr7538296pgo.373.1515782655613;
	Fri, 12 Jan 2018 10:44:15 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
	by smtp.gmail.com with ESMTPSA id
	z63sm50635097pfd.71.2018.01.12.10.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 10:44:14 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-6-richard.henderson@linaro.org>
	<CAFEAcA_NXsPZYJHhYZShroXFUS_5SwpJCi8ehBL+o4OxpNqYmA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <436817d9-3377-3828-b513-42934cbaa949@linaro.org>
Date: Fri, 12 Jan 2018 10:44:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NXsPZYJHhYZShroXFUS_5SwpJCi8ehBL+o4OxpNqYmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: Re: [Qemu-arm] [PATCH 5/9] target/arm: Add
 aa32_vfp_dreg/aa64_vfp_qreg helpers
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
X-TUID: XjFoeW19Un4V

On 01/12/2018 10:24 AM, Peter Maydell wrote:
>> +/**
>> + * aa32_vfp_dreg:
>> + * Return a pointer to the Dn register within env in 32-bit mode.
>> + */
>> +static inline uint64_t *aa32_vfp_dreg(CPUARMState *env, unsigned regno)
>> +{
>> +    return &env->vfp.regs[regno];
>> +}
>> +
>> +/**
>> + * aa64_vfp_dreg:
>> + * Return a pointer to the Qn register within env in 64-bit mode.
>> + */
>> +static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
> 
> Comment and code disagree about the name of the function...

Oops.

>> @@ -99,8 +99,10 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
>>
>>      aarch64_note_init(&note, s, "CORE", 5, NT_PRFPREG, sizeof(note.vfp));
>>
>> -    for (i = 0; i < 64; ++i) {
>> -        note.vfp.vregs[i] = cpu_to_dump64(s, float64_val(env->vfp.regs[i]));
>> +    for (i = 0; i < 32; ++i) {
>> +        uint64_t *q = aa64_vfp_qreg(env, i);
>> +        note.vfp.vregs[2*i + 0] = cpu_to_dump64(s, q[0]);
>> +        note.vfp.vregs[2*i + 1] = cpu_to_dump64(s, q[1]);
> 
> This doesn't change the behaviour but I suspect it's wrong for big-endian...

Perhaps.  Since this doesn't change behaviour I'll leave this patch as-is.
That said, how does one go about testing aarch64-big-endian?  I don't think
I've seen a distro for that...

>> -            int elt = (rn * 2 + (index >> 3)) % 64;
>> -            int bitidx = (index & 7) * 8;
>> -            uint64_t val = extract64(env->vfp.regs[elt], bitidx, 8);
>> +            unsigned elt = (rn * 2 + (index >> 3)) % 64;
>> +            unsigned bitidx = (index & 7) * 8;
>> +            uint64_t *q = aa64_vfp_qreg(env, elt >> 1);
>> +            uint64_t val = extract64(q[elt & 1], bitidx, 8);
> 
> 
> Any particular reason for changing all these ints to unsigned ?

*shrug* unsigned division by power-of-two is simpler than signed.  And of
course we know these values must be positive.  I can drop that change if you want.

>>  vfp_reg_offset (int dp, int reg)
>>  {
>> -    if (dp)
>> +    if (dp) {
>>          return offsetof(CPUARMState, vfp.regs[reg]);
>> -    else if (reg & 1) {
>> -        return offsetof(CPUARMState, vfp.regs[reg >> 1])
>> -          + offsetof(CPU_DoubleU, l.upper);
>>      } else {
>> -        return offsetof(CPUARMState, vfp.regs[reg >> 1])
>> -          + offsetof(CPU_DoubleU, l.lower);
>> +        long ofs = offsetof(CPUARMState, vfp.regs[reg >> 1]);
>> +        if (reg & 1) {
>> +            ofs += offsetof(CPU_DoubleU, l.upper);
>> +        } else {
>> +            ofs += offsetof(CPU_DoubleU, l.lower);
>> +        }
>> +        return ofs;
>>      }
> 
> This hunk seems to just be rearranging the if-logic without
> doing anything else, right?

There is a name change in there.  But otherwise it's a re-factor to avoid
over-long lines and reduce duplication.


r~

