Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1270367wrt;
        Wed, 23 Jan 2019 15:42:19 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5wCAx99Dtmyav/2nlra3dTdF7UTsRarAcC0IrdSTUmyGVsL2OQkvcXF4vWyAdbgHY9hlHz
X-Received: by 2002:a1c:e345:: with SMTP id a66mr158751wmh.12.1548286939214;
        Wed, 23 Jan 2019 15:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548286939; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPUoCBUmM1IYpaF3WpZSF7P90HfSIqqEGINBIpmulS4CynW7skJnZu38ZLRH2QYBXK
         EEqSQKSRq5eXZt9x9gncySDHmIOQdDDGtz/XgyZX7ysmYS915WOzpz5tGWJPYiYkForP
         mS1JomTNG1WheKIaTy3llVVuncCht64IKarKqif1kCjXzA9OX30C27hSdLT3xyn+/wlk
         rs1aA5j3ymvv7Y2BJHCON37xQGxkRzPnT3GwCOU/B9NdC7A1cjLBwjOdiNSXT1BeZ50y
         Yx4/5W29l77Vnlfpl7ApYyV+Rp3U15sxn6STQ1m+97z77qyVPC3MYTCNbC5sHSdPk/DM
         cuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=9GLoBmSfWBlEJx7RM/tfmcswum+XXmgnySpPdyRDaKA=;
        b=oW8zxQVq6oa3fYED6/TvOT67dZwi7nu5v7zGMOr0eUxB2AvmtOEsk71aNhscM4B4ZD
         Rnm6OW9aU1V/Liu5xOLz699Jb7dQBHAlNZwgqOoycIHh3kYulTItBF+ZFlrAqPVxzttS
         8R36w0A2ukB0vNN4tB0Q0rhU9bAXspdf//yH5mA05UiY6z+whxArqff3r5VHhkFPDpk8
         qv5TsZPspUstoAqNL0yvCdWD5Z/iqU6f/kLnA1nnZmIMwG/XUFMy0rYMX8Zso0oyfmFL
         7Siahvyb0vk3gvz/+CQT1wkMLPnlh01/gG9QtFfmm6XM0kIOgbwZI9a0SUbEOlxDUO8R
         iKww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aWx3/lnr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si68757143wrx.34.2019.01.23.15.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 15:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aWx3/lnr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmS9y-0005zu-BK
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 18:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmS9q-0005zd-A9
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmS9p-0008Ac-I6
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:42:10 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gmS9p-00089u-Cu
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:42:09 -0500
Received: by mail-pf1-x444.google.com with SMTP id g62so1970232pfd.12
	for <qemu-arm@nongnu.org>; Wed, 23 Jan 2019 15:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9GLoBmSfWBlEJx7RM/tfmcswum+XXmgnySpPdyRDaKA=;
	b=aWx3/lnrsU7ey1c330EPjmGAAHVeLK+nuIlT1yp4JP6WBkt0S4AlkZZx8oE4pLZJJQ
	VDxx9U0nWF/a1SRUC/vFbv0cMCT1YQg93+Fs2XkI9HJEB2PcEXRwaIRDKwApRu/87WNL
	Kh1JfkN5pEvx54Ct+tjQ5+Aa9u3OUOkV4znm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9GLoBmSfWBlEJx7RM/tfmcswum+XXmgnySpPdyRDaKA=;
	b=r9K1x+CXILzv2PUx/PWzpxWMZw4LOm4T+daluLJSL25d+3l688aPjuAFWHvjv6v4w/
	wbuIUzkkniwi63kM/gGOIgcY3U2yIFHxhUf3WaS28RTfRyphCukeRS4+4kinEhoxPhah
	/tUdhsX6JyOHnGY978mucHHkeE3Gj5uDKBTEE1n/0Q7AFOI2ShFqWNkF6WMeAGLWdW2x
	WASNDXwkqZlCWSlJoegZEWEVzbLVUltQUgNq07BZTkuCDVVXBtI1hB1vEI71PD0w7z+A
	Ru1wpUxqUqLVTUhucDoXozCLrhbAwhZercIOgYYlnCiPT+Cz4DF86QcINLtvzF2ILc3S
	8dkg==
X-Gm-Message-State: AJcUukcdaHrlwpzE3lJmmZZsJGJDRbCDEfHy61OUCXraK7+W5xw9ErKq
	UhOK5+tcWyaCu81ABs0OUbrr0Q==
X-Received: by 2002:a63:ae01:: with SMTP id q1mr3785335pgf.402.1548286928245; 
	Wed, 23 Jan 2019 15:42:08 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	w88sm45493401pfk.11.2019.01.23.15.42.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:42:07 -0800 (PST)
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20190123195814.29253-1-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <36c71f66-f86f-ecb1-576a-151a6a902c2e@linaro.org>
Date: Wed, 23 Jan 2019 15:42:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190123195814.29253-1-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH] target/arm: Don't clear supported PMU events
 when initializing PMCEID1
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4pUp/8Ai6+JB

On 1/23/19 11:59 AM, Aaron Lindsay OS wrote:
> A bug was introduced during a respin of:
> 
> 	commit 57a4a11b2b281bb548b419ca81bfafb214e4c77a
> 	target/arm: Add array for supported PMU events, generate PMCEID[01]_EL0
> 
> This patch introduced two calls to get_pmceid() during CPU
> initialization - one each for PMCEID0 and PMCEID1. In addition to
> building the register values, get_pmceid() clears an internal array
> mapping event numbers to their implementations (supported_event_map)
> before rebuilding it. This is an optimization since much of the logic is
> shared. However, since it was called twice, the contents of
> supported_event_map reflect only the events in PMCEID1 (the second call
> to get_pmceid()).
> 
> Fix this bug by moving the initialization of PMCEID0 and PMCEID1 back
> into a single function call, and name it more appropriately since it is
> doing more than simply generating the contents of the PMCEID[01]
> registers.
> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.c    |  3 +--
>  target/arm/cpu.h    | 11 +++++------
>  target/arm/helper.c | 27 ++++++++++++++++-----------
>  3 files changed, 22 insertions(+), 19 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

