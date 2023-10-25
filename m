Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp6927ejb;
        Wed, 25 Oct 2023 16:35:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZwhHj6HupveWILx5PysTxhqiZRiEPDZ0hvsQcO0GDOolBSCQtpGRH2QsmBYGCes59LhTN
X-Received: by 2002:ad4:5d4e:0:b0:66d:3e1e:1afa with SMTP id jk14-20020ad45d4e000000b0066d3e1e1afamr18478011qvb.48.1698276934986;
        Wed, 25 Oct 2023 16:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698276934; cv=none;
        d=google.com; s=arc-20160816;
        b=IykqcVKSktF+MTHI7qhjaGi7FgT4DyC6IYfpeY0Qa5no3Qow62v12RrejjufEI6V3p
         xMOu0+WAMyKkT8nWCQNFKo4z5DPlcsiPlY3XwLKjYWF+JgOzQMz3WlDrZRy/ANx+ewhU
         AFQF9WbO9szu7cPXtQdV/f4gnQOACvp/FQPSx4CxbdibW4exeCg+P4HnOUeCi7NbThmN
         U06X06oRIXyd/Z06P5r6tUETdI4SAVu90EKIK5tsPUHVBunY7PFdohEwtIHPSRQYX8YV
         Q1jFS6RmmzEcGehK45P6p13lDkY/mz15mPuq1maIlILgSt2y+xCU+HTuvSTX7ITA7BL3
         848A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=O2pilWRePzvSoyeM1yhjxkxPGX0uFHZh2Jp65UYM19I=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=tYwbDug8tPkTonWKOWwFtTOslS8wkKYP9iveAoM40J/pM+Ailar2ccuSZoShM4EKq/
         +dxRcQ1pvBQgZFFR2rr+jhBsEPelV0jh5gJnyNjHkY2/6+1ec4O4f/YNroFzZgD239ff
         K7HTkIfdRkC9sg3HwhhsYSfiddheOVt8sTBR1lmJupPkr+XLsbWFRhtZgLbbhmDYlGkK
         LJNcGQKavC0p9GPErI4V8mnipn6K7/RLqK5FK84a2Jos2F/ZWycudMzesHMbi8svfENX
         O9TTPwJckTvuLuyFtFj+vzk4X+nNAzT2XVdTq4MEdmGciEeh+pdHjhjsuTCPVK9JMwLv
         20ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ts4/+UqR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020ad44ba5000000b0065b0fd973bcsi8627314qvw.271.2023.10.25.16.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 16:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ts4/+UqR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvnPR-0002bJ-BI; Wed, 25 Oct 2023 19:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnPO-0002S3-92
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:35:32 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnPI-0007LK-DL
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:35:30 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so280931a12.2
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698276923; x=1698881723; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2pilWRePzvSoyeM1yhjxkxPGX0uFHZh2Jp65UYM19I=;
 b=Ts4/+UqRrdUGZhH8M1JGWlzW/fWH6WKRFo4cBYxdyr9b4zx2/mvpxSyNazE36I1sTj
 StjFcym05C8bdi9vW0/VBjeWrxYVoeJRbGuJLc1WpVbrgathMT5fL/zSF79380wVJpQ/
 XyOkYcAYrdfCPP1SF6YiAVJ+ro9Phfwd704zX7/hrcB7VgYg+bve7XhwSaoYa1iNyQwV
 pvMuS07z/0PBOL7WYmxcY1aPENs/gjnNr+v/c6f3ufoYHZkzZB/FDdhYYZ4BAUCjppbf
 fTrGFCrQLKjv0OQ/WkDFYMg1Wphcm1uxesq18rCR6xKRI09CTgaWlvbyFkf+Ue5CQzbP
 U7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698276923; x=1698881723;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2pilWRePzvSoyeM1yhjxkxPGX0uFHZh2Jp65UYM19I=;
 b=nJebW3ohYMXGH/LoxFLY0K43KhmxLTw3Xj0if/e93UCyI+wU1PBpg0MOXTcshJlMgq
 ERHup334uc8uoqJzVybfkHWKrH3Wrh/+GWlz25BUpN+35Ipq+fu2O89uPdxCdDpDec1o
 Wze2kCQDItE9H7k1bP/aF5LYX52y4q9MXPcIzLbNoidZaRbYzyNr4/G0OkznivI+PIP6
 eKqQSfRM/+PIlMBgidDoMJy1TtU4yONv9fByGfYLHuhFCQ9XsYBvHawNDOj+g6jvdVkL
 ZRyWGkHypErW8bPdiaocUx3Pb/hsm423J5I+W8Hs94PgzeZjhj1iJO1OeLyl8Wo7TIkU
 Zmjw==
X-Gm-Message-State: AOJu0YxM4BO0oaZl828Nf46+c2ITKMEGAicpS4JqnxMyeLd1FabpU452
 wjXsZt3pvsR/ZVeP96sboTKmxA==
X-Received: by 2002:a17:90b:88d:b0:27d:375a:e322 with SMTP id
 bj13-20020a17090b088d00b0027d375ae322mr14440462pjb.31.1698276922803; 
 Wed, 25 Oct 2023 16:35:22 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b00277371fd346sm475304pjj.30.2023.10.25.16.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:35:22 -0700 (PDT)
Message-ID: <3c52350e-cf99-4fbb-b8bb-dd07128290fb@linaro.org>
Date: Wed, 25 Oct 2023 16:35:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] target/arm: Move ID_AA64MMFR0 tests up to before
 MMFR1 and MMFR2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
 <20231024163510.2972081-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231024163510.2972081-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: R9B714I+Oa1I

On 10/24/23 09:35, Peter Maydell wrote:
> Move the ID_AA64MMFR0 feature test functions up so they are
> before the ones for ID_AA64MMFR1 and ID_AA64MMFR2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 120 +++++++++++++++++++-------------------
>   1 file changed, 60 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
