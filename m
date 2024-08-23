Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp177150njb;
        Fri, 23 Aug 2024 06:12:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdeCkA8mlgkI+PTbmIW1Ana+OwCFQ642/WCaNKEtabSJhRmr8cONDS77vjdBLEaBbUsH/0alzWbNo27A==@linaro.org
X-Google-Smtp-Source: AGHT+IGrGU7RMTFXJm5CQzXg2BOaGK5x+Hx2joilKk8cI/XNNqE/DtQB9XnV/jZaAIGG5gvGIMup
X-Received: by 2002:a05:6214:4a0a:b0:6bb:be08:eb5e with SMTP id 6a1803df08f44-6c16d444e09mr42332166d6.4.1724418725141;
        Fri, 23 Aug 2024 06:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724418725; cv=none;
        d=google.com; s=arc-20160816;
        b=B820QK7NLVxC/aLBCNrQoXnCPJFh+L+BYPybODvvhA5xcks61mJbZ/VyTGuKbsUWPY
         I2X31Vz0yxkblhuT/XrJl7ZYaRS5w9ecykcd3YMhp+nfMm8/szA9+en++5pbcy901q44
         9CSP3sk8wxhekkho1B37VNHMG3tbPPCwYFBOEdjKblfbez8xZJfxOn174g6GG8jchAmB
         NtFnvwBvBAmEKPVAgFOfy3tDMudtJdWubTRuIk8nULf00GyStavUyuTlzHxiZaBCsvvT
         D1BjZobK0M14Pb2+96sXk9JETxhjYGRxQwt1H90a1XO2x8GKmkRSGRu1ZsQYZ5uhuAkS
         5HGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lVGOgOzktMb5RnFaf9kIgY6hEZ8amRY7ke8GleKQBFQ=;
        fh=bd6JYs+zsWylHr8uUdIOK32CzPUgRjMqojZbfvqbqVY=;
        b=o47DwtSbtP7NgLoTpO6/S7rLbDVcVpZHkMvuAYOrI9+uCzFM4FCRdzYPyjdvvSiXrc
         YCYzTQqoT0CXRn+suga1B57y1Tu4fahk30I2e1TS5jnWgPFmyYbXUuL83fnskzDSNQKS
         aA0YbEXHuoI4yfTgBsoDCLI2YXVIgtLc9n3rI9nQM4jCpa81HxfD8+pgMtZ3zYbBaFZT
         tdiM17EtX8necIvAJobi5Kk9pV0U+MSkrlTqeeT3mbW0hOTn2b32ZXq14v0pRsO6SwxW
         8SEcx8tj1in+uUraO1deGVpa7HlJ7TOmnyylZkA9fxCK1nv3F+Ml6MXWAnqBUTx/I+0t
         KRgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Cjik/Vxx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162dd4b0esi42786886d6.342.2024.08.23.06.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2024 06:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Cjik/Vxx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shU4k-0001E6-TL; Fri, 23 Aug 2024 09:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1shU4i-0001Ca-2n
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 09:11:32 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1shU4f-00081Z-B3
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 09:11:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42816ca782dso15094625e9.2
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2024 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1724418687; x=1725023487; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lVGOgOzktMb5RnFaf9kIgY6hEZ8amRY7ke8GleKQBFQ=;
 b=Cjik/VxxIZMESTXF92FbJsZhM1CRk/FEVD1HW8zIiOIAmluwGhFgYqZovtWGLCVqOI
 3XEYbe6AEE9ZleL74Cxk9DQjt/xz5RE90lX41fO5nvL2fVfgFS+e2GlKNLzTj02Mqdwh
 7RLAitC/KjeMW/BORspwbsOUP/Tb5GntTNQu6Pqv3p6Sf5klVIV5gNEJwtuLKJTSvGBN
 WG4kncjZ1MTMcH+WSqBCt7ilAmERBQZdneztjzN/IdSeF+9MjsphhrFS6tGBDX9RsIvE
 R7FpSO1utYmJj3NOY6nI1W90B5r76K3CTwb0Su0caJSADi8GX2RghzbFBAnYcCDJ7dcD
 AFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724418687; x=1725023487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVGOgOzktMb5RnFaf9kIgY6hEZ8amRY7ke8GleKQBFQ=;
 b=FIA4IKmLcZyjYKUVg3zfri5tqur0Mx6oaS3H8oa10CJCMGTT+6//MmVojl8HVDH69I
 sCj5BH5efW7dACqHgmbCmzqfvgvKmbs8jzqAK/HKyb0OFaapTluxAwJBFlAmrINCIai2
 bsXIf9k3a5F1VToSUAk+w44KIdpuVD9w3gHMoRPlg/VumXkZ8OyYtuL1oAcXR5YdVhfC
 MrkcU8Teglf0WpDp29eYbIeWvlkhEWcVlU14M8eE5q5Pjr2im9nHtXaEAmBzoSr5AYKc
 gQgMEwbbVIPDDsHK3RfD7ooivQDYrJOx/w4cPcg+kSXsS5cQqt/iNiUwuznpyVfjHjI8
 evew==
X-Gm-Message-State: AOJu0YwuZfYHytxt2PoEShM/2od0gNKlOrUzU/pjEV6qUvYYxoduVVv1
 lpZkP3GxC9Ps272ZeF2A+tPU7Fsc4c1gVyOt4ykneQ7PGMUhAp2/D3sjiDgSAKo=
X-Received: by 2002:a05:600c:4ec6:b0:426:6153:5318 with SMTP id
 5b1f17b1804b1-42acc8dd87amr15279815e9.19.1724418686980; 
 Fri, 23 Aug 2024 06:11:26 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac514e071sm60228325e9.4.2024.08.23.06.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 06:11:26 -0700 (PDT)
Date: Fri, 23 Aug 2024 18:41:15 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH RESEND v4 1/3] qtest: allow SPCR acpi table changes
Message-ID: <ZsiKc9TqxDp-GVCR@sunil-laptop>
References: <20240823113142.161727-1-jeeheng.sia@starfivetech.com>
 <20240823113142.161727-2-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823113142.161727-2-jeeheng.sia@starfivetech.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 9CHm5ypW9gmL

On Fri, Aug 23, 2024 at 04:31:40AM -0700, Sia Jee Heng wrote:
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..aae973048a 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/riscv64/virt/SPCR",

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
