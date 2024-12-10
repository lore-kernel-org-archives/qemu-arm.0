Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3534246njb;
        Tue, 10 Dec 2024 10:25:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUljTsRphv4t+7dgtnI+IAYAgBQFnjDA84+M7uhayOFzxv4beRe2tXL28DaXf2hB4shrRmGaSBw9aMFdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFavNP1fJnscB7sdcEjX9E1M3EMudYLpbHaTm53h/x/yU4pednaATnj492B9cQouyKCYHcq
X-Received: by 2002:ad4:596c:0:b0:6d8:b189:5419 with SMTP id 6a1803df08f44-6d8e70d5df9mr278223436d6.8.1733855107711;
        Tue, 10 Dec 2024 10:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733855107; cv=none;
        d=google.com; s=arc-20240605;
        b=f3Uq121d3W4uGtBmcuI3FOIUKCw0HQ7FZ3vlYPycupkVrKLz8APZj1xE7gMGY/biHt
         kIcsIZnQe2i8/zNv6H5u+C7p6f6dfLbcp8brih69CPuTnh2r2I0oCWqGQSI9vN0HqpoI
         GIoA1kJ67pnD9MIlITNzxbjKLuARyskx974gd30u9RWhmkR7OxcWT1WCJKK5IG3VRN3P
         Jqe5VvCI81WJOtXhc2+ht6Vm+kJRoocXW1aqOJDxDRS0umCkmHFjF/06k+uXioY+bZQ3
         Dr30kbP4ez2DrJ6dcQWyNDgkm4Xg4PUcBAsE7iXTi2PuQdRelW6guf5ml8sQfqvPvqBs
         +FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=avG0maLTivqn17JPLerqmYoayLajjpceisSK0FKqNyc=;
        fh=W1P3FFkU75PGUW5tuihFEOIgUyEQ/+rz6mfk5CzvSJM=;
        b=MamUCD56vgZOUWLKilMN4OhWySdm1etRkmoiASYqfFUDYQlj5HKt3733D6yHZG2L47
         bAizwd6bcgSO8DpGVgRVTQpIaZ/QKdnqkd1otd8Re9KmMiCF5Cm/hV9T9/77CTC3UMXA
         4bQ/uVcYqhs1GUTApmUkNTB9KfWD6AgW8aKQRV/Jvpt8Ar8FxQL0mPIp/ef5kNaUlK/7
         XFP1viwyHIBWn3M41D4seEi2DyQkRGBaW+DJhxn047NftX1L8uWGcqPDnpicyFRuVvs7
         tYSIvpE0siDjnU2a9mKpTO2lsYvjN2sjoFvCNabZP+RsM9lZj4Z3ZnyJz4s8h6hsUm0e
         vEvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gMkMBDYn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e89b3957si118914546d6.166.2024.12.10.10.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gMkMBDYn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4ur-0005FH-F3; Tue, 10 Dec 2024 13:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4up-0005En-2j
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:24:59 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4un-00045j-LX
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:24:58 -0500
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-467745731fdso9394541cf.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733855096; x=1734459896; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=avG0maLTivqn17JPLerqmYoayLajjpceisSK0FKqNyc=;
 b=gMkMBDYn1aeIp3ssqlTg3vZxp985ySye2FkfyMWtU5brwIvaqLBtBPg2/7Phs2aZjp
 naqv+evsJ8q7UoYrW1Nag+U1gVde2jRIigRuSQur4NN3eN2a7K4rxHbXIvP3V8S+vxmb
 dqs04+BJTW5sL4jGyU7iTCj52l5Kvm+dwxYDV1wyuvJ51+8mFNDxvmvjBNzZHQr101og
 7VB1CEVMJgdGf5dc4AgndwW+L78Aqc56sJmtwa2Or6dm4/r6dh3/zbaTC5nwNLNnxo31
 4FDuBhu2EfWO3pBxcQycSwANGAx18HZz5VoXqIsHQk9/f5QeGl7RLqHejeZkwp/9ccdN
 8czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733855096; x=1734459896;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=avG0maLTivqn17JPLerqmYoayLajjpceisSK0FKqNyc=;
 b=bdAbg5HqiAhC5xdt+yyh+tYo9CTfjKdDiRhE/jNRRoDvjjFsl95SjeCzIQ082kA05E
 eUfRqybX7RTyk1Xs1wNuy3+d1f1I3aEtkEH+RpVgI5pdxK3HEUgM9F+xW/oi/+VK6WO0
 JVZBNIPk1Jlqh/nEfwqyopYjLX0AFBetUog2Vcxnh6+Np4lSinT9N32Lv56bP1n7GIb8
 7KiR3tW7f09wbStUa7q2cWSES6PdmS5GFrWvqLzBUS1N6g+CSK8P3vD8Ptfbatx+VVBw
 JjuOpf8Pn1I1OxKAvUil2Ih4aK+tdgiUjX8fjDKfqvHQZV3Do6pcXImkU/05yGzvVgZZ
 4PVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFzGuOpxuX0+6fXFa+fbT7y+Qs2Lo5K0dTvNuYiVHS3ws2+IgbBvRBERYH18tvT5VcwIoQzEP+HA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9CKAEeE4uDjnzphDKuvKF+U33HKsUYYGT+60aN1rDW/QMJw9c
 mXWwsyLa83XG7J2RTjo9FfgqA/vwNx0aoHUPrgMdT9ZxcEsKEwJAYWkuBmRLBdQ=
X-Gm-Gg: ASbGncvkJg17upDq9YaacX+2rocc5BbQUfevPOXq6lZWC0KzjjawdodpKtj5lkgXdev
 IOwKDuupm0kGrobOT+GjWmcl05340GCIKpXorHMRPG0cU2g7AeBveyrmT8NyAo2yyfn/NC9h1dv
 1ahE02UBJU9zBzM6DmUWQBg3pIVqUTWvQ+0GkmnRzCSfmrYAi3lDitWZ4uysuN6kz2iyab0pXH9
 ObBC/19zbnSAm0yjbwSWVZd7gpDzbcTkHxp4tJtHyOc8arXOLjn8C1yeXIoQFIkloyDLI4=
X-Received: by 2002:ac8:588d:0:b0:467:65d4:7e07 with SMTP id
 d75a77b69052e-46765d47f21mr129898321cf.53.1733855096522; 
 Tue, 10 Dec 2024 10:24:56 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4674360170fsm42879371cf.0.2024.12.10.10.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:24:56 -0800 (PST)
Message-ID: <d766b2d2-de38-480f-9a66-1ef20e929a3c@linaro.org>
Date: Tue, 10 Dec 2024 12:24:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] target/arm: Simplify condition for
 tlbi_el2_cp_reginfo[]
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-11-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
X-TUID: YCV9L38P5Z0e

On 12/10/24 10:04, Peter Maydell wrote:
> We currently register the tlbi_el2_cp_reginfo[] TLBI insns if EL2 is
> implemented, or if EL3 and v8 is implemented.  This is a copy of the
> logic used for el2_cp_reginfo[], but for the specific case of the
> TLBI insns we can simplify it.  This is because we do not need the
> "if EL2 does not exist but EL3 does then EL2 registers should exist
> and be RAZ/WI" handling here: all our cpregs are for instructions,
> which UNDEF when EL3 exists and EL2 does not.
> 
> Simplify the condition down to just "if EL2 exists".
> This is not a behaviour change because:
>   * for AArch64 insns we marked them with ARM_CP_EL3_NO_EL2_UNDEF,
>     which meant that define_arm_cp_regs() would ignore them if
>     EL2 wasn't present
>   * for AArch32 insns, the .access = PL2_W meant that if EL2
>     was not present the only way to get at them was from AArch32
>     EL3; but we have no CPUs which have ARM_FEATURE_V8 but
>     start in AArch32
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
