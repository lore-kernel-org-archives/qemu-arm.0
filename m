Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp477023lfm;
        Tue, 18 May 2021 07:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoo/sfFBUB87NqXWYEixfS+uBO76SOJXwThAFu38KtjWRPAlCXU/i3xuZ62tw064UyWz5A
X-Received: by 2002:a92:6610:: with SMTP id a16mr4558773ilc.124.1621348944927;
        Tue, 18 May 2021 07:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621348944; cv=none;
        d=google.com; s=arc-20160816;
        b=JVIj7FQuYwSbSBnxDQ+79dzTPqVcOJmZGA2TIG09PfubdUoENhSCcbNN87tRFnL2l8
         AlELCTBUip4BQggfu71LTt7+Nz6+PVzaN0khZX08AAK6djnS0IHCbSGFjdeaRezASfMZ
         P0CnmLZB40hIkMczUuU5UOXpvLtqT0ge/HeXrgDhuLcj1/vxoQUt077YL2Bu82vhCtdY
         zvYeMsloza6RQiV8kKhdH0An/7mLV6BxqDVxQDYsuoPHSAZBPNpJE01WtdDcSv94oAL9
         N4rNDJ6W9DpbpE9iaU26yJE+YJOuzH8c38flHc42Ln7hIkYY8HCyf8c0ydipnmpIYqgl
         iLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Yy9io/j9VnOzvoelhKC7fs7Fm4iFXmnQKIwyGd6Cfas=;
        b=DKU7qFre/q2onAJsxgdXwOez+sKz+VLjuCuppYFq6YvmTpWPGUehPfNmc9oX/CG+ja
         IJgMDwUygOQxSBpDyli/AkbAv+MMWKMFbYCyx2urG1ZadJGAw5uC9Gnyf8Jgejmf4YTq
         y/DXuvY5JV5iN7pu5ApWO/MaO00qlkQCO8QSEdaIXAN76uTe6s0WfN0lJoj9mtYeixiY
         7NH56/qUQ5Z+uqiQrKSZ+sKNZ76/S6QAvFQ3NnGMQf9VOhxL5DYd7UAYeIf3YlLBhis+
         OBpowWo3u8gHN7pJNJiyoOWWntNL/c1EkjLWyN/Edv2eVKu+9ytml3RmjNBZ8zISVTxa
         kslQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=odQk4KDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si6737002ilj.107.2021.05.18.07.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 07:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=odQk4KDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj0vQ-0005bN-6v
	for alex.bennee@linaro.org; Tue, 18 May 2021 10:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0rd-0000Oh-5B
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:38:29 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0rb-0007Za-54
 for qemu-arm@nongnu.org; Tue, 18 May 2021 10:38:28 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id e18so2853592vsk.5
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yy9io/j9VnOzvoelhKC7fs7Fm4iFXmnQKIwyGd6Cfas=;
 b=odQk4KDTQLmCpa30kKLkwsUVSJRzjwbo7jKwbY8XcOO7teOlNfNul3uGNT9gdl+mWq
 /7vSM4RmWrQYY34FikyD8yAZ0Qtszx1YKHwKkoGetEWhlja950JVrM9f9evc8THqq4/P
 JvW4xhkaw38v/QSaR7hvGoo8OW1yrMAQ6jyTYjjbrC1289W5pKQ3hSaHZeQ7dPpNywK/
 W9FOE5+25Q/2wJ7wGmogLOBW4wA+thWI1EhZDNdjWjY1dqrFE84nZcMdbmWEdOtHOXx/
 xGxrzoJr4X0CpfvC1pPBlDepGvo9Zo68vsDRyQp5KrdQLCEFGwGieKinGdcbFcAv9nRP
 sEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yy9io/j9VnOzvoelhKC7fs7Fm4iFXmnQKIwyGd6Cfas=;
 b=qDM5TDan+T+7N7y295mzrPBTZUdTs+laxSIh4OJuDswBUW6X+NkIbkCEjcXdobGIq4
 U3NHDlHiB8KRjzrmwcKc5H4gCQXO/EyuWYhfZFNJYjh3TUY5OT3R6EgCJSB0of1obdtd
 SSuCABs+9FCAbAQE/6xxqP2aa4LGCEFfQKrl1FNLMyPCqpyOFyLAz23fhuEYf1eDoaQK
 9kFifBSurHhvY8YICjHEJjm3a0d1uw7JhvSupan5zsR8+PhiV1okgb3xjP0XHSByBT99
 w+Apk6avSEffYlqxg1bOU7n+KgVkZsz+6mk5vTXL1wo6dziN+lHpIG869GNsqzDvbINZ
 QkHw==
X-Gm-Message-State: AOAM532jVgv25ho0I8sMIu8zS7A3cK7yznvmyz0MyNN5HsNnTorQ0ckT
 dZjmAbPvivc84d4vSyYF1Y4q1ORyUBiyQtBF
X-Received: by 2002:a67:6a02:: with SMTP id f2mr6743501vsc.49.1621348705204;
 Tue, 18 May 2021 07:38:25 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v8sm2784213vkv.51.2021.05.18.07.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:38:24 -0700 (PDT)
Subject: Re: [PATCH v1 07/11] target/arm: Implement bfloat16 dot product
 (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-8-richard.henderson@linaro.org>
 <CAFEAcA-casxqgg-GJEckyTxRp3c2=kguU7YcOhvSYiFrnBvt-Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf64216c-c42f-4057-fd61-aeeb0c227411@linaro.org>
Date: Tue, 18 May 2021 09:38:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-casxqgg-GJEckyTxRp3c2=kguU7YcOhvSYiFrnBvt-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rcSKq6qXLFpn

On 5/18/21 7:24 AM, Peter Maydell wrote:
>> -    case 0x0f: /* SUDOT, USDOT */
>> -        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
>> -                         extract32(insn, 23, 1)
>> -                         ? gen_helper_gvec_usdot_idx_b
>> -                         : gen_helper_gvec_sudot_idx_b);
>> -        return;
>> -
>> +    case 0x0f:
>> +        switch (extract32(insn, 22, 2)) {
> 
> You already have bits [23:22] in 'size' at this point, I think.

Irritatingly not.  For 0xf [23:22] is opcode, and size has been squashed to 
MO_32 in order to get the indexing correct in the middle of this function. 
It's just outside the patch context here.  Later it will be moved inside a 
switch for BFMLAL.

One of the many ways in which decodetree would be better here.


r~
