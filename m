Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3423369lfc;
        Mon, 18 Oct 2021 14:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK7E/XJlCNEt+1VP0zSxF17cpIuCN4Sn6kjNc4cu4KCT7WV7mNkWCYQYjnisdQ7VmnKfxi
X-Received: by 2002:a05:6102:956:: with SMTP id a22mr7455728vsi.20.1634590875852;
        Mon, 18 Oct 2021 14:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634590875; cv=none;
        d=google.com; s=arc-20160816;
        b=hI2X/w+z+4EW1jSGUMdgs354gMUlwLpxFLmW2D9r5XzNu91loDh4aglY95OuRu0rNE
         FxEjRE5VXmh1ICeJIogO13SMJ2AHVcAumbvC9iZLowjmsAM88jmSV4iDn21E+bW1Uhbv
         R9AMgFylGUOZvaUHySzT+b4bQVaEC+kOtHsQMEdw4oje3OF9cEV6QukZ53bAw3SI2v6D
         +LPwd7/iarAzL/LXpFWK3dAzFgukf49V3OCZaIHPYXsWpZ6IHwk9cnl1BEG2IIO88qx/
         FZPNjdj7sHCVl5QcRX0UtsdzrYRXINenlhtJEvZGlwQrfJIKujKcZvmuceIylSloaRaZ
         DXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/7I7u0W/RkqGPmsRFQtNVJREKm5LSyk29PxQaRC3dGk=;
        b=iM8luH8UdIxjzdWCo/IZJb2tPufY8dFNPj+UcWSlO0WjPc8GpCaJMyTDS4EWeX4Vu9
         g3GLWjj2Rnjgdd5ORdXKFr9+fzERLDyxu5C/zHiYpIePZJ/2YfQweEJdO4VA6s27KHke
         IvY4IrO4UIiB+sRQrxs4+gDZVetEl08W2jdVab67wSwXoZOmadmdDs5kK9uLMZPLeDjD
         7ZsgwAgEwprG577gQT/rgCvWt+m7jsZy3PAbuoq4b0CsTEw6pZyxkkUtxefIXHYUihQ6
         dH46SDd3cQV9IKEk3v37jWfuRL/GgmxaFFiL9pLf+ekEnJ8h1UUKW5O277WQ6vr5ZVHo
         Mzow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1YxUIF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25si9549935vsj.288.2021.10.18.14.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 14:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1YxUIF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcZkv-0007LD-4x
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 17:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZkB-0007Js-NT
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 17:00:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZk5-0001gU-Dc
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 17:00:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id m26so15726772pff.3
 for <qemu-arm@nongnu.org>; Mon, 18 Oct 2021 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7I7u0W/RkqGPmsRFQtNVJREKm5LSyk29PxQaRC3dGk=;
 b=P1YxUIF0KHY715Ezof5ccIs6AKk8YcX/Khhl6V2/XdjxDh5oxBXYn4ERWSYrHCjvpQ
 U7Lb/3UzgXL3kUlRkwJFnvxPo9BGiS7zDLc30PUJom7NYk+Muo0DB6o70FBcvKAgIZOs
 pZGzGR4gnwgbVs45/uMNJEs6mVEybPsNZrKfKuq7mT9LBhv8qVRFBGzByOmhZ8hwbtoD
 3oarj/4Orgn38cdJUK3DtkSYnLPVRcbJlk4X1Fb914fSUkW/UfSSZr4MPyGW/Br+wgLU
 k+nM1Ml/7I4b9rYbN/eYB4FMeUnSi12CTzWhRkGsaW0eLqtZS6PaEM9TnG8NAwXa7jQP
 KehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/7I7u0W/RkqGPmsRFQtNVJREKm5LSyk29PxQaRC3dGk=;
 b=5JyV4d7H355GwvPYMHPNTBaKr86NjjOp8hl1t2y1zEtekYFiuVqWCxkE8OIAftTM2N
 G8rpYnXsDTmN8A1XejE/aLchr8adBXd09Z6aj4oiptEw3Dcl0qVleZIhtCbC6hzmjDpP
 esLI63qNcaoEBgyqLe7E+kPXZJ5G4MCV/b033+gXmDUZnmSkSMuF3hjF2jmC5+bvv7gh
 6yJqjBCvTy3cDlOMAAgqJd4Gr1rncupVlrCchuMwtjSARGmZ0VSa5b4XQf0f+PhnT1Ln
 TFL/3VAxOPtDC2ucMZfLvO0WkIp/eXHfVgr0ZeznxgWxHkHaYQyMvK/5G29wKiNxmeB5
 LQUA==
X-Gm-Message-State: AOAM532awZKvERbYdlR1zs685ryv0BMVtJ2mj4Zxi9G75gcJFqOOqLUz
 7C8IorTsSH42niqpT1W2/2hFag==
X-Received: by 2002:a63:4344:: with SMTP id q65mr25954312pga.450.1634590816418; 
 Mon, 18 Oct 2021 14:00:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z6sm342545pjr.17.2021.10.18.14.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 14:00:15 -0700 (PDT)
Subject: Re: [PATCH v4 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 mst@redhat.com, imammedo@redhat.com, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, ardb@kernel.org, drjones@redhat.com
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7b27eb2-e524-4b10-e5aa-d200f13a2166@linaro.org>
Date: Mon, 18 Oct 2021 14:00:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007072922.655330-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVi1ETf5x0WZ

On 10/7/21 12:29 AM, Eric Auger wrote:
> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98 100644
> GIT binary patch
> literal 87
> zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
> TFmQk+Il-a=3=Gcxz6J~c3~mVl
> 
> literal 0
> HcmV?d00001
> 

Something went wrong here:

Applying: bios-tables-test: Generate reference table for virt/DBG2
error: corrupt binary patch at line 75: --

Can you please re-send?


r~
