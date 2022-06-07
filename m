Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2168015lfb;
        Tue, 7 Jun 2022 07:50:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAZdNZXXM8eenpUt4YpPirSYlDxfpf+FjQSLqGUwjRBD+Wi+KWCzj3HHPai827s4H6y4xM
X-Received: by 2002:ac8:5f4e:0:b0:304:eae2:ad5a with SMTP id y14-20020ac85f4e000000b00304eae2ad5amr9978349qta.283.1654613442284;
        Tue, 07 Jun 2022 07:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654613442; cv=none;
        d=google.com; s=arc-20160816;
        b=bai2U7lffBev8OVfFCPt7BhDxSIiM7gCHw2k0Mm7ZorITTpjuJGieEdqCbNCtx3BSy
         e14Al+sH4wlkztHjpZQAJ0zeYcJuAWekRzwZlRt8DRRpTIbTmJRdQaWyYuKODc3I2moa
         TfRJ39NuzjVqQGDMhCwqpEgbeB4T9ePh87YOJdsCGYZuHp0XKiSBk2QLyAW+O/umkU/Q
         0t4/yJn0/L9Nw19f/URaGDv+CCTkzdss+hIeOsI8SYYcCDQWthHQDr3ioDn7ggCQ7Vha
         mKTQO/TDm1xNwkRNhyipXi9YCqRocCfkMb0ym8il8vf/yH+9PT8L9TTvZxDR7XXmaH2p
         qQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jQRGzO8DdCIYlCZO3zF52ovUfz2vFJg0xZIRdvotHNE=;
        b=eFu81usD3QmxvI3pqn7U6kcYcFYJxAu7CGFpO8hHsxZtTKOMMnFmS9KPnVcaabg9KE
         5UZMMutHpVzM3cWDBTSeYDTqinGhJ6sx7a9Lbt7n2LZJh2hEikyj3KBtp1WRJc6U89Gd
         IZjQtCxq9NDaqVLnYDo4ph9vK7lYZvbjHTfiJ23d8YbnmHJlJp6BH/Op8GGdeWwbpr40
         il2r6FkigRlmLFIP3Gi6CZw9ip0K3oBYA87pVR3bsgx/mq+R46gLNSripRITbT15AitY
         IvHxSBkhkcIrOFarmydjsuC+2fowHfirZjBwmhLRXlrIB8dRlzxhc2Scd55dyN3gl0IQ
         lAQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yT7h2nmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke1-20020a056214300100b004644918d50bsi9359618qvb.148.2022.06.07.07.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 07:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yT7h2nmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyaXZ-0000I1-Lg
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 10:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaWG-0000H3-G8
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 10:49:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaWE-0007Dx-QC
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 10:49:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id o17so15012978pla.6
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jQRGzO8DdCIYlCZO3zF52ovUfz2vFJg0xZIRdvotHNE=;
 b=yT7h2nmgTkI/2KdaScN2QDA+dvXh4TMEjeyo5B2nuFEUIDESdCZkfNEDE3n32LxwdK
 9huGnN+SWXCNhCtDYqVkJZvzvsKtfJJMDghJv/O7pXlshVKFwZ7oY9yU6oVwmAErVq7m
 Zp0o0+Q9ez/xT/8yqUQKVaNuaBewUsXIF5nK8o+zvDo91Ug+peDSH/6ulblRM5Gj+S8L
 Tn5sBoNpbl84DJolEc7z/+ujcjeciElD2NVifG6raJacTNWonp6PSN5JQI/OwyQkBOC3
 P4FS8FstlAx3TIm52Ngzf+8rdrJi/gCHhJoRon1g6HxprBrBdCI/6NTyDASdE9RFlh0x
 84fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jQRGzO8DdCIYlCZO3zF52ovUfz2vFJg0xZIRdvotHNE=;
 b=UPrYmUpyVdZulW9eN8SQTEMkhYpYdzlLaRWFk7wCB7Wq3sly8b0pAinO77UPvHCX2O
 oJf+eVQkw/zWjhS7yVLnluXmt7rShUivuFS783CwjRB7MBkJaJce8UfUxmE8gsmtXCYK
 achjWAyudB3QZQT132HDeTfWeTVYZ3fhL3nyi08q/fdPuwJ7GMRUI/+UdAz1Yg6PUMAu
 rZbMLoFPr3ZFtSoseG9YeOiid64rUo5AywIIOvUvvF23E8+qQpwnt4wCApcdZ5BN4Rhx
 YLOtCLcZPa6R5qIjgiqylH3XK4z80q9oxW9ZYCCqj+oWceImErlVrDF7nXETPYZzNaVB
 pFkA==
X-Gm-Message-State: AOAM531jn6/aSgsfyFjLhfd+O3cDj26Lwc3rNTwCoRVE7wyi4kmqZIMX
 /VixNG7Pj+SZ6YggDVRM8jQ1Jg==
X-Received: by 2002:a17:90b:4390:b0:1e3:3caa:8f78 with SMTP id
 in16-20020a17090b439000b001e33caa8f78mr42326323pjb.213.1654613357163; 
 Tue, 07 Jun 2022 07:49:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a634658000000b003fad46ceb85sm13074005pgk.7.2022.06.07.07.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:49:16 -0700 (PDT)
Message-ID: <d120705b-2653-5732-668f-7dd889d590c6@linaro.org>
Date: Tue, 7 Jun 2022 07:49:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 39/71] target/arm: Add SVL to TB flags
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-40-richard.henderson@linaro.org>
 <CAFEAcA-UeGqXp4wUSoR73pCUBm9_WEB_MeAKsdXQOvnK+ajWVg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-UeGqXp4wUSoR73pCUBm9_WEB_MeAKsdXQOvnK+ajWVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: 9yPHu8DwGhTY

On 6/7/22 02:58, Peter Maydell wrote:
>> @@ -3292,6 +3292,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
>>   FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
>>   FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
>>   FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
>> +FIELD(TBFLAG_A64, SVL, 24, 4)
> 
> Given that both SVE and SME start with an 'S', maybe
> "SME_VL" would be less prone to confusion? On the other hand,
> SVL is the architectural name, so maybe that's best.

Yeah, my first version used SME_LEN, but in the end I thought using the architectural name 
was best.  Just above, there's commentary using the other architectural names "VL" and "NVL".

>> +static inline int sme_vq_cached(CPUARMState *env)
> 
> Same remark as earlier about not needing to put "cached" in the function name.

Already fixed.  :-)


r~
