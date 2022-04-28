Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1825269lfu;
        Thu, 28 Apr 2022 08:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBi4L0RO0UyWOOOf9WaK/thnYj2bIVaTjMnhb3DCwBwk+zBS+N9fr/ZiOxP2+QHhzFr3yA
X-Received: by 2002:a25:ad0e:0:b0:648:48f7:a03 with SMTP id y14-20020a25ad0e000000b0064848f70a03mr22175287ybi.111.1651160434969;
        Thu, 28 Apr 2022 08:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651160434; cv=none;
        d=google.com; s=arc-20160816;
        b=A7uAP+OQhE340lj+zRGedo4FWJkymxKV9lpwbb0MEv+h6irEPnp6R2gYgp2ceK4w3C
         KpkJC92hXhzYb/3Hf0q76YL+6pJRPAOwtf5bT6AI37L0Shy/gv6X+ESfIqnyFfmotgTD
         82N8yqc1oKfLBs32m97UA4i+yBriG0/SVxQ001hqmp5TOlo5pT93TEWg5pRRGJ2G8i8+
         CdXoHhXncj9r5uaSeDxROK7+vSqaMVsBntK6xPPcH6hQWmO49XXYtbnazSmv8gIiCLLv
         dB4vZwP2zf3m1TW/ePwFPdmTn8F8VDMM1wzEv5VFHB/pWn7plfgoX5jkJA2xUonut4x/
         3nQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=DjQahCnKnurCjL+vkD+QytyQntPpfi+StRg70IwqLTA=;
        b=cMs/igH0sszflM/ZgQg9HR41lG9QOM2GHk8LEs8fEarorR1nBaP/Wx/AKw/LCy8WFN
         MWpxk5s+YXxpuQG0NFzEiCJRKolNhZ6RRgIsqB4/khrAYYkaa9OuGQx7ICwJicUWIbfN
         4118dzBEKuBl3K7sKDgaqm3jS0ZNL0y4dTsldDTxxFyZvznDOEjts952FYIDXdX/jbWj
         jJn7RFUKC80umIfoBDNHM+lztRoC9Xj5GE/6e5FnH0ixH9unBw/jPrzffU/B/d3v7Cix
         Vfjtzoevod2oLXXK7S6X0pAy751yIOg4MI4QXC7yjKRUk9LE/GcRmbQGeQ+PkC+jBOUp
         y58w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v8ghd1ws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a25b3c9000000b006455309c620si3728541ybf.148.2022.04.28.08.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 08:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v8ghd1ws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk6Fu-0005zL-Ca
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 11:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5wI-0007Cd-7U
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 11:20:19 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5wG-0004pq-L3
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 11:20:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id r9so4594775pjo.5
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DjQahCnKnurCjL+vkD+QytyQntPpfi+StRg70IwqLTA=;
 b=v8ghd1wsMNx25cFUwXiUAD9bbMU8YQGOcAtu55OMTw0FLFbLTS8rbaD4T91W2eYlzN
 vn8Ks99q4gPLb40/4fQdeUs7jMUjB2OctOgTpfKFZsERKJi0eAGpM792MNI4jcPNGVCd
 n1q+3zG6L6nAGTwtD5TpH/XNmJ2EdRiR5tdhVUg/4f7vuxhBDFHRA8ctrW3s/uX8+9AR
 TFp1XmeYk2WuFCUsw11uWd3DfOibVnx4p3wJ4iYBFOo4VQ88Fj+9gD3dXFFo6mgKtkdd
 +bzwcLHSPmK4CXIuipq1wiA3QNdJ5MxSabUbsdnESubPPnBvwJsD/PxlsYob+sa5FJrP
 CqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DjQahCnKnurCjL+vkD+QytyQntPpfi+StRg70IwqLTA=;
 b=wnBgbYj5YWl4935Fw5kcoBMDpeqo5Tg2q52gcW27edxibi9XfRF1oYah45N0LpH6Ph
 yObBFWorEXNwUZC0ub0Ev/Ioxye7L8b+iXnHSTKBXlwPZdzfABbWdGy4+0SpdsY3k9hX
 AWet3Aw1D78Mofs05g1RpuU7eyCW14ErEXHNijAcswbxcQpKYlZGGJ9pT7KWv7RaZ4FV
 Pr1lXX7u8xENFH8AM4PfOkvQb917O5/q+y/WCw/7tIGX7DbA7bxy+IK8PJPQdWVy2Pdl
 6WZu3OLVaA6hULeXwrzJuJYt5HZh4NeXIY+6ojKy3B/dxYHZ3qsmLLgY8cNUIZoPC+6Y
 D+8Q==
X-Gm-Message-State: AOAM532ocu8eKvhakTBPtGHlYp8/TTq+YaxNDK6dkiZEmFocV1M+bFGi
 5TfKDj4Lzj4Qdf84oAzQmeItJw==
X-Received: by 2002:a17:90b:f03:b0:1d9:a8e9:9e35 with SMTP id
 br3-20020a17090b0f0300b001d9a8e99e35mr17095884pjb.48.1651159215236; 
 Thu, 28 Apr 2022 08:20:15 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a62a202000000b0050ce7925e1esm200610pff.35.2022.04.28.08.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:20:14 -0700 (PDT)
Message-ID: <3ece010e-b84b-9b0b-df38-4961cf71f568@linaro.org>
Date: Thu, 28 Apr 2022 08:20:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/47] target/arm: Use tcg_constant
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <CAFEAcA_BSgOoXuaTCEv6XNUPNJeThG3X-PJDp3WrT9Fv3R51ZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_BSgOoXuaTCEv6XNUPNJeThG3X-PJDp3WrT9Fv3R51ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qzHaJSfVXT1F

On 4/28/22 05:38, Peter Maydell wrote:
> On Tue, 26 Apr 2022 at 17:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Split the tcg_constant patches out of my larger v3 cleanups
>> patch set, and then split the 5 patches into tiny bites.
> 
> Since there was only one issue with this patchset (in patch 17),
> I'm going to fix that and apply this series to target-arm.next.

Thanks for the careful eye.


r~
