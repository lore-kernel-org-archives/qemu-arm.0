Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C59FC83F34
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 22:13:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uctKE-0004Re-CU; Fri, 18 Jul 2025 18:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsjE-0008FM-W5
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:34:53 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ucsjC-00051K-LO
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 17:34:51 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-73972a54919so2643089b3a.3
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752874488; x=1753479288; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lDK8BMSxoa1iZ3EfA/s5tzZ9b0JEgVHWkas8sQGa8QU=;
 b=GBy7Q5wMLS8jdXhkXXiZ1w4jOuO7A6Kl+XoEuyThKx9WJ8Rxdnhc5ga+2oicmIigAK
 DNjMJRQpu2b/59XE5N0/mHbHsO99tosoJtG2zeBUteCklrya//EO+l/U7AKJ6vSM/zJO
 D/pzYna8AtupKC+qtXysQAfIcTaZsOV4R7vCIPMBgtd34ruzAJKKgZSHIHFwezs4nEvl
 SNoT7p3ZGkeOoalJnCJvoAhfDTwe8pPW758Ydoh+/c6cARlI4DuZlGwtAXjFTPuBuxV4
 F15h9puTU7AnhYmjhyAqI8lEHUhYhpsAnqFg/aNq2EKnVY1io+n30xQdVEDS6nl8a3dI
 2grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752874488; x=1753479288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lDK8BMSxoa1iZ3EfA/s5tzZ9b0JEgVHWkas8sQGa8QU=;
 b=ugMrSo26zwuYRnVZlHj1jwCn5lBxsD06+GIRoBk83Lsy3iBTqDZR6vQHWfDXnJhSB4
 7i6rBJ6BIRuzIEUlcDdzpCfiz6bJo2XngTXP14TqM62FKhw+fmpZ4vcdDDB/Yi9D7R/I
 QCmQPdVXdKDVSxcg2+VeU+RBP3Fl6aIaFuW9pTYR+epv7FbGGnw5DvUl+qg3vNZ0W0j7
 DlV2EE5ORbJquJ+JFMWliRzOI3zL9/BYuZ5t9aQ4jYaxPBMrQXV0mRWxGM8cdxshgN22
 B3CcrRUzyrdnCCSfeeVW0S9pIPEJvfA5bheS46CDh1FAgKPK/YYhraWvWYneAD/AfxuK
 z31g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhn/K9dOAdJFiMTG3AXHOjPLIlihz4ok8vLQ8Vc7FIIB499ZL64RNMThHKaTgB1R5icjMns+HNwg==@nongnu.org
X-Gm-Message-State: AOJu0YxLEwdrmfeklqQrhwjgAl6jsJ+4vw4DKs+yw6w3wuia//6IIT+2
 Ksi1bmOJzwW8rTZZjHE2q3qfN3iC1bKQriK/N+j8VPVT08SgUNIWC58ZzZMgPOeJXPM=
X-Gm-Gg: ASbGncvhHN6OaiLVBabrOX7qsMh+IeyC1qsnnOQUCnMdPobGkD3oJQwEjdJ4Wa8Q0Mt
 guqR8AgIZ1m95ZvClOxCwqOpbN+nrdvJFMPHsDfWXOiuCB/513a7gHH6knsZV2K4KQXaTcz/Crb
 nVgd1PXjQfopaSWVNqooBP7HUI04ear2M6xEH0Ai2zKhqRbsVuwunhiXtFBzNlk8gg2QEvAAFYN
 jjZ4ONsof9uvvETRG7pzq0IhfjWAySPLou5RhnftqK9rsOjH1WJwIgYKVn5uDgY6R7FgrLDeKNl
 cb2yTmJ/Vl3NiTzxaUZye4cP5Vl5oYlGlI2aew+a2pTZxm3oDP3nv+qOlmOmX40Sp7pc+Hb9/rN
 KFAIo+2F9ZPUgSK+tdkBHESvB3oXWQcimWBxKssQFlA==
X-Google-Smtp-Source: AGHT+IFtMiePl2AMdNmNIWaMAwbyGbaHmBkHovL3w/+keJiutxV1rm3AZGNZcZLjlL0C8NivMs5oDA==
X-Received: by 2002:a05:6a21:a344:b0:220:10e5:825d with SMTP id
 adf61e73a8af0-23810e50fe4mr18750881637.8.1752874487666; 
 Fri, 18 Jul 2025 14:34:47 -0700 (PDT)
Received: from [192.168.101.134] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb76d69csm1769135b3a.102.2025.07.18.14.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 14:34:47 -0700 (PDT)
Message-ID: <b1677ce1-637f-439f-b52d-ddf53d32d79c@linaro.org>
Date: Fri, 18 Jul 2025 14:34:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 03/10] target/arm: Add BFMIN, BFMAX (predicated)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
 <20250718173032.2498900-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250718173032.2498900-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 7/18/25 10:30, Peter Maydell wrote:
> FEAT_SVE_B16B16 adds bfloat16 versions of the SVE floating point
> (predicated) instructions, which are encoded via sz=0b00.  Add the
> BFMAX and BFMIN insns.  These have separate behaviour for AH=1 and
> AH=0; we have already implemented the AH=1 helper for the SME2
> versions of these insns.
> 
> Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/helper-sve.h    |  8 ++++++++
>   target/arm/tcg/sve_helper.c    |  4 ++++
>   target/arm/tcg/translate-sve.c | 17 +++++++++++++++--
>   3 files changed, 27 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

