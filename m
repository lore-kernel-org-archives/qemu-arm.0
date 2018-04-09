Received: by 10.28.71.155 with SMTP id m27csp3056373wmi;
        Mon, 9 Apr 2018 15:18:26 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/UmNACEy5EMk/3gyxyn0Ag9QZ6mfpTLV1v20tRMZzVMIkh9MFOG8aXvFyPMNW8Ny4dGe+F
X-Received: by 10.55.58.196 with SMTP id h187mr50470322qka.284.1523312306438;
        Mon, 09 Apr 2018 15:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523312306; cv=none;
        d=google.com; s=arc-20160816;
        b=TaV+q4wLC0Ybgizj5bgEeip83mO9t5dccZFnLKQsVyPlfUhmaRsgJ1DjSJ4a+GuRV+
         3EIo+b3l5dDbZ53DVgpuj7sRlbmBjIGQ4YcXscLrsflRboQhG0Cg3le+5Z43wcnXyYch
         aXnX+oQlGcyvTDMiScCFREgDcKwgaYeK6FquRnFu9bgUxhBBC5ptz6SsBzzRj0t/It1P
         pPAOeusIeGvOd7tttpxhmrWAKb9pRogpt+CsLYqgNTVgcGOT/Qsqcb+22woGIHCnVxQe
         4iBttQhUUK3UUhfvCyb3XyDD9VxHYCNziWQ8RIRQzti43Yl+CivIU3xZ83o7vt8Qatf/
         tr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Yd98RyzXvZK16yHD3BWE6DUjng/L3s0uYBXY/a4Mxz0=;
        b=mCSNCR1RH4YvBTn60NVSB+nN3nYmOQHdG9ehLcUI7iDEZpwQYVYly8SiF4+8oTAp1J
         20ttpi/79rzlgM8c3kvwAj6JoX01CoHt50S174rN+EX3mr7SJdbzFgg5othLCp6hKKf7
         sjpbaaDtPLrihfvlflmRM457pMU8HTcPVMdo8EKuAMvzc3Rg4dVgTtmLS8s2vqwVdsbB
         ymyQ5VcmYa3BV+fzN1h26FYssewKngrxt+h8gpX8ya0s15wPlFeQje0tIZCYPhiOMyBL
         P0y22xqmGlb69gy1jG2YL9vjPIiMvr9AdUuPvueU4ARApVQLw8UDFTTbQOEvwQg8ALS3
         0l5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WB4ygwut;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u187si225660qkd.399.2018.04.09.15.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 15:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WB4ygwut;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5f7J-0001OB-UU
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 18:18:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5f75-0001NT-5e
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:18:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5f74-00067S-9q
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:18:11 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:38859)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5f74-00067A-4k
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:18:10 -0400
Received: by mail-ot0-x241.google.com with SMTP id o9-v6so10508689otj.5
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yd98RyzXvZK16yHD3BWE6DUjng/L3s0uYBXY/a4Mxz0=;
	b=WB4ygwuthSbQ+1PUvgKrm9X/oNuW3yjXjQsPA6mZTWDsfiYWrZ1MSIm/qnzDb492uK
	2dDpZ5Q7b9ikvCrgEh+Q1HSRdyY6KnpNcu26k5c+caXP+MkVw3Y6AM79Qc3v0omdRZa6
	sarYCP8rGuO13Rxcl2TjZ9vF4LTYrJjXfiZ80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yd98RyzXvZK16yHD3BWE6DUjng/L3s0uYBXY/a4Mxz0=;
	b=pAJ/y8om+jQ87oLYGxsKBC5jmd1CC/2AUn7PtJm+Ztk3r2oHmBQ2hmGUbpHWRiRpYw
	ybb5nTx0DNa+k4hY/QrqNf3pdc2JABwd664/1wTsbEyHyveJmsNlaDzrznwMSagoFTen
	NcgxbmnNLG3MOwaWA2sw3m8vIUxGGd4zEMAcDOZYSX9vfxFrimIT6Nlrpo2MDZ4CA/3K
	jrXeBNThLJ/Ro/Qk856WODVqNqIPk5vnD5LMLrrBFd+u7F+W8gYmy2jfXMIGrTbw9eEX
	lv8epo4+IB+qyoHeCmU5HrXM1Zmjb1zSpN8m4N15yqQtyC7fPEhRQExHzWgC5uFr8YIZ
	27rw==
X-Gm-Message-State: AElRT7GfgEzbRFin1iOJuuvYmoNwd4ZxTDxlBHlPEqDF3h0I0WGSAI4p
	3wZPLyhbuI5EnVbWThsK+lsG6FUT1pKCdBqnNZoqpQ==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr25292590otj.294.1523312289576; 
	Mon, 09 Apr 2018 15:18:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 15:17:49 -0700 (PDT)
In-Reply-To: <3147e65b-b6ff-a49e-fc40-21396dcbea0c@twiddle.net>
References: <20180409140714.26841-1-peter.maydell@linaro.org>
	<3147e65b-b6ff-a49e-fc40-21396dcbea0c@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Apr 2018 23:17:49 +0100
Message-ID: <CAFEAcA9UdXdWh1HwF9=Hjazv2Sa0P3zyHAejTQtdw+CTHpChXQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Ensure AArch64
 signal frame isn't too small
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
Cc: Richard Henwood <richard.henwood@arm.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rE77eF9tqrZg

On 9 April 2018 at 23:05, Richard Henderson <rth@twiddle.net> wrote:
> On 04/10/2018 12:07 AM, Peter Maydell wrote:
>> In particular the dash shell
>> would segfault if the frame wasn't as big enough.
>
> Ah, that was the critical difference in my failure to replicate -- the fedora
> sysroot doesn't have dash.  As you say, the patch matches the kernel so,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> That said, what the hell is dash doing that relies on this?

Yeah, I want to look more closely at what's going on here
tomorrow -- this is definitely a bug fix but I'm wondering
if it only masks a different underlying issue.

The spurious SEGV is the result of the call to
lock_user_struct() in target_setup_frame() failing
if we use too small a frame size, resulting in our
calling force_sigsegv().

thanks
-- PMM
