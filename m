Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D1FC83F1A
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 17:15:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ued3F-0000rv-9Z; Wed, 23 Jul 2025 13:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ued37-0000jt-Nu
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 13:14:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ued35-00062z-Fz
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 13:14:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3190fbe8536so61438a91.3
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753290873; x=1753895673; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kbRr8ZA2EjCUA6EE3b54G5lnVxCkG1fe3hlQb5DbJHg=;
 b=ECXhtfnB2X1nTgY148UdpMV6HB1wLwFN2ECHBKBlkC3JcKUBprkVhT7NrkqUgk1bNv
 e7binsfFL22sESKgG+Sh0XyvKD/dirGXQT8NDvi89KpcKhjH+C/urtWU6nYiNu/3iQKx
 PtjXl76/q6huG32O7WSP/ZQwVK1fpRxjXCbTXffFEzH0ZrAHcr33j0TyE7ArAxXV6iZh
 Wa9chjFTxKwQAZLJAMMj66Iot/4RnJzWXXoU0vEwZOZfTsi+eBIqc2pSoBvwTMJbsBMU
 6ugpJ7jm8n/qBQcLiB5TAUY36MdTB4MtptFz+/KfJXx5PYX4oVvinjZAgNbmEfvoUGk/
 DqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753290873; x=1753895673;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kbRr8ZA2EjCUA6EE3b54G5lnVxCkG1fe3hlQb5DbJHg=;
 b=Re1scRi8SeW4FmFJrkL3+ZHLy7wj4WdnZ+ekdd3lKALejHUi1ThrhR9RnFsmQZ/WGV
 TW55shHUlgrnluMz4rD+0IFhAUfH+Q0tba6qooSphgJz86Q/+KmWkjbnIganXy5I1nFi
 0CWPyBYtIirWdX17vVQUnfjAGETzHTN3rUxgX8WcyeBrkvUoR3FNZq7AMowVAA02aq+E
 9BjMleWQPiU9Jce/qgO2oyvbFv0OfKJQURSMyrpj33lFD/9D4ocMfC+mWdLWCkFnQkwX
 SJCM9N5Q5oT8IH3xqfLE6Y4IHw6eRCBsW6EYFBmf9YTXTWt4nSt5RnHrN+Mn2UlCtf4r
 /mAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn4lfIkOc4OeAKwrWtrcXinDMDZjhMmjhO5XZoXtONqvTQTg0uJliysDIvA3sP8ZkeVgVDxshJDw==@nongnu.org
X-Gm-Message-State: AOJu0YxNutw4/DtS1vaQAct99GES7M7Rs76cRMXgEVF/aOZXK+ltnsLp
 VWxHrHcPFa+sq8g5ngD5WSxmVq+FXRFgI2wLFFCbE8H6hWjZiUQvmfnO6Z01WgcPfa0=
X-Gm-Gg: ASbGncv0ZUW5tDs1Sg24C2tYyxba6bmyT3pV1tvv/TD31vS10SJIgZdZteYFxQR8D6y
 n/dckKvBCMBi96v4OyXFaizD6xIVsmn4VJxmz8ac+3pnMfAV5RkQnlMcItx7QpQOIZ9pZIm7IfC
 erVvO7tvpaswUEwVhVmllbW+U5JNKcSk7oYJOeHterVX1igMJxwPflUpBTwZXuX9KhYL0v4uane
 k/aN0M7i8wMbUo3+YAjiulkr+WmnXjtyFMlEq2gian6LftYhav+ioRTwgkuyVN2c7VanEXu78zR
 hPj+4vOZriemDd+MefmLHR+T0cC1vg8wilg3p0NUgI077oGq7vv0/LlcIUnb7XH735N1hS0CcLO
 iDI5mcAVudocn3p0EQ+cdtoAB9no/qZbSvnRbC36wJWfXYVk=
X-Google-Smtp-Source: AGHT+IEN5IQe0yPHBi9wCCAfm0Xz1F1Z2hqAOoHd9xzLbcyfhy792LLocp3YyT5kNWHLw66ew2XYvA==
X-Received: by 2002:a17:90b:3e89:b0:311:f99e:7f57 with SMTP id
 98e67ed59e1d1-31e5082ce7dmr5039272a91.23.1753290873410; 
 Wed, 23 Jul 2025 10:14:33 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e609617aasm26405a91.0.2025.07.23.10.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 10:14:33 -0700 (PDT)
Message-ID: <fe69fc88-ffca-41ae-a44f-0e68a407c205@linaro.org>
Date: Wed, 23 Jul 2025 10:14:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 5/6] target/arm: Pass correct esize to
 sve_st1_z() for LD1Q, ST1Q
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250723165458.3509150-1-peter.maydell@linaro.org>
 <20250723165458.3509150-6-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250723165458.3509150-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 7/23/25 09:54, Peter Maydell wrote:
> Our implementation of the helper functions for the LD1Q and ST1Q
> insns reused the existing DO_LD1_ZPZ_D and DO_ST1_ZPZ_D macros.  This
> passes the wrong esize (8, not 16) to sve_ldl_z().
> 
> Create new macros DO_LD1_ZPZ_Q and DO_ST1_ZPZ_Q which pass the
> correct esize, and use them for the LD1Q and ST1Q helpers.
> 
> Fixes: d2aa9a804ee ("target/arm: Implement LD1Q, ST1Q for SVE2p1")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/sve_helper.c | 36 ++++++++++++++++++++++++++++++++----
>   1 file changed, 32 insertions(+), 4 deletions(-)

Oops.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


