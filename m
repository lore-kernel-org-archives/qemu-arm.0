Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp463300lfg;
        Thu, 13 May 2021 05:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY1AopopGhxukXfwW/ZYw2lupcs4OhlS0nZ6EfsSu94vIgMWzgdjH3KiargsrBP3Dv0LrT
X-Received: by 2002:a05:6638:1242:: with SMTP id o2mr37701216jas.10.1620910233535;
        Thu, 13 May 2021 05:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620910233; cv=none;
        d=google.com; s=arc-20160816;
        b=I0hF8GJrZ4Qg0AXm0+0x1JriToO8Bs3+ZxBGvfRi7an+Pv+c/3yplhy47tsWoyLvGb
         7aI96RU7mdCXSSHwaw0v0EzLtWuNsFQPbeNKo0vnoS5YjFLZEzSUMQDvqhNu0+IpP+Bx
         9NrOYzAyOqmU3L2ju7/UQdJ637y6eGcP2RMU+m4/L/zzJo/hN/7dFRJ6H/taSKZ7sSzT
         VOL9C8TD6MZSX3ctppML6Pxh6ZzAP62gucir/YPYf5a2l8p55MHhvZ7LHVGqPmhUq6uG
         JcKxZHZAh1BGAxtduFiMRQ+QimmIki8PKTNc2mYgGmpdtFsur1kYXFSGNHKgXXcz8ALz
         lfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Apevnu8jvdVEb+0EmtIqoZ5Mjd89LFHnS//xI4S+a5I=;
        b=ml2qNOlq6O/lVUWPPGP3c/JXG3ErsXOLQrajbAIq0fJ5twwhGf649nJ1FMPrqJke3i
         g3jEXJ3P7jBdgx4Z8bx8B2X1imDU9lUC3M6KnOuf0xTZgmwwA2ScOiSjqeDBazEGrqZn
         YufQPGosXwVaH07PqwzI7vB5EtwS0u/w6sRbZRsF47iw/LAhiifA6b2MdXDEDe1LCqkp
         BOILuwRjKYyEM6X9GXfSCa8KPgWWCRyeaP30guRBx+bBDFwRp4qcDcMVx8DU8u303UDH
         4TsFG9oMAXx/RAPcUjt1v9NXBA9f9fsKWoVCN03eQ7SHh2F41RfIfbSySbrg1zNfiIMI
         sBAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hv57car6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si3310142ilv.97.2021.05.13.05.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 05:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hv57car6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhAnQ-0002fW-SN
	for alex.bennee@linaro.org; Thu, 13 May 2021 08:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAly-000182-2q
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:49:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAlw-0000Wl-GU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:49:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id t4so39757877ejo.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Apevnu8jvdVEb+0EmtIqoZ5Mjd89LFHnS//xI4S+a5I=;
 b=hv57car65VJ8RWL+sQOTWEi2ebqYCYz+4EnSnSPgWa8kvH5vDy5QqIkFrQVa/DboMJ
 boNCFNhvyRioiE+UGC6tkUv7JtuaZleMml6VbZUzIudSlPqD7iyNb9XzPYEbPEAZy9uP
 h0MtUzdqGvlkVJlVCD/jeEAWh4M+of2Yx20I29rcIimvs6AxtTxHu+2Shd0A5MMWU6qM
 eFq00svEyF7y0VyOPaaEHL/DPt+7bwnqbZiUy4Ccr4sjEiQZQ9oFLJY8DSqey61b/XE8
 BKRtAx90xGwWMwdARhYWFq4yfJXhcH/P+GoQyD4iMKORjSODs8xAM/ruDbUYodCJ4/32
 MK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Apevnu8jvdVEb+0EmtIqoZ5Mjd89LFHnS//xI4S+a5I=;
 b=L7WIoW5PQMRyt+xGOVuQvMR75M45JqbmAecJ48T/DwEa7mZ6uUS0BBTLHZI98lEzpk
 P71CP+HQ0e9u65oZG3tbD3FRtAxOApjWUqezIlFkbdE5bJf8J+P90MBUHFJopjNv8uOc
 E5WpEK8u6ZtBjjImSOT5hJqR/uAhbpv3tLlrXc74ZBhoS8fHPxYyI5xXvtxwqp7vQATq
 iqBICX9pxr+AsAWj7CWqOIzYE3Pc1T5kjPyx/gOr8Pd/JEBarvXWnKSawBOF3aXll27W
 UACs1CS3aKgbrpumr6j5gaIoAPSvconrW3GfMSz8d/UHLVrbNShAFkQg3gml44+ODb1i
 ZO6w==
X-Gm-Message-State: AOAM530MyHHQxJNrlUgyZ5I3eKhIv00dvxw4BHfRe1KL69EA4ja3AL+S
 oGaynukmB4Hvdh8gOL98D8KU7WHeXTmlzcYK8fcGBA==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr43013204ejb.382.1620910138829; 
 Thu, 13 May 2021 05:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-58-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:48:47 +0100
Message-ID: <CAFEAcA98vdxXAmXJz9gjG6u1FCLqUacCwR4dRXX+UmcZWmwNRg@mail.gmail.com>
Subject: Re: [PATCH v6 57/82] target/arm: Implement SVE2 signed saturating
 doubling multiply high
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JVngVRZo8bbH

On Fri, 30 Apr 2021 at 22:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        | 10 +++++
>  target/arm/sve.decode      |  4 ++
>  target/arm/translate-sve.c | 18 ++++++++
>  target/arm/vec_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
