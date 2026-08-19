Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E04C5B572
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 15:19:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwi4O-00031m-0Q; Wed, 19 Aug 2026 11:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwi4N-000313-0W
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:19:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwi4L-0004CQ-Ep
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 11:19:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cacf197759so15101545ad.2
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787152748; x=1787757548; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sxzs1t9yRoICMuR7HK4W1njfP3UiQZfFk0xiXq/K1Js=;
 b=QqrxIhIE0Nm+B49eYgRFmrLZNLHA1inGEMcL3xK1HgtLTObS+M1Zmzh4XG9TGd8qDP
 RMSxKeztkdctRfcW+/207dugc1uXLAAjZNkhAg4V2zeIW8UUpc1X+8i3WI4tJvfKu2P5
 A8A7CwYGN6l2vL/+k+XhGEj7C3mo9+usLnrqXtlgq5ZFIsDmKRgZb2dpkxBhW9PEq2qd
 8Gb4K/dTTAcWlDtIA08op08eVgSE+k+kWSq/JUqDir2VXisOr0u5tcOHXiZMh1DtYrZF
 0bHSYOFYPZrd4Kmcgw+o8YFJtM+QSsH/8R87G/3YdelULQHyhNYwjeOtD5QqcLyxezgb
 Sr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787152748; x=1787757548;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=sxzs1t9yRoICMuR7HK4W1njfP3UiQZfFk0xiXq/K1Js=;
 b=rnQp+8Flfa6Srm69dcFPQErHs3URiv4HSrSYbbXj5uSBiBcpETgxGQI4+quXpZkie3
 Vs4KW6dA7wv9OHS1ocW5xfGy3wg5eaiR0TfHOx1U7eEgOgNmL9i8NduoG/t05yg0XneP
 wpRssoA/9K9y6DG0TP9wDqDhtuTdAI1z/qpoEdKrSG9tbDjX8wTYlKQ9vtTJqO7NvOeJ
 NrrexTYjjaz4J6hkQpa0Ue044vAABe7655c1BIKKu5gZLQ1bX17yXt3ARRJUhAZOrz8Y
 qn/7bpNaJRmI+j1150KucxZiUGCKTfyyEea5J/BFWDRgBI/L7kKso8F83ZzEXe874fMG
 ZiWA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrMjqQkZhJ44lLhph5bhGncSERtT8sm1Dj6ovs0NLQA3xZ7FaTggPzbmWqssWZKzZOwgsMukvV8UA==@nongnu.org
X-Gm-Message-State: AFuF++mUWRjpASXJ54hbXK8nnAMeP2UR2s9tFQx16YzAukZBr7fFW/Fn
 ufakUMZkm+1aZY+qWe6cnYcMAmwpUoK0xlMEtP5Fm2pnOD+2egftojDStZxGfCXHEwErsiWKX0G
 ZdAhQrG4=
X-Gm-Gg: AR+sD10OQ+n3rT3XQR00NevrxxWgXzFowWRM+5+RCLD2be3gxJUVmP67tJkriFi3ZFy
 7QrLq3M1tra8TMek4Nq+ivb7FnUxjJzsKwlWSFYqb6tDDPJ+rdo1K2pIIZkRZiFcIPsOF1eIMLv
 t4K8DZpgB63bzkZ61MhTITQ9n7aIO8F4+bn9/bmt3eclw8gdCKb0HPy6Vzro4Bz5sIkITDFM1l1
 B53CFU57i+OYbcQkPRKE7v9I3L7XcLjMkQr/egFfvIXf7cCll+pH5zlAr1UeRQkVRGJy9Uocc3A
 +Wsyu8ibxuL59JfDdZmV74iYeSgOvrgQj3g6LQicYxFAYfBK4Q75SbuhjPTA70d2i2FvbZx1Gfh
 GHLwv/HGMnxzPbhm9qYcdO9XAOlTvcVzSbsuKD3C5uWVJnZuqb1+P5LP/nsHquuThtcJj/vDmjQ
 PastqKZEI2/mWKk361Ujwvb6XG3po2b5wQZ2kgV6P+5EBVPjZDUta7BE2IOBXVbeDGA4PbACpHO
 DvDnJKFjVa6gQ==
X-Received: by 2002:a17:903:350c:b0:2cc:aa36:c046 with SMTP id
 d9443c01a7336-2d601a8e888mr104703995ad.14.1787152747713; 
 Wed, 19 Aug 2026 08:19:07 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5c1f00b27sm25269335ad.83.2026.08.19.08.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:19:06 -0700 (PDT)
Message-ID: <c9941ab8-8af6-4010-9572-23e19f77e461@linaro.org>
Date: Wed, 19 Aug 2026 08:19:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] target/arm: Implement CPACR.D32DIS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260817123838.1578060-1-peter.maydell@linaro.org>
 <20260817123838.1578060-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260817123838.1578060-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 8/17/26 05:38, Peter Maydell wrote:
> On some v7A CPUs, CPACR.D32DIS is a bit allowing the guest to make
> VFP instructions that touch registers D16..D31 UNDEF.  Whether the
> CPU implements this or not is IMPDEF, and the only two CPUs we
> implement which have this are the Cortex-A7 and Cortex-A9.  In v8A
> the bit is no longer defined at all.
> 
> Since the only kind of trapping that needs to be done is a simple
> UNDEF, this is straightforward enough to implement.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/1499
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h               |  4 ++++
>   target/arm/helper.c            | 19 ++++++++++++++++---
>   target/arm/tcg/cpu32.c         |  2 ++
>   target/arm/tcg/hflags.c        | 20 ++++++++++++++++++++
>   target/arm/tcg/translate-vfp.c |  7 ++-----
>   target/arm/tcg/translate.c     |  6 ++++++
>   target/arm/tcg/translate.h     |  1 +
>   7 files changed, 51 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

