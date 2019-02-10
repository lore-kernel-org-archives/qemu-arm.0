Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1861408wrq;
        Sun, 10 Feb 2019 14:48:02 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbS0zOTt5niUUTwrcvzh1DKSuZI666J/MraxhC1Gzj97N/YOkp3Y8x+VK0zYQgCGnXG2AD2
X-Received: by 2002:adf:e3cb:: with SMTP id k11mr10091780wrm.263.1549838882211;
        Sun, 10 Feb 2019 14:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549838882; cv=none;
        d=google.com; s=arc-20160816;
        b=AmhHL5+n9AxLOAlMzRDF2tTIZjHX4QoFX7QCMd/74B57TzzcJDX/cJ7KIxiJRsL/g0
         3JtT+BkraN2/bPvRCk/mHiuke3krAyztMOSG6p2Vp3DkLQABgqqxCxuYE4WX4/fzS4rW
         jLQQv3LlKw/hQHByy4SCQBCnjy7b5IWEoE0VjikgUVWkenLxxoRpQJ71tppXT043mCkd
         D+FRowXF/EJrWzGdWT/btvwcSai25PrPE/JyDyEiVfH5xi+RLZB5mPmGVTcFSsCM7SOT
         gMCXGJDsoHn3X4txPdgTmKSU3t9yXZ6+KxEpez9azfCl2S8wXKpxLI5mC+bDav2exldx
         ycKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=SEgH0SBGfCwp3j9USdoPFncRyyQsHuzMk2mveqSO5J8=;
        b=w6BuPDOi6px8KvRLw2KeOgeXNvh9cp+B0B6Px7GxndEtjYIhxYU6/ApyoC8EYDS5mh
         h/kU0jRLAdl3zQT3AtM4rA01tja6V4OyvsANpI8eQR30sTYCqTUagzDiEOkL3wVpvkCy
         vySPEtAonwW/whQSk+cB9Ajctsa2Mk05ZEkdfqLUIwqvFv8J9aTiMYfnZOAESfgluZTj
         Uo6mikI02NxFSutAbdao2xpZgzM1dZSHg9VTCUP9BJ4sKD4AzF/Zn48CVYCmVQF/vKnb
         JVWODpQAgMrlG+rhZziu89iN2W0wFxpXcswQGmMygQabDChiDZnQ63yOR5JSagyVqMHS
         66gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iF+OzbkH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si5998672wrt.318.2019.02.10.14.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 14:48:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iF+OzbkH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsxtJ-0004jK-CK
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 17:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsxtC-0004im-8i
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 17:47:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsxtB-0005sO-G8
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 17:47:54 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gsxtB-0005lX-77
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 17:47:53 -0500
Received: by mail-pg1-x544.google.com with SMTP id g189so4094728pgc.5
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 14:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SEgH0SBGfCwp3j9USdoPFncRyyQsHuzMk2mveqSO5J8=;
	b=iF+OzbkHw+9TX2VebwqvHHqdBM56ZvmWvMxDvWBpbBRNh3nVEIi9LIqtm3psnt/dvy
	+gV+z2vhTX3Hk5GPyp1d+OYgG91JhMeqiXC1WmYt4+kghLi8sXdMGZohcxcByd7Q1PwS
	g2LCiyn/XcrkldpZAoht/tNsgmSWyIjCjZ7uvC9XVNvzzgKR3lrWaVhK2Hhogmnzc63D
	7+eHtCPRjxe8HHLbxYPCpaJik3Aqs5rymCEhnZXDpfAztyflcjMtm2X8p9PU/EQ+sHJU
	I28JAQRK993hEdUVrEVUJ+mVFkl1f0dL337GnCk4H8Ci8GTMtRlwoNPxXtryqyIYwtk1
	HvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SEgH0SBGfCwp3j9USdoPFncRyyQsHuzMk2mveqSO5J8=;
	b=WQUGiD0juFZ2oXXC5/cUE2+XpoHgxSgs90FYgfpID6n6V/XT0lkSRB7P9eOe6po3i2
	bf/Tu6800/PEdJigsytN0hoQ2jgJH6yginzfLQnpkxqbeAjf0PZh7P38GmDUGVHi4NBN
	PfgYOipgqApVek/cTuXIfem8e6uztnM6jTO7IMDMANKXBICcRaRUODKoGfWAV5ZkvCtz
	d7DQMkn1yCZQOmiidVWBK1nd7/c2Tdggf44CdznAmjbpbydCNeCyBzTCgrVoyLWukkoR
	ZfqSDyU/dJ7njy0oVjK66ptGfG2mOT7KUxrPOc/bmUVIMhRCzg+Ht3NmW86lzPEWjlF9
	JA4w==
X-Gm-Message-State: AHQUAuZ0Nny1V1fUSac/hqxWziqFIOLhQfcPm11Z6Eje2OGXrc8aYk4u
	VmFg5eNKkzNHwr6XwIhMwdUJiIbSmZs=
X-Received: by 2002:a62:5d0c:: with SMTP id r12mr35006918pfb.0.1549838861212; 
	Sun, 10 Feb 2019 14:47:41 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	e128sm12480553pfe.67.2019.02.10.14.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Feb 2019 14:47:40 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-4-richard.henderson@linaro.org>
	<CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
	<c37e6649-b2f9-88cf-913d-d0394a635045@linaro.org>
	<CAFEAcA-TwEh74GuvafhqFUXP_xesqC9b1oixubj=ztNa8t4a2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <56abf739-b75a-025f-1c38-dd1cd254617f@linaro.org>
Date: Sun, 10 Feb 2019 14:47:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-TwEh74GuvafhqFUXP_xesqC9b1oixubj=ztNa8t4a2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [PATCH 03/17] target/arm: Add MTE system registers
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
X-TUID: bIvRSQeNPNH+

On 2/10/19 1:40 PM, Peter Maydell wrote:
>> Actually, we already break the TB here by default.
> 
> Do we? I didn't see any code (apart from the handling
> in the DAIFSet/Clear codepaths, which aren't used for TCO).

At the start of the function:

    /* End the TB by default, chaining is ok.  */
    s->base.is_jmp = DISAS_TOO_MANY;

Since the change to TCO is from an immediate, the change to MTE_ACTIVE is also
constant, and so chaining will work.


r~
