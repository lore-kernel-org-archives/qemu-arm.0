Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3186063ejc;
        Mon, 28 Aug 2023 11:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXkkYZPJXHVJ1IQIR5UGD115uQz+t7m5W9EoRIt2n2smduS67xrjBSX2e9AsJG+nVGtIc6
X-Received: by 2002:a05:622a:1c2:b0:410:888d:e11b with SMTP id t2-20020a05622a01c200b00410888de11bmr31769229qtw.25.1693247883179;
        Mon, 28 Aug 2023 11:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693247883; cv=none;
        d=google.com; s=arc-20160816;
        b=k2Sx/rCt6BPHaFMOnafWSlX9ZX7lKu7wEWJeTQq68XyvDjHtdBxubNr7+hd4w6INsa
         nbeUOh0kaZcgwmjwWw5JO8CKbxT7mz0rzkE+710yhRoFL9y1XzXEJscdNvilMS3aaBEs
         GpgJhxpcFLG4amHZFcmGOCuUYFOm15q9z1OnVK5BTW8wrPUh22fo5zxb+1gELAsa5iXA
         jEEw6Q0qmZ1c8MGVpaSJplAOmOTqU5hiSLhlS2u1rv6Dsp8eino4Ri3l2dEnyb6M8c1Y
         HB6Vux3VQlfPsOMhxAfvlWEXxcisg9FDMead3A7IwkZ54CnZHvZWtMuyr0aiwAlR7X/x
         Lj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gJdLD+RpTgBuOMUPAXd1WSCYUi9xdb5K+pOHEHxt+Ds=;
        fh=vc+nqmKDbTj+9KCVcVasbHFTqitsy/RlC8F/3ZcIIWE=;
        b=bbigt1LUhdXQSrqdK1UUeqFVEB24ErkLPV4k+nhPnAnm0PZ79oZmbN1dvv8VNGsU9u
         bJhzxkV7ZE0aJR68MlyAPq1aTNayYFjXLJQ4T7ppvAt+F20WNVCk7eFttCTHydKqBvAK
         ckKsZyvcBS4j/Vx4ZNayKdztNQJS2aaikeNYEZfFQw4vFodwwozI2hZE2mKy2lG0iFmA
         RQljiNel+0j8wQZTW4buLTeSKfp3nKqY44F1UC3LMHuafbG0wlUMZuc8phxUmrQxVjLy
         EuX9Uw3sK28iAuPKcxkBS6MN9oJf4mOAGJ67TM/qfNc/r3SRXvXGEF1OFjORS/qZrb31
         3Pnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fPczZGF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020ac85fca000000b003f9bd68a453si5143475qta.791.2023.08.28.11.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 11:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fPczZGF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qah7e-00032L-KD; Mon, 28 Aug 2023 14:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah7b-0002uJ-Qi
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:37:55 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qah7Z-0007OS-Kq
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 14:37:55 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68c3b9f83f4so1665903b3a.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693247872; x=1693852672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJdLD+RpTgBuOMUPAXd1WSCYUi9xdb5K+pOHEHxt+Ds=;
 b=fPczZGF/PaC/ueYiKyRVZadTHhC1paswHzF9gzK7hm+R/KQ6u42UGLlH5m2Sc1al2Q
 haGbv558bT6u+ukF6pM/butdBsZM+wdaIQZ8dmNjujnNPYu1hopYcjsW10aOkGnTcJGQ
 WMcwSIZMDjczaciwqXFGNx13n/j7DvRQCTlACn4WMV7kVnX7l3GTQUunxIdVSTAvPK5j
 FtRFBBNMvKL6fQAr12TXf9aSJeJevnVLbwT7Ehp8fJUe/urCI8nj8/vDWPQsMXJ8gO50
 XiNEMkxMt4i4KmKlC5jdtrRozC+gHdP+BW36hvYuN+049KDFizHFGM5E4plBCpKKiUOV
 sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693247872; x=1693852672;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJdLD+RpTgBuOMUPAXd1WSCYUi9xdb5K+pOHEHxt+Ds=;
 b=DYXqGGn71w4oVCpaXSvhVqwA2P5tgdrojOMeAXgtrTcOIlcGDOd40+8DBphvVNkldr
 TthVenLTFjG9XP4hpP6XBSgzulH9iaG9WlACouPULP5DZzCqsYIpsPOlrjAjg38rbOVI
 D+CAJYFEM/4Jqohpg2NjQN0PaLG4PXKey7dPj1phuLKP8V/iNQyNS6E2i6xLn4ej76S8
 ORMAHq5OcIkHW43ToicmZKbP1+HbCgpGIUEw8U5aiIQ+cAhMn0UBYfq1C3S0znJilNL1
 6+vFHIb8n+TL2qnjEff3k4Ka/sQGZv9aamU9GyfRzik5TIzHzIJQLSc0gi3cZoUBNP4x
 U7RQ==
X-Gm-Message-State: AOJu0YwRu16eY8GpYuDtpQHYgKRp4Vx2nr0fDsklyR4E21jedBvVwR6V
 fk/ZXEf6zfN5IRoPC0P6cI+k9Q==
X-Received: by 2002:a05:6a20:12c9:b0:13b:9d80:673d with SMTP id
 v9-20020a056a2012c900b0013b9d80673dmr28106825pzg.48.1693247872097; 
 Mon, 28 Aug 2023 11:37:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a62e516000000b0067ab572c72fsm6998539pff.84.2023.08.28.11.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 11:37:51 -0700 (PDT)
Message-ID: <46aa69c2-d52e-af01-b9ea-63ddc0787a89@linaro.org>
Date: Mon, 28 Aug 2023 11:37:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] target/helpers: Remove unnecessary 'exec/cpu_ldst.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230828145545.81165-1-philmd@linaro.org>
 <20230828145545.81165-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828145545.81165-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: H5L0dtIIe4qA

On 8/28/23 07:55, Philippe Mathieu-Daudé wrote:
> These files don't use the CPU ld/st API, remove the unnecessary
> "exec/cpu_ldst.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/cris/op_helper.c              | 1 -
>   target/mips/tcg/fpu_helper.c         | 1 -
>   target/mips/tcg/sysemu/lcsr_helper.c | 1 -
>   target/s390x/tcg/excp_helper.c       | 1 -
>   target/s390x/tcg/fpu_helper.c        | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
