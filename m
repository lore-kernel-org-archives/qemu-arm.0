Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2334242lff;
        Mon, 14 Jun 2021 14:30:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt1+qPa612oTUn5B5jXl3DI+yoWSi3SjWHCNVDmvqo7IC7vX9IZifPTGURkL/6fI3T8dSI
X-Received: by 2002:adf:f805:: with SMTP id s5mr20494263wrp.231.1623706258841;
        Mon, 14 Jun 2021 14:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623706258; cv=none;
        d=google.com; s=arc-20160816;
        b=RSZrWT/FfJU0CI3FVchKVf6E7IThLKY82HrPK6x+eBXaN4Wa+P9WTw7Px32KQGuZF8
         ZJQ/7o5uVeJSomJyuBIbLDQk+40QSMBwrraZxReCRq1tPpsxO20Sp/G89j+V2jzwsLfX
         Gk/D4/hVWG/ArwBX4D67kOjbQxtS8l/+ZRlVX8/1n6yLcVqaKQXNuD9Rrc2M1lgY0xU0
         ZCHg42VwShrWi+lA21hvVkwYWOY1ttb5v7BV1SNIDXJS1X+9LOdVx8uENWHECVawA1ch
         hlVB1xr7WU074+Puow/lVvnDW1w3a4kJTPUSNOhiqTQbJoZnWOCcOKmW/GTXCXo3lGLm
         6/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r4uJWsLbYvQv47EHrT2fkkf4OQxSCE0zCDoH+6SbtAk=;
        b=tU4yk/cyt1+NKr/0bRaxIOBQPxmjqscw8aHBWTerlwzX38o7Vhjerosd4r9jDyIGm2
         JRvZK22YyZqjHO4HIyNYTsBYFQIx30VVUvFcZFd8gN71D3YNA6GMvQrERE8Qvh6enqpB
         oHHcMr3c45Jnu2JlXpj6yzeCFLIWCuf4rku7bK84UsBFxqs2w9xWx2pgF8zoWU//hwQI
         yNk3reT4bTzB4sT9taT4wSrsf/8icSqeOPJadcPkK2oc6zmUveCRbG1dI1Rv7qh/VIk/
         i49oECP8DyVZ5HmttVaklPckYwcUY3dx8gF1997FdU1cZYD8H8P0d3SOCkpxGk2t9Kzp
         RDXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mMhRgM85;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si16624376wrz.442.2021.06.14.14.30.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 14:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mMhRgM85;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsuAc-0003Ut-1N
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 17:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuAT-0003UH-Bk
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:30:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuAP-0004NT-Bi
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:30:48 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so173625pjn.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r4uJWsLbYvQv47EHrT2fkkf4OQxSCE0zCDoH+6SbtAk=;
 b=mMhRgM85hswayxKBUnsKaFfYB2sr+6PIlxnBMLVmdPcoa9X7EfYSvVZyVzwSpWe/2Y
 gsWkOD646Z8P688r4jYtTUofuRyRZTjn/BxZVfjRmVys0xbAqFsGFoOXHdHXmysG7MFi
 z9+rgKxckDOrZ8o8CRy1CtE91OrZsmqP5lVoVv1sBj02sLwlHW/9GUn6xYheLDUUBY0Z
 RcxSuNUF8g2NIct8AZWJCIWv5R0ofpiYW4miv5uFEBxgU3t7xztqXz3qYIsh79wlU5Om
 L2rLz8WcAKVt2Z3OFIkpGQOcjpHM/oKjNVtICrz+wfxVXKawHrJenTqoARo+4xYAdFzx
 6bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4uJWsLbYvQv47EHrT2fkkf4OQxSCE0zCDoH+6SbtAk=;
 b=k//iBbyW75O/Hcq9Kq4mPimrDK/zbJT7pPsZXcybj9TOGm8oRC6xsvjbX6Wi1GspJv
 0Xe2cEU3mO6fi3y9p7gegJk2GcZCcZj6AsdQZKdpLQfbsYvBOHCSuLh+pFVNA66i+cVk
 J0RUtxfk+CXQngpYjLDMFCqXTgbmsThgK8Mdn+DdaCDa4P180tRssXbMcDmE6Ns8/5eV
 tEg5fr7d9gu0keg3M+zY5zrjJnAMt62LJOPUAPwZY/oK1ptQrQ8YKo7UV7JWSVs1Gsad
 cj+OypM6VuSZYcRbtDDQqmApjNfJRWV5MiCL50HOUdHOP9cJKRym1u/FgrLbOKKIFN9S
 8vfQ==
X-Gm-Message-State: AOAM533kIjKO180++DFsnSSSB8fQyeSxzMBogpoLHd2WoAdjAE2PVjuJ
 /nRwav2RiT4qM94P5GAxSlohbQ==
X-Received: by 2002:a17:902:e986:b029:110:d7c6:add8 with SMTP id
 f6-20020a170902e986b0290110d7c6add8mr1121363plb.68.1623706243749; 
 Mon, 14 Jun 2021 14:30:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z22sm14002543pfa.157.2021.06.14.14.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:30:43 -0700 (PDT)
Subject: Re: [PATCH v2 35/57] target/arm: Implement MVE VADD (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d54e7ab4-c80f-14ef-2143-455cea15e3be@linaro.org>
Date: Mon, 14 Jun 2021 14:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
X-TUID: FW77A8/qcJ+C

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the scalar form of the MVE VADD insn. This takes the
> scalar operand from a general purpose register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
