Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D75EC83F26
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 19:45:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhCkB-00023Y-7V; Wed, 30 Jul 2025 15:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhApS-0005Be-Dt
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 13:43:08 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhApP-0007i0-En
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 13:43:01 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b3be5c0eb99so35518a12.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753897373; x=1754502173; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZDUTFPPxGD6yliM/6vrdn7s0tOtLSLHwAk45epr4Ul4=;
 b=ubDz6WiyCai7bHkFXz0fMYZKRYt1o+7hTye3UBtLCNzcne2IokoXJ11+qevMnxN1qQ
 Psc05qcO/hKGnWbwy8Kp8rV8carU7DZFfhe506xbjA9LERrPcPYjgItiG9qToRehIKji
 LvqNaoNesLQMHa1GrOoBigk78lwMnlkBgwLNo++Y0LZgneq5qINNPt3KLYyWYNMiF+BR
 zV4l63ZtmZM/YbBFdJ3zvru5U3rdcKJdWL1l+9V+fMDqXzuI/a4r3W4Ae6m/FI95UVMb
 dFTb73K/h8zdXlTEXWuLC49wyFTmDHfFH9EgJe+ow0W6U5gIyo5lmIbJxCgUXHl4n/xl
 iOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753897373; x=1754502173;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDUTFPPxGD6yliM/6vrdn7s0tOtLSLHwAk45epr4Ul4=;
 b=G6W/y4DFTJ6j9yCUoY5Ll5c6bQoL4z9mNKch5O4ITr92L5HxD5IavgExUXY0KXjQ4R
 8oq9lCM9EET2TpqxhIU6lpmkea1TYwEF/mHc+aq4bAWyksLiwyN1ScwMh+1kTnwmx1ue
 2FuWtmTFuHiNWclIwYdWfwvfrpIdDlUVnr+foml1KIk+J8ANPc2znrldT4jB9Y1GE1z4
 e2MAKScAytBiMruEUi1V7S951U6Xoub+rfp/7vjej31ciZLTwz+F4TX60lTB1sxtyMEi
 Apf5SQpbPmN+kXlPURNhvel4tkhYmnIGv7/TBK0HHeofQDuPgDW6gwz8NOJ6V/B3b3Q/
 AlMQ==
X-Gm-Message-State: AOJu0YwZACjj+4VEhLkrWiMoV8SePYSsldHr5oEaNmnYvFYzUSIBzFNF
 oqhDPkXsrpBcnfsu5MW+PIkSzivB/X87dCh8h7yeT67GL+7jKw5OJIKdQlTJ9QhPQqA=
X-Gm-Gg: ASbGncsbj8TnRvUSVzorji0SEE5Np76YIbutKd2uitQ43FcPDSMMdRLLosY8zaHjU33
 u5u7wKYXJeZFZCFZ95wjKnFcnsPenixBpHohXMzM+vb8EsvKNRvgESkhSSLm9zjlktH3IjbnznH
 zHD73EW9WaMqzYlPASNH0MmtADZ+xcRqq6pzMvW8ywnBUjTaFWfJOoXMlikpEVqvPIgCYb/EBIU
 Nl7FAG+o0cJQq064qEt7NwMJCMbINoexijq57L1ExJ+8FFPDKk3AraOLTpRAtFwcWoMW+96GXDt
 QGkNgnCF3Z9pvhZloybfYGxBy4CnLhsphTGRXFDpJP9lu4NmM5kE/NOql6eNa2xhXjPjM61pq1z
 HjW/NvdtWtXuzDPJPonTYZ/2gmwV5Bxf7mUjJAGSpxr5hgA==
X-Google-Smtp-Source: AGHT+IEV4zf4IrYhjz1tWooIklmCRbNBG5QIMQC/i3/DtqKZzTtFrj570VuyujMAHayAIR1YdzbVSA==
X-Received: by 2002:a17:90b:57e6:b0:313:d346:f347 with SMTP id
 98e67ed59e1d1-31f5de58642mr6092344a91.35.1753897372812; 
 Wed, 30 Jul 2025 10:42:52 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc4ef0sm2533488a91.14.2025.07.30.10.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 10:42:52 -0700 (PDT)
Message-ID: <fabe48a3-4368-442c-8a45-9a3a5c2cbb33@linaro.org>
Date: Wed, 30 Jul 2025 10:42:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] linux-user/aarch64: Check syndrome for EXCP_UDEF
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250725230849.13026-1-richard.henderson@linaro.org>
 <20250725230849.13026-3-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250725230849.13026-3-richard.henderson@linaro.org>
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

On 7/25/25 4:08 PM, Richard Henderson wrote:
> Note that we have been passing the incorrect code for most
> exception codes: uncategorized (do_el0_undef),
> systemregistertrap (do_el0_sys), smetrap (do_sme_acc),
> btitrap (do_el0_bti) and illegalstate (bad_el0_sync).
> Only pacfail uses ILL_ILLOPN (do_el0_fpac).
> 
> Note that EC_MOP (do_el0_mops) ought not signal at all.
> For now, preserve existing behavior signalling ILL_ILLOPN.
> 
> List all other exception codes and document why they do
> not apply to user-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/cpu_loop.c | 66 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 65 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


