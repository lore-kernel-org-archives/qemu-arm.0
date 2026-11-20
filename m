Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E825606A6D3
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oQ9XLYKD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUURF-0000e9-GE; Fri, 20 Nov 2026 14:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xUURD-0000cx-4p
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 14:38:23 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xUURB-0001KO-Jw
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 14:38:22 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2f048476ab9so7360845ad.0
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 11:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795203500; x=1795808300; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Fs2cNi9kyfOFB/gS7nvdPDMv82g1W2K+mdiNT0R+w7M=;
 b=oQ9XLYKDdnrni8E6SheKbEO1ldjATykFHqmZQCuJTnYlaDfHCtxU4eG2Qdkn0cE3k5
 6s8/vXg+m59uSLu7mGNufI/EosiCPJps+ykitr3mCRDn1z4M5+DcocAD44R9C9FBL5Fh
 ZvXbjF92/d9EP4FLA6yx3O/x1GLz2HJ3HgboJ13uAEiwARNMk8fs2OHIzPnKfJjM2EOS
 r52GkbTk25k/QcfGuebiAnKi6IUfMlJHF56xxXhUS0gOZBTSHeGri58Rvk/u/XDnS41O
 eww1IfgvjXaeIlKUTox1IQNQDUAI15cKXblucGYpuSwHgLEGmqKFmkHS2CsOfFjZBiQ/
 kWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795203500; x=1795808300;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Fs2cNi9kyfOFB/gS7nvdPDMv82g1W2K+mdiNT0R+w7M=;
 b=mZ9sd28wXPXVlvlvS7egWWAOiWgmtdmbDOW7EHIIYSl0g09PsUvxv9HXZ8uwrrUIH9
 5VsBSQzlCCjUpVlazSEaRo+UL592XqCEUPpvD8/fPRkBO6UeEhBwP35WvmkShQ6HVzhA
 NvB+zwvKlHJEfcFRwi8k4oIN8CjhJdD4w9lZvY1ZooTkOwzqvpT2PccN/hn47vckobHC
 KCMQyMfy+1EM9Sj5tx667Gg5SswWWXl14LvmO9oFtwJyAxIqyBfTrJMaigmqg8r/McGy
 l0LrLWr3R3ClvAjkXRVK9LQMJEHkTWUm24qmjbRys8hpQ0AKMmFbtQGvw4pk2yhGLI8I
 /2nw==
X-Forwarded-Encrypted: i=1;
 AL+hErH3g7O2rr/DydZdKNOArDVeD/wsCfA/xkJx2Zn6T9m99LZTiqZi6duD9E+hLlyp52VdsQ8VUmqUUA==@nongnu.org
X-Gm-Message-State: APuU4Z8xDcFr+5m/+WgKujbHUxWKI/iEQOOn41YzGkRGPJUO5klY6HZH
 SzsbDnA+qMLaZMbGXuLklxWLQXOEQR+RaawUzvMCCh3ceuOoMiVK4uQwSsqyUZEui4o=
X-Gm-Gg: AZFdTZcMh2gcevtv4O5/Ywnh23IPWrM+6vukjr+9nbPty7hJIv6Mtbmki6/RhJT0Hft
 wCx+6jsrWXtpxjlyuQtzWGPHyO8weyuCGSrnwMbUE+pt/0BMu1zpZY3u5nBox1qEHoyzBMnGaLo
 y1rGT9k6arepolpDjiMTJ6FRLl8iSdr1aU0uNeZcsXhiIEG0EI4Ej6+DJ3sqsUnpW1l6zE/q2dN
 0eCKWHdBkfheHGzlK/tacMUSMz+HScFqqGxNP3I+otTglhtxFV4tafM0smjx9TOLYI9u8g9kF5A
 RucoAhuWaOyWt4H8F96fh/uEbfIugaK4LiK3alnJuo7hm1g9sfj5nlNHmVw2P7xFstzQr4cG8uF
 66sMZvFiawsEgTEWgsj5Iq6yqAC9EoSTjscYEMBPWukG7j4qW+RNsjzbm1exllqu3i9tG5cgb7R
 2UKYp8ZUvrcTPG6xd3EzOMHETHGCF8t6zN0BDkenvqti7sgiPuv9/V7mxY7gBUkJakhsfv87der
 NTnY3eWLITC7FAB88CzEr0ZpZbDEXrRccAm2NB1mzI3y2Tt6v6qnoihSiQ4XHWSfWqpxPb+l0Ow
 qBabof8F/uZF0PHabzZfkaG9exOe9BZKlB7dBysXKQfDlswXR1CF4KoaO6X7q7dRoRy0QSw=
X-Received: by 2002:a17:902:c408:b0:2f0:4df4:8985 with SMTP id
 d9443c01a7336-2f04df48cadmr22117655ad.42.1795203499693; 
 Fri, 20 Nov 2026 11:38:19 -0800 (PST)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f03f14fc8csm18042615ad.74.2026.11.20.11.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 11:38:19 -0800 (PST)
Message-ID: <7cca3a47-5a9d-429e-8049-004a8f258d00@linaro.org>
Date: Fri, 20 Nov 2026 11:38:16 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] accel/tcg: Yield round-robin execution when
 another vCPU wakes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ashish Anand
 <ashish.a6@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20261119225514.4080-1-philmd@oss.qualcomm.com>
 <20261119225514.4080-2-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261119225514.4080-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 14:55, Philippe Mathieu-Daudé wrote:
> An interrupt or inline run_on_cpu callback can wake another CPU
> that shares the sender's host thread. End the current slice in
> both paths so the target can run promptly.

Why?  Isn't this going to interfere with icount/replay?


r~

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   accel/tcg/tcg-accel-ops.c | 3 +++
>   cpu-common.c              | 3 +++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index 61e0051b53be..ec4e3577ead1 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -107,6 +107,9 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
>           qemu_cpu_kick(cpu);
>       } else {
>           qatomic_set(&cpu->neg.icount_decr.u16.high, -1);
> +        if (current_cpu && current_cpu != cpu) {
> +            cpu_exit(current_cpu);
> +        }
>       }
>   }
>   
> diff --git a/cpu-common.c b/cpu-common.c
> index adb76b3a786c..d518d1f40e81 100644
> --- a/cpu-common.c
> +++ b/cpu-common.c
> @@ -148,6 +148,9 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
>   
>       if (qemu_cpu_is_self(cpu)) {
>           func(cpu, data);
> +        if (current_cpu && current_cpu != cpu) {
> +            cpu_exit(current_cpu);
> +        }
>           return;
>       }
>   


