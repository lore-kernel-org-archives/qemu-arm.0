Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp189205eje;
        Sat, 8 Jul 2023 10:34:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHMRvRSkyVj84101msgTRLaCC8nmtvsCwaf4HJAms3QCCD30qL11rfowObM6Wdh3EnxAw38
X-Received: by 2002:a37:2c81:0:b0:765:775f:a7dd with SMTP id s123-20020a372c81000000b00765775fa7ddmr6834608qkh.17.1688837655119;
        Sat, 08 Jul 2023 10:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688837655; cv=none;
        d=google.com; s=arc-20160816;
        b=ah1XrwlJMBm3tCUzYpwTmsBYRllhS3uBbD0CqlWRyLfc9raqblFe+wACTFygyQenrv
         4E3QhsbE6DN9SiMLg+jKW+qSMPGMp0CqEM5w0jIBnfSrEKVWvRQ8T6TFABlJSA5uiqXl
         bDFeOMa1KNCOL8Of2HDLjHlIaeVda7Xq8EqinzNKLYFziOWowDWN2jK3aePQ5OEmeDC6
         WyY+5J6PlDEvP8W4YVX/nCr4ZCpJJgV9y0vxzY/AAoSrtdYgsWQp7dk5nDmvcqXpX5VA
         aMyFdLrH8T7kEkDNdgc9BcI/PwaEbMOmGFLl+oiKLWVsROnBJoycEDuB/I8MQIZYcJ8o
         88Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vhV4Oj47aIfmbogK9H2Y2CuNCwo/afWQmtDo+m5doOM=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=KtARHNjodugBJ8VP0H9ao828WBzO2nuGbA3lAWHrNsU6XTdCEm4i1WlXVnKAmXYM72
         ACy1e16JFLxWvIKA3r5buv58FECKaPTy2yXQz4QVhuevhCQ3AMuEC93IMtGO6C7y+7Q0
         XioHnr/KIIzkzBAoHmnkNMAdJhJ6IcnSNDjaURZsm1Ae23mBT/tmNxpFwyzrH32jkh3a
         8oqjFMMneQO1BXGnQYs7uMNliWLi9He5J8rFh/xzXlx/uKHJ0rJNicTLgq8gJLlGFt3x
         fG8IqkSH0M1KG1wCQgYeOGjo109IIWw11Ki08uML8uAhvbNaoi1MSUy/ZxF3F/jdz3p3
         0sXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJi67UvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05620a130b00b007676dd39610si4360837qkj.369.2023.07.08.10.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJi67UvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIBoP-0006Da-HX; Sat, 08 Jul 2023 13:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBoN-0006Ci-LT
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:33:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBoM-00084B-7e
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:33:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbca8935bfso31703275e9.3
 for <qemu-arm@nongnu.org>; Sat, 08 Jul 2023 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688837611; x=1691429611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vhV4Oj47aIfmbogK9H2Y2CuNCwo/afWQmtDo+m5doOM=;
 b=lJi67UvYEpxpZ1lvSADw1c7Zk7PjskYm9A4d1Ex/b8/P9A+1+ZN1NV/j44xhe0kJtR
 9b1fprYvni84s6i031OK15ouOr1dUUpjpdzDThUJmDciDqsp5OEZ7XYTk6T6L8D7ea0J
 /FB8xGx5n/f3BjytI/fg4RHYnrwa6G09FyiGvsIyqkZbhdQbBc2fJu+YVoIVyVS/wONV
 b5Z0yoz2b4jANvTj8+4whyLtmo/Xdv/ctpzYLkTAUHJTU2a9fRpxjHURSN6rN5bSPR28
 ySv8DKV3KGynyUTShqtEgIKlePJMvkzI4K+3k/Ue/k9O2wqIN5vfUbCKSf8/sjg+IZt2
 qTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688837611; x=1691429611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vhV4Oj47aIfmbogK9H2Y2CuNCwo/afWQmtDo+m5doOM=;
 b=G/bym5gloz6ndU7VNVwiGFLDpwKDKaP5zor3bcsJewUt+cHVOh3AK8E5R0xSkuKY2r
 ECLSXEKqSOO439wAXEjdkAz/TDUH6pfqJRIZxer8B06CAK7CjRRcRBfghtZcOsy52ifX
 mPBL6h7SHOallVczwcQC0UbM+Bpw1X6sbAVNBBJm25cfyOV6o3txOJ6yxsl2DFTf+1Sg
 MdziLiYpkgMPaJahqKVyAis7oeZO5tfMpKv5TIH4eatsI61dAFbV0/8EyGdBWhkS+XTD
 rZ8tlAt+XcJNDz4bD2Gjl6HPARAiwMgeln60qDawrObYE/iQUogjmfxEzD8E0a9t7tdR
 Ii2A==
X-Gm-Message-State: ABy/qLbHdF8ThdnTNzL1PUQOw4AzysXiNLOHW+7Zu1mZMsYjywaKPQQh
 6J7CQToThPuiHQX3hkFkQnf2Sw==
X-Received: by 2002:a1c:7206:0:b0:3fb:8284:35b0 with SMTP id
 n6-20020a1c7206000000b003fb828435b0mr6064868wmc.30.1688837611567; 
 Sat, 08 Jul 2023 10:33:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a7bcb0a000000b003fbb346279dsm5636923wmj.38.2023.07.08.10.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:33:31 -0700 (PDT)
Message-ID: <8d8e2f16-da0b-70e6-8225-9bc9102698c5@linaro.org>
Date: Sat, 8 Jul 2023 19:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 33/37] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UcJsE3KHNFY2

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64DSM instruction.  This was the last use
> of aes64_operation and its support macros, so remove them all.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 101 ++++-------------------------------
>   1 file changed, 10 insertions(+), 91 deletions(-)


>   target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
>   {
>       AESState t;
> @@ -228,7 +138,16 @@ target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
>   
>   target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
>   {
> -    return aes64_operation(rs1, rs2, false, true);
> +    AESState t, z = { };

z can be const, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +
> +    /*
> +     * This instruction does not include a round key,
> +     * so supply a zero to our primitive.
> +     */
> +    t.d[HOST_BIG_ENDIAN] = rs1;
> +    t.d[!HOST_BIG_ENDIAN] = rs2;
> +    aesdec_ISB_ISR_IMC_AK(&t, &t, &z, false);
> +    return t.d[HOST_BIG_ENDIAN];
>   }
>   
>   target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)

