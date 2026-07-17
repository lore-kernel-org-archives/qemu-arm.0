Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A013CC44520
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 14:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkjGh-0006Iu-4x; Fri, 17 Jul 2026 10:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkjGf-0006Fi-Gy
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 10:10:21 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkjGc-0004sn-73
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 10:10:20 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso4861665a91.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784297416; x=1784902216; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S6lVprp8mJOSoV18qk/VmLgX7ktHbEq3PtjuHN29kUg=;
 b=kbwVlnzYN8Xsk5yufZxZB4vzzaQtzoKUhWuac8iSlP+8Gf6vBe6dra3IVuxYv9Jnao
 +B/WCg2C1q38Sh1lxf8H0i+ZdkJMrjG/BI9nv8FTPkyxkIS/5Xg9yZ1aXJYBJCvmeKsA
 qikHNoClV0LE+/OlUIdNBK9nMLdLazQsuQLoWEiytwZSj+fHhO9mY60s65PbJGF+9BTl
 XsOVyuxDpHRwM/lLkKz+i+GrAZm7zRcUMnmxEzYhwaQFPa2IQunKXtp3MWL8rGnQc//L
 OIfQMDj9o3Mby2nEVb48VZAuDQ78+QTq31JDx0G9fCfdjyaL6H5nV8WiCQRttsvnXks8
 7rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784297416; x=1784902216;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S6lVprp8mJOSoV18qk/VmLgX7ktHbEq3PtjuHN29kUg=;
 b=pfjgVBEHtCNWsnBsDPWDLgrOJfD5tYzwbMzIMLG7jE9uWASRh+G6+ZfkWeak3I9pyX
 mZH34Cxk6+coihf/WZxaVxouD/f7+UhKEu1ntMTuvVb8Xx1sJzUQbUn/ZPJM41me9VYF
 r8FqnxsoAlTIn/sJ729LkG+cSKUmTkyuJtBLDIHc6uvjUoiNHcNOzH1baU/neiijK//X
 XAzdmmbVYp5ZtixEXbrl1GRMyLOXOiqsf7XOeMP7qZ/GLkws6NSqToSheP+Wx84qsJA+
 wPB9ILqj+84xR9Ql/P2i4QkGthEZPt4m0Z2zt26q9ANewxREGEKDWA4nVMacAcCyb1vM
 lYbA==
X-Gm-Message-State: AOJu0Yw8D+xILZrzIpi0H5Smnyq/D+Q65OIJm29FZblLlxwpAqtIFYA7
 iiuKeb3pqX/K2mKTl6FsjS2U2oWSmXoExVh4W/KuOF78/oBrV7xQaoXudGN7QabYNORiqUjAReQ
 s5mgW
X-Gm-Gg: AfdE7cmSLKsI7hA2B4ZB8j4BUwrSo8Xg1EJCZhaPWn3oe2c4ISIrx73BN0P8e00Ta8a
 qYJ5cc8UJBczNBZix/k/J7VeEcY0qGprwj7ssgHuwqtij6w4vDGI+Mky1belfH8un5RUe47KMp/
 RFwJ7HV0WxvNOLd/SJmPIDL6XmsEKsLFzNoJ05u3UXEswlDZ2RJBt5Fe2nsOeRkzi6Rz4G8AwxC
 i+8Z/kambUrR64xYKQWdTLxiHy34sF/A9SE/kehlyTYUx2Ikk801Qwyst7EQ7UX0px5xmsbVedY
 LFTCRZhnE0gqZvouB43LfgG50GggzQgzhTeURygaUWNHzrS0LfZ+g2Lg4fb0YSeObsJmcBbhocy
 vQgyEjmz1+f1zWtzxQXQwKcmUy3W1U+LKqFGmf9ZZFcbVayRY2eGY2O/jqsZ2o0t4ZuIIJziFbQ
 lzNyrv/IaF3t6k6P5T0Uw=
X-Received: by 2002:a17:90b:3b90:b0:380:7763:3b16 with SMTP id
 98e67ed59e1d1-38e4b498176mr2868307a91.19.1784297416454; 
 Fri, 17 Jul 2026 07:10:16 -0700 (PDT)
Received: from [10.213.131.227] ([32.140.233.50])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1bb8a4sm8590636eec.14.2026.07.17.07.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2026 07:10:15 -0700 (PDT)
Message-ID: <2e2b32b3-95e2-456f-8bf7-8901c3adac3d@linaro.org>
Date: Fri, 17 Jul 2026 07:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 47/51] accel/tcg: Use addr/last in
 tlb_flush_range_locked
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-48-richard.henderson@linaro.org>
 <f7bac53c-07b7-423d-9097-597f22de24cd@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <f7bac53c-07b7-423d-9097-597f22de24cd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 7/16/26 12:13, Ilya Leoshkevich wrote:
> On 7/10/26 22:53, Richard Henderson wrote:
>> Change from addr/len to addr/last in the implementation.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cputlb.c | 71 +++++++++++++++++++++++++---------------------
>>   1 file changed, 38 insertions(+), 33 deletions(-)
> 
>> @@ -733,7 +736,7 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
>>        * If the length is larger than the jump cache size, then it will take
>>        * longer to clear each entry individually than it will to clear it all.
>>        */
>> -    if (d.len >= (TARGET_PAGE_SIZE * TB_JMP_CACHE_SIZE)) {
>> +    if (((d.last - d.addr) >> TARGET_PAGE_SIZE) + 1 >= TB_JMP_CACHE_SIZE) {
> 
>  >> TARGET_PAGE_SHIFT?

Oops, thanks.


r~

