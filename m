Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4843072wrx;
        Wed, 20 Feb 2019 10:18:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZSqi0hAHs+uCXoIqYhNFAg4MB7/Z2uqe8gqDejAr6MABqzV/PaAEkE6VjHc4ZAfmpO0vm9
X-Received: by 2002:a25:20d:: with SMTP id 13mr28728756ybc.343.1550686692677;
        Wed, 20 Feb 2019 10:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550686692; cv=none;
        d=google.com; s=arc-20160816;
        b=v1Tbrqv5M1s4EpOzmwN074aNDK7Jx9iuCksn3Mksbm+NTdmLyBNrXJnxdJkXTmTE6A
         t7gdoSPmhBFCHAlVvigHgMbnMOIA50q4ZEZvuIZ7sKi09E3uUFC4Zk7ZF1BFOe3kYCEC
         P7R8v5BmgY1C8ClpJ19eicPfFTWq4Eo2ayWBk3ZJsLQYPcwG4MXVz2kdUogtPipXf/g9
         UCQirlii8fp4Cqip0NOuD6MK6sEXTI18XsUJxsGRnpERy0XjfpR+FoMv5gclBAkWbnRk
         NVeWd+DCBmwmYEWlf7VEK9Gds5tMPaeldCtlC2o2RX4YPmcDPsfJFtneuy35raFSspZz
         iRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FdQYpjzaK9gRdJVpulee7mETCjVAGSkhRMJgXCHc5C0=;
        b=hSh3Z1mwvS295q0nual4R/niO2+acFlm1k5AzTX36dZ8MMuW38QbMVTX8Suzuq7uao
         HcVSUFQwqGbCby5haWcKbEqHwxU39Ba+zFnGN8Qq2aOeWLvEfkh3bokOZJx+DftssmVz
         i4Vu6leX8zujm8lkSyvHzSSZ8nm0T97LlWofj3eEjn/UJfycJdy1To1619boMC2Tr+TZ
         vFb1ZHGLriOa6uu/0AC495R7yfj2OTLQ7Q33XB+5tTu1m0Zq+J42MfECm1IGrXyCsahn
         ZvMlLiXiJTLPbSSnutSyaT0zO7rvsc5rw1eMkOoP55fM2lbEuehBsnYN1zFR+RuYa13E
         G9pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I7d3lRMT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j137si13019875ybj.430.2019.02.20.10.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:18:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I7d3lRMT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWRg-00041A-4s
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWPh-0002rW-2L
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:16:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWPf-0003f1-Cq
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:16:08 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWPe-0003cu-EC
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 13:16:07 -0500
Received: by mail-pl1-x633.google.com with SMTP id c4so7588264pls.11
	for <qemu-devel@nongnu.org>; Wed, 20 Feb 2019 10:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FdQYpjzaK9gRdJVpulee7mETCjVAGSkhRMJgXCHc5C0=;
	b=I7d3lRMT2XNbTffnXhVb6//cduvm8JQvNe88/3oOwnUmRRzoByXjBv3WCUFruUBKTv
	TgohbF0Om3ZZz5dV2jUwOX6+44l4k5v6Eruh+iEnckdyawJJoJ4T8FJ7vtwZjzrdzOF9
	H1DlAEqfIdo0lGw8Fk0+Gv2b4KZt5Gk+LzYYU4DJElfInZkfxpTJmOnHe7FLoRnvzFtA
	i7rnGoYkkTU76TtQkS+y2TR9plsEt512nO4D0B7aysJznF+uBMMZGi+DCvksOakRsy4q
	bT2HHtMcthmCpKuOjQFflrM92dcdOMadi19GemOvR/1BdqnnyoI3YJZAR3bq936EZuQr
	dgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FdQYpjzaK9gRdJVpulee7mETCjVAGSkhRMJgXCHc5C0=;
	b=AqdgoAW/cmXrGz1+9WSwAdQ3ayO3+pF60kp5SW59f/iN0Hl4rl5W6gu78Ts6eKb73e
	LsMhXyBqrockm9V5qvtQY2+gP+rwzTX9FZLzolpH7mnmG4ZJwgQOcG00nepoX9460IA0
	36PgWzjvh9ohp9qT7gyP8TN14ffB8Ywi1ZzkrVyGbatwUdT+X3rcbfV2lki2FvrD04WR
	pBg+Nk2D+YnYQTDtTEUc+2svVwUfUiEX6nFYAZofAMowqDT7E+tL3p7CqeL87DCAio0T
	3x/f4O0U0F3XbezQBOxTw77SCIoBB8hP77MsWLyIMqIHO4cRytdhrm7yXGaR5MAVZ21V
	/Xfg==
X-Gm-Message-State: AHQUAuZ6HZY84JMqSTFmvyuoqg/G5lZcb36Nsz/rzfKpN+FeTRWxIhOy
	MQQp3C2kEge37poStBDN8IniwA==
X-Received: by 2002:a17:902:8b8b:: with SMTP id
	ay11mr7584700plb.162.1550686561334; 
	Wed, 20 Feb 2019 10:16:01 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	a24sm14375936pfo.160.2019.02.20.10.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:16:00 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a2bc1e0a-b3d1-1f5a-d82c-7a3e1f06522f@linaro.org>
Date: Wed, 20 Feb 2019 10:15:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::633
Subject: Re: [Qemu-devel] [PATCH 3/8] target/arm/cpu: Allow init-svtor
 property to be set after realize
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
X-TUID: 2GA4ghY0cePc

On 2/19/19 4:58 AM, Peter Maydell wrote:
> +static void arm_set_init_svtor(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    visit_type_uint32(v, name, &cpu->init_svtor, errp);
> +}

Since there's no validation needed, can this use object_property_add_uint32_ptr?

That said, this isn't wrong so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


