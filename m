Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1895952ejc;
        Mon, 6 May 2024 15:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSAK++ZYKkbmLZuF2L9YNl2SuOVy/Sa3GeHDAxbso60f/HadH29GrlJCa1VPd9uH12Soskiye+MidwE2vHbOkAKmaYlprM
X-Google-Smtp-Source: AGHT+IGabygyW5gpI74NGcQ1zF4rNRC1gFW3pekS2j23dS5bp3cw+wfKBN9dmehO3O2BPi9GLRaD
X-Received: by 2002:a05:6214:2303:b0:6a0:c96e:c4e3 with SMTP id gc3-20020a056214230300b006a0c96ec4e3mr13144959qvb.4.1715034853375;
        Mon, 06 May 2024 15:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715034853; cv=none;
        d=google.com; s=arc-20160816;
        b=ejGbJlIaQeBJMkfv4hJ0yn5a+vm08gzSqScI2y8THOBWuuR/V7qBshDcZW/kcR0cFS
         PCnjb8AfLvtaiMOamjNUUZan9eEDb4GiOKWQufu3TaZkmAA9A6LAcOmCMOw/TSyKSi3P
         nB0oklqHcAoFQ7exbuxu+9WK6apv0HxIF5145zYbFdVm6B50fIvRsWmD9AYAKuK9aDB2
         ZNVT+4eT2GseQlwWapXZzdtdHFl/PCIxHfIsMGnYhQxVwuzjW1c9gEGDKnJqL7znVGtz
         EuLGPV8tZeTtqerr5RbdTNY2TbHui3QPbx+YEp8qnrARtVz8VxVraEfxLiP9hAFzid4e
         gDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H7ZJustMiW7nPUhItgoQuxYxEP3+MgCQY5iJTzlGbgQ=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=HFSqhNL9rVTMwqIBvzzPf+E2Gbs4+FqMO5zLOcuVb2n0R36FCcQOVSWj50gG0kF79s
         4wpVlCgRnx/CJoBWyoOhLtXRliNq+woxxxz6N8fT4sppjNZzvN0jwQQlv6AX7rpuKGsa
         SnTGsBwtbK9sqaGXIp1TWTBrBAL2NKq7iAi/31EA5jd1uw2yqdoWYPuTJ1yDfy4LIpKQ
         xfFwOXzKNbzWgC8+Ext2Ncy9LikivBgyQQKPzGd02rTf2pm4NGcjTVASFuNZmq7fc0IB
         6c0xGVYjqPojHiT4xvyBf0iTh/ToYK1eVoy3wyb6ueNTYZEZtW0R/AzvISY287tp+xju
         lsAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hOg/fywD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a05621420e900b006a0cb1183basi10265090qvk.165.2024.05.06.15.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 15:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hOg/fywD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s46tx-000326-Aq; Mon, 06 May 2024 18:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s46tw-00031w-UU
 for qemu-arm@nongnu.org; Mon, 06 May 2024 18:33:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s46tv-0007gA-1U
 for qemu-arm@nongnu.org; Mon, 06 May 2024 18:33:40 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so2723973f8f.0
 for <qemu-arm@nongnu.org>; Mon, 06 May 2024 15:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715034817; x=1715639617; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H7ZJustMiW7nPUhItgoQuxYxEP3+MgCQY5iJTzlGbgQ=;
 b=hOg/fywDe4BEAtu8OzY/V/WtyMg3aD+dml5VBPXNF63gxUeuN+yoRtjAQ0GDnACk1D
 M1/sPEZKbmlRcZwqsXhseCaIF4Y7tmGK7rh8lkJdv34myrJpYmhdRTRBja/VPa8W8wXN
 SdS2v9TRR/5tzb/NyKUQ72h32t4lKqxE7BPPZkEXk33ipAdcNF3LNPhiFeXXqzg+KJ0s
 bkFzYnLBBeQbySEITtT9rKshSASXimZ0pVfUg/mn3vaRVys4I+g/kBCoYx8PKFPGyFQb
 kwqMO6SCRtIFEt5wgF5MtvDn7XnD0PLfREEiBIg8Pq3gthx0zJiDTNmukaUyAVuiPno+
 D3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715034817; x=1715639617;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7ZJustMiW7nPUhItgoQuxYxEP3+MgCQY5iJTzlGbgQ=;
 b=QoI5uXkFusl13xVo0+BcD2tKReoM5lhPVhGeahNV3WFUErTTnbbWTAQ+TMAZsm0g9d
 Ay2Wb8UNgPvEIZyk4ruD1plaQF/J3LZiBx0q6zdxIP3qJHuB3/MEkcH+jo6INbJPbfgU
 9rHwng94ZoKSy4b5pZDec8h2Q4XU6Lewx+ytZWMomJmruuGl4+CFVfvR2zZ84z0C1ljz
 4xyBHgdeRqEytJFNokDZXamb9W9112S7DJnOTw0bpRQwRuU9Yn+rHuJe2nBChSj8Ykrd
 4dL8I9N7E9bYYwaBT8B5ExyDYU3b4Shmq+FynWMyhPYEf9zLTCRUU6amGLYCJpmpiB0f
 elfQ==
X-Gm-Message-State: AOJu0YwkKmvohjhAzK9uOfbtVW7lC35THspZVfkfmO9v8s5S+6Ri+avo
 +SV6QkNHgyxeVkR6FeJ0oLB8HLooyFR98zmnY2WXr5PKxGfXYwhdWlG+9/WWX9s=
X-Received: by 2002:adf:f04c:0:b0:34d:a19b:56b2 with SMTP id
 t12-20020adff04c000000b0034da19b56b2mr840269wro.3.1715034816899; 
 Mon, 06 May 2024 15:33:36 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adff752000000b0034e19861891sm11555047wrp.33.2024.05.06.15.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 15:33:36 -0700 (PDT)
Message-ID: <b7367d66-f4be-463c-87cf-105235a04c68@linaro.org>
Date: Tue, 7 May 2024 00:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/57] target/arm: Split out gengvec.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240506010403.6204-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wld2p48ST1Co

On 6/5/24 03:03, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h |    5 +
>   target/arm/tcg/gengvec.c   | 1612 ++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate.c | 1588 -----------------------------------
>   target/arm/tcg/meson.build |    1 +
>   4 files changed, 1618 insertions(+), 1588 deletions(-)
>   create mode 100644 target/arm/tcg/gengvec.c

Reviewed using git-diff --color-moved=dimmed-zebra

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

