Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3187449ejc;
        Mon, 28 Aug 2023 11:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH74AfgzZZ7ka6D3x5xVJmY7+PX3OE2lPTp0rgiXgYT6oGgK6R5HUDShWMioq3L+ZEKSyrF
X-Received: by 2002:a1f:6d81:0:b0:48d:3579:3d63 with SMTP id i123-20020a1f6d81000000b0048d35793d63mr20464039vkc.2.1693248086064;
        Mon, 28 Aug 2023 11:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693248086; cv=none;
        d=google.com; s=arc-20160816;
        b=GUTRo68FwhcQjjQmrkYgWaWwkAynCAcXF6V/9yPdtidmFH5tvvl3Oa+RC/+DwCspOx
         CdyPqIxunRPTFbAHp50Ymw6jvB62I8Uizo/xWWvymKxBjk9YHM5VqrccJVfmnTp03nc5
         D60Rtcw5HZ6oDtLMOJRquufunX+CpHrDGqqcCiOLJomm6cj/Wcbjl8e1LYIiP/b3k/5i
         XcqoeLJjgxJxOQBDQ19ZohEeLSbFbGcUOOQD6UgSxLTynmh/Yz1TRog8g/v2rtbOjsnr
         F/R8mI5sT/EYog++vno6JjHvMgzlUt9By7osr42k5dg9FQp6w99gLXtoRAbB7QPGtfHS
         mjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=++uvodA5NKDQhXzfndJt/8NAJXwtfk3ugys3ZqfQVdo=;
        fh=vc+nqmKDbTj+9KCVcVasbHFTqitsy/RlC8F/3ZcIIWE=;
        b=HarfPA9a/XQdEY6q6yfSUjWq2DJmgtKKd93Z2vQwIFxlWITr9UX+HKBtzcO0D69uBW
         M/0mLyTs9jV2NUyk+d6r1MT7Z3lE2t46F0D+uwAo8+y+hAqO3frVoaE3n9l/Qs040cLs
         e5X9bh4CAqZaGYdL4emZ3a/ZEAVCq6dTdFOt5y1il/f+6/bCYxzYYmMPcVMB0CCe/JQ9
         Mjxz2JRibS44e4TdnNSKFV5mSnPl7k8qCnAA0W6zVCKZKjswIv9eoExfiPQOHPXl127k
         GTlVjr34Vq7iT8yIEpnoYSEk136BJyjjLoBi70gEypU46+G7opp3p5VxxmlBEUEFeV2F
         K7Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IW0Gkk+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a05622a148100b004039ef1cdd9si5405734qtx.443.2023.08.28.11.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 11:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IW0Gkk+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qahAn-0005M7-HT; Mon, 28 Aug 2023 14:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qahAW-0005Fb-K9
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:41:00 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qahAU-00087E-4k
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:40:56 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68a4bcf8a97so2210011b3a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 11:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693248052; x=1693852852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=++uvodA5NKDQhXzfndJt/8NAJXwtfk3ugys3ZqfQVdo=;
 b=IW0Gkk+DwcTP5RupLgv+GCReaWgyOac+6M5Wqy2dhZqiIo/GMS7KPOmOTZhTmeLgzR
 IqlbOoft84ft3y20gBlEuC555VgOww2a9O6re7VJu/S/I22YDkBB1oIwRCaWmv1M5DXb
 +YdnRuEQz5R6HCBSB5fYYWLdg+AEq41+EGfu7YcyvLKY+M8YWRmWJEvri3YQDbukP4GB
 eZU9Ffl2hOnIIu53CJpjxK7aOlaAGLe/hhWwlz8L9XrxUaMgY54hCfYjqDb66xw2BJJz
 9pylJGMZ9GGI2/vugl22mEaF99EJjhEqCg4RDSWMMg7Y4Lg/KPcjQrFHdF0sUyM3UOb4
 XZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693248052; x=1693852852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=++uvodA5NKDQhXzfndJt/8NAJXwtfk3ugys3ZqfQVdo=;
 b=aaGT4NhG3AW0xPfHbwjzqK4uNv1JUpSyBAaWWtA+8oafWGYZmTGdW8vBTsTExqyvxi
 FBQTE2/qEtYpQ/+Qv9/5PnNMpbb1BleK4X+8C2GcnEnaiBj6vHjlROAUI+bgFzaCMI+z
 4x4LgMnCwSf2MMAXF1zHzH6+Zhr0Y+3CiThUJVGZr1EcuWWVKNqJknTEgp7PH3lZL4Rb
 Ujq+3sgXS6Kf837BwP/pBk4jbA1rqr4jGapeVeRqUuDO7YJv1Mtwb2f/ZXWmDudjOrbl
 mEnplOB5CJ2i1q3PCsMx8REGDZtFZf2wGO5LkPLI3kKYuoPkg1CeR1lY79jZOjlghPU4
 efVA==
X-Gm-Message-State: AOJu0YzXMB4+oJ+UzHatIWGbpu/nenYx22RjEwBnc2G6qMRVDhAG0jrZ
 a3MMb5wAVFmW219J+DGUSZk4Pg==
X-Received: by 2002:a05:6a20:4308:b0:140:6fa9:7001 with SMTP id
 h8-20020a056a20430800b001406fa97001mr25644913pzk.40.1693248052557; 
 Mon, 28 Aug 2023 11:40:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 cl7-20020a056a0032c700b006887be16675sm1172898pfb.205.2023.08.28.11.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:40:52 -0700 (PDT)
Message-ID: <37e187bd-a21e-f9a2-ec51-a114cb5083aa@linaro.org>
Date: Mon, 28 Aug 2023 11:40:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: la540OtEiSDQ

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> "qemu/main-loop.h" declares functions related to QEMU's
> main loop mutex, which these files don't access. Remove
> the unused "qemu/main-loop.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/pmu.h                   | 2 --
>   target/xtensa/mmu_helper.c           | 2 --
>   target/xtensa/op_helper.c            | 2 --

At least these 3 files do two things.


r~
