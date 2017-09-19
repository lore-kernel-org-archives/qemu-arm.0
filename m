Received: by 10.223.172.38 with SMTP id v35csp5263671wrc;
        Tue, 19 Sep 2017 11:47:51 -0700 (PDT)
X-Received: by 10.200.8.67 with SMTP id x3mr3758271qth.327.1505846871537;
        Tue, 19 Sep 2017 11:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505846871; cv=none;
        d=google.com; s=arc-20160816;
        b=qDV3DoJztMbejRR1aEVrIrQY5lK5J+JWWlMbR5VrO53P5rq4RVxsCz+2oJTcuZuOq1
         FWjesT0KFVZcMLFl+oM+k2X1DhDM7hp5wa2j94xiphvERJBP8xg/K7uxnaSeYLCaoxbj
         vYFHqaGLMiUUEv70CvRCprIFEX5CN/7LrW6klV1mpZ0a5YPS4gdfokPtZ63JS3HT3iZ2
         pJ81S9wRn019jYWk2qF+6aK2xKTZ/wkOU1wMP0f7R/nksanxJbRdveEG3Kxpo4AaG8vX
         vjqVKk5SYz5bhvsSqtIIRJfz7nk9ao3Y2qLlRc5Jlxy1fwFGGYpQhPZvUlsImG8i1n0R
         rdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=AJYzsUixITT/dfI9mWRSSIm/2DGfCPviq8N9rWqZWwo=;
        b=xplPsK5+09uUPoX5BnRIhUVXm0D0JzqclTec/dEmhOAqs3pzz1iCSbEgEP8FoltVJ1
         sgqkpLDk4D4ZHs8P6e7POqgXgTqVlK6PzDLiSAjqi1Ct4MNESHcRRXKCCW9fJWT/3yi9
         tHzRhMgdd3r+ohiUQMB9hvpbFANgxdzHSFr5SAxuqZkP8LN4gi9fn/b6llnEz/pxCvJ3
         wmM08i81S+Qbt8ilsbELPp0SdrZXQ4ZDx4DlZDASI6LCN7KowmntOyKaGadtK8N6ihgF
         IYmj8mLaVVqKNkpcUEFTjXPmiOfqM9HIUOEuTy5k+D2Nf7pN4qOuJEJ/ongZ1sBeREAZ
         hNgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Isrq6378;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t81si9991qkt.12.2017.09.19.11.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Isrq6378;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNYj-0006we-5H
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:47:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNYW-0006vo-LQ
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNYR-0004hk-66
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:47:36 -0400
Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236]:43930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNYR-0004hM-1a
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:47:31 -0400
Received: by mail-io0-x236.google.com with SMTP id k101so1371888iod.0
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AJYzsUixITT/dfI9mWRSSIm/2DGfCPviq8N9rWqZWwo=;
	b=Isrq6378jnK+8PnSsJlUsUVtLt9A2QBfFTtOaRfVwLedWVFuot/VnCu4AxJ6JN6fMu
	UvGl47nPPOGxy/CKC9faJqeDQkZ4nEAwiCeRJIBzHigbkRspsjwCGlreceskeIPTJ7sr
	0KfYPN1PnLl8EJEtmyIuzreivmlhFC84VOz6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AJYzsUixITT/dfI9mWRSSIm/2DGfCPviq8N9rWqZWwo=;
	b=A6SARiuH6A/JNWk8K5NXxPpeFGhXV7rnrZplX3Q7s1tRkwCvlE8lEymWVhG/aupdmm
	uQa0TvXCtgDLys60ZcRZbN1E/mi69dW9CRKULA+1m2aw5UespqC/bt2AtgBv6xl87IgB
	YbnVM5irBtJhOIi0RpJ7f390qDXhs8EDIEFd/P4hDQcG7DcqI1oODM2xpRhjJHwaLG0B
	WBSeiAGjSWl/16zXQfs/iMZ+1jbhmQhFcduRR9e8VnSBJj/YweNCXk30eEjjHXwmfpG9
	7ItcJrqS6rvrdbtSo8G/pORCniTLz9BP4MepkTGlmgnlexuf7Qq9c9cmLEgYWXQLs0Oh
	xGnQ==
X-Gm-Message-State: AHPjjUiMcDbNQ0cjTzwcfYvMHw3SXR/IoatDZUKni5Fs17RQJXblUcNz
	+KCgSJ6/PPuC4JayaES/Q33NAg==
X-Google-Smtp-Source: AOwi7QDmdMlrqg/H3weOmSSA+cTc25H/rRVAAw2qm1MfbGG4KBBrQIY4Cs1Y/koMEo74iYgkZWM+/w==
X-Received: by 10.202.79.13 with SMTP id d13mr2498564oib.141.1505846850193;
	Tue, 19 Sep 2017 11:47:30 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id d34sm581156otc.43.2017.09.19.11.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:47:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-11-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2d44105-3130-299a-217f-f142fdc72568@linaro.org>
Date: Tue, 19 Sep 2017 13:47:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/19] nvic: Make SHPR registers
 banked
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
X-TUID: Fe5QIYQXQL/R

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> Make the set_prio() function take a bool indicating
> whether to pend the secure or non-secure version of a banked
> interrupt, and use this to implement the correct banking
> semantics for the SHPR registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++-----
>  hw/intc/trace-events  |  2 +-
>  2 files changed, 88 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

