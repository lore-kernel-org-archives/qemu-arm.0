Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D86BC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 16:31:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubM4f-0007jJ-4f; Mon, 14 Jul 2025 12:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubL9m-0008Nv-1a
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:31:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubL9j-0004JH-LT
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:31:53 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so3170512a12.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752507110; x=1753111910; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+XCHuvqEWoKHh0e8TjkTEIwLPUiMtDfVFO9vyDJur0=;
 b=P16Qdiw070xkWNZDQffC0lZotxIf1pWTcQunRF5rH47qdWO5kF71O8YDwp13micfOK
 R14/9eI2pwYzy6E31N7iDdd7BvsNUL0urAGESPjHfMQY7IYu5QX2Klzw90md/NZIR+Z4
 PaEhipmqD/I8tEWebh5iiT6QDGGJRewVQpIdCa4sApPHXzQZqEFHNiQTLY42ooGUFOPO
 sbs1+YJZSCJRtXeGgPcPMVuICAcQ+6oO6YWuk5LCQZuTmJ1yJDtT9nIkOrj9R3fSmmOC
 mx1wi7mrexHVOffGbCqaDunN7IVpyyV2dWgAjtPGp4fWedWaOoVgwx6EvjoFHhXHaDOz
 tB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752507110; x=1753111910;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+XCHuvqEWoKHh0e8TjkTEIwLPUiMtDfVFO9vyDJur0=;
 b=fdZ6eMnyk+nHGKIRdQTro8hNvtGlT6lS3xyHQzvD++hmV0/rmci9njLPQOqUXw2vC6
 y0OlI8V1O+YFHswMMsoVf0oOQaWc9lrFaaRDCT/ATqTqSAH/YF2EhWh6iV1u7t/NdRDJ
 FYPKxWIM+SkFcfQeG9Ux0ebsHrMJQDEDO6Rax+1KMhuqUn+ngCz67JyGOHrYTTjLxcB1
 aDR6HOAOtD0UwRU3e3sS+4c+wWiq4VmEGOAWwIrTtVijzx4RL7GWHS4D0fk1+7CUN4Jn
 0laVbt3fUNQJP1Xm8XjkuhfzObifuN45k53/8FxBGT2VMmM/Lz4t9AIa3PIgRGR5a9ph
 4EbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMpEET67GdbjNZUNuhnf14igf6FECNYBnpXj5+62N1G9tO3QDwTIkfJLvXazAy13joAT++MCEf0Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxpu1gosLpwAhd+PFTd51IqCNLIWut9IPV4KQY63TfdJQXWRGob
 5rmJ99LhUid9C6UIAZa4G/96E1p/mDKnq/I6NRD/ccpfEOgrRbi+1AyK4DC4YiwuNH4=
X-Gm-Gg: ASbGnctMG87tJFITL7tP7LvzEoy8SjRAXgDPPLCbPaHMYIMdMjiaw7+BOXN6jJOI2TL
 jt1U5is7i43d+UZDQQoeSSxBwnHkhdFflE3cmRwyW0Va3ARES0yoKO3nZIynupCisPZWy1cx0EP
 /QfKFwkMZGKF6w3Obx/wTdvPShce0hgaQIPuIVoUqCBDDQgWeor2ixk+TGmp27rb/sYxxK85g5U
 oA7p3i8kB+HGCtpGqbVTnNQnawZl2Tv99RtWaPj6jhh11hqFQWe/N4dr6xEds2teXvD8eroxjE6
 NiuhtI6Od+uMdqqHnX9myFiv/att+iMTQdX+0TDCgXZBC7umnSxozwW33yqlLJzFR4l8dzKxGj/
 f1OOQAyLHCb/oCSEJ/HdPv0lpc88UkFPcfn0=
X-Google-Smtp-Source: AGHT+IEj9kImh2b6Ual47lsgq+9XBsPlQLjsNBbOzTu6vbSIihYJ90uQ1ds+r6IFHmUEkc8/Ey1ZsA==
X-Received: by 2002:a05:6a20:6a24:b0:232:a762:def with SMTP id
 adf61e73a8af0-232a7625735mr18670217637.30.1752507109733; 
 Mon, 14 Jul 2025 08:31:49 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe731effsm8924001a12.77.2025.07.14.08.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 08:31:49 -0700 (PDT)
Message-ID: <0b438773-01b9-42e1-8edf-2330e50387f8@linaro.org>
Date: Mon, 14 Jul 2025 08:31:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Provide always-false kvm_arm_*_supported()
 stubs for usermode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20250714135152.1896214-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250714135152.1896214-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52e.google.com
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

On 7/14/25 6:51 AM, Peter Maydell wrote:
> If you try to build aarch64-linux-user with clang and --enable-debug then it
> fails to compile:
> 
>   ld: libqemu-aarch64-linux-user.a.p/target_arm_cpu64.c.o: in function `cpu_arm_set_sve':
>   ../../target/arm/cpu64.c:321:(.text+0x1254): undefined reference to `kvm_arm_sve_supported'
> 
> This is a regression introduced in commit f86d4220, which switched
> the kvm-stub.c file away from being built for all arm targets to only
> being built for system emulation binaries.  It doesn't affect gcc,
> presumably because even at -O0 gcc folds away the always-false
> kvm_enabled() condition but clang does not.
> 
> We would prefer not to build kvm-stub.c once for usermode and once
> for system-emulation binaries, and we can't build it just once for
> both because it includes cpu.h.  So instead provide always-false
> versions of the five functions that are valid to call without KVM
> support in kvm_arm.h.
> 
> Fixes: f86d42205c2eba ("target/arm/meson: accelerator files are not needed in user mode")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3033
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm never sure when we prefer to use stub-functions in separate C files
> vs when we prefer to have ifdeffed stubs in headers. There are several
> ways we could fix this compile error, so I just picked one...
> ---
>   target/arm/kvm_arm.h | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>

Thanks Peter, clang with --enable-debug is indeed a combination I didn't 
try. I'll test this too now. Going through this topic, yes I noticed 
that gcc always folds the any if (0) condition, and, based on a Richard 
comment (I can't find now) it seems that we used to rely on that for 
other parts of the code.

The fix you propose works well (initial goal was just to remove 
CONFIG_KVM, so having CONFIG_USER_ONLY is ok), but I wonder if there is 
something specific affecting clang in this case and preventing the folding.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Thanks,
Pierrick

