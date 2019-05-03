Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp547289wrh;
        Fri, 3 May 2019 06:13:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4yNB5a4cA4wjFwrPcDD7EYAgK5MVVUaYDkaZp6QREfUhYJdTPim/PDUjmWW05b/NiNF0e
X-Received: by 2002:adf:cc8a:: with SMTP id p10mr7218470wrj.34.1556889217248;
        Fri, 03 May 2019 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556889217; cv=none;
        d=google.com; s=arc-20160816;
        b=E0WAK9ERMMljRDnPyYiITukyqNxo6xOsQwiNAGeK5CSorq9sKUdD7rpPBU8yJFbbIQ
         oQdE+PVEK60Bysl2VwlJu7WhWL0xr44nkra6pq6iKxF2ao10NUKXmvdq8OaQa9xybCjN
         DsdsOdttL5gYJiGpemlCTeC+18xwkUbgs1Bo1sKiRm2VnhXHRcjAb6N6ZtpQI46CH+LL
         PH8xniNx2HVmWMs6KdFgcLxCD4MLiZWOqBNwt6eppy64q1Q/fcPIahBZd346ZFlXGkIz
         T9ryvX7cEfJFfmn7JZyC2EL1uCvAURWcMyVs8nHJJkEZZlVMtHm0RehoE8oqHo1KU17X
         bj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RzxudKemH3AI7iqLcMcMxSNiWjSkEogCcEQ8KwqH6ak=;
        b=dwcZFY3gapomcE2fZSPN/FbKvZRMFKYm6GiAvcv97Al3VF74H05VDADKNnQ/5EBY1d
         VtTcOlJsdmmJNzLWeLexNaUFBFwAiAsQOByzHNJtMOejkr5EvZQJI7rAv5GWLPZ11aiy
         IuUkDB9oCGs8E42GIsA0ZaujjLNSue0Ie5XqpfR+Ury6HuDdpmlpjSClNns920GgRA58
         r2TDWMIxmRnWYfY7EwiFvFX75Q9fvlwZwhFwLs4nT9V7Ao9f9bJQzx9reODroDI9CTZz
         +5u6EAv/v8gc4FShxGUo9tMJJ2ge3a4O29d9odt3SMNXUfxhT9XrvAT8kSpkyRumnaRB
         wMTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="IP/mrDxj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si1525107wrw.339.2019.05.03.06.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="IP/mrDxj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMY0O-0004U8-8m
	for alex.bennee@linaro.org; Fri, 03 May 2019 09:13:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMY0D-0004To-0O
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMY0C-000696-3J
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:13:24 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:32914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMY0B-000686-Nr
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:13:24 -0400
Received: by mail-oi1-x241.google.com with SMTP id l1so4380819oib.0
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RzxudKemH3AI7iqLcMcMxSNiWjSkEogCcEQ8KwqH6ak=;
	b=IP/mrDxjZv20KF5baFr3Rf5fAVUTVlzct53Wg9APwLo71jLRMfg1c2sciWvAhE1MK3
	CTfp8972gg0oFm5OnB37jsyY6nu7lbBD0MuuHWSVOk5eWzhywPe4Ic4pZvYU2GMCxobJ
	IJoTwbeNR9iD+KIrFf+3I/Q4FMeFvrokByZzNQEe3RTWnbjOCqo5mbPJaOFZ2TnPo+sS
	LITZ8sG6UIKQrNGxu9TNd421tL8iwm2ELEpGhIPIMqtRH5PJsDuXoEcR9odbZjsNUDjp
	q/G9YzJR2xRcp7AIPXjAAOn93nV/M4GRFpWX2yMvzxzxg21Awsdk0DkhIMiFvF/gJvHH
	Kg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RzxudKemH3AI7iqLcMcMxSNiWjSkEogCcEQ8KwqH6ak=;
	b=FdJrPB5Vq8MIvKcou7JYiOb5/ZkloshLDw6HX+G7MdnvINrAJ0TllsQvVs1GkWNhNW
	8nr+IpBtlhvE+MOJbwSWTaik2Kn1Qt/QoF89fTsCA3bWdy+apyZ1LY36Lt22g8aFld0a
	mEmK2mf66Duwmm3Lq/RxMtU8zXo6AMojPbfj7YigaetR79VpEWbknk6ktTecPSz7h4Rm
	h0tHW4qJxie5Zq9JZwRLHk2KV4UdPWiGumOrlvdv4kSRQRqVsMffSaRgvmZ4+8NLflxj
	WMgpnevt0slZfdbHT56GOU4tMVkzkOK7amkXjO6Pvc9KXIoMirzCbitbsMWG/yNJJ23I
	tmnQ==
X-Gm-Message-State: APjAAAXbd+KUtv5HXlX9ojwyTi8Xhyyosv8rhDfRosx1+h5kZGal7Bne
	hJLHer5htYODhLUEpIV8h0wWxUT8tOn4+wVmWdUOGA==
X-Received: by 2002:aca:ab12:: with SMTP id u18mr5473345oie.48.1556889202462; 
	Fri, 03 May 2019 06:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190411153942.4533-1-peter.maydell@linaro.org>
	<53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
In-Reply-To: <53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:13:11 +0100
Message-ID: <CAFEAcA_GZPJj7OQ-jK1TX4wKS4hO6OR43OG0Y3eCuxVdiUtsnQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Implement NSACR
 gating of floating point
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
X-TUID: Rjg1MhS++bEr

On Sat, 13 Apr 2019 at 08:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/11/19 5:39 AM, Peter Maydell wrote:
> > +static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    /*
> > +     * For A-profile AArch32 EL3, if NSACR.CP10
> > +     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
> > +     */
> > +    uint64_t value = env->cp15.cptr_el[2];
> > +
> > +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> > +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> > +        value &= ~(0x3 << 10);
>
> Read as 1, and yet you're clearing the value?  Cut-n-paste error from CPACR?
> Surely better to do nothing on read, but set on write (to either HCPTR or NSACR).
>
> > +static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    /*
> > +     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
> > +     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
> > +     */
> > +    uint64_t value = env->cp15.cpacr_el1;
> > +
> > +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> > +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> > +        value &= ~(0xf << 20);
> > +    }
>
> This one does do the right thing, but better to clear the bits on write to
> NSACR.  This lets you avoid the change to fp_exception_el, and the missing
> change to sve_exception_el.

Hi Richard -- I was just going through the review comments on this
patchset, and I saw this bit. Could you clarify what you mean by
"the missing change to sve_exception_el" ? Since SVE is AArch64 only,
there can't be any configs where we have SVE and EL3 is AArch32,
so I don't think these two features should be able to interact.

thanks
-- PMM
