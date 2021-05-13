Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp691864lfg;
        Thu, 13 May 2021 10:25:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz++1qiTKHQKhntAVcKUZ4a+0U/zQ7yC/hUEcZKyFd5wAPaJy/Q3ITWD8CuyJvHn2t5d1t6
X-Received: by 2002:a6b:5015:: with SMTP id e21mr29381700iob.104.1620926705231;
        Thu, 13 May 2021 10:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620926705; cv=none;
        d=google.com; s=arc-20160816;
        b=vUO6socdFGpeSbeEGoT9VZQdMhWF9pmWM0VmPrBZxxk5HmJ9Kr+o+Waj5+ptg9WDE6
         NmanugJJJVpjcAwUVvSQhjZuKx2mPSlfM6/IsFplOAD8ikXZkiGbqND2HuRDpDROP7ZW
         +6mzxa+U4ttrOA1zRj9vFU9gQ0CFAwPQ7buxx/RL9ecX0wZyQH0doYLJvJ6hyMYJXLpC
         ecHbVwHLeZVp3ROeAp8y0n2rlIX+hcBzs3R0EtcahXL/FqRsHAX6qACNM4Rz918c6cgn
         VToC5kCKY6E2rNyfEpeU06aGE1MaXO5BXCqHN13c8ibs1jB+xlCutthhfzc/XUfiDBUM
         YS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNn5IsosjVhfn+FziRCMsEbqPGCDF9wzJE3NrGaFHrA=;
        b=UpNg8pK7op7kKqlT6ccubfZmg70EsXSFYWP9UWQByOJ+vyjYPrUHE+hJVbpUj7m6wB
         +pfdpuiOelUDVVGcdci/M4xK/NwZF6J3OfWsOGwkobSTb8MA+P65ivSbdgGMHrDllmeh
         rKQZCPkBI5cQeQwtSXnDqfJ7sDaePypDP55a4gCuEuzAcRvZaYJM0bIFLzc2EwN66XB7
         UcQ/XGeLfjvLFOhsUZ0D/vVOH8Xqtt1TqJC2M+5VkAGivR/lAumABSx8NpjJnOIe4YKj
         w9alcKqhSay8Xv+miO8s65ELbZ/PFPe87uNMczqCguSr+6scHjuqjsdFH0MzG/xZljCW
         XDcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CEmgBY55;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si3749104iop.88.2021.05.13.10.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 10:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CEmgBY55;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhF56-0007nW-HG
	for alex.bennee@linaro.org; Thu, 13 May 2021 13:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEzC-0005rM-N8
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:18:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEzA-0006Ih-3E
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:18:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id c22so12802034ejd.12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNn5IsosjVhfn+FziRCMsEbqPGCDF9wzJE3NrGaFHrA=;
 b=CEmgBY55tlgveiL9qo+TnZruUUxZcUbMZNhyYho7+uPI9n48R9oHk2mMrjNBkNuhoo
 9zKAaNizmdwq8ZBJyAqiU0FYHyDYaQ6Uhnd/RDAE68r8bIee/ara3tN5gQpUQj/I40oo
 DxKOHaAMvmTnyZSnCApVF372lvMfJE4x6xj7pqGOGIUjH662upbNod9vDJYsmKWyXX/6
 /aZDYjF4sOOtcd25QIT/yA1Behuzv/VL2P9KXVUHGfNUn38Njs7l1AEazkM+V7NYe/fi
 TmuI7pNqeUv34eiIbpGR0x0p4hJVhl+llnWxkou+XBILgCXoLjm6aIzYMZUIcpWmBlev
 zGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNn5IsosjVhfn+FziRCMsEbqPGCDF9wzJE3NrGaFHrA=;
 b=fmzFg177BLn5vjOdFabdIbn9cVXc+CSAMBTpAO0crk02q3JVfIuxXkBKIoo2W/v/Cd
 t3oeMN42WM7AT3X1v/hBt9jGIk4Xd3mqgpgFBpElwUki62svircz8MOAFJO2/z1claTy
 CjfnPTM/o3M+6eMlnKErXkjrBpITa94UHOa/kT2k8rmj/RXU2Wa/htCh/nHPzxEoldRS
 b9dhB+DC52O6wIJ2Hu7h0bFaxanVGiph80Hz/tryLK/GS8tSrLpd6Jobd9dVsFGWlbZY
 VgZgxPuk0Aq8Eh23ksq+PGJ6zNIIpWx6zh0j1yb4fkL3e7JcsD7GxpPjrCnkf/bZTLJ5
 2iLQ==
X-Gm-Message-State: AOAM532xLvmDjh6PL37cO4AOUlnZmFjq334g7tHUJIc5DAdeYy7C5gOg
 FpHKwgkMvHkNoi6nwx87DlNiQwc2dB4G4Ajz/nUPD28ZcJQ=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr44097304ejb.382.1620926328311; 
 Thu, 13 May 2021 10:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-77-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-77-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:18:36 +0100
Message-ID: <CAFEAcA8QuujGYgPeqtEP8Cy8W+vW-twWiAKO01bDNd-em8cynA@mail.gmail.com>
Subject: Re: [PATCH v6 76/82] target/arm: Remove unused fpst from VDOT_scalar
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ilb21Gj1zoaz

On Fri, 30 Apr 2021 at 22:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cut and paste error from another pattern.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
