Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4600353wrt;
        Mon, 15 Oct 2018 09:01:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63/iTA5XnW7nDEG6ndVcLXG2bt4/jx/qUdG+4nheYEF6ZLuxE8uhsyOM8G/aRxJLYlduPov
X-Received: by 2002:a0c:e452:: with SMTP id d18mr16528242qvm.85.1539619319579;
        Mon, 15 Oct 2018 09:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539619319; cv=none;
        d=google.com; s=arc-20160816;
        b=eXvyYQIbUiWTqnbY21iZt5lM/nHKI0K0y8liuYcwT23TjAgfCh//le45VZTnl6OaB1
         B5u9VTTcGTwfUXH1hy2F8ASZkvqdZQOFhk5p0FTbExFUAS3SVvsrZhgomtEGZI4u+0xb
         cF1D0dfJ9drEvynHEW9N6JOgfYVTfzK0TNY6zfUBF9kwu3Y8F7V7fGNXWVGrHlHH8r9f
         OBo3WLCRjHxnr+oimnGnaBgwru2XGy2R/FUdhM0NazBdDp+58CjwtT1qSl5dhyEG+Cmo
         HNYuljS03Jg6T7TiY3TyAkcoTiCBAC5NkHi4o4TdnzjTHLW/2sVPubMGxbPVWF9BxgWJ
         A26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ZgP4ZqeEHzMTJEimIAJQghwBzz67QTCTyPZjG3QSUyo=;
        b=BWrT0Nqqzqzi5+PYQvxZ0fhh37xRg5MnMiAvOuMdwoGBFrDCXD1ZTKRhqUFPu+bgiZ
         9f1eOhDw5ImUB/LqF921OsCyay2/gV6GWuz3uyYJSdqcqplSyGD0fgHjDN8GpSUBNBfU
         pZWmPS1u9dcRfzD/JisJVl5XF4ovwIRnyBzhgzHA3PkXoxZT752StmXQU2v6N0Wfwg0T
         JEYQ4Bd/E6Q7WBtl5CsQ+PFpinyD73VjL6CVqs5LUNHxpItDIzFmHC9kr00NXcuBUfA/
         e5gsQ78AWBjrZLgLGcquz79DMZ6QVeuCLGbWqf4XwaY7dVKGCEr/rAt04BZN8EwG3VkG
         ZMQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V9KceHDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s51-v6si6424310qtb.17.2018.10.15.09.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 09:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V9KceHDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC5Jf-0005HY-1m
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 12:01:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC5In-0004ty-Pm
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 12:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC5Ij-0002Nh-0F
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 12:01:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC5Ii-0002N8-N3
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 12:01:00 -0400
Received: by mail-pf1-x444.google.com with SMTP id j23-v6so9902363pfi.4
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZgP4ZqeEHzMTJEimIAJQghwBzz67QTCTyPZjG3QSUyo=;
	b=V9KceHDL7uAS+jgaF/yC+mtfEk4qxGLerabRfRo4xmbfYbhGwQbCDjtio2W41ULP82
	Zo7BXE8ylLs4HRg0qaKzbLxchzObDUWruax0tQdPP34fa7UrR9LBijVpqQfE93/7zp5O
	6kdOzE8xsv+8h1w0obl6EdfIUndFkx/4TZp1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZgP4ZqeEHzMTJEimIAJQghwBzz67QTCTyPZjG3QSUyo=;
	b=OixhXhiDBYHcboFwOpkG3A49ys3VHncUYQVzYlALDZ9QSJzeACenc4mUP0zuDXeM50
	7xkpD/QYfDP8eM2eEZXFKbl/onZvzh7MyiN8QgqW3uzhRvtRx6GIIk3SNcGOvlcBkiMV
	QQALa4SOPpdyQtaZdKpHP1ba6I6+Xg3rjnbKu1At7cRLASITDNC+W5HCGYv7YwypioEe
	hB8l1LHBlUcB1JtZk03kbpuWPrSz5PAGmj8AU4OXVg2wq3Yhr+PnjNK+DuqQhB9JV6SS
	H4KYFkyRTg3QwpMn5tPoeFUt7vdPEeYtKuDkC2ROqkydj/ERWPkFFlmM4xMYiLXkI8FO
	ERxg==
X-Gm-Message-State: ABuFfohfXtJiNlMvsuikbfkkRYRFTBb9FAdb7ICR0oZTIscSyMwfeoCz
	JeE1+qHH4Ipeb9RN81JOyHBZug==
X-Received: by 2002:a63:1c64:: with SMTP id
	c36-v6mr16116961pgm.354.1539619259388; 
	Mon, 15 Oct 2018 09:00:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	e134-v6sm15189374pfh.26.2018.10.15.09.00.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 09:00:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <91b5543d-9692-e7f2-5ff3-e912c61b4d64@linaro.org>
Date: Mon, 15 Oct 2018 09:00:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/10] target/arm: Report
 correct syndrome for FP/SIMD traps to Hyp mode
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
X-TUID: gJXyFu0cIYwD

On 10/12/18 7:42 AM, Peter Maydell wrote:
> For traps of FP/SIMD instructions to AArch32 Hyp mode, the syndrome
> provided in HSR has more information than is reported to AArch64.
> Specifically, there are extra fields TA and coproc which indicate
> whether the trapped instruction was FP or SIMD. Add this extra
> information to the syndromes we construct, and mask it out when
> taking the exception to AArch64.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 14 +++++++++++++-
>  target/arm/helper.c    |  9 +++++++++
>  target/arm/translate.c |  8 ++++----
>  3 files changed, 26 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


