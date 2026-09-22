Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA56C982FA
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 18:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x95Wq-0007PL-8k; Tue, 22 Sep 2026 14:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95WA-0007IO-Ui
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 14:47:08 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95W6-0006ur-VZ
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 14:47:01 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-39e03468a5fso176124a91.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790102817; x=1790707617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZPr2IhXOs52SApaCaIdBa32t3L64syR+CdMKnh1S4Wk=;
 b=ztu5amWLnzFpR8t+CyJD+hIppt9xqx2e5uI1viM2kxG54Xl5u+efNle+02HLcha9Z3
 9T6uQgoNO4biRz6dqciM5Avu20B2DUhYUmiiOP/mWCgJrp1GaBFvZoAj+0YwDE6Uvob6
 +2JtsrRoWoWhE796O3REhZMeirERb2gWwnSP+nQhpsEq6DgWNYh9ygqJInbR5pxi9S/4
 lauOl8S9Ien4hX+1ypv1SXS/iulgdyzCGucJC9t7o0HHIythCTpLH8RdpszDVHnURuhT
 cf6mVo4q/WHBBtreF2NKjLko215GNnSg9BqhhAz3dV6zGkTLx9nylrJr0u/FyUxNUMg4
 fP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790102817; x=1790707617;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZPr2IhXOs52SApaCaIdBa32t3L64syR+CdMKnh1S4Wk=;
 b=2FPc+wOgvVEiYPnfFKORviI8FYh/MspVUgcgqJJm9XF5pmR/oW0YVrJle/AxES2jXc
 I+5jbkaSRFyk2b3iREYsX3QJQsFoP1QFnBc8jCFCnn5Fwsws+i/sqF5Ex2RFR+rD5Peq
 S0Q0/Vr9utGzM1tjGBPP5kv6BV936MuOae0ISFmd6PvgU0v7NWvfctAni1RAIfZC84NL
 xVPWukezJjgzEfevaCed/Ue19wIsu0yUDVoRMtutKA+xdMf3aj6G5OZseQtECkf6eP/5
 7m6snk4c8FN0Zy9JIKhme3hrdWnLuMSftrEGc4ZvUokprj/DkE3ofm+Lw78PxTcjRAD8
 XGng==
X-Forwarded-Encrypted: i=1;
 AKwUvByM95mHCgT43R8ejchLGIBoa66tpkd5sAVHGryulSgs/Sn9/+jXrIRcUqVmKgkdOoJHbqwcQXj7nw==@nongnu.org
X-Gm-Message-State: AFuF++lPeCFYo4np9hoM57NUB3JQk6AWXG1Q+9kn4EAGoUE1oHr9Ntmj
 fPxqWpuHxSTE+0hBv69PwgI96E0o/iaUfLf8VHDAqG9BUCj1/cvuIZGa1fZvUqH9Ymo=
X-Gm-Gg: AYBFou1tYHA3G6rKpY0d1rXmTRAebnjvhYHFFKkFUf0lglWyUVLI4cGSjfQEXf7KiB7
 h1mPydQC26rDRlvKa2Jo5fD9sUOzYjRIfPwMc3trO/emE5PFB1cIEaxFAIlppfaIUQMlRu5MSi2
 zOhFmA7AJUVCDi/j9HUYUgBpWbm6+T8nTbiiiA28ESl/kJxAynT64IvFWmrt3uMgwMqfJvKVlD0
 NmYwpuyM/QVNBWnEVaXqnaoox5OSe+DCMqY51bJJdVEpyDozvyZkPkploNVO0CwZRrW4C8O70Nw
 g4Xhf19LXK7n1Gmun6tepIkyVJ4IUcG99y834/iO8bbNsMlpceCxjDYaJdlvMvi5SMpZMtCTCsG
 pGKU2ojRqWSifg/VbZtE0lc5pIvBc/TuMeQ/riAmr6fBrg6RDqVs2hiRZ/bXkCcVdNCR8YJ2fXs
 3Zq8krMs7XuGFWymRpMIlu2tyjO0+ZL0qRoYhb9p3P3G3G5qGyF1xwj8ytk4plui8XB22kjXw4W
 QvGqMgbA2UPkDBwyUj/OomYIcQrMDDTHkLaHx9O3w==
X-Received: by 2002:a17:90b:2b43:b0:39e:4717:7cd9 with SMTP id
 98e67ed59e1d1-3a07e313fcdmr311361a91.0.1790102817074; 
 Tue, 22 Sep 2026 11:46:57 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a07dc2b2fdsm691515a91.12.2026.09.22.11.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:46:56 -0700 (PDT)
Message-ID: <74d4fc9e-66ff-44ca-b4b3-7dcaa350cfd0@linaro.org>
Date: Tue, 22 Sep 2026 11:46:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] target/arm: Access PSCI state atomically
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-9-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-9-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> Use qatomic_set() when updating ARMCPU::power_state and
> CPUARMState::halt_reason. Read ARMCPU::power_state atomically in
> arm_cpu_has_work(), which can run without the BQL held.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/arm-powerctl.c | 5 +++--
>   target/arm/cpu.c          | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

