Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp2258497ejb;
        Tue, 21 May 2024 09:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2W84Y+Gf1nUtJzfAhPeQok9CW2r0vjTMp8ykclWNmtzG27jjTldwJF6sg7Qo9Io4wxp9786abofZohhKuwGJxMA28CO7I
X-Google-Smtp-Source: AGHT+IGBlcmMg/1HfmP/j9+bhLWYy45KXdPbaCasn61oFRpZzGm5ipz214L53PkTV+Wo3lX9YOEb
X-Received: by 2002:a05:620a:205d:b0:792:bc3f:401 with SMTP id af79cd13be357-792c7574acfmr3338152285a.3.1716310006438;
        Tue, 21 May 2024 09:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716310006; cv=none;
        d=google.com; s=arc-20160816;
        b=ID18clMwL1yJy9AvHDroGKTG2afEM1vI94tO1t3fhM3MI1wbR2wsOoLklauwu8rYas
         f01Cgec0gZ7oniOjsik7CDzddSw/FtlJV3MUQtRQ4Yi9d+vks5ePySe2AfyyPrME87xr
         J7yOrM6OP0FBcyFsEFLcSJE0qWwyaX41gWMbG1l+eTFoNxc1BT+NrMk2XTRPB8lLjdN4
         VIgFboRJNS5+acf1wEvWpavPvHoz3bEnE1h4ZqVOgwOZDW3RgZjd7rXd3ZroWMxF1gKh
         5kCFHXauuIM2wONN+EJqi/rmSG3DdXNYnkLsynL/6kWqf8qQxNbwQGy8ip48ov0C844M
         UHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eHAevO1o5T/FTWV1iNtVT2hqiEgNn183cIuBt9r1fcA=;
        fh=/n8ESbjH+RNRZFQP+rNoDuYW0vvb9QWsI2pSVI26U7k=;
        b=WAANgnUQ2CNFIxZe5HbHRAw68sC5GxH136Ch1FDnCOebjAq300r6dEJTZnEwYmFU+G
         gjnHonuQYbOYUrc6go8DBWc3cvku4ZBKWKgj3goeWb57UlsCAslDxDZJJowl2h5roX6g
         bBtj6x8W3iiA5btr6rC/Pt7Ix6X5WA/tO7KuhXAGsv7v2TGFXETOr9hczDhCRxIjRfS0
         Ewr315kwB3RE4xxOJKirppXGdNjKz4FGLMtMO0wuoAHBGxQulAd7oXGSxlEFC/RYk5Ct
         x+GUyeyfBPr6hDwjfxyU5jBQ6kArDIHRhVwkPc9jnvMeHz/NQxkuVAYdtgbEnRjT9hsP
         agEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gG6NLtSK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf29aa05si326449085a.224.2024.05.21.09.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 09:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gG6NLtSK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9Sd9-0005u3-Dh; Tue, 21 May 2024 12:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9Sd7-0005tR-Op
 for qemu-arm@nongnu.org; Tue, 21 May 2024 12:46:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9Sd6-0001Y3-3c
 for qemu-arm@nongnu.org; Tue, 21 May 2024 12:46:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-572b37afd73so10220278a12.2
 for <qemu-arm@nongnu.org>; Tue, 21 May 2024 09:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716309982; x=1716914782; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eHAevO1o5T/FTWV1iNtVT2hqiEgNn183cIuBt9r1fcA=;
 b=gG6NLtSKpB+T5+1nE2kj4nvfMdmbzMNvOwIUJw2DJmMMU3Zwv/ZemUTpRrg1mjuENX
 lYsdA0FRnsutli645QX3SAcnIaETQf6cQ4N7Ml47nKGjCp6826l6u+Dbd6Ysnksxutr+
 5Yw74SMwysjMxk4YXDIue2m+GwybOaxILaPmEQbxQUjnDKJeqaK16NgXQBMS/nREZi1k
 OoevK0zPXvEzzWoj1bwbYBmZLmjItRaIaxnGvsW5VT9DFL2zjibfJyhLGDi/OTSc2Zor
 nxf7ytN6Ste073q5prmQxtr9Esi4V7vEME3GNbt5FW/crNwPcna0prPUAUDWjH0KB/aT
 G63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716309982; x=1716914782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHAevO1o5T/FTWV1iNtVT2hqiEgNn183cIuBt9r1fcA=;
 b=AzJ4tu5Dp3va9OJVs17EpeOdv2jEyrGFVvKK1Mj3DRn7zMWXi1bxAZG2Y+1GUw3D+J
 UzM19OJluh1USVqSTyrQI5/0hQeSh9QYl7HEhP8U+w4mNK9eh0KokyVx9ecCzJYZa6fR
 nCUEjWpNclx7yvaFvAmw99QFZsUu/sSMvrKV894dlHsL81eEi9OXy/hjikhSMHnmt0Ue
 ZIZm6YcmkQkLlV1ZECDRENwcGvTptbdroHoaCnCdUfJC/prYEwntrOeiuuxjErAkhjaa
 5p8Bg3Co+xbVqZYEfg0BtGS3VqgGeH8RMV5IpQz+ETNen62A8Pnst8sjwlok7XVUUn1P
 GsBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5+4TfVLxL8hdEcqSVChuVm5v4s7KKcITMB20iyILc8/LFLxIVuM3hCmaIh4RCAHFMqF5vH/eE5EZfw46bFVM88BrK
X-Gm-Message-State: AOJu0YxHlM9br0mK1wPcBgrNie2O+MzJbFzrtS4w0cQHDWoXqmo1EMFy
 hahhB8l5ceErJtkMH4awKgGdNceOSrgOUMJKd2MzUoIKyaSE8txMaIhc3EPZyZ6RCXM3Jv8/yph
 tv/THMH9TqzcH03r9q3gwRjGX+RyO49+cPoqgwA==
X-Received: by 2002:a50:ab05:0:b0:572:9a99:cae6 with SMTP id
 4fb4d7f45d1cf-5734d5c0c62mr19908990a12.15.1716309982307; Tue, 21 May 2024
 09:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-33-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2024 17:46:10 +0100
Message-ID: <CAFEAcA-e6+z+07SvdqSf2AqPG=JvH4Zk2Fx_=zTtRZaFDOT-zg@mail.gmail.com>
Subject: Re: [PATCH 32/57] target/arm: Inline scalar SUQADD and USQADD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: IYgGg8Jl7qBA

On Mon, 6 May 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This eliminates the last uses of these neon helpers.
> Incorporate the MO_64 expanders as an option to the vector expander.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +/*
> + * Set @res to the correctly saturated result.
> + * Set @qc non-zero if saturation occured.
> + */
> +void gen_suqadd_bhs(TCGv_i64 res, TCGv_i64 qc,
> +                    TCGv_i64 a, TCGv_i64 b, MemOp esz)
> +{
> +    TCGv_i64 max = tcg_constant_i64((1ull << ((8 << esz) - 1)) - 1);
> +    TCGv_i64 t = tcg_temp_new_i64();
> +
> +    tcg_gen_add_i64(t, a, b);
> +    tcg_gen_smin_i64(res, t, max);
> +    tcg_gen_xor_i64(t, t, res);
> +    tcg_gen_or_i64(qc, qc, t);
> +}

Can you explain how this one should work? SUQADD is
"a is an signed value, b is an unsigned value, add them and
do a signed saturation of the result". If we take, say,
16 bit elements a = 0xc000 and b = 0x5000, then a is negative
(-16384) and b positive (20480), so the result we want is
0x1000 (4096) and no QC bit set.
But the codegen above looks to me like it will incorrectly set
the QC bit (because it's effectively treating both inputs
as unsigned).

thanks
-- PMM
