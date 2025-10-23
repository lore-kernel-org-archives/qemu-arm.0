Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31878CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:20:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwAg-00055J-Ri; Thu, 23 Oct 2025 10:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwAc-00052v-51
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:20:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwAa-00085u-Ar
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:20:01 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so783868f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229198; x=1761833998; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gb2Fzyx7Mv6/YpWoM4yQLG/GcacBB/ZQ5vlioICtXZE=;
 b=CyugrrS5VAR/TD7H3aUdl227oLWmEEjWnwd0quCFzjQ3OZsCBkFsFQ+1xY4fQdFNaE
 WdKBV0JJDydL6tCz/FEBS/A58G94SEMCT3aBmufWdn9Bnlp2S+o7d8j8B+99Q7JEhVGv
 Endw0QrNRH7DyFqPAe6cEEimX+6t65Cu/+2iHB6j4f1gg4sTMycHo7JBwiQ3X4Blkfd8
 L3kGbXg0oGNCpaK2tsr2Yoou03IOMl38GVh2A51IwdSLsulvdcbTeXAGvpCtWHFyYqi2
 gzy6sZ8O4Bd9jyLH8M72dxVv/avhYBMGXu86ZXwctcIjKZF/SC1CoB8eKwyZdIHgLwWG
 sqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229198; x=1761833998;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gb2Fzyx7Mv6/YpWoM4yQLG/GcacBB/ZQ5vlioICtXZE=;
 b=YO8cpylkfwddgCRFxS6LBcsSVjRbjnhuorAXpAMhJRvwCFjk5eupOOa3ePyJ9MED/g
 9wpBoWK72cDIQUn0IT5ZF3JofrktP0uIoAp1eLdATgPcapmNixa//RfLtikQ7Tg2+p7f
 /nLGzr+lnZvLjJoPltf3tRi8LIs+md7myZEiOM0fEez4qxOCjEQlDBcBOHAqsl6eSQPh
 nyD5SF8swTWR/7jVKNnPlPOq6ljmMgL87pWOI7BwSu492JKtgGvPK1wqX/ngKgChDRij
 Tx6zD+RJmNcwg8Sft7IkFtMCcFDERnKEd5epRSSiqtjNIuhTkx5mpIOOAV+9rwTh2/V/
 2kxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVPml3LfDwHVbU0+Z+xVAQ4gwOlr03Y0J744XwWEqUcYd2ByJG92QmVQCVNy3soktPwxHNJUKGJQ==@nongnu.org
X-Gm-Message-State: AOJu0YwpdJMwdOuUAG4VZ+rl5eemHq/vm86c06ivRwlVA04yMKaahRUG
 PYx9+HOy1of7b/2uhbb5qLm8ndtZVzw3p5s07dIVvge0GqVPul6gGo4aCqthVPchs8h9itxyQjI
 She61IGI=
X-Gm-Gg: ASbGnct9KfABNOrULMQmkSERP0x9SHHrvuurRBUnRG5vxaWeIZMhzDHZHtKKI8arkR7
 S6u87Lil0YUoBi3DF05jh+D5t6ROi01AnvJHLjZ9+BsZZ0GH+7+tg7Yu805cgv0pK7oreas4ltv
 TEIKhPKytu35rwIaWTAii9Vr7AsvBmBi/RmN2V1fmrUEwdD+atKJYqcK2/eI+6cB1qU2s1QZh05
 93mYhHzLlamnD+OKX41oHAVEjEuAqgJipREW47JPUCHT8ZdK4LhHsy+JmVTTD9f+HTETLLK0Lv0
 VexBNj5+gD07Z5P8DCr8Do62K01ZjFSby0wIv6FCiGUqBa6p6H+i1oML5tKeQo1kytIEHyjxpwh
 749Xi5V6wl+CmThNzqDhO8zhU2EoRWiMR9A3yL8N8+A3RUrs9tllFEVUM+Ijdyx+c3Dv2c36RdP
 8UkI37/fMI65+Mbjnk07GPeXgd3oVF7nZWKnl1PmS0Z5eQYweq9LLXYA==
X-Google-Smtp-Source: AGHT+IHwGDdWd9Te/TyHQJhMX6R56xFmSW8c8uSw1vtwRbMIj4P2Wjutl/2B/7nV/ZHe3UUf2gMSvA==
X-Received: by 2002:a05:6000:2c0c:b0:427:928:78a0 with SMTP id
 ffacd0b85a97d-42709287a50mr15882779f8f.63.1761229198024; 
 Thu, 23 Oct 2025 07:19:58 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898add8bsm4077898f8f.23.2025.10.23.07.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:19:57 -0700 (PDT)
Message-ID: <b19a62c0-57ad-4fb3-ae45-a71aa08a7606@linaro.org>
Date: Thu, 23 Oct 2025 16:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/58] accel/hvf: Move hvf_log_sync to hvf_log_clear
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-9-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023115311.6944-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 23/10/25 13:52, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Right idea, wrong hook.  log_sync is called before using
> dirty bit data (which for hvf is already up-to-date),
> whereas log_clear is called before cleaning the range.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/hvf-all.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


