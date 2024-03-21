Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp666519ejv;
        Thu, 21 Mar 2024 10:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7gPRLd/2gGaL+JFGI51HYmfHMLO6eqQEgfwXFf4scoWqIh4dGCklPGXQ35J0MlazXxebDfupTh9oVGcZegogxOMcqDtvA
X-Google-Smtp-Source: AGHT+IHpqZZ0PXE9jLyqqTlu1RJrLE39FyvGeN7OMLUfN94RLbaKBLp38J9iMQaJZii3vim4QVaf
X-Received: by 2002:a05:622a:606:b0:431:2648:a805 with SMTP id z6-20020a05622a060600b004312648a805mr2157220qta.53.1711042662711;
        Thu, 21 Mar 2024 10:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711042662; cv=none;
        d=google.com; s=arc-20160816;
        b=cL0DueM+8upZ2pQc7s9ZZvdtQF4Hqzy/aA0mugY7zY3KUOU3SZeTH8XbfxsxuC6D4y
         epnC9/58stEGV4JxwHG5Nr0c2V43CzX1J9zpXHdNUDSvzykka77plXLTQR2+knHK4+CH
         637sOjhWmSgI2Irx7aO223av22CULN5SF/RTSU6yZnw4p3rZthhZZl/LG9Unt8/VxfE8
         4ikejNOqmODe/TtuQ6C9dyfMafcWAA1MNbpSVVG0t4zWMUKHJHlvg22c/uYNHyhzikJG
         USxxQ/RtMLAIt29Gu9efkuxSdczCz5NA/NiYuvqmxTVRGM5RW5bg6SEAtysPSdZTvQFh
         MdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W8lVGErRqbjGqv02pUOMe0Bx7em7CuZVbj4WIMLHLSs=;
        fh=z57Hlgvf/bZClI36rN/CoDhfn/QATXDzN/DUp6Jt9As=;
        b=QTMAjYZURSbm7zyRL+lN9QJ/nHWI3CzkITDHCOBn1wAuZ186/nuexcznreXSzLIa92
         iVt+qRjmWZ4KO6PKUGwRiMyyhKShm7kqmRfcGhX1NCiinfYPJ+FGN9VALaLERd0e/orr
         gAjIsXkh2ibBXTquVoLo76CIEwReINpMeghih4wPmhZN7fEbzLwT/kZN9/G0ZmnI6V6C
         Ncfodvw8cIffwmJZRV06X3wzF2zmJEYMNMr6Pqtzl3C6cWrZPA2gG8cPxLu7e0HqhEpH
         dogVooYSsZD1OHCcGahRfgwbfxl29vn3TBWsF1mzhuzjro6sT8g3mn7wOhTMzz+ZR+Zh
         y9kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fsFg6b0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020ac85b93000000b0043123f36d78si170512qta.338.2024.03.21.10.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 10:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fsFg6b0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnMM2-0006H6-Fq; Thu, 21 Mar 2024 13:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnMM1-0006Gq-9v
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 13:37:25 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnMLy-0003Tm-Gl
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 13:37:25 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so1671240a12.0
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711042640; x=1711647440; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W8lVGErRqbjGqv02pUOMe0Bx7em7CuZVbj4WIMLHLSs=;
 b=fsFg6b0h9ESawjrnuVtgb5eeLuOjgb8d5emmZl8Bh0DR1zLEt4qlpgtycv9R304yBD
 zAp3ydeE6BqpqEzPS6s75XgpWEjdY9+OJC9qL5IYvPTddRZnCYKqPhTDaQ5B5rAneFs9
 W8GBWRQwAqyvahSVEG5haJcoM+JgQHsgNhxnY6qXlFCDh+6Dlo5MvoiOe08+SaE7rib7
 I3gLm78FrbCMbko+aRTVROg9oeMtgmN3Zc0OlXnKuRZ98eOYOOC10UCQ/Si4P5yPm1vK
 Lo6qBpIXWly6/wLNSY5n8ldEDv7kqzg0lhg6IHiZBXNngld5MBmKMnD5o81iJo+8DKsk
 UznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711042640; x=1711647440;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W8lVGErRqbjGqv02pUOMe0Bx7em7CuZVbj4WIMLHLSs=;
 b=DvIUnuHC3UtYGB3ok1APrV/9jCQVQFCrBb2RG21ZIhJoy/5bd+9DalIfUOC7p4h+4y
 rx8masmLbMI6Hyv5y3yvrFcZLOuHAqfiK6wjaLYh9ywXP+3xljyM5k5i6MwKAOF7EtO4
 qQE1IPuVHDztarkpkGKXUqrHC9/Oi3INtdCI/6QlGqixxqzkTisL4S2Tk8kXuC9F9NVK
 yCRG9iUvrJgAWKsVwPfpMKmu0eEmH77YVBiDdiliPkh9pbB6EETOM7tzy9uP9c2UtJ3Q
 6g3iHf3enm71hvHFN9jXEYGD+hjgm0wFBilpGMYGVEAnl1T2EO6xeV8u3AWcmzCILfis
 aCkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnyjZbJYmplRcPDbmF5f1dAWnzEy1FYaWChq0YcROYB/4GkY6Zt61TJ++wfPz7MeRL1TeBjaSpjyWTrIsJIzqzLl/B
X-Gm-Message-State: AOJu0Yy/R1yAQtTdaYLIR6Dxo6MTf4un486nMIy9kZi6iq9pext7WPGj
 VH8x+OJW9QxxyOgVI6C40mjbiquhOu/4orP2Uvy3seN5hINyapcOnTT0Bq5OdEsb7cHpm0722qC
 G+ZsO7eVwXgifktHVLS4Pyy6tU7SEm0j1Ye+wXg==
X-Received: by 2002:a05:6402:1f15:b0:56b:b146:2235 with SMTP id
 b21-20020a0564021f1500b0056bb1462235mr4590054edb.0.1711042640451; Thu, 21 Mar
 2024 10:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
 <20240321130812.2983113-5-ruanjinjie@huawei.com>
In-Reply-To: <20240321130812.2983113-5-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 17:37:09 +0000
Message-ID: <CAFEAcA97LQ87S+XRfbNFAbZMef=Bsnk-xLELkLDVsrsAJgWC3w@mail.gmail.com>
Subject: Re: [RFC PATCH v9 04/23] target/arm: Implement ALLINT MSR (immediate)
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: l98PIgHRgBjs

On Thu, 21 Mar 2024 at 13:10, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add ALLINT MSR (immediate) to decodetree, in which the CRm is 0b000x. The
> EL0 check is necessary to ALLINT, and the EL1 check is necessary when
> imm == 1. So implement it inline for EL2/3, or EL1 with imm==0. Avoid the
> unconditional write to pc and use raise_exception_ra to unwind.

> +void HELPER(msr_set_allint_el1)(CPUARMState *env)
> +{
> +    /* ALLINT update to PSTATE. */
> +    if (arm_hcrx_el2_eff(env) & HCRX_TALLINT) {
> +        raise_exception_ra(env, EXCP_UDEF,
> +                           syn_aa64_sysregtrap(0, 1, 0, 4, 1, 0x1f, 0),
> +                           exception_target_el(env), GETPC());
> +    }
> +
> +    env->pstate |= PSTATE_ALLINT;
> +}

This is a hypervisor trap from EL1 to EL2, so the target_el
argument to raise_exception_ra() should be "2", not
"exception_target_el(env)". Otherwise we will trap to EL1.

thanks
-- PMM
