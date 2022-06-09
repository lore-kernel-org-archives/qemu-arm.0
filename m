Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp591744lfb;
        Thu, 9 Jun 2022 10:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzahwHteQWMNmPdU//zpa7AcxYoNptWguYB8gOvaeB1vXRtm+B9JJus/fQAEf8HQQiES308
X-Received: by 2002:a05:6214:dae:b0:464:6b95:ad9b with SMTP id h14-20020a0562140dae00b004646b95ad9bmr34298252qvh.116.1654795996127;
        Thu, 09 Jun 2022 10:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654795996; cv=none;
        d=google.com; s=arc-20160816;
        b=YJeU7UY3qg2qnH9esoOr7FNdMb99GRvPDE0wifBXOVNLFEp8oBpJbQm2ZcsVVdtx/d
         +8Lti7Ycc3JdLujdQ7K4vfoITJlUOGvAJ/DdRKtM9Vn9mNFWlOIjztc5MR9QRlN30w2I
         s4gjlCO6+/32FQHBnYTxQDzDkokspG/GKUZqHCqFR2++6kQtIw8rspgQlybXGiYc/CYb
         pJ0Onv7kzMisRqX3gdq6vfEhAkw+Bsw/qvEqNY8CpN1k82obA35g6kKtwuWkPvJu22dq
         TM7jrY69ENVAEI+mpaq5jSaNX8uczsudRrVQielHcNsXiffEOb9V58B1s8dgdTaGxG7l
         jTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ko9kX/YJcoXF0GsOJtjw+I6RRBlLZGD7PSOv0XgLhR4=;
        b=ifpD1k22emXQcmf25ZPIQm7NrHc0Fb9iAz1/bzqJsszcaaimpLLxedSFZabbAL3ai1
         opA0WYabe3RnpLd77wWD2bd4kkH/sfwtWtAcfEInZUcrX4+aFr6eGI0S9wxnBN1K98SG
         iGAwgcDhiwXyEQMeGwB+3R5sOqu/C3o0fbKNX8teFHWI+oqPCCVskXg09798Gno0UvZJ
         8p374CiwktdWDTR9XFvXqYb2mmVOLRKR+aCbmZQw7nlzaljxj7m9dVoXsn+GfQ6dasUr
         JRy/alII9EsnXNYLENxdRqW4zG0TKa5AGAfkVJ4fZYyzeEMDdKQSg1mPoDahhIQGnz6P
         PN8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pXPvrbKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ad45768000000b00444061ecbbfsi12995080qvx.474.2022.06.09.10.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pXPvrbKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzM1z-0001gg-Ih
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzLev-0007Pr-T9
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 13:09:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzLep-0001TD-Ry
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 13:09:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id t2so20736879pld.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ko9kX/YJcoXF0GsOJtjw+I6RRBlLZGD7PSOv0XgLhR4=;
 b=pXPvrbKcouoA3fRMGniEFvdbODHZusaIDHVInZB7o0GG5wp0RmIML85yyxCyXJW+5j
 uNqI8dsCI4BBBLf66FG2exwXZTFfuf4bw5qOWYroxx1IpdaYWsJnrLXlR6IaZtqHSXmC
 SPmZwAoTA8DFtaz2SA4lfHaBq0Xx+nz0jiRx9IVLCCEVr2bMVu3OjqUHyHwE9h778HCM
 Ppb2imcp1RgtevYudolBGhuG13awbWbrKNoK0btk19Kab1vV26oGQnlOIiAhk3bRueFA
 IcDANC67Jsveyh665uHWXn+LfcxguszRYG/8wh2gXcR+PUwTE+9hRnHeUethvry04jp2
 q0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ko9kX/YJcoXF0GsOJtjw+I6RRBlLZGD7PSOv0XgLhR4=;
 b=boSAIMnxv5o/p2s6EOXpfBVMTF//O/Sy5x556H6UPP5jM+MLEnxQaL/bU9XQU766yJ
 rfvmQDHALzr+NNFdkD6hF9Cq3g8oxHKuIt3SOLt774NvY0eMsaHd8d6EMcdVFwyJeeak
 EIWReMoWubzsvEsf8Y0WVlLKbAAqgBMbohv5BBubtZOTLzR/gm6ZrucaPHX2yoBpyEgk
 RRzyQD9+KIF6rYL/aVrEfaBnnj7g6MwtORguCjGpP78yReRmY6SgK3NcWRv2+FEBaNIu
 VvbHFYfgZv2wnb0xpVgR9SPDKpikDb+2jJ96uYYusiJSE6sQNbSBLy1SZna6eLki0MID
 iGtA==
X-Gm-Message-State: AOAM530fRJPbrpOGgxPVnR4zfIxv/9JH2UTEFSXCpyOA7PntjhXRwnM+
 WYQc+GDiM8jTg9vw8hqgtfoO0Q==
X-Received: by 2002:a17:903:186:b0:167:6d8c:68ce with SMTP id
 z6-20020a170903018600b001676d8c68cemr26075955plg.153.1654794555632; 
 Thu, 09 Jun 2022 10:09:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79911000000b0050dc7628179sm17721107pff.83.2022.06.09.10.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 10:09:15 -0700 (PDT)
Message-ID: <94ea5095-12a8-7f22-a6d6-9b072e3bb9e9@linaro.org>
Date: Thu, 9 Jun 2022 10:09:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 03/25] target/arm: Move fp access syndrome adjust out
 of raise_exception
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-4-richard.henderson@linaro.org>
 <CAFEAcA-02v3Mcz7Ozubeekanmus2GOj8bNVH7MfVQ78YfN1_tw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-02v3Mcz7Ozubeekanmus2GOj8bNVH7MfVQ78YfN1_tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z83MtWoc1f7I

On 6/9/22 08:59, Peter Maydell wrote:
> On Tue, 7 Jun 2022 at 03:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create helper_exception_advsimdfp_access to handle both
>> the routing and the syndrome contents, depending on the
>> eventual target EL and mode.
> 
> Bit awkward to have "TGE means go to EL2, not EL1" in two places
> now, but I'm going to assume that either (a) this gets cleaned up
> later in the series or (b) that it's the least-worst option, so

Hmm, well.  I had planned for it to go away from within raise_exception later in the 
series, but it didn't work out, so I could drop this.


r~
