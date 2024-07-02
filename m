Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1994975njm;
        Tue, 2 Jul 2024 07:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd0xiP6ni6ypLHn0ytEQwtdEoAPvKR0tSEuDakkKJvMeo3DKk53RhGvsuAp57EQZhsf/BBcF+skw5NrUjGSb+RuE0yQnIj
X-Google-Smtp-Source: AGHT+IGr/AISg1E/EOgskHCvfdqYznv4aiTkhowdbHSCe/akPwN/QrHKxa+QB+xUC5I1r5FSdCZ8
X-Received: by 2002:a05:600c:6b19:b0:425:5f90:ed4a with SMTP id 5b1f17b1804b1-4257a026fb2mr72014055e9.35.1719930016314;
        Tue, 02 Jul 2024 07:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719930016; cv=none;
        d=google.com; s=arc-20160816;
        b=c0/Ujh+VaDNpNNGP4Bf62CnGp1ag+hMldO+oB83PZJwgBVBIFKJAb/wCVGzi4HRu9A
         HyZ057r8PRs2Xb/IrgQZ1d9mmICW50gedDA/iFTgAkF6NWgdrHCq8a2t1CLtq72S2u1w
         k3acDZoaK3gAbGpwmfCXHeCK/ikQrX2K/kwbuCGFCxdB+yNxp1VJzfVlEB/8mBO0Pswl
         zL30NKTuVD8k/ydwav/m7Gg/1iAXXdmtJBjkosNIp2bkCFjivJmDe4lJdo+V8RupnK6K
         jJa3VcYiyjsjqLMErosYOTluJZB7JaIqK66TtAOToQCC00ZVhJhjB0Ly0URmHDLAoMlj
         ppwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=AJcOuoaZTXCS3XJ53MfbyiFyJNSesiJcfbEwH3AS1r8=;
        fh=BTnPzZJ1+AYidJxTInyBBzHVTksBxUqubakG/q1+YVE=;
        b=ml/XJTv37e77Wk9DEfFiBnhpc8hNa988qwdmQPZSkh3YM/DLiu9jmnklrJJBjoLrWb
         y39m+5ZcCXuUNBdSiNrl/cV3IBiYnwgVf989oEkWfbhPNV+vv+nDPXQ/b+LizQH7RC58
         rB+RPu7eyeoR13rcg49ga+bk3kK2rLbcqcGcdVX4gx7d4DVCGA4MD9rjJde0f4U7Waf4
         PXlpT/iFbAHP5iK9okvrfCOVPVopHjEfnJwzNB7RqV9q3Hi5EnAg0X7XPCH8UgEy4PjE
         HU6Rz7lFrxaqiVch/p6whzV4J8N2DErRy/n9003mzAjN78WRXzx7qOTZJRWLsP45+9Az
         2PFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4256f208e90si54375685e9.61.2024.07.02.07.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOeJF-00010Y-UR; Tue, 02 Jul 2024 10:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOeJ1-0000Sb-TH; Tue, 02 Jul 2024 10:16:33 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOeIz-0006qc-5I; Tue, 02 Jul 2024 10:16:27 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WD4hj24kcz4xNs;
 Wed,  3 Jul 2024 00:16:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD4hb4Ngnz4wcS;
 Wed,  3 Jul 2024 00:16:15 +1000 (AEST)
Message-ID: <d9707ffc-54c5-4071-a3ee-73501a364911@kaod.org>
Date: Tue, 2 Jul 2024 16:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/sd/sdhci: Log non-sequencial access as GUEST_ERROR
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Patrick Venture <venture@google.com>
References: <20240702140842.54242-1-philmd@linaro.org>
 <20240702140842.54242-3-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240702140842.54242-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fXIt=OC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: nSwnWVwZjXMR

On 7/2/24 4:08 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/sd/sdhci.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 27673e1c70..d02c3e3963 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -983,8 +983,9 @@ static inline bool
>   sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
>   {
>       if ((s->data_count & 0x3) != byte_num) {
> -        trace_sdhci_error("Non-sequential access to Buffer Data Port register"
> -                          "is prohibited\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "SDHCI: Non-sequential access to Buffer Data Port"
> +                      " register is prohibited\n");
>           return false;
>       }
>       return true;

