Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8097834wrt;
        Tue, 4 Dec 2018 05:59:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XKaB6JLMjsQDj0SDSyb4r/DEEemFaBOKyjrwp8a4DNR9oOFdzV+re6Q7seUKV3WSJ8VldP
X-Received: by 2002:a37:6155:: with SMTP id v82mr18231750qkb.72.1543931959949;
        Tue, 04 Dec 2018 05:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931959; cv=none;
        d=google.com; s=arc-20160816;
        b=1AsLMaJPAmhPPoXIgWBe1E8qC1tJ42Ed7R+zUobqNZUvopnBP/RdQGUIT1eQHkboFc
         XsrghMyxhFpHnW+IhpxoS6UsHb7wwvPrk6xStiUZXa+HBFcaIvJGrpAg8V+tl8jDqk1s
         TGOoOWLc9S9h9JX9wkbfg5sv3d68+F1LqNKK+9adTQBVfrYyBETgnKaqsUmEaFmyXNND
         TCBgftSKxqKfqrAzpHvrw3t7AAVHhjFo+AAmR51ZXPn9+CQGF5zZen3TKI334bZZgN1N
         4HqL2L3Ee5bz/sGtDitV9g6wpXXLGXdOpG91Fslf/k2J/8ynuIrthOmSuxflglqCAsGG
         zX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=HJByq+h9xy+nxPYn8KhpTU8MXVaUgv4zL2JFs18qDMM=;
        b=LKOHFhFX9xon97bHCzewQx04sRMtCKwCLsNfMgbkWXE+UrnL0gHoxff/I1W2mVbXnR
         pRh+M4WQjSM0KTFFdWRCC/NEdNNupnzMfpSl+1RFAXZ/yb0j82Ziz5zQySbslLqEDf4t
         4yPsz0xl9M9o51gJM+QxwM/yXeXP43m1PMHIaKtf50Q6A8nYcRHJOOPMEC+dbc/zdstV
         6NcVr7b4vQvGxANQfnyHZQ1EBj29QLCEsTQ3ecJHA+O3P9Z1SSnLgxOpQS3YJ0nA4ply
         al1X0ZypCWoge35m94S5gb3Z5YVQNBkVHOvh8Tw4A5jTCksMcTMMBSjBl0MldI6ZxhFF
         JqOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HL7QOKni;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si1999728qke.171.2018.12.04.05.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HL7QOKni;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBEN-0008Cs-G2
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:59:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBCw-00069d-UM
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 08:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBCt-0000Hd-Mw
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 08:57:50 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gUBCt-0000Gz-EO
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 08:57:47 -0500
Received: by mail-ot1-x342.google.com with SMTP id a11so15179963otr.10
	for <qemu-devel@nongnu.org>; Tue, 04 Dec 2018 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HJByq+h9xy+nxPYn8KhpTU8MXVaUgv4zL2JFs18qDMM=;
	b=HL7QOKniSZW5GQWHkeU3T0viVXWngsQOb4IZj3eq4HWNhNXK0mHJulXcdOAI1JDmb9
	VtkO42exZEyeGbxiCrIHhYqfSsz2Z0VN8IScM8R8VKwVKlxUWqxMtyXsXAPRuCFiFp+/
	a22uhhwo/Gv9OsBjNJLPYgUR9MkHiZo0E61wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HJByq+h9xy+nxPYn8KhpTU8MXVaUgv4zL2JFs18qDMM=;
	b=a5+LjUTwpbVVBPiqAEvBggZDqSwvPheZQ4RXUtzViJ1aI9JvpRtdSOsbq9Mf1ohij7
	VVQ2q76qrMDKBFkaTTkdXA3xrej16qe46hBIErO/2hPznjKJIu2T6toqnHEVaeO3AFpu
	w00lwmXXVypzhpApj9SGe3Q2pqb3OuJBQXVgBHqlCto+iWrFESL8ORoad8i1WeMTYJsJ
	amz+eCns72vydR/hY875WA7apZq/UcU0Pj7OT2R3vB4ozAaBSKOp+374PDxuZQ5atg2Z
	gTDXGmlOWKHGI3ltk0xyJNzOlIEaDMf9frwZMLGI2RL5fewjVSSZ5MWXslxN80U0n3fS
	slGA==
X-Gm-Message-State: AA+aEWbTU8Wkt7qWxxL1AXe1rHHB3ZVA+zwYLlF/GWSEGgL1l6wfxEvS
	2AxVWtCG/I3QZJJnlnrCpVw3VQ==
X-Received: by 2002:a05:6830:2010:: with SMTP id
	e16mr12074316otp.86.1543931866198; 
	Tue, 04 Dec 2018 05:57:46 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172]) by smtp.gmail.com with ESMTPSA id
	r203sm6442547oih.11.2018.12.04.05.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 05:57:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <db25e95d-1c35-94b8-eb1b-939c44a4135e@linaro.org>
Date: Tue, 4 Dec 2018 07:57:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 2/5] hw/arm/mps2-tz.c: Free mscname string
 in make_dma()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: djEy9lOl+Qcy

On 12/4/18 7:29 AM, Peter Maydell wrote:
> The clang leak sanitizer spots a (one-off, trivial) memory
> leak in make_dma() due to a missing free.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
