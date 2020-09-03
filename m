Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp679748lfc;
        Thu, 3 Sep 2020 09:27:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVsQRXPW9n8gOiUHkqFFh6YubXf8dVqea5SGVgVRkfR3auhX9ds4w3W62FTRzU/Q8xF6Y3
X-Received: by 2002:a25:260d:: with SMTP id m13mr4039361ybm.45.1599150461480;
        Thu, 03 Sep 2020 09:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599150461; cv=none;
        d=google.com; s=arc-20160816;
        b=p4eZplJzb936VzEsUbK7YV/Fv1PouCBZViB06D7OcHC4KJpXoXKWX2T7HbjGS8OPJ2
         wZ7sZVZWbSZGIkAtIlgJdsjGf1rxffsktoVJVsd3REkuVr3vHlA931fJxbiY5Gc8oLEL
         UNHL8S+CU2t0/P0+r6r85iPtKDeBS+MxwfQVfszIRpjYrMp+HUvnAYLD73XFuylooMoY
         /wAW9CwYT2pROkOr+xDFfI20gKTXm/V7tbRqwBfoI2dav8gqRXanGKxvVm2uPKPHSq2i
         m9rJV6KMRFXjsInAFM2/F6P+rdP2qiFduhZWppDmAoRW8aFKjchyfa9GgLPdhtVpuHBq
         O0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lGt5WOoKaqmjrp/JJYW9gqO+hdcusqmlblBLiycqA9w=;
        b=vtHALIwWGRblo1G3encs78x22K4Y15PkcO5rX06D/F0CYk3pqPblEs2UltYQCPt9LM
         dmQKzxWTNe00BfVHNFOtYWfGAfQejvgmI03jqntH+rPPc598e3iQq8vSbRlFMAmREqMH
         7nsNJ+Q+apjSs2so8O+mrVlWdMR8qc18ZPuW/8+mXiCo0FqhYeuEgvXSild6Q4vrVBGO
         4eiBK67E2PVSSxLQlWpml1kWxGmpOgltbot0E3ZLJCx2FsSaKDTIk+Dv9pqJe+Twynty
         jh9dfrzKf9bRXxazQ4RgEpKoTu7WClU/tG6PzzNlamChOVZTCks1+7fV1KpOBWf91CMT
         LLCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BY09/5/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o187si3200559yba.66.2020.09.03.09.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 09:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BY09/5/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDs5M-00074h-Rf
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 12:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDs5F-00073T-FY
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:27:33 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDs5C-0002FS-PP
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:27:33 -0400
Received: by mail-pg1-x541.google.com with SMTP id g29so2563595pgl.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lGt5WOoKaqmjrp/JJYW9gqO+hdcusqmlblBLiycqA9w=;
 b=BY09/5/EfOH2wqOzTo6adnbimslBEQ41P8mGuPllBYl8QO/HcwQkqNyaLLmF/GiYDr
 HY7syDuNbZsnLdBH8SudqsHxsiyFxOTogb+Crpi4IEtxZ5oCzevHsOrRa7ZIUWmcl68g
 gFUsp1RNifxYE9KtxzqBiirBIBZOaEfT+NRbBxfGCEthwG2xAhG14KxMxGTjRPIRPQ8V
 6CxiF1P6srxWJ/jEK025EtlIpYnywQwVShhsv1YsNT1FgsmSF/utROvQcC9nSHtzs/DK
 ltmcxjmwqlWZtZIhsibUYDVzRXtjH+aPX9ws21BPK1KCd+Ju0t8mxRJNQcpI8+VDfnwG
 iJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lGt5WOoKaqmjrp/JJYW9gqO+hdcusqmlblBLiycqA9w=;
 b=ZkG7C0NUsKxRBkxRvyU8CldvQF889d28x8pePWGPJ2w1ATqCaTRGW9OSdisW5xIsNk
 KtGJDgYOPMPAVRt0qrLR06TnM9iW6Xp571wy6JVsDYoFd1qQzOCY1o2FyBKlEZ90aUwG
 D+JFNComs6Uf9xmnL9Y303Sb3aK+Y7MB24L0VlEsevF+cu/PqjesIIz8MDAHCrA570Sx
 RVRzgqyEPlY/AoXuBbfg/Iv8ksFDxrK8YaMvin1Iuic8T/SwUWuWUM+5c9XSBeURUEqZ
 DyTrwclMVkLp2zJSe6fY8PBF6SFdnsRBAn61Kuws9ltx56N4LbSiMRnaZhd8BOOqMPQi
 pBKg==
X-Gm-Message-State: AOAM531PX1YIez8iZMiaLxUNDGMRlq74hbIDatVt5yetNXjMGESuWQmV
 ldQ20drOsm3TcXPeBjtYDLj53Q==
X-Received: by 2002:a62:e404:: with SMTP id r4mr4431189pfh.213.1599150449467; 
 Thu, 03 Sep 2020 09:27:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e18sm3233290pgr.53.2020.09.03.09.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:27:28 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/arm: Convert Neon VCVT fp size field to MO_*
 in decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200903133209.5141-1-peter.maydell@linaro.org>
 <20200903133209.5141-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4302c192-fe8d-679a-aa7b-08c604bbbc13@linaro.org>
Date: Thu, 3 Sep 2020 09:27:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903133209.5141-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.403,
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
X-TUID: 1mjVC2Va90SW

On 9/3/20 6:32 AM, Peter Maydell wrote:
> Convert the insns using the 2reg_vcvt and 2reg_vcvt_f16 formats
> to pass the size through to the trans function as a MO_* value
> rather than the '0==f32, 1==f16' used in the fp 3-same encodings.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 3 +--
>  target/arm/translate-neon.c.inc | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
