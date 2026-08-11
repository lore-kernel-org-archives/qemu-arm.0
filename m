Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC8DC5B56A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 23:34:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtvyy-0008II-K7; Tue, 11 Aug 2026 19:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtvyv-0008GL-7d
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 19:34:05 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtvys-00076m-Fi
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 19:34:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cf50c6f235so6833015ad.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 16:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786491241; x=1787096041; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0eStAZ6SsJfA6QA9D9uuJRZ4Drf8kSStCDfosExh3Hg=;
 b=yxnoAO/YTvclJvIUuTpii1iIr3q0JVP9HiKy1wxYZDwDqWlDSVh+CeaWwERiw047UT
 tJdRO9lWX1/Kf2R322SdLd4ozNlqLwo6Kl2GRbpdzDyCAAwplCnE4mOPGBkRvSdqYu4X
 aNmmVZ4fuSZdL1bT3fbTaSPk1du4Qy8RA2z44vCrahsQknD72BxGCq2ji0qtntj5oaT+
 QV7gawk5a7TMCzt9D3KnTcTDjk0H9G8epvfgRr+py0lrxBRZROsN9mHpzt7uFBTl9/ta
 Mgi/mH4xZH8WvZ1jOWWYxtkutzYdgWuL8/PJv5mmHPZkgkrZW7VVHsF5YJuN9mP8rOcY
 vLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786491241; x=1787096041;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0eStAZ6SsJfA6QA9D9uuJRZ4Drf8kSStCDfosExh3Hg=;
 b=K6HEES1T329dB38S/HNQ2KdMLLHwwgyAU1RXmmnJehIb401OgaE4OW2Pp2JdlnuGD4
 slG5HC7jY2/CorVMK3VeQZcf14D1mMAAl29ooUwkuq1FivITNrn3+wx9xB08U4GhjEiN
 t943j9qwX7LTF/gl+bzFbPmyr0gyf7A/b2Vw0HHIRksXvcC8o0+MISRvPHyDXrRrMyfV
 J6WHvGb6X/NERTQBPUxnQTbT5bOBLEvZUV4NRQXb2lkbMoLskaW/76jzuUNDIOxuIgSL
 oW487CZW+KaGHHNVh44yVlCAhwLqbEp0Q+pbRrh/0Wr1ogiNHZwt/oOzoZ2TvpqZqkVs
 R7Bg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqP+8NmTDCku+SOitnKLepi1BkbYrFTeflycVkjQpCwrbdgChSVH7OhmyKuaEzSZNXKgWzXyklstw==@nongnu.org
X-Gm-Message-State: AOJu0YzB2zNrvPjf26oKRwRmkKpa/dreARMZOi3KtMfShe99SDvCvSZk
 8nmgcOtWPsKHoqwl5JdxrTSqq7PEPwRD1PG+JdGNje5mCVzcFRNXThWgsb51e5EDV5A=
X-Gm-Gg: AR+sD133u0Re4wy+nKP1EeDwv8hIxlvoKRqSPT7Zs/ltyvDTmyImtPC3/AieBBuK9FI
 FcfaFsRtM8O41Vtu2sxsIOiqaMNdf+ScdO5y+qkkJ5MeOAfJGctiq8x2fT8xzYu7LNge20iPIAa
 6cNk88JabMHIjJHvMcOKVz+Vob4kroYY+KF9BB0Y/j54omxvUdnNBao/E0mvOVPbME+FVDJAc8+
 UIj7+GjNUeGmlQA/63JiaZxVrCwEd380n3JDPrwfvkhMEvxRIfDY3lK6sdHlSAIoU93FUTZyhGS
 l/Wp/UD5H3h18nNDtBerEF4e330vUR+wQZ4L3qf6G9k/EC8debEOqL7+TC3Df5D7GBKk7TyBLSa
 waqRF8WAXI+SyooQNTqvsCXkkQ/JaWtcSG5858RQdC7mzxXyFQXzwpcCjmsq1EwhyruUFrKRKs/
 IoPqWAxIcBmTzFPMeJWt3mUTXdRsYUWnUCFEqi2ARP3kQODe1rKJspAcUttSsbRxZSjBOV87RYN
 2Re83noeOgF3LJufBggr1ThYM9bDqt+B8TazuU=
X-Received: by 2002:a17:902:ea0b:b0:2cc:90aa:8787 with SMTP id
 d9443c01a7336-2d3452da5d8mr13405955ad.6.1786491240755; 
 Tue, 11 Aug 2026 16:34:00 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d315ef024esm12928355ad.10.2026.08.11.16.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2026 16:33:59 -0700 (PDT)
Message-ID: <eb53043c-0379-4fe7-953d-e311a2eff827@linaro.org>
Date: Tue, 11 Aug 2026 16:33:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] hw/cpu: Slightly sanitize CPU API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 8/11/26 11:34, Philippe Mathieu-Daudé wrote:
> API cleanups, mostly removing system-specific code out of
> cpu-common.c. Code churn renaming functions, in the hope
> to make things a bit simpler to understand.
> 
> Small patch set extracted from a series clarifying CPU /
> accel synchronization, itself a preliminary work to introduce
> split acceleration, eventually.
> 
> Philippe Mathieu-Daudé (8):
>    hw/cpu: Correct CPU_GET_CLASS() comment
>    hw/cpu: Include missing 'qemu/accel.h' header
>    hw/cpu: Move internal declarations to new 'cpu-internal.h' header
>    hw/cpu: Rename cpu_common_realizefn() -> cpu_exec_realize()
>    hw/cpu: Rename cpu_exec_realizefn() -> cpu_common_realize()
>    hw/cpu: Rename cpu_exec_unrealizefn() -> cpu_common_unrealize()
>    hw/cpu: Extract cpu_exec_realize() out of cpu_common_realizefn()
>    hw/cpu: Move system-specific cpu_exec_realize() to cpu-system.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

