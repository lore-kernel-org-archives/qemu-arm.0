Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4089461lfg;
        Mon, 28 Jun 2021 08:12:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIa5g/vK8SRmzPA7XNohnSDXb/V0uXdpnOrqn7Ck/Ql2AyYhLaigWcIuRMc7911o169/S2
X-Received: by 2002:a25:a549:: with SMTP id h67mr33103221ybi.393.1624893155869;
        Mon, 28 Jun 2021 08:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624893155; cv=none;
        d=google.com; s=arc-20160816;
        b=DOhOSggu18HaL0YcQgS/l4YIsQZsU9Zqeh7qv0+7maZltSFh5AiDRJuoe6lJT1EN7W
         ylwtxzsVwSwUkdygtDorXCCLdMAlmdNdc/5J9mQ72itId70t4M3IcwhXofZ3dR+61aVj
         lDThklr/FjWhIDco4Bl3z885UgNus73CZxMXY+YhU7U3j4hIaM61gTU2v0Z9nZw7ny9i
         m/gw5pJCUYa2Ts/X9dnkGVXSt0X0h19qm1zZD7WkCUHEqRqCMxKDS37Ov0TzptKYoeR3
         Bw12+ka7n3OiPW10sqCEVXwSfBorz922UZuyhQ7ofX7WL+Xz0SpU4sSPINsBUx0RdC3D
         1iOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LtJRZ4wpkdVLI7QRibc2PisZCVthWrAxqQz/GBZdZtY=;
        b=z7KtQDrmtWZx8Hpn1QzfkCKo3fjgXKzFfqWaX7W/pejM9+apio57Gvd3ixTfS3wKrC
         /FG74nSOADaxLAtcTGWYsIQEimDFzciqmidTVStH6ZHtnS30igGJ06N/l7cJeuByWasz
         zhfeoAGRvdcP8TiNk5hk+AeFvRoMjuNsGr1STXb8C6l7cTxCur6ccHxRPK9GTyBVvIjX
         v3viB74+Qc/fVtJNYFGlhquBMrW04k5u06eJUc6yTo+fQI+HN1SUAN+/XySPEJQgSPbH
         xHuOFLmxej40N2yZcNnR5lZZzRHUXjhpDOzRoWg5WW4WBKQczSLYJrvuRJsscbBaQ7G3
         tW5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/lDI4Y1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si18407890ybu.360.2021.06.28.08.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 08:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/lDI4Y1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxsw7-0006je-6V
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 11:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsvz-0006iq-2d
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:12:27 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsvx-0007G1-6W
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 11:12:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so131213pjb.0
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LtJRZ4wpkdVLI7QRibc2PisZCVthWrAxqQz/GBZdZtY=;
 b=P/lDI4Y15Eh+SVIXyM5bHovttZmkIhmbqsFR6++lq1lwfuVM35SDsm0xgaVmJbsC/n
 Pf8GoVXGAfuIGr7h8b3m1cEp4pXashMcW+KbsrGue/ucKxTrJMGpwKw1iW59l59RzWUx
 ElJz0QE1tsr4ybgnjrmkQCpAU8393xwUFkkM0jiknUsySJBgy9KqSiN9Ljx95zDFOw4X
 Y+jYqZ7rpjNuw78NREKCRJLUVTQalh+KiE+sEMjtoQ7FmKRMozZj6SBGtVVDZinLN+CZ
 B+bDYDkrR+hYgsNyOn21FEP5RrYRiZmuifsdziu3FbX2Iz8zVj5AbKboXhAjiVJc5Sra
 VGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LtJRZ4wpkdVLI7QRibc2PisZCVthWrAxqQz/GBZdZtY=;
 b=pg5ZWYiBLdpsbglU6QjWVQBmOAxJRwibpfzgnHa77hKU95gmMdjw1YIe147zShUG4o
 LOYKSSbir52Bf7GX1azaqsJbq5ZkBxK5/qlMQ8UHAos2IkGOeAG3N3Z1N2FgYLXEyvh4
 DeMOrUHhuYlhMXiO+w6t5m2IySMuQDFC3PzE4vwUHfzVfJl2Ooqk9bMYjppY+aFKwDfs
 +6IOHQGOdcpoBKZrHU3UzI4oilJBTv+RyKlFj9JxKEVk2rXtqfXyCVJnMJd7+6dA7fxB
 v7/AtOpv2up6awDONJUuh031wpGLGd+12FIRayH9exTyFqz4/IcKhpx7fuX3dyUt/P7M
 yOJg==
X-Gm-Message-State: AOAM533cZ8u/xChQ6SoAhjEXBZ3QkE5f5JAFF+45h46v5e5eoWzN+7pK
 rtQ1xYJzxQRg0ODzkW2AdT3d3A==
X-Received: by 2002:a17:90a:588b:: with SMTP id
 j11mr15884673pji.114.1624893143705; 
 Mon, 28 Jun 2021 08:12:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm15836888pgq.54.2021.06.28.08.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:12:23 -0700 (PDT)
Subject: Re: [PATCH 01/18] target/arm: Fix MVE widening/narrowing VLDR/VSTR
 offset calculation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <551ff542-dde0-7561-f08f-e85a8ef126aa@linaro.org>
Date: Mon, 28 Jun 2021 08:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 8F0aZ8BeyXqr

On 6/28/21 6:58 AM, Peter Maydell wrote:
> In do_ldst(), the calculation of the offset needs to be based on the
> size of the memory access, not the size of the elements in the
> vector.  This meant we were getting it wrong for the widening and
> narrowing variants of the various VLDR and VSTR insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
