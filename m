Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp256422lfg;
        Fri, 5 Mar 2021 03:32:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/IJLgltCWug911s//aMXkqKKge33djyE2pCZ6IbR4KIh5P6sSt7mz7fuVSTuOsTqu88GO
X-Received: by 2002:ac8:7695:: with SMTP id g21mr8253779qtr.183.1614943929767;
        Fri, 05 Mar 2021 03:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614943929; cv=none;
        d=google.com; s=arc-20160816;
        b=Ru17xrx4rLrOpsPtZROcItkEfByj/z+Q/YL4Rd3Mh2D+HST8mq7NzAhO/rV2+WrIX4
         JtiEJDnLai8lffAV6nlgoR2Vi2bM4tyBj3PKf26svqHG0SE/r6YBECDfhFlD8UsHwWBY
         CPLztbAAiHJYDoN+wMI7hXf7IfYTjEXNQipaYXlFUw2JInge9Ldc/qQcopV0hxBgdZeP
         xOl4A47FWBDsLOerYMlxGcerGQI9xdT8bqGhJVxBTMDz8tA09FwjoMdKN4wiT3VHzokB
         SmpEr4CVmitfnkgsogx3lRSL8U4578HpwW2ZHbBe+sc3K2ER8oBqP5OLTA3In1mnzI2+
         7LWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zscAUD2YQ9DOiDqK6Dq23mxPUuuVEgeCyPegSqzHotY=;
        b=IcM/YE0fc/OcUXo0cANyPXo0cy7/GMEOWVIEAo8oir+5THzbRiTtJA99KlnGrJy5oR
         AszRoUJvY8UOLJV8pHXateg7+zzYzeabmcQ5Zv2UQwlmDXj+1DArZL364QpOwxLVZEyl
         hBNUNVqPyAyOF9a05gM3w/PNJwgr0GvEbka2Pq29A06lT7s6dUI7ExZ944JEYHiSnYVP
         Mdb96miwxmkLCIi/Gll6sLdguQ2WnR2lPAHaFyrxk6jc6/xawtsq20VpcxPE7hnOLnmy
         jaj8i+3qOco0sc56QGusUfeYsDyKbLI+DiDB+itEo/MSvOm/lq95MuA51RWMJscuEdax
         93Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s0mFWMRa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si1423655qtx.264.2021.03.05.03.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s0mFWMRa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI8gj-00023B-3D
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8gW-00022c-R7
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:31:56 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8gU-0000TU-J4
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:31:56 -0500
Received: by mail-ej1-x633.google.com with SMTP id r17so2720504ejy.13
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 03:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zscAUD2YQ9DOiDqK6Dq23mxPUuuVEgeCyPegSqzHotY=;
 b=s0mFWMRa0k5JfPW/nU2PFF+DnpG/NSLKiPYabAznd+7N2EjAhJDl1MIJx+arYRqxtd
 74nPKNDQ7Vu8Nj37dXlzo+H5AyAz7OxVv+uq5RrwAOabFTUvHiV/EQzw31ngo6HHnrxb
 02L5SFPZNLrGQuqv2s3oOSdmkm2zqeeYBwNfsslTIpq2vWIhV+aXma868Vy6OIBkQwbn
 KI5JE2JwCC6mY4l66kT4B7CwJoFDw/MZL2wDk4PPOpzK1fZoXlhgkP+Dlk/haxtMSV6V
 IRzLeccwuyIm5ryEOoDZ+/IOgb+Hw7N4iVg6tQnXyDZSH1wNxIcJgEeAN/6t80XTCjqF
 oalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zscAUD2YQ9DOiDqK6Dq23mxPUuuVEgeCyPegSqzHotY=;
 b=B4f5HIXgUvvp6+oXYYr4hXhd9Pjh2InMMjSBhnu4oNK8GSvs56PjLfQIEYRW02NExu
 xPboGfQ8gZp7GgdT6Um/REMkSQwJtJ7XYrh+Y423K2MUfavgBWh/Ff2GsG9gi2aXr1zN
 cQxJE2ovG/S8fx+lpbtGcq/qnxocJvemfWcZBF4axM0ryoIJya/qwBW+pqzKcUGAtRWP
 X7xMAo2ZzEpFJOmy9EHrbtM/YE2dPqWAwzChv8RFRMdemsnfAAsmssBgDLpuNsLthhlm
 yCkc6eNFZ1HDDt0l3pR0iLZTbGaMQ46O0082Cz1IJ/ADx/LKIxczcg/ngIR2OSCa1ZAH
 4bWw==
X-Gm-Message-State: AOAM530/R0+SVDz/7HBKEzoyPiCFlq9bnFLA5U/+MKwRUV7Ks4vi0uUL
 Y5zY30MzlKTvuxv4Ve2Z+k8525TACyltL7+YlVabow==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr1902808ejc.250.1614943912493; 
 Fri, 05 Mar 2021 03:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-4-rebecca@nuviainc.com>
In-Reply-To: <20210216224543.16142-4-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:31:36 +0000
Message-ID: <CAFEAcA8LYf5V=3SEKBzfaGnzSL4K58SQXBqsdMizpE45vTD9VA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit
 CPU
To: Rebecca Cran <rebecca@nuviainc.com>
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QDlBDwPyBXkQ

On Tue, 16 Feb 2021 at 22:45, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> Enable FEAT_SSBS for the "max" 32-bit CPU.
>
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5cf6c056c50f..88a6b183d325 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2206,6 +2206,10 @@ static void arm_max_initfn(Object *obj)
>          t = cpu->isar.id_pfr0;
>          t = FIELD_DP32(t, ID_PFR0, DIT, 1);
>          cpu->isar.id_pfr0 = t;
> +
> +        t = cpu->isar.id_pfr2;
> +        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
> +        cpu->isar.id_mfr2 = t;

Er, this doesn't compile:

../../target/arm/cpu.c:2223:19: error: no member named 'id_mfr2' in
'struct ARMISARegisters'
        cpu->isar.id_mfr2 = t;
        ~~~~~~~~~ ^

The typo is obvious, so I'm just going to fix it up in the
target-arm queue, but this does suggest that your testing process
before sending out patches could be improved ;-)

thanks
-- PMM
