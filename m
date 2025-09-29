Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7B9CAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:01:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3MrI-0007HE-1u; Mon, 29 Sep 2025 19:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MrF-0007GT-6k
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:00:37 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MrC-0006g5-Ra
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:00:36 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-32ed19ce5a3so4428147a91.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759186832; x=1759791632; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hpwd6krp6Tc9qVQMPcTDxC33QQgMzfj5ts3gjl40OYc=;
 b=L6gupSITEmxiwOXfnS+yUtwLUUOZwKwt3mq98WDwOkWlwRsaoge4wt80H1NgpJiyJf
 TkgZkmjbLzpuVxmYSDds8lF5lC0zmiDBP6a0Rkn+DLRh2qIdBzwSjAI+Vx7momflXV6J
 viPv/klsf9n01T4ExqSub4Ha/ft/kJj8a+JBb5qP+fyL8lufo1jmVJpkP2LZjcX0t+hq
 /aQjtiOoBAaSVE6xlFpbLJTJqhC9dD6EmOqnxq5e8F8pUPjvN7+gOWhRitzJ9NKRpJ/F
 YLGLA63l+3cuUJZum0ifCh/h5HXKV8QoazADTyhZxxg1M+1ONj2kyHNkNx/H8uXK0Y0/
 tAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759186832; x=1759791632;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hpwd6krp6Tc9qVQMPcTDxC33QQgMzfj5ts3gjl40OYc=;
 b=oHPajQl63kIzqX2aNsu8w0WQHdmzqlVFP6fsJEh4xG80xxG84TU3Z12120p2PY5bIv
 JnLAUSYVzjae4C3/iCd58h0qjPy/6bUirtfXBio40UXoJl3fewojm0SQcPjMG47dmUff
 b5GCuosLjQlidQX3DGcEaCD7jh3THu9oqxsI01Iz36BsAQV+0SkuQJxsMwVN/ZdAw2V2
 ZkkeUQml82isREjhZlt523smTqtPwfAEaynngsPgCxdRrnNZMIng5ZUswchMeWrzoVHA
 9WE4Q5rlHHSbzZKEQjUCCjIjGPPN+0Z0AZrfMfkqTt3wYiGqJY1ERMGQ0QMPNnce2u6d
 +Beg==
X-Gm-Message-State: AOJu0YztarYw+mZk0ZRvfR6tS+BHFFHbZCpkaexs+i5C0jrrgQv8cLSA
 hpH5FSkGQklL0M0BsYsOBBH1DRbhveG91Fdp5GdaQ8+o4khtGyv6t1Bu8efA5b5HQ0k=
X-Gm-Gg: ASbGncuMlPSxheB5m231hpQQQL0skJyov2o31e/d8PRPSqZv4XMrr5UzJN58UY1UGzc
 GOEwV8phMWGeeJ/bq3nqZ4XtiKgsy1qp5K5y78jcd25rPxlUqSp8tk+14+lrBVYgMjFsVKlbhub
 WThigx3F1MB8JJhHbxrmHs9tXGk42T44vj8uPvb4EbXFRD2NCazWXMf4GoAWOnl+Ep4jagSChon
 6Mk756KA8CBQb6AA/rRMJpf24OS5p26SelVO5XiAlXKttOoEm/k4vUk6WEDBbZrsnYfP5MRXqBb
 tDQc1oPXAUL/SqGdlfXeVfnWbOHP2u1KZElKBJfdziXNoGKPey5Ba4oSRyjujYlETUGP7tiWoGk
 6nI/P3ZuCan8Uv7kAKhxIdqdqUElmJ4umdJc=
X-Google-Smtp-Source: AGHT+IHctUn1DmR04UVSKPmXFltNAn5MLvEESmhhOnWsOmTfn0yAGW0VFOjdso6CiW3NMVYk8c6teA==
X-Received: by 2002:a17:90b:4d8a:b0:330:48d1:f90a with SMTP id
 98e67ed59e1d1-3342a2cb65bmr19031409a91.27.1759186832202; 
 Mon, 29 Sep 2025 16:00:32 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3399bc02e26sm108281a91.1.2025.09.29.16.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:00:31 -0700 (PDT)
Message-ID: <7cf7e3ce-2a04-4bbc-b0ae-5a2db3b53f45@linaro.org>
Date: Mon, 29 Sep 2025 16:00:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] target/arm: Add isar feature test for FEAT_RME_GPC2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-2-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-features.h | 5 +++++
>   1 file changed, 5 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


