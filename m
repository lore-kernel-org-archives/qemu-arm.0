Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5360652ejb;
        Wed, 22 Mar 2023 07:33:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set+69I+rM21ZBzwNLE74KCYF+j62M9uduysnonV8PCj0T9kH/emwWq3VL54P1xqB/dGiFXxD
X-Received: by 2002:ac8:5b81:0:b0:3b9:a5d8:2c50 with SMTP id a1-20020ac85b81000000b003b9a5d82c50mr7024074qta.38.1679495598683;
        Wed, 22 Mar 2023 07:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679495598; cv=none;
        d=google.com; s=arc-20160816;
        b=QJCmvZeckTgpbN/pJzSuVxXet2rDozXkbSjKu90+gyz6KjYmByum62zH5rOeNLhDE1
         Pun7jQSgPw5y7WqdrDGTGJnLODfiDAOoCPUNeIePS0dXyk51CuLywmy3bR+J80wnz2Dr
         T98iQ5xI85x9E+FmU6oqF6Mz7MKU0zd1OODWIrEgIk3dMKhjW0TfL88Q/WmM4y22itBC
         7EEKJ6m0faRf1bnyquKGWXoqRoRPJ/VqfTd3K/dAZTtbAefrMvBB2/408jRwETFzvq11
         f95yfpCNwTZgglYJaVOQl6NHNLr28Pc8Uba0wl0Tb20oreof3ZKd4WVu1ie0mjGi0UdM
         SBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9ERdb2t14SOiP1f9GdEs1QAlU1vmu0yOt5IRdI7LPFw=;
        b=QsaOe2fqhie7CbPyTBkaFWrGoHCUBLGWtLhKe/ISmzta1SxkHREKjyEjaMa1/XqxRm
         ftgXceeEtvVZJ7swl75qm6s9hYYoMDL/P9rM80LEAcXVluuc9NjWiP++QBPH/Uv0diCU
         deiUq8f+7kYa8yRsMC+cJ1WsDUMRsS93aLKEFY/XrvkdHkiClxuJKQAYEvoGndLX2/Br
         Ks7/Fclt4md01NX5uI/yIvqEfQKSqklKBkCsBEWGe2JAWW3cQfgsAKsBygvYIMOuouSL
         mUVn/Sj6octfRAjfQvNX8Rn0Ygw2+6x8UHnDtWbARs2KC9HNzGFC7mM0ne1b9PdWgPOy
         uUZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FvTBPHYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05622a14d400b003b69dd120b1si6982508qtx.312.2023.03.22.07.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 07:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FvTBPHYh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pezWD-0007cG-Rh; Wed, 22 Mar 2023 10:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezWA-0007ae-DC
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 10:32:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezW6-0003rT-7p
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 10:32:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so11650620wmq.2
 for <qemu-arm@nongnu.org>; Wed, 22 Mar 2023 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ERdb2t14SOiP1f9GdEs1QAlU1vmu0yOt5IRdI7LPFw=;
 b=FvTBPHYhJikg2ysfGiH6RBEVy1bYvc/Jh/T7Clqm7GfztgJNhCju81rNQEecOPoBG9
 C5Dz/8jyT1+TmYNiFUzXG1w/TDRs23RyuM4Ld9r4gDRu/6N2Xj7vp3w9RTbJF1jwuo9G
 Yqh7uaNI0AN6lKQP/1w8EgM8ijBYTmI8w0SCJairxuPb7VrY+sInEWaYPZ5PQZBowlbE
 kxcqZs5THNw5m93rXz14qU7UOpnP+5ER2GPMkILabk/5fOcnXsMXmkwv9frLVI+hJmsu
 svKRHvEO01nH3lBL6hP2dTkb/R6V1IEVSY71bwUBa+4/y8/ju4qWcjqNp19MH/XDfYlr
 H5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ERdb2t14SOiP1f9GdEs1QAlU1vmu0yOt5IRdI7LPFw=;
 b=VTH/5MxHPYDX+QJLFg0iNAPxuGvvYs6aGMjWLDFzQevg4mQ0f6MnWi3mSt5GCkXKY7
 oPGzrnGHPYtbBJ7ZWyfgwMGrBpTxiV6pSnf8pssN8FvX7rBKbD5gzittpKMH2uHaPRBt
 JWycObP7Ih5cJnuPnbwQXvpio2Coq/QXegdw9Iq2vjILPNmmcH0V0l/EriWxFvMCTXi9
 gjrciBjR/9/4GOKY/NmnuOXJkFsWhjNJtC8Pzaav+XB5CLVJ+6/W+XWZrymsLKt3V1tB
 zXkiSel7MRAdA1tDBNGPCBxd/SxCcrHgrY6pcoG/KZoPzD+ybWYnjMcDHjUFio2Yw32h
 GbLg==
X-Gm-Message-State: AO0yUKVNEd1uHCXjqIiSwtqmfpM0VIY1jwJCsZ9Kt3H7132DDp1bRy0g
 AsJ2ouJApMHmYyu3GtVdo8zz8H/9s1u2THt2xnx9dA==
X-Received: by 2002:a7b:c44b:0:b0:3ed:29d9:56ae with SMTP id
 l11-20020a7bc44b000000b003ed29d956aemr5469997wmi.6.1679495559582; 
 Wed, 22 Mar 2023 07:32:39 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003eda357cfc5sm14789048wmq.43.2023.03.22.07.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:32:39 -0700 (PDT)
Message-ID: <3d67c765-20fc-9ae9-1dfe-753f4ef16263@linaro.org>
Date: Wed, 22 Mar 2023 15:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: DgD62AX1cmOJ

On 22/3/23 15:29, Philippe Mathieu-Daudé wrote:
> Fix when building QEMU configured with --disable-tcg:
> 
>    Undefined symbols for architecture arm64:
>      "_arm_v7m_get_sp_ptr", referenced from:
>          _m_sysreg_get in target_arm_gdbstub.c.o
>      "_arm_v7m_mrs_control", referenced from:
>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>      "_pauth_ptr_mask", referenced from:
>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>    ld: symbol(s) not found for architecture arm64
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)

Beside having the non-TCG configs tested in CI, (I think) we can avoid
such breakage by moving the TCG-specific declarations from
target/arm/internals.h to some target/arm/tcg/tcg-internals.h header.
(target/arm/internals.h is 1400+ LoC anyway). Worth it?
