Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp714972dye;
        Thu, 26 Jun 2025 23:52:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVt1Eu+AII8v/oFdvAshA0a/5TxOgOOQwmjgPDpDlLOzebAFgTMuEQxbtXSY5IeN0K67KfOxL2J/DpjVA==@linaro.org
X-Google-Smtp-Source: AGHT+IGaAU6C6daMa6W9ORXWYiBbwvtDVJVW7z593lOqhTMp5TXIdzDJNVkdeEdtYgyEFBrxeCTe
X-Received: by 2002:a05:6000:1789:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a90be88de8mr1919725f8f.54.1751007168129;
        Thu, 26 Jun 2025 23:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751007168; cv=none;
        d=google.com; s=arc-20240605;
        b=hDavA0PS0vY5DojjzPaFXasXotL6Vz+fhSxpcyTYI1mid5TbIBOB2lGlYUUlrml2fO
         2UoT/+SO5g9vD5Ebj4qhrIlOUeTOHClreysx478Ka1vIFEVN7cu6Dw+ulfFX0IwS8fGS
         jduw1cFfS07Pj8u8equVG6BOlMZ4Vz5IDiNhJdkXWDQzZqcNQicHil8wxxNkvx06wo+D
         oW2OhKIzBM+o0oSvJ1ZfBLb2r+gTGKdw+l8iUjoSv6KDsnJYGqIuKj6YpDRmdi9OOR91
         +dIbX4fWDR+FAxEZEtzEeih2G0JXaeSzOr4Zte2UDcgA+7AKYWzm3N9Op4KF6cHalAgC
         Dt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=7zOrRKcC+dJWMbO+N+LUB/OifeXSWcuUbxbDrsrug/A=;
        fh=e2doJimpuP43a+5rrKkGu3YAn2W68cBR+w+TN2Njkuw=;
        b=UZBBKhC/q8TaSaZNNdxsGowM2zoKbAFwiHZ6YuekzwCRNO4gj6xtYyvB5YmBssnozo
         TpPF1IvLwHp3sLCNAeJ4PGiMiZ9mj+iieDIlfuzSaaH/4vKZSHJfoJd+N11xw2Ld9ZyP
         69WLct4YNJNlqpeF4k+fDmL0v4HYXxv/CWtECZky1CtcD5ggxK1NOAl4ixqRe9HzD9rh
         KRSYakKTHrDX2zE5xYAx87IYSUURCjXZjdBIzdeedb43d8t6CEhEOrYkS7XnpYLZ/FXD
         u2xzthqn0PCo7rvYb0zlmxX6B80CrgJlB/bnZWtGQWOgIAeOUAkGaPGAtAosHrpYTaTH
         /uxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0705bddsi1117389f8f.226.2025.06.26.23.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 23:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV2wg-0000dY-1G; Fri, 27 Jun 2025 02:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5m2v=ZK=kaod.org=clg@ozlabs.org>)
 id 1uV2wd-0000ck-Vg; Fri, 27 Jun 2025 02:52:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5m2v=ZK=kaod.org=clg@ozlabs.org>)
 id 1uV2wY-0000Lc-Gy; Fri, 27 Jun 2025 02:52:19 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bT5p21kX7z4x7s;
 Fri, 27 Jun 2025 16:52:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bT5nz02pTz4wy6;
 Fri, 27 Jun 2025 16:52:06 +1000 (AEST)
Message-ID: <673b668f-b374-432c-b1e0-19a9977f6f14@kaod.org>
Date: Fri, 27 Jun 2025 08:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add QEMU model for ASPEED OTP memory and integrate
 with SoC
To: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250627025606.631167-1-kane_chen@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250627025606.631167-1-kane_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5m2v=ZK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: J7A11IPZohJu

On 6/27/25 04:56, Kane Chen wrote:
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
> 
> This patch series introduces a QEMU model for the ASPEED OTP (One-Time
> Programmable) memory, along with its integration into the Secure Boot
> Controller (SBC) and supported SoC (AST2600).
> 
> The OTP model emulates a simple fuse array used for secure boot or
> device configuration, implemented with internal buffers; external
> file/device support not included in this version. It exposes an
> AddressSpace to support transaction-based access from controllers
> like the SBC.
> 
> This series includes:
>    - OTP memory device implementation
>    - SBC integration with command decoding (READ/PROG)
>    - Direct integration in AST2600 SoC without requiring user parameters
> 
> Any feedback or suggestions are appreciated!
> 
> Kane
> ---
> 
> ChangeLog
> ---------
> v2:
> - Rename device from 'aspeed_otpmem' to 'aspeed_otp' and move it to hw/nvram/
> - Move OTP device realization from instance_init to the realize function
> - Improve error logging with qemu_log_mask() and remove unused error propagation


v2 looks OK with the fix I asked on patch 2.

In the next round, could you please include a patch re-adding
a drive property and a block backend in AspeedOTPState ?

Last, we should work on linking the drive to a machine option
but first, let's add the drive.


Thanks,

C.




> 
> v1:
> - Initial version
> 
> ---
> 
> Kane-Chen-AS (3):
>    hw/misc/aspeed_otp: Add ASPEED OTP memory device model
>    hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC
>    hw/arm: Integrate ASPEED OTP memory support into AST2600 SoCs
> 
>   include/hw/misc/aspeed_sbc.h  |   5 ++
>   include/hw/nvram/aspeed_otp.h |  30 +++++++++
>   hw/arm/aspeed_ast2600.c       |   2 +-
>   hw/misc/aspeed_sbc.c          | 119 ++++++++++++++++++++++++++++++++++
>   hw/nvram/aspeed_otp.c         |  94 +++++++++++++++++++++++++++
>   hw/misc/trace-events          |   5 ++
>   hw/nvram/meson.build          |   4 ++
>   7 files changed, 258 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/nvram/aspeed_otp.h
>   create mode 100644 hw/nvram/aspeed_otp.c
> 

