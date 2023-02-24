Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1823876ejc;
        Fri, 24 Feb 2023 06:28:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9e8jRVFjwsydaa0vYoHpee9OMUTHUzIoyWhM7z3HtfJv6B7jYj7bMRjCiofxuc8yz7OjGo
X-Received: by 2002:a05:622a:120a:b0:3b9:a589:e7f4 with SMTP id y10-20020a05622a120a00b003b9a589e7f4mr29992785qtx.64.1677248936310;
        Fri, 24 Feb 2023 06:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677248936; cv=none;
        d=google.com; s=arc-20160816;
        b=vyVM78ig78IC9ZdxBZ2NT57xcCtxsrLAv+JaENpqltn6zUDetwxE8rFIDJQDH1PIKG
         IaZQL7PpbZ0SQ5YZytwbHOuJ26JkDZwfKC5ENYerEyoady0C95BWEBq7lmA/LJyQryJv
         F/nXqQgdwaHnwo9eLl5vq5Z1Hr64gubJ+eo4fB8qmVLNUewLUj0+UXUUCe7Vj4S3TqWB
         hGKrI7tXF/jEWhOn1wNoBGKSV8wHDxZB4+M6EWkwO3jlF87VARwySDVaAicCfmat91a2
         vxWjAGq1H0NIiGW5J96XHLzsG0xRjESrOezjxym6/G3kGOSXCIq/6QGwht/djkiMDZqA
         YwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cQ54g35bCuD1w3uyzUPmiOttzPBZuwsyHex1RfuqZ5U=;
        b=w5H/2waGOu/7cWAAPHucpVyb2RXZYayrd6c5W7u1jfgo8s1ceea7zMt+7JJp5deEOM
         gu9W7FMJJ28Shazj1lwG+dHhUfKDX73B+0oxS9fv/gXgPG4W+/WtXxJbMWtqsOMdJDCz
         nQ9nNkfUZf2FkmupstrlwqDYKrN5Frtf5PjWJ0PobSfbV/wi5UPNGDdEXdDf8XR6+Z5+
         hxlXpkrM9cQLiSbPEwciZSb+30JqAx7IY1TW2uzCFhE50SNg6wAeB6SR05iuFsMlcwrJ
         DEG7jLj9I4yvG1rW16Zhog8Ae38dy7rxajCHRKG+Em68LKOLl6AHadOExaF1n3GvMWh6
         t+7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8IunscV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s125-20020a372c83000000b0073ba4dbc500si9852695qkh.616.2023.02.24.06.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 06:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M8IunscV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVZ41-00014M-Vq; Fri, 24 Feb 2023 09:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ40-00013h-6M
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 09:28:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZ3y-0003Jz-MH
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 09:28:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id pt11so17277011pjb.1
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cQ54g35bCuD1w3uyzUPmiOttzPBZuwsyHex1RfuqZ5U=;
 b=M8IunscV6G0Bbf0cYdvshy5ve8T8VU9Y9glTslJXBLCWl0ALDn/sjQqQ3hgXa4m1Le
 DmhPhNclHU67ZPeLJoGE2jFtcTnxRlSS4OZqN7zf+dsngiv+tV7uWWmIJc0euprkfkGP
 hNXs8smYaEmaQj4x7EEN3Z5LalrY/ETSfoZ14QXwsfIguuITV/Zlq5zd5WbYLYDLdypU
 z/QLGKmStgn+Ds6M5jmjk3i+HnZx8XHqxVcCCtigPaAzppsIKT8j/9g78LpIsTisPdhf
 9V15IWpDrDTPgeTtYSbDvCxbuM6VSC37/AYYAb9z/2GZ3bX+fmeLDMu91pyTk58lskhg
 MTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cQ54g35bCuD1w3uyzUPmiOttzPBZuwsyHex1RfuqZ5U=;
 b=yDrdVyZaeNargVCnPwJynhFeCoF6vtU1lPFw2naSbDW49FH2IR44nOuAOsK2Srvf//
 Y4AWDFa18Lz6KA5pRP2raQc5wuyUrkgz05b3z6OXuIY6UXSbLTApPMP0C6NZ5hOvBITa
 PRsMdgiq+MtGsnBBwKi29e+MSTB3Bfl5cOpDs8+lWD1Lo3JwEGWRDjUveSZs/Sg6gmXv
 8+CPgICx3zvWo+6NrSKMf2FKk4Ai3+jazJb5sAmFMZoixjj1skD7PsqqebzKM1ibj5C4
 8W0Da4AKzT0mrk+tODpVWwWWh+GpE6+Dp9blsOblBoVfT0wHIju5QVzcGiqjyxBWQGHV
 2kAg==
X-Gm-Message-State: AO0yUKWA+YTRVTLPCx1nNHqKEFEGOeDpK2adXN6luNYKhBdFJkK7wFXx
 QHm8hURN+T6k2VUdAt2w0/oz24peeGnE0EJY+m3I1kUmRnjsRg==
X-Received: by 2002:a17:903:3307:b0:199:4a4f:9d2a with SMTP id
 jk7-20020a170903330700b001994a4f9d2amr3163056plb.13.1677248921173; Fri, 24
 Feb 2023 06:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-16-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:28:29 +0000
Message-ID: <CAFEAcA9AEtb52QHthki4CV7ocBqQvR1j-88PLgxBUrVkysjqiw@mail.gmail.com>
Subject: Re: [PATCH v3 15/25] target/arm: NSTable is RES0 for the RME EL3
 regime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rq/PgUej0WEs

On Wed, 22 Feb 2023 at 02:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Test in_space instead of in_secure so that we don't switch
> out of Root space.  Handle the output space change immediately,
> rather than try and combine the NSTable and NS bits later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
