Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D01C79F9F
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 19:53:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4kow-0002DD-GZ; Thu, 10 Sep 2026 15:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kiu-0000aB-Tl
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:46:23 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kin-0000AW-FX
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:46:14 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-39b2ad83dc6so141849a91.0
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789069563; x=1789674363; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qPjGqh7QnLkA+QIiyw56KkV6COKMVipXPRepfXjAIPM=;
 b=hUQyj9VFRsupFGX2l2j8gi53f3HLzTd8gHOEGv9os6F4EuEaV4MUmgOKRZj4KfL6Xn
 8U/SvDmA7nMKjrtZ8eFcGCnpVffN9ppbMUP0xZSIWJwnZI2zXOIavRga3PT0glV0QLuk
 p9OdWd1DBWbOxALiZVf4rFL4q86MyY6d9UE4bpwNQbdcggrs4smmL6iSqZtbsuoIfGZK
 m+Sf5ikeWLpQ2lc8ThYuLYB5YcgJOH+i412nB8/pr0szLudUAxP9ulWgQKbfeQlTrmdL
 OqHBtU0xUpeOFA+5UilXAmpTzFw9lHyzVcU8zrNtD8KXn0m0XgjtNIUC79arSlFx0Yv+
 yQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789069563; x=1789674363;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qPjGqh7QnLkA+QIiyw56KkV6COKMVipXPRepfXjAIPM=;
 b=H2fPsV1AxPChDcFTFnf+d5gv5i/ruRlGbLNVng9zoBMR14JSy8t2eAjJEGLxrqvvp+
 iB3gpOR46YWyPNE3LY5gsHJhURdf031KDRTUDVKJ+Bj/g5QQWg6yf3UzY7pVGzGAuNK3
 3+sbXBbRpqDEl5Be+wDEeBkG5hJzNiIwhXDPxesy23q+vjjZlrjIbTuVso6zG3yr38Ba
 BkLEl78KqfJ355tvtRrHY4cBQB/+nbFMoIFCuA6ZMAQdrK2+RdyLkc233oK12aUGW9xN
 Eh9TWfxgq0fJtoM5OI+PpHqHLPO1HNPhwBLe4+yFB2WT6q15KWtMmv/mhSJtp1KJYywO
 6e7A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkPgsGrOH6GhHChsmlj9c4ZV1D+HN4Uow64gHuPsuzAC3kKKLDaJ5es1ycumWNtjM3fGgyUvodkw==@nongnu.org
X-Gm-Message-State: AFuF++n6ToWyR5DchOnLZhAkWl/U+alqd2VA7Hsr5/A1BAhA3hiXIbUm
 5XT7Vrh6ob8auwAoIB2a1p6WG8gVsi4VTdgPPC0lxj5xBMbJng65WzOgCuHEKhs/P/M=
X-Gm-Gg: AYBFou1n+dyQ2Uw+kTddyJVy2wJZbhITMcD7UUDXrtZoIcbWl8jZ82PNB8o5zrs1ojp
 avM/45pG/znZYa+E4EMz3WDU/PXxX6DenSym9tcczbpj5pfj8p3ZyOIXmSsPuu4sLL7JwsREYgR
 CULi7epTNaNSsC8oOdFizinky2VlYCGy58QkZBoL6C/og+261TPgOcHL5fleEULNxW+FkMtPcWD
 L37tf0c2fkhGW+f69kVPSjpJRkWo5blGLkp/n3nqw4ox3vVtekpWpZDo072x3BqUKAysu4WZW13
 ysQy78iwZrbUjNEBQ0oN4Q+bFiNeEvjjqYsNKfeccaUR++SNlZ1vFUSt/uHTFKSwyVvJrbfnhZH
 JxkZ22r/SvhAvYXHiXZ6Io5e8ylzs0VUqox8JfxybjnMfs2nKOmFR3e7rIxV2kEqjHGyTc0EMkp
 /Ei/6ExMTGdGvR+SloOjC+mbYQeEzcZ576UKjJ6rhh82QYqdy8IF0CRbLoKJY7yAiyZlaYdizYA
 YmknUM2wyyqfmY=
X-Received: by 2002:a17:90b:3dcd:b0:399:ea1:5a82 with SMTP id
 98e67ed59e1d1-39d9bc66ab9mr546457a91.3.1789069562822; 
 Thu, 10 Sep 2026 12:46:02 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4ed295esm311367eec.15.2026.09.10.12.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 12:46:02 -0700 (PDT)
Message-ID: <4a0b16c5-862a-44d0-9ce9-248bd7eb1ffc@linaro.org>
Date: Thu, 10 Sep 2026 09:45:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/21] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
 <20260901095229.72018-14-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260901095229.72018-14-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/31/26 23:52, Philippe Mathieu-Daudé wrote:
> Add the const qualifier to CPUMIPSState when
> the argument is accessed without modification.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/mips/cpu.h      |  8 ++++----
>   target/mips/internal.h | 10 +++++-----
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

