Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2156561ejb;
        Tue, 30 May 2023 05:59:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79rPHxzCenCWqgr8v61JImjmV8ePcr4lgo9s2407voIsGjnoWF76Ln0MmQUly0O/NeW7h8
X-Received: by 2002:a05:620a:6887:b0:75b:23a1:d83e with SMTP id rv7-20020a05620a688700b0075b23a1d83emr11435511qkn.0.1685451567363;
        Tue, 30 May 2023 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685451567; cv=none;
        d=google.com; s=arc-20160816;
        b=q5imyjodDT9aDpMjgHOZoJ7pi/ChkfjBmNllF74uoSrAuwmEnQe1b6cBbS9Kxn+TbT
         QiBnfS0LwXKflDaHRQ6w6tS5/zGykL5fe2EbbHAQ9fbnY7k4dVBNvT/kls5XBUKS50RT
         u5mIrHFOwvfw9bNlvwW981QhTPybiZTmN+XPQlX3Iv2BGo1BqR2k9s8B4XbvGd9wszCh
         ov8yi2JDeApr+STLbICg+NaLqCE38BCi34FOTv2vmJquiBkBzRbrH7qv/yATP4lXp26Q
         i7jaQok1acAp0VG30huClmvNGyUd87FkSOQH+3URhvCsGeBE8hzFemy/gtUq31Cz58kA
         mhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fc0QNYBo/7/8H3C0PU1VdgFRhXbx+g6BrK/2wpkYl38=;
        b=EjWIBYKTYfgWzfF5KLdO2YT+D66MuO6Gz2YGvxdeoTtPlcOZO/m23sCl2AtD0HQRah
         3zEgvg/0Dexu/ObvRZpcEJ2K4JKvBYIecDj4wiw2YMLJAAc0nQPXA0Y5ynrx3JrBae+N
         R6fuC/taKDGVQrZNa+owjR1xCx/iRAtOtpuExXazW3SYdd16qKTWY87kO7isI4b7+8bf
         pEczfKN5GltTF/9jCou21eh/B9voRI2XwOVMvVSsp2cnjyLOQJ0gIeOn18OBPs7mmDN7
         a5ZmQA/v2PvX4LM/Xc8slWXxPjC0UETTxtN0hr1sRI6QPOfCRiemT8nirIkzILwntzj2
         nhXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pyKFH3iI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3-20020a05622a110300b003f6a7424d50si6572112qty.672.2023.05.30.05.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pyKFH3iI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3ywY-0006FM-Tu; Tue, 30 May 2023 08:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3ywU-0006CK-9W
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:59:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3ywS-0000Wl-PZ
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:59:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30ac4e7f37bso2801174f8f.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685451551; x=1688043551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fc0QNYBo/7/8H3C0PU1VdgFRhXbx+g6BrK/2wpkYl38=;
 b=pyKFH3iIddls+HZ4duVm5T/t4A42pfiW3J8W2N5ujiZ03j4NJ+Ky7zhe3FA/RmBLQJ
 Cz/5Nb/qaF2lagc/ow7q1g9/fGNuQFl244RV5wI1zN/S2Wg1vLKB2LY2M8Cq9EMAfjcT
 a4JoBquJmbz2P7FltwXLfmjaoq7e4V5tGaV8d7lIf7qbFwWGn6EX+d3x1dGgt7W0a0pN
 ew1p0qXsmdjFiobS4VoJRSau0XOYjC0xZqRDq1me+ihfCEEIRMokJgRyN7+54euvsuMs
 oEJIsmxwd6yBGi69yXz0WaOoxdn2WGcrB+iKGoKezICj5Kv/eHqoMh2Q4uczgcXnVDZr
 JWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685451551; x=1688043551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fc0QNYBo/7/8H3C0PU1VdgFRhXbx+g6BrK/2wpkYl38=;
 b=ZuCIeCpzzcaOtl9XfEuKWyYUtjedx2gg7kUdpXkR8nIiZbmoucA5ojNj23bAEecqiF
 2YOc1ijYZkTgITlxTzxkEKW6lpFBqSu99wFd9NMKkDDisZkVsWpWoKWmKNBD3rG/K1vr
 LMPG4oidcNIRK0ORAJmIB05TbVP+lozb6MUqLVkuvhYM+xE6FDGxyIo7M+VykLmnxx7y
 9mRcWwZ8gNKJRB564G3ie2oLEHOu+khqt62KylKocHUl3sBgVw+3bNo9msn+qWCtF5UY
 exjMqKsKtXbZLNGN+b8yB+ILs/txBaJ9jAUatAjXz0hfOa9AhTbHbQ95S4eEjXI9oZL3
 1ZNA==
X-Gm-Message-State: AC+VfDzrfpV4KL5e3d185jKUP/9q35AuhziZRvBGdfnMvuPWp+1/QnvI
 VdqNjLqYbAvHuV91KkoyfU+WlSk+KAq9wKOLHBqLXg==
X-Received: by 2002:adf:ea08:0:b0:306:26d7:3805 with SMTP id
 q8-20020adfea08000000b0030626d73805mr1489984wrm.63.1685451551185; 
 Tue, 30 May 2023 05:59:11 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfe984000000b002fe96f0b3acsm3270710wrm.63.2023.05.30.05.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:59:10 -0700 (PDT)
Message-ID: <f20d051b-4daa-1118-4d3f-c9a1403d63c1@linaro.org>
Date: Tue, 30 May 2023 14:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 11/20] target/arm: Hoist finalize_memop out of
 do_fp_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230525232558.1758967-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: R8z0QyW0O6xf

On 26/5/23 01:25, Richard Henderson wrote:
> We are going to need the complete memop beforehand,
> so let's not compute it twice.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 43 ++++++++++++++++++----------------
>   1 file changed, 23 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

