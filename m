Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163DECAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 10:39:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3BI9-0000tt-4w; Mon, 29 Sep 2025 06:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BI6-0000pD-NB
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:39:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3BHu-00048p-2G
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 06:39:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e2562e8cbso34836415e9.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 03:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759142354; x=1759747154; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=slxq7M06ABcWBrv+pHBsJf3b0orH2mLmkdi027husb8=;
 b=x2RQHk9JJMddIcPrC1b+MKx2B6T8vYHfnTTdVAyLZTB/VBDwAUivN1Lp8Xc2ozy0yG
 7FuSyqxSoDcmbNUEOiZ2WNdHM9jP03wapR9DtpezT9ap8I3FnUlizuXdQOH57oX+RqKy
 FoAgUXy/ubVzWIFkOnwRf9D5s5/MYd8bNSlxY9R9EMX/b3a/CG0bHf6JvGexyNnHggp9
 +MFfpEJthwp4rohEElczvbn/o4I57RdRshLOLkOwKoTPpvSY/zgW0dtDsV+F3Va3u4l+
 XZM8fEgVHeIPP6eEFz3xXi8j5DUX3RsxivK31UZYFeTDyvqACwgVpjGjb8/7kEyLpNSL
 bE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759142354; x=1759747154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slxq7M06ABcWBrv+pHBsJf3b0orH2mLmkdi027husb8=;
 b=dTAbx8bg04mxuZPVhDML42BduGYsFYSG1q3hLrTjkyu28cEIMwxATk5hnNiJw3ENv1
 z6l3XqCRBrzZIVJXEu8QmjyBB62h+VQrf+xIt/17XzRfOhh/KGhExlXFNZIU/DhbXCvq
 ukWUbnEIbqK4Z3372UgnAENYS/LMDRetPIiTpsyFDEgWCgylckuWCw6KtaaSdLeuUtOo
 yVBE4iRaARR6XgLYkSMehILLeyT4EOPqrcUCm8Bk5wCg5ypoBorFXl+PXr3OQwypnIQz
 ecBz6rZu0qQtM3yrygHOhjxR7F/DGrpNSiHE8cOU6mDvca+ouIB5KWvQT3xqYc9u8kiT
 JYpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDpRc+7IxQrhyfE4isUa28ZhsJqWi8cNiIlGHRrpnLTT1iXA+1K+g2iRcQ3MfFXENVYNxXYyi1aQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx/Tpui3TEFzMDtD25D/VThmAuZH27UM3v121WgZhG/JXbF/jB0
 UmX2gTXhoRqrYz8kxZN/6QTitGMOvDDU1euJGRbowapSRI+ykiKa85BmcRMuoobIIeI=
X-Gm-Gg: ASbGncuvk1D+LwJKdRcEWzNfr1H6/Ijm+X2j7/T8JFFmE8JFrS1gN1SHB5GCKvo4ttX
 wOrx6zJc9G6iBWK5hNf/qFgk4txuk5AhAqBAq8Wc5CUN8R9VWaQhNScjJBG+7Ynxt5VTvFlvkgX
 opvk2lUrIS75RxECq+LG7SaSml4l34aKtBCOX66uQb/FK07udwYKOfLdkgifaCdHgOMzl+ZjhsC
 9mhxAQTUYwwG3d8D3wxGhfqqfMjWGczGCWF3oCWqfMayvkGXyuajELrPe+N70GpgTvpurz88QoM
 ItvqdDIJk7VirDvQBdvpqLKKbW84Li4A51498V3tN/QaVBD7BAWC2qXVApVjjgOFK3zlHA+e/wk
 EujyC0UsE0L9OpdrUmtUHnOIWoCam/0KNAmKV/XEO5wCY05J3WuHzsa0D62pI/B8e9g==
X-Google-Smtp-Source: AGHT+IHS5JBgz12XFh4Pms9rWWreOWOdg0RGsxCm5m8FbvdHBGBOheq3B3llwNSbACPRBcti27Og6g==
X-Received: by 2002:a05:600c:4593:b0:46d:5572:547 with SMTP id
 5b1f17b1804b1-46e329f9cfbmr152466225e9.24.1759142354334; 
 Mon, 29 Sep 2025 03:39:14 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f536a3sm9375495e9.8.2025.09.29.03.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 03:39:13 -0700 (PDT)
Message-ID: <6fa15e3b-d63f-4cc0-bb6d-2614ddada4fc@linaro.org>
Date: Mon, 29 Sep 2025 12:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 47/47] tests/functional/test_aarch64_xlnx_versal: test
 the versal2 machine
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250926070806.292065-1-luc.michel@amd.com>
 <20250926070806.292065-48-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250926070806.292065-48-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/9/25 09:08, Luc Michel wrote:
> Add a test for the amd-versal2-virt machine using the same command line,
> kernel, initrd than the ones used for amd-versal-virt.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   tests/functional/aarch64/test_xlnx_versal.py | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


