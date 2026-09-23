Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BAC98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Tyv-0000hK-VI; Wed, 23 Sep 2026 16:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Tyu-0000co-Pf
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:54:20 -0400
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Tyt-0006xg-3D
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:54:20 -0400
Received: by mail-pz2-x0c.google.com with SMTP id
 41be03b00d2f7-cc5121bcf1aso1085768a12.1
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196858; x=1790801658; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LLOTR9CkKDnKrQ68tzbnMkZi6MTfjNklUMWY/EHKeZc=;
 b=sdcTpvluoM0QbVvp/hfuoENWVCZA7WFQm+6QzK1xUTryoQDRxr+N7U4+7jPFdH2lI3
 54a1RvjTIGvfJjCJMJmgGkPRQto7K+s7VLN0VSHlrBwCpZrYjcac2nIxea74axyQkXfa
 hHkJpQH+wziLl+0IhHdnO9/YtChedIomVX9YRx1ZwNv+e8hFMuuF3lVAYiJE2kdClRcg
 x2TUobWIaRbAquvT3xsWU5bgi2fwrUDyAJxYYBJEqjnll9JbvwqwUZd/BfoLnUpa40Pc
 jezmXhYjIOXv82dBOtLCTsqqtYYm2FVPdwxcu9xsVI+hEkmvpQ9kyw583Z+nMCPcKKmN
 z7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196858; x=1790801658;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LLOTR9CkKDnKrQ68tzbnMkZi6MTfjNklUMWY/EHKeZc=;
 b=IeX5wyr7j/FZulqyLC5MnAHEElGGDNMb6vrkeLoaPnuxQF0LnFfzIFKZNdU1Ir3u6P
 CR5/X4oYsK6zWB/cWB6X2pWdBYI/qSL44o70VeAnHms+QVVlPd1XEqiDHUzMhxiHtmHH
 aonxxg+KpPGinn1npmR8jbysN05YhrooammSluR2vPnthHjAhXo7b6xv5nawcZK+zi+Y
 k/LftySCEzJIoI8hwW5WhRi+qgz1JGc5zQDb1UFBLnRrXX29IYBGg2RJZuTslzzr4hUh
 ErTBPIUTB5ezMBUoVUQ6+vcCVjXoqWGeYnNiC+Ld4zOK5p+SAyyIYng4FiWgA5VllDaT
 h2jg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLnu8L2YHbEC0JnfKqtnWiSTycxHfrr46iF0O8QNR1mUPpIRF94mn0mKBI+D3HTz/KUFIKeNb5xw==@nongnu.org
X-Gm-Message-State: AFuF++kPlz49BFrRn0Tyw7WkL1slLnIL87XZ7sNowM8x+Zt+sEALBHJD
 o9tTPSZd1NrE0ZPTLqtIqaz5sKCcXoE4Irf4YCflPYLjF+Np0ptbO5xHfeQrVdDYdIg=
X-Gm-Gg: AYBFou2ktk7lG8/0IUp4TFfzLgFI+V8ccpJtPcN+3AuxdKWhDycEkgOHXUFCA4knU5h
 otXjpZGMUoIQXGoZKYfU5mRRm/mnNM1Asfcheb38U4OzTiLCRz22lXZwzCXROWJLi3BWfKIoSX4
 YPYm/hX3y/7Bxwalp3+o8fbxAUuuUNFODLkqu7+2N3Spj0nFtJAoF6I7RMH7dNvvta2+JwaVIg/
 U7ZUay3VUIwM/bRjPaTJCWLvE3eAeMdWUhgZg2Yy7n80qBx2Fd8NN6YsR7FrstFO27HJ3Vb0LCO
 uNHLddb1O/n9HqEDq2gO01sL7GAwTiACft0nGQLPTkdxGOaZeih+1KZQQk7Eo7F6QXZeVTLXoKc
 PM/gWxXL6w0b81qlptydxPmJIIS3dDAnBFaV4JPqQ/8z9FPTokpCVqDELDAddpwh4MrrWGqNytF
 aSz2V7aBbjxW2lWjSsy4YHih+eRzIAooC40ptCgIyLE1Yhime/69bl5wLjzhwm9z/4mn4wBxvyn
 DB3GiID6evrCGaNKuc3LzwRIE+9aZ4X+EiQfPAR
X-Received: by 2002:a17:90b:4d85:b0:39e:53a:c8d4 with SMTP id
 98e67ed59e1d1-3a098ae21c7mr311078a91.12.1790196857414; 
 Wed, 23 Sep 2026 13:54:17 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a09733f48fsm831105a91.11.2026.09.23.13.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:54:17 -0700 (PDT)
Message-ID: <2033bb46-8266-46d7-adb7-330e284d8ae9@linaro.org>
Date: Wed, 23 Sep 2026 13:54:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] target/arm: Move ESR_EL1 definition to
 vmsa_pmsa_cp_reginfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/7/26 06:02, Peter Maydell wrote:
> Currently we define ESR_EL1 in vmsa_cp_reginfo[], but ESR_EL1 isn't
> VMSA specific.  This doesn't matter for "is the register visible when
> it should be?", because currently all our AArch64 CPUs are VMSA.  But
> it does matter for migration, because the DFSR definition in
> vmsa_pmsa_cp_reginfo[] is marked ARM_CP_ALIAS on the assumption that
> the migration of cp15.dfsr_ns will be handled by migrating esr_el[1],
> which is the same underlying field in the CPU state.
> 
> Move ESR_EL1 to vmsa_pmsa_cp_reginfo[]; this will fix the lack of
> migration of DFSR for R-profile CPUs.  This is a migration break for
> those CPUs, but none of them are used in versioned machine types.
> 
> (The S banked DFSR is already migrated, because we register ESR_EL3
> in el3_cp_reginfo[] if EL3 exists, regardless of whether we have VMSA
> or PMSA.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

