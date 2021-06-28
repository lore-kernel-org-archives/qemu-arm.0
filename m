Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4164934lfg;
        Mon, 28 Jun 2021 09:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Hzb5vsKd3NKo044aVPWnNYthzkTtV73ag5Rr/XFU9QkhFSPBkfeEf+5rtZfFO7h9GQNx
X-Received: by 2002:a25:9390:: with SMTP id a16mr33926165ybm.208.1624898860957;
        Mon, 28 Jun 2021 09:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624898860; cv=none;
        d=google.com; s=arc-20160816;
        b=NFO9zQQUKtFBiT/8IuSWRlqQIaO82Ebc8rHeNWopjIccWmz3yQbbBnYzv8eDPN8awo
         5GDxfQut1JC2mMT6a4HsmuRmyOS9PKPGi/w0c7mUckdlf8vY3n0ghMxNok6l0NdqaUM2
         o/2JXo58RwXohQfB1cg2UOYdDS0ue81/uEu0Ej5XWWLx55+AHRiRDQCrdJFzleCpjN4E
         8MVSWg3sIrWcRIV7o4HccmZraaj85vbOHQRNR5n+HMGn+yWkt1n5Hn9+li6+Cqbyhyl9
         UF6hUywPCegP8J1PWz8rH5I4c/J4IFeSSVvI7bljMlFHGGRnmvVOKcHCUYnbdCV8s2I3
         6Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=x/JO9EyefEZKY19G+iILqyqd2Lr9kfCO9R0GOnEhJQ8=;
        b=ysYfvAWSLgAdEBwZKcazP1N1KI+KQyZonb7jRqii4Higz/1c8zKdnIGDZdTLsoio5R
         p5s68Bc/lgf5Pwlq4puq+k3GWf4XLygjnKUo5/HqCm+/ayK94bNv6XzWkyCvQBclotKp
         z+o85Qh0RJyKh2aaNpl6muCaK9VPxXidokVrN8Da9RHVnbJ9oahQla4KpYkmhblHqk21
         M+DnNBC8YysOAfmQc363HkvsqxbGInW5OPtmdXffy+0om5cR9BmhQq//DyFbY7gXqDrF
         x3qdJHX3aD23pvOePJN4/of6nWgH8CRy/cnEyrfuuTHGrGsAt2DSxqF1+SC3ZESyQYiU
         erFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yLF+C+fP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si14301474ybm.178.2021.06.28.09.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yLF+C+fP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxuQ8-00015E-BQ
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuPu-00013c-98
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:47:26 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuPr-00011W-N6
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:47:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id 80so175853pgg.10
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=x/JO9EyefEZKY19G+iILqyqd2Lr9kfCO9R0GOnEhJQ8=;
 b=yLF+C+fPdmm6If+eBQ3gnRm0aQxH6Vo1+5PIMYoUjvzWImMRS7LqszwZT+EwUIvlaV
 gJXXjREDFWe4L9FJR6C8sFMS/c4PFrTVOF7IfxPbnxTCmjX8lMKcQ6usBv9dx4s6zJCu
 pvpfav01xh7ewI8doiozt9gNV4AOiMBBFx3rGH9WiUCYcUE2+qe8o8GTXA7jUwUHTzPo
 m6exFhIbtBgZs5MFwebH7Y+4zFj5ZQGZxzidY5CgAGCf3ijFCKf6pPT6klqz8uwBSMh5
 vI3TpyW2G+MqO0HKLmf8K52CIkxWZG4zljSBkZTSnCjkaYpgqxM+IXB4gbVgmPm3JW9w
 6jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/JO9EyefEZKY19G+iILqyqd2Lr9kfCO9R0GOnEhJQ8=;
 b=W/8wriTi8qJJzmyWBu3j7McDHpumzyQCfc6dBWoZtembnQqGN0rVq05sRnWRw24P8J
 nK1SLr+YdBszTOhN9STq2Ixuq8fTX+ijHZaHMYAhbIssg+iVALAtFXHS4EQ4rN3OA1Pv
 gkHLOr3LAj72yxuC1/oARmo/jimfvRZrQJsmnLrZsVzW+7Ziurh0NFENtHKkWLmx2kA2
 ZQ6Qm0HKyvXsut1MJ2am71uDaEpTcy5eHtDEG1yqw7iIhVmhjLyNLCN8lrOb1Dzzre4X
 6gRwxiTjk9eTopGM2umXN9JFxSBf5wuvzL0TW/wdJCdH7ZJQA4Gp0c+1QfNmAdaoAyYH
 yzmQ==
X-Gm-Message-State: AOAM532URI4KK+voO9ocd/y80BVvqO1pv88/HlPaf9QIxAeSQ+u9G4m+
 atbszMl+XjLxSzwLBeIrEPxbXw==
X-Received: by 2002:a05:6a00:b92:b029:303:1a7e:ee40 with SMTP id
 g18-20020a056a000b92b02903031a7eee40mr24961294pfj.76.1624898839792; 
 Mon, 28 Jun 2021 09:47:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d16sm24979pjs.33.2021.06.28.09.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:47:19 -0700 (PDT)
Subject: Re: [PATCH 14/18] target/arm: Implement MVE VADDLV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be1ce116-73be-0528-166d-b77997b81f8f@linaro.org>
Date: Mon, 28 Jun 2021 09:47:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: 58Af8+JO7K0Y

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE VADDLV insn; this is similar to VADDV, except
> that it accumulates 32-bit elements into a 64-bit accumulator
> stored in a pair of general-purpose registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  3 ++
>   target/arm/mve.decode      |  6 +++-
>   target/arm/mve_helper.c    | 19 ++++++++++++
>   target/arm/translate-mve.c | 63 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 90 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
