Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6567938lfg;
        Thu, 4 Mar 2021 12:46:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcAUWkM3DMAOdE7Q9/++TwI4QNb8iClB179upqWUERX9FVKBkXVZ9mJ/lgCZBKIogbjwAM
X-Received: by 2002:a6b:ed08:: with SMTP id n8mr4983306iog.197.1614890780933;
        Thu, 04 Mar 2021 12:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614890780; cv=none;
        d=google.com; s=arc-20160816;
        b=dCCIlLBAHtkK0jp/TuE1w1N85oNhzKhas54XBfj62NQve1/Ix80qofuQQhqLq/rbQQ
         8J1Y7U9Ad2j6OF6PFmsaZZIyynlsjsT/UPshl/GEvmBlvAKw4uEbmlfzep7R0uZ1DbGj
         8m3anElzbVM0v25TZd+hqV887naGgVYbRHt5Y5XN9hpeACjgZBFHyCguIZZrWb+wo0lv
         rA3s09xcM4MZk9zZQbZGf3xwiUlDR43rmal2Oq0Cv0gBLi3FKVfXoMGZXW7Dhht2dP2z
         mXsD8PjL66fzKFKVIYEEYTLKbVpCO0tcTUNQUnP16GTtdtwOMT7qtpnws7J+kfN6itS1
         G5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h67J1Queem3z2IKRbl7TJ6sYy6C8LgvyRuz8IUb7f8w=;
        b=BOAWoPv5wA7BPCkzxYdFpnbtuEHRehKrjlDn+uWlVaCM2ZijHhS+5WqD2HT43RxdIr
         ObKuVpgUG4g9qqERB3tNpFwj8a1iWO7mMJxKXgnPbJXD05uzXZ2va8ucmk7hg6jwB3UE
         RMCNMt6qzdR6v228nqkoWbpOHOqU5jXWExlLPD/WpBqSt7TVCQetPtD0eSw5ruxxcOls
         GDxOSYzsYSGJOHM8M2qZr2hYSBDf4vLIzBchantEhJtzK5tPypL8RgNr7QFPJA+IpClQ
         BIA4iNEzhJVLonFukJ7c4Dnb8Bep5mV+o+V5XSQEm5F16asp9H9rCcxzYWyxFcs5FW2z
         alNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K7bMFzyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si295386iow.43.2021.03.04.12.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:46:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K7bMFzyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHurU-0004I5-5K
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuis-00037R-UW
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:37:26 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuir-0005w4-7S
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:37:26 -0500
Received: by mail-pf1-x433.google.com with SMTP id 192so12791942pfv.0
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=h67J1Queem3z2IKRbl7TJ6sYy6C8LgvyRuz8IUb7f8w=;
 b=K7bMFzyL/JxX7+oDp/Mt2uenxl/VeKUXhwt99PQFVDKfdHIe4fjImW1ec6GH8uYDr8
 e5cFHMkO05Pbs8+z9irWFIXmqsMoh+fi7ueNXaJ7rReqJELl30GBlfNjEiMrWRMiYZDD
 Fb4nfmRtRdbw/eQm512ZjQc/lJGbUzH+g/74d1iNOndaE8SXH5HMhRxoSDrTtcgqt6i9
 llBUL/VXeZ0oRQ4Yny7DFCXlt8DAw5ET9aWkVWv9UcYpFVKiL+QypqZCdK90oePaRA26
 eyiNN0PP+b2zlEILilpnN1WMnWIySwz6SM00n1ecUYI3IiTdsgZfRqwXeKQKuoshNmE2
 p9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h67J1Queem3z2IKRbl7TJ6sYy6C8LgvyRuz8IUb7f8w=;
 b=qS9Cz++gdEQapw23BDOi1LwiGGNo2NXrGT48N9t69Crs5qDx+9ZRURJ2ZC1KVyCjTd
 w6+1VYC/hn18KJysbv57UuI5V7TZNcBZ2W5UBKHVsdplASYTibzjlEfT11bmLEMsmLDL
 VmN1CLb26U4sReK5OMVIakFkxxW8HkQhVaN1hUrodrs3pFNoUoraQK8eTU5pe5ELyiDc
 lzAnXMlVu4ERBKo3+5esKJMQWTLdBwyPyCW6wY3HkHwYXj20CWQ6ANPcIa3tQFhu9CC4
 Mjjf50wuGtapY8DrYeKd3MpbTvd2xkjvwO6NIKu1qgsAmbPK227MMVXwinGRNpRtOvvH
 orCw==
X-Gm-Message-State: AOAM531bPclc7djxmQjh2p8jXTuMnk2ZwlZYz0vnhxtWv6vbhnvZBZIs
 auM4di5C5uZ96LBDkfketZL/9yovII67JQ==
X-Received: by 2002:a65:46c9:: with SMTP id n9mr5030515pgr.116.1614890243622; 
 Thu, 04 Mar 2021 12:37:23 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t17sm150164pjo.0.2021.03.04.12.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:37:23 -0800 (PST)
Subject: Re: [PATCH 34/44] hw/arm/armsse: Support variants with
 ARMSSE_CPU_PWRCTRL block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96aaeb0b-5360-623f-d5c0-1d8ea26a647a@linaro.org>
Date: Thu, 4 Mar 2021 12:37:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7hqKOPnls6+q

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Support SSE variants like the SSE-300 with an ARMSSE_CPU_PWRCTRL register
> block. Because this block is per-CPU and does not clash with any of the
> SSE-200 devices, we handle it with a has_cpu_pwrctrl flag like the
> existing has_cachectrl, has_cpusectrl and has_cpuid, rather than
> trying to add per-CPU-device support to the devinfo array handling code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
