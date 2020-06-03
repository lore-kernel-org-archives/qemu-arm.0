Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp66526lfc;
        Tue, 2 Jun 2020 19:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLZtV1bCEd2lyiSOkWEOuii2WEX6u4qNRt6IwmR2ADK0Sa8nxb+hQIBlL05ZMxORWTHkpw
X-Received: by 2002:a25:d7d1:: with SMTP id o200mr27422344ybg.194.1591150177123;
        Tue, 02 Jun 2020 19:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591150177; cv=none;
        d=google.com; s=arc-20160816;
        b=o0fsOpovnG0A890+1J2aLkS72Wf9UYmFHJ7/iJEhYj1SHiHDE31QJR6gtV3TZnowW5
         Sj5sgs6QxlLshX3mOYv4xQEuf9MfGN4I1syEwpOUq6hKDWJVp9mDjVZn9nQEK4gaQPiX
         9GmgiNv2jSGwStKUlxN75pW9YKpHqK8mHe1OASqZcao/OepKCn2qG3qSzIw2XdUOOke7
         cHRH2BzdNasPe5ZEQ3Jfu99Pp7PbOhkuTtdySnyEsVWqx5ztA7E9G2rQpTvkFT2ZDKfx
         7lbPjLjd/Lpfth4REzf8x5405K60hP+EBp5X+FvjA7AzYG1WJzR+uEDVwfXIFxoY/kvh
         UsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=s5GOkmf911HWsyIO9xd2eEkGHtCNOb4DWQD4kY7uhU8=;
        b=bZT75hobmqg2IsqamsPxzs4kcAniPf9FhXjAWIqbq4mslpolaa8wtsZOyUpCYZOLNZ
         063j0JS2Sc2oUI9U14DW0AmtTS0BNjDRrXifbMqx5wDzOyAspTOx2ssDvrFxpLxYUGnM
         dpeHGcz1NODSBwp8frQvntpDO9/MTwvimDrbySSCllrGKgteLjStzSa5xUHi5vmzpvZi
         BbguytaGBaEdVe4UN/SksPubY82vni8E3tYQyJEzkIHfKzXUGm8n5vwFVBJlGrG/n8HO
         3V4c60N+qCrUvI4B6vnwNe5WsxUlF71FEQPh9rC6RZtFmWNbH5t+4MRkMtik4igkV+Wg
         R3Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zW40GDvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si386915ybf.393.2020.06.02.19.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 19:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zW40GDvU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIqW-0007Me-G0
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 22:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgIqP-0007Lt-Jr
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 22:09:29 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgIqO-0007Ad-AV
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 22:09:29 -0400
Received: by mail-pg1-x543.google.com with SMTP id p21so608591pgm.13
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 19:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s5GOkmf911HWsyIO9xd2eEkGHtCNOb4DWQD4kY7uhU8=;
 b=zW40GDvUJlhj7a74MG5Ajxire+WK8Asf61VMLb0XWGMPyF48Aq3Zgn1BmECCg6456E
 z3n9k1qkmLUrAYHYLAhFF8WxJWoWRodA6cA3okhhilfOHo6TruzmIijDGy1rEujvTBBq
 nQdr6aDjRKQ5fUrQ90BwyrTVF4O0cyoRP7QLy04hPlp6vmK8oe1m48dwLDQikRwsfldp
 uKI5c0N5uENPy28aM4B/FfmcgtJwuKGbWm693LrezYy73Se+hGtWvkbtNaIxDmtxlDBW
 RSsjkWd9g/FlnLrXjSlFg+eqIuPqEPfkNcNmqncQeJnvohypY+W9c7BGVsW5HRhaHsbD
 ILmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s5GOkmf911HWsyIO9xd2eEkGHtCNOb4DWQD4kY7uhU8=;
 b=V0WVKU1wRqW3ksh/KTCFjZfI2HBUZR7NLCGYayGeuV4NVhc2yUifuSIG68MLpy94BZ
 jh5PsDrOxZZL20f2xuO22Ehv5//A6rgV8OOzbWfDJFdADz1b2VoN6qyAluJx00z2xQXz
 VjZ/L6yC2wm8yvAiuRup+o7oEHgcI7i+8fI13Jz2osc5TI02Lm9r5rpm8f7/N3+jK3V5
 BYNvrrJkJBZMWqWFwU67QRtF0CL+IA3Ndy+iZTOk4SyHyg10m9I8gKaiBF4RhPR6u+gK
 bu5pDWZ8YDF8TDOL03jM2m4GYr2k2kvxkk7f5OoxGnxE0TGgTaawuzaodWmiAQzWbxRr
 8qjA==
X-Gm-Message-State: AOAM531uMaUgRDCXj+98dk3dJcCQdsCGo3jzrnS/q0oQtJ7JNJHYjWVK
 2/YaJ7pmakFWZvXSOwm53nDO8g==
X-Received: by 2002:a17:90b:e05:: with SMTP id
 ge5mr2588551pjb.49.1591150166970; 
 Tue, 02 Jun 2020 19:09:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l67sm370182pfl.81.2020.06.02.19.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 19:09:26 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm/cpu: adjust virtual time for arm cpu
To: Ying Fang <fangying1@huawei.com>, drjones@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200603020208.2089-1-fangying1@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16ba1a1a-4562-8141-95c8-8e753f59d4d4@linaro.org>
Date: Tue, 2 Jun 2020 19:09:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603020208.2089-1-fangying1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8EJIGUWOAZSJ

On 6/2/20 7:02 PM, Ying Fang wrote:
> Virtual time adjustment was implemented for virt-5.0 machine type,
> but the cpu property was enabled only for host-passthrough and
> max cpu model. Let's add it for arm cpu which has the gernic

"generic"

> timer feature enabled.
> 
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
