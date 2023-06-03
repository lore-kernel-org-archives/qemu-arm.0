Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1587930ejb;
        Fri, 2 Jun 2023 21:52:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79ocZ4qsdBxuRqB0UWJ68FgedUdjFItF3Q4OOdSPDBgEB3d6xu+gbXuNcFSzj/5g8YbQj+
X-Received: by 2002:a05:620a:2903:b0:75b:23a1:d85b with SMTP id m3-20020a05620a290300b0075b23a1d85bmr10404553qkp.29.1685767944575;
        Fri, 02 Jun 2023 21:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685767944; cv=none;
        d=google.com; s=arc-20160816;
        b=nbc3Av8nPfU1y4D2JL/wuacnJ+mPT1HMYYA31GkOhGOIb/MJDheMPIiq215SOQrsUr
         mDXblpvDc8AEmiuHjzZ9+XtZDHlGK8umgB/32Cs3TM/WfB6oWU6pzQY9CCuUlRFR0EEE
         VEtChchkGnRe6ZIT0JJmw/+7CDM+2+8ulvwvKxvqzM+M+Ln3XKc0n3GYaq+Jw0wJKk0x
         xCOb6+C2ccCAU3jxKtGntsG0pW4uGEezFnoWJG5+A23KKTxBU1ZRmi/7neNUGtbJ0S6k
         wLnM1yNBZU7/N/b7tUqHibfUAAdfOr158ua/Cu0OMr5qJAW8jNPm5dVrR+GyvSQa5x2y
         3KKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3W4i4KifsABVRtFEVcMY640JUjNy0jYfJZikFZ/tcJ0=;
        b=iJ8xrFjen4iTqHpicSouYrYQqhZDaqM1p7sgZvkyGWttSAUampmNQc/W56foLyumf7
         /ww3BrU9xHXPYBaoFGO3L9MctbZyjcB2s0Jtq7hEYcdErpHM3p6/OKjF1VMoOQwUl8vT
         Iqv/QC99VRtnzKXxM00Oi7jZE8274xNDdhDi83JO/di7UpX7Met3xVzjTp9UX73mCIBr
         XV30F+p6R+bNiNfS6J4rCsOf+oMqW+vt5Mz8qDYh/cItlPhBIkZeyhbDVze52Y27AjR5
         K5dWeMbsjX0Uw8Q8JTAkqWqosCGyobK/bNISAH/koCGU43vIMxuUVU+0dK1uRcf3THqg
         S9Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfASgxqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b003f3d87c14cfsi1888251qtx.440.2023.06.02.21.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 21:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qfASgxqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5JFM-0004up-AA; Sat, 03 Jun 2023 00:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5JFK-0004rR-CB
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 00:52:10 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5JFH-00070q-Qc
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 00:52:10 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5289ce6be53so3031387a12.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 21:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685767926; x=1688359926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3W4i4KifsABVRtFEVcMY640JUjNy0jYfJZikFZ/tcJ0=;
 b=qfASgxqKKQX9jefKSYHreM77izTkZM4XW7o+6NL8QBebYwHqvORTEqb+UGJOwEnM0h
 Y6trRhpQdvNRmOjwmbI2z+e4EpaN4CIjopYnXW/eFoGww75uZoyZ2EcvpsKYE9W4K894
 94bUDW656fNCrfxwSFI8uNmBVL44dHBHhzX3RE3Mv1Z7YLWqUfmrf4N9AfDtnXe6DKwk
 4zBP2wwHJUu4kkMCuztpMMLLwr1Te/ejyAtG96WcmU+4m/hbLXL7IYTpB7x4CWIeckZZ
 2fyUcpFAHcbKdwvxTwI4YtyPPAAUfJbYxUytrsnODkMMAjQAqvEBzhBtYwE5fbPZqiPM
 PYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685767926; x=1688359926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3W4i4KifsABVRtFEVcMY640JUjNy0jYfJZikFZ/tcJ0=;
 b=jPksNcbkdywRSvYQVmsB+ahgKubAfpZNhjrXivReQphmEQ+ngREgCzER0o25Ag7UA2
 TkAMoufOsUt/fKof8ZwZx8oCv42h90XnjBPYk7HtDUat1FdK5Cg55hi+xbMFlyHf3zze
 xULOak49zCSEi5BH5N7P+Q/Oue5Nh/4cIL0bGewzDJBHKMhInxbQmAoSQzvewULDbyRi
 cDEky2vqoGL7h/o2J+rKUILSVwb0WC2r02FUdVsTsRWO7o2eJ8KlJFOtC9SdDZs15sgZ
 hYlJJ5y7U70zUTaJXXF/RkWwtD+wesvhWr8uarsW2OYqg+SvjWU1v/OjXsf5qRHrPgt4
 TnUQ==
X-Gm-Message-State: AC+VfDwX24HAgfbrWNeR3mWY/71wHzse687o1oJVEqz3XAWBduutxXsU
 mlRl/2h3EA8PPhL6UUcPW3H9ww==
X-Received: by 2002:a17:902:ecc3:b0:1a1:d54b:71df with SMTP id
 a3-20020a170902ecc300b001a1d54b71dfmr1943824plh.0.1685767926020; 
 Fri, 02 Jun 2023 21:52:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 iw13-20020a170903044d00b001b03213eb7bsm2164095plb.301.2023.06.02.21.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 21:52:04 -0700 (PDT)
Message-ID: <87f06ed0-3ad2-6b14-6819-03a35e179682@linaro.org>
Date: Fri, 2 Jun 2023 21:52:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: trap DCC access in user mode emulation
Content-Language: en-US
To: Zhuojia Shen <chaosdefinition@hotmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <DS7PR12MB630905198DD8E69F6817544CAC4EA@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <DS7PR12MB630905198DD8E69F6817544CAC4EA@DS7PR12MB6309.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: YWn7+dt3U03m

On 6/2/23 14:43, Zhuojia Shen wrote:
> Accessing EL0-accessible Debug Communication Channel (DCC) registers in
> user mode emulation is currently enabled.  However, it does not match
> Linux behavior as Linux sets MDSCR_EL1.TDCC on startup to disable EL0
> access to DCC (see __cpu_setup() in arch/arm64/mm/proc.S).
> 
> This patch fixes access_tdcc() to check MDSCR_EL1.TDCC for EL0 and sets
> MDSCR_EL1.TDCC for user mode emulation to match Linux.
> 
> Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>

It would be nice to define the fields of MDSCR properly but either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
