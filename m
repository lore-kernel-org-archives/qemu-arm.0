Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4748368ejc;
        Mon, 6 Mar 2023 07:03:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+4xsSMF5WYaMF8YUnAjyWfCOvjb6rBT7i/yU3Ne0IT9lNmHQ4Kq+5rxsP8z2QuPg7HFYoi
X-Received: by 2002:a05:6214:2021:b0:53b:aa54:4eea with SMTP id 1-20020a056214202100b0053baa544eeamr19910084qvf.20.1678114994914;
        Mon, 06 Mar 2023 07:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678114994; cv=none;
        d=google.com; s=arc-20160816;
        b=SOCEMywdPNwu1gDNY8ayPzKXirbz2K0Jj8T0I60PBpZits4jaVw4/b61XnABj+adm4
         Wl0BMYK50kaZQbPmAwELjlkbsnUYka26lqTw6ruemO+w1p2ypSB0mTWV2F2Fjjx4CjCN
         v8URtmjuvO+6k4EcsSVHz1EwUngs09mqijdiZu2jNEfA+KHvAfblSXD0D2ETME6ZfZ54
         USDLggOyZnPM0nNOCNc27mpjamd5mBf6nkek9wyqLLxSTicZalqAL0RCBJGGrkqp14af
         5AjxlJepxeouZmw3UQxwTbN7u9/ryhitEMvSgy6bdGfz0HWCnrNjxeuwDVLFA/hX4Hrf
         Oc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
        b=swU7eGh8oPBSWaVeQOh4hIFAf6SieyckHI0g+Q+WM6hAnCPh2SXgcBSYpDH7Pq7VWd
         enqqys2v2KL+mc8EpnMF+PMDOaklOrQ5g/ZVAzVd5DYMqcdCLmvEq30hQq+CLmb0roXo
         8aFNPCdr1ApI0cS5kc/nXgv7V+KhsAl2EGDG09d8hymgkwJQTIr1pba0s6S/EZw4RiPM
         xxi0HugRJ1BedmbXb6ElZ6CLroVkUAvLvbmV/DcPwW6sR8UGUDBnEKJeeUzqb90PEs0U
         W7AzFqY7ZHVPX3p69KXKj7fec6oZdl2GCCe25eF2JTF9WE6Uf9hLMPlIi7u1LdQweFft
         HMkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ud3q0WhC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a0cdf8d000000b0058c2a1b2b7esi1870775qvl.178.2023.03.06.07.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:03:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ud3q0WhC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCLs-00049V-MT; Mon, 06 Mar 2023 10:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLk-0003m5-DY
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:02:09 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLi-0003as-Pu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:02:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso5363860wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
 b=Ud3q0WhCG5JQJTCggjbCHJCzQM2JRo2XpFn7Gqqpk1xxc7jznfj0aw7JyZz+kZm1uV
 eoZv071PxcFJE/Ow5LooWhb1cAJwK9Qb+QsOl+ZnmtnGkRD2ICITvtUAGYquouklizGK
 g5J4dTkjsiFsDDWOSirErW779V2W9AuQBbcAI5a5wx+kPks5nW53wtTvS5JoW9c5h3s7
 eSuKzV+As8QVVSWRoAtQf3VsUBwYDLvByMLppPQrWdsnoune2Guwe4Zd3xDkoFAEQLwi
 PvEZX7EbXHmUnla6UQJCUcFiNYDsTiCe7ceLA5OCNhjj6bn3T/I2QeGwYtUCPRHRFzGK
 EFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
 b=BRXUZtqqDGY6RNV7QNYLKBNaMMdOILJAJGcLie/T9g0MQybzRmhVzenHIsC8skT8gi
 lsc/u+hgBvFkJ8e2dpvCnB4LvGVQZmRBNjjQ2sBWx3ks7NBLRa+m+Q/9ODa2QDQB9nr3
 w3dNA4+DOhN37gKx7npYh1frdTFsQ5AdtQe8rM1jcnHMsTfDVyf1hHeS+eFyc/uIdSrl
 WSqa3hBQSQieuSHLGbnUO8cwYwFZDoVlFutBB/1q71w5FgeDw3IhUM6RixE4WflVulrf
 dZP1QiWpSXchkQbikXd90Ll1dFmfAcgtdnOn3NngH4gQMVwO3e3gMP5L35aqJY5hjCOk
 0jeA==
X-Gm-Message-State: AO0yUKVzcE6ZFI/bDh1c0zx1DYLQBlE5HoecrNrHwCMFumVc4Rcza9wk
 pizMbXQBN9CpMrFCrMVbQIgn6w==
X-Received: by 2002:a05:600c:4593:b0:3dc:4313:fd1e with SMTP id
 r19-20020a05600c459300b003dc4313fd1emr8788068wmo.34.1678114921653; 
 Mon, 06 Mar 2023 07:02:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm16365863wms.19.2023.03.06.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:02:01 -0800 (PST)
Message-ID: <f8647ca9-1fc1-f45b-5f85-dc58bde9500c@linaro.org>
Date: Mon, 6 Mar 2023 16:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-65-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-65-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eEyZcRTWw9HE

On 27/2/23 06:42, Richard Henderson wrote:
> Use addi on the addition side and tcg_constant_i32 on the other.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


