Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10244935lfb;
        Mon, 3 Jan 2022 03:51:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFS0261DepxqSP8K4ODfjmhey8+AUbY79dJuJPE72TNIsuUXi39lNjrPwNEHZJ99t5WMgm
X-Received: by 2002:a25:cc4a:: with SMTP id l71mr45062511ybf.350.1641210718088;
        Mon, 03 Jan 2022 03:51:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641210718; cv=none;
        d=google.com; s=arc-20160816;
        b=JgHl4+6oFba/WUizIboZaRTgBtB4a73KrHIHv4icbh1+TwaNc3tDS723qZw6vxBTqW
         9CJdxDycVFlMUBJiCmT4fQOib3d1u5UsfYgefawMdDFXdWs3i86uR3h/PIdeHtmD7Zgs
         delue551orOExKJ1EoYTtvyXUPuZxWRCrr7MTR6LCRmDK24bhFJMu91smCkh29bbfKUD
         +ES2rYLV/8OF1B9OurZVy139nAL3tSpPW2w/90aN8Unhry7ItTRxwcJWdas+6ifxHOg/
         iKE/g0XsEIAGff+XJbNF1hfNeyMSxZhIC58GNqLnpvDnxLI7MJfUnlTo0VxSN3vhcgMT
         T0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=63ZFdEOtqSvg0xZjqAggJ+4KpQskQfk8HGyey34Y54A=;
        b=jPAz/ELrJPiakbFX8Gi+G8eBR0yAJYMjUtAeMhryrym6i5h/GPT1WhTcZqT2wuePV9
         1lGI9TujlOzwmMSM/pbGvgb4zwqpdoTJFPgTuWnWOELKmr04MRA+KDOmRlS14wV1rlSZ
         MH4L5RJaTYLR/kkgykCcsCuUuqyzX6erEDRr/zcicrPXBLiP/YIfsyL4r0mu0rp90/JL
         iVrYKvsgS4wHQpkG1dUlDqMEmB7WhWYsR9xxelu9jurQlr5fC2eNG9IXNLmQSPwRoQPB
         Z5Svw7h9bmLwJ+q0dY1CjTVbShqZYqMsPqQ40XJRJeNggQ7hQuQFs66qN3EMsTkSv/ku
         Uppg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=USj7Ot2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r205si24409947yba.815.2022.01.03.03.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 03:51:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=USj7Ot2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4Lsb-0002hs-G2
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 06:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4Ls0-0002bs-Cr
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:51:21 -0500
Received: from [2607:f8b0:4864:20::52f] (port=44977
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4Lry-00058Y-09
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:51:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id y9so1430459pgr.11
 for <qemu-arm@nongnu.org>; Mon, 03 Jan 2022 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=63ZFdEOtqSvg0xZjqAggJ+4KpQskQfk8HGyey34Y54A=;
 b=USj7Ot2eli294rX9yBx55eVstygJmoNtDbVRmNautaLD9A4FtvvJljaXjHLNdEIR07
 2NL69oDrx/wGlJrjEZ435ts9h4oSnoEMvrXCleWMyDnS75xdMklop4DiIaHV/zc2xGdO
 bCOm5XGPV2OW26de6YIfWHnmmeg6uZtL52meqKUttQlkkZ8LHZ6OYdElmSy142Nh4oRJ
 zuh7V0e67en32CTa5wun2OLHhUZ3qWodvUVGQluJ8DyebLH3Sic2dAKouWpaVj6HvhRj
 6SJtnIlwetyfGhtddXAGdR8+GnbXpbBqGBPzmPhnJF3HbDK6YsFmTEJGMxFk1nbZde6h
 8tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=63ZFdEOtqSvg0xZjqAggJ+4KpQskQfk8HGyey34Y54A=;
 b=kqIVN8MhTi0F/RHigSMr02VW9+SJkFiNOC7cZUjDc0pzWalbRoo+SDYeMvwVfSfmjv
 dPSuLVHnAJRLyWTSOqL6gCDb+otqCNBkq7srAuanr9T66AXxBaiBYrgaoiAjipy3epfI
 y/EPAcZb4AaFDPxYyMQtg0QshZq+qrgMvykYZDcmsLAYZzUn3tK9xTBppAVty9bTWALB
 ReppzANO/J1hItnzZHeuZuzJOXiFoqRmhwr+ciOiv40V5eX0Z1dWM2Q6bAwW68GEpRE0
 oHmxcmNWlnLc1x0zAWxdRAlcH3TyPzC+galD01+SMKe85Jt393TsHpAyzSL+DaPmuWPX
 VJXw==
X-Gm-Message-State: AOAM533fgwLuoBovpvuvdKPfKQ3OZVpghkw1qNa1wDgdjrLPhzcaMaRg
 vaun/AQSunIAsIEyK666DtQs6w==
X-Received: by 2002:a05:6a00:853:b0:4bb:a8c5:873 with SMTP id
 q19-20020a056a00085300b004bba8c50873mr40374634pfk.2.1641210675178; 
 Mon, 03 Jan 2022 03:51:15 -0800 (PST)
Received: from anisinha-lenovo ([115.96.198.244])
 by smtp.googlemail.com with ESMTPSA id
 s12sm42009749pfg.148.2022.01.03.03.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:51:14 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 3 Jan 2022 17:21:08 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 5/7] tests/acpi/bios-tables-test: Allow changes to
 virt/PPTT file
In-Reply-To: <20220103084636.2496-6-wangyanan55@huawei.com>
Message-ID: <alpine.DEB.2.22.394.2201031720510.14895@anisinha-lenovo>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-6-wangyanan55@huawei.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1/UDBpTPyitp



On Mon, 3 Jan 2022, Yanan Wang wrote:

> List test/data/acpi/virt/PPTT as the expected files allowed to
> be changed in tests/qtest/bios-tables-test-allowed-diff.h
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..cb143a55a6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/PPTT",
> --
> 2.27.0
>
>
