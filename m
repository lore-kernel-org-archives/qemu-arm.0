Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp2338879qvk;
        Fri, 4 Sep 2020 08:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYmmn4QNu1ooB3VgoCoxfSaDxQiG+FI8k4/y0qG2tnRCnFWsmcdTFdOpDsXtwFtZRRJ8qe
X-Received: by 2002:a25:404b:: with SMTP id n72mr1955086yba.523.1599234955244;
        Fri, 04 Sep 2020 08:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599234955; cv=none;
        d=google.com; s=arc-20160816;
        b=a3EW5F9rIEF1v1hH/HZuzi1IuLTYPyjluAebKLRBdAZ9kyutymVWqTfpuHrk38mR4d
         sywSh40v75fmF/SYAi1znWnGFHr9GtLXZQCgwunCeIE20cwT3m6prh4wIBPjPTCYAzTL
         idKyr7gvE552MlM1609n9euH13XD0iuHxAwzt81wPJ0UTx2lifsycMxHRc6TRXy4jxbQ
         LbZZ1lx/kSiTtR6qMRW0TD5TUUVyDCdY/34R5/L6u7BPFGKO1VLwY5irAUZNwJW3z+40
         hG1gJOf2dJry1Gpbt/Jzwpi1Fyc71NT8ULxY8pgBgq1T+rC/moNs8NzekmYDtOtNwB2j
         /oTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=THJZW21FF74Vq1VvI0l1acAlfjvztbbRt1pw9mIYjeE=;
        b=bTx50t0crH1BjxNL0kThkkmXhV8QCCE1q97o1vh0lxWbgxpnW111qdzWNXRC9UUG5q
         AfRWLBZ/KszzlhlDgCwe8yKCApVtUJzVeWOiHkvv0PBJEVUDPBtw9iwHDiBt9vwKBpnj
         dwjBP7ckCqRg+A/slIQ7Q+YuvfmyFI+j3yncqf2JWAMjC5jcaQl+Uu7kxEPp/bxv/zQr
         jrXCpLZjywp+tIdrhQJqOWNNb4B9MzOz8dopVbWRXrrjSpg7ND7ffSYovkNKISWI0HAU
         fqUnHjvD80rvjDdTrD5xtTU4Gwab7+Gge/gi3PkiwTDjMIybGUGF87YxVm73oGZsepr/
         EZog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmY+x1TI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w67si6289899ybc.303.2020.09.04.08.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 08:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmY+x1TI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEE4A-0003wO-Kd
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 11:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEDyk-00027i-UM
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:50:18 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:34078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kEDyi-0008Qe-Mw
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 11:50:18 -0400
Received: by mail-pj1-x1041.google.com with SMTP id n3so5354237pjq.1
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=THJZW21FF74Vq1VvI0l1acAlfjvztbbRt1pw9mIYjeE=;
 b=KmY+x1TI1ccqeNhLDsK8mrDrmpiIE8Lk7BgM+apCzHbapjYs9UXkw3EwnK7NsqjIiO
 AVAgbSmBQcSvJDQocs13Bz9/OtTHOtrs9jrZpp6/GS2AQ4ov00dz3/fAk/lfjZooQmzW
 KCWJpbPY1fDm5gQjbqfASsraFGo7x5stWFJrzfAErZZi7y+ZuXKzfRsDQp65cPlZdLrA
 EzdSn0S+Spx3D29BshuZxPbDOg2QuuoMLRkV/Dp5VS4ZPv/jWypD2Osz5my7wn4hSmVA
 iaYbTwf59+l8r8qMiHUf1zmR9Vfpqur7FaPdE7Olgy3sq14s+IGd7TZiVoycoHyuhOnu
 jxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=THJZW21FF74Vq1VvI0l1acAlfjvztbbRt1pw9mIYjeE=;
 b=oBMi8jk2f4h6C5VSEGRL8FAOoDvV8/KCUD2L5vY49S81+QCh2BlX6zPBs3AAtlvTmc
 yxz/6PL4x/6E6lC/SBKkmIhr1KCkeTGJCL13my+d6kun3e1CJiU7gy0TuMGQ4Ch+8NU7
 WA2hCijhzdYBqm+H7BGsZ7sGZzX/oreZ/c78wIyJAqEA6VeMwEF9VrkZ2pUEgI2smW5E
 e1O1IkYswaJ6btGRsSKFZXX70fq7tXs8VxyqM0b69xx2Zb1r6LG7ysCh7QBuUn+WNoRe
 uQiO1+B6F3ZDX0brOk8rAWyhmiNgWOWHrlNTb0ZiE7F5W44wPSlO8DfmnzZDDYhtBCZJ
 ydMw==
X-Gm-Message-State: AOAM530r0VZ3+gPyDpx1kc8aq9wvPaa5eQ606vQiTXfCt3hfrNmXlBXh
 +AJkYoJsqah+cBHK/TdEEO6Idg==
X-Received: by 2002:a17:90a:530c:: with SMTP id
 x12mr7844355pjh.223.1599234614913; 
 Fri, 04 Sep 2020 08:50:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n2sm7149574pfe.208.2020.09.04.08.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 08:50:14 -0700 (PDT)
Subject: Re: [PATCH 0/2] Remove KVM support for 32-bit Arm hosts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200904154156.31943-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8ad0832-8891-6398-7b9e-d844b4f6eaa1@linaro.org>
Date: Fri, 4 Sep 2020 08:50:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154156.31943-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T30Fsm9HCoIr

On 9/4/20 8:41 AM, Peter Maydell wrote:
> Peter Maydell (2):
>   target/arm: Remove KVM support for 32-bit Arm hosts
>   target/arm: Remove no-longer-reachable 32-bit KVM code

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
