Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1734411lfm;
        Thu, 25 Jun 2020 15:17:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeYKTzXCw7T6PHpDHX1ckHyWv+lHABhB7yUuClZYXE02XB1aosmcOhjrShVEHZCGSKj2pl
X-Received: by 2002:a25:be02:: with SMTP id h2mr26506ybk.315.1593123440928;
        Thu, 25 Jun 2020 15:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593123440; cv=none;
        d=google.com; s=arc-20160816;
        b=j+DK/tHNdSvGPyzKoRUHPGGxDqsbcCCwvaGALwCf/l7N0/kle4ZMHpXGcJ3vgUWE9E
         Ks2iItCAWEH8Y5yUrcPCrGQyqJYQWt2dpSLbNxAMA9ZputHe3rGEVFy9koAvUvtBrlfB
         lW5Uv4uK9a/NCM4+ehKbDTfQpQFWdfSpMT9+96GwJI1OEuNPCgYMYgxQeS/TdXojcVrX
         LouUBNnUpR8fam3hCLhj53BhPg4eGTUFA2cBEbA8LO+P0wql/DbQKyVIDJYm7A+pD8M0
         UhULmfs1AN1peI0MU8FhGrRyBrZTsIe1gO3Q3NSCO6B5gnrn9hXNcpsZNXxVkg9olCQD
         04QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ytgSCXirQ/gNtbGdXqATNvET+/yVuoIGtac1C2Wow+g=;
        b=bG+shEq5wsnZtxu+iWnzoVQcrls66JvCwUfwP/pJz7T8jkW2VPt8nVWv+/Hy9Em+Rz
         iJFz3cj/YMngpqgz1OwRdj4VDTdGT3xYZbp43SRIOhbMxYq8b/XbBpjwQrMnOJpbcQlL
         uGvbFze8V/gAgUj3nQmMcjrGfa7y768R+Z/O9egFVNp93tP1585Vgj7Y1zXggpW5OaSI
         0Pl+4GAkplrTWvB7PSa1vcu5JZnQtChR5t/E9enlqdaUjDfW8pVtnmM+YNlaNeIcRpzF
         HHNvwpGh/AqZCsZD2hs4W+p1K3Ng76lAUsNZCyM0XuTx1XHvrziZiTvtMN+Q+otg9/eF
         Rn6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JbuYMn5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i81si23675345yba.193.2020.06.25.15.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 15:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JbuYMn5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joaBM-0006B5-BW
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 18:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joaAd-0005tN-OQ
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 18:16:36 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joaAa-0003Vr-8L
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 18:16:35 -0400
Received: by mail-pg1-x541.google.com with SMTP id e8so3996447pgc.5
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 15:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ytgSCXirQ/gNtbGdXqATNvET+/yVuoIGtac1C2Wow+g=;
 b=JbuYMn5IZBVvXsI9NNBZ+hJmBix5fJThuQSbA76p1zggfa1MDHAQo2yHf3Ql3B5HLi
 6qVlwXmyCBrPzdqob4CzOS7rVy2GyvCBPVqSq1PXMfre89WThvQgK6wF1RkaMokI3sam
 IS1BbZpQ0/2DDP/ZJcWzYMmAF6gTi+lMINwXkeOJ3mU3S0xUQSix1nUoNubny9qXN3Gs
 NeVQAFb0vyRrCSifmnthHNdasI6YdQLCtXoLeuks+I234+9xX2qhyOT/osKO5jjo1/m4
 o7veKciBoYNxDvPPlzCr4Fe6zuWkMkgEsS7zFC1hMTfp5puIy9Rh7bhAw0jrMPJ0/Okd
 dAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ytgSCXirQ/gNtbGdXqATNvET+/yVuoIGtac1C2Wow+g=;
 b=gwZvoHsvuwlpkf3IwkL2fZAx524WXijQwXYFYiE2JU4KkqM2mQC1ysyGOuszZrbE2G
 eF7x6YLz5rO/1sSNhPVZz4ftXkSV3LBY8cvgMjheA7uNXW5gPMSAk2Q1dmWVcdjzcjSw
 Bu1OrDyIU3PuSbaDg+wsh1nxzRchuy2aKX3lYUPj7jfVWezhn9iDgToF572+Sha2kt+7
 45ZhI6atKfwWP8B2GtcFcS6V+RUiCh+tpy/NPovBSWY8KHcaD5WoZtcxCnmnSOrGTtoo
 I3y+C6xAVRWKcgUyt70OKMeq8a7q2B/75Hm3YLkstIPXnMcC9xrVuh5rUFPeidLc4zVR
 TpLg==
X-Gm-Message-State: AOAM531KxS2aaVWrRLJ3ZS1XNJBddrtodU4Jbgze1fgPBsBTwxR2luM7
 oiUo2GvKRLvBpyavP6luFUr67g==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr11990pgk.237.1593123390736;
 Thu, 25 Jun 2020 15:16:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m7sm21169770pgg.69.2020.06.25.15.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 15:16:29 -0700 (PDT)
Subject: Re: [PATCH v8 44/45] target/arm: Add allocation tag storage for
 system mode
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-45-richard.henderson@linaro.org>
 <CAFEAcA_svDHEDP5g3aaEL6_b-8hy0AB8oRBWj=y6G1K_r6E9nQ@mail.gmail.com>
 <f15d6bf6-03ef-70fe-2f40-0665d49b0851@linaro.org>
 <CAFEAcA_qOznfoAWtXGh-85C86fSft5ccSKQKv_uVw6-9bD4Oag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91051d8a-d105-4119-c3af-6fe7f797bd33@linaro.org>
Date: Thu, 25 Jun 2020 15:16:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_qOznfoAWtXGh-85C86fSft5ccSKQKv_uVw6-9bD4Oag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: David Spickett <david.spickett@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3VOwAnzw0VI

On 6/25/20 10:09 AM, Peter Maydell wrote:
>>> Comment says we're checking a memory attribute, but the code
>>> is checking for TLB_MMIO, which isn't the same thing.
>>
>> Comment is not trying to allude to Normal vs Device, but "ram" vs "mmio" in the
>> qemu sense.
> 
> Oh, I see: maybe "if not backed by host RAM, then" ? I tend to
> assume "normal memory" means "Normal memory" :-)

Sure, changed.  Also noticed two more places where calling via mte_probe1
should not fault.


r~
