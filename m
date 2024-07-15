Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2063090nji;
        Sun, 14 Jul 2024 23:02:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCiLzZJabkiGPSG7af73SOG8vy76oLcQPVL54td6DXeJTeZQvuiBaQvDkflS454X436HQiLBYLSwNiUTNFjbBk13jrrzml
X-Google-Smtp-Source: AGHT+IHUqd7FN81KC5BmDIY/TBFj2SY0yLDx548kW1lXyTMZAL+CDaajAFAiDat/PgmO/2VT9iFk
X-Received: by 2002:a05:620a:578f:b0:79b:e970:6e97 with SMTP id af79cd13be357-79f19a35f44mr2013884285a.13.1721023351039;
        Sun, 14 Jul 2024 23:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721023351; cv=none;
        d=google.com; s=arc-20160816;
        b=HLHsVazp1laMWwr7WxoVGw9mefNjzlb5l6GZrsKR/Pz8BF8+w2PxXYYLPYGciIxRgb
         D8jy1B3C7aOYvmU+C+Gb27OLCeFqo2FHEtKBCvDjYJWHojiq18SUoReq/9PnCgRajhMF
         4fH+lWpDczsAIPxoHphd5djtQYjKnYNOHfXNM9b08pzeVfXgBK1J+SXuDRtjKpasUMGN
         swpazgX6sQo+q+RLvFYR1KsDNd8ab1nO2jTstLaCrPdtLPyvjH+NzmMa5f5FLl4d23cy
         K1mpbFmgaEDaCYA3NuGQT7Fw39+0ciBORjeU+vRvOX1jftlwzZ0gCAoh3AvcGsKi+hg0
         k56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PhK3uSw6+hnYNcdL6etCmPwutYwcHaSrYEaMaiWGi3E=;
        fh=NWGQ7fZR3zVEVi2WAz7PRCM0UoPYD55CyBanUzcPfOE=;
        b=CZ2cHS1lB0yVVVwYDVpXtMHPfaTwt8kljNqstDrjIejVP91HABZHT53IrS2hPCIMhw
         y2HcpkqHZ2/XS6k75dCA83WqMTuce3ajMZwSt4nmk+cb7mw8Mbmx/1CYxv/I8iFHJ9Gw
         OSApOSgWe+GZxkvBaQV/gl2qXaLGm2RLfwCuaj30ZIutrYv8zm3ewo5NKcHGAnksRv6S
         LtkT/tEn8sUkDa/qzVRIV2wtIeVgg7p3JhL0qNhgxdW8S/H7rPuJ1jqpvzachZkpnoNi
         erd+1vQmL5FbfErH3bpYo+KY9ifd2X2XUJ97UZjV5UuGWi6x/IlCRladvPFRJEty6RjA
         Mygg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQa7yLrD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c69a04si427169085a.445.2024.07.14.23.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2024 23:02:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQa7yLrD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTEn0-0004MS-Sx; Mon, 15 Jul 2024 02:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEmz-0004G7-8C
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 02:02:21 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEmx-0001Gh-JG
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 02:02:21 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fb19ca5273so20586555ad.3
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2024 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721023338; x=1721628138; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PhK3uSw6+hnYNcdL6etCmPwutYwcHaSrYEaMaiWGi3E=;
 b=CQa7yLrDAV4bXg2QnOpAsgmttWK6lyrP9uP1AD789gGFO2sO1PjqTs43tSU+vtkFE4
 O1t1wX593GDcUWPakOd4Y7j2Z5PoIvLhS3q01FoRZdu/P0j3N1JItl8Qd+jfisfRZ1je
 WvXvkgu6UsTv6b7Xcxt1VhA18m1txa4Xxro9J+PooycezLn9aeXD5OfgPmk2lSOD2RGu
 5wDSebnD7OlJTNZUkyeKq0lmHDNqzF5dOKIPq31b4POhXCD9LOZqLfeXVx1VaiI4tyyP
 PWpgV2/CQyF6wJ4eP7HtLIe2xpPcU2/S1DPXyXaEIM54e6VKJZgOmwu9OCdaaJ/FSoeE
 rM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721023338; x=1721628138;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PhK3uSw6+hnYNcdL6etCmPwutYwcHaSrYEaMaiWGi3E=;
 b=r9aVHS+Mh1EHoO1fI2kY9VHoG9qpZtoeVcum1evnHfKjowEa5RybO25mUe2DZgcQtZ
 nDGuwUu/5P6yIDbxv/G1ENlLquQvcQOZpaSkyDzo+hzMHP4XraGzpEIZtBEuVuNoXdJq
 HmJchXj++DZgnZb7MSAhXB7pSrVwqtiKFq7s4dcLIDg1xcf6/rq5n+3fT1I4Id5Bgl3K
 1BbGTe+pZL8yeOAVZ3njs0F2IJQiSnhW4FR0K1hjsJlZYpPqZa62RuEaITiu6P9U1S1U
 YZ417L1cC4+S18TgAnBYXdGNtVYU+9B0bgl2d71nSbTT+JLsHDw/7voVqDldepB1HJa0
 QdYA==
X-Gm-Message-State: AOJu0YyPnjjsZCJK8HfkmrmIbAuNYD+zBKxVyw6jFauwkxrRUM/VB7u6
 uAfqQEE8A5GhEe3xV3VxjZ+ReoWSKG42KYwzhr9n2dhzXyFUyDPpkHMc5VxI8e+mmUs7QTAFTUQ
 0jszdaQ==
X-Received: by 2002:a17:903:32d1:b0:1fc:2b3b:5cbe with SMTP id
 d9443c01a7336-1fc2b3b5d22mr8215895ad.9.1721023337837; 
 Sun, 14 Jul 2024 23:02:17 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bbc68absm32044475ad.118.2024.07.14.23.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 23:02:17 -0700 (PDT)
Message-ID: <7a360b2d-4321-4fb5-b873-79a004071c85@linaro.org>
Date: Mon, 15 Jul 2024 16:02:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/arm: Use FPST_F16 for SME FMOPA (widening)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: danikhan632@git.sr.ht, qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Daniyal Khan <danikhan632@gmail.com>
References: <20240715055820.319035-1-richard.henderson@linaro.org>
 <20240715055820.319035-3-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20240715055820.319035-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sc5MORFnqK89

On 7/15/24 22:58, Richard Henderson wrote:
> This operation has float16 inputs and thus must use
> the FZ16 control not the FZ control.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Daniyal Khan <danikhan632@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2374
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-sme.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Fixes: 3916841ac75 ("target/arm: Implement FMOPA, FMOPS (widening)")


r~
