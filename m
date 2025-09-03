Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF1DCA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmet-0000bg-Um; Wed, 03 Sep 2025 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmeh-0000XN-CV
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:32:10 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmed-0002Kb-K4
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:32:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso9800108a12.3
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756902717; x=1757507517; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QkGNhaavMYjz7UsHtnl5vmsVCeeBUAF/p6qVuFMYOBY=;
 b=yoOekAXyN+LHxRw+Gg8LwKLGpFHAr6fYcqlAkr0wLCimUxyWYFVDC3ccGa1J9kj6q+
 anyP/f1L6G+txSIuz7EmVrRzz4ssI2rOxhpAvA8YaACPFhtVKXgm4IvgofZfOjd9cAyX
 4YIvdNiqx5oUnZyMx1fOn5QyTz68J0r/7YnwqeVhF04Reoe+Qu6GlAdwnpC7CRihsEH3
 1tPcTnIxN4hj8DLZR7dxU4pY5hcbHzaVQ2fhtTODCYhKyVw82ylaJKtY/rCSUEnLKzTa
 DfFkDsUsiwouZsZz29Hts9zZX9SPokXmn+VwVvMuPsLaZP64ospjExp2/sg7WCVBbarh
 5QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902717; x=1757507517;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QkGNhaavMYjz7UsHtnl5vmsVCeeBUAF/p6qVuFMYOBY=;
 b=C21mva/LA0OEtOR3bKdl6ZqpeewptJ5iBIc416ZkcpeHSFMm2kltmR8cyYwjPANcHu
 +rkjJE+ADkNviazJMEPDqe+gBFGFLh6sfI5bdUu0q5arB7oi6B1l4q2aLeTGwnViuZi6
 qau25qbalLJz2YRL7zqeQr+qc6jjvSYnjekimVeP0YWRwDjO4MrWiDxpncvdKBwKM2Hh
 XI0fGzgG39JAvZpWJiHUwiWvv+OKWry0Z2fFyRTji77y7nxL1CSeh7vpWwjJ2EjSoRPq
 VxqE9IiC73xjmcO8FoIi/7IUwdqPZI9hJeBpqrDJQvvayCJ/bpWMHCpuoDHt6XCrMEnE
 YnyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8WyBI4Nr5gytndOMd2/CCZ9fQ4Tidca+tcrlt80UVr4nbcfbuNUwMoUq5q+vDsC7Amvqtbxk/4A==@nongnu.org
X-Gm-Message-State: AOJu0Yx0bjOxab8JFPB0BoBRNosNDIsWPlNUKosXsm6L96AmYqVUt3BC
 QZmdc8m8hQop/jYLRe/BKLQVhZIpkElX1xC7TS9aXEjcKbuv0wHbwVMTT0Vvk1RN2j8=
X-Gm-Gg: ASbGncstrt0o3PpWtOCrge7lvj2kP7mkKPymQYMHfvK4LUqrBfV/20VG0rPUP8TrPL7
 TvYmgGQRxlDRViRzVHS129A3XOhbClJ8BRPPIaDk+Yh4Zb1XQrA9y52rd9c3kOMXCkf6y+3gCCY
 K1oXvSXqc7aKouL2zr4EJTvhKbqdQ3DPjV/0OfnhzBh2HayY8JkCmhrkG3WU/iWg3sSnfiwCdiA
 jMKfhNmGCwQUNCYsnnZkbQeMU31nXS+cH/mJFVsnDlYnZ1ZNifZZa128+cQ2V4DuC9CX8LmaD2B
 ZnVeeQfRK/PPyBKwr2AgCME32oopibZeheRhBb3F/lR8bvdx+pOo2Y/YhB1HtDGyC+VhBCK73cI
 eMrIfbh+QQLQqCb69xjVs9kc1wXG+glOOG9LwRnC+cgKRSWqTL+INmv2iRDtfsCI9NTa7y9NIu2
 DzVCRDXA==
X-Google-Smtp-Source: AGHT+IHY5svnQWkQk08KMVwPb/m5FH9iRcjKkI0JnwdAD8kBZ9GMhj6OMl3cpThmzXyPzWHuMg5yDw==
X-Received: by 2002:a05:6402:2547:b0:61d:1188:42d2 with SMTP id
 4fb4d7f45d1cf-61d26da5e53mr13897656a12.28.1756902716701; 
 Wed, 03 Sep 2025 05:31:56 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c77d0sm12002829a12.11.2025.09.03.05.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:31:56 -0700 (PDT)
Message-ID: <5516c865-2315-494d-9bf2-ad7b50f5289b@linaro.org>
Date: Wed, 3 Sep 2025 14:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] target/arm/hvf: Mention flush_cpu_state() must run
 on vCPU thread
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> Since flush_cpu_state() calls hvf_arch_put_registers(),
> which must run on a vCPU, it also must. Mention it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 21002f419f5..58934953c4a 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -814,6 +814,7 @@ int hvf_arch_put_registers(CPUState *cpu)
>       return 0;
>   }
>   
> +/* Must be called by the owning thread */
>   static void flush_cpu_state(CPUState *cpu)
>   {
>       if (cpu->vcpu_dirty) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

