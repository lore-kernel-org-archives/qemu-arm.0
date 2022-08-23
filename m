Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1751362ejc;
        Tue, 23 Aug 2022 14:57:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR625d5UM5CeBnMRuQZBn6ubiKRrcKRX8fIHVvn2W/1KdwYFxDXTE3QxuJfL+hX2HOaMkP/n
X-Received: by 2002:a05:620a:27cf:b0:6b5:473d:44eb with SMTP id i15-20020a05620a27cf00b006b5473d44ebmr17574300qkp.282.1661291824675;
        Tue, 23 Aug 2022 14:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661291824; cv=none;
        d=google.com; s=arc-20160816;
        b=CavqIPNWeIDEeA8+hnTIucEZlsoys2iAGOPN5xYiCZPfh/1PD0ayu20+FvTXdznmVJ
         fMcd71SusUVbdHcU4rzTbxl8uqvfU9yDOClmpwd8QbKSEIvZOOMyLSpftq8vy05Qs6H9
         L6gD9FNRSaZhdYUFB1rAAljh+Evb8m8DnUEf1fETClRuE7UakBoWGRwTO5PPCNyQrJeg
         WXPwDzCnsr+Ke1NRnpdStSPG/S0OPBPzcIjnVnYaDyE91sA0S4lMKTvuDZ8JMyIBbmeD
         Zzz5/5Buk0RHx07DPXinCiG2Z4JI6zyxl03/01QQJd4MxtrElZJNlmBHz4wTyJzcIjWC
         46rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kNOHwpDqMggVPXfAKt47Nmp8rDHxWzziIcur6Tp0rZ8=;
        b=hWC55ivtGcV1jAbwHQp5o8nnAKBnEI6Q484qhVMUb2s31YbR0QLJjp7t19mgYo11ol
         NtPLDUoXP1+QjKW9bjoD0m2Oh3Ozc48n3abj700C2opvIL0DT6GvQhFacypbVnQlF/RS
         Sytr7YwfeK3WpZoW73CYar976lKefvgg6N0NB0IkuDTU3WG4CbedtdG8Bh6BedGdMQhi
         /IlITGvdIWXSFTdoq8yIGNO+v/5K8TeRBDwkqTvybouy6UPQsmkBKlA4zH7KilZVvTST
         c/59Z+WI303zQXgZuWdtYr6lqYjwRsuQjMvN8VinqrW5A0k4kBU5y25TL/SADgL2Cxox
         D8Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=udcKBV8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020ac84cc8000000b00342eb1694casi6036604qtv.278.2022.08.23.14.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=udcKBV8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQbtQ-0004kl-4p
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbtH-0004iu-Pa
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:56:55 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbtG-0000I4-9O
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:56:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id s206so13406881pgs.3
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kNOHwpDqMggVPXfAKt47Nmp8rDHxWzziIcur6Tp0rZ8=;
 b=udcKBV8rat03IfqlW9+OKLHmaYhW3a81qFXBrl3rF6WtR19OmblW2lESR0oCqbFCrT
 2HPbCwoLSmEO3tbjxIfdzl5WQyLXavB53MMsd7qbFUAxstFS2wGr93cgjLQaYDXd85dD
 SgIZ/TWB8KuHPyx94NDBNU0qXce8hVPuJgeop6YiYK1yByF7lHvTao+WOsX+oHDRXyw8
 YekHRAa5RZgQzljAEUdJWWWOp40qj46bPv6g1q1PONXs8xVqtiHXjHCCWl75dlnoQM9m
 NI0n77hsfeRySyLJKl2qxRSqdNc4B53sRlAWM+4dZniuQnq/wOH9G/iQccyg6yj6VdjC
 IOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kNOHwpDqMggVPXfAKt47Nmp8rDHxWzziIcur6Tp0rZ8=;
 b=uddRTI3veQa2391VGFOakPmJB9/Tcbe8CdLtOkomBXPxKcouqXhkOzoF5QlfEffQnt
 a+/nelAIellx1wyYTFOxDY0kPiu1nfjvPtIqgQhuXD+Cz0XoOmdRLpGUupjLtmFe8zvG
 3sc5PCRY7XpLgI7G7986BY9186sNjJp5hrKzQuamxlg52x2zOQwTQQ5aCi0uE4bmErXK
 WNTqWjG0p/PPb2jolGkrc3ObaVmOqPXpI198TL+ahwcV1OMjPU5w6pbWAGxfm16tSVTS
 o6GaFdW+pVugXdMJurGsaN23D2rcR6mxXGB13vkyJ0DPyWMs/Z/GouM4q8YmmnywEyGc
 JO8Q==
X-Gm-Message-State: ACgBeo13kPF/4g44LCnFRnV77fB5unyLmVSTldJBNBSEizBDlWuiMCqY
 EBglfo+k7+jTbBgUntnwrmPOiw==
X-Received: by 2002:a63:5620:0:b0:429:9ad7:b4f2 with SMTP id
 k32-20020a635620000000b004299ad7b4f2mr21653077pgb.162.1661291812567; 
 Tue, 23 Aug 2022 14:56:52 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a17090ae4cd00b001fabcd994c1sm11836179pju.9.2022.08.23.14.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:56:51 -0700 (PDT)
Message-ID: <aa67609d-da9d-7f36-e617-43f60bc907f6@linaro.org>
Date: Tue, 23 Aug 2022 14:56:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] target/arm: armv7m_load_kernel() improvements
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823160417.3858216-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: Uyg0HQVT7WE4

On 8/23/22 09:04, Peter Maydell wrote:
> Two small patches to armv7m_load_kernel().  The first is just getting
> rid of some dead code, that I noticed while working on the function.
> The second is to make boards pass armv7m_load_kernel() the base
> address for loading guest (non-ELF) binaries.  At the moment we
> assume all M-profile boards start at address 0; this happens to be
> true for all the ones we implement right now, but it's not true in
> general.  In particular the Teeny board has its ROM at 0x0020_0000.
> 
> I thought about having armv7m_load_kernel() be "clever" and ask the
> CPU what init-svtor/init-nsvtor were set to, but that seems like it
> might have unanticipated consequences[*].  "Just pass the base address"
> is simpler and is how A-profile does it (though for A-profile it's
> the loader_start field in struct arm_boot_info rather than an extra
> argument).
> 
> [*] eg where the board has the rom/flash aliased at both address
> 0 and some other address, and init-svtor points at an alias;
> also Secure vs NonSecure address spaces and loading...

Thanks, queued to target-arm.next.


r~
