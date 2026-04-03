Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D226FE88D63
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 21:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8loo-0002s0-PH; Fri, 03 Apr 2026 17:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8lol-0002r5-Fh
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 17:12:39 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8loj-0002yE-Rv
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 17:12:39 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2aaed195901so9739855ad.0
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 14:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775250756; x=1775855556; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/hwD1mqTpIM4pnkK1/K/02IeJ+MdYeHBb1wdXmoF2Yg=;
 b=bXH0gi8ELsfSbzT5LrO6iMWS/8QcYfX0tC2mL+hDzdvpquxXT7bo/t4oHfhNyJtCGC
 vWoe46ciSeDtJhQXjAKMr1lW9/2rUXpH2WOqFn5+FAIY3hQtioOmWXMYsZIUyqG2apVp
 Ijkjjlps8Gdc5gS6tb7xRpkpdvu5zUIrHcYbirDOiI6syknLEZwyOSsgObu2wH/TCxxH
 Bqg19M4Ay8tHvYmqzrGRrKiozHiImJd83fh1UL+L79w96x5Yt7alfZPkSaPh77Oe+vz4
 TvQv9Ly94b40XSFtP0VKg9OOKStP9BhlL6Cc0eKy7sEtIv/vahaorjpxFnTCiwhLxgFA
 KrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775250756; x=1775855556;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hwD1mqTpIM4pnkK1/K/02IeJ+MdYeHBb1wdXmoF2Yg=;
 b=sOYHWKOIKW4PniLdZ3IGK4FsUkGIavUzoamtZ5se9AQArDdQL5B/GssZLC9nm52H5B
 PrqXwB6G2iOEtoumkLO/TD4Gf1CSGgaHy/CKg1QUHFLYQhtK/oYKjwas/b/Qx0es3GNl
 TW8/Q4XDV9pWetC+KMlxJrgmQnZfeLrBpb56WCTXlBSPK1nrZLfJi+8Q6qQHLzSAliL1
 vjPb8qlBgF5OYo5afVPO5WjcCfwLD1L3lturaRQ8nyqIWnB4ycLSP4Lg0DPeiLFs+boG
 Bye26oQfxgYtc4S0Guf1PIrzUCw9cutVwHYqTkBDI0H+QYj3j5qMr8cS0oo/MDduQDFf
 kTHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOfvronBM3Dp65AEp135GTI1ERCMRjC+fk351WZPNT27pqqIvlzN96e+5uI1rhQmEzPoIalExhrA==@nongnu.org
X-Gm-Message-State: AOJu0Yysr30BZVjXUDB4YVH3IM3Ph5FV+tT1e4JQENEn5BMiJnQc5/Hb
 ljfUNK7zk9G+w4eFllYmVLa1nwXmcS6FtD948b4c460eCwgmNuPNGrTy7NfMhqN1ldo=
X-Gm-Gg: AeBDiesbA54ldSAcXQxgG2ZADxw0rvCM+jspQcSkNK+oD+HOClfhxrkcvhS4fIxPYYb
 tPEgvpbO6x9SavVAXuGPeBXggifmS0TWIFG9SfXer62oz37Gh5iTzsQzmAx5SSu3X/S5YIPn/67
 o8fFWBYo9YhFmrFWQ2iz9WHcgIN7VyGfUAMPD3+G/PWbPmcxkAfTGbPtLRQPc3/+7ZrNwPz/Pmj
 QdD7gIp69Evl+W4bKUgUoBc7kaleSPO9RoAduxyJOOk/WpBJ3Nz2ooJe5TIhdDVb/mmCb/yRmVQ
 xiMjkn4ZRa21W+96vVjY9GCmiaiSV4P5U3+xW7WHRB151hSS5jnNLtmqUhOVUB+2War7mBFavGR
 2wu/BKQrCmDYHBj6gEY1mvn/2P4ejBLTg68XQGuv5lFHTJzWRTx0WeeiJpHw765bbE9QKNxR3DO
 1+VlUjRu7GinvaBXbPTwnteP+o2yiGZcgeOl26KUdERd8sFEqyLXeKArICwDx02FQuRJY=
X-Received: by 2002:a17:903:286:b0:2b0:5320:23e2 with SMTP id
 d9443c01a7336-2b281855cd2mr46401085ad.34.1775250756007; 
 Fri, 03 Apr 2026 14:12:36 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274f8867csm67394485ad.54.2026.04.03.14.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 14:12:35 -0700 (PDT)
Message-ID: <03208dd5-c815-4c3e-b1e9-3213ab7bd6e9@linaro.org>
Date: Sat, 4 Apr 2026 07:12:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/12] target/arm/tcg/translate-mve.c: make compilation
 unit common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
 <20260401192057.1182724-8-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260401192057.1182724-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 4/2/26 05:20, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> 
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 8d9112f6da2..89c3b476822 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -16,9 +16,10 @@ neon_d = [
>     decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
>   ]
>   
> +mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
> +
>   gen_a32 = [
>     decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
> -  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
>     decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
>     decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
>     decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
> @@ -34,7 +35,6 @@ arm_ss.add(files(
>     'gengvec.c',
>     'translate.c',
>     'translate-m-nocp.c',
> -  'translate-mve.c',
>     'm_helper.c',
>     'mve_helper.c',
>     'op_helper.c',
> @@ -65,6 +65,7 @@ arm_common_ss.add(files(
>   ))
>   
>   arm_common_system_ss.add(
> +  mve_d,
>     neon_d,
>     vfp_d,
>     files(
> @@ -75,12 +76,14 @@ arm_common_system_ss.add(
>     'psci.c',
>     'tlb_helper.c',
>     'tlb-insns.c',
> +  'translate-mve.c',
>     'translate-neon.c',
>     'translate-vfp.c',
>     'vec_helper.c',
>     'vfp_helper.c',
>   ))
>   arm_user_ss.add(
> +  mve_d,
>     neon_d,
>     vfp_d,
>     files(
> @@ -88,6 +91,7 @@ arm_user_ss.add(
>     'hflags.c',
>     'neon_helper.c',
>     'tlb_helper.c',
> +  'translate-mve.c',
>     'translate-neon.c',
>     'translate-vfp.c',
>     'vec_helper.c',


