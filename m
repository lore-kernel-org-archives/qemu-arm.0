Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1563730ejb;
        Fri, 2 Jun 2023 20:33:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RQFCj7xSW/db6F87bQ4YwqaubHX7A9LpcYBXQyDjWCGrXzE/tKuJNkFCOShWk6qiHkRDH
X-Received: by 2002:a05:622a:1892:b0:3f6:c0af:9213 with SMTP id v18-20020a05622a189200b003f6c0af9213mr628098qtc.15.1685763188804;
        Fri, 02 Jun 2023 20:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685763188; cv=none;
        d=google.com; s=arc-20160816;
        b=DwXgR/xREwsWHeAnU87ofS8vKsqaFLWjN9z4Tk/aCKWrY9SDLZkGDRvyxcc6VcgdcJ
         Av25oJUT1GTqvfLyM2phOO/FIXYb3w+zIo+hJRNBDY2di4WKFBPEiond4U7mn4wm08Cj
         xJneuYUWhrHOWPc/Es7LnnUsfMD8SjlJylhXUNYcT4pPxwdVRk6uhUsdbR8bxv6NbnU0
         R5wlxlP20WX1Z1X/RfWEQ1TFkNuv7/PerasKsYXbolRQqvj8Cdx5rrED3j27trZp7Xyn
         oGgDH0gGmzrZrZno2PZfr3Za8c7MxPfoCng5iw70ICDl/khI0Tl+tpfQJZATctZtepKV
         qyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cQdoEU1YQjw3fKrTJSosmhfMRKRdHVRUZJOz114GVCY=;
        b=tZUCYUPBVSZrw1MmcMgJMW07TSE11WBvn0GZDkYhFyhxQSMO8C4GesrtPdayRvFhNl
         mEcG7B/de2meuqebJVO01dkFlxFa1MAVbOaOOQAcyAhxZvDahIyha+t3uzH474m9iPGY
         D6Uhuz2pZNprtmBbw4wOsN8HGgbOpIoz1B+gqlAl2Thv/gGGze+/ww5l4D7PhSJ8EV29
         wDGrdA1BmIz9KEW+QZU/H4YTT8z0EewtSPeHWSXc7PjEmxiUK4R9q4WfXoAC/cnxWSNI
         41vRrsdW2hvr4deFLFxyfcfVNipCsV5rWLoM//simmqASrU2AF/l6ZqGtPh0LPD1+of7
         vy3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htxCZihb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj27-20020a056214529b00b006211a1249f7si1820650qvb.450.2023.06.02.20.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 20:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htxCZihb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5I0g-0000vQ-0G; Fri, 02 Jun 2023 23:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5I0a-0000ux-KY
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 23:32:53 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5I0Z-0005vn-5j
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 23:32:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bacbc7a2998so2947348276.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 20:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685763170; x=1688355170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cQdoEU1YQjw3fKrTJSosmhfMRKRdHVRUZJOz114GVCY=;
 b=htxCZihb4MyjX2myWSe/UEcz6rVrnKU/YXJywdgCnQtAzEs8R0ecPL1CXe1KQzaf6A
 66izbG7km59hDO4ZpKQJiUBmMlJyKnzQ7yRiYM75/3IN6TFuAhbnbB/st/FEcs+pxzlK
 fnJl4EOh62o8kBZQKkGVicjd+32NzJ6gg5cns8irK6Dq03+3uItKOzaql3WiU3sGaIcS
 Sknl2r0dWu380vkDRSsR2mATP70CIeA7yz+0lvDNlHIsYTm0dNYles527vkuWbEZknK/
 HBuVlxHYLFlf+yIzX9fBWiBJK1dQpMx2dMsBTR4PoRIaRsver9VvPV4Pgn6I3rPYcd8o
 UWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685763170; x=1688355170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQdoEU1YQjw3fKrTJSosmhfMRKRdHVRUZJOz114GVCY=;
 b=eoEkWHZJ17kMUb0zTbKSzaS5T+azQAFa6gs7UoeZ8O5lDHsRPipu819iI6TWH3zX2g
 E95udOOmoFohQw4c0uFcnoVZ2OpDaf1zpKKMwjVTk7fFzgFdFV2NbbHbb220LzA6NZmP
 DMyMWh00ok3dZJ1B4Uq4TRZdKpplB7IrpXwpqwWh4VxKQsL9rjsp4CjGBQv/SqqV3c0j
 Cqlpx0XIxro65urA1zkVAD02hfsfNd75ZzCvlWH/uFTJuS6NXM9y8Z2zsBWQ1uZL0xWK
 ic1ldP0I4fghjd3/Dwpxsqc+2pXLTxJS2o4EVPM8RkVY3PpmDWv6zUR5Rt79rsxhYADi
 s3kQ==
X-Gm-Message-State: AC+VfDxuOe7T6hCIYh68cBJPaRqpfs+up5GZlhK+s4Z4f7skRWYRu/jM
 NyNcb3Nf+r1To/MdA9dEBedIYA==
X-Received: by 2002:a25:ca07:0:b0:bac:b8bd:65e2 with SMTP id
 a7-20020a25ca07000000b00bacb8bd65e2mr5432029ybg.37.1685763169985; 
 Fri, 02 Jun 2023 20:32:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a170902869000b001ac591b0500sm2082971plo.134.2023.06.02.20.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 20:32:49 -0700 (PDT)
Message-ID: <f2e110a0-9e35-5576-e4d0-91c377fbfd08@linaro.org>
Date: Fri, 2 Jun 2023 20:32:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 0/2] target/arm: allow DC CVA[D]P in user mode emulation
Content-Language: en-US
To: Zhuojia Shen <chaosdefinition@hotmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <DS7PR12MB6309FD700EF00EF1EB541CA7AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <DS7PR12MB6309FD700EF00EF1EB541CA7AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: oz5yHlsWoAOY

On 6/1/23 14:53, Zhuojia Shen wrote:
> Zhuojia Shen (2):
>    target/arm: allow DC CVA[D]P in user mode emulation
>    tests/tcg/aarch64: add DC CVA[D]P tests
> 
>   target/arm/helper.c               |  6 +--
>   tests/tcg/aarch64/Makefile.target | 11 ++++++
>   tests/tcg/aarch64/dcpodp.c        | 63 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/dcpop.c         | 63 +++++++++++++++++++++++++++++++
>   4 files changed, 139 insertions(+), 4 deletions(-)
>   create mode 100644 tests/tcg/aarch64/dcpodp.c
>   create mode 100644 tests/tcg/aarch64/dcpop.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
