Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC11CD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 08:11:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLGIS-0002Vd-UQ; Fri, 08 May 2026 04:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLGIS-0002VF-91
 for qemu-arm@nongnu.org; Fri, 08 May 2026 04:10:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLGIQ-0002xY-QT
 for qemu-arm@nongnu.org; Fri, 08 May 2026 04:10:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48e56c1bf5dso10601505e9.3
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778227845; x=1778832645; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/XHjoh39IpiuQb/DDadtgvYMDj4z4B69De97mhbmmpk=;
 b=T7ps32B3UK/kpfroYnGPPRXM2ibqBpTGpyjmlqn3T5jbSKCYOUzAlURHihr2epyVdM
 L17riTsG1/uLagksVaCyHz3blPvFS+ll3eogneEgvnSjHFRwyUKSFW89tWFR9b+87XfM
 ql2brzRI/Jpr0Wiurj2E5pSYNgfm9eQFosTCfKeh3CvaVpu+99bRXjOuj2bjaNNEptI0
 Vqe4SOM4np9lgr1sadGRa7cuHzTeJvYOjDPFWLsVuzHaAddO/zevw3KnmauSx1o52mJa
 lh2ZENJEARTPuzkndr6A4/aRDiGTa73NjPP4AMYncWAHw127/SWqmEUniX5QV5CV2dwl
 yHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227845; x=1778832645;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/XHjoh39IpiuQb/DDadtgvYMDj4z4B69De97mhbmmpk=;
 b=dAzRlK8E+MsD15DtWghiHhYluJq9bNg1OpokTWSAj1/wq0X0MZw4NxopKhiFfNYfFF
 CmCjqjurG7ObSO7r9I0we1jP/H85aFWfRj1GSEMAcmrPbYWazlDji9BFfCK0AhFBPYsU
 39pVP07h4UWo4dg/cMEFvAkCpmzX2Vt+QOdLGSqPYXDrpgLG1ca83rg3oQtbX5AyrxZg
 oPTR+jF7aBxWHQ2At0ZmBykRp1WIGNdQTdZiMRkltkY6+88r5iF0S97xjITBtWIRAJuG
 8ceJgCNVZ9NTuzK0GvfaUmwT2JrQ/iK00zORZKdZ2ntOrVU/x22gyjB03kUbvSqJvdgX
 BO4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rt91zoMrWSbT7zkSJxoiAQTjsmoQiVePNTjVgGDUSy7JWlgweoGH0t+q50TvV/IgIOq5bucYeCw==@nongnu.org
X-Gm-Message-State: AOJu0Yxd2LeSrFUBQOknsPhlo7HnOouvTRvqZb2ABpggbOA48H+WE416
 Tjt0u9LWn6c19u1ZjNB8fLPxSdRWLWisvvvqw9p7HebxeMcE6lHkwDk0QJkj5ekzx1U=
X-Gm-Gg: AeBDiesaXgPg/hrD6J2So6bsdJmQ6Z2wxbWcCbLanHumAJ40nNmuXjXBKC91H1+tmsL
 hJ3uCckZKWqKEIMoMv8vbySpm/Hg+NBrQtwoLsf2wWqsnXs1Hq2I9kV/4nICxKlpS2xJNy45l1U
 25FgubJ9SUZ7/+t4M2AeaRy4vSOF3IuntEsChRYCUcMZkWw2vC86NR9+ihFONiFj7tbS1r4bAxv
 hdXgE9ZnfdFPJcSpvE2dJBXhFWQeZnB+wOOcBXw6wDPxxZtUZHPuKLx6IYv/zwQZ1AXAfYTHOsj
 7+TTiuCErNGEoCpvfUwhlDPqN88YGEydacwAdxRheZ3jgqNm8MscFqfb/pZFB24iOw84o2MAoE0
 C6gqHhbww0t3mNsyShdT9sC0eXlrQcNPUtuQozZSxpkiEnX2EqnZMX1jLODH0Szj/iJ9pHiq+8N
 zSfBCIateiiOmz/53Kl7x4iAYd3CsPIXS92dfB8DOcnDnQf9PVxcWc9Sd1D53W4bEr
X-Received: by 2002:a05:600c:c107:b0:48e:51f8:eb37 with SMTP id
 5b1f17b1804b1-48e51f8eb65mr140801755e9.25.1778227845527; 
 Fri, 08 May 2026 01:10:45 -0700 (PDT)
Received: from [192.168.0.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65c041b3sm16943825e9.9.2026.05.08.01.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 01:10:45 -0700 (PDT)
Message-ID: <ced7031f-45ea-46da-abcc-09fc4edb4ed7@linaro.org>
Date: Fri, 8 May 2026 10:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tests/functional/test_kvm.py: Use -cpu max, not
 cortex-a72
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260507194728.2034696-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 7/5/26 21:47, Peter Maydell wrote:
> The test_kvm test claims to run on any accelerator supporting
> nested virtualization, but it specifies the cortex-a72 CPU.
> This doesn't exist for KVM-only builds. Use max instead.
> 
> This fixes a failure like
>    Output: qemu-system-aarch64: unable to find CPU model 'cortex-a72'
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/test_kvm.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

