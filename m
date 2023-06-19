Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2825071ejt;
        Mon, 19 Jun 2023 07:00:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pX/AcHa6UVkHoySiz/tZD5KnD7X3EA7sjGA9yf8/o4UFiA77lx7tN350eBInxA4IU6AqE
X-Received: by 2002:a05:6214:764:b0:62d:f68a:ee2d with SMTP id f4-20020a056214076400b0062df68aee2dmr10507998qvz.29.1687183223788;
        Mon, 19 Jun 2023 07:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687183223; cv=none;
        d=google.com; s=arc-20160816;
        b=Nk6JotgYlPy5iG4RA7gcKOmPsTnNXMRCVuyDloSEfXHUkfYKVbJkJyHxj0lYG9MOMB
         Q2tsmmXdjY/761m6o75WxqNGSu7IRmZ6LdFS6ZzTi61AZHlSgOVt3aPweMDZ08PIh/fz
         hED41ROl1uZCdU+YINkofY2Q7rSIxK46MpI7uC3h/2DfQLOYbx2GJnLZBTPTPp0+r2Mt
         Y89QquXfgKyH9OZE8R4TG6wHOgeo7Fi3kcYcMth5maD6HFODfCAsPf9bljs5pTHw51zl
         Uog3hKLZ+IJtdhRUEiUDhFQQPZylQLKkwRexpXbdVKFjhCWOwdydRZ1h9tKElaTwbMUm
         iMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F1ITw7OriNqjVl/jvxDv2HEcl5ZDD6hAU+/z548XyKU=;
        b=XV3UlqRRcDEFVPOLzuMAIbne9eHyFfUwJYsn7DMWi+OYSOivaq1mmNYgUC/HfV5Fxa
         ix8Lzt3Cj8msKmainbkxLG/iALm7/mnEqkQmEGbhXMJUSjs7x51jy0XkbKW4uIS35lqO
         hKrJ2sjm50peeNxR6PeIPNqzERMHoGuP+sYKx2lvCtoC2myICeDAuOLV/O3H4eUeWx1G
         qtLegfez9tXr/pLtUc3IomMi3BRwyNQvN+akI6xVrkwntgEtjg/8eR9VI1dRFZMLHUxH
         7EGTomd30CO8Pae6hOrszBK98yme6qstos4cKEJsoHXx3S4EJKlrY2/Jn2p1Gpv1mcd5
         zSrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlNUrEWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk27-20020a056214509b00b0062103dad3d3si13426016qvb.538.2023.06.19.07.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 07:00:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlNUrEWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBFQ1-0007Ul-8k; Mon, 19 Jun 2023 09:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBFPw-0007Rp-7Y
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:59:40 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBFPu-0001Y0-5q
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:59:39 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-519c0ad1223so4375008a12.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687183176; x=1689775176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1ITw7OriNqjVl/jvxDv2HEcl5ZDD6hAU+/z548XyKU=;
 b=MlNUrEWGbkOpD2Zwm6EKKji+xfDeSvG/SMZ02AhXVcwvwV8vYhA7G7jP31qBkedplA
 DqHKcB35Bso25USWv539Hxad0xfvEDjsMiFRnlWBaK0Y7tYshdtQBBunHJBLH0O/PM1L
 pMxVKtLhM840f2dKbc7be9HBaRhjHu1A6OlsgTcNldCz4LfGjNJJpZNovQuhNmrKcblt
 5/qFsSMwpGzYzWMbCNeKqpahRt+YBrGO28vRe72qNnNDlrDat16ep/0KSNwAKJKcPMo2
 itX0MwCHImfHb/gFiT06WFPn7X5TL5rvBe0aNl82JLsktH4phTt5fr+tGJ1STCmj39Fv
 NmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687183176; x=1689775176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1ITw7OriNqjVl/jvxDv2HEcl5ZDD6hAU+/z548XyKU=;
 b=ljQ2biWFcuL/LD4iabxiBqlLDJj0gemvjRutG4TxP+s27xgeQvuBW26mUfL6TRcI9c
 YqPryafmdM2wouI1qdvgpQXjvjACh+hbt8NzvPHqDWhdeOBsDTdS6WJ9WYBJFoCxdm/Y
 lPtgOwo+sdh7tAWlOYD/gxl6sc1DwyYdPRzt9cyB2e64tImoR6lTzu4/pdBlN+fzw3VX
 faLF35OHSenocu57wiGFBM9TO9y1S9oUiT9Z20Znjh2auvCDbIBd/JIFy2RiRcid8Af/
 /IMfebdUvZq9jZlHHaL9dfkfeciMikeBQnBikhCT3sXGUaJHAsuE5lzlLJvofwKirGE2
 AFHQ==
X-Gm-Message-State: AC+VfDy2ZVb/6GuD7yR+owLrifAq1r8+tzNSqUrXDQL90dZGr8D0H0bJ
 8Tm0yWRO+GWMCMGWRVvw144FOQ==
X-Received: by 2002:a05:6402:5162:b0:51a:4963:e012 with SMTP id
 d2-20020a056402516200b0051a4963e012mr3671509ede.18.1687183176165; 
 Mon, 19 Jun 2023 06:59:36 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 e4-20020a056402088400b0051a5360052csm1711270edy.48.2023.06.19.06.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:59:35 -0700 (PDT)
Message-ID: <2312da69-e5f9-d8df-35af-deb7561c66fb@linaro.org>
Date: Mon, 19 Jun 2023 15:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 30/38] crypto: Add aesdec_ISB_ISR_AK_IMC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: 3l8Ip5jHuyVv

On 9/6/23 04:23, Richard Henderson wrote:
> Add a primitive for InvSubBytes + InvShiftRows +
> AddRoundKey + InvMixColumns.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/generic/host/aes-round.h |  3 +++
>   include/crypto/aes-round.h            | 21 +++++++++++++++++++++
>   crypto/aes.c                          | 14 ++++++++++++++
>   3 files changed, 38 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

