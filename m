Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FA5FAD3EC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:29:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFjp4-0004X0-J3; Wed, 22 Apr 2026 22:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjoz-0004Vy-PC
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:29:43 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjow-0002RE-2g
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:29:40 -0400
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-8eae9229110so630861685a.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776911376; x=1777516176; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WJl5uIGeubjw5eMBBcZrVzTYzOteaPmJsuft1HJPUic=;
 b=Af/z59aYRbWXLTO+nhnR5/vzs3GK4Cd2ZchnJtlI8UHOIdSkVLKDoez5HmDbDhnuSI
 jjlF2mKVe78SpOzWSyWfDZoYUpppM/x0HHs02i9xUh1K50WLQms8jh/+M8FCFTJLBsLw
 p25iBmn1AkWgasn6vUbFXBXSIlI52Kc7Ag3gTEgJ9yA53dFVFt7UD7ZNLYCWYB0ph0ie
 5fvv2s8jTpTbrHgUORDPGKF2ouv8e2SlRig0UbXCpsmUFrsQj/K+Bou1z2xDGI7JgL++
 /xS6UTi1GsePGBwgrBROHVs1RPaGbc2RjCghBWzW881AV4kGKZwBNty2IJ/tVEcN0TFn
 ppcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776911376; x=1777516176;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WJl5uIGeubjw5eMBBcZrVzTYzOteaPmJsuft1HJPUic=;
 b=KnlF94OG6euMKDATY8iUB+wtjk2DeJDfQRv4cRFNcp9RKbATDj1u2RuyPz2yos4HKJ
 DpSd/eb5AQeC7L7QuZlg23ReFH1eKCRW1af4sW8cXfPYPUFWd4KEwQQyPefbZF8oJcI4
 PwzqZ2Bks/XRhJJLbgBOuWQdaw5i/upxoxJGIhk8Zy7UK8ogztffNJ7P0hMiENsAcpK1
 fKqz0J+eocCkXzKKs/YKstfZHobmfV6G6EjQb35MBp72MREvWAJBSIOa2I/k+U6PIyqm
 FaA5jsl0C9mdIFPoKLA7qc2np9HISpp03n2ojXI/yGejHcnJxejS8K455DwCx2dj8O3o
 5iDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nYHCQGz2ZcGrfNhEmUc9I/n6GYLtbF5k4pRwKYK91o9u6awnObEWhxugfG0HfSHFwZo422NlTKw==@nongnu.org
X-Gm-Message-State: AOJu0YyDjefq1w/p7RpK6dJJ2J0sJraTMuA+RuBksH7NVSc7Xrdev7zM
 zlHFFGCpQswoWJYzKyVu9gcQ8louaDUJ7WefWR0Wajz+PS4JuzUJzJd5vvxjL7T1Q4U=
X-Gm-Gg: AeBDies6GE/h94fM38G0ZrrwLRQhL9npL+fCyWelRsDSrMA6/xl7wO6esauBZAPPgc1
 JS1hD2xnGglGduFoM3gKsB9+Egq5Y/219oUK09P1NVteoMM+3XlqHINbTGRuo7TqGASsLB2Gh8T
 351xRCKJfucQM2b4s0dtXAnzxFou7ZTYJTFoo8sG3KMob40xd1m/6Sn9is/oEFbEEA6RrP8fG8i
 VEZLqRSxAL5MCncYKeZ9YzxOPLjBszpxNi9kccgW+5p0XEjY5Wus4lMTNpQoBE8VZ0dPV/koD4h
 P76XghGhXd9GrdB0DbdD8IlndNLy9j5CUNVGeF/rJ60a0gWq0XfbdTZZjNhUvMGDDuyA4OeOBJt
 N1iQ6TWajckK9srXq3AFO9f92FjnAUgn3ll4XrV3AxaQrzs3uFrtYD/wLiPPkspq22CbZfZeiHE
 7yoQHNL4hsnF4Q6W4o82fkmbfxQBglnrRVzEBt5MNJJJN6VnhasZB/N+AU0ZTTm+xOnW6yXjzv2
 +PU6CnyLGyUsDxV651fVoQR0tbptv1mSgxjenI=
X-Received: by 2002:a05:620a:2a08:b0:8ee:54a3:ba2b with SMTP id
 af79cd13be357-8ee54a3c105mr1438776285a.47.1776911376398; 
 Wed, 22 Apr 2026 19:29:36 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ee585e9fcdsm622228085a.16.2026.04.22.19.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:29:36 -0700 (PDT)
Message-ID: <a518ef56-b11b-494e-a6ac-39acafc3d331@linaro.org>
Date: Thu, 23 Apr 2026 12:29:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] target/s390x: Make get_phys_page_debug handle
 non-page-aligned addrs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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

On 4/18/26 03:30, Peter Maydell wrote:
> Currently our implementations ofSysemuCPUOps::get_phys_page_debug
> andSysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
> non-page-aligned virtual address and returns the corresponding
> non-page-aligned physical address" and "only returns a page-aligned
> physical address".  This is awkward for callsites, which in practice
> all want the physical address for an arbitrary virtual address and
> have to work around the possibility of getting a page-aligned
> address, and it doesn't account for protection being possibly on a
> sub-page-sized granularity.  We want to standardize on the
> implementation having to handle non-page-aligned addresses.
> 
> s390x already has an implementation of "give me the actual physical
> address, not rounded down", in s390_get_phys_addr_debug(), so we can
> use this for theSysemuCPUOps::get_phys_page_debug method, and merge
> the s390_cpu_get_phys_page_debug() function into
> s390_get_phys_addr_debug() which is now its only caller.
> 
> This leaves the function implementing the method with a name
> that doesn't match the method name, but we will fix that shortly
> by renaming the method to *_addr_* for all targets.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/s390x/cpu-system.c     |  2 +-
>   target/s390x/helper.c         | 20 +++++---------------
>   target/s390x/s390x-internal.h |  1 -
>   3 files changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

