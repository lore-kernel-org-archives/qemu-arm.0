Received: by 10.223.197.9 with SMTP id q9csp1645750wrf;
        Fri, 6 Oct 2017 06:22:56 -0700 (PDT)
X-Received: by 10.55.23.131 with SMTP id 3mr34042820qkx.237.1507296176826;
        Fri, 06 Oct 2017 06:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507296176; cv=none;
        d=google.com; s=arc-20160816;
        b=K4pIsQ+tefxf0lOZnQHJR3108VKVzLBnA/kYAoZFlpC+Y+v7PC1d77YJuYL2HiNUgg
         IiuSBFciXtzcJZo3pFXy+9zdYd89j0rUMyGjpkPEeJ8ixsBApF9t3byVQzOn7vEGcoUQ
         S+QyKwE4d7ieYkmFmH3oWUrKcTJCoMU8dR62rqWirxM9wwocwXFH276PmoiRGb/LxCBw
         YLc9AEBAnhMSIP72gYFJqDp+VYWqXwx9X7ePwLR9mAqEKU7wHz1zHDj+myX9WZv3rFqz
         7mOz5kc+KbxLrHNO77ZtSV7Fa2x79CyjzIII8kCAQK+cJvNhAKISJipWtbJKgR4dS7Dd
         +E8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=53WFTv5mPw/YuNEFoWaRNTHID8yX1AussIRe9RJNR2E=;
        b=1Hifx/wmNlbFqpv7PoIz0iImUYC7EGdzBfvGisHS/ZRPGbOHXUWtCaKptc5pkYdDtR
         E1DahwnBFdAGTfWVN1+MIUHnh5z8On1d9RDciDnXwhPG8MyKZIYW0eYrD7aQ0MDyyNTM
         4iHKRgGSK3ZFGcRkkbF+EAY3480dFkmyBrmNMMyuukps41AuEjz9GJTLEJA6T+Gc/kww
         qerVnfoV2HkvqJfxpcvtp7Au6k9VxvwsyC35QpcXZf0O5M1Ek2MVzRYWrwaWNb/lXraD
         mUnHeFPf1sWq0muyGrvPBu0awUlVBineFF3pu1Rg9rbS9ecL4zO7J+mS4h95I8A+7z5C
         NDEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fkNogQOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t58si1277555qta.342.2017.10.06.06.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fkNogQOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Sae-0004BZ-A6
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:22:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0SaT-0004BE-11
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:22:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0SaR-0004rK-TG
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:22:45 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:50507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0SaR-0004qi-My
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 09:22:43 -0400
Received: by mail-wm0-x22f.google.com with SMTP id u138so7552870wmu.5
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=53WFTv5mPw/YuNEFoWaRNTHID8yX1AussIRe9RJNR2E=;
	b=fkNogQOA4Ao5YZJiBAlrnTO5oODvINyq6yaQ7m36ZX99X8NHOSRx2Q9Aez5KL4PxaN
	JTXJf6HwJMnMs5HlSsv3w1IZYYjGU/jSRfYFBYNUy+e5jbezaSgtArsOYcVsOYkBXrJ2
	0r3CRnLj/UawbREYlKh8+rWNn608CNlu8EQO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=53WFTv5mPw/YuNEFoWaRNTHID8yX1AussIRe9RJNR2E=;
	b=Db63isJ7TathQhhRkpQttcRZhbSiYeBjCdk/M4BoEXalN/v2PmRYy0Jw42wSG1EGzm
	IU/Ne4D8b5qGuZFZ4TLNoMGBe0xGVyNf99N2NANH1V/BTaIq6GPwqap5tCeb0/JQgT/t
	Kds4RevtnRgUiIAMd+AsT9r9mEu7v6lD+BrSUlHUUvDGq9BRyCVrC4WvCzosnm24BZFT
	PXlF6VI6W7wexeCMZmzOGBU7LeEByeaLVOsC/QraJ/HAZLYm8FFOyBkx9/wxOuKdGE02
	la/q8ttrzSlkiaZyz5ZluXb69hJDAzthhtCJ8lHinc0HjCUV3SroWU2g5X1Tr8sKGffr
	8dUw==
X-Gm-Message-State: AMCzsaUqkJlNZH03BFZvpiSINStJ/X40GwB2ULDkQ5NG2/ah/Tk7xXfs
	H0QuABbiTaXiZ2uIgBEqg+7QPCwsMx0W6xUnsBV+sQ==
X-Google-Smtp-Source: AOwi7QB93XiPzFGGxDc392is+d0K0W5+7SQtikMOruI6eibqHST+fuA3tnFnZ62Pd8qFvOr9Tls82z+BoCqkB7ti738=
X-Received: by 10.28.113.196 with SMTP id d65mr1661832wmi.151.1507296162605;
	Fri, 06 Oct 2017 06:22:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 06:22:21 -0700 (PDT)
In-Reply-To: <CAFEAcA8dmJLEz_J5z8hCipmPgjxm5WE0D-6DPs5mA3HC_5ou6Q@mail.gmail.com>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
	<c0b514b4-6474-87ed-6fa0-c109761d243c@linaro.org>
	<CAFEAcA8dmJLEz_J5z8hCipmPgjxm5WE0D-6DPs5mA3HC_5ou6Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 14:22:21 +0100
Message-ID: <CAFEAcA_H_cgEPs1+aJ4fWzPys8-0Omyn_BtHGhJVwWuNbrr=gQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/20] target/arm: Don't switch
 to target stack early in v7M exception return
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w7K1HKVVnsVn

On 5 October 2017 at 17:20, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 5 October 2017 at 17:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 09/22/2017 10:59 AM, Peter Maydell wrote:
>>> +static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
>>> +                                bool spsel)
>>> +{
>>> +    /* Return a pointer to the location where we currently store the
>>> +     * stack pointer for the requested security state and thread mode.
>>> +     * This pointer will become invalid if the CPU state is updated
>>> +     * such that the stack pointers are switched around (eg changing
>>> +     * the SPSEL control bit).
>>> +     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
>>> +     * Unlike that pseudocode, we require the caller to pass us in the
>>> +     * SPSEL control bit value; this is because we also use this
>>> +     * function in handling of pushing of the callee-saves registers
>>> +     * part of the v8M stack frame, and in that case the SPSEL bit
>>> +     * comes from the exception return magic LR value.
>>
>> Exception return magic lr value does not appear to match "pushing".  Did you
>> mean "poping" here?
>
> No, because the code creates the exception magic LR value for an
> exception entry, and then uses it to determine which SPSEL to use.
> In the tailchained-exception case we use the magic LR that
> the attempted exception-exit got when figuring out where we need
> to push more registers as part of the tailchaining. The pseudocode
> chooses to open-code the "find the right stack pointer" for that
> codepath (in pseudocode function PushCalleeStack), whereas for this
> QEMU code I opted to make the utility function more specific. That's
> what this comment is trying to gesture at.
>
> [The push-on-exception-entry code is in "target/arm: Add v8M support
> to exception entry code"]

I'm going to change this part of the comment to read
     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
     * Unlike that pseudocode, we require the caller to pass us in the
     * SPSEL control bit value; this is because we also use this
     * function in handling of pushing of the callee-saves registers
     * part of the v8M stack frame (pseudocode PushCalleeStack()),
     * and in the tailchain codepath the SPSEL bit comes from the exception
     * return magic LR value from the previous exception. The pseudocode
     * opencodes the stack-selection in PushCalleeStack(), but we prefer
     * to make this utility function generic enough to do the job.

which hopefully is a little clearer.

thanks
-- PMM
