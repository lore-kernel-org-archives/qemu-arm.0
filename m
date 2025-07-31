Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBB8C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 20:24:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhZoU-00027C-OJ; Thu, 31 Jul 2025 16:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYHI-0006gw-GP
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:45:21 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYHG-0006ah-Kb
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:45:20 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b4233978326so485687a12.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 11:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753987517; x=1754592317; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pvy5z+5j/jMqX6Zslu0wVy82+5aTyBNotJkzDRoVQ34=;
 b=ZJOd5NJbXTmx3weDuXRJU0qcpTDI4IaxryjuhhY/K8m09hxXDnBwSXZ2AWqEn2b0dq
 av+9pDbDfkCYNqiDL/te5Lhkk+Q7N+wViLt1a2l37uVCBagPGLjaaTEKrZD/Z1wVc2QL
 Je9VWcAhMTm7rbEcJig/0hbx9FH75lxxOc3gdtkaUMgjIpy4VYY7HLGanY1FcFd/Bmvv
 ZUcZ2YfPaLnc3NnthnTe5Qpb4hIckLNPpBhRnOd65o5ZQq5RXiE3PH8vm06zrqfcjKMy
 BHjfqFRlPyjcKhTf1SMQxbVdRaxgLIPjpzai7lldV073V44dJfe8VoMoDxBdfCmEhV+/
 XeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753987517; x=1754592317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pvy5z+5j/jMqX6Zslu0wVy82+5aTyBNotJkzDRoVQ34=;
 b=nB8cEgQhfbqsQNhyNCbWVZPBe3s5ASvb8V7zHHFHiX4tvgdTPs8IDracFer/lkbDBH
 Q8yZy6m1VEL5pKQxXq/QyjNO1BDyX9fKXdGkMJGB4R+PkE5hZ018Ado1mmXGEkgoGP4v
 crMg+AIBGvBr8JIH398DM2T+0gIAS+Q5Ym527y9kwah4ZBRHRk13c37tSF4PMZ2Z8Y+c
 7SCr3W/RicyU6XAYmkrhUk1xWWxIabbhv/vhK7PKqFkV663fq3fcmPl97IjjvCnOt1t4
 H0mqyBnm3INQLaooFa4PwYRUY3zT3bVCOv3LhlXQvjB9U0ewYOYCaAAwsPgOexrfgUcm
 ljEQ==
X-Gm-Message-State: AOJu0Yw9/8uKuswVX3Zo6I4YHWzWFj/ci7rnJJX+nZdSZXE4VTT2Wr82
 2nzI2HKGX8KGsHGT0BnGeulqN05Oh+61lUOd3bVA7T9wxyRkvZp1osQ+4MP8GTt66/Y=
X-Gm-Gg: ASbGncvFT6EkE0IaBMM5QoJeFsLsDqUWROfGU+oz5km5k1+WwvPRGkh1Xa7EEUvPOiv
 LZnPLVl+gvesgqwEw8z0Jy4HiPN3H5w5d+2NbDnHE8fC5M8aZ20W3CrfCe9LO4d8dz1QWEZxgY7
 q1vDKtxSh4BkjcPQAtwOlvky4BWKIaOL5/2MNJrshe5bNFSX5C5dbaZGW4IvSGLyf+mFSzTT3A9
 YE0YBTsg0n5kRQFwbdDSqI1kZ+D50PpYzvrTFfiee3RqgRaNF73Pj87SF9edFZrPMibJwYvYchf
 dKk2zfm6rQdCpcn1pRUFujVgCBEBtFfwM87y8lgZ4oOtlvnZmU8PT+pGC/g9ZjA0JxsdufRFsyq
 Z54r/3STzbyEpXMURMCU9AXyNRZ25aEtUmDQ8WHH0e4KycQ==
X-Google-Smtp-Source: AGHT+IEoTMM1C3WJ3WXJtYLga664fFOucPQuDYZiEUyJBEUGakmTng/CMVW1g1mZumradOuGkeiP4A==
X-Received: by 2002:a17:90b:57e6:b0:31f:313b:4d23 with SMTP id
 98e67ed59e1d1-31f5e3809e4mr12308335a91.20.1753987516840; 
 Thu, 31 Jul 2025 11:45:16 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f30fd6dc1sm3671198a91.3.2025.07.31.11.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 11:45:16 -0700 (PDT)
Message-ID: <e88e893a-8274-4e37-b282-c7315eff0307@linaro.org>
Date: Thu, 31 Jul 2025 11:45:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 44/82] target/arm: Add GCS cpregs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-45-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-45-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x532.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Add isar_feature_aa64_gcs.
> Enable SCR_GCSEN in scr_write.
> Enable HCRX_GCSEN in hcrx_write.
> Default HCRX_GCSEN on if EL2 disabled.
> Add the GCSCR* and GCSPR* registers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h       |  2 +
>   target/arm/cpu-features.h |  5 +++
>   target/arm/cpu.h          | 12 ++++++
>   target/arm/internals.h    |  3 ++
>   target/arm/cpregs-gcs.c   | 79 +++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c          |  3 ++
>   target/arm/helper.c       | 10 +++++
>   target/arm/meson.build    |  2 +
>   8 files changed, 116 insertions(+)
>   create mode 100644 target/arm/cpregs-gcs.c

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


