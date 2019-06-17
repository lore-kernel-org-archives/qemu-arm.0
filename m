Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2886089wrg;
        Mon, 17 Jun 2019 12:39:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+43n8T3us3pbs3MWf1JM7QI9B1yH8ej9Crk4kgzIQuR5cCY+EIuargJ+gIWdYoZPh1jyA
X-Received: by 2002:a17:906:a4cf:: with SMTP id cc15mr44892228ejb.12.1560800399013;
        Mon, 17 Jun 2019 12:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560800399; cv=none;
        d=google.com; s=arc-20160816;
        b=U7GI4mL4EdAouXUuaN7GtkgejMPiaOxCTzHFkyo8dN1gm6nyM1HyFEZPuD/NY/CXZD
         QDZ4555kXZwWgIXwaFA5+IleFOBRe0q+pTCWhdAEFY+G1xSJVn4k3+Yozgye8eGz+8hF
         U9vma9YHErDYtx9oxkRnv2TV/jCqhzaUKWIm3reCSO3AZUX/Z1fl864uWUypmkqL2Gu/
         uAvXrLAWQIekgFMVb0jWbmsXEm+9Q+ZwJ2B+le74ZUbQY3jsAVC3tyxJXAXkzr9NNIZs
         JVA05J9t2G/en1mzRzkt1ZWa4S6hduUjoMAMYFwXBMsLymR0W3S0mDza7kiWpMvuDJeR
         3egQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=M4FL6kafN/86dFFJvgvoteto8jq15yU12gnoNcxruBU=;
        b=tdPUbqbJcgPaTH4rwctHtElfhN0o5v1KChL0yL4bhROan2AULPaOTUuPf93ZMopA9f
         TfTrZfH9lJm1Nf5r+znC/1ZKmcJZ6sAL6R5SI0Vv3BngBjGt2c0TErF4fIEagsCqI4HQ
         HfWxab+a22KHPz3u44Q3H/sGDKsCfLViGdqnzHoSYCDWV2qkzgjLSHC10AZUfP67pIgQ
         uTiARUNYBn/ggfbEt8UPlN52WY1aDcsGj4Z69TbcEdanEO/cSPg5y49MINnF3AqLJw83
         jxiVLYtZsz0NHZnapsUGY8SStulzEX0fZBQ1loJtNcURVUoQloXvtYcbvjzaryY8jxns
         8SOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eDRI/JmH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1994998ejf.196.2019.06.17.12.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 12:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eDRI/JmH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcxTy-0003wr-3w
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 15:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53903)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxTr-0003wK-AM
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:39:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxTq-0004tt-AD
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:39:51 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38241)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcxTq-0004rf-1g
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:39:50 -0400
Received: by mail-pf1-x441.google.com with SMTP id a186so6220805pfa.5
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M4FL6kafN/86dFFJvgvoteto8jq15yU12gnoNcxruBU=;
 b=eDRI/JmH39DEkDY3BmeUANLpR18GRVKoa+AScxu7RNgsDzpBvleZHnUJwBXqucwLMp
 NV336fh68dtJG+mlt+jf6C9wu5xYuFaNm0VQesqVEOhVlCv0m1ZFGxRiNQE1Qz085e3D
 v6pRuMGKUIQ5q2XYtXuiKwyJZ3A2QLA0QV9FhOYYWhv0Q7DDjgRtOb4tTBUHjAD+/vU9
 ZJdqB4Kr3mZmIDy5wh77ouSpCzaenxCfNB1z6ILo5HjdG1snm/ie4F3Ecn8I3OK9HxSo
 milw77jbepGQ0YQ5IJA5pXrt//ls7tTgbz7ixZwyKI+oJtvqDhrIYojslATdx8JdcVJX
 0Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M4FL6kafN/86dFFJvgvoteto8jq15yU12gnoNcxruBU=;
 b=rKyrGhjLTJ08l1SUIZ3wNuacm9+Rcb3EXNT857kA0wGvHHALxxU4ifYpLFIxUy19g0
 77+9XoBMWJAspNYrWa9HkgHR5FzDcGncPPTrryrDolIre+jssTfClFcwoI91UKnL7irO
 9aOwcl8MTKsotiPfgi7mGOemFOzxk2C+1i+4yf+70Z5rCrsV/zBg8qPf7v5kfg75odsv
 ZqxKAGnFXOUm+YJdndwuUQTd68x78JlTt3+wQQVy9h0UW3iGR0ymYjlLPbiOwh17qc8+
 gBwfMeQzQss0sXGTLid0lfxBzA0Np2qDxnTmsrNVmyYK0TRdVvKfBi14dZVkqudYmESZ
 McHg==
X-Gm-Message-State: APjAAAUYBq9yJezjQnMMueOZ51L6KzQ/6N1SldWcLM3UZomulZ0zWVRd
 Wssn6ysxTQMlfKlhJOCqo6UIrw==
X-Received: by 2002:a17:90a:9f0b:: with SMTP id
 n11mr590677pjp.98.1560800388793; 
 Mon, 17 Jun 2019 12:39:48 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id y133sm14085891pfb.28.2019.06.17.12.39.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:39:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8d83d410-5db7-69d8-ac55-f6a9773b3cc1@linaro.org>
Date: Mon, 17 Jun 2019 12:39:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/6] arm v8M: Forcibly clear
 negative-priority exceptions on deactivate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cqjnKaeawo/1

On 6/17/19 10:53 AM, Peter Maydell wrote:
> To prevent execution priority remaining negative if the guest
> returns from an NMI or HardFault with a corrupted IPSR, the
> v8M interrupt deactivation process forces the HardFault and NMI
> to inactive based on the current raw execution priority,
> even if the interrupt the guest is trying to deactivate
> is something else. In the pseudocode this is done in the
> Deactivate() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 40 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
