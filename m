Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp141955ejb;
        Wed, 31 May 2023 20:08:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7V5SJnZ6YkoOCETrhfBKhTIDEr8nenWhYBrDqBaw6zf7d95ZKheuTd+8jZ3Wx4R7Sr1A3c
X-Received: by 2002:a05:620a:424d:b0:75d:1145:8151 with SMTP id w13-20020a05620a424d00b0075d11458151mr646241qko.12.1685588907162;
        Wed, 31 May 2023 20:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685588907; cv=none;
        d=google.com; s=arc-20160816;
        b=EIrEDcmwus6qftj56ZNP5Dp4Wm2/Vpg+uTOGPMVVtk+PXUHBcnP9QmRmlkMgK4W7gz
         GN56SMXDv8rtG1nWvM2qg8Pxy24OAbK115/fx7iI8y0KLYkI3Xy1JzNXMnyAqW4pDap8
         m7RCvWM7T0z6eQezN12M+1+LNkMibFjIwYUuRhEYdkdw3cvqd98wviOBHEVcLdcS0VsT
         TGQAaYTT2a17ld833jaGrKZ27cCGCUCbKFKakRbZXiimFa/ZXo7cnwH/QM8xNw1DC/5T
         DY6h7i4ED/0Tc8mJlQZ5SYVAvPaXPLUsPRWNHCcUTK8txCPCunJ6STXYWFFfupYhR6R4
         9K2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8KfAGvtkr6GX96m1nAUrNOzhHmaS5FcOXoTr5uMDWus=;
        b=QGx9i0gI5wqUG1/tQ77K4JOtDuaRfVJyw1WS2jDqMcXFvL44OckFSdNOZ2LOPECHwo
         8GM28t+bAVOXch/eXcTyOpPNcLVLgSZkNtixXtJ3Q+E3yGhDLuxVEd4N6nvCgjd552x0
         r0W/DsJiJqdBglcoceGv6iF5x8vfbRfH/v86uRPCqw5ggOYBLkre45rzmpu4Mt69skXA
         556XsyKGacpbe8+JBSMIk2jLYRgTmnSXvno6t51peTNf7++Lt7OifyYxIiNWk2nzJ+OI
         2LtfER6icDQqAo/25WVlj2ZWwyEBFnulk1sZwCBl2FqStXRfVUA2W/DxJdUwvIN8Jqe9
         e+sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDj+H+w7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id da51-20020a05620a363300b0075c28678407si1339543qkb.420.2023.05.31.20.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 20:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDj+H+w7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Yfl-00022g-P2; Wed, 31 May 2023 23:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yfh-00022B-KU
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:08:17 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yfg-0001E9-0u
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:08:17 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-52cb8e5e9f5so321642a12.0
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685588894; x=1688180894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8KfAGvtkr6GX96m1nAUrNOzhHmaS5FcOXoTr5uMDWus=;
 b=yDj+H+w71wc+m+G7Dg03ysbXZtnOa4mhnzwXH3K8s80reOFZS3jh2WP8i7YFiIP1xb
 gVG8aFUhpqIFzuEncARIt5EtcfR7uHLVLTjaEe/ow/XsvVN6qwxjDeY88AK/F8vIjKeN
 Ms7c+yAsxBqD0WJz+eAoFVU3/ZUNnWCrFuar7wFNsi8vjFNlXjio0QjiVd5t4nuCpHuf
 22EhJWLp6qTHH4/F4qkY+QUhAY4VZtdSPI3dTn02k4o1sCvrJU5LX7CdLE6j3AWocdPe
 B0Qs6lH77C0LZxKX5yHh8I1QdSzCWCwEvZb55jYWfLzlYQT125foc6MvVWAu1m8IC4Ca
 JRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685588894; x=1688180894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8KfAGvtkr6GX96m1nAUrNOzhHmaS5FcOXoTr5uMDWus=;
 b=kwAid4e03KCVJMJx+iHOfGYQ4EFE31OulIciW37ebi84GDF5ZdPeMWC9x2XOZCriP/
 J/Gtg7NxiTdil9cMhly2lJowpXc5LyESlh6UGeBeXH6A/EJwClHHi31Tv5O+fkLTQgRZ
 4T+usiZ+DSlVrCT8021jBNBQ4JkE/0xzPGz9CTvGdd5I/yhrDIPWb71xumzorVB4Txkr
 +CrEI/IaVTphRiODuH7n7pyE73xtYrmqAhLe+eLdS9PDNEQT1jtagNDSNvhCuslOQQ09
 RftTYyR5646yzFc+B7SzUPK993Fw4En8BpXzQXEccGe73j9+CdGxgusSytiZjGEu2XY+
 5yjg==
X-Gm-Message-State: AC+VfDxUsy1dqU5Cj/uRJRJra4r3BPq2rlpVZ0KdrOWOKkm1Cs+yQ9Jq
 pFZuPJl/PwqDvXS66AeONZysvA==
X-Received: by 2002:a17:903:189:b0:1ad:e2b6:d2a0 with SMTP id
 z9-20020a170903018900b001ade2b6d2a0mr679882plg.11.1685588894419; 
 Wed, 31 May 2023 20:08:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7?
 ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a170902a50900b001add653dba2sm2135653plq.108.2023.05.31.20.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 20:08:13 -0700 (PDT)
Message-ID: <5c0d5d77-aed9-a6dd-b4c5-af2cdded00b3@linaro.org>
Date: Wed, 31 May 2023 20:08:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/7] hw/sysbus: Introduce sysbus_init_irqs()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230531223341.34827-1-philmd@linaro.org>
 <20230531223341.34827-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531223341.34827-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: 65TikYElcb4V

On 5/31/23 15:33, Philippe Mathieu-Daudé wrote:
> +void sysbus_init_irqs(SysBusDevice *dev, qemu_irq *p, unsigned count);

unsigned count does not match qdev_init_gpio_out_named int n.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
