Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD3CCA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:17:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliJY-0000NN-LW; Tue, 12 Aug 2025 02:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliID-0007AX-Hl
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:15:32 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliHz-0004qI-PE
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:15:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so32404065e9.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979311; x=1755584111; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V0JWJo4SViWKiNN4xpgB6DcEPuM227grV2fn8SaUMjE=;
 b=S8G90bOz5Naoih28DHSyApdcEYZchZFbiSVmGMTsUkF0QC45Rx9xXp/HQIiTrgNWfM
 fvohR3e6fStmRigNPc8pbsvpWjQl2dxriibEWKEaLBPDuJ3shQuE2LaM1PLug7GI55oM
 zQoFGxZ5C6q/zi7OurcJdJu2OuzwSaDJ5idc2asAUZWrmao/uiCDnF5pB85kVR2Rgfo6
 I+LX/Qs20Wip+q8oF2i4GYX1AVGv0qnXhXiD2lrT88fxoZpitl1WRYAU0juDW+oCWcqV
 Mj+yW1UYEFdQA0AlJGGQRFSUd3WfQ2b9ObYOLFSnDv/AgUDivhdJRXedYrH2CNxmMKxl
 wd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979311; x=1755584111;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V0JWJo4SViWKiNN4xpgB6DcEPuM227grV2fn8SaUMjE=;
 b=X7uXKhzamSAAPjCm7sghDR5mCIrB83zcC37VSTfqWhzcKAYJkExqqx8MjdZKIvhY4u
 g6UvXRB7CYc3BXOjLYpucZ2hJgu8wl6J5/ai2eHDpCPWTrZj3yzPkRvOkXyfJ80kOzQM
 5veIJIKkYtBcjK5+uupl3dHhG86eE2vXSYFwGpF0ybEkcbyJpgNIu6OoAS7mv5iftmM2
 2JuWXtLmC8nXq2OnTwaYV5WadYJkHZk89pBlXMvjHobTpDHyrCnwqnauFUx36MQ/b0DH
 Ng6tsdASJumZtj4G4Q5695AGO8LcjPGIRJJZiGxUo5cLkvlOXA9bZgpi+30bRIRHo1J7
 q1+A==
X-Gm-Message-State: AOJu0Yxop18VPjUVbM58kg7m6YcQt86EpnFgnanCrAYALrmDR3jlBLU2
 uTKYJa1FE3MUNJ/3E8xk+bn3iZJTBDLS7/L8asI0k4a5EbvNrVZj6L/gTAJDE9kga8U=
X-Gm-Gg: ASbGncsiRcSd/IS1zK+2J+H9yx1cowVyGSb6NEAwJj/0jy+Fwk42TCAQKTp6JKVZWwz
 Cnt50Zf5MIs/JNcJg1kPuNEIF8ePiZSO74cU7vkaeQ/K1/rOGerJ8dKq2glm/5PzuwpXTJWpGxy
 ndXoBA69xRDelnaspI/pQ0zZteL7Qz29gsdM1nNFhAqQdm6v8PQ+UXM1j4e3ssYJacbKqyQYTUV
 Er4W2uO1c4Ftm5C7nHkpTgzT13dwEt/PzeKVWtO26XEoToHvRMxdujP6j0b8eXCojq/bnQtD8CL
 RD8UhFXdhZ3zU9/lBXaNgqhpjomrJkZVLFxAmdp05Bzd7cGCyYjlZKWdEzv0orp3qSOAtLwO57S
 yDESslri5qCv+LfOjOvUKmBb6hSWxO4P11FPCXQK3+2ZjiV8Xlm9HY3QVCBEWBDKH6dv1jVS9SV
 tN
X-Google-Smtp-Source: AGHT+IEmNnTSeDRGyBgZ8nzzJWc7uU76DgAU1NSkvej99Qvkyh42uKe3L/BPeh4NEacw0iJUSzfJ0Q==
X-Received: by 2002:a05:600c:1d06:b0:456:18f3:b951 with SMTP id
 5b1f17b1804b1-45a10bb735fmr22234505e9.15.1754979310973; 
 Mon, 11 Aug 2025 23:15:10 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5852e28sm277918505e9.9.2025.08.11.23.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:15:10 -0700 (PDT)
Message-ID: <68275a88-edbc-4e54-9a8f-0d99d1234ed0@linaro.org>
Date: Tue, 12 Aug 2025 08:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/85] target/arm: Remove unused env argument from
 regime_el
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-35-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 3/8/25 01:29, Richard Henderson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h      |  8 ++++----
>   target/arm/helper.c         |  2 +-
>   target/arm/ptw.c            | 34 +++++++++++++++++-----------------
>   target/arm/tcg/mte_helper.c |  2 +-
>   4 files changed, 23 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


