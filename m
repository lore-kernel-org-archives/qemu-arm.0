Received: by 10.223.197.9 with SMTP id q9csp895667wrf;
        Thu, 5 Oct 2017 12:41:11 -0700 (PDT)
X-Received: by 10.55.27.25 with SMTP id b25mr31444892qkb.144.1507232471161;
        Thu, 05 Oct 2017 12:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507232471; cv=none;
        d=google.com; s=arc-20160816;
        b=R4QoAI4VyBVm0YYwnrITIaKwVydqrgnv+VJw5Lf/bQF07JeqUBNatDXOKOY/fvyION
         T4LU5gG2aS1u/UePuTQNRraTRSp9DyLfkN6dIMz9DYDTmPtQkE9x8v7UHpEjR88QRciW
         sl6yHfhtplOLziMwHhtrL+SmyDPZOe1FQISot9InoggqF3HCTWoj0MEALhtr+20g7eid
         WYCR4udQ7mRtFqh85du/RGw6turqP3v50I3IWNQQ6LsoIF4vD/eig0nx/TbSK3yXwHn+
         ZxrzsAa2lKxTvZKIBRqIEVPMDCGv9hZyg4kmTsnbBh/rQFQe1740BmfpVyq1kmVjzEFv
         kKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yHxj96lu0HWwF0nOUZ16bxGlAZ7tqVEufPppKI47hHU=;
        b=b7eNFvayAKg8zHKSOSgBQj7kQH3FoC2kz6zMTus5HW9kbWym1rkMOEH2X/TiPzQFI8
         AkJsrzUShlMbgTSiN0XmrUnQPTwYcpVpdtHI5070Cx72+HKCyjQ2e0gazZ8F3Xgkj96E
         If5/Uti8HhKxLLQ9mCFbCpKx0qGK60sYVK/wM/U2L6Gdqhndc0uJfpjRgeHleMWm3j1J
         O6u1JfwWMyUl0pNXBBtyKrVXNOVG4hLoBurqWx0LyU7K050Q+WJzZy4WlCNZlTOXMYzS
         ax6SPPyNyeM7qsDRROvT1tTYSeVQurGG5bRGXQ4oWrsVLuBRYpWbPOkHdm/MaOfjTUuL
         DYGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ok8P12Qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n129si2663175qkb.174.2017.10.05.12.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 12:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ok8P12Qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0C18-0004zr-M5
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 15:41:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0C11-0004zi-0s
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0C10-0000Rj-76
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:41:03 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:45344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0C0z-0000PH-W3
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:41:02 -0400
Received: by mail-wm0-x236.google.com with SMTP id q124so4028263wmb.0
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 12:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yHxj96lu0HWwF0nOUZ16bxGlAZ7tqVEufPppKI47hHU=;
	b=Ok8P12QeL/m/r8DtLs4nKnqd4YeQW/oIbLl6YyIaQ2D6/1X0I/3j3K9zEc/RgFmRLB
	05zIVejmE6PFW2sNz+a1bj7JwD6HiaBjAtAzFS+b7u+wGpczh7T1lF+PzcN/UWeL/gVV
	OnVDwJ3JihU2puZJmEajUJGpT2tW5R3Q2j4/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yHxj96lu0HWwF0nOUZ16bxGlAZ7tqVEufPppKI47hHU=;
	b=XxzkEO34xY/U1gx1t/+0nf3br/fQKGfee9XyfLk2I/yF6bIG1S/7GqsxZOEuhOEcPb
	41L52kB+aRdQKePH/O27XZ0mncNmKsOwDWZ4oCG8nKBxvfD/Q5u1teAwaDuFYcAe1Dvx
	9nXH5Jc0w+Pg7u3TB/TiyEdt6p8igbmvcCrjBek3ztDWIEwV5NUFKoL0TkpvOz9jy3ed
	QSKOfRPEofmGcVvKAZdhJvrb4uYGSVCc6AcAthUcm/k7LynR9ku8ofz1b+DCnMz9/JVr
	vBRpIKgzprnZNUDGlDb6r0IgDIF6ycgiykdRASL0cb4+Cy6A2t+ewSfbcYADUPTNdSB+
	CKrQ==
X-Gm-Message-State: AMCzsaV2M0BtardM9q3J2ksWOmmBa2YBlC7yGb9HHDKxE6dkdY5uu6B3
	/qbez31B53M3W+BEhZSqNlcFqhxHfpsE6+rUXxte5Q==
X-Google-Smtp-Source: AOwi7QBfxDYJiEYJAUKRnTEg6DXGh+uF97NbzZPOS3YnyfEz0/T1JUOopBhNcyEH/e05T0mhlCgx6mXxLAAS6R5LlpA=
X-Received: by 10.28.236.203 with SMTP id h72mr157856wmi.147.1507232460876;
	Thu, 05 Oct 2017 12:41:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Thu, 5 Oct 2017 12:40:40 -0700 (PDT)
In-Reply-To: <b7ff6879-f6fd-4efe-f32c-78171462e3c4@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-19-git-send-email-peter.maydell@linaro.org>
	<b7ff6879-f6fd-4efe-f32c-78171462e3c4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Oct 2017 20:40:40 +0100
Message-ID: <CAFEAcA8WXDCv11au1RxdP+nvNChEcWatZpDAZgwwgN7_MCq=Yg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 18/20] target/arm: Implement
 BLXNS
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
X-TUID: KAsEZW8eIUdx

On 5 October 2017 at 19:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 09/22/2017 11:00 AM, Peter Maydell wrote:
>> +void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
>> +{
> ...
>> +    if (dest & 1) {
>> +        /* target is Secure, so this is just a normal BLX,
>> +         * except that the low bit doesn't indicate Thumb/not.
>> +         */
>> +        env->regs[14] = nextinst;
>> +        env->thumb = 1;
>> +        env->regs[15] = dest & ~1;
>> +        return;
>> +    }
> ...
>> +    switch_v7m_security_state(env, dest & 1);
>> +    env->thumb = 1;
>> +    env->regs[15] = dest & ~1;
>
> dest & 1 is known to be 0.

Yes. I liked the symmetry with the tail end of the v7m_bxns helper,
which is conceptually doing the same thing, and assumed the
compiler would be smart enough not to generate unnecessary code.

>> +static inline void gen_blxns(DisasContext *s, int rm)
>> +{
>> +    TCGv_i32 var = load_reg(s, rm);
>> +
>> +    /* We don't need to sync condexec state, for the same reason as blxns.
>
> s/blxns/bxns/ ?

Yes.

thanks
-- PMM
