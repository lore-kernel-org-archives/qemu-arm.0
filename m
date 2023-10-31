Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp308811ejb;
        Tue, 31 Oct 2023 07:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCyEB7e2JeCtZzlyw6ga81yOXY0c9TyjpcWsG/GbMl8HbldONI9jMcTZOXK40zqNDDsw72
X-Received: by 2002:a05:622a:247:b0:41e:3472:f1f0 with SMTP id c7-20020a05622a024700b0041e3472f1f0mr4014612qtx.2.1698761337990;
        Tue, 31 Oct 2023 07:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698761337; cv=none;
        d=google.com; s=arc-20160816;
        b=DYl4/ibbAzzTTe/Fw8FDCi2JxXQDLRya5jTQ5RM444ttbTsf9o5Lftg2qxbI8xlVKF
         e86wsl+7+dPAb6HDMpNGvkQQf3ecgumskD8IDBE/DpIBwyN9984p9N09WWrebNSXdt3q
         HjznhfSrpBEMRgqAJS9W7zgMw0dFRmwQDWYjVEw2hnKkhQ0JAF8z7JkCH6Ggcg9z9OwT
         JwGWLxnVVAoFzK12jJQekJFRr5FbOIags1yRH0v8dPskuc819/2CTtSbCvImWqwtm7Dx
         I7PYbAkwAAbQpjRLe3bHZpfnLz4PchgvVBYBj2yiEfl7eJPBXqfO1dVh20YTbAPhYriG
         usYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DRjBWf6bHMPR3RkpPgDb61jJ3A0hzo0if24G0b5t9UI=;
        fh=iUCPneHvQATULSMZbVQyKf5arfzDKucfm3tWYCvjfDg=;
        b=ao3/XoaWPHwnFsREgBECXQ/5e1APgoF5PSgEoevairkssjL1omFVH3et4xw1jLdUki
         cQIQC2cbg1sfd278C2SrPZleetG76DcxtQZdXIBrPyhzQNcck8IF13+E0QaOBj/fApe5
         P2gke5gJB9wag8ZMPuTw1pzZ2GMqigddgnUXXYkjXisO/aVLtuCHvKXt+2HEe3trPx61
         FW6RPl5Qcd5GX1YB9+aWrssMUKNuIEzrvVH6msscAx2PRbxz4Exl6p9zTamP0jbWHsd8
         WZ0kPR6si5hiT1ZGsfvascUZmkVK1VXeq2E3f+18AY/4FJV3x7ZVH0uwLB/hZAW9/7Aj
         V4mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GvqIOVjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85703000000b0041e3dfe1bb9si1144374qtw.30.2023.10.31.07.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GvqIOVjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxpQ6-0007ni-Co; Tue, 31 Oct 2023 10:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxpQ1-0007m8-4U
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:08:35 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxpPz-0003Hs-Gb
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:08:32 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6b44befac59so4927900b3a.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698761310; x=1699366110; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DRjBWf6bHMPR3RkpPgDb61jJ3A0hzo0if24G0b5t9UI=;
 b=GvqIOVjMDVH2AIGt9Rk6HqBTmRg7ANtx6/olk+ktR6XoszyaDEjcyEq8zQHBe6RFAm
 MKzyU6pnJnHmZfdjTBERmGNSBto7xRJS5BDOfnMk/layjxLsyMgWGVbntQwGyvcz3ync
 17jEIPE5niFmhxmPyKWbNBQhJUrAvKb4XVe4b3Y5kXtnhg1SYqrKmCN50zWh1RIGRiql
 BjE3/0lhGjYiyZ5JBEwQwxTUuVkHUrQOmflbTn/lGt/PnjA7xr1bwz67T3v4vm9OHUFG
 HqjJnDCT3G5SFSmrL5z//idlE4rgG2Tnf5f8AhKzXS6QQQedMolB0YGyIb7XtTC8sJOL
 v/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698761310; x=1699366110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRjBWf6bHMPR3RkpPgDb61jJ3A0hzo0if24G0b5t9UI=;
 b=VXK0TXQK8+r7Iqs2DjwoR57HDV9pH1mfmS31LmBVbCtyck6lFfZqbnm+lBIE8fIGHr
 Z3qUlXmx4YD9ntOjbCls9X+dgDfd1kOuI2id7QwL8zwbXvyyLyyvNmRQ548ainBhPzFV
 CeWPEQj3Za/RqpPn4tqed3VQ8KzDdrDB646BEZkAHIE/Hj7gg6gMSAgevlUnbEFUuxav
 UO1kxuBm+jGH2qDNpgLAPc7ZoUTVINDiz2mBAN2SJsUPoPb69VlYuvwMdq13cGuUdRSc
 AsTsscfhiJ2FZ9/iRRwEg5XZnVmGPqHQdmWvq3poNEJQyqhvjOXcTA+k0RrQI6n6SgLe
 YSAw==
X-Gm-Message-State: AOJu0YzPpIJiQudZO+b/e1HeQ+Q3I/MQLOthocpRy4cSqMBH8XOWjzsn
 JEpnIB6YWK017MaVJ5umlwui7w==
X-Received: by 2002:a05:6a20:e106:b0:128:ffb7:dcfe with SMTP id
 kr6-20020a056a20e10600b00128ffb7dcfemr3711831pzb.1.1698761309908; 
 Tue, 31 Oct 2023 07:08:29 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 k20-20020aa788d4000000b0068fbaea118esm1293772pff.45.2023.10.31.07.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 07:08:29 -0700 (PDT)
Message-ID: <c0479a28-1e95-480a-abaf-faf8ee12743e@linaro.org>
Date: Tue, 31 Oct 2023 07:08:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix SVE STR increment
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20231030190354.94671-1-richard.henderson@linaro.org>
 <CAFEAcA_kG-yE9sYDx+QBxCoAMySjc57oXx+UtSo=p=nCqAwKfQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_kG-yE9sYDx+QBxCoAMySjc57oXx+UtSo=p=nCqAwKfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZzNOFeBYpys2

On 10/31/23 03:52, Peter Maydell wrote:
> On Mon, 30 Oct 2023 at 19:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The previous change missed updating one of the increments.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate-sve.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
>> index 7b39962f20..fc4220114d 100644
>> --- a/target/arm/tcg/translate-sve.c
>> +++ b/target/arm/tcg/translate-sve.c
>> @@ -4294,7 +4294,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
>>           t0 = tcg_temp_new_i64();
>>           t1 = tcg_temp_new_i64();
>>           t16 = tcg_temp_new_i128();
>> -        for (i = 0; i < len_align; i += 8) {
>> +        for (i = 0; i < len_align; i += 16) {
>>               tcg_gen_ld_i64(t0, base, vofs + i);
>>               tcg_gen_ld_i64(t1, base, vofs + i + 8);
>>               tcg_gen_concat_i64_i128(t16, t0, t1);
>> --
> 
> This fixes the test case I have for vector lengths of 64 bytes
> and below, but vector lengths above that (eg 128 bytes) still
> misbehave in a different way (only every other set of 8 bytes
> gets stored). Presumably that's a different bug somewhere else?

Oh yes -- enable-debug yields

qemu-aarch64: ../src/tcg/tcg-op-ldst.c:712: tcg_gen_qemu_st_i128_chk: Assertion `(memop & 
MO_SIZE) == MO_128' failed.


r~

