Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp741469ejb;
        Fri, 7 Jul 2023 13:26:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEl42eNqUWd+0RPe3K0CNe0r+JUpK89tmnioO6AMiOpcVLAJ+Amstdp1uHtTtLGy2GW4q/7
X-Received: by 2002:a05:620a:3729:b0:75b:23a1:8345 with SMTP id de41-20020a05620a372900b0075b23a18345mr7094916qkb.64.1688761602196;
        Fri, 07 Jul 2023 13:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688761602; cv=none;
        d=google.com; s=arc-20160816;
        b=IlaGIjbCuO5KIKRGuAhvU5V3eXtP4ZMNiOSNTFqxBRBtuQ/ss5TndRMk+/ytPWe2d0
         7gtJ059Dj8/dEI41i99i53zs/NFoqA4xExIRWcVR4jVB9Z0Nd3FlFyl30alhlKdgpMFI
         eztHaGo8vZqG9YsQ91V5C5crYJ2bprE7Nv/IQiCwsnfHsK3V+pzUHQ8irxpa8Dj5Bgph
         t69Nk5SXgxXMkmI02Kl8yrVL4LQlGtxq0FE0UTqR0syVBcC7CTqKiTgLAIVxTtKjJMGY
         RDGQBAH3BkpQECIqu+Wfyu6IJjNfA+oQv/gq/rnyZriTFzYJ77FsLTIRW2uyPWywnypu
         iCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e3c2G3RIpd96h33HaZMSLOVAsyNtgF61aubCsEvIZPg=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=OHzwVdmuePK9ov0m3CkeboGloxNDm71aPQkaIMp/0KHJn3adA/3QDlc8h4a+c8eCWQ
         +2SkIRp/QRR2MhZ2IVLgI7SJF5SSvRUY3EQBzsVJaJYcr8ikS4F3rGDqodUQSaWJucCQ
         LL4/rtznRXWjK6f/q6pDNkjDRwonWcXOuZfEDtrI5SySGxExpg2bsZjeSO8qKB5/vyyw
         C3H8kE2mQ4X3iz/Ufyg2bcHF+1Bd6ZtZfYjEaMWRImLh1Szb3uySaVBrkT2XO6ufckwJ
         s83QSSRL1X/tGgvTBhrSZBzie9qQRMz5/AL40KkTGXC7iA68I20mDRbFG4m5o9biUbBb
         veQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H87jLYlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ae9ec16000000b0076468198f2fsi3205649qkg.698.2023.07.07.13.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 13:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H87jLYlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHs2B-0007Ab-NK; Fri, 07 Jul 2023 16:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs28-00078C-7s
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:26:29 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs26-00042e-KW
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:26:27 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso432953266b.1
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688761584; x=1691353584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e3c2G3RIpd96h33HaZMSLOVAsyNtgF61aubCsEvIZPg=;
 b=H87jLYlvE5LWR9tqo6VdTP3Wj3L9GD9/CsVaA+Zi0Hk1v1LF76hwY95HYHD9ueY/fG
 BpEJ8O2dZeOVzYYUGwyoA/AKpfV733LwP7Nqt/EKMCqlp26zRkNGdt/yYGhsoooxkNTO
 RYKLCxlu4pdQG39rTcM+QXweTt4PqB6kbYFOM2t5cRmh7KBmsnGX1xuq/x2Sr+33t70M
 dgYTaPXjcOHynucxgKpoZMvEZ6WbDJB5sWMOxtpJ6GpGmLbGd4/yLFCm7CXhlR98AfAn
 94n+2qTPFVtiZa/msZRsE80Vdw8knt8lQflZGHmelIvOCixe54UKXbRW6TGghTbtglvb
 zkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688761584; x=1691353584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3c2G3RIpd96h33HaZMSLOVAsyNtgF61aubCsEvIZPg=;
 b=kAU5etMnDvdPW0C99NJN35NdslZryD3aBycwBkETbzoBOU/0H3YDUgWqhovSTEIeJS
 6N5lZ1aglOTqIcbko6h7smqBVJB1PzzES3nRlOHIN8CdNZMNBr71e4i3YoRwhkZ1uZIB
 XG6HIeGt1i3JQbvY8HD1CWPDufAJWaZ3/jB4MFRSy2mQ30l50a4idJOecQN6PbS81mlc
 mb/RTdyRHV7TcEmFbc1T3kw+QVeuN36pzItLVKRgWhF2hHJ/+uzk+Nn+yRENGfYtrUQO
 H4teQUh4MZkOum7EB5GQmP7wTWPbAeGFTQzWZzsEhNLcNttAj9XXmXqCRutf2saUfOLU
 AegA==
X-Gm-Message-State: ABy/qLbHR5eQPkRitrVK126EDFStbsr4V9+6NKE+e4Lw0MPfpkn30CAD
 I5pePrOAqaYo1o6dXDWrtEAvFg==
X-Received: by 2002:a17:906:18:b0:992:1653:3402 with SMTP id
 24-20020a170906001800b0099216533402mr6814212eja.25.1688761584697; 
 Fri, 07 Jul 2023 13:26:24 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a1709066b9900b009894b476310sm2557232ejr.163.2023.07.07.13.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:26:24 -0700 (PDT)
Message-ID: <c221b000-a2cf-7b3c-9e1f-42f43f458752@linaro.org>
Date: Fri, 7 Jul 2023 22:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 32/37] target/riscv: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-TUID: mITSfhEI3Orh

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64ESM instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

