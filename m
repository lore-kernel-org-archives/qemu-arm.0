Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3ECF3D337
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:05:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyC8X-0004AM-9b; Thu, 05 Mar 2026 12:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC8V-00049v-Ah
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:05:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC8P-0004Mb-5Z
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:05:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so94406165e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730312; x=1773335112; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2jyGNY1pMlpjsNMruDr4yo1TU4KVhb4aGtVSeSnbYC4=;
 b=gH07FZFoDjEIdLlGhe/gaHgdN45IBJE25tfkViYGPFhDweX2AitcQafGtFOi3hmJCY
 xxBsdwlX4wCtQ76ZAIaEj9zH5YxW+2SxIlxDLx9/WkjZQWXYYRKNQEhQiK2QsQiQEPWg
 g/5c7BaGLSDj5e9QAcQA9zf56vTHxcpPBDbyIQsg8EYFMmvvaZMsSOouKX4b3kz7mnJr
 Sd0F1/u3oX+oowR3/odD5k0ftAfy7HG/qlbZnZR4zekS7PCN9nqYUfAMgCYL/eN0BwxK
 7XMG4DeKAhQiHvP8xgxEvxSdmhYmo+fUmTOE0/SDSUtO46ary4ChMs7pKLXiPj1Fb4r2
 0n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730312; x=1773335112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jyGNY1pMlpjsNMruDr4yo1TU4KVhb4aGtVSeSnbYC4=;
 b=ZeXRu584TJ7oRaz+fXB4sZ1vf8DKPgc/GUscUrYfjf6IaEoe6IBaWRNy26bViO0kqp
 elIjqoS4FYTNu/er1XfaxLQqGtao7q7qfJke/FbObfOMLONffYlW4Hzz4Xzm1La6DIaC
 yNjef4klmdcjZPNt5WtpmF2mLr4SBRaQj47Su/feiPCReX+w8F3iOKvMulilWvS17bHH
 Di7TA02JizPR56WpaWf9R80lmAZayz565ecfxFeSC7iMUIq/krexR236D4J3dkJVUUee
 FQCOWcWqChWRoPTyA1CfMly2FitPmf4Y8goxl+bbHPcC6MYtEW24ldwPJrgmxwreo939
 djWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+mbPbFHMeTsA+ntK3qkiNRXbgYx9XnRDpFCGB3n2XWz0+vDIknx3D2ijXc+j91afW9qdvfo+v/w==@nongnu.org
X-Gm-Message-State: AOJu0Yw/1JdYWbJg+7awR/o7j9I7Xz9P4ErFwOA0F/Qq/Y6/KT9DsfZJ
 Wl6Dgwbs3pKODj7/jccoAVkyImZu79iG1zCML+rNj5lqZbMo03UTmJNN7ckNrg4756xUiNCHiZr
 1LMVrC7M=
X-Gm-Gg: ATEYQzwGxRqiG9si1LQbnk/KP0nCniurHXih36LTCLqhDFBiFu62P7ixKSuBsa6Wzrj
 zTMLRzzDziO2rVpj9xK3e9b1EkJRAaHij83jxFUEMj5IHNnD9Tqs5w+A577WoQ9at/BEFF4EUbM
 iyLp20dgfGtDjxvf+fjtCun5wCQbZkuZpY8P8DmOeFibxswm9sF2X5jJqfBTMJvEGs7LhX0COB5
 /gGTWonLtTcybvfpKhzfVnOGdVI1j3iP1cNmNTfA2cZ5qMo1/KfC0Ls6orq15saJiUqYrOmn48g
 bUWmf59PcTO9t96FJxtgXvsZ85ngSBYI5IR/wyy+bAwu3qsj98Ne0FZnaQ3u9G5jQTPRmE2r80l
 gAP33c8FF6eloU9cLqP5S+DMLUq3tRa7t2zBlazz68A8qZKJzrKJaZsx0iLwL5b+QGyIlEwAPn+
 Jn/Z2G4fQiSkKl9wXjRtJeeO1W0gSU9GzhG2pkBoO4KfBXtyNlG9PLtAd15isbagguXA==
X-Received: by 2002:a05:600c:8708:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-485235c7e44mr2659705e9.16.1772730311641; 
 Thu, 05 Mar 2026 09:05:11 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ec74bc7sm45228175e9.0.2026.03.05.09.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:05:10 -0800 (PST)
Message-ID: <5e1375b6-9629-4682-b7d3-24324b684180@linaro.org>
Date: Thu, 5 Mar 2026 18:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/12] target/arm: hvf: add asserts for code paths not
 leveraged when using the vGIC
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-10-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-10-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> When using the vGIC, timers are directly handled by the platform.
> No vmexits ought to happen in that case. Abort if reaching those code paths.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Mads Ynddal <mads@ynddal.dk>
> ---
>   target/arm/hvf/hvf.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

