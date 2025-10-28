Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F20CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 12:02:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDiOz-0000XS-0q; Tue, 28 Oct 2025 08:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiOt-0000WG-Ok
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:02:07 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDiOf-0000S5-B9
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 08:02:07 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b6d345d7ff7so74114766b.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761652910; x=1762257710; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ycLScXY9J/asCOE3L2rjsr+XkAIASPr7CwZbCPXlGvU=;
 b=CjIpAVv48D3yAxoc8EMKYA7G8axPmI5zyNGF6EhN+qZ0fS2/6YFzgO+hgXftXWIkNG
 hl9IJdUIwFDoN+n7zcAXa+XV4S/LfwAOQPQOgRPD2/WlHG9i46iIDp/zaZEY3vWdxJZn
 wqONYE7Puoty1ULJ458I+4IzOqkF2nuuraVXcjte3ZTW7ITL431vuhxsWwW1vj0omZYi
 OU4hIgQV2FvFLQaWterF64xdDKkIajoLeCgq070+d6wdPdq8KlrWILE/al6gytphr3re
 EFzlzArtSVADPymhxYq8Ha6zcWbGnNGDZ6uCwAMAj70fo2E7RdSmfZ720GR2Hx2KEfU/
 CD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761652910; x=1762257710;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ycLScXY9J/asCOE3L2rjsr+XkAIASPr7CwZbCPXlGvU=;
 b=Lavov2nDThHQNIQnx2wpzbAVLtoyy0vcOz5qTWQMb0w6arEWq313Jx8oiFbtQnKXO6
 B5R/4uvCrGO2/d9RLxqzSQfSOUPoLgp1SzAcUsY7bf4leKAhwQKfklWl6bJ41q0On9Ff
 js/40xUe1R8dvfb1HdJUuCyfVnF46Hl6IJAFDs9X22AKgAm+RgAHWRmgCpdv2T/KNzKf
 2pdK0cwBa88kkEW3cJ1V6SzdImq6jMIXUl65KLkwlM81clcNCzB+TjfdH8ZCJMMKGa3g
 Cbnp7IqIuHtM2sFgpd0OCyZ12D6YepVF0L45D08z3G57uKQs8veGAX7+n3zswgWbuT7F
 yenw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHWiC/u6S4aRTiULuCQhBZ+vh3nPASI2gT61OgzPhRWFCjR6x9QuUs5jlWz5aSMUryGooOj+0K6w==@nongnu.org
X-Gm-Message-State: AOJu0Yz02/aJ0t4i5Udb3d1fAyvMAWfw3ayrt2qvfCRgz770ZxbY3obf
 2Ydy6WnQrQ0TCsIM/3a5FYRLcg1rpoIR5O+q/VNZpeNxlpP4kXtRjpQLb1BEzYR5mCQ=
X-Gm-Gg: ASbGncuxMKGnmeMA3Imt4OExMnEe73AyK5OkKxXJhExnIYf76pbZWBEliG5XaItr691
 +IQgHegzc/kxWK0E8Dem66quP60erFMoEtbLHSWD0ekYJNC6o3QMXEZ9PtUCj/fexhnUX0CkS4q
 S8v4RGaDcpJqaT5UgjTTBydYC7METLPjIQt/1cnb9vpnxHA40kmovXcYDyI2DYNFE+9xTKM2HKJ
 FB/YxULLcWJOYAapl/XVuwFons0t8RxOf18y1QRT2slYbtckKbUKtzLcCaY3TZUmKKyyDEQWirN
 so/hS91ZxzYmMjoY/oXAxVbBI1XTfYZBRzOf/aHADl/DtE618j5+3W1gBMto9hr1BmoTj4rHrt8
 MSm1+jdI8nCwUKqvNDHQTzEnlHmmFIElMUCwKLyiWLEWbHZmfVmHnMGefKn+Eg5xeEhZRnMvcUv
 G0v8AtpNVm8zHRkpSB
X-Google-Smtp-Source: AGHT+IHLDVweUzBUIAJvRB2B0+N2jjX9/zvKD3CQ8A/zpD84n3oQlgH29mo6qtHekqJY28nrbttJ9w==
X-Received: by 2002:a17:907:3f83:b0:b4d:71e9:1662 with SMTP id
 a640c23a62f3a-b6dbc04da08mr309095366b.30.1761652910151; 
 Tue, 28 Oct 2025 05:01:50 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853696aesm1095895966b.30.2025.10.28.05.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 05:01:49 -0700 (PDT)
Message-ID: <12196f65-ad1c-4753-ac15-211567c77297@linaro.org>
Date: Tue, 28 Oct 2025 13:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 43/59] accel/hvf: Implement WFI without using pselect()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-44-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-44-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
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

On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -128,14 +128,15 @@ static int hvf_init_vcpu(CPUState *cpu)
>       cpu->accel = g_new0(AccelCPUState, 1);
>   
>       /* init cpu signals */
> +    sigset_t unblock_ipi_mask;

Why introduce this?  Surely it's unused...

>       struct sigaction sigact;
>   
>       memset(&sigact, 0, sizeof(sigact));
>       sigact.sa_handler = dummy_signal;
>       sigaction(SIG_IPI, &sigact, NULL);
>   
> -    pthread_sigmask(SIG_BLOCK, NULL, &cpu->accel->unblock_ipi_mask);
> -    sigdelset(&cpu->accel->unblock_ipi_mask, SIG_IPI);
> +    pthread_sigmask(SIG_BLOCK, NULL, &unblock_ipi_mask);
> +    sigdelset(&unblock_ipi_mask, SIG_IPI);

... apart from mere initialization.


r~

