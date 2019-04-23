Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3796219wrx;
        Tue, 23 Apr 2019 11:38:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4dcKVdARRtWR65gwGhiXcf/JO4iwQjpHHas7sP6SbWQHmMX0g2LFLLIlv+9GJmMA2DsPC
X-Received: by 2002:a1c:185:: with SMTP id 127mr3265351wmb.145.1556044703918;
        Tue, 23 Apr 2019 11:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556044703; cv=none;
        d=google.com; s=arc-20160816;
        b=T6gSZ8WYNeo56GlQd9KYT9YI11X/dxvzvmM9kXcj3rBsEpywHGhREX+siusW4F6X4C
         rLg/K5wQMOg6vtS/Kt+ujavTvYnTF8tDjeFw5wMmoQL7L+l2NSlDsOBSpBxsPxK62P4+
         6A0VitAbG4b6dJonFPuaG744vB/394kHMB7//DXLFgYPlpNLuydGVvmgjcAUV81r81Te
         Uv6ZUajXWelLfZCl+bWUVGjecQ4K9SE+8e5KSpgBtB5ZPAG3ExdALcH4oySVX8CSJmLa
         nRI35XsaY5meysUrpibO9zTzKwqVr0j0DFP3GY6yrU6zE1g4N+x0mCUM7SPiR8uwKDp9
         R2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=tEsIe7HDtrY1NvdfIxb87cYDh78a1WRGzfUfpaZLye0=;
        b=Bis07orYiDR3uStY9lFjNd90KvpZ9uRb0Hfl4GVzPzTQq+ve3jtksuc+fWdnMnBjeE
         gtKtJNCy8H4T63bafZONy64pZFgDlh5ld1POupZA2wV/DpRbYzyPw9Lsp0uITd3a6bvl
         Vhx8DJpLz1duNTlQOiDIaO4dr0QZIofjtquVgFFzM6DvyYnyrR5o7THl8b7GiNCq9S9S
         5Rv8q2DKPXdCwirkNSXWgoAaInguRk1G6indt8HLMiFTI8HdOAN6VJT0RUBEfc+xpEg+
         hH6ACAJ5SkHzfiWnMincXf5qKpKxzgUNFj9jNSO2aEX2y2TfC26bmdhzjfadpNOu3ABC
         BLHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q+JZJz3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si12254935wrf.218.2019.04.23.11.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 11:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q+JZJz3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ0JC-0007u2-T3
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 14:38:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ0Iy-0007su-Uf
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ0Iv-0000S9-6s
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:38:06 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ0Is-00007u-Nq
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:38:04 -0400
Received: by mail-pg1-x542.google.com with SMTP id 85so8047869pgc.3
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 11:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tEsIe7HDtrY1NvdfIxb87cYDh78a1WRGzfUfpaZLye0=;
	b=Q+JZJz3SN9V/++sd4Ob5NtvFtqF9Lfm0ALTY0XKZfaUQaAx/6wSlh8hHCssPQAX1BV
	kbmSz3n09JFpNlPicpsO6mUfJnMIjkbyf0ob4ZP8nJ6VBmS+8RCZq/6ZmF0Bq7egZdGF
	uLbWFTvxwhN2iBuzqIzYwRT028JGJfWFPKehxWov7RtOpUTtcv6f8t8TA605ZKAC5n61
	5PF+XzJtPu/PawA9WV04xvzYt/IjZyQfLpTxtLCF8V1e+Tzzv0vl3ZZid1Mw3wcHM4my
	QSS5UaCHhBCDkBDX1sxosTpeaL+ovdyfOyJTzw0KnfBzVOpXkSAiN1BBafcTdcNNk0Q5
	1QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tEsIe7HDtrY1NvdfIxb87cYDh78a1WRGzfUfpaZLye0=;
	b=QoLffZa1BZ72pYEDCS39Rg8KaoWPPCdK/bqj9twigwe70ylVU+6T9bUOWj4oYwk+dq
	b8rwtKx35X+sFjliZb3k3kbF3BbdXMlIitnh6FjHdqxt8xvrl5LI/8U0xyV01tiY0wIt
	7/HED3Mmin24r+KRP2IL3v2A4celp/eXN/R814a97mYhqRclKr+k+WeNCdxVmS4ROqVx
	xSjAk16zsfqOe8brSJcHT8sf3yNtMDOoPil0m2ddWzjS4Nf0vYTMsTDg7xteD7YSEHRb
	EaUotCiYR+wJCDhGWN96J5zOCT0TxwWywcKqEZ/7Hqd1VPeV4HE+gu2wSz+X92VyOvTJ
	nRvA==
X-Gm-Message-State: APjAAAWiPi2qPuwFpH0Qa7sYnMQJstM9wsgUQIadwDzR0xuJn1pkCARn
	N2kjAUBETIXTPKe35+evcekzcw==
X-Received: by 2002:a65:6294:: with SMTP id f20mr25829055pgv.415.1556044649792;
	Tue, 23 Apr 2019 11:37:29 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	h187sm29343296pfc.52.2019.04.23.11.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 11:37:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <db9ceec5-3297-bbcd-be28-b4bdbd0f6b5d@linaro.org>
Date: Tue, 23 Apr 2019 11:37:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/26] target/arm: Decode FP
 instructions for M profile
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
X-TUID: dQlhDMOKsSUb

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Correct the decode of the M-profile "coprocessor and
> floating-point instructions" space:
>  * op0 == 0b11 is always unallocated
>  * if the CPU has an FPU then all insns with op1 == 0b101
>    are floating point and go to disas_vfp_insn()
> 
> For the moment we leave VLLDM and VLSTM as NOPs; in
> a later commit we will fill in the proper implementation
> for the case where an FPU is present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

