Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1037007lfb;
        Sat, 8 Jan 2022 13:49:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4vkQjpI4FFoerZFgn2NI7bDUCz/gLnp45/tt0XuPsTM63NiV83yPJTOw3T4kUuLaUj7aN
X-Received: by 2002:a25:4196:: with SMTP id o144mr82580134yba.419.1641678550331;
        Sat, 08 Jan 2022 13:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641678550; cv=none;
        d=google.com; s=arc-20160816;
        b=Xy68XeI8kECUN9rpv9gVw6kRxnIYoIiZ/boNy+VrYG3lam8hyZ6n9kxgfpdWBa4h/U
         mrTTk3Pf+OmLN0N6bIZMOIIFUC9mYXesOiEqoG3vgGj1TPPaHpsSwEP8E2DVYFYehbW+
         Nep9b/xi9N1KcwFUu0MHvstBt6zypqqy/tdHdExOvB3ornrmArBp/4sG59Wr4zHZSp4g
         eoAggbKSNF189r0PMrhhq3i2VVNev6lcgSPEBGar4LAWlwI4eQj/RjGjV7eVbZWUcjph
         d0PH5b7/oVksCpaFQFleVfbKnp5q79+zDOY1Ymv9dPNuU+xUROWdL8bn5UveFr1E0tU3
         tekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=54iep0hC3yuEE8ZkUg+ZKdyIXteD7ULMAU1kiqqYFg0=;
        b=JuZm3dJPKUuXSA7uJijCVokR2dIjAPWl/DEFCf9J2CoIeQ2myKiJqADqctb3ToMLGc
         GePGzo4AHdG3LiG18/SK6LqNax6bAFPXMqmvpUhF2Hsbsq1t9A5UPN5rppasQN8j/tA8
         AsUkk6Y5z/WOiWaEhrAZ8hz8+mrVVvKuF+F6Ujx85hOuIlFfJhv1/hJgBIynE6EWQyZU
         tAl3zA9XVSOpcQW6E3rFQjPNj3UhwnGJnK9Blq3Uq+s6WH7E2v6LzrAKvB0y2/RM1kYt
         4jXpdDtvSZI8MOCmiXego1YHext7FVD7AuL53D7WAk0HGnAfUvBvxy9Tntu40bmyyaCM
         OWGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OA9n28BU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si2904081ybu.294.2022.01.08.13.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jan 2022 13:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OA9n28BU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6JaH-0006ZY-Of
	for alex.bennee@linaro.org; Sat, 08 Jan 2022 16:49:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6Ja5-0006Z8-Nm; Sat, 08 Jan 2022 16:48:57 -0500
Received: from [2a00:1450:4864:20::334] (port=45630
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6Ja4-0001Ab-7M; Sat, 08 Jan 2022 16:48:57 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so4923117wme.4; 
 Sat, 08 Jan 2022 13:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=54iep0hC3yuEE8ZkUg+ZKdyIXteD7ULMAU1kiqqYFg0=;
 b=OA9n28BU36qamqPkxzW+MBlkQVjj2lAE/NpqCwGwjl9NTXkkaqHfsKK5Kuj9nuCfIo
 iWGZEctB+kzVxPwflgc5D4+H76BWMapE58VoUBQs03XpdVtbTVnPUzEOoihvEJ0Dw6FT
 ug7uuijmO63v3+4wnMaH2QC/K1crULf6Ok88HHCSHQzHl09d+mjmYpx8nu4Tlga1CZMW
 C9sivuuoccEs2Vim/XaZRr534ANZgvC/mrK8TJ6GIaCgkXiuly6r07JwktFdh0BczrCT
 FoaPTO49uFuOrnZKpjt8BfA53dOv6vBSmrlwEmqhkQPUFBU0LJQScaamWaMULbBOmwt0
 noBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=54iep0hC3yuEE8ZkUg+ZKdyIXteD7ULMAU1kiqqYFg0=;
 b=IRNSjHb8DSp1dw+3Jns4AB711NTFaHPtDmkhrFZwUetJxpUU2csoAvijLG7MpJGshz
 LUS5dCmCFUTI529UWGy7rldVrLBQ2c1YjLNXXM68VxCt+YvLWuQnAgwUBnumrkfFhVas
 IqtuGOriu9R2f3clDwjlZb914WTbCIEtiaXSOMAsB6OxW+LfZBGi3jzUrycySXejgHYB
 kAGgA8iFhFpIKhGemv+LzBYfRD3TwOolYI4ntedMrK9elnrCAVX9EywmquRvQ3sT/ylK
 hLpTdgXg4SFB2zPpb3oTfrg7nrel5TFIRxZwJNBladl1HDkcSHrH0coZRrK7KShsdfvO
 ghqw==
X-Gm-Message-State: AOAM533Sx1r5/zVFfBxeOtwXjt9lyQltGSTjmalJCs1RYI/TzYum5ieX
 DiMDdOI8kmnY85TI/IkwpPQ=
X-Received: by 2002:a1c:f613:: with SMTP id w19mr14982556wmc.3.1641678533712; 
 Sat, 08 Jan 2022 13:48:53 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id t8sm2460562wmq.19.2022.01.08.13.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 13:48:53 -0800 (PST)
Message-ID: <53314f76-523b-77e2-9c86-d8eeb5b2742d@amsat.org>
Date: Sat, 8 Jan 2022 22:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
References: <20220108150952.1483911-1-ardb@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220108150952.1483911-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YhEYXQQ0scH7

On 1/8/22 16:09, Ard Biesheuvel wrote:
> When running under KVM, we may decide to run the CPU in 32-bit mode, by
> setting the 'aarch64=off' CPU option. In this case, we need to switch to
> the 32-bit version of the GDB stub too, so that GDB has the correct view
> of the CPU state. Without this, GDB debugging does not work at all, and
> errors out upon connecting to the target with a mysterious 'g' packet
> length error.
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Bennee <alex.bennee@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v2: refactor existing CPUClass::gdb_... member assignments for the
>     32-bit code so we can reuse it for the 64-bit code

Way cleaner.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
