Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp724273ejb;
        Fri, 7 Jul 2023 12:50:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFrh30VCT9Ey3GN1tJV90n8ZLI2CcaPFww/vqZUtdWlFlPxhkaETWQFkfGSR7zlIPRnRNhr
X-Received: by 2002:a67:fd15:0:b0:445:24d:24f6 with SMTP id f21-20020a67fd15000000b00445024d24f6mr3242726vsr.10.1688759430928;
        Fri, 07 Jul 2023 12:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688759430; cv=none;
        d=google.com; s=arc-20160816;
        b=Pm2GM+6A2cAuNyvSw0M02lPfJY9mSSjRksHjBKM7RNtJtDoNK0lYVOsoFAiNykmF59
         PhZQ6fo2uH5eZSsi1qENfxsQIHOWPvoiGDeLMQC1Ka1agDOC+RyHQ0PMplL9yqrEy+qN
         DEWxM9aLDR9em+5MgI3X0hm7s7M5y10bYxc2t5vQk5KQbK4EjZVW+XMDnSmmX85mGNM1
         ZvuC8RcXCwJtBpa4185M8qlZEFTd1ir1hMo+LKwlnYANjbhAuKe8QCazQ8llYgya8XBe
         VPrNEiz4DIdy17luH0ix2rUcsZAZexsfPkQ8hLlDK4C3jwQj7tHCl+KU18rJItQp5PUN
         PG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gsJFcU87Ses0H12xUGrBivfmaW2VxYbgrPDRsuNAeHc=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=yophISOnCNWI/PWALyj7qrDzuCbURgmh6+2hrve2yBS+HO14QsKzQxev32TZ9duiAQ
         TyS3ZEqTKGYTsvu//6I+SkEvOlTR46gYFsEEP4ISbMdz9xPnVt3Ro7UaBLpjFGQs3Ko/
         UpMNunMF0VjHLD6VZKBl8WX1dkUgYFDTw3tEugQ7xuKLbqdaL20ry7zhWC1Ih1jD/9HC
         GcNRvPaCib2Dt1C8iQJsC8kX2u0H78PhLxJh65WkjEpe84aG5NFgtm9JDH1pjQU5zoYv
         v61vugx/DxN3I1QVUBTNI2pq9YBHfgiNafhXEIBrWiDjOKGvRpkmrBQTvUtrA11IezY9
         Fyng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaExMKvv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a0cca90000000b0063001e0134dsi3069869qvk.43.2023.07.07.12.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 12:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaExMKvv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHrTH-0001zt-Ug; Fri, 07 Jul 2023 15:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrTF-0001ym-NM
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 15:50:25 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrTA-0006yL-TS
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 15:50:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-98dfb3f9af6so294264066b.2
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688759419; x=1691351419;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gsJFcU87Ses0H12xUGrBivfmaW2VxYbgrPDRsuNAeHc=;
 b=iaExMKvvH8cTp2tmgojMUWNyD1JjNJ7JDQtcBeAmXmKTvbdVxykrQTYB1DbSeVwSZP
 B+o0Z80u1vQKwulwNuutl5yJdTLDuiCQ09PSTk3UK0U6y10dJPIfQs+AujlQ2u9m1wOw
 O6uss2HEuNqmkpJGb7rffD1IiAP9+CDSLXJLYieQCJ97XAT2k4APpN/xeiwrmEb/xXxB
 r5Q6/Y9d5bnEGFzgCKgoSiG+WzuOXEZeHGZio68LoB/kr3k9MFrJvyNqoFTAqaUE0KpN
 5k6NSArpIctQdzmu71xlwaLaSIM+Q3WK6BLyVcf8qsik2JvY/L3EislS35u6egLTaLNT
 R0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688759419; x=1691351419;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gsJFcU87Ses0H12xUGrBivfmaW2VxYbgrPDRsuNAeHc=;
 b=JRM2PRTMjjLoNs0AZ1TyZD5JJMmu90+5vvhNHCEPwdV14jBsKvpULG7jH+641xKcDk
 aeo9omC2Pxru+IZKyFWQH5Rmt2nRXorFNZH8HUXUmTmNqgyUWMu2cuNoligD19PSUZGS
 R2XTLC729YZGHjEJQxEWGKX/Ym1kDunaHJFHu81eiB2avtg2RWL4oQoJhL3S4HasjzdC
 bXjU1pAM1ik3+mGBBh4Hndn5Sc6PpFh7C4+YWHrhB9VsFq7btMuvHr68/0rguZ75nHJE
 YJvxqE23CuLyD+o5i0UQ7bO9dDQEuem7TZKI1xaKPGa/EQ4ucLZyfdSkoBjgzTioTOze
 gjtQ==
X-Gm-Message-State: ABy/qLZKV7qvLz4Dx/u7tngA+zsEp8RxTRzFKAF+Ib/lPcmuZBM2+owN
 WVhvSOMSesM4sQOZAwXgMMh77Q==
X-Received: by 2002:a17:907:1390:b0:992:8092:c109 with SMTP id
 vs16-20020a170907139000b009928092c109mr4459590ejb.51.1688759419228; 
 Fri, 07 Jul 2023 12:50:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a1709060e4900b00982842ea98bsm2529437eji.195.2023.07.07.12.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:50:18 -0700 (PDT)
Message-ID: <a897a164-ab0b-8398-f6f3-0705a4625a4a@linaro.org>
Date: Fri, 7 Jul 2023 21:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 22/37] target/i386: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 0B+uGW+OiIKA

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESENC instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/ops_sse.h | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

