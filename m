Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp46286ejt;
        Wed, 14 Jun 2023 06:35:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BhrFzcEd7qJWwfaMUw+djwqMkBm9fMKFbrdNSncbk1gAOIcoeZOacYwtFAyF3LeWmwhKE
X-Received: by 2002:a05:620a:4d91:b0:760:7730:cd4a with SMTP id uw17-20020a05620a4d9100b007607730cd4amr9934502qkn.21.1686749705341;
        Wed, 14 Jun 2023 06:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686749705; cv=none;
        d=google.com; s=arc-20160816;
        b=wp6refjq0C4dJn4XG/43TbTx7HKLZ6dgLew1yl6787RlNMUKt8jD2t1ecjo8d7xv5D
         6bovMd3X34pTgGZiZdV00lDsRZ4p2mh9WyUrPam2RcgszZdxLslFvo3S6aDVjYD4O/6e
         vo5s8ts+ZTTywWuAj2hiQGYdkzPfUKxr/gXYFCFYXAZ+tpBamnHdmy2sTqfQ81pTmIv8
         LCyUsAko9l/0GvSmNBfi4UfyCPMP/WVg6hIOFP2S8uTJS+1XGQ9E2glytYD0abBhIMlB
         PPzHjXLKNGCRiXBFZtP+zojb4W0eFqhRu5H01vGfzigGxuEcX/PLy39LF8bCSU1HuRtC
         fLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4jHz0/L+mCLjSsW8Q8eVvQKIrcWqbKz5qwa9macGPZg=;
        b=K/XPtcIBBRQdU7+X2HYRuEktyeNRlu1kPEHluTtRlbzQRoh5AQJclGcPRONQ3A44cw
         OPGajAq3kOu/jWi4I6dfjv6NGQiB42fAsJXTnfBz4B2J6ERfi+3RHlx2t81EVebUD9ye
         UWTxjvnPbGACuZpfLjwdsL0fMY+2qDDxcXaRNyrE+64XPca965BHAOAzXooDDvYhW4MA
         H0R3y/ii5JweVmpQa7l++BHWCH+bg81/ghYa51EFoVmDSqXK79vr/mSyovk5eIz7ZT1X
         Nt3WbaeEv6QL5snXE6q+Cn85ESGEZMoqhi21OSximQXbG6R+KqT2WDLNiOPtetFeGxtH
         Ifeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2IqPvfN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05620a131000b0076078f1152dsi4195616qkj.489.2023.06.14.06.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 06:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2IqPvfN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Qdg-0004Rb-Sf; Wed, 14 Jun 2023 09:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Qdf-0004RC-BF
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 09:34:19 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Qdd-00066W-Ob
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 09:34:19 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5185f8e1067so4140449a12.1
 for <qemu-arm@nongnu.org>; Wed, 14 Jun 2023 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686749649; x=1689341649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4jHz0/L+mCLjSsW8Q8eVvQKIrcWqbKz5qwa9macGPZg=;
 b=x2IqPvfNOZHTIA39poH89sG5PPUf5hOCJzPqvMlbMuB0QfoFEAg6IYR6jMrlw+R8Tx
 5f+ThCY75POXP56/YWZkWTazWmgeDuRCmq3qJKOJhSVNRNAxu0oeXztaimISfemYjNhd
 T7zDlYsE7YefZ+ygzoDQQTcXe1MPpmcH9tI8Am/nzYw8mpp2m7oGXTZA+OGJ3XL0E6eo
 ODjSdtg/aM/gMgwyVVTRlXXKXynSQZ21CEI+EzwebmkiGLVU8cgqCAbqH/zMI8AV/Cb3
 F+lsugcH1jYTmLJ3xne/nWStx2qC96NLCfXbZWxEQBiWdjojFcWuRErXXo5p/jTnUIKS
 3qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686749649; x=1689341649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4jHz0/L+mCLjSsW8Q8eVvQKIrcWqbKz5qwa9macGPZg=;
 b=On8mrkV+TOxlEV6GamwN4YkGgsANVzJJ7gzBNiic6qTUVfFlZvMQS3TX8fpu9ZIFLp
 sVLjie0TB4pEcyWxiLvDsVB+VUA0NQOAeYsheCQbANHNOBhhy62GHi9eo3RwQmaAoO9V
 L8ovD5R1PR2SkrrrJDoGKmbEQ7L9eYHXKgBIySPJdmIyDgYP+hVR7r6Uy+xGAKviBF7e
 YaBjAVZ/MsqmEbMkQsw4lu7K1ZdehGQywNgt0AGpflsUxsJ6W91rfAvMeRrP/C5qus8r
 PBm77OnYWw7a+TMPAlNAbirZ1KDs7jgMF1riS84dUea+i7YxaPqC0fP1sNIQGMbl8tZQ
 /1fQ==
X-Gm-Message-State: AC+VfDx/BMoN1rroLBjGEkFXglnT5YR5hy9fSbNcewxeqnQTn1Tw+sjK
 xS00aAV/Tepr2RzcWI/dPFssOQ==
X-Received: by 2002:aa7:db59:0:b0:514:9edb:829e with SMTP id
 n25-20020aa7db59000000b005149edb829emr11124259edt.18.1686749649389; 
 Wed, 14 Jun 2023 06:34:09 -0700 (PDT)
Received: from [10.14.201.121] ([213.175.39.66])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a056402139800b0051827a12b47sm5636862edv.15.2023.06.14.06.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 06:34:09 -0700 (PDT)
Message-ID: <606e9884-6ecc-2f34-1aa2-31d093de7191@linaro.org>
Date: Wed, 14 Jun 2023 15:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 24/26] target/arm/tcg: Inline 'exec/helper-proto.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-25-philmd@linaro.org>
 <d4fddb7c-b0a1-6a52-b15d-e86f025c72ee@linaro.org>
 <3f50cb09-1460-522c-dedc-02b1b99ce9a9@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3f50cb09-1460-522c-dedc-02b1b99ce9a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: /Qlb03Kke30j

On 6/14/23 14:50, Philippe Mathieu-Daudé wrote:
> We get:
> 
> ../../target/arm/tcg/vec_helper.c:268:6: error: no previous prototype for function 
> 'helper_gvec_qrdmlah_s16' [-Werror,-Wmissing-prototypes]
> ../../target/arm/tcg/vec_helper.c:293:6: error: no previous prototype for function 
> 'helper_gvec_qrdmlsh_s16' [-Werror,-Wmissing-prototypes]
> ...
> 
> ../../target/arm/vfp_helper.c:511:10: error: no previous prototype for function 
> 'helper_set_rmode' [-Werror,-Wmissing-prototypes]
> ../../target/arm/vfp_helper.c:1127:10: error: no previous prototype for function 
> 'helper_fjcvtzs' [-Werror,-Wmissing-prototypes]
> ...
> 
> ../../target/arm/tcg/m_helper.c:581:9: error: call to undeclared function 
> 'helper_exception_internal'; ISO C99 and later do not support implicit function 
> declarations [-Wimplicit-function-declaration]
> 
> ../../target/arm/tcg/helper-a64.c:831:9: error: call to undeclared function 
> 'helper_rebuild_hflags_a32'; ISO C99 and later do not support implicit function 
> declarations [-Wimplicit-function-declaration]
> 
> ../../target/arm/tcg/psci.c:174:9: error: call to undeclared function 'helper_wfi'; ISO 
> C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> 
> ../../target/arm/tcg/tlb_helper.c:168:6: error: no previous prototype for function 
> 'helper_exception_pc_alignment' [-Werror,-Wmissing-prototypes]
> 
> ../../target/arm/tcg/crypto_helper.c:73:12: error: function cannot return function type 
> 'void (void *, void *, void *, uint32_t)' (aka 'void (void *, void *, void *, unsigned int)')
> void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
> 
> Do we need more tcg/helper-foo.h.inc?
> - gvec / simd / crypto
> - exception / wfi

crypto, pauth, mte, for sure.

gvec could go with vfp.
fjcvtzs is definitely vfp.

I doubt a separate header for exceptions would pay off.


r~
