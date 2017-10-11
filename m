Received: by 10.223.197.9 with SMTP id q9csp161384wrf;
        Tue, 10 Oct 2017 19:53:04 -0700 (PDT)
X-Received: by 10.55.159.77 with SMTP id i74mr17522995qke.329.1507690384412;
        Tue, 10 Oct 2017 19:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507690384; cv=none;
        d=google.com; s=arc-20160816;
        b=c9DNe8Y9m6X8DxQcFaeiXDQOkvATd9PlQdhmoF5ms9/lL9e0Ci/2qF+1hrfk8tir0M
         sMZE19yYEjd3AdSLBJhzYWm9bR42hg0X0vyWDtswc8BzKcL2sBtENKutImiE4rPzX03W
         Lq8caH0oSB3wYB9LIiKTniL0eFcC2Df89jz/QdKNl+WWZULy6a9jWj7pKofmGRMNJiDU
         xOHBJwxoxO4xvwaerzAXIobRGkeIFIoWARebPcvdB8nad3eF/Jv82k/i5wycuoFdV8c1
         rbqjgLMOVy88Ws6rjkSJ00wuLZO3IkxXq8/2F4qt5YdGXTv+4/JU0gdAac/OxLSiX9w5
         3/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Hw+OJgHo+noLQc5QXB3gKeOA67tKbwgCQ1M9rriY/5c=;
        b=GlxNVOUm8emLVr+uHahKhNNeJJv49ThF6SOJY4PviC+Bdt2BZc0uZWkL0ydj6RQEGO
         4AcN6Q92p/GKOF8gquX9yaxRHelt6gbA0KwDwVIrjkpr74yVsT3cOJcBH9ifzNlARhQk
         7R/yEnMaNuP8EKty+QMCSpn3dfHJ9tGpKDIOGSyq5waSfxyu//KUGfjuKjAuTPJfZH91
         L6XDOhJ8PIWal9tXEGnhbG+r8oWOaGmLYWIypkhLzG3mdH3KJWPHz6NlQS5BXOzUottR
         hojGeqOokXDlw7r3PpOtGESE75Vcukx6VpPVKeZAz4nguBDxiOzvi9NfH5mrOj4ojdlI
         srUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fLG8JRxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si242311qtf.422.2017.10.10.19.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 19:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fLG8JRxx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e278o-000426-Bs
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 22:53:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e278c-00041b-PE
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e278Y-0005xQ-QP
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:52:50 -0400
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:47137)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e278Y-0005x6-Ik
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:52:46 -0400
Received: by mail-pf0-x22f.google.com with SMTP id z11so395240pfk.4
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 19:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Hw+OJgHo+noLQc5QXB3gKeOA67tKbwgCQ1M9rriY/5c=;
	b=fLG8JRxx6qoq/hxrkj08ATKEIPadWDgO6UM0/DqfxS+JTVyZjnM56apa5APx8XUD+t
	iS26awAHQHsxBj7WVn/8/Ke3gKxDgljAnmRulGDG0HB7UdCwfE2bAXoBM0chUwSW1AiA
	VgI8kVe7aJdLh3eh1ggq4MIQgrYBDTt5v3TkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Hw+OJgHo+noLQc5QXB3gKeOA67tKbwgCQ1M9rriY/5c=;
	b=K4YbgupJ120UWOp7kMcTxvGk88GNMSZWhqaQ5h9+zzRhiu1lpFBGvvCpmJdEF1CG14
	RFiqt4BdaKgcgv8r8xqUflHTKLDEZDeaJimUnL4sd1MHuTExyHYDeLqYHEgruIaOZD0o
	ycJyYY+cIfz2rKebpW+m1Z9hVyHsKou3FIVMmz2/ko52t4H93d6TJ1pGMSu8+aL88LQ8
	SKpvQqAWxvDuSaEhmjmFHsfIXLP9n1+p44y/8GPtYI7VVzf8UcP/S/PeyrqlpHeOjAZi
	Vuy4I58AZzUhYx55XqOUn6MCOWOGqXj+9T1nNMmZj0fHGusyXUREjgSeTB9UUo2qkGWL
	Pkbg==
X-Gm-Message-State: AMCzsaUUajEl1OaEyWt53S01P2lIrdrQgKwGw9x6elZKjrEv3GPDSLgc
	/yQGmbLWVSxmWjLAYQu3dTLoSg==
X-Google-Smtp-Source: AOwi7QC03jFTVWmLHLRbpz7BzKGbbIovhSnWircEvlRaPpl52E1Q/qV7b/sJAQnxAkcohIhGPNQsHA==
X-Received: by 10.159.194.133 with SMTP id y5mr13833137pln.85.1507690365345;
	Tue, 10 Oct 2017 19:52:45 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	z65sm17021568pgb.50.2017.10.10.19.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 19:52:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-9-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3bab968b-3476-55c2-ba7d-ffd2b902e532@linaro.org>
Date: Tue, 10 Oct 2017 19:52:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] target/arm: Support some
 Thumb insns being always unconditional
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yeUurIiOtpei

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> -    if (dc->condexec_mask) {
> +    if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
>          uint32_t cond = dc->condexec_cond;
>  
>          if (cond != 0x0e) {     /* Skip conditional when condition is AL. */

Don't you still need to advance the condexec_mask?

For HLT it doesn't matter, clearly.
I'm not sure what happens to an IT block for debug breakpoints.

But SG behaves as NOP when in non-secure memory.
That would seem to require that

	itft	eq
	add	r1, r0, r0
	sg
	add	r2, r0, r0
	add	r3, r0, r0

should modify both r1 and r2 for T and r3 should be unconditional.  If you
don't advance condexec_mask, it would seem that r2 gets F and r3 gets T.


r~
