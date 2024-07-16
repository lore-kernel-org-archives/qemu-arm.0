Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp435866njk;
        Tue, 16 Jul 2024 14:37:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaR/BbV69ha1IFygTpqdW5MtEcAJ5ju6//Ai1JIhGvpiCfRgFTvMu1AxQNQvonFy4vkgcN9zJBeeVw82cOyLx7uau+rRfX
X-Google-Smtp-Source: AGHT+IF7BF0tu4IK0nMYlxE1HqTDGLr1BBEZ7yudbvonSH8FBLLmD5jFN3l1ZvDP77cEEqkAjZ/h
X-Received: by 2002:a05:6214:501d:b0:6b7:4398:594c with SMTP id 6a1803df08f44-6b77f5d0df5mr50194226d6.38.1721165825869;
        Tue, 16 Jul 2024 14:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721165825; cv=none;
        d=google.com; s=arc-20160816;
        b=WiLccDA42oa69/vbomNtftwx0GjvnEheurGfRsbXaIsaVcDMWZAfhkMiC/3RptGPKc
         HZPbVAP3q/FoGXoPjnwBuJRXTAfh+Mh1TeRuYXyu3Lyo37xhVfgYPKXiXYGbUQjLZENd
         5atTTCftL4v6o32R+dplszkh2ddrsjaQ9LxKdipb0692glgs5r3G8JcIfEz36h+Idgaq
         IpSEka0bnEloPOjbBYspoR6U3UmjEby/VRUQ77jhOBGg2bRYXkFufG0dy97KxvlK0isL
         CBR28MvgxXnNSjiOMv64morvEKMfcd21z3VQdIHrinXbk02bnSqUBQU9m8bf/6DXhVVv
         +e+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=E36nb9RNRMHcoXFUXkldOoxfuaNCYT2EAIpqgRSkM/8=;
        fh=60flp6aidiOVpe6smhc/tLdWYi9A81voImoElDy1GXU=;
        b=EflO7LzitqoLOSZ2TpiBXrCKcTGhJguGZWZEL1mDJne+GY0YiQZ7x6UAXVFOpdpzEA
         Cxw9sdmQGCC7vvR5sECqOqqPjs9UvFAmEObXdeLE1oxDIc6UrcwhtCCpaQvhlo3xJPB7
         Q5S1GqE/ZZANPidW0wFiSi84g/71LvmgGcsrnX8NeNjpwfqhoy8YYQbYxNbGBLtbLLJK
         Iapxz/HHLJPJzjz/I3zMQbaALxZpUG6OIqp/mE0ShYh89/ja3uGKx4fehues0BlZAnlD
         1zeXB/abTZBtfR60OVeH+UAN9UyOTwgMMpFYFNINQEtgzO76BqWR1+NH8MkpNZs4ympS
         FHsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KzqjWSYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a19342si85272546d6.341.2024.07.16.14.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 14:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KzqjWSYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTpr0-000154-5L; Tue, 16 Jul 2024 17:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTpqy-00013g-Ij
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 17:36:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sTpqv-0001cR-JG
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 17:36:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-367ac08f80fso3245047f8f.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 14:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721165812; x=1721770612; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E36nb9RNRMHcoXFUXkldOoxfuaNCYT2EAIpqgRSkM/8=;
 b=KzqjWSYttZia63JERIiXi5MYqSotjiQnnpNKaNK/xoztal2iijlnh5wViuUC9hfRUr
 KKW8YlO1cfx4XyVkVdnTHE4toVEmAXYbNrH2vKDtX+Q0DIUxVpsqZddVripWVpbTvifZ
 P1lJcoIGfjyZ3jVf4wJ585cOIgjqadHlvzEoRM4TvD9qZRw/l2mjnnPifsCn5nqXjLAy
 vZQhMBCIcuwXzIkw0x3EvrqiX+NArtkc+D0zkXzEtjlIxCvF1g6VEGUkZlrhll8/Zgyf
 V6Y+2/UoSVc11DROgR5BK+4tkBLzDn67+epXA4IAOyVmu9KLSpp6aG5Q/2i56DQdu1AA
 G4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721165812; x=1721770612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E36nb9RNRMHcoXFUXkldOoxfuaNCYT2EAIpqgRSkM/8=;
 b=L9jJZHHJcDymhCGjHeKj+3bKaggIgpvjKyhX77ghnxSocPv4VydCk7Gq8wmum4mbX8
 IJbIVuyM7k2YkcPP6gSfA5egMGJw6e5TKzASYT5Hf+9M89zzO4X5wj3nVcCNEUWDYZNL
 za9NkzkFSAXaTp2ZnwGbLAuBaUKieNFX+K8nF0In/x/WQMml10dIddiV00NbUY6Sk8oy
 30PGB68agJNbFKrryvqsvrmLn8BQiTUv2fTT6dwR2c3UrW1ybv5l3aSNl7aH333oxqZI
 GdmBBFLA0nAoZEFONK8Z83pyA5QSXZshEQxkn+oOiv2X1IyAeUBexyvE69w6YMi9KYRJ
 5J2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLqHOYkS+wKoehFqGqZJdneAld8mKBaeLaSmtnwWBLmXYZiYwboL6Wq87cw3Mnw/iwNcXuieuMjqBjCV1iuCKWaMHF
X-Gm-Message-State: AOJu0Yyc8sNLV+mAdI2RMk8x4E6OxPA3XqDo5SGXJicNq2U4hZDb6H8J
 WkO+rE72dzXAFiXoXNZDLSZMvcuKsNUOnzzc4T9WR17alHbb6XECTCdTwSrTaxE=
X-Received: by 2002:adf:f48c:0:b0:367:993e:874f with SMTP id
 ffacd0b85a97d-3682614f664mr2499678f8f.34.1721165811722; 
 Tue, 16 Jul 2024 14:36:51 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36816758620sm7559768f8f.19.2024.07.16.14.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 14:36:51 -0700 (PDT)
Message-ID: <6c2b5a88-aece-44b0-bc10-e0744ebc38b0@linaro.org>
Date: Tue, 16 Jul 2024 23:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] aspeed: Change type of eMMC device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-2-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240704053651.1100732-2-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: n7dYg9+Lpelp

On 4/7/24 07:36, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> The QEMU device representing the eMMC device of machine is currently
> created with type SD_CARD. Change the type to EMMC now that it is
> available.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

