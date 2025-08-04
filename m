Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DA3C87FD1
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:49:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj1B4-0006ni-DV; Mon, 04 Aug 2025 15:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1B2-0006kO-0q
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:48:56 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1B0-0008QR-Dw
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:48:55 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b3f80661991so4126584a12.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754336933; x=1754941733; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atE7N6Ir3RX/VJDvWpTN+pnRHD2oCCSx+NHwvPtMv+U=;
 b=ItzKIYkZZ5zoxNChK6XdI8FvgtCkmtl0wnxnW1gS8tgwQD91zL2NLnFm1D06jzDqbx
 +aVixdF2im1VfmlEeGnI5+uRVu9gABgyNZ1054gSCuBPvrIDWrSjDyJpSLQZmIKZG1BC
 9pqHolQXHR1X8EG2cwBZTtKzJ9vJVdnrXrEIHVH/AWE7V1hY/CHbn631FcNkyk+bipfk
 DoOd9cTqZNm5ijW9egs2rkhxypy5JpwmpQwhsioLp2avGSRbcTX5QSASbqsQu/LVHwdB
 1BNQIHGOfturIygmXqWplSAnhawP18S+AAKMlFe0yop6DufrEBY5gafm8sPq8ttLjeB/
 Yjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754336933; x=1754941733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atE7N6Ir3RX/VJDvWpTN+pnRHD2oCCSx+NHwvPtMv+U=;
 b=CDxaP6U1zr+wlVuEH/xlvqGmB763YmSL1a/XT/U2nIbnnv8hYiVm2Pl4VUJ5ITqRKo
 5kBy7qBgxTUuly9QwmFAsYr8xfJiFa0mL4Ed2IbCrX5T2GzUSrWC5LQqeFYo1ci38T2i
 YHZ9gMP5+baZTb8+GGeGPm3/2cnR89/O0znw4PXSwmPkLyH8n+kPNnLp71Gh5RLd1aG+
 OwKbUaWt84YM+/joPhyaPR14lcpKaPNTsSCWMcwdIvAAMrJ2qx5vh54+9lf8jLXLW2Ou
 Q7dMXVyL32aNr4vwjMsl0PRMHqGLCxuvjDirfigfNtUigsmF7LzY4WiENx3ePPP/8teD
 2KLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUax2MqI/+3ThKNYyWEyVGe/R0zDt9laS6+kW/WFwANmJvDY/ksjwS4UU9PzQbrvcCU5HdKaAkirQ==@nongnu.org
X-Gm-Message-State: AOJu0YxUU6kVx+cpWka/VnQTT9q5/HGkI3nczqGYd4ZefT6e2mhhU2bC
 tCPUS0FuVjgohSZJCTfB07Qq+Ip+h2Wqf0kjF+B3pKiJuMZRLMReRdBBWOfKsXyfJx8=
X-Gm-Gg: ASbGnctCHYYLXZCXu0MSft1z7gzRILSdNYJBjCmA1Eh01T43Zne35tsnMcXkPo6AEhK
 ffstWDquiXHqNehg2rErka49Z8K8dS14KZAdOxKApmdyTrU4BTIb+0REsDq0VeOsCaRyun7s7a7
 b31/jCuEmybYlLEILEdBoWyCU9ZkS7wng7g272AlHV0dA86hfPT+aRW1PMn6DN+TULElBup6zJL
 G4jI6l6XvWzTl2i5qm5039nP3HzHDNg7i4OB94Uvb/LGd7K4CLzc4kyTSOOtrg/5HEQgNeej6DE
 mlc7hL7u5yAlnhXjpR9eDX0kVwn3rCB0AFV2oZZhKoEheuKLIods+tZt+haW4dW24mxrwrPmwop
 yo01r4pnVXwdFFenffO9/6Z+vDFdCr3rMNPs=
X-Google-Smtp-Source: AGHT+IHse1vyJQYrK0hDW1AWHLgHiZhqs7Uo/tfN6RBtgt39X7Dq8a+/cvxIb/FIOtHXYuOoORCPTg==
X-Received: by 2002:a17:90b:1b11:b0:31e:cdbc:8d4c with SMTP id
 98e67ed59e1d1-3214fbb3a9dmr1034234a91.0.1754336932868; 
 Mon, 04 Aug 2025 12:48:52 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422b7e21adsm9606723a12.26.2025.08.04.12.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:48:52 -0700 (PDT)
Message-ID: <b3a025cd-143c-4a64-bd55-975d2dce44b7@linaro.org>
Date: Mon, 4 Aug 2025 12:48:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/17] target/arm: cpu: mark WHPX as supporting PSCI 1.1
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-12-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-12-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Hyper-V supports PSCI 1.3, and that implementation is exposed through
> WHPX.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


