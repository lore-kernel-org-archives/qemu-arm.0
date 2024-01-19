Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp970770ejg;
        Fri, 19 Jan 2024 06:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXh9McifCD5sOJ70XbHANvTqTWlzE608KJKT9TIGaKW6GeAnHc+wer8ToawXbYxEJ60PbY
X-Received: by 2002:a05:6214:d4a:b0:681:8349:5ac5 with SMTP id 10-20020a0562140d4a00b0068183495ac5mr2874819qvr.60.1705673916470;
        Fri, 19 Jan 2024 06:18:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705673916; cv=none;
        d=google.com; s=arc-20160816;
        b=SDP1vaNalhKvdHvKDbgZTh7mwPZUm1h+gYG15j9b79G4uHX6+/VnROgKXJorwap1Kv
         ZFgF38GZJL5VZGthyRKaqb90eCYfllQFboZVK08O9f208F/IVbK6FYpExCrR1eZ/tvT9
         G6RFm9iBpeDfVDdaXlU57QY63xBGHMpqjoFeUlP5th3zaGq9p56qJVGJQJEPunFQ6H6a
         rTIvSbW9IietbDr4dE6jMVJixvkO7QhhqDkVAxgspCFWEt5B90js2KSO1lJQYTM1hpym
         0aLBlsHeAGwhC5YmaUcQYpTGMoXVK3KFw6q4wM67ZXWQnxcWSNt8QjaJuNGgGP7w+HG6
         rzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LdG5jaCz3CuPMHwVp1yW7NI3VZWR2k8kO+EJzn7h2BU=;
        fh=DSKb+H908OatYWzmSph+6nOE5Oov1MfC7cpQUhFACZA=;
        b=hGvLxRmyoE1jHvdNEPoqoL9iUr88+cbrtz6eC9/51JnY5d/WwTDExW3VRbCKJb7+tz
         LH6hJGbR29+TVk6xaaGhxhh1y6OJDikl8q/AmqnDjCOFz2iVhaeKalDR4xeWkyQ0dS+u
         qCxZL4cwri22OakPV1cvZ1qy5ThZYeZaLpYah+Hlu8VsnvdduNehlsDKFwTMwx++LrGc
         QHuPBi9dQTCQRAQqEYGAaElxPN2V1dUzJrKHfklSsfgzRJltmnQwVt/X/VVSUCLtw3Qo
         KDeu0dDjGj7oxD1nzJlhyZf1rFXlBMsqWfxfB2EF006gPo13bx4Dk6RLlr5Ltg30JjwH
         UdZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mc+JOEfg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a0ce387000000b0067f234b2c59si16362408qvl.422.2024.01.19.06.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 06:18:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mc+JOEfg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQphJ-00067W-CS; Fri, 19 Jan 2024 09:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQphG-000675-0g
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 09:18:14 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQphE-00050l-AI
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 09:18:13 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a354a65afso756704a12.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 06:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705673890; x=1706278690; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LdG5jaCz3CuPMHwVp1yW7NI3VZWR2k8kO+EJzn7h2BU=;
 b=mc+JOEfgwGF/S7rChMQEeQYw3j2+L/VDYFZFSVqUK0dXxNWD8Kt71kJPCz7ujXr8ls
 Ul2OA4Z7srfusogBUCJ3w8CCokDPLYlHOIVHXK+72YEMMkZNkCA6n6pl1Wx9ENMeWyYO
 ajt4OQwxlT+pBCRgUDqjiiAJ86WJNIRSixS65JbT+/iMDZng/COg1TP2Jo2NsQskEmLs
 dixhJYpkef2zOq34S38FNyE9/2kMFPxf91YD4pK0wru23yjNzGHKtIjxQy7Nsbfu2h/p
 g7+AIlHrkk9TKVEK/iOrFevIw+uYDILR90fL3AFyQfgLjhXb5qoMXHg7tyXs8966LIHN
 9i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705673890; x=1706278690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LdG5jaCz3CuPMHwVp1yW7NI3VZWR2k8kO+EJzn7h2BU=;
 b=wsmUazBHR86fjEihgshhWJI9juECFrAtlukTEQ82IdefZTk4+1xxuujZkcBeOqspBJ
 1NpRRmu0GHGoOc1rZ+yulSuOuBPWzXtomVgRqACFkTzONL9S3EJtrcN2QuoVKuwnhjn0
 DJjzVc2MC6hUVc5HH4L9ZQH1w1PeBBf3OA5AIH36S/j3JuDACs9DEn+kaJ2YzpyhIH1J
 H8xHlJA8nZwJD4oe1eF4vD7l5ixyjovfw4byGV4n6Eqp0vZlGNsgyjarU30SLHEzCx3A
 UbTEBfmj6lQKDp0zuWbOy4rUZYXFevxQBycoj5WRGSiZfKjwnI3HZwdVwnR44XaVPC7G
 fE5A==
X-Gm-Message-State: AOJu0YytS0umgTdEUHTkBbto6iKnx9mjuuHplgg5UPueAlAgWHQKM+Cu
 c1LVk94e/HQ8OLBWuMi3Ruvc2lZVKeoOs6ox6IeYTHmEwMCPasWAykCIGng+c0l8uNDCF+TVXx3
 FpmtjDQ/jXS7zUHWYzFYa0lh0iGeFu5y/c20gzTCPp49DGxHQ
X-Received: by 2002:a50:fb05:0:b0:559:f0f9:76b0 with SMTP id
 d5-20020a50fb05000000b00559f0f976b0mr1642555edq.37.1705673890053; Fri, 19 Jan
 2024 06:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20240115043431.3900922-1-bin.meng@windriver.com>
 <20240115043431.3900922-3-bin.meng@windriver.com>
In-Reply-To: <20240115043431.3900922-3-bin.meng@windriver.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jan 2024 14:17:58 +0000
Message-ID: <CAFEAcA-ScRpBAcfbWg-kVF0bWv7DvbNEE+E0LB8z4pDF8CO2jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/arm: Pack the QEMU generated device tree
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 9p9uWas0LtAs

On Mon, 15 Jan 2024 at 04:34, Bin Meng <bin.meng@windriver.com> wrote:
>
> By default QEMU generates a 1 MiB sized device tree. Let's pack it
> to save some room.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/arm/boot.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ff1173299f..511ec10ed0 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -662,6 +662,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          binfo->modify_dtb(binfo, fdt);
>      }
>
> +    /*
> +     * By default QEMU generates a 1 MiB sized device tree.
> +     * Let's pack it to save some room.
> +     */
> +    if (binfo->get_dtb) {
> +        rc = fdt_pack(fdt);
> +        /* Should only fail if we've built a corrupted tree */
> +        g_assert(rc == 0);

We generally use plain old assert(), not g_assert().

> +        size = fdt_totalsize(fdt);
> +    }
> +
>      qemu_fdt_dumpdtb(fdt, size);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
