Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5259775ejc;
        Mon, 6 Mar 2023 16:04:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+dMnQtR27ftjyvzMO/uOeisDwC4X3u9EFEwbyZ+2q+661p0BsXNUYcXc2Yy9z2ITtlOR11
X-Received: by 2002:a2e:9b89:0:b0:295:a542:8b43 with SMTP id z9-20020a2e9b89000000b00295a5428b43mr3365138lji.17.1678147476332;
        Mon, 06 Mar 2023 16:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678147476; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5HhQ/C/vD6De+PJ0NWujaHZ9y6aOcA358r8IHeAIdK33iuhCMMUrzNGc5yYvTUM6x
         xFGa/+Rjxh/WP4gjyDNrTfZcdArcViBNb1wPsLV4uRteeY46GLdBwn8oKTXw7oHcDxQH
         41vs7Ta9+qZ/7hY31o98pr/4duxZh5yfZNAUquSDWBKi+Y+ZjW5TjiWUF2R8MG5uUxuk
         hzNhVpRz1Vbj8KWcjzdA2jMoz68L5+WJLZIoBZj1zXh/YRGy0FpjqAtrn7mqH+fjx4dS
         MelGR6P/L71cmksgOVFFTemafGFv0ER7ouDeQy5BPg6bpZqVA303GbMqiCst/ahyx42b
         dYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aCoebHdkpPPcBj+jDj6eAqnOoTvKqv9yJqVJuh6zxc4=;
        b=to4Bfu5bCezu73QOcpO+wpUyFJhw53WmWL9W1rIfcvCUyjgFoHF+yPDxNwq9VQDDML
         k3JJk+9W41eW+ir9YQGSvtAMKJ9d/Kx5S+k360pwL2TCo2dPt8x7wEizyLQfdX1S+rgC
         CTd9Uw1AJSRTMo7GlbFojivv1Cg6sXo1G1k2rTW7DwVnO89RTWgm/G3Jb159yYwvul9y
         yspmGmc3Er61G0xqZvSlawOazYssTzk5YNYqxuPnkL4LV0mMVK6rtPP5pk6klnVcq/gd
         YKPycDTqhTwgJMZsEqQc8sd7ohkWngntjKbjEu4g3JXf8mM2eQiQ0mr95CmewNMiHPqm
         wodA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITBXTB+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a2eb94b000000b002983b86171asi3214226ljs.173.2023.03.06.16.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:04:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITBXTB+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZKoK-0005Wb-4q; Mon, 06 Mar 2023 19:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKoG-0005U1-Rv
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:04:05 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKoF-0002VJ-21
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:04:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id l1so10502541wry.12
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aCoebHdkpPPcBj+jDj6eAqnOoTvKqv9yJqVJuh6zxc4=;
 b=ITBXTB+1zKGDHoZTVsRonOaDMrUqHqnX4pOMw9ymKVhGiNSw2/GrH8ti+weKugbOPT
 GKUwgBxCW+9oWIoSVyPlD/rpDgwxKsjcMW/uMYwlU6m4iyGgrDhean8IAwF9wfsq5Tce
 FLyth1JpiYYZRDN5REpA2UFRAmzzrjlEuwb8LmbX+7glbZi+h2dAUgwBkI2IyvoQXS2V
 Sp+Dh0VmprGn8ntnnu4WZMHGgwh3HVg8fg/sKNjKtgO8oCsjgZ81L9+DDs/E27d3Fyr/
 OGpXgd7JlE+6t6fNiFDdG9ADZ0DZ5uQSZp4zU9rI7B7OmIZdYuS8YnN/W9UTH3b30oJd
 oUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCoebHdkpPPcBj+jDj6eAqnOoTvKqv9yJqVJuh6zxc4=;
 b=EoYADwJJ1V+MWlYunNuKmxj1pA0COOv0JDyuVDpfTGcCzPG600rpZkYkmbYsawSkwW
 WVM68aiPV07yKuSPlHhPcFm7G0HQYObyxOC/IXhmEnO/ulEPsKnRCLqV+rKyvugouz5n
 2sX09zmT5zIhWWtni1+xFG1vhanINeaFOSkDrM0EI/v26WW85F9/sfxl1Tsd1aHflnHJ
 K55utAO1DU5+kOp0KB0EraZscQXzHCJquN9jtL9qHmEVDPoTBOqzUCMuPgvezVEk5hnw
 pPd6X8ca4RYcc47eqPG8H5+N5IwdcPfKY9NwpTS+aZO4pQmvDTqhdwvRpta5u/xsK8Pl
 C4vg==
X-Gm-Message-State: AO0yUKVbriHkDd5zMjPtvy8Qw/M4Y8D37ahcv5otS6/L0SZsyoEi97mj
 6xexRHkMqXiOrqqEQf5Mt2bu2A==
X-Received: by 2002:adf:ea90:0:b0:2c9:d90c:56c3 with SMTP id
 s16-20020adfea90000000b002c9d90c56c3mr7549062wrm.53.1678147441482; 
 Mon, 06 Mar 2023 16:04:01 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 m16-20020a056000009000b002be099f78c0sm11096122wrx.69.2023.03.06.16.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:04:01 -0800 (PST)
Message-ID: <3b40fffe-c307-a0ea-7cea-c0f3b72848ec@linaro.org>
Date: Tue, 7 Mar 2023 01:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 27/70] target/m68k: Avoid tcg_const_i32 in bfop_reg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b9yXJDINyPCO

On 27/2/23 06:41, Richard Henderson wrote:
> Tidy up the whole function, hoisting is_bfffo as a common test
> for whether tlen and tofs needed. Use tcg_constant_i32, and load
> a separate temporary for mask.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 42 ++++++++++++++++++++---------------------
>   1 file changed, 20 insertions(+), 22 deletions(-)


>           if (ext & 0x800) {
>               /* Variable offset */
>               tcg_gen_andi_i32(tmp, DREG(ext, 6), 31);
>               tcg_gen_rotl_i32(QREG_CC_N, src, tmp);
>               tcg_gen_andc_i32(QREG_CC_N, QREG_CC_N, mask);
>               tcg_gen_rotr_i32(mask, mask, tmp);
> -            if (tofs) {
> -                tcg_gen_mov_i32(tofs, tmp);
> +            if (is_bfffo) {
> +                tofs = tmp;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>               }
>           } else {
