Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1329843ejc;
        Fri, 11 Aug 2023 05:25:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvw81dCh8rjHm+Y86rYnAnWunebohc2Hl+5YcDXfQeDqLXXbPw7uzoEyOKzhS5L9DyiaKq
X-Received: by 2002:ac8:58c1:0:b0:40f:f058:1478 with SMTP id u1-20020ac858c1000000b0040ff0581478mr2120268qta.30.1691756733135;
        Fri, 11 Aug 2023 05:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691756733; cv=none;
        d=google.com; s=arc-20160816;
        b=bCdwyqgR4oqxG5/UFX1CR71hPO3Xpj/qZaKFKkvHJ5bkqNSvpp1DNTjUNP3oFWeGLl
         1uGs9DGX4dxOkIZtV1Dko72AeYvhgG4UFWAGllnqmivoo8yxPp84rur4oSUBfs3j7J8M
         MM0VyxeHvoOeoOukpPuAEklDQeuiGg/PCZiEX7Hh9By19NCR4tMem5Yrh/tDNnzbO2MD
         pSECVIkT5FXJ1I+FTfDnQ3zW9wvJ2taVqfaNhHM9iE9QH9issNp+ZDTeb5Wa/NJkQQEs
         yVfx7aTbV2upmRTXa12QazthyIk2F6P1Nobr2+KnxwYe0m/ujyzJq2m1heJdd17qPL35
         UKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4aYHUM94VO3BDPln/7WJPRoSZyQ6oJgnhLNoV7ckoDA=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=xagVEPy/OZwGgGdisoqMxGm78gBeK6jplfe3jnT1Fg8U408x9Ot/C39WE+V+6LPBcE
         wVjbTcmobNzuarj4VoKVGwtvU4enWQC5W/ls1VG6JheQtX5Ss3NGjPJIodMMm4Q+coWZ
         YdWFQwVxi1E1Qsa0ZPrLfoBnrWxqypgrolFSnYrsbO5wmw0MTABwtBzDmhxgshDjsn9Z
         GCsmMCLtR8dXZYuJWQIDEAuNIsHJX288SkKzE0E4outTzPmypU8rWQPOdiro7Cq9LMgH
         IymV5zOtAKgmDrYXn3wad064DD/fR5GeOOandylgZPBTKhjw7l8+d/GEaE1z1KPW2Onr
         J5gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W+66tjE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac85856000000b00404132d3bcbsi2190209qth.348.2023.08.11.05.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 05:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W+66tjE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qURCj-0002FY-7b; Fri, 11 Aug 2023 08:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qURCV-0002CX-5T
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:25:09 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qURCQ-0007j0-S5
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:25:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so6304823a12.0
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691756701; x=1692361501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aYHUM94VO3BDPln/7WJPRoSZyQ6oJgnhLNoV7ckoDA=;
 b=W+66tjE3TTjfaSeu8aewV2relsNCcXStzwCzuxE7gPdvA7lAiggBT3DiwM/mE+/As0
 OBdwtDmhqtoLNtcWL7EGAoCQKhr4Xgei2BS/30FuQGbISG6bszagA8c3rbilkqK0BfXA
 0VPZapFrV/sTVgkdZX4zwk2lNsESl4/wDN4koMkBc2/ZSXV9Gn15njDK6XIc60DlLWTD
 QPtmLeW0YzM2cIhxa90x5kyGUT4BPIMntGblEp77sBKrNrcNLq3FalayPHL++eqIXVU7
 Fwr85NTuretSVciPpwyyPpYNLUZq1/qThsNYT275nzBwS5P53VwbGyd6+jBsTQ2G+g7o
 HCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691756701; x=1692361501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aYHUM94VO3BDPln/7WJPRoSZyQ6oJgnhLNoV7ckoDA=;
 b=C8dtaPZxXQbEloFOITp/iazNVFPur+FIETBqhO3EIhb6xtZdi1HJqAixk2r9dd4b3F
 LtKBa/C8Q8Vmv59mzRxM+mQLWI6vCOEbz4fMhk0f5IGNosS26VrfMRUV0ej54Ro8X9Ut
 zeMZvUeuPs0e9JhwyZFA2kXTUvA3NvxAPB+/7pzrGDGj8/ibyBrkOenArEwEjrJcJUWa
 9R3L4gdh/gv7urkPLN3Q5NCcWOExRj/8zVyjAAm3tke4U0YA75JyDWWJZiZnExDUIqYB
 wL/cil9itRexiXCFMK5u6jkMk+CuAz0x8/Iu4DCbO0ffOUx3eATyx+H7OZxczhbDWwHy
 DX8g==
X-Gm-Message-State: AOJu0YywtR7XWRRJN9GM04MAAQ0iRCiFiTwUSrbHWeIsXFKH3tKAclIo
 clUY6SIemLBtplc2fDdtFtroDHqiH7z5WqZIg0Y0Vg==
X-Received: by 2002:a05:6402:26c6:b0:522:ab20:368a with SMTP id
 x6-20020a05640226c600b00522ab20368amr6278244edd.13.1691756700333; Fri, 11 Aug
 2023 05:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-17-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:24:49 +0100
Message-ID: <CAFEAcA8FPkmcJM7evL6aCN4ZkQD76d6xaaOJXL=pB+Qq93rbZw@mail.gmail.com>
Subject: Re: [PATCH 16/24] tcg/sparc64: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: +7NL51xl/du0

On Tue, 8 Aug 2023 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
