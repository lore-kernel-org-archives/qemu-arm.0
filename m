Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp257550ejk;
        Thu, 30 May 2024 07:19:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeJYr5qLZx9qUVWrT2E3oA2xo6hr//wiK9FMzaqYCdifRDsbUa2rpuJzk4a1t5n70JUJa0zWEbW+CxpW2hvDGjfGwWQBgg
X-Google-Smtp-Source: AGHT+IEyB5wptMD8tam6SPdqXvCeeE7DMkqidf1hV1kyQAwZiN7w2oTlCGehjmBcf4zZtxVzCEI9
X-Received: by 2002:a05:6214:3ca0:b0:6ab:9619:a806 with SMTP id 6a1803df08f44-6ae0cce1fd2mr18694266d6.62.1717078760997;
        Thu, 30 May 2024 07:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717078760; cv=none;
        d=google.com; s=arc-20160816;
        b=i3A3bIky7K6YwEhL6fHeBkTHaftXKxplxX3mqYV9Y/RTaI4UDLmCBfLZ168rJyNyzp
         Eg1DKq4UYhSDBDLHF+7PZnI8sMv+hh7iF+H6W8UFToG+KaFHp54hB7xfwVaeefDD+vd6
         ww/ODKwHBUd6ch/Fvn10KprI6T9oVGfyj0hnSoRSRoB3x4OHUR4WDFGT7udGSZ9IRG7/
         xtntVMERYlKAOdQxeludAxLKIuSAoQHb7nkAsj6RNnalMGuHerq6Y4xiVThNoz2BQYcd
         UxFsr4cvwAhC11RorrUgDO+6iRyZA8pgEMviKyOAtC7KJ24HKiXRds6ODL19XepjusTB
         SS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=P69wEFVx7llWBHk+r3X+KDwvbROibHbPpd9g/4wHp0Q=;
        fh=kwPsVehGY5UE3/zycpQLEbwNeE1vBrB159NtFL56ODY=;
        b=rNNWy5JolHbttyLyctRyQcRn3LaiWm5U9h9p0itzrZE0m3fiZlR+6J/euP/bUZ8hYU
         W7NXJctVUT3wn+LbTFk4mJ6olh2l3QxDxRqG5ecx0msRrn8OdS1NYb0d6Xd1THA7jjJh
         wbfAuQkQ2fkIu2jEfmMMQWqzQVLJjHJPtSxbLQNNGZwBHqhiaCRe/NF+w8bGVr9UjhJg
         HSl9bijlZ+bu+65+YmzdpeLdHHx2sTB1ne/VL8MdPg4rvPAwVmImxc5QWn0rLhbGe9w7
         NVh04pVHfZfPNP0v/GyRwKv1W/gPmjysgvggjrVEiQPqWpPyD4YZGrhzxemJdi0N8AV5
         cFdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKSGgBDs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b5072si151535756d6.473.2024.05.30.07.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKSGgBDs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCgcF-0008BW-Ra; Thu, 30 May 2024 10:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgcD-0008An-W2
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:18:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgcB-0002qb-B1
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:18:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-354fb2d9026so1007823f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717078725; x=1717683525; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P69wEFVx7llWBHk+r3X+KDwvbROibHbPpd9g/4wHp0Q=;
 b=GKSGgBDssnoIX/BI1vdaOMQ4/KCJsr5BMGSJ7dzuQvZTYGiwYx9QewWuwvyEnwb5DD
 Nl/kEYZhfOtPayJWOwE3O5BKdshVqm2/AEK4A4j0eH2ngCBiDmp5LKrIHN4pqoXjrXAq
 ilbDsuS/rThTmUMTY8RqYvS27Cby7zMQbIEOO/vHShZZJO0/d9Np/zhcnfPkpNbaLaOL
 KZNz6FwDVLd1XM9invL3RYhR6FC0jvqeyua/A4meZMUhycOSHq7+DDy+NQeGoQx1vVMj
 gJoNSILGvaO0G6zEgMaLhOTIWX8kExRuzjcgw5xocAC96ksdP8aoUr30DLZisQfPrXuE
 Y80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078725; x=1717683525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P69wEFVx7llWBHk+r3X+KDwvbROibHbPpd9g/4wHp0Q=;
 b=WcT1o2fVClGV5DMXV5wsox/V4N4NQ5diEIN1/J6Fzbmx8AQFnZw2dsP8Ak3lG1Yjeg
 gj40jY+DVwVg90qC4UVuNfOK+m1TwZKXO2aNiPOqkMpZKcGAFK+dU/smomaWcFmaYFL1
 PuDXTX1ECCEA32yuR1oDUP3xli+0Xgih3Dy4oWkMi+KqwBYVRbzGzclEB5DvkGM6e1XD
 O4pP47euir2evsLM126wrPkmRXzJVuxPw6qJw4WVu+40ZO+Bg1SFl8UbQA4O+JhEIt/B
 zsK/4Qd6VpMsLttFBSca/pvifbD9dtre7+m5axWkqkgZdkali2/4KdKbX31nYr0BTJL5
 +rlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiAcmn64xHQPww4R2Xvw00+elovXrShaI/E/wtQUFXTrJjDf5166qxrPl29F6mo9tljq+Fi37ez5vUNlKGbXvVhjd3
X-Gm-Message-State: AOJu0YzVKGh+aQ8h1Jj88WoZTX0mexYfJ0bs5Nf35+hXp/RopIfRWkYs
 o4ywRCfU4S1WWX9jfZ8Ve+vpLlaRqPF8fxJOZ0Zt6qsjynHqFmT6OerrfrLRcKhw1yCODGKICkw
 n0KVXNczwJgvMW/QU7Vbrgs9EiEmv3glSttePZQ==
X-Received: by 2002:a5d:51c5:0:b0:354:de8f:daa0 with SMTP id
 ffacd0b85a97d-35dc00bdce0mr1486652f8f.53.1717078725410; Thu, 30 May 2024
 07:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240528203044.612851-1-richard.henderson@linaro.org>
 <20240528203044.612851-5-richard.henderson@linaro.org>
In-Reply-To: <20240528203044.612851-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:18:34 +0100
Message-ID: <CAFEAcA9UdKOh3YxtD=Oy6jBQYaCqAYzNpf1tR0WAWm9rkpY7Xw@mail.gmail.com>
Subject: Re: [PATCH v3 04/33] target/arm: Convert SUQADD and USQADD to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fxHJlSQaqwCF

On Tue, 28 May 2024 at 21:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  16 +++++
>  target/arm/tcg/translate-a64.h |   6 ++
>  target/arm/tcg/gengvec64.c     | 110 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c | 113 ++++++++++++++-------------------
>  target/arm/tcg/vec_helper.c    |  64 +++++++++++++++++++
>  5 files changed, 245 insertions(+), 64 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
