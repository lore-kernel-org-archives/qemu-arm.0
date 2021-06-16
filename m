Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp604880lff;
        Wed, 16 Jun 2021 11:39:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyON/B8PXZ6Zqldk483XL06STz1ZxPMt9I37QQCulpCMJKN4EGvW6wSWyIPuwOcmA/ype3p
X-Received: by 2002:a7b:c106:: with SMTP id w6mr433167wmi.75.1623868798190;
        Wed, 16 Jun 2021 11:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623868798; cv=none;
        d=google.com; s=arc-20160816;
        b=Nmuet7MRYM4u5zL/15Vv+EEiaRu+DUJRu3u8kLDGCR9DR8/kEVDkyE/1af9dbN+kbL
         ZPLXh/IR3OksiEO3oqx64+YHtdqcN4oda1mmMOcy55BS5hkSD0QL2ecc5QFsrbwuAmky
         tOfO73us9oSsqmn/y0h6q7wTGf3coBI1oAPihdN0sAzsZeQ+Kq6W5gfOddgLnAQS8NCi
         Wuo7Nikfw0xSfSEi/njbVqvDlQUcDL8aTRQ5SWbxAXlQdxLBUrcrIi3mClt9LCcXR5vc
         ikxakhOPUU+egR9zAB/W5JLB6LOghqevCfNeLtsA4bhf2qzNO91VaCLZvC/XYQylRg+p
         O7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zMaiiccTbtjzTbbliF2o9jvv+qDmqqI6h7RffTLzOSI=;
        b=u3NZ9GtIwPQv5Ir+j34vFMUo4jcnQ7O7Hpr97Ac7F6ZREWP7G6qAPgiHHGdTL4yFBu
         R6zTe/UYdSK+UFly4qvriAiUI3c8kZVzQy5PnvmA2nf/biq7/G89ifdncqny6ujF/QAs
         FtnqWJiceREUFoXGG5ORnelz6hQi7v37k4Z6Kpreq3SYHAZbY201Lk13YyBLAm4FmjOV
         DGU0ECIBY4iSb9j0FFGXIq9f5ePR3vNk1chjyNKUc/JQb8+OmeNvrCWY0OBbM1cgyY5j
         gCMtBMO4ldkTi5E4zNEKVqIzut/jjM67D4Ez4fbF2ujRvBbuNTQkC8OpNwnVwymDdq0l
         SQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejkbfEwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i97si3555818wri.249.2021.06.16.11.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejkbfEwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaSD-000809-Bp
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRt-0007w9-IE
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:39:37 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRq-0002FS-9I
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:39:37 -0400
Received: by mail-pf1-x436.google.com with SMTP id x73so2896861pfc.8
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zMaiiccTbtjzTbbliF2o9jvv+qDmqqI6h7RffTLzOSI=;
 b=ejkbfEwdeFFqqwZM020nNEnG4v56T94n5oGDZtCdZZcgJytUyIAp3de/wLwdlQDzS5
 9Upc1GxyNcfoNpQF5boJK7ICothbYPK2t7GnQGRpAKPht9e6fFPRIABf+bjVr2vXwFPB
 v4TsY6sSHgrxfLseqvoiyMPI7LPdyIcd+9+Fp/ZDW47OAkN0nP0gXvhHkX3Yt5AMEIf+
 cFMq+z9GILyegH3WnyrHn9BwhyefDzloLdRPCSUZnq36JXJrYF3Lcff22O5Qddf/omWT
 U6qq8MdLJwRGaaPSc1mFV1xQ2u5S9tha1CS/3g07Lff6niTd4keote+sQwpmv/qrit9k
 hU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zMaiiccTbtjzTbbliF2o9jvv+qDmqqI6h7RffTLzOSI=;
 b=XAG5e+VMj+fNIgYg4Ei/2C2LsyKkh9WlQw47bMtcIx2+zQjJxKIkV7cvxHFfR7sJYI
 wQz9UoaqrTVL0qSGZfVJzyCIsfnFKYCQETIU4MYUy81754aekRrwj4fG/EJx8T67WEiw
 UDHl7wm4IqAj4jlK21y6EoC+JDQayR89240HLIoGH8X2g8OBGoFuaZ24RO6Sm7QPqaUM
 zaGKMh0vvFq8NfyAw/6plUmrYGgTK84RLkC3ILo6CVOa0hbeGqzP234pYIh7tmpBtGab
 ec997G3AxmTkmgFwo8pX9pGz8h1fEVl/aicSCuD2gwweocgZk9OQMv9hXrdYvfvoqcTR
 FnTQ==
X-Gm-Message-State: AOAM53137U5WA3D+eJZhFbuU1zkm2LIr3fqDa3M+MhxzBcYxkxZMeZHV
 eQ258wg2VmnBx9mbiH0r2ma9BA==
X-Received: by 2002:a65:48c5:: with SMTP id o5mr955708pgs.397.1623868773054;
 Wed, 16 Jun 2021 11:39:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h1sm6047720pji.14.2021.06.16.11.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:39:32 -0700 (PDT)
Subject: Re: [PATCH v3 03/13] hw/display/sm501: Simplify sm501_i2c_write()
 logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f236137f-c067-09b3-8a0f-e05b6cf005d5@linaro.org>
Date: Wed, 16 Jun 2021 11:39:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BGTC0Z9S4dAg

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/display/sm501.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
