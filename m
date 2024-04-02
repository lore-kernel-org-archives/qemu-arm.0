Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4063038ejv;
        Tue, 2 Apr 2024 09:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9H3Ass61vuy2NvM1KsjnVjojuvw6G8ZEzVxe1cKjXUQW4Z1G00LenMVNGXF+TPsPKG/mrJrFCFBvmj0x7RuGU9rrEuVhO
X-Google-Smtp-Source: AGHT+IGA2hwn/UHkXbcfyT4WRvKy4u2tLz6B++/7S0hPBYWVXxxRiuojJFByk2Fa6/z3Wyl7TeyX
X-Received: by 2002:ad4:5685:0:b0:699:c7c:8f62 with SMTP id bd5-20020ad45685000000b006990c7c8f62mr4428471qvb.25.1712074635850;
        Tue, 02 Apr 2024 09:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712074635; cv=none;
        d=google.com; s=arc-20160816;
        b=Xbi3oMbECxisvf8K2koGUmsXv2mIMRvs4yKdr8jRTOEfZpwkrh02v7LFSrMFz7+Vg9
         kkwHTNZJDkUmuGa7M7yXOTu2mjG1YntStwp5guChXSNqMmpAOWvV0trpTg5M0r4mlqlq
         +DkNTEOohRKh6skkZTP/iQ5AG8o2/yU1eT90ZOz7kLfRmZQNkXh3OiedbB0hQyQzIDFn
         ci/wXPsS7M42Kir0bm6w1/Mbv+YCjYEjQOSUkuJF3gUP5JHrRfcvMRKd18YMAYa8KPm+
         XjwGd+OT8GBcT2JzCccV+DpLgB9NaikE8MYe1O+nr6I5vPZa4HLSbWwaQukzcHS6PtLa
         BgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cY7a0MSuSZXrf7HPefUvSlSV/UzNMemAWGF8D6/Yq3k=;
        fh=tPcmRUZ/PTOB+5xT0QOGVzppFUlu7U1aLg7QOcR4qCk=;
        b=hzm3MNJkU/RLuYJxmLP9KVw6O+NoAmG5YgiPGJFPHJJZRpLJZ9sjBA2cbdzjnEBEwN
         Or+IGa1BNAXepUi800yUTU8GB3ZWFtL3UEftr04kfVDAxqPHKt+iqFIsGZDMkZgImtRy
         jwdxGYdqwDBqtFJWixkXcT8HwCpLDsi040YhbKSzmPOJPXnOw89vh5NnNKtYuFYmWaEP
         tGSdSBPlSmoT/4J3uUE8EXLTz45KPADx/YMGLKmTsc5W/YSHneVyh4bgtB4MLFyu3a9b
         eogVleLYixcj1A2LpNM/3qT52FM5H4KtbsQXFNUAzH2UzraUNazU0jck1CTG1JM+Feld
         n8IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wj2phm32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a0ce587000000b006972eded89fsi12214357qvm.307.2024.04.02.09.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:17:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wj2phm32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrgof-0004QW-TE; Tue, 02 Apr 2024 12:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgod-0004Q1-1t
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:16:51 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgoa-00012f-6k
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:16:50 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56c197d042fso6418896a12.0
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712074606; x=1712679406; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cY7a0MSuSZXrf7HPefUvSlSV/UzNMemAWGF8D6/Yq3k=;
 b=wj2phm32J73dG8d8HrPx4i6IxdyMQf+Hdl1okU5N83X354M65IT1jNqtjowjIHmq29
 WAhA5Qiax4faqaZI4uAEqeG/BomiZkiF5fRaYy4XT8Lvk0gW3FE0OW/K05iCuxkwTXDJ
 /Uvfi9Dvunlf4m1jE2xx27gyMB0lDF4iXlWwBKo+biFEVfFt+jx2E3U0/M5kos/ccFkb
 fHDNxqnPKvIFsHyVKaq1hoY/d0nOXzwcZukEWyHOawWRtfuq5Z2G4E/qa18uPoV/c63E
 rzWzPkiBJtoQlvmLKfl+nujanh1KAdEdtJGnMLn9vZTKI+poACqGO4/s2365ozNSJQc+
 zyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074606; x=1712679406;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cY7a0MSuSZXrf7HPefUvSlSV/UzNMemAWGF8D6/Yq3k=;
 b=cu9nyTTNhoXsYthRascDKzqiDGd3mPZAj1FmApOmMkZ3BH9w2b3GGOY9xi0IGvim6w
 MwCuMfLZmgeVYAPKb/7F2mVEQBHnkaRZV7O4DEg0z3h/kACGQ/opaQE2kc6sLZpI5tgA
 Yv+GALp4rk4ivhHs7dlP4qbxhMIE/1g5pVquFmEgwKtOSxlcdeMNmakOD3RpMcGBzDAn
 R5UpgNx0hl24JkRCKmZhREcqEcEWso4posTtQTBzuhuntj59vvX0UhIGx2dEAWeGYQXd
 XjNk7kj9x6bJ2CYAfWXEO9INKtFav/gwvvzERV9aZ0HSTFSqjuyn+gYJV/AECwvtA8WY
 EOrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAr40fOJILZpelmcLCmA9YVgZVHwugd8T2bHZ33+mbevKARL3+eLc2EIFonExg3tPGnkTmZdZkhW1Mtr5J1AJgIYSB
X-Gm-Message-State: AOJu0Yyaq+A4jk4buoa8+iwcmq8FBENSDQ3AxD/5XGaKGKPlDPD5lhZR
 snF8ToBeZGHUNUTaVRioIIYpBiqWwgU24rBuI+uwhTX3B8sCQ7DgjZaLLSMDCmgDn6ZGySrKfN0
 ch5UCHuyadyuU66VDhxmIb9kFN6sZQjkSjpaUyw==
X-Received: by 2002:a05:6402:1ed4:b0:56b:a969:e742 with SMTP id
 g20-20020a0564021ed400b0056ba969e742mr9534672edg.4.1712074605943; Tue, 02 Apr
 2024 09:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-20-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-20-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:16:35 +0100
Message-ID: <CAFEAcA9t+O8vwp0F_LWTiibEusaPPgWGSoe3Q04ZpowRzr=paw@mail.gmail.com>
Subject: Re: [PATCH v11 19/23] hw/intc/arm_gicv3: Implement NMI interrupt
 prioirty
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: elLJXF+Z06+F

On Sat, 30 Mar 2024 at 10:33, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> If GICD_CTLR_DS bit is zero and the NMI is non-secure, the NMI prioirty

Typo in multiple places in this commit message and in the
subject line: should be "priority".

> is higher than 0x80, otherwise it is higher than 0x0. And save NMI
> super prioirty information in hppi.superprio to deliver NMI exception.
> Since both GICR and GICD can deliver NMI, it is both necessary to check
> whether the pending irq is NMI in gicv3_redist_update_noirqset and
> gicv3_update_noirqset. And In irqbetter(), only a non-NMI with the same
> priority and a smaller interrupt number can be preempted but not NMI.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
