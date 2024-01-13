Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2932511ejs;
        Sat, 13 Jan 2024 04:28:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbRX+iQFquvqd2vjCfbFmzxbno4oo20InqgSs79G17iDOhiMBREJGgVfNGfDzEcw4PRJcb
X-Received: by 2002:a05:620a:4050:b0:781:a0f5:c94c with SMTP id i16-20020a05620a405000b00781a0f5c94cmr3648224qko.84.1705148939393;
        Sat, 13 Jan 2024 04:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705148939; cv=none;
        d=google.com; s=arc-20160816;
        b=CeDUbwqUSgKTvm1PfAVqrhbR7Vk5TImA3V9vF+DooMyBrDAYFznqS4HrgVRZDJfdEP
         +hck7iVPvILzqFuWzb5vrEnSeMGrATXClTvJ4vmpW5BQcT3l2glAhkus3H7y51jRqcXx
         15McpV4m/cTOpSTWvrDz+Snx4M5CVe8Y/QeOFIPVj3c1VMMDyqGjAdd5YNt+r35P8Cgw
         h5eViaq2ZHVUMl2RJiwI0pVtRuiu+rNkSjXKw3ULBnU+8ZF1zD6P/ur4p115a5IKpoYG
         LJZDd1QcRGfyxKDrkFQXEGpaI09a5sJXbD8a0/8gpndvfyZR/r1AsHf/eBuA42nWyc+Q
         WmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3JrSPlo67QqaghArN/ohSzkKAPbmcNxd8ZmhQFLdIZw=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=ZiNjiIN/f5IMCL7gRn6IbF4XAYR9dAy7gRhaowcObpCQ+N0imU8EcZbOKDZkjVoZdc
         NHAXmjJJkFjMtqgXG/WsLfOeG+fWan7bLEDj5bFh0/QaYnaVnwdU9AiyKx/FBEUHF53Q
         eRJiuqmjitkt4U7+HcCEu9usEXXCy1uv/Nn88Cpwk0be30HIjrJvtOUy8Hu/wMNmIwkT
         2EZNG63HGx6F3LVWRtr2DrSISDZdPyRjvSPpDYJsvub+qRPW12Un5tsW9qRYJH+h6lA+
         xaUB1YHYHd/QhhgvRRCd5eAiiSolAKFgVX7iMLzREqP2Ewl60rLzLegq+6MWLO817sLN
         Se1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsIKlNwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq8-20020a05620a468800b00781706eb8bcsi5201987qkb.155.2024.01.13.04.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jan 2024 04:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsIKlNwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOd7e-000114-F9; Sat, 13 Jan 2024 07:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7R-0000z3-UN
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:28:11 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7P-0007oG-Kf
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:28:09 -0500
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd0c17e42bso83374261fa.0
 for <qemu-arm@nongnu.org>; Sat, 13 Jan 2024 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705148886; x=1705753686; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3JrSPlo67QqaghArN/ohSzkKAPbmcNxd8ZmhQFLdIZw=;
 b=QsIKlNwCPmj+cabXd3vEgJzinhj01FUALyiKPwTv2igNgsZNoe5EHhomhGzBPI0icA
 y/pOgkCWN2Osta5M0a9gvdFgHBtEvqvkDlDRiew275sGkmkh/DiorCQwrZGw4bMSQjoZ
 VHmztBv4tmZqoY+T8bIa16kGWgtQ5MQA/+CE2KgMXx3H8Wbc9kPRRekDy8jySFogQOQ2
 cwy9dKCBYQsoB1SeDWD3zGBstcQtnmV2SkyrOdotcv3M6sMBjT6I82C0V5XFs9XeBMBd
 PmXwRIGPvdMJ144jQPtse4XtifX7BDFU/yrwcRo4m4zLdWVV9Flpg78IEtE50iP+L/Wu
 iKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705148886; x=1705753686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3JrSPlo67QqaghArN/ohSzkKAPbmcNxd8ZmhQFLdIZw=;
 b=kVpsz3GfZp8lbUG4UuOxZdWV8OviE9/HvldBBqe+/wXp52n0uvBRIBZN9BVoaxkmJ7
 CkI04+XhY0GxtVcRaniVTEw+Y6qiD03KIrjqzLzCugZ2bOCizMNcz/QQ9ND/BCgK9s+2
 Pa4Pq/a1TdZoiFx+Ej8shqrSaK8+vsWLhXRENPrE08znI30wOF6KCjpTBnShUl/8ccWq
 pljKRoNgJRu3bayqj3Y7LjKcayfREZ2F0okuIizdzdZXNQI/sEgaDVfif4mxQe0fTFHS
 sk2ugtKYE18JN3l5Em2MisaKA3+4iIpSFcjKehD11Ebey7cEtmpwqXZA8IES2UBQhhuQ
 nPfQ==
X-Gm-Message-State: AOJu0YwCtYJ7v6/GM3BPWM4p1h+51qxl/cafkA+XNAFAOUDfir0L2oO7
 b/+6qh0J1MqiuxGD0WUvnuvGAHYuf/bgYsJXbzFnW+51K9a61w==
X-Received: by 2002:a2e:9d03:0:b0:2cc:c7fb:ce0d with SMTP id
 t3-20020a2e9d03000000b002ccc7fbce0dmr1364897lji.93.1705148885899; Sat, 13 Jan
 2024 04:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
 <20240110234232.4116804-4-nabihestefan@google.com>
In-Reply-To: <20240110234232.4116804-4-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 12:27:33 +0000
Message-ID: <CAFEAcA9RAYK+GMQP5b18+Yfx5QXViZYmLW301+XrPfT4m++-7A@mail.gmail.com>
Subject: Re: [PATCH v12 03/10] hw/misc: Add qtest for NPCM7xx PCI Mailbox
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: adJOGYGn80qt

On Wed, 10 Jan 2024 at 23:42, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patches adds a qtest for NPCM7XX PCI Mailbox module.
> It sends read and write requests to the module, and verifies that
> the module contains the correct data after the requests.
>
> Change-Id: I2e1dbaecf8be9ec7eab55cb54f7fdeb0715b8275
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>


> +/*
> + * Create a local TCP socket with any port, then save off the port we got.
> + */
> +static in_port_t open_socket(void)

This needs to be 'int', to avoid a compilation failure under
Windows, which doesn't define the in_port_t type.

> +{
> +    struct sockaddr_in myaddr;
> +    socklen_t addrlen;
> +
> +    myaddr.sin_family = AF_INET;
> +    myaddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
> +    myaddr.sin_port = 0;
> +    sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
> +    g_assert(sock != -1);
> +    g_assert(bind(sock, (struct sockaddr *) &myaddr, sizeof(myaddr)) != -1);
> +    addrlen = sizeof(myaddr);
> +    g_assert(getsockname(sock, (struct sockaddr *) &myaddr , &addrlen) != -1);
> +    g_assert(listen(sock, 1) != -1);
> +    return ntohs(myaddr.sin_port);
> +}

thanks
-- PMM
