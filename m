Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1245570lfm;
        Wed, 17 Jun 2020 21:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjM4wHCZWOUQmZwkQU8AYadlPdaGJCgZA6QFMlWY1tTMI0UilkefqyiGT6ejro6v8uNfDt
X-Received: by 2002:a25:384f:: with SMTP id f76mr3300176yba.170.1592453160451;
        Wed, 17 Jun 2020 21:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592453160; cv=none;
        d=google.com; s=arc-20160816;
        b=yEWH5qv3/3EvihSBTcsHL0mikDIU6ldk1KbijNTdXvurYuefVWM1+zMOOPNNcrdb/T
         mFCXAx7Vj6gIySbM4jL5rO/dfO5JDs6avZ+BtF9/DWGMhs7t1MnXJwrmTHAEy46+KXGR
         XsQHf3pGe4kIibf6oqs2Z9E5xuqs6tnRFOC3qYgyA0ywCD+xMjaMq4T29unhZkWpTBU9
         uWv60+AZN/Iggz2n6Y53NI/wt/QQZLMwNflYfxoTabCFf9O2UKsI9leRFdtBD4TlOcQd
         VNCMG3kUY8Ok6EYvrL7wRDh5kOoxxdzlTqPT5+klO5TuLGKjo+8o9oKnPlDNeSUGAWH0
         QIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HaZkqTflqaHG2kuLncCEt0A6vuNetouWADqfgCeHnw4=;
        b=zOF8uBfcAFZmtPdaL2ro86cpNa5YZF+LPk90Q8yUk5Vg1FODqWft51CzzSBuWYjxHQ
         UB445Jpx1BmsxaBhJpdb6ZF85P1BlmQK6r0yFhisRUBfl0/qSpFW/Iw9B+bjEUJil+e6
         4+11EVY4pKQHAkpqKEEqZ1HvZkBwsB9GAw7irquB8avOSiYljyhs5Z9eR3IyQFA4OrQq
         1o4KQM9MoJi2w0HFfGPevW8bhZ2rs6/XdM+8t5lHvSGITun8xS1i6mn9BiAD4jvlB0nb
         VSrzpwtdnalQk9lwijqXmzVzAQNzjvelL3ACNuwNl7641DriZLjBeuyAbu4KFldwY9TD
         Rr9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWLr9tET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si1438300ybc.479.2020.06.17.21.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWLr9tET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlloN-0003gh-Ry
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlloG-0003fy-4k
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:05:52 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlloE-0007d7-00
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:05:51 -0400
Received: by mail-pl1-x642.google.com with SMTP id bh7so1877488plb.11
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HaZkqTflqaHG2kuLncCEt0A6vuNetouWADqfgCeHnw4=;
 b=gWLr9tETcaIWEx2v+3DfxIYp3dKz+yVW5H/hLkjSpWA1lT2gWsjXHWpqzIi9MUbYtW
 BV8pgbNCEvNYIQVPXD6IERT3myMxEx0cngrIGU3AtEBUaUrEuUEvtTjD0aE6pn0yoiWE
 WpGI1TM/iatFeASyiFRh5tGd9f/ZLDaC5Q7uRkTQSkwBGuCgfq5JgTP2+VlOkKAZIU3r
 9W6YVqfJOIrJ7FD9bx7ibvDXpp6w4M3yy08dwd7ndnvrJKDMAz8BPTUHm2tdlCl2bTeh
 GKkU9sgKZkTjaB57q2w0fUYNe6NVj9QYYSYe8z/FhcjzS6bb48onpsqos1AXltwuxlS6
 YGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HaZkqTflqaHG2kuLncCEt0A6vuNetouWADqfgCeHnw4=;
 b=azhZF5OQ05tkcxaXpreWgVCk3m+PMNBiyPAgfjW6RG/5UJCez5NIBKcIOpfm3CImvA
 0EhKAJ93DA1/wb2t1eXS6obPpTqaM8fcbmXKXyVDw0SZWuZMJNgVl+w3bpSeJrv2E2o1
 /yz2EVSQ5NOSpW7nr81cwKCPzVH5QaE+E0LFcYC6KtuyY/mTjSCH9s4ap+HUFVn1Sgdg
 VEc/w/FmPY+81hfm52bWAZZpn+IRQO/+tMUwdr+CKtNLGo+gE/80XVw0ElZU3OqBsC5f
 iBeAuDj8kpwdf6qO0cRbuN8QNM1RXBeP9UVAMQFfExlZb9VFy5vAbZin6kYK0GGGoOBY
 wP5w==
X-Gm-Message-State: AOAM533phWTnuF6JEgKCooxphTUoH6/kxB83EFNB5PHH9oGidh19UrbR
 owI634eHOGBC6WXb2LHQArxopA==
X-Received: by 2002:a17:902:a60d:: with SMTP id
 u13mr2177730plq.46.1592453148251; 
 Wed, 17 Jun 2020 21:05:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id n19sm165562pgb.0.2020.06.17.21.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 21:05:47 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Implement SVE2 fp multiply-add long
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200504171240.11220-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76ea3eb3-4139-0268-9e5d-ccd4ee6deb1d@linaro.org>
Date: Wed, 17 Jun 2020 21:05:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200504171240.11220-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ulLqTcmUIwWn

On 5/4/20 10:12 AM, Stephen Long wrote:
> +void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
> +                               void *status, uint32_t desc)
> +{
> +    intptr_t i, opr_sz = simd_oprsz(desc);
> +    intptr_t sel1 = simd_data(desc) * sizeof(float16);
> +    for (i = 0; i < opr_sz; i += sizeof(float32)) {
> +        float16 nn_16 = *(float16 *)(vn + H1_2(i + sel1));
> +        float16 mm_16 = *(float16 *)(vm + H1_2(i + sel1));
> +
> +        float32 nn = float16_to_float32(nn_16, true, status);
> +        float32 mm = float16_to_float32(mm_16, true, status);
> +        float32 aa = *(float32 *)(va + H1_4(i));
> +        *(float32 *)(vd + H1_4(i)) = float32_muladd(nn, mm, aa, 0, status);
> +    }
> +}

This isn't quite right.  The float16 to float32 conversion cannot raise any
exceptions -- this is an exact operation.

We already have an implementation of this function in vec_helper.c --
float16_to_float32_by_bits, used by the AdvSIMD version of this same operation.

I've rearranged the helpers to match AdvSIMD, and queued the patch.


r~
