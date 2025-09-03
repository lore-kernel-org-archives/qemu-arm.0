Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AB6CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:42:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmoD-0000na-UM; Wed, 03 Sep 2025 08:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmo8-0000mj-5Q
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:41:48 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmo6-0006Zv-Gw
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:41:47 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so8741758a12.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756903304; x=1757508104; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uDIK1+/b7doU5cu5anlfuNO/gFsQaWznqew57k/z5xM=;
 b=CI0V7IDDHtmFpUxhPE6YSjz8arSX0iXZ+xTbWPGQOgbyJhB4ujqajdjQ4bQ4VCv8Ui
 4S9tirmgCYSxJQRLpfI6t37CM2pDcAxUsFMgplQ5a03aLm6+pFGYOzI3nrfHkv7X0zxg
 I0QSYOSOpXz5qhiFDbbpodw0kyp5GMH420Y03HlaUcK23TCx1bBvwIlSeZx/v2wvdZZ3
 VpvSCvVdbbrjxGeAf3EGmPuseJkS/IwpIHcVY0iixaEj+ye48up+xbDxLyktZCX4w3o4
 S+HH/QJijp0/SdONHWOlVBg/HtOmKJE6TVOQCZVaYLkTXtJNKZySEh9+E4bhNjMVmhtL
 u55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903304; x=1757508104;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDIK1+/b7doU5cu5anlfuNO/gFsQaWznqew57k/z5xM=;
 b=usYad5SJNT4O7e4thQwnXc4M/9e5VK5kxXoevjK4dOi3DYa38HDnox7dXioMNUDLVb
 dqUrFqVERJ8OjYqVapz7np00fHvz2ynVF0RHtfcQ0EDc/MesMTrZYJ30fs31xclK1BX4
 TUBSusxeeIOeS+eBrDNCGv9FtdakaiijBw2eowmeGY27nCYBNuIk7NHNj91cMV4la47I
 V5bAcczo18Pskxn7IlPcJcioUZVLET058GTjRTRxBmjSoVX3S1cme+ijCvtYftVzVQoV
 fBNOwJ03nYxeJw5znhHgcwwN6ibczwYlI4IJZexj8r8+QaICJEAY1NgUQbhGKdT8VAI9
 csyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLGHjCo2JzArRMxrp85UuwrlmjspAm6KINA2T3XTNRMML/Qh/NyqU3vJMrooGZhBh/ASAb7Kr4sQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy8VsQA/MXZ1KdoxIkvrBVejd/rp6e4RxKlZNsS5OeGNZZFrJIV
 HTRNrmHUFIm2dHfc2VJta66kk+jP4hY3Q1jx8cXntYHBzMZ7/c5pk9fGhdn0UsN24+8=
X-Gm-Gg: ASbGnctan4RLZ3+ElmNrbXw9JhpK5oSJNDUCN+hRM6z21gAQbz6G5BzT9nLj5nk6P7m
 p3EOXLNJ2Airj+Er2VrAHwVi2Pg3o0zNQEQYAcph3hP62Q6tUgddQQueAJ7AZyo0dG76K/kUtWO
 0Xcb2qMRwCXUfSI/hHkPyu85gfO7rQPbT4NobIOfgAodpuOgPMP8DphpdlRiZKs4COp0+rWWoyl
 rOOSAqVHyb0r5XUJB8nkUC7XhMvgQCiZ1Z0O701LeFUXBYbG+kQKsz6jdMUi3/Hn4bnYqka7384
 dTXyUqsNDJz1/sVEj20e+CMEhVgUbJfXMXBptaud7txKM6D58c6QTRuyCGwmppLO5zgT4ZtZ9f4
 nYw0YlH9U4X5fkx0LuIcgHghg0/sjAgf6TkShe12gTPM21fQaQj9upij/L66CSEOk4c49ha3KV3
 ILYiQfBA==
X-Google-Smtp-Source: AGHT+IEphbZr5aBLGv60lvPurg1uMomsLAbQhhscUSKa+fIvnsBcw3yd22B/IzWJYYQzjGppQcgRSw==
X-Received: by 2002:a05:6402:3812:b0:61a:1702:792a with SMTP id
 4fb4d7f45d1cf-61d269a6fb3mr13413449a12.9.1756903304224; 
 Wed, 03 Sep 2025 05:41:44 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ded4749aesm7642394a12.32.2025.09.03.05.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:41:43 -0700 (PDT)
Message-ID: <0336b502-4259-40ff-a5f7-ea11933ab5fe@linaro.org>
Date: Wed, 3 Sep 2025 14:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] accel/hvf: Restrict ARM specific fields of
 AccelCPUState
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-23-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
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

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> Do not expose ARM specific fields to X86 implementation,
> allowing to use the proper 'hv_vcpu_exit_t' type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/hvf_int.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
> index 195d64dcf18..3d2be4092ef 100644
> --- a/include/system/hvf_int.h
> +++ b/include/system/hvf_int.h
> @@ -59,10 +59,12 @@ extern HVFState *hvf_state;
>   
>   struct AccelCPUState {
>       hvf_vcpuid fd;
> -    void *exit;
> +#ifdef __aarch64__
> +    hv_vcpu_exit_t *exit;
>       bool vtimer_masked;
>       sigset_t unblock_ipi_mask;
>       bool guest_debug_enabled;
> +#endif
>   };
>   
>   void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,


