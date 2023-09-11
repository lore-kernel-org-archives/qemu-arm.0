Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1312136ejx;
        Mon, 11 Sep 2023 05:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5qgHDwl8AtrvYWXUslSACwC1RsfAT9JPszjUccLGelwacau9Yz3aY3+YGngb9YNNVSLA/
X-Received: by 2002:a0c:f24c:0:b0:64f:7936:bcc8 with SMTP id z12-20020a0cf24c000000b0064f7936bcc8mr8374254qvl.14.1694435610913;
        Mon, 11 Sep 2023 05:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694435610; cv=none;
        d=google.com; s=arc-20160816;
        b=Pgxk9LSTfr6LI4UtZYJirTFklMWizuB+fHu892WTeBz9qdDzTz4gAM0k8LH2Tdg+85
         1sr0nymltGlhaUhBzish7+1RNPyoJG5LWBi9DLQwomgEXJeQIHppwwFaH4HaCJQHHzYJ
         TzA7haOtm6ZLO71o2ZEgLWFNUDC8joyaKaGm6QjWjriAnWNz4iiEVVAfXmjuCFV70WoR
         C5AkjQv/IHzEdSkavWIps23PbuTTtvUMIfP59TxjuFVwXwO0zzAoEDszQjm2gR+nXJ5a
         7ehOO1OCyBQWece229G03bYo1BqRTkK7ei4+VzPfA1kH7FwMUxkNCwJc3sYWvM4SN24/
         yR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=BVn6BJgesLqwgvKO/B1sFSsI2BoPNt3jQNcATtptTYU=;
        fh=mIJGsCCezl/E0qHOjEsRVAduFTIo6OTQPvroE0vb+p0=;
        b=G4r33OLxrPHNYF+mt2p08JTqyQSDRe+8GrJ8J9TluD8rTNseMEBKJd11bRaUktlN+I
         zE/sLdqQSQM4kfOaFrkusFY018RhZpfO2ZCwh5Vi0mTkRWF2zOFheczTBBeDiTPRpT6T
         yZBG4If87k2AR9veEjqIxi6KnSPKwZKlPZmUweQ01nz8hAdSnkOKMGCbX3lujRJ/PWb6
         felSlFJiEESLsgRL89rgSCMEUdrKPK1KPV0cYi4b8CkKyXu3EP7AUJEL5ML1Kdq4XPL7
         CyGTA1FZwt9ObKKMV1LeHbzTgSwvmdaE7dKIYHK9ainM3mv9u/7a/v1Xj9NOmS0bUTf2
         Gs7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a0cf2d0000000b00642d72935e3si4707117qvm.298.2023.09.11.05.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 05:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfg6U-0004DX-Bh; Mon, 11 Sep 2023 08:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=62xJ=E3=kaod.org=clg@ozlabs.org>)
 id 1qfg6S-0004D2-V6; Mon, 11 Sep 2023 08:33:20 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=62xJ=E3=kaod.org=clg@ozlabs.org>)
 id 1qfg6Q-0003aC-7j; Mon, 11 Sep 2023 08:33:20 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RkmMq5M6Gz4xF6;
 Mon, 11 Sep 2023 22:33:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RkmMm0xXPz4xFD;
 Mon, 11 Sep 2023 22:33:07 +1000 (AEST)
Message-ID: <cd44fbf6-135b-3ffb-0af4-d38381ce79cc@kaod.org>
Date: Mon, 11 Sep 2023 14:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 10/10] hw/fsi: Update MAINTAINER list
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
 <20230908222859.3381003-11-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230908222859.3381003-11-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=62xJ=E3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ng+LFFlVq9PO

On 9/9/23 00:28, Ninad Palsule wrote:
> Added maintainer for IBM FSI model
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> V4:
>    - Added separate commit for MAINTAINER change.
> ---
>   MAINTAINERS | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6111b6b4d9..285f3a3bc9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3395,6 +3395,28 @@ F: tests/qtest/adm1272-test.c
>   F: tests/qtest/max34451-test.c
>   F: tests/qtest/isl_pmbus_vr-test.c
>   
> +FSI
> +M: Ninad Palsule <ninad@linux.ibm.com>
> +S: Maintained

Excellent !

> +F: hw/fsi/aspeed-apb2opb.c
> +F: hw/fsi/cfam.c
> +F: hw/fsi/fsi.c
> +F: hw/fsi/fsi-slave.c
> +F: hw/fsi/opb.c
> +F: hw/fsi/engine-scratchpad.c
> +F: hw/fsi/fsi-master.c
> +F: hw/fsi/lbus.c

This would work the same :

hw/fsi/*
include/hw/fsi/*

> +F: include/hw/fsi/aspeed-apb2opb.h
> +F: include/hw/fsi/cfam.h
> +F: include/hw/fsi/fsi.h
> +F: include/hw/fsi/fsi-slave.h
> +F: include/hw/fsi/opb.h
> +F: include/hw/fsi/engine-scratchpad.h
> +F: include/hw/fsi/fsi-master.h
> +F: include/hw/fsi/lbus.h
> +F: docs/specs/fsi.rst
> +F: tests/qtest/fsi-test.c
> +
>   Firmware schema specifications
>   M: Philippe Mathieu-Daudé <philmd@linaro.org>
>   R: Daniel P. Berrange <berrange@redhat.com>

