Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp597409lfq;
        Sat, 9 Apr 2022 11:25:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxha6JENzH0HHfs+D2YckAiNe5nutUWHPwNN9qbqYq2sOCRfGD8O0elk12G1f2iHELAlpg
X-Received: by 2002:ac8:454b:0:b0:2ed:13fa:c17d with SMTP id z11-20020ac8454b000000b002ed13fac17dmr1248362qtn.21.1649528757172;
        Sat, 09 Apr 2022 11:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649528757; cv=none;
        d=google.com; s=arc-20160816;
        b=ppVmlydcPxhYblXawPcsTeWU5xQATwieYQr3ArEhHPy6VNmGJtvguOPGsy8s5yZ9gs
         CkYpLn53HNeJps8SzIB9i58ztb6WJu7GbMAt776bziuWrQNR0eotRU6R+snTO/jQilJd
         JoKdANohafuw9r/fqd8ta0WWMLdN698i0QmxJAuOQB8mqPAowYfEmoMyIBji7ZP54rUx
         8SfbkYoc+PBZFPdjEwtafOMPpzCI7vev2UlBBALoFBVWPD+5Z4Yei66EOWETQ1+XTvQx
         Pxbp7kYmk8l5kKDaNnje4nm5/141qG7gR2lDh1s27RVNYQKDOMpGMlIB7sqFxcTGT4Br
         lYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Xp0Ly26bosN1lAJcogGYMHrrlju0hVVbjd4oFqwAeh4=;
        b=Uom9YzG0bViTk1aUz7kWtz8COn4FdGwj+pxUUSFlYNlIqi8FYDZV76AuJ2OVNGW8Wh
         ED7F8dBf08myj0frDKT32QT+ZKYcOcrOKk1nDMr7q9MsljaSBbstQc6ncqNFkY5Bw6+3
         //PfkcRSj2kK8mG1NQFGCoCSzZO2U7phRJyt5gB0s621qY5+YyQaX0oiZ8qidA4UTeJh
         x7vG8S8VkVgRzT+l6+i0KZDplQn8nTH3+6k9STrZ6V9MaiZM4ZCI7vVhuoL8gcIM2bWW
         dSNFhSGiW5ehKtwNg6XXu/rydXVSbBPvaZG3pFLP2mO8do9daGLDQ4XsEB0iLZhWWJVC
         3/Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4SSOQW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv13-20020ad45ced000000b004442c2aa20csi1841456qvb.494.2022.04.09.11.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4SSOQW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFmW-0006zN-Lo
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFmM-0006wx-CW
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:25:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFmK-0001JW-SB
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:25:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q36-20020a17090a17a700b001cb57a8da1cso2445994pja.0
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xp0Ly26bosN1lAJcogGYMHrrlju0hVVbjd4oFqwAeh4=;
 b=S4SSOQW4DI3am01qVtmTi1Z+kKAqFSm0vQyQotB9CpnvvAS4qESE1jKJTLumfvnqST
 Vne+DdHgbDYCByemSgiL33ncLrcWhfmrXTYlwHVOpEr9GNMAeSWeNvDSGH9iZoixCQvt
 WeC/cZI/u9MrcY9wqHY6rp90fVUhvH7U5exGtIOByu2l/knLbiBpuxOu5MiC9sCBiFVP
 jBVzYMR6uz9znCcFTeEXq4rTjB69TK7Dy4xZsHzK9k0EdOyvAmxxliocgcxVDfXNDAIZ
 hjit7xD19ToEH3YTrlGCRM7/ZXiolZqoXRV4SuldKzDdpQfgWlGiovsQNL9XNj13qpPK
 2zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xp0Ly26bosN1lAJcogGYMHrrlju0hVVbjd4oFqwAeh4=;
 b=BMmUMpvgIzCvpx9T0gz68hvSpUoFN8si3xpaYbN5FT1gEA91k87ButK2NMCpjJ4Nbn
 Bb3Z/F45RkazDImxCqpMoXMbydFz3gKjPR7Qk1tsDidljAiTGDBTr8v/zT0oIhprr++e
 LgBWCzZpAb2lPNA4pWaYXjw4P6fNfuVzgTe2RMYYoJ1JkDvkt+NXtnGP+dR4RpJcGmIB
 0PawZeBCuXV/L6IDsrmjSbujdAFrt9jzjNDnR5XHw62NSYJKLQ2SPYehNcJizSTeTPlT
 ZCNAMbfCrYvl2wmj5gu1HQK3Js+aN0FiqHUpL6Pa9Z/+xLqF4QQsBDnnVt6dDR4XAdbG
 CdFw==
X-Gm-Message-State: AOAM531quCWMOZEXPj9KFf7IGP5vERliiYE208tib+wSnHtoDERCLmDM
 pj7uVrtpigngEarcy21aanwQglQI+MoHdQ==
X-Received: by 2002:a17:90b:38cf:b0:1c9:c3e3:817 with SMTP id
 nn15-20020a17090b38cf00b001c9c3e30817mr28522572pjb.73.1649528743460; 
 Sat, 09 Apr 2022 11:25:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 129-20020a621687000000b0050579d13b1csm6200209pfw.137.2022.04.09.11.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:25:43 -0700 (PDT)
Message-ID: <caa2d196-4ae6-63ed-fe40-11afc777f503@linaro.org>
Date: Sat, 9 Apr 2022 11:25:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/41] hw/intc/arm_gicv3_its: Implement VSYNC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /0i+hb9UwKy0

On 4/8/22 07:15, Peter Maydell wrote:
> The VSYNC command forces the ITS to synchronize all outstanding ITS
> operations for the specified vPEID, so that subsequent writse to

writes.


r~
