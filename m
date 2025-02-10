Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2250136njb;
        Mon, 10 Feb 2025 14:17:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpXl4Hqtzf/4lNeM71FviyeeuDc7mkAl09bLjZHdM3r7gxWOaAAydMc7SA3z8OEhUShin5qINok4e/qQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFd77JxiiwNOWG5syq2kFqfZYDMi/UcPfK1fk++dQ2FdEZ50ucWP2/5WbvWmrQnWz4foT5W
X-Received: by 2002:a05:620a:1990:b0:7b6:cbc6:c87c with SMTP id af79cd13be357-7c047c3803bmr2383454385a.30.1739225843490;
        Mon, 10 Feb 2025 14:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225843; cv=none;
        d=google.com; s=arc-20240605;
        b=I+XBLoP/7Y2KeayIQyP3FXZVTEBBrW2QF/p+WjJvQEo+iS/25aDKQv1Vi6XgMVBFRf
         9p7qY7OmPy8fENMjlA6/i6avHCycq3zHOmY3Q4iauF91PIoEmKqLebjw1AM6rQcQ4AD1
         O8B5wij36HHVPKYpXgma0WFh0q4afpzr/+CL+HnaK6kdiVaWv7O35WJNHfvwq+5kwtFr
         P0M3rpRxIUHqH0vkqJ9jLCmNbumORiDeBVYoeNhIGkr2+VRenZB1JvrcdIIE+fYROSSA
         09+aRkRRVnMXzFq3r5Trl+eSrJl1IuOkDHBu0YWI4lipKEKDmcTGYTD/5JtS/Du4JhJr
         8aAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hxYnmVo73BQmCsNLmzhebDUlsTiyDBQaXiChNep1Lw4=;
        fh=OH1WrSwOMaSYMMeI9xXDBA0le/7tSsJpDQFMdF+lRRA=;
        b=SBdKb+MZBlu6aT6qtEuDlczoJNg/CFstxCtJOBsRf6sTsEp5UCQ2EBgXGABF30n0VL
         nRT4Q5AslsMt6jEnt8IoR+CUHfUSluLMCEgV/atufWNtI7PovZfis4opnxJINeaYsAPu
         fn2FZznqvIQZesJUqajQwE9Ccd9+j1rXhX208HdKFd7l8BoAliy1HBgK48zbQv1bkMiN
         jfHb5ENSZgNiVbkuto/tOd4r+9RfIg5UE8J9UcPQqh0ONaJLCmFjqxIDZ2qxBaZgQaGf
         mMbD6eubF6i+K+Tb0as9QXiL+iOKTWh91qJhrB1TR1cWpqSk88SbjuYNk6j3dB5rBDpq
         WHUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVF213AP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c061077920si211352485a.635.2025.02.10.14.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVF213AP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc5c-0008Tj-Ar; Mon, 10 Feb 2025 17:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc5R-0008Eg-0H
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:17:05 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc5N-0002RD-Ts
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:17:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2fa48404207so4692526a91.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225819; x=1739830619; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hxYnmVo73BQmCsNLmzhebDUlsTiyDBQaXiChNep1Lw4=;
 b=WVF213APi3qzcUcdM75GRs9pzSjIbyd2x82h3aOG7VMoJuDdVXOknYbhItfd5poZMM
 kOBpDHL9ncu6nR9xFtdGRmiyGZVEGVGxPQyZZJE3fuiMBqkAHPN1Ka4jBoZZBj9Yi11Q
 i4L5sJgnBd2qMCStbjwVhUaOfIYIa8qkiHNNSZV9qhJ09tqSZ5xfPcPh/3aDwEFki0LP
 9c5pegkidNkYenjURu/4tCvSDt+9Z6QJyi3Xx9Au9NqW4ra/ZslfdiPWBBJdDdMOPQFN
 9zDzdrie96OHnoN1H3/NLXGBWYzl2d0zcY9UMjH+g/hhcJUtbExom8EoScvndfJT1dKR
 eQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225819; x=1739830619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hxYnmVo73BQmCsNLmzhebDUlsTiyDBQaXiChNep1Lw4=;
 b=PEIWMPBSYQGGs38Z8IbgPIUYYnjvh8W23OhhZAP51kwR9K+rqVq1zIC1I5wVBLgFTG
 IDR07ZOzcpMCu4ENC+UVZMyQiOlrtxCCL8h1f41ZD+WlXu8ffMtGE95xWk4PxGpLSgp7
 3oTDGdFW2+1LUG0BLir6dOFwTlWLJebocJBsb43bwdPAbNcA/xRMEFmNbQxWqSfjaMsA
 osmNg8DWvYlOlmwU1UikE+RBNiJwl/44D3Zd96fe+fmHhCj7oDaAs5bVcQcVyOnuuK28
 okOLOSau+9AHn2CFk/J34alE6VEiZp+7JGn4gxqE2ald7cUQtntSV4FsUQ3aQqJ3jZSG
 SPuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1lMxwR/PgBVKjPoUACgsejNUd6/UTreU4ThUNf61EeShOI0Hb+cPDtPGRa4DFD7FV0qNXgEVDtg==@nongnu.org
X-Gm-Message-State: AOJu0YzI6hLKZGWSG19rUi/QW9r5I9WLrJLZPScmVCRW+e+pZkowZNk0
 GNow5FKzuI/KIZ+eZF1pKNliHg1we7MXHGLClZUZ2083S6hgTsPSmBu2x5gzujQ=
X-Gm-Gg: ASbGncuLz6Q7wiTCQa4wrrkwnK2sCCPmiWC8Rt5I6W12Aldzl8QICpMpoRC1WNBJYXs
 6YvpCpY8qN/sULM3bn41K+aRk6sCaz38lDTg89hkpjFxUu3rwiEBdc8pPOaLt1TiTmwKtrU5FvJ
 4Uv13NTbJkrdfRKQ41XXuB9sejLcJPR7GRIApJVdcJKoWsfDVptlJJPzCAOmMI2/Dbcgbxdjrgh
 GYu9FoEmgBZWMKiCReI/dM199PUFLAu1QU5Zko56F7DN0dOyNC4TUMFk1unTCI7nyf6srZIWYIN
 NGl83ONYy89qguOpxNE5jYSFvDkYiG3/5MprCdpux/veM1VJ3SI3Ft8=
X-Received: by 2002:a17:90b:23cb:b0:2ee:d63f:d77 with SMTP id
 98e67ed59e1d1-2fa24063c18mr24573415a91.9.1739225818739; 
 Mon, 10 Feb 2025 14:16:58 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa0942d30esm9207255a91.0.2025.02.10.14.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:16:58 -0800 (PST)
Message-ID: <b2f60c1a-16b3-4b9e-b7ff-b8452408809f@linaro.org>
Date: Mon, 10 Feb 2025 14:16:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] disas: Remove target_words_bigendian() call in
 initialize_debug_target()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: dmmP30PV3ojF

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> All CPUClass implementations must implement disas_set_info()
> which sets the disassemble_info::endian value.
> 
> Ensure that by:
> 
> 1/ assert disas_set_info() handler is not NULL

Can we do that earlier than here?

> @@ -61,15 +60,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
>   
>       s->cpu = cpu;
>       s->info.print_address_func = print_address;
> -    if (target_words_bigendian()) {
> -        s->info.endian = BFD_ENDIAN_BIG;
> -    } else {
> -        s->info.endian =  BFD_ENDIAN_LITTLE;
> -    }
> +    s->info.endian =  BFD_ENDIAN_UNKNOWN;

Extra space.

> +    g_assert(s->info.endian !=  BFD_ENDIAN_UNKNOWN);

And another one.

With the spacing fixed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
