Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp96190lfc;
        Tue, 25 Aug 2020 11:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgou+BqeQMSOZRFjwBRF+Lwlu8lkHyfP2oa0TOzNJNMyONSa2i2+2AsFgPyEPzCWLIo3Um
X-Received: by 2002:a25:f30c:: with SMTP id c12mr17522151ybs.471.1598381263843;
        Tue, 25 Aug 2020 11:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598381263; cv=none;
        d=google.com; s=arc-20160816;
        b=Te/DDYrbRtgsKNDlh7ND67F2x4GbldTdaX//t0BAf6jyOydRHUk7V/J6LyKBXPo016
         5kvYwhd9JXCd0SBScO8CYvf6c1bdYZyWz2WmW1P/YcmB7hU9wnbwSaFi+e4fzuaf2CkI
         7DzcX+LtVJ/P6nukde+yL86ys1UOL0YW2a9fJyl87VQhKV/LsQtwIQvdE2M0X8ZAEqlH
         euBRFrNeQd4q+m0oPxO7AufHvZM5QySHWOEIkJONcvGy8wIYeyqMTUoZZCT56d0sso38
         gjcSmqafjHnIGU+HJF7dUIaXVr27R9zM7x/NJ6+aG9Odby1TMQgxDJBoxSCUKtFLhRNH
         AaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=INk7xhC48BJKm1t2gszLaggr3uZgqtzBv3PAF5ryLSw=;
        b=EJU5NIkxOzZKzIPvnVImMCPHUUMvOlbiqNmvXjFC6LxKZisv/baG2uVWAtIZCdnJJu
         upG/MV7d7cku/raajbFX6QMm65ErfRYIQ9K9XJVkUQZ32xVxfoQPynfZz4WLdSKHjjAx
         XLR/dMcfvo0F9ZsvHBrZFSP0gI8reppqs2dLRML+oCYZDszvBVqeoG2tjbLc8yE3NdVy
         FgnNW/AWZkvckU8Qc/QHuJZcpvXksPJlyAppbhf37YSu2CTgi0fBrQmNVPINLXBVnzkP
         wH2Y3n5iQhxKKxpnEaeDSRptC5MDRrVDi7zk7GiBUmVQMHto2J75Vucugt7cKzx+G4E6
         wyOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWRqIaff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f38si15494868ybj.92.2020.08.25.11.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWRqIaff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdyx-0005T2-9K
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdyf-0005Ak-Jf
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:47:25 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdye-0001ay-1O
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:47:25 -0400
Received: by mail-pj1-x1041.google.com with SMTP id mt12so1709576pjb.4
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=INk7xhC48BJKm1t2gszLaggr3uZgqtzBv3PAF5ryLSw=;
 b=yWRqIaffm8A6teJBNl6bZ1/Vgj9EuzVYZsBfn9283kDr3Zc66TShfmG1gHcCVKwhs3
 vZTmx8M0oRYM37TOC3wpaNRAQuMRDZS9PTAVNll84D/OgNnoNNOdDl5zbN3WO4cXDLUu
 3SM2Vc6yxVFVPevgFLM+oL88NxSgfvXHA9/61G7SgYoRj9CL5M+K4IFTfuyGJWP8EYwx
 WsLZOdAXfkUGTrvpAHI5VuxF2RdmCv8E7RU6+/ckTSi2qlhiICEzyd8rE8zvl5L71I9e
 fCmjho/+hz19Dx+hB+HSarfS/b04dm086TddHlnzX5/UbU+D+SlSlisJLJLaaAhXKxv3
 PS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=INk7xhC48BJKm1t2gszLaggr3uZgqtzBv3PAF5ryLSw=;
 b=cniGSwGd+3pvJDpL3DHSl2M2By2Nk07v3W61s2iXSEaDyhYTwnXTOW/w+hb9O21O6X
 V8gLmhebH79JgHGeJAcOd55Xsm4KIBnyQPcWSGdWYHQEdiTps8HgPWM4uYGbPK20EUU2
 5pgd6/Z6Mn+k5sFXw8vSpq4wBJndh39L+Rm9vChx6yghyOfr9kt7hEc11fm3jX1wgQQJ
 hz/T05qwKpM0vspKJnn/t+pJyV36sCGHqYwY1cnAYVyQCxCuzIvCnHjatWw/DNXKr8Wy
 Rc1ixTKoU4SNsxoU8yk4QnSQbYGUX5LsNQBViDN4ZDxkD5RpqQ9CDYreXIX3JPT6+PJ+
 LriQ==
X-Gm-Message-State: AOAM530YS1Y374RmyiFezaTl7K0HDb7t0HxClOmmqvdHOCqANv7UZ22x
 hbJORE7KShMVBzBqADQxdmbmYw==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id
 d20mr2601458pjw.111.1598381242505; 
 Tue, 25 Aug 2020 11:47:22 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id ga20sm3353561pjb.11.2020.08.25.11.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:47:21 -0700 (PDT)
Subject: Re: [PATCH 13/22] target/arm: Make VFP_CONV_FIX macros take separate
 float type and float size
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f441243-16a7-710f-6624-fb4cd2520f42@linaro.org>
Date: Tue, 25 Aug 2020 11:47:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lhmqrkVXLeGc

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Currently the VFP_CONV_FIX macros take a single fsz argument for the
> size of the float type, which is used both to select the name of
> the functions to call (eg float32_is_any_nan()) and also for the
> type to use for the float inputs and outputs (eg float32).
> 
> Separate these into fsz and ftype arguments, so that we can use them
> for fp16, which uses 'float16' in the function names but is still
> passing inputs and outputs in a 32-bit sized type.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp_helper.c | 46 ++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
