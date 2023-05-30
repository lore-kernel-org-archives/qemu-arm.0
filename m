Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2136275ejb;
        Tue, 30 May 2023 05:27:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64agtZQcyw5/B+YxP3gY2lzm28UcI0AayAHpsBLrLMQcNtAmbz3E5HLvzatcR3x8fQPHCH
X-Received: by 2002:a05:620a:3995:b0:75b:23a0:e7b3 with SMTP id ro21-20020a05620a399500b0075b23a0e7b3mr1537766qkn.20.1685449623441;
        Tue, 30 May 2023 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449623; cv=none;
        d=google.com; s=arc-20160816;
        b=QIuYBONzkTE5vVzCFRX5fMITh/UpbIDT4Zj+ecl78YltBA+6ZkTaLrpxD9Cxdng4ey
         noa/6pZa4pJQSGi8oIX8nq6rTYQEJ7/2TH4VkSCL7DBd9Mr6B+xjCZ/WQpL3601svCdf
         phl0hOzjKVKjSJTlaaxxBZfGtfTVj0p78kjZfqFer8lyrTd+b9EXtNFJ466YmPjro+6F
         tyu5zgpqej1DvN52yi64V7/kLaXUi83LsW8PbsvYa9eLQKZQTaLOAVsjriT6nAzWflqK
         zRSbvjy5MsU1YwvUVo8jJu92RcLIeHHd494OwLQk6wb1HTxxhyWCRaDWMm3VIZcxjQS2
         KRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5eWQJL+mF2LJ72zBTYOzXce0OnrQOtwB9QtQWnw1fOc=;
        b=P4mEQB/cKj6BI5gdEpWWg72X77AfLh7HC0ezUOeLbwdMiFXq+N9Ha7KvxxeGBfA/1p
         Aqq33WhLy0KGBV57KKLJOMcOeM8JG1Nq4Spd/23+A1T6/s6LjHlHpe8VXg8EIygnI0oA
         RwytizCZwBAxs6KKT02XfvhIe0V/PpUk8Mb/tm00f6RjVPRjoq3w/D7mY42Tn7yUS+ar
         1Sc2miHRHE4EY3pdsIDrufIZ3APLpuuBLIpzmn7rbXN5u0QzrsziNmbBoFvXXSi7/hew
         8uOLuehYp0Un4wjlZOHyQ0XxOYzXCHqlcEcnaOIUGQZM5MQnSFjiLdYi9kHmJRoQD93s
         Pmfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOoTRS6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a13e300b0075947ef3253si6260044qkl.166.2023.05.30.05.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOoTRS6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yR1-00007G-Fk; Tue, 30 May 2023 08:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yR0-00006a-Mt
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:26:42 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yQz-0000JR-76
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:26:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51492ae66a4so4512090a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449599; x=1688041599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5eWQJL+mF2LJ72zBTYOzXce0OnrQOtwB9QtQWnw1fOc=;
 b=HOoTRS6KLBjeXHXp7wtlOKidVVqEpMTfSExe0kjzlEd2W3r0YYRBvd2uFyU9PQZI55
 Ingt6KFt+oAbU/y0uzqhukK4LwQOUN9d1g+10cHB9jrNgur1qigCBWHVil2tj4tL8rpr
 +odHGUAi9xeQFHbfZKIv0spWpvmm16TDLqXnWTLroZvkOvd9PaCVphq2CyZFF8pv2njw
 nkt4E44ZwaZ6c1cKqoyftqM+bKr3CBRr2ILbeV7PiQvcjUOLmNr4qVy7qw7P9Zjtqisi
 19SkLKZILmS5l2y4JtzUkorg9pwhIFVoT6fxU5WeVNdoZ6eDfi+VcPBmz8dtfZmGZqaC
 gTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449599; x=1688041599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5eWQJL+mF2LJ72zBTYOzXce0OnrQOtwB9QtQWnw1fOc=;
 b=Th+G0hlXJUHUo6co7laMwJbkinmVyVVCZBTVMQGRLXwuXapdG6qc6kHNfXvp2EW3Ds
 6qjE2lkX8/GEqnFoCYa1bSJzAC2dE3WYoB44TGR3glBxW8cSx0sjVza78eehKHBW/x4j
 ZVqqYIeRUcBNsHTgT2iP9V1rSAqsb/+lgtZa4Pt8MjpEQBCQp5ENiLAmkIZV92e+qsdZ
 7OFvTzCVWcTCz041rL6nGS0mHrPVq3J62t2pfK4ZlBBSGP6xmhZWpydiF5CesxU+KTde
 +Sn8szqLLQCNEqSiGVQoRaKMHAoWCcqeQ6LSJeRh9lVLu7xxQuVv205LGJgrh1rA8V8/
 1yYQ==
X-Gm-Message-State: AC+VfDxCrHiR/8S5Pb7VIpa1y0/frTxGK8u4e2seeVxk7SsUlBccttzK
 DJHYnXnKeRjxr1ZHtxc/+F31ubpqEVbIBAlPDb0S8k9vtfPLaUoo
X-Received: by 2002:a05:6402:b0a:b0:514:98c8:9d7c with SMTP id
 bm10-20020a0564020b0a00b0051498c89d7cmr1475963edb.4.1685449599300; Tue, 30
 May 2023 05:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR12MB63096EDD683DE70EBC472E97AC7C9@DS7PR12MB6309.namprd12.prod.outlook.com>
 <DS7PR12MB63098739F9B61D53062B74F6AC7C9@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB63098739F9B61D53062B74F6AC7C9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 13:26:28 +0100
Message-ID: <CAFEAcA_QEnUHEcPe8VwGatgrdOGTXq_kcA3CHWaSBeGTa4120Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] target/arm: allow DC CVA[D]P in user mode emulation
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9lDW1dz8/v4o

On Fri, 19 May 2023 at 22:55, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> DC CVAP and DC CVADP instructions can be executed in EL0 on Linux,
> either directly when SCTLR_EL1.UCI == 1 or emulated by the kernel (see
> user_cache_maint_handler() in arch/arm64/kernel/traps.c).
>
> This patch enables execution of the two instructions in user mode
> emulation.
>
> Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
