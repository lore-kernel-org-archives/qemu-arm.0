Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp599520lfg;
        Thu, 25 Mar 2021 10:02:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJYdJ1UPnijZrAazo48f0vzDX3uLBkz6ZeR9vppjS2ahl0pJ8LdOGJYNhm2YFPix/MC+F8
X-Received: by 2002:a05:6638:35ab:: with SMTP id v43mr8388999jal.65.1616691766691;
        Thu, 25 Mar 2021 10:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616691766; cv=none;
        d=google.com; s=arc-20160816;
        b=Gv22VUYiCr8fEjBfxNXwILCj/6lQ82HqdBDTQQYfjdVKqqj+xaO8NN7RGCTyHRnunv
         oqDT8Tpwzpk+WfZkAWoR9o+yNrSCBvLUI+MIYBUhhoxMC9AqMYDuVjV/yrNJzMUjWz20
         qk43NWo4VXgAPTA9jJBgseUuAefdWCI8A6R1YRbbP7TKzsN30hm0eDGnjTsrtoyfiBBL
         I4bBssIvCQjlxdtllWNEybquSy6fGvocv6Fx64HzdkrposZqvTAF5h8c6j2RRb4n0YyS
         S3JtnLTEDwJ5hCSFN/WJyzsp+NUlIyy48jwS4PR/U2WAfYiUbt+9Wk6pnSuK8oETbxib
         IIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pagxWLYGykzjlVdAleVSn9XBHMoNKN+23sfF5pH0hDQ=;
        b=Tgc6LaAs/jHxTszhJE3Y4rvD5Vbio+myOhV+CSp9NoEQQYw/1TgLmJjVTBezd65HbE
         4pzE09y2/3kidwiKaX3x6AmPRNU4xJHQQY0loTNBgPJAVCFJk6LCOVAEEPJgZ7ajo54t
         cp2tIZC9srJiFDFZzkus1hUfeYvdh0znn7xRpkvewmmScabRyMHptrQ2+fOQ98jFB5HD
         yJEIOI8llr+jqkUNbaGCzppK+oKsh/Y1Vi7HqQuBs2R4aY1Rfc1bmtRGp0m/xH3hzdWt
         6t5+gAE5XQoWZvZ69ERjIUanhnZ34nDWKhS1HXi5mSlvb5AFwjWATVTwSVT/f1sEZ6bL
         HogQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N8032MS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si4070298jaq.104.2021.03.25.10.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 10:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N8032MS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPTNd-00022v-Qo
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 13:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTMW-0001YI-9g
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 13:01:41 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTMR-0003PT-Qp
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 13:01:34 -0400
Received: by mail-oi1-x22c.google.com with SMTP id x2so2838847oiv.2
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pagxWLYGykzjlVdAleVSn9XBHMoNKN+23sfF5pH0hDQ=;
 b=N8032MS5j+ktQJWp+F0szS9Jt5+daM8Bzx0MaIq2JbllhpOC0grPtcxFqMrQuVKO3Z
 JXOiIC1HBgzDlly7maUkPFOlEktBRk4W5hb0aDu9joem5ROXNYdB0BpAKnvS2ulHL5GA
 FLmm8isiiiHms969UbJ5rMggKaJe+u8H9SVcE0c/ApJtiZ4RIHJ4GrRzHgpxau/YAwvV
 rzavlmM+Ktc1WNDDoa5Ua7q8LZNNyv79IHr5oXO6Gx3uczYy5WEps+jr9XibH+H8TC6g
 pnmBi69RLDlMHu+F1FEcjIIEIiRRhFQ7ClWZkKO+HYxOvOBIxNMeQWq8xOAS1ApzTLaQ
 bISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pagxWLYGykzjlVdAleVSn9XBHMoNKN+23sfF5pH0hDQ=;
 b=c+9N30T4oRCijEBmCcc4HwF4a0BFkHg6NwAHIpcRZgxWHQ8JhlaDbrIQJHOk2AT3OB
 31Nj0O5l6NLCXzV/8aB2uOsx83EsqTKZn7T3WYM8BEnmhL3p7kms11GDa+i6XrDFWni1
 X1o5FBMvecSpH/+zhKrGKHC283ENyeM1oHhjT5DinhVSQ+G7pfxdgP3tmNh7uN7SMiDj
 2Cu7zp4jrJw8jrXUhqe05l8kkuNd3IO6jE4jgqH/Sz44SjkRE4hrveFwELX0S1dobrA1
 0Ig34960CJBn/vOINqcRVQvQg9ceRcKmn5PysMkTFa04CbTod0v4g/HrxCjm+TIhVf8H
 FPZA==
X-Gm-Message-State: AOAM532vJ1dODRMUI2KWfNRWMKL8k+EGOZrpZhtGjJFFROLYNDye24cl
 Qva9BdPy/dRQyTxelDPZEJgiHA==
X-Received: by 2002:a05:6808:907:: with SMTP id
 w7mr6724114oih.148.1616691690461; 
 Thu, 25 Mar 2021 10:01:30 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h9sm1346177ooi.22.2021.03.25.10.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 10:01:30 -0700 (PDT)
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325163315.27724-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7eddd70f-3d78-f711-1044-209be206365c@linaro.org>
Date: Thu, 25 Mar 2021 11:01:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325163315.27724-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Dmitry Vyukov <dvyukov@google.com>,
 Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9f5bQomZ5Sr/

On 3/25/21 10:33 AM, Peter Maydell wrote:
> Currently the gpex PCI controller implements no special behaviour for
> guest accesses to areas of the PIO and MMIO where it has not mapped
> any PCI devices, which means that for Arm you end up with a CPU
> exception due to a data abort.
> 
> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> like this return -1 for reads and ignore writes.  In the interests of
> not being surprising, make host CPU accesses to these windows behave
> as -1/discard where there's no mapped PCI device.
> 
> The old behaviour generally didn't cause any problems, because
> almost always the guest OS will map the PCI devices and then only
> access where it has mapped them. One corner case where you will see
> this kind of access is if Linux attempts to probe legacy ISA
> devices via a PIO window access. So far the only case where we've
> seen this has been via the syzkaller fuzzer.
> 
> Reported-by: Dmitry Vyukov<dvyukov@google.com>
> Fixes:https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v1->v2 changes: put in the hw_compat machinery.
> 
> Still not sure if I want to put this in 6.0 or not.

I know what you mean.

> 
>   include/hw/pci-host/gpex.h |  4 +++
>   hw/core/machine.c          |  1 +
>   hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
>   3 files changed, 58 insertions(+), 3 deletions(-)

That said, the code looks fine, so,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
