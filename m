Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C3CCF9E0
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:20:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwBI-0005W8-R7; Thu, 23 Oct 2025 10:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwBC-0005Sw-01
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:20:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwB9-0008OG-IB
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:20:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47114a40161so8870595e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229232; x=1761834032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B/3T3u3vrJFyOo7CzzG4W5+4fXOzcP+Ioy5uP4fNaUM=;
 b=lIrAWLocl02uVJD+Ahppkxc78QdE4oh/nA7YJlcQYyd32dhXU6Snmn1Olj/zwzM5iv
 99PTBo0Sg+kUOkglZkvzh4aYm1Bs+j9RHifxrX7A+jiZ1u0BA5KNtPJdCiPuc+3wTJH0
 XXkh0pe4VvUNa+poZ+A8DVHVloyvEr90gCjNe58eVbSNcM94fxPX1v8sso5qKT5V5I0b
 XdXWfdm6ALa8Mt49ATD6lJP2wybL80xWrjCJTIPa9SpHWskXRqGd0H9nSS6vXmHU12gA
 VA2NHLlygDDz+v5r3IrO/4Vm3UeTrp9aH2FbAJ2DyRVbyfwBoVSxc1KcFmAyMpMcP7MA
 R3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229232; x=1761834032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B/3T3u3vrJFyOo7CzzG4W5+4fXOzcP+Ioy5uP4fNaUM=;
 b=vtJ4ZNoqNi1FkIzdufWIu4VVi9Eb/JtLax4iRaxv9F/O8rZlbTyjEo7NkqnIV4hRcO
 JVEhjjGuB6t43TQkfyIkZBe7hbq+s5yDju3WgH+0/YJ4tFiNp0ZMiTxWRjni4meUf0sd
 9ZsnVQapcp1VxLMCi9IA3n07hhYzAfPgPzNa2TzejwlMLoIufrq+C96Je2uO+ju2gPSy
 rqGZCpd6TzJvh/ECNuhDOvUfF1cpvaUoJHpvDrWw1CWLNKuUHAoBo9kKFryPFP65zhV5
 3ziulh3w+pKNcPJyg7aFdFzw8RzCuNzWbISeEqJ2WC0mKyeTzJvy7P67zyO/wtFwL2tp
 3QNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVj92b3uu41g/mdIKdEQTdh/y86kBi9Vj7jaKdi3KIhAXvoPLrbr2tFLRbt58WboZlQKbq+n0zOg==@nongnu.org
X-Gm-Message-State: AOJu0YzRP4GP7HRv7JSvJjKDaTfJ2vIcjjIZKeXiICdCb99HVbf0GUfv
 tutQlzOUWweuRuIg2pQDab0Q6FScFGiHFAmSbhQrX5P2r2s4Gvqw5p0p4AKnjP62zA4=
X-Gm-Gg: ASbGncstAgcR8t5s6Aoxt5yTo+gck4PufulmWOTnwZf5WQEmklqhpM0681yWKGKU0mN
 wpSRzHCfSMPAcVNGs+YnbU7iAVSNiTIcBfEpAODBxRET45CLqOaE0xsnBYWgdp7Q+es8tjCqO9g
 Um1YlICtrBlgN5EIiXhZecXNl8TkUljxm9CyZ1tgTeSFecoqhf4XuIHE7mFGy43EFmnFJSQoc7U
 JVBKbq4DDI4cVaCqfvhdkGfd/kGgsgqrGlkwje4JI0/4Szj8vfad690SM6k4S8/7teUn8a6u84N
 xvzpxZRVY38x9laQiyAf8bGH1u4Pdu9wDiWuJMICvYacGrkf2sATtqbA2L+Q4RBoizInCn2GmYv
 K6G74tpR2Q+XEX6LpKlRaxJLlTYNZamEBsEPlSQ/MRJL5PstdkQTdny2YU/6tNqK3A/8F0M7AkY
 oUaBa3PHRQkfc6EHhQYYANAvGW7rUlg/n1idNFvXvnrt+U/HF27/smYA==
X-Google-Smtp-Source: AGHT+IFVKfifpv4X1bolBhGXGl4Frw8eHmfkAEwn3uq8N11SwOdZmxBCMJoHOG35nH9ULUM9MjCe0A==
X-Received: by 2002:a05:600c:354a:b0:46e:59bd:f7d3 with SMTP id
 5b1f17b1804b1-47117903f24mr164119455e9.20.1761229232624; 
 Thu, 23 Oct 2025 07:20:32 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494b22536sm60875295e9.5.2025.10.23.07.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:20:31 -0700 (PDT)
Message-ID: <07851b4a-2b28-4daf-95a1-a747baa1bf14@linaro.org>
Date: Thu, 23 Oct 2025 16:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 40/58] accel/hvf: Drop hvf_slot and
 hvf_find_overlap_slot
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
 <20251023115311.6944-11-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023115311.6944-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 23/10/25 13:52, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> These are now unused.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/hvf_int.h  | 13 -------------
>   accel/hvf/hvf-accel-ops.c | 14 --------------
>   2 files changed, 27 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


