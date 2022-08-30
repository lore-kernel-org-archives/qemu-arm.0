Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2314455ejh;
        Tue, 30 Aug 2022 05:25:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR55/MAky+r7C0/uNhwqj8/6BTkMu7GS+zNTjUbVwSo3LGJ7x86jD72mprrq1Z28QzD5LOfQ
X-Received: by 2002:ac8:57d6:0:b0:344:997f:557 with SMTP id w22-20020ac857d6000000b00344997f0557mr14240039qta.345.1661862359077;
        Tue, 30 Aug 2022 05:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661862359; cv=none;
        d=google.com; s=arc-20160816;
        b=Kv0ONm13UGiMyMyVmbnHNhELT5OqGFlEykF0f3ivi7PTqGTPLLsIN8aVubgHN5bx/a
         X+YcIH3PTdq1sDHJX6QVzAzGF62Ig1ixRX1DmIrd0SgW1zhwI04rvc5VnkrtR5xcC9Ek
         xAM9kZb5R+Ns4fwBJ0TfS5CyZZMiwFARAtH5u7mp9JPRBcgQMX1IZV7jLDxDC+zxUZm5
         yyAFvfH7KjMPNMZHcD+4V9moLVdC+eO9sEpDEFB3iKCcd1mjgxoA6dNcIio2+JqzfaPh
         N+NXgak6Sl9NQCZGmY0UKp7EIHGRRynluoI11JB9VuBY1OSTxhTaGj9sZlnNdfjKHDEp
         aHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0vDNokwweObaPKUA8M6fhM0Fh8UI0DkJc3cOzL0vyDo=;
        b=PGxZGA89zgjExIBQnwFVX14y/PYIiyzN9SxvHpDn9TuysZSjwoyjqPvihLn+K28LiM
         8WGgEjHUI/XM2EeRrl9laF8qoXa6tdohPah7LXuFjiNjT79zXEn8WO/oX+bsgOgEXI2o
         K8VuT6NAbPGDPAo2OWXat/KJlQnQOy3DX1M6d9S4RlQ7UJ+kvSdw7IVLtIHir1r0oVsv
         kBqoZwEW9Cvbc74JdSxvfZP+gdBO54BuhVLPebmzvk+C0fox5RL/1oRboZb7IDi+RyeI
         V+Q7qSMC0uUpPmHSMYayV7AujCw0bv/rmGvNj/opx5C0u0E666X7kJ5L1m8IbE7r3mO1
         1bPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=E7G2YhgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30-20020a37ab1e000000b006b5d218b75dsi5307429qke.304.2022.08.30.05.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Aug 2022 05:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=E7G2YhgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oT0Ja-0006rN-EN
	for alex.bennee@linaro.org; Tue, 30 Aug 2022 08:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0Ia-0006np-K7; Tue, 30 Aug 2022 08:24:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0IX-0001Se-Ta; Tue, 30 Aug 2022 08:24:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso8553210pjd.2; 
 Tue, 30 Aug 2022 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=0vDNokwweObaPKUA8M6fhM0Fh8UI0DkJc3cOzL0vyDo=;
 b=E7G2YhgJm20E8h7xHpQomREkQ1NRvpRTff++ABDW0G22XFK5UvNPPeyQLO4t7JWjax
 t69sDNZ7gXaQmDI1OyiwHl3BMKICziKVQJATMG1xNvBDwXP1pcDhTh94DSjD4XO3gtRA
 /dMv4Ub2aju26ghi/u2vkMto8kjduJMsXeurA5dSgKRUzlBvpTljZG5yylNOHSRZmlOe
 KfGkyAJxxnyPttybEyWXL1LbNbwyuv0AW0NcSUPmKIiAOshx13RkiTFk+7ppoNdxDMWV
 DRMbPfz5cxrD0bokbj5pUVy28yj27uuPYnEecMZGiGRVAkL77lpTDq0Ht73CjzHgxaR3
 Ykrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=0vDNokwweObaPKUA8M6fhM0Fh8UI0DkJc3cOzL0vyDo=;
 b=I6DY4LWPAXRbybgdrn0nYQnyPL4f54EFzWMiCVrhJKnYW40V4ZIYX5bxG/n4WwLx1p
 jpGEY7eq7gocUCDczUIVfYOkV/ovEE5qtoSstEewAJ5nWxHYVzf3kudiMljNaT9iK5Pm
 SL/Y0d7dw+DtiyWSxwmN7eAPkXtu+Cx66TSiNjB0suUm1DAJJ5GHYEYRJHv39R9Bk89W
 64vc0SeuAZBvu6DRZ5Ycxv/gFg93H7fRge1xiAzkiKajRXwwy5TjuAxleD26OQHGAYaE
 3v2pEdvB+/lIdo+4yPgFEpdirwrM5LY9qS2wSPS3sqOt59bkHOGg2I1IzFd9mafbY08e
 Sgjw==
X-Gm-Message-State: ACgBeo3AaX3wJyS3cg17NsKqs4YlPn3+g5ABQAshfaYqvdJ9/43mRZ3W
 W55g39VxGmHnePPErDeP8Z2qZyMuokQ=
X-Received: by 2002:a17:90a:6001:b0:1fa:e851:3480 with SMTP id
 y1-20020a17090a600100b001fae8513480mr23622957pji.153.1661862292353; 
 Tue, 30 Aug 2022 05:24:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090aad0100b001fd77933fb3sm7222959pjq.17.2022.08.30.05.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:24:51 -0700 (PDT)
Message-ID: <334b5c23-0f22-6a1e-7a60-c208ecdfa5f0@amsat.org>
Date: Tue, 30 Aug 2022 14:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] target/arm: Remove useless TARGET_BIG_ENDIAN check in
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-2-peter.maydell@linaro.org>
In-Reply-To: <20220823160417.3858216-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: O8coiJ5Dtayv

On 23/8/22 18:04, Peter Maydell wrote:
> Arm system emulation targets always have TARGET_BIG_ENDIAN clear, so
> there is no need to have handling in armv7m_load_kernel() for the
> case when it is defined.  Remove the unnecessary code.
> 
> Side notes:
>   * our M-profile implementation is always little-endian (that is, it
>     makes the IMPDEF choice that the read-only AIRCR.ENDIANNESS is 0)
>   * if we did want to handle big-endian ELF files here we should do it
>     the way that hw/arm/boot.c:arm_load_elf() does, by looking at the
>     ELF header to see what endianness the file itself is
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/armv7m.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
