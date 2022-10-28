Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1512819ejn;
        Fri, 28 Oct 2022 12:40:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6U94OuWtW+bQKr7cMZ6x2980Bzsc+PlNLZPB/jd9O9HrJjV2Me3YBgupTGLpUtKyy208nO
X-Received: by 2002:ad4:4ea7:0:b0:4b9:365b:2a86 with SMTP id ed7-20020ad44ea7000000b004b9365b2a86mr937287qvb.58.1666986055670;
        Fri, 28 Oct 2022 12:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666986055; cv=none;
        d=google.com; s=arc-20160816;
        b=q1OTniJHlwV+J2ixHCRQzmEQ43bporTBwvEN4udHmGsqeNosnZJFp3qkSF49W50KfK
         Fj1byijwb7r0rpAKjSrz62Ii/OM5pjNk0TeNNeq07g9a8q0ZqOqsJqdta2XE9a0KFX2F
         H+pDY5rBca0iGP/5Lc3MBjS4OvsfyeT2yTuJBxUwrtL/qdXv42Fop8GO+Nk4j7BplK1j
         9YyiUwXdrUm59EO0hAZ9r04v/GIFQ+W8+RjESjhg2KlHBt4rn61HhX0Fl95T4oY7fCIH
         iHzxWi75hrR5Wd1JOVCsyyc6dk04qsoUQUt3f8zILw4hLqULw/6lvODBIlhuvsXvg2IA
         sS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rzVI5v95OT5Qk/CjunGAHOGoNvfw5mXFvB1FEGfK0o0=;
        b=EQdmDqIrpvKs9udLeCYH/T+Ug/bjezrTbj9vvr1AJ6ZjxY8b8uaSl3chiqa+ts3/ua
         S2tXjmUfLf9yfBGSjubI0ByjCxI2qA9jt5CBDz/uOnbj/121nPRzhTzMioINmKw0U0b1
         nwfiTlfUIyEbhg2P3gT8yOvONzt+FZ2GM7OrNGkd5MExY0ZGmC1psEuHBvigtn20MsO7
         C+2+L8UFnW4ini004dkhassQa4LMDbppxity1i4LUYzGuTgzXEqWIVTmhkI5N+ctZh7k
         F20YuKX4V0AuAc2hY1bl8LOprFJN5sArLbT4NWgZiIoJJZWcKhFCJr0G6vAxb+g4ACM/
         cd8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfweU3Ze;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id og10-20020a056214428a00b004b31dec5686si2935229qvb.46.2022.10.28.12.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfweU3Ze;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVDX-0001Ps-Na; Fri, 28 Oct 2022 15:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVDV-0001Jj-WC
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:40:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVDU-0006oV-CW
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:40:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id j7so1871868pjn.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rzVI5v95OT5Qk/CjunGAHOGoNvfw5mXFvB1FEGfK0o0=;
 b=lfweU3Ze9c0YmNMq/vjAeT+ty1xe6y06VNMbO9eMfA/Dj+Xyk6bkNfsbL3ypxaw1IV
 Ecv7fXgNFMK3hqfX4J/TqrodgrVm8utT+DGqjrjJ/a/VqYQDOa2l5zdTSOWtr1SJIegh
 MqnM+QGyrUNsiFg2DkSBRw/BHFmlrMmYTFjKrz/ZO4JwFbehlvlfiBwOfV5ib5Fpf6fN
 Z3xJuh9Iaf+B2BAgQRNah97YxEMBOaNwxhk1DeTSQerrmocLeWzouS2QL0oTqhQAsrl/
 EOOXaRofpjR2Qhedpj/4QMYWuGEo57tpYXP2AJBN3IZUXWuSPjOS69ThTUw2JvoV3NqL
 yPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rzVI5v95OT5Qk/CjunGAHOGoNvfw5mXFvB1FEGfK0o0=;
 b=L2VDmadOT/iDpUi1NX10gBQvj8rjqvAYuGnIVhv8KQb5GFbwesN1/wFvVvptT+5Zuk
 T3x8B76u/87/BTJuSr6Tt/GVxqMLzZSWApuuHz++n3Vtbi18DPSnMdyZNPasnEyqH+cD
 vVo++5aw/wl0C07QkcfkQLyD9B8UkEhSQZ2S66UZ0/i4JnKkEpDUkH/r6HLk/cJtuiGa
 rUiaZjnUkLp6sEbAK4KUtVuMage7D3xf8NDjmBZtzK04Qn3tyf3l6tncb8o8rnxny/SA
 GZwl1+vZraHykShiTbEF3Uqf3JSsh8BGisiKRne8yFptLKK2PT+BTMHyEt3QNLf4UAMs
 boOg==
X-Gm-Message-State: ACrzQf3DcZkAnMrUIq+7L4eykynmGFu7eClUmahd/cIYMEf0j0NhrQag
 PhQwubfx8OkLfRTRwxYuC1U1aQ==
X-Received: by 2002:a17:90b:19ca:b0:212:d2c4:83ac with SMTP id
 nm10-20020a17090b19ca00b00212d2c483acmr18152649pjb.166.1666986030816; 
 Fri, 28 Oct 2022 12:40:30 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 38-20020a17090a09a900b0021311ab9070sm4524969pjo.52.2022.10.28.12.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:40:30 -0700 (PDT)
Message-ID: <df540c0a-8aac-f255-18dc-6f182352cd5f@linaro.org>
Date: Sat, 29 Oct 2022 06:40:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 4/7] target/arm: Implement HCR_EL2.TTLBOS traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LaXUYNV6ZaMk

On 10/29/22 00:39, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TTLBOS bit allows trapping on EL1
> use of TLB maintenance instructions that operate on the
> outer shareable domain:
> 
> TLBI VMALLE1OS, TLBI VAE1OS, TLBI ASIDE1OS,TLBI VAAE1OS,
> TLBI VALE1OS, TLBI VAALE1OS, TLBI RVAE1OS, TLBI RVAAE1OS,
> TLBI RVALE1OS, and TLBI RVAALE1OS.
> 
> (There are no AArch32 outer-shareable TLB maintenance ops.)
> 
> Implement the trapping.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 33 +++++++++++++++++++++++----------
>   1 file changed, 23 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
