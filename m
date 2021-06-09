Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4929783lfa;
        Tue, 8 Jun 2021 17:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDolOW+6bO6O6SEii635ZejPxpSCxfj5VVRPfJ6u2ezAqiJfI7LBFLoZvsjfflR1ODKUo+
X-Received: by 2002:a37:c51:: with SMTP id 78mr6193633qkm.343.1623199607636;
        Tue, 08 Jun 2021 17:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623199607; cv=none;
        d=google.com; s=arc-20160816;
        b=N0pFSmywqNYIrY0XCafVDOfQ2EBMi4HNLZfZgn0KaC3Ag6ga0PlvYoSNr4+DwS32lH
         OVZrY9AuEkhjJYYUSPmUOw9utZLnwO+1dcLA4Ewhu2NATCudiXRlRn4hRyLZQJjNVO/i
         8/WURJCHvEEenyO+pc4tD03UPsNysvEBsHz2Enb/p6L19kfBvW6RmLB4tFTYS9IJh7YM
         Acyc2ajb/uq2Ypn4mMJMCs297nZ/+E67UBxRcm28vJ3rvzS8riXEzNBp/iamGL7ZJsuA
         SF0oM2cDajPbpZlOIKmiqCLL9LYIAaDCRUKtJSYQg4K1Jr02L7ugKPoBhYI6jlx4l7VF
         sngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=s2XdMit8vn/3WbXQWkJvy1hkun3zTaphutThYkCKagI=;
        b=AwS1KzInDniHfMClqh+SNcYUhbKJS2B8oEww44YUjLkPCp+g0LgToc3UJIL8QsLro2
         gxzAs1utXq/8HHyhTdwhL+hJDSukPGkOp+jK9BD3marwJD2TVi2iq+Bd2zuKow/9eKbF
         otxakCgl2FtNTPz1oF3D+KigehsiTLJ2QIDHMgCbBfDJ6Y+xr9tQA2eyNHcA2cRnvPPX
         TANApHxNmVBfEjRgIQ7OCwgb+Dgq1hrpCzgekY+H9xGu4nJIOQvOIxSIOpRXmbc5fFaN
         gRXh9ezZDksBbfiAwKUwd+ASiv1hHyQ0egSFEwXuX/v7pz+ujCQZG84kGZA03En9nNv8
         ihLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GCXkMELM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si12017171qvr.121.2021.06.08.17.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 17:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GCXkMELM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqmMp-00031E-0I
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 20:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMR-0002zc-5B
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:46:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMO-0003ou-Kg
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:46:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso350367pjb.5
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=s2XdMit8vn/3WbXQWkJvy1hkun3zTaphutThYkCKagI=;
 b=GCXkMELMNulFfr0sXr+BvNZneBC9x5HFcfWF/EKSsb0HIjtw6cwav5XRniVkj8CU0A
 MhVnXs6g4jti2UOShASwqglb87LNHCQvjUQHlSDu1dovqFfEcW7ICmw+fbGdlP5+9Kgv
 XS+VBoF4+rFlK/Dkq9mmcGwA/eMFy0mqUJkNEE0Q1w32FWG6bCDRff0UF12GpYg9MuXA
 LNBPFURp+KWP8l9WGB4PGI3L95JGz75jE2DHm8MjdKp6JzIR+tSq66QkKa0uhcOjo6B1
 N5J8JqJIqUhSDJk7XevS6URcKVPT2GtlJMR4W09tISkaCWAKu7e5gJKs0D/IBzDGxuVV
 /1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s2XdMit8vn/3WbXQWkJvy1hkun3zTaphutThYkCKagI=;
 b=Wq+TjiRTqkdHD7wu8T3E30xDfjPl0DAvU9FrW/3J90tdpmUwxJaQ/wa8gH41hm9WOV
 cQvubHmRTq8pMTvmQa3DtYWnWQ51C/O1bAQD+IxgVHl+SEGnTXXBcNmq13jU9R2w6Izm
 GCGeVRT7ykKtqseVx5E/u0yvwK2V9iis751ty4FvDd+hv6lsu9eT3rfIHgW9FKtadmrs
 u//Lo51WrMJv553K6WuUTZSR8Hm3fkyAcd7Medx+XLoqisvmmx9plzn/KwZ4KZMwLo9e
 IQGSMFlQnI0OvUNqQZwZQvKN2t2rHpUN8rqnKePyhHo57V9TMjkK8jliv1mugWBTcV88
 2pKw==
X-Gm-Message-State: AOAM533qpbdZhkhlAxj3hwfsuOqssr9xDo2QWjXja8wa9IoSP7ANn52E
 OwPDN249w7Lr7T1eAhABiJklOw==
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id
 n4-20020a1709026a84b02900f3f28507d8mr2744870plk.57.1623199578724; 
 Tue, 08 Jun 2021 17:46:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f13sm11796645pfa.207.2021.06.08.17.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:46:18 -0700 (PDT)
Subject: Re: [PATCH 29/55] target/arm: Implement MVE VMLALDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbee92b2-f12b-3523-b977-059418a1c642@linaro.org>
Date: Tue, 8 Jun 2021 17:46:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2LQkTAJrlNOR

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMLALDAV insn, which multiplies pairs of integer
> elements, accumulating them into a 64-bit result in a pair of
> general-purpose registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |   8 +++
>   target/arm/translate.h     |  10 ++++
>   target/arm/mve.decode      |  15 ++++++
>   target/arm/mve_helper.c    |  32 ++++++++++++
>   target/arm/translate-mve.c | 100 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 165 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
