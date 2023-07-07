Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp744130ejb;
        Fri, 7 Jul 2023 13:32:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHhuqzxaP22aGB8Vgz+vkrtozsIehDKw2/DzjMrJ98BWRUqSrFz8+WrbPCAaJG17FFYp8Df
X-Received: by 2002:ac8:7f09:0:b0:400:8eaa:276a with SMTP id f9-20020ac87f09000000b004008eaa276amr7097751qtk.49.1688761955520;
        Fri, 07 Jul 2023 13:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688761955; cv=none;
        d=google.com; s=arc-20160816;
        b=HF4E7vr3MXI74BzBJTRdr4VCMRogODgwAZAxc2e5V3IBUGW428cCzsWbCLTggyQJFP
         nZFXC9Z7t1YrbSmrLGi1eRliFAdi3Dg/gls3ScEtpOac1HiDx6kA8I2Dx/aweNEm3HDo
         zdvlL8OZPK4MS6DatSAqUGZfPm10EPtHPfu6VZOeSv99dxx+6QqwT9E0gt6lFWND31su
         RwGfxw8QbjvaRs3W3OjZtNIemmMfspeTFAnFGkmPB0jeK6PZ0xcvA8JPzPCPsDIpo+8e
         7iCVl/1rzp2DeWEFGRGulisJ+LbAKng69fif8aqV57/fA7troU8IRlttBNn8PWUj89zD
         VoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+r3v6Hw7n/2+Ok4CIzB9Rv2KMj+3fKeEfDKZQHooNXw=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=lrCSURJOzGl9W75BlxFq88yCCVbjvJers4uJN/05UYTuz3IZptMg9Fdv7RI7UG77Bw
         T5v9Cl0wQTRw9/JolxxXFA1lny2BoIncTJHUCRJvp1CKXHUtOA9q5fuVODBmzbOqzAJi
         4qSgyCO2DT9wXkm/osyppJqM3ZIfzpsFJPx+Dcr/+H4xiY7hZVt6oc2alWfQTkJKXjUE
         lQitgnwwvUR721YjPDaIQL/V3Z/70EebBweV38d0GSFEWWCkbNf+13LLD6ZFjwGl+nyu
         +YaleD6lhSDHHhMO3/nHXnUs+WxxE1yLjC4gLZK1KTJRHJ1lKelODWa/fURbPqh0XfV6
         YWEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPtjQuFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020a05622a111300b004021c5962f6si3143801qty.422.2023.07.07.13.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 13:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPtjQuFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHs7w-0000OL-H4; Fri, 07 Jul 2023 16:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs7u-0000Mn-Ap
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:32:26 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs7q-0001ze-Cy
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:32:26 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b701e1c80fso35564061fa.2
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688761940; x=1691353940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+r3v6Hw7n/2+Ok4CIzB9Rv2KMj+3fKeEfDKZQHooNXw=;
 b=MPtjQuFE6d/FjowiO+BjifppstSkMHx6mGrG1RrY88zUluZ4252Z7CY9YoVxF0JRcJ
 aAwzjksiXGAMyf9abrIU6aQwiHsSAigsoaLyFUB6Tf2iuW8SMGVqcjzHZE0fL7S/ck9y
 KsO5xwUFrhUFXOAUKrRrsWCKwt5GMbSKj+slmu0K1ges6QoDFZ38CjGLHWs/GUwCaLUg
 e/QweF9praInhj70ogGXIOpDC2ATLpEkHAblIg/roPsk7CGClup5xWoW6PB7TmUzR4da
 SNDwkTxJLmH/XAR+B8hv2RxX5HjoZ2/LaXYACv8EMpRDAv82Clq3FHlJN+CT6vCPiUuP
 jQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688761940; x=1691353940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+r3v6Hw7n/2+Ok4CIzB9Rv2KMj+3fKeEfDKZQHooNXw=;
 b=IDuBY7Ax0+x87VMfCP/k89KnWoFFlwo5vK8NMLFScQ08kfpusFHE6m4wPsMunW4q7H
 QPEdm2pg9bFUkeKS+FHmfW1xE02JYdQzKkERGaZl8bvSMk8oYwc+GnFUQTkiAtNZx17K
 GhWUaRvVHdkmVwAaipqZae5cCWcp1JvxXa7qhiOqwuoUyaTOVP13ew5us9h17/GxLm6l
 PW80vbPnatC2nJXWATVjTxeYi+XL6gB1Go9AJ4ZPzcV2Vt/W/YfaY7I1qQNeJ0miysth
 bPiagXf/ythV2gQbDbM+5m3ZZNrCbcbge714wOIHLql9nT1ZLx83x/ZMHJEASJB5Iwtr
 6OnQ==
X-Gm-Message-State: ABy/qLbnZ5Fn8UCsDos5u4yzryH/L78rchRIGPNPpyNosWO9BasnCeZ+
 YEj63Qn6pO9bTfvEjUhFOpEv+A==
X-Received: by 2002:a2e:918a:0:b0:2b4:6e21:637e with SMTP id
 f10-20020a2e918a000000b002b46e21637emr4537997ljg.16.1688761939850; 
 Fri, 07 Jul 2023 13:32:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a170906341500b00992ab0262c9sm2598157ejb.147.2023.07.07.13.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:32:19 -0700 (PDT)
Message-ID: <87d67505-27ab-96aa-23b5-d11972060ffe@linaro.org>
Date: Fri, 7 Jul 2023 22:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 30/37] target/riscv: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-TUID: wvHTZL0w1BED

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64DS instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index b072fed3e2..e61f7fe1e5 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -213,7 +213,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
>   
>   target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
>   {
> -    return aes64_operation(rs1, rs2, false, false);

Matter of taste probably, replacing the code of aes64_operation()
which is re-implemented by g_assert_not_reached() would help
reviewing.

I understand it is too late for a respin.

> +    AESState t;
> +
> +    t.d[HOST_BIG_ENDIAN] = rs1;
> +    t.d[!HOST_BIG_ENDIAN] = rs2;
> +    aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
> +    return t.d[HOST_BIG_ENDIAN];
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


