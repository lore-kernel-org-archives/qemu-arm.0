Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2700661ejb;
        Mon, 5 Jun 2023 03:45:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4LNE8txOTS1zfAyj5ojpMemDFRdBDhpepb395TlJuR8Y5h+W8bKeljnkwrlUbGBSuPp7OK
X-Received: by 2002:ac8:4e55:0:b0:3f9:a685:333e with SMTP id e21-20020ac84e55000000b003f9a685333emr1927707qtw.52.1685961946583;
        Mon, 05 Jun 2023 03:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685961946; cv=none;
        d=google.com; s=arc-20160816;
        b=Vp4slwYAcKdJvPTchkBlgosVDbdm7WOn/6ky0rCxkpKOrrcIiGk0qlfxk0Fv9Qpb2L
         /EcrmypwwS3sMa8Beh7Rd7M9ylvvaC3qWWOnLIEyqCsSHR7KwEjDaGZaLAeqoj5sM55j
         /lPvYycAXUr/s119F7WAz/4zbCz0UwkgWgQ91Q0CYZ2pbQDbBiSshiwB+4jQiJChjMje
         zBCsTrHMr+RI/S8htUvVL6NxS3z2Y8yjHpUdTMoyvwLQqoBeTvvzTgKWujvoSJ9j/nt5
         /TPJltOly3eZZEJLUjUON5/adJyn83XHSnSfo/BufuaZVjNpxvD2g5ajoUtxI1cjvcdM
         +r7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BER6FqqlFlZwhQ7mFkNQkzoTv/vcZa2WEIOpCzfl/JQ=;
        b=U6ZJH/rbhNz9VHCyqGPDXNzkFdAeVy7WGBOpEIts4ZaZ0GxMf0kItAWhArT7hrkved
         E0T36U8FUQiQmkFvwJq9LYXmN3gco59pHWjVX4AMSnY4YH+wW2Ue1XSonP2OuFUMxOsl
         Ge9AQzQKyodHLGnD+TiRCwGc0a2iZ/sdihb6lh04jVtP/9LaRWA0u/lbwCqRJ3N/Ps12
         R+EbyOQYacuSfXyuAvMeEBQCPEeVQSbEvOCcZZlD/QLTfWQMpdFkrCPzEMA55n/S1CAl
         e0inI2Tpxc17wjCe9KKr9tXcgBXcaPyDhfYwHo970Jjm6NAWdttTon0mPdKJM42Nj8Ha
         kHVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V3rs/o6y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a05620a152600b0075b13a89c2dsi4213749qkk.265.2023.06.05.03.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 03:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V3rs/o6y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q67iY-00069b-Kf; Mon, 05 Jun 2023 06:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67iK-00068A-1D
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 06:45:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67iD-0007Qo-8y
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 06:45:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-307d20548adso3824819f8f.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 03:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685961919; x=1688553919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BER6FqqlFlZwhQ7mFkNQkzoTv/vcZa2WEIOpCzfl/JQ=;
 b=V3rs/o6yTzmLRK2uwI34TyVWX5Fjx2ZGiA4Um7ms/5i+MbEAnOoptm611exvFfnOnl
 +8GatZtt0xp5GWlbNEB+af+T8x1AOtnLY6nJUbdpzSgyD35ejcyqw2QjLskCU/PV2rhm
 8yY0k2Nv9M1NS6vj7AunhQRs4RXxLbSKCGi/O+Yjsdxl5UvnQ2Ds8SpAAC76o7TmC9zG
 QudGEUTnzImqYJKDyKiKNP4r8pBtz91TGYWDF66HkR1poAJxGy9nOQ62ZbTvmJ+2xqMS
 BaO2lBIonfDbjtN0mTzIC3MdS7sbNyk6zh51jrU5WuxXriUDf4AdX8kBxPBkYVNBrk4I
 exjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685961919; x=1688553919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BER6FqqlFlZwhQ7mFkNQkzoTv/vcZa2WEIOpCzfl/JQ=;
 b=KewZT3aZLuxkfLEXVYXGTdAEe3mLFBBJ6/7vV0lnPou0sZOhtSNk/XmAuBKlWu4GfQ
 ppzRnH3mQ0Vh090Zlrlbl0XeWo5skyMSzgWj1patwtu4j5h+QGNrLmky+cq1xM4xBxxe
 AutwsJbqfJ6VMbrSR1NkLXM1na8+tS4TdmfKHSVHstwSBh+SBkG/KuAMqqHsBRwhK+UV
 WR8t4uzNJjAhIZhVrOnpFPin9AVXI8KV67z/f7J8sKzYol+Pqhb/aJ1+vDYtnTMhphqF
 MzfAGdcXOfKWbsLnJbHyqfUPflTYjpdfheDK0y36ymNRCEWlyQpGxdojNC5KvZ0FjvRh
 SD9g==
X-Gm-Message-State: AC+VfDzVp+MBYBSF2MHCd0MQdOCpFr2KND08hUK7vvhPBKp2pq3p3kW3
 bBKnKmre15rZgxgb7MxZ1tl3dQ==
X-Received: by 2002:a5d:52ca:0:b0:309:398d:3396 with SMTP id
 r10-20020a5d52ca000000b00309398d3396mr4430944wrv.33.1685961919363; 
 Mon, 05 Jun 2023 03:45:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6083000000b0030abe7c36b1sm9314720wrt.93.2023.06.05.03.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 03:45:18 -0700 (PDT)
Message-ID: <bc89ede2-747f-c56e-5cca-e09289fb72f2@linaro.org>
Date: Mon, 5 Jun 2023 12:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 02/35] target/arm: Move aesmc and aesimc tables to
 crypto/aes.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230603023426.1064431-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: lIZwx2fhrjND

On 3/6/23 04:33, Richard Henderson wrote:
> We do not currently have a table in crypto/ for
> just MixColumns.  Move both tables for consistency.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/crypto/aes.h           |   6 ++
>   crypto/aes.c                   | 142 ++++++++++++++++++++++++++++++++
>   target/arm/tcg/crypto_helper.c | 143 ++-------------------------------
>   3 files changed, 153 insertions(+), 138 deletions(-)


>       union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
> +    const uint32_t *mc = decrypt ? AES_imc_rot : AES_mc_rot;
>       int i;
>   
>       for (i = 0; i < 16; i += 4) {
>           CR_ST_WORD(st, i >> 2) =
> -            mc[decrypt][CR_ST_BYTE(st, i)] ^
> -            rol32(mc[decrypt][CR_ST_BYTE(st, i + 1)], 8) ^
> -            rol32(mc[decrypt][CR_ST_BYTE(st, i + 2)], 16) ^
> -            rol32(mc[decrypt][CR_ST_BYTE(st, i + 3)], 24);
> +            mc[CR_ST_BYTE(st, i)] ^
> +            rol32(mc[CR_ST_BYTE(st, i + 1)], 8) ^
> +            rol32(mc[CR_ST_BYTE(st, i + 2)], 16) ^
> +            rol32(mc[CR_ST_BYTE(st, i + 3)], 24);

Matter of style, (since you are changing these lines), I find starting
the lines with the ^ operator clearer to review:

             mc[CR_ST_BYTE(st, i)]
             ^ rol32(mc[CR_ST_BYTE(st, i + 1)], 8)
             ^ rol32(mc[CR_ST_BYTE(st, i + 2)], 16)
             ^ rol32(mc[CR_ST_BYTE(st, i + 3)], 24);

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       }
>   
>       rd[0] = st.l[0];

