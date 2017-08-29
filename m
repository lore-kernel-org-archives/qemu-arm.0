Received: by 10.223.188.70 with SMTP id a6csp6171089wrh;
        Tue, 29 Aug 2017 09:08:29 -0700 (PDT)
X-Received: by 10.237.39.214 with SMTP id m22mr6701163qtg.208.1504022909814;
        Tue, 29 Aug 2017 09:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504022909; cv=none;
        d=google.com; s=arc-20160816;
        b=zF15f1aV45Xw7YFaNUZFb8wIjl3X7vbNIeCXLBWqs0ugezFkfGIMpCiWJkiyvU09/X
         qKif65a7VC7w6Vw4yxX+oByQ0uVRoqSy8jprrjmTbbUT9d9MmiyhGmcYUuB82DACG9Lb
         hLMz27+Mg1VOEuwBhXxaB5FSusinq4AaxXYI/6dC/I0qQndrVfoyKJfl5tHICGqEueIh
         t3s1dgecMIuI9qfWy9qB7cEQTk8A2srBOLHZrADuoMNAZIqUKsXbPYAFS6ezmKoGb7D7
         dY27h4eN/M67MjbWEsK9b1jEzQfqGYQe6gr9RsRKv6s1/l0xjsoT0N56cO1fWwfNPqou
         Ni7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=eD5CUfsaOy3J+0yQ/JMlWwZA49mkbtVU1AlJUFdjjd8=;
        b=0STYaufuwfP3CxYa1oRqidMXpSxyZgYRTBHOH5o9cHrQXeSYu8mqDK5ZCdkXK/XUJ+
         b9D/IM+aKl2OZa8diATRaTBbkQFjRmaujicsaCPaHrHCcMpzpBf3C/zzyKhBu+s5gSdB
         DGqzP8kcijgoFzgQT0d0f9ZYmsz6WtyfVoIAcTOe2TEwoZlU5s0Ceuq9AmOOpKPZVguY
         W2gMcUemDAF/sBH9ss2KW2ysTstwm4nR0Gn0+k/6/E6Ud1GHDgefgP32gdpRO27Dc+sW
         aSwNC9mU/Dli82eDWAFpJkv2wGdT3K8jtE8pLJOpa9AM9BKv1leccTWrfGMza34orSo+
         sQXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RL6MyOu2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t68si3104645qkb.307.2017.08.29.09.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RL6MyOu2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj3z-0001mx-5y
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:08:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj1D-0008QH-NR
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj1A-0002Yu-Hq
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:05:35 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:33495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj1A-0002YV-9s
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:05:32 -0400
Received: by mail-pf0-x229.google.com with SMTP id r62so11506365pfj.0
	for <qemu-devel@nongnu.org>; Tue, 29 Aug 2017 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eD5CUfsaOy3J+0yQ/JMlWwZA49mkbtVU1AlJUFdjjd8=;
	b=RL6MyOu2x7hV6X4uAvctn3tiga+OlnrB/4lyGL+OyKheSR+f1ze+HC8vspa2g5U08b
	S/GAjA2yRF0/3v1BPuosXJQbsCnQeUmriHc1CM2szsE9Ewr18poyAyCiZNKaWo3JvAaJ
	P/uK8ribXSaB6aney1K10E68cwHQV0mq1qf+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eD5CUfsaOy3J+0yQ/JMlWwZA49mkbtVU1AlJUFdjjd8=;
	b=kwTFAaX4elPnX3WERJHK+Lx72pSF40ml9MWJx0G1+LhpVyyrJWJi4QxP7pvAJTmkHg
	JBWW35BIbjkhSjgILD/YoeD7ZGnbnVdFL+jM+MoPXypjg2PzftaTMEzI1iDw3bEo8d4d
	Vd2YVmzrfTUfC8feZi37yKiyZScmLfN0XDx9JL4JeQoX6rePozWMmBCktWlOCukA637q
	XVeOykbGtcO5UEDUV4Oz88vsptlZ7XNqktOKmuc/C0o+qOUrturHgSPbXHkNURSEq84F
	pqArWSzammPdX8COOo9PWevvgr0le+yXaGz95gUI5RzgaWFJV1mIcxPx1KqoizFEXZh4
	pBsw==
X-Gm-Message-State: AHYfb5gVOhdmGOvINoz/PuXdFkUY4hBdyEPXj64N3GSErvgmXYX01Jxg
	aNXO2SiKIF/BObcheR10xw==
X-Received: by 10.98.223.85 with SMTP id u82mr804357pfg.347.1504022731374;
	Tue, 29 Aug 2017 09:05:31 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	t190sm659540pgb.76.2017.08.29.09.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:05:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-15-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7e28796-d080-f7bb-b283-6f78f404a36e@linaro.org>
Date: Tue, 29 Aug 2017 09:05:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-15-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-devel] [PATCH 14/20] target/arm: Make MPU_RNR register
 banked for v8M
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
X-TUID: oIzZ9I8GKD67

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> +        env->pmsav7.rnr[M_REG_NS] = 0;
> +        env->pmsav7.rnr[M_REG_S] = 0;
>          memset(env->pmsav8.mair0, 0, sizeof(env->pmsav8.mair0));
>          memset(env->pmsav8.mair1, 0, sizeof(env->pmsav8.mair1));

Why some memset and some by-element?

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

