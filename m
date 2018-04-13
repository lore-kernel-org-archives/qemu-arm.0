Received: by 10.28.71.155 with SMTP id m27csp813816wmi;
        Fri, 13 Apr 2018 07:20:49 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+ZlQWJUK+FSLCMZ9s0OyoSZvOulClDzpQWz0QP51VVHGpCct1G/kKU8K83rmf0W3hjBfyp
X-Received: by 10.129.74.7 with SMTP id x7mr4694220ywa.441.1523629249528;
        Fri, 13 Apr 2018 07:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523629249; cv=none;
        d=google.com; s=arc-20160816;
        b=GExS4OfPy2/9LqVSObCnsdArOkr66QblMWDdRpIiNm0HLfh59JclKTkhR72KsQRRmH
         9kF8/Jh2g4kDXlRPdsFut7AYBw/32RAgwY/PmzuxYfyjVPXbYxX2XbZY1C3eMFXzeSoL
         W4Nwqeq+tDl6LHMPceQzkPS6btw+/T+mKySW2Ldvrkxi1uFsrKQTIDa7ClMhcQlbjb9E
         liqY0aDaaNX2WXTFQnZi0R+eqPGa3mgN2yE0Zx/oHF9bR66NjtpzpfHe71LCSOdUlWKL
         R6hHcomfQ68cQThPft4tBf9tGJXoGXQNmCw/MCKBdGiVHMkD3Bdh8bBRgQiiQSeVqJSm
         PC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=92sHH2OekHqZxO4cK5RIKzkRReZrsEvB2xLZEcFHKsk=;
        b=aVhTrJ8ptKfAo/058CBn0TgRrrbsIITItSN2BqXkx7FPGh2+jBYelZWGfMu2/KfVwp
         65WWkyAqmUvVck9csYWT8g8FYD8x0V+wNcgtOSPKLF8nE2m/wNJ/X/blt/OR+1WgI9PJ
         D1EA6j2gQkOJxiPO2+t1zFluGlBE5v/8q1cOuJJ6yjQcUK7aNvJlNcK3IB757lQTq2v9
         Y008pJ6RfY1Qg6bzEQOY7lDBBwPHQQzujcowOYcR1HKkHqmL+/QyNxl874raDAxex31r
         n2bDAbaewRaNZjCNrq+BUSiHnfI8v8+uzkBxg6j46NtB6xfHn6aMu+plrIUu7NnBkWfF
         K59g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fmpAk2fJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s18si2076974qtc.152.2018.04.13.07.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 07:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fmpAk2fJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zZI-0000r3-Th
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 10:20:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6zZ0-0000pY-Ji
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6zYz-0001qz-P6
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:20:30 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6zYz-0001qO-If
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 10:20:29 -0400
Received: by mail-oi0-x244.google.com with SMTP id t16-v6so8516311oih.3
	for <qemu-arm@nongnu.org>; Fri, 13 Apr 2018 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=92sHH2OekHqZxO4cK5RIKzkRReZrsEvB2xLZEcFHKsk=;
	b=fmpAk2fJ7pSAc+4PVkPVSdo9bWo2w7ZEpv4pbIp8B7Rf8gQfK6dfr2rdt9irRWJ6fH
	gUbhCSACegtgWBGsWX9EmjPH9Qbn8tfXkL0G70p/s4iZhgxmB9Huq5rqzEBB171pKO+k
	gCc5O4mWOlmLADEy//bOHXWQp8Ut2yHBl/YG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=92sHH2OekHqZxO4cK5RIKzkRReZrsEvB2xLZEcFHKsk=;
	b=IvPqP/S0YgU5CNn4ZGpnZ6Uxn7/FKXnSYamfuhlakLwx1gVUTSe6PgGN1ewtPVlfCM
	p6ci12PAYE5sbCd9CWkNufh+D1KHDg7NAyVJQwwMx5B+10+qFtLM06K8K87av7MbVsg+
	tcEJlJFY/r07e7NZFdjMHZ9Cw5uQdnlXv6wX1KxFW/xrWtLm0kF3LOJEc2yCATHhMXcN
	3ao/f8UOov579ZTeJ4kcf1psN0GDkbMT/AzmM9K9//UQCONCL+TB66e/WfD5gnfQIcxn
	3KXkZAOn+msfgH1TJB8sGMzGqvQzQwLk93PwSeSNaLMBmoH6zchaEgP8PSz65TaUZJVw
	pivg==
X-Gm-Message-State: ALQs6tA9c5LXvp/qpE6EWDLfiEfoF4/xULb540yoUCJ/fjnUiV8ffmMp
	Vnkz9ZC8XqGCALjYqiVOw5rribUtIL2IWH4BgNu4Cw==
X-Received: by 2002:aca:3f55:: with SMTP id
	m82-v6mr8809699oia.252.1523629228940; 
	Fri, 13 Apr 2018 07:20:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 07:20:08
	-0700 (PDT)
In-Reply-To: <380f519b-03e8-db3c-35db-4fe45aa2424d@vivier.eu>
References: <20180412140222.2096-1-peter.maydell@linaro.org>
	<380f519b-03e8-db3c-35db-4fe45aa2424d@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 15:20:08 +0100
Message-ID: <CAFEAcA8sXkuHj5_1ObVnVdcLfnjj1XENaR7Jd5DzxexqQVNg1A@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Put AArch64
 frame record in the right place
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
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SoArT4mHrZci

On 13 April 2018 at 15:18, Laurent Vivier <laurent@vivier.eu> wrote:
> Le 12/04/2018 =C3=A0 16:02, Peter Maydell a =C3=A9crit :
>> @@ -1850,12 +1856,6 @@ static void target_setup_frame(int usig, struct t=
arget_sigaction *ka,
>>      fr_ofs =3D layout.total_size;
>>      layout.total_size +=3D sizeof(struct target_rt_frame_record);
>>
>> -    /* We must always provide at least the standard 4K reserved space,
>> -     * even if we don't use all of it (this is part of the ABI)
>> -     */
>> -    layout.total_size =3D MAX(layout.total_size,
>> -                            sizeof(struct target_rt_sigframe));
>> -
>>      frame_addr =3D get_sigframe(ka, env, layout.total_size);
>>      trace_user_setup_frame(env, frame_addr);
>>      if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
>>
>
> It's hard to compare this code with the one in kernel, but if I compare
> the offset of "fr" in QEMU and the one of "next_frame" they seem identica=
l.

Mmm. We're not quite the same as the kernel, because we keep 64 bits
of trampoline code in our target_rt_frame_record, which don't exist
on the stack in the kernel. So we'll never be exactly like the
kernel's layout (until/unless we implement a VDSO).

> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks.

-- PMM
