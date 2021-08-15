Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp756432lfg;
        Sun, 15 Aug 2021 12:52:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUL1L0NiGH/56avoUA5yoBFovMuUmoXgh3iUS+Tehq6Z4Z2QDY2fRYztlgb3FEhdbjHV3E
X-Received: by 2002:a25:404f:: with SMTP id n76mr16478651yba.494.1629057167032;
        Sun, 15 Aug 2021 12:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629057167; cv=none;
        d=google.com; s=arc-20160816;
        b=YVVuyL+I/X3at8JtBVa3GDOLp1iKia1BSxtTakJDO7+21dzB61iYHgEUT7IaRxENkh
         UmCxPVmxkiTRxjHpzqVsVkmuHrjhpYL44mOw/+bPFbMhIEEnNB3DYRZtRPbe3l5aGXfs
         zMWxA/7sYbIsLVcjiMb6RBEnPBqyn0u8lVUSPjQUBejokx+9213sWqCJzyfWKxo32bGC
         c4sJXC6HSv/XL7e5V6jlpozgpEKg2CVRXN8v5Gsl3nmBDzyKu9C7l+sYotJizE6g5z+A
         XLE6lIuODALxgwtzUKlNCSSNI3CkpdlaX/ypS2iwtj9nREacudRVCo6UhjuMYhg1nD/T
         OJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IYiYFpq3TUz5DcxU0nAqhnfsW/GVAmXTFOBJZPxryio=;
        b=HnqR0doUl58snqikIqEdsgM87OGq6RP3tWKkl7yRmQX/tunsichUkuEDts5PI7cGH4
         l1QJVKNTZKskvNGJetZhtC3Yf6pwYqRXsE8OO0qo+xiF2GQ1Zfah9aYcxTBQ1RzXAvk8
         3+mtvxVUycc14wcKfrS5pjcNqELMC2d+TE91qMBQHhJVObuoe/dIJcAtXKsLm9OWbAP2
         4qJRaQlQq1L/ZNjaMxdU6eEM4p/2CMU/LW0sU9CxA4WE30dqKw4maTlrvSTJu71M1P2s
         qjdEcEn0ThdeQIR9lqGbduyKmSCSnO6Q6UeuNvNx3SQAbUXLV9XE27432sTu/83Gy00U
         I/qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIfJ4BgM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d68si10146466ybi.175.2021.08.15.12.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Aug 2021 12:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIfJ4BgM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFMBa-0005HI-Es
	for alex.bennee@linaro.org; Sun, 15 Aug 2021 15:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMAe-0004bO-G4
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:51:48 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMAd-00051e-0t
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:51:48 -0400
Received: by mail-pl1-x634.google.com with SMTP id e19so18466607pla.10
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 12:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IYiYFpq3TUz5DcxU0nAqhnfsW/GVAmXTFOBJZPxryio=;
 b=LIfJ4BgMErDwCQMIbX/oFz9BNbNnHY8YdqpWgyxoUhMvmOXUzWCRAa2iD8X4BvRebc
 LGBuccIrbdFGt6Aarr+wb7p7TD+SCAIvkyxyFdRNX7mjbM2wy3H1ZltFn6xwWrdAY9V8
 e8eZlxVf+s4PEn8GCkEaVGbzioV87FaZzCVyyj8rqWzKJj4Hqi6irP2FlUlajdZXoni8
 lPNeBsNhUJDRKnSrdQl0l98dZsBsnKZPAv4K1QfhXpe6iSVqVCri3kwGm+MNRkD6D7uB
 y3NB827mDZ+/W2Bv2GRm/ad3Z/fpAS1i4z01/66fvAGRqqXe6IbjlITtnJGA6x/9LUis
 Ri+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IYiYFpq3TUz5DcxU0nAqhnfsW/GVAmXTFOBJZPxryio=;
 b=AJp6uk7Pjh4IsTu4ko4nCp78RC6yQq8LfzIq3O8y7wSL9x3aInAePn+X1Ly1Ip6kyv
 nKydc13NGLC+ZFHewUHbp2Omcx23r8iQaO676c+kJvP39tkjq0UTHfbgVFMR6My7s/4Q
 o4uVrVBhlfNUlBEghyOX+c7S08+IP7YdebFVj3ahKqfpqOS/mePhWLFjOqTh3eoDLzNJ
 5VH8xEc3/HunB7LhORndoUEZf4+DDEBbybhnSCmYEo6WhHbpxhF89rc7iblirntUtLaG
 qsqYfrSG2t0uJCKagtt2d3rgX1dla4qOC1xmqqf+KYsffoveXQiy2DrF80ezUfdJTPDA
 vNdw==
X-Gm-Message-State: AOAM531Eu7NhwyL6+YFq4jbttDLkevfBYM082mdj0S/s1hD0JLALxl3R
 f+dGQ2hC6gzcgp4ihIhY9TX3iw==
X-Received: by 2002:a17:90a:1148:: with SMTP id
 d8mr13552157pje.106.1629057105029; 
 Sun, 15 Aug 2021 12:51:45 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q4sm2053283pjd.52.2021.08.15.12.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 12:51:44 -0700 (PDT)
Subject: Re: [PATCH for-6.2 1/7] linux-user/aarch64: Set siginfo_t addr field
 for SIGTRAP signals
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c6e41f4-07ec-5a62-9659-d5dc51a40c52@linaro.org>
Date: Sun, 15 Aug 2021 09:51:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZBHCZAYRDLp

On 8/13/21 3:18 AM, Peter Maydell wrote:
> When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
> to the PC where the breakpoint/singlestep trap occurred; this is
> what the kernel does for this signal for this architecture.
> 
> Fixes: Coverity 1459154
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/aarch64/cpu_loop.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
