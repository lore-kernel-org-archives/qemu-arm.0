Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2255221lff;
        Mon, 14 Jun 2021 12:29:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywlBc9BdRzNLRoA5Vg8/dTYqtuOoKOzYvRZCJN5SA68mrmyfhwtis+URXwrUdhUnZ0xnqE
X-Received: by 2002:a7b:c206:: with SMTP id x6mr766940wmi.26.1623698993775;
        Mon, 14 Jun 2021 12:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623698993; cv=none;
        d=google.com; s=arc-20160816;
        b=UJtGoPRVRe6AI05MQ1RTd+suJyYzfPZYCvxuwGq/QA2Q8MQgdjwrW0kBIWe/s68oQa
         dcRlFdfp6xl4A3zgVh8IXa1lLE7d03sKPnYiKUXyY4jTrTSIPRRawzXoEafeqC54vcVg
         mWAmNIlWWLanPltR3g/j5vzOC106iRee6psvdaUwZwtnuJIt+iZK8YfeeMAhK3EH3ZB7
         iFlCI6Q1yhnNG7kXvy4NfDr2bKh2lle3d1e4Rlhp9E4dfSyJwCg+fajhS7mDuI5duuVL
         nZNO6N35Oi/2xdyKRF483LOeDaClGjsxyS/KzRKgVir4vExEIl3NGYFLm4PsVMV7fXZt
         KmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0AVJJPK+5LgiBD1Zr7rUGG/EI24GQJyzjdlN0hv2jWE=;
        b=IFn68Goqt2EmW4TJXS9J/h7Hoapb98vnGHwqoSSgQcLy9hlNGtxvebVnyzCzMe5B/5
         6SRvmaUtjpCRdvOSNfH4E/arY/Q7WVFaSEpzFiBIQQiiq4HEzMkhVOjDbW7yg3Hb5vtA
         vjVLFkmN9lNKR5OIIFUfksJP3PUH13ecvqO2f6CVKN6w908JienyhX6KngoQv2SPJvc4
         slSg1pGvEBwHGFYZusjKk92b7BPJbaAdgomwRVEja2S5PVO+nQ16/ZVkfMugiTVK6cZN
         pOVqRXQyZjbqknxo2mItOmRw6e0hATmvUUcQvfvlmarGtF4gAk6Q5gcJnh7AyY1EteWX
         khQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cvwQKXk9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si16416302wmj.185.2021.06.14.12.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 12:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cvwQKXk9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssHQ-0001bW-SX
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 15:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssHI-0001ZI-6c
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 15:29:44 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssHG-00034G-B0
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 15:29:43 -0400
Received: by mail-pg1-x52e.google.com with SMTP id i34so9467223pgl.9
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0AVJJPK+5LgiBD1Zr7rUGG/EI24GQJyzjdlN0hv2jWE=;
 b=cvwQKXk95xb7KXdRfdkIqhnp6FFyX5g+uhy0PxkslYe40rt9WD26su5BVRmyVHnFO+
 ma94lRnW6Jqfcb6Zrvmawny6mt2TgF6WYIpMkMWzKhLYVI+zxSBR06hM+b8PkOiiPtAr
 OlHqvyrsiL7fgQ1pZewi1MM7bWnZ+Ngtz4nUU4ijfI2LqaFQHfleOg8hI9Lg/TurkG5F
 oC7byO9SMwqHdwMf+k/0wQq1/6i3rXbV3GiNEWbdkcauPu9oBCRqnmm5wPitcG5D0An2
 ZUFZLf/thpPrdJ/ooMWVxefii6VS00cE8WmgfNJ5wSOl6NtH/kCsSja13DlNyDpKoWzo
 d/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0AVJJPK+5LgiBD1Zr7rUGG/EI24GQJyzjdlN0hv2jWE=;
 b=oGfGz/HzNfHFQlw37S4hAxC406Jatzj7XfXSY+fdbUD11h42WHztCojA6xyl36X+vl
 arr/zLyG8Lv0FJDXeunHE/M2wNCsKT8ZigGLgF0x2GgsRpDvzs7hFiQ5/krlFCx+83VF
 68iuObY0E9ZIAyd/JTcT1IfM3BfHPVNxe2I1/bD5D7fQvEUGx4kuiX4PtrMjhIw271xv
 IIYXWZf7hluPlTINLsG2UEWHDx2b2qYh0jOmLSVOGDWzWn5HOuooYhstedeA/PBzyoqE
 Z5uRyAQ6yWk4y5GoBu84iXJL0Ie9CLgPXHfdKd9SWQerb/lL0V9AWl7R59zXFABN5zr+
 mdnw==
X-Gm-Message-State: AOAM533sE3bgr6uM07e+yuSf27g7g/PQYqF/2EgjStTUSuSB0akUUCls
 0N4gbJFqW2/qXGqTW1wFI2K8eA==
X-Received: by 2002:aa7:905a:0:b029:2f6:d759:6c2d with SMTP id
 n26-20020aa7905a0000b02902f6d7596c2dmr521915pfo.33.1623698978468; 
 Mon, 14 Jun 2021 12:29:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c15sm14298443pgt.68.2021.06.14.12.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:29:38 -0700 (PDT)
Subject: Re: [PATCH v2 11/57] target/arm: Implement MVE VLDR/VSTR
 (non-widening forms)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <079d20d6-336e-2a95-8b3b-abe5d1604aec@linaro.org>
Date: Mon, 14 Jun 2021 12:29:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QNd+rxMcQiwu

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the forms of the MVE VLDR and VSTR insns which perform
> non-widening loads of bytes, halfwords or words from memory into
> vector elements of the same width (encodings T5, T6, T7).
> 
> (At the moment we know for MVE and M-profile in general that
> vfp_access_check() can never return false, but we include the
> conventional return-true-on-failure check for consistency
> with non-M-profile translation code.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
