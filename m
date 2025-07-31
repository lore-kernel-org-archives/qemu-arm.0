Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD6DC87FD3
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:11:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbUT-00031q-3n; Thu, 31 Jul 2025 18:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbG5-0006R9-9T
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:56:17 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbG3-0003pt-Mr
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:56:16 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76b36e6b9ddso1253117b3a.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998974; x=1754603774; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SRC87jIXMP0qugdtfgXa8tdfered5QnzHmAI1huFC9g=;
 b=CGY6Zb4sT8Lj2GG71/fOaMXuCf1H+9wjw8Lxo616B/IcpZ7YBPowVTBdhcz3gdGJ+p
 yh/cH70bJJgWX7DPwkd1/Squ52Ju2hgr1+KtC4ACGORCK8f4oEXn1mTuOyQtrKsas0du
 QQb7eRmivXT3LvlKS8s4JnXZdhySzkSeXI+P/Peg52gcA8A9/yuHfe0F/ZDU7C2V00md
 0ndVl63OsaW8NGKVJQ7jygUF6ONsf6QKKYkkzixxkDhgS7RuZWSqwWISBhKAXfft3bly
 hVDNyP9IAij19xgVIC6V52Lfjom8s3im+/m3Bn7liiGhH11FrIt/LR2Cbf1pp2nnB+FY
 VS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998974; x=1754603774;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRC87jIXMP0qugdtfgXa8tdfered5QnzHmAI1huFC9g=;
 b=DNphbDY1dBFcPJ3BCz6MDZoVekqKWPduTmKJ88NkGXcvubwmWx68xKi2Aun9cMCtG8
 y9pKMPMXsgDxjQoo45ZdpbXbR4zdLbicYJ2fGIOBAIitesVP9qnKbtCpXlmGoxemh+am
 SM2uLQTGt2mA9VnMcQoNWc0gPvivG0xX6yuXTBWvNA75efsR50HGxw0fZYFj9kE2jRyc
 fMRPHOVL6yfTXAD/vPcAZbS2jrA2tvjVfKKlcMxqI+RmuKcDe8P0ujdlOc/SywVzNswW
 LAfarnEz27VzOwoeFkPbcSlIdmpbwWESC8ljuYEyKCldrB6Aeq6UiknYtq50+K8NOov2
 stqw==
X-Gm-Message-State: AOJu0Yz+NYcXBvCMjGz1Mv4pRe6EGgMnjoxplgfZLf2VHtVnMkMtepHs
 JkeeUi2z09hgEDwAF0Pc1DwS/srX77n5SJz6PSvauhcpBYF+NZKVocPsg/H2d/83WLQ=
X-Gm-Gg: ASbGnctDLmIWD48mkyHvf9yxWuuEUwpNp9XB9UrDN260OdpDuD5QcjLYRhu4OoleP/n
 D17RrYTlOUVInMCrNMUAE5llbH/6vnjTr0ioPqQEhDEKjFW+39oWdxIaGwBO4enDutCvGuE05bs
 5HUI3wuUn/KQMm7yEkeRlZ8GJJRa55gGrDnRQME++kkYE8Fz8NMHxpHLOOrTlk4m6b8q/y2bZc3
 r0to2jFDxQTE6BOOPM0QYfs4v8MDhZomg4JCAeIPNRpTmYJ3CTAEZXDptjHVvdV0FNTckC0dPV2
 D6rUgvQT+uggQwGlY396Fx3TMZgZoRBaAXUrJG5lGje1hmM4J5i1Ie53k9SW+1mvDHWrRpdF3hH
 vC5Zpx1fluxtCz+VRSIi5ri9DOSYdOKu/IV4=
X-Google-Smtp-Source: AGHT+IEyOuCNHQQ8cLq22AUtnQUqZazKqOSgJs8t4+jT2qHlTOYX2tVcRTkW4BktRBV3rDJXVABYfg==
X-Received: by 2002:a05:6a00:80c:b0:76b:c9b9:a11b with SMTP id
 d2e1a72fcca58-76bc9b9b027mr7101429b3a.3.1753998974161; 
 Thu, 31 Jul 2025 14:56:14 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbce4bsm2411038b3a.77.2025.07.31.14.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:56:13 -0700 (PDT)
Message-ID: <fbe224f8-6270-4c74-be4c-2d643096b4e3@linaro.org>
Date: Thu, 31 Jul 2025 14:56:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 75/82] target/arm: Enable GCSPR_EL0 for read in user-mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-76-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-76-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


