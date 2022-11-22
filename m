Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3348955ejx;
        Tue, 22 Nov 2022 06:46:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5T9GsLgHkb3YEDOEtMh/pKNzRAPLG+QISzCrd5IUOeccE24aDEOH+YHIx4avHMdvgKSbyM
X-Received: by 2002:a05:6214:acc:b0:4bb:e3f4:6ee0 with SMTP id g12-20020a0562140acc00b004bbe3f46ee0mr5110775qvi.54.1669128394171;
        Tue, 22 Nov 2022 06:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669128394; cv=none;
        d=google.com; s=arc-20160816;
        b=TcxlhF0iwcc6GWh/JjwS+RbCgbrgA10KUbFqLooIgZLlvGmFec1CgVN5uUdKmuyAna
         A+6GG/aqpWZp/g7oFPWscQtIjumpQviPVyeuJqcRyCQMoXa1fEXNa+dCZOxxk1lpCPOJ
         Jy09Dw33TZfu2FXm7NfRiwHhzV87qeLBkChJXw/w9FJHTVChreshqpTXBF51DJCaKxJw
         yvMOAT3r+ZvCFHcT6OT0mqpqLLlOgK1dvh9/TneWT9HNhMtEif+SwLAmqHE+JbE+FX9+
         RsL4hvMU7YWhRuHexq0krrigs8bLnVnr2A43+q4jW/68fwib/w9vfqkH+N3MUja0mS/l
         QLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=04DWyC90euoHILa72IDqaqBASlyOf9TFDQbJ4q+rdXg=;
        b=xLcVPEQXjkclg/1TgCTgPQ4lOcpqGr3EI5UK2iIqA4Mld06WowldhiYEr/ccljHYts
         +efAELOVqd+AL6pL1o6Ilsul4US41SvHQSU8DJ07J0vlaWiJBecvGa6e/fCsGjelkEiZ
         DMW1pV/+N+d1KAhDWEI7Owcc1r+amvg08oaUMcjzrntVhLqpV8p4boiDyXb2pxSxu/JW
         2HUIwhMYdrtX6XDvtG+vSeZuVXI0phmwQgfPiaji6rJEkB6w3v5sQTqTAxfRz2RpYL7z
         BOzLcfS4WX5/zfvNEHb/1ChE/6hwmPE8IYxdj/IERwZOToNF4Qo3sbwuxWx8hnWZY8yx
         OISQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYt0E+WR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv8-20020a056214262800b004c6b0f1cb0fsi2814796qvb.86.2022.11.22.06.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 06:46:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYt0E+WR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxUXJ-00020x-8a; Tue, 22 Nov 2022 09:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUXH-0001yp-2C
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:46:07 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUXD-0003bk-RA
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:46:06 -0500
Received: by mail-pf1-x432.google.com with SMTP id b185so14556735pfb.9
 for <qemu-arm@nongnu.org>; Tue, 22 Nov 2022 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=04DWyC90euoHILa72IDqaqBASlyOf9TFDQbJ4q+rdXg=;
 b=dYt0E+WRA2g4BFjqw46qs6BxI0IqLKOADxOx/wrsJehcnjeInNiavClGky+sMHzNKR
 Y0b2q0DFRc4GnhG5OCTreK6kG+q5IU63wwvRcWLQUAXufZiQ7CyFtUnmP1AhY0K4BG42
 rHD4sFPdQ/V4JUkHqGQRNXKfxU+qgEk9Mwm0yjwFmiN+luIzAVtOviy8IzEveFYwfOMF
 lIpin70x/m9VcQhcHn8dETPVKowALsu7eNhTyQXtXuNG6tsl68kDqShsgSlhuOEQlHdx
 axxF40VG9/2VEBuEisyZtQO2lSTeFYKfpSjUXRTL0CoE2FEqLwYw20mb6FibGTU20EV6
 GaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04DWyC90euoHILa72IDqaqBASlyOf9TFDQbJ4q+rdXg=;
 b=UJjaVg3rg7PnmCvDEnQXiepYPL1kQ0vnHiQGj/2X/al+WJi7aTVvuqO/oYhd13YBJk
 Vku8BhnHP1u5TjgtcZpsvO6kgz6CN8PywhMCupPDfPNUZMsFnM+o3E5nlVwukC20qO76
 /mJsg8PFLHna2RUrUNuXDBwWQL/4Vj2g2haCo4BqlPc9ZvpEG9Ux0lZ/SYpcMtpggLAQ
 7ryVIgFlAnbZdNKBeclgumMJmHRGMc8mc0BRRGq4kBssJhHxyKase3zShaNgKzfoyKy7
 xbbpCW3JhxKESeRM9uBRO92P3nOwGGPBb27meqC/gnd2SvndnCmS9RAvhzAo8etcjhQD
 6YZw==
X-Gm-Message-State: ANoB5pm82j87fcB/bjltFSoMaopkcRGzCBvhrLVxPAkYBT/Li8AMCsaF
 3TW0oVTW74QQ7BmZ7Ynm0mRAi0INtmtDQIuBtTT8fw==
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr6323039pgr.192.1669128362348; Tue, 22
 Nov 2022 06:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20221121150819.2782817-1-tkutergin@gmail.com>
In-Reply-To: <20221121150819.2782817-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:45:50 +0000
Message-ID: <CAFEAcA-0DQf_O6i8zk4U-pO6qYhPT=zkOB_FM2xMqBxECbzO7g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: cnfMLrsD45K+

On Mon, 21 Nov 2022 at 15:08, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
>   cortex-a55 is one of newer armv8.2+ CPUs supporting native
>   Privileged Access Never (PAN) feature. Using this CPU
>   provides access to this feature without using fictitious "max"
>   CPU.
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>

Thanks; I've applied this to my target-arm-for-8.0 branch,
which will eventually become target-arm when 7.2 is
released in a couple of weeks.

-- PMM
