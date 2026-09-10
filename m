Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8019FC79FBF
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 19:56:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4ks6-0003Mw-Sb; Thu, 10 Sep 2026 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4khr-0000By-Gf
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:45:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4khO-0008KV-6k
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:45:04 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-cc4aa0248cfso227591a12.1
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789069464; x=1789674264; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=n+dJEKORJhIMxt95me6KAeOxHeKg6m7y2A3xNtesxlg=;
 b=jJLgSQ2m6wE0gaorWn3jWlRUf2qwLzZyT4xYjU/rb94jSzQDe3Ld3qTj1vI8Z7x10q
 wFZld35yI1Pd8LGuySXGXm+VJMPu9C9C16Klhlcr5QTiXmkieItBzs8mxSFHVCJxkcJD
 tzSbf+ewvfjLkQlKBdjFDbUK0W4YIobQ+5cBN+3AMaGRYsegJ7RxarO/dLeCWdkGA1SK
 F2rShyNuMAsilkujoHB9TVUQTqk2Z1neTF+if7WcXu5WUIgiXrg0o5QKyVK1h6gcprcA
 BhX4uyp6pv0YJuqOkaGv+1DwIOgSJZUzP/us//Q3HPTuecaz65TFggtPrhpLUDnhJHX0
 GdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789069464; x=1789674264;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n+dJEKORJhIMxt95me6KAeOxHeKg6m7y2A3xNtesxlg=;
 b=MFeJHbc2jsU1RIvGFiJd08s4sBjh17IbwSrLdeAfOlqJEFjElKt+cnHk8svReKJiy4
 v18bu49Tt1H/VgVlprP3P5baeB7SINPug1lgjyzPM98AFALBAae/YqfjicMatoZ8GX5r
 NcxPz7QE/Kt0OGspT3kLcYC2gcq+arrJK5RW7DJFYDVDkTpLIWDIQFjLwvMthwN+gnkf
 i1nI9eHZ8fK4i105SEHPDQ/yC84NE7QuwqbNWKBNa7qyoLoscWwJ0HtKmL03qilS7nWc
 42lxhqUh0Y8t1p0KPm32lCQu6UC0loTCW4HMn8IV25AUGGuSHwfmUZskQRkGdb9/C+rB
 IV5w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcvEqRXzlgkfZSARMGOPElYWcmM6hOxfO58eckvXov4w7xAyfceae9kRFa3xHntg+xrIkp6Awh0A==@nongnu.org
X-Gm-Message-State: AFuF++ljoIWZ5Vjv9qT/Rm3mgt9AOFq2guQbnLzPyb+tSAR0LLE3EAmC
 56Jv7IjwKwuc9JWulfBshCGbP9Smwa9xrf1J3PULbPgRlA+nFN+oGztW85/EraYgKQgSw1G2Z/7
 k6bISNbI=
X-Gm-Gg: AYBFou1elSyMbfyo4NCYTAAeC88mhPsnUYQVunfQC6M11vfwr0CqeJTxphnpICkbOOj
 1P91lN376/jYOocaDSTBoDx1vVqrb1PvZnVdONEavwsmdlrRwslxCyStlJDHxdoH7y5ArfLNZ+i
 rtqJtGevfLoOrRN1kbi5oxnZIYVlpTT4uL1rCGQOAZEvfq9/HiRtjeK1IUaflWpjOf9XulLxqum
 weTriA9j3GrY6x6YkagtiZJagD73z+LppwpbrZPeS7GyIvNfNkvNdfemkwJpSStQ9PbcKMOYpnz
 MSTCRfej4QGWADJbuoggcISLHnYVb+YLPIDYGSfNPocQDdfpbjhYGYkrBGqzG/QD6+7ZRbZC6kd
 QNlja6GBxB26zVby3jY30ItXswsk7fSpd4PVs2RCnss2TpGuGUzLJGVXq6EsNWjnoywt3URWsHZ
 ydSG3Q+4soRG0xHHDyRMEeNwbV6ycYVS2gYAa01Yqh0a6OfYstzPgcfcBYPf8oJQp4DLib4IBrH
 thGawQvL1G8GNQ=
X-Received: by 2002:a17:90b:1d46:b0:38e:fea2:df53 with SMTP id
 98e67ed59e1d1-39d9bbdc30dmr530821a91.4.1789069464507; 
 Thu, 10 Sep 2026 12:44:24 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4f5833fsm323646eec.23.2026.09.10.12.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 12:44:24 -0700 (PDT)
Message-ID: <711ce570-2c09-44ac-8e0a-59da60f7a39d@linaro.org>
Date: Thu, 10 Sep 2026 09:44:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/21] target/arm: Constify CPUARMState for various
 cpu_*() getters
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
 <20260901095229.72018-7-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260901095229.72018-7-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 8/31/26 23:52, Philippe Mathieu-Daudé wrote:
> Add the const qualifier to CPUARMState when the
> argument is accessed without modification.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
> Ignoring one checkpatch.pl warning:
> 
>    WARNING: line over 80 characters
>    #116: FILE: target/arm/cpu.h:2277:
>    +static inline ARMSecuritySpace arm_security_space_below_el3(const CPUARMState *env)
> 
>    total: 0 errors, 1 warnings, 789 lines checked
> ---
>   target/arm/cpu.h           | 55 ++++++++++++++++----------------
>   target/arm/internals.h     | 65 +++++++++++++++++++-------------------
>   target/arm/helper.c        | 41 ++++++++++++------------
>   target/arm/tcg/debug.c     | 18 +++++------
>   target/arm/tcg/hflags.c    | 35 ++++++++++----------
>   target/arm/tcg/m_helper.c  |  8 ++---
>   target/arm/tcg/op_helper.c |  2 +-
>   7 files changed, 114 insertions(+), 110 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



