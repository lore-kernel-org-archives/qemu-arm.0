Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4873426ejc;
        Thu, 12 Jan 2023 07:39:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTAJtOOTH6wAH4HwQtZoUrNVt4ks/emcqR5YTWOrVfb0/77MQ+1YgkyQHsyFwiqDHJ90tB
X-Received: by 2002:a25:8e8e:0:b0:703:1ee3:f8c2 with SMTP id q14-20020a258e8e000000b007031ee3f8c2mr60989927ybl.58.1673537977377;
        Thu, 12 Jan 2023 07:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673537977; cv=none;
        d=google.com; s=arc-20160816;
        b=XLZEqC0aavoeU+x6z+qjkkG2UdOmLcSmWAZhvvLUOMpi8qu69xs2AqPEKbOL4F2172
         tC4GVTirhiZ5kqRAkT7+P0EACQAvOhgg1kBkx6VZV1MrNjDRwTagM5mDKNaEuELsUQOh
         YQqU9Z7fM0VVvrFKO1MdYdRDlhXVqRJAXRgplo05k0srNcdrLVHPfTh9EH/568DhEiL2
         vdAdrKir70RDg+lrnXLo0b20+Wb6xbj0zRnqW6uSbEifaFfjdSnXWpco8H1hetQHdyIS
         lMNghqPRPsQEJkTh+tv25zQzT8V+P4nVAlwWslgv1GWbY7TIQUpjTcf0hz9cCZtxO+1T
         Xalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Bpaxz9kAOy7I1GzUBqS5GrYuZwOUyrPjLJ9KVCPZE7g=;
        b=jwaksTesaTGRDvfICJDoyz0r5AnKexZvTeRy4pK04cTsEGbpgyKa8vTo+mzyrLGx9E
         /hYwCsS/fp/XLAthFwGWEr+37B8y4PGU72sRqbzKZEzhrEI7LqLNt6z7lht6v/LjC1ej
         FbgeAY8MI1ChCpzuiwZdIqfvH7aCpuEZHwAqjh3R71esUSskqP3ohFGNZyTf7OPbbVb/
         cF8toWeH2aW4d/kxEbTin6qtuKLHUAA2SqRhq2yM49JqHuZo6Ss42dESULZqXGZqNYGu
         MKFUyF88xAgB5X6Rb9ZG5AJaOyqTSpeG3YWr/UEw97xRCef8w7N7VdrNbUIq2Kb7ru//
         2YbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=qfO3q0c7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj8-20020a05620a190800b006ffaecb925fsi10964953qkb.542.2023.01.12.07.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 07:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=qfO3q0c7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFza2-0005iO-RO; Thu, 12 Jan 2023 10:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pFzZt-0005bQ-CN; Thu, 12 Jan 2023 10:33:19 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pFzZr-00051Y-CX; Thu, 12 Jan 2023 10:33:17 -0500
Received: by mail-oi1-x22c.google.com with SMTP id d188so4416591oia.3;
 Thu, 12 Jan 2023 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Bpaxz9kAOy7I1GzUBqS5GrYuZwOUyrPjLJ9KVCPZE7g=;
 b=qfO3q0c7wfLJI3g42yrsncNzfyLPXHdutVjDYF/bMFw18OH0tI9ZdydN3GZxCKDcH4
 NzAtyzCz6wWxvw5lC3/VVP/dhm2dvX1u6iftPr/OuGPnJKxsCxb8vbKOCUFLOeB8xvxq
 iPxVKOsKhWOuR+zWLBVYnGuViQclACUlEajEvP8XKJPSk02ReYrQOoldPWaWjxDjfGgk
 WHX58TdLE2/wfUrv1bXCT/ru2aodzSTlh9lrU5wz3ybK93QTRxS/+lWPOx2ll8wBJV11
 v3eISckn2+AA0pr6YYw/ujiFlTKyQDFkX1HsfRWKEoy3rgAXgnYTmAkx8MEBN2xk7fIg
 GtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bpaxz9kAOy7I1GzUBqS5GrYuZwOUyrPjLJ9KVCPZE7g=;
 b=HkI5QOQB4Pd+40Zoq+NWq9GpQqLQtH9YvHTy/4MwxENlj5HRLNlMZKshgI/K/Wg5mn
 V8ZDKRlhZOBGsCAcEJfb9U0koDjNaVxcegFwk0DGlQdWYL0iZePMTycFyDO5of+2XSDZ
 x4wSujsZGE8Cyi+MiAvU3COtsaWGwUokiqeFrZBw5meekAwAfQ2f5j5s2bJ49igKeVHT
 ZwqBPRNG4IOyEbGrAOQ15AIM0LStIA0YldW4SPlK05FQjkspiYTjESJFERlpH2UGGGEp
 a/rhb7ChjL4UAVcCHetMsPnvxdqrO34sEHBz4F2HAIVHrGkndwHA7p63KC16ja/8C2yB
 EnHQ==
X-Gm-Message-State: AFqh2kojwEM32WrzHNLJlDpCijXEUvsfkVSPTE2cXmrYeHczC9KqWoXC
 p0Sg5+zI7ID8UjY1i8hH2A==
X-Received: by 2002:aca:1c0d:0:b0:360:c119:48fc with SMTP id
 c13-20020aca1c0d000000b00360c11948fcmr34545980oic.41.1673537592752; 
 Thu, 12 Jan 2023 07:33:12 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 dt26-20020a05620a479a00b00705c8cce5dcsm180448qkb.111.2023.01.12.07.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:33:11 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:628:82f4:f011:50ba])
 by serve.minyard.net (Postfix) with ESMTPSA id C05E4180037;
 Thu, 12 Jan 2023 15:33:10 +0000 (UTC)
Date: Thu, 12 Jan 2023 09:33:09 -0600
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v3 0/5] hw/i2c/bitbang_i2c: Housekeeping
Message-ID: <Y8AoNVyEUMsSXEjr@minyard.net>
References: <20230111085016.44551-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.067,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vdnvN2uGI3qV

On Wed, Jan 11, 2023 at 09:50:11AM +0100, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.

These all look good to me

Acked-by: Corey Minyard <cminyard@mvista.com>

You mentioned the ARM tree, is this going in through there?

-corey

> 
> Since v2:
> - Use array of const pointers to const (Richard)
> 
> Since v1:
> - Fixed overwritten RECEIVING_BIT7 entry (Richard)
> - Picked R-b tags
> 
> - Remove unused dummy MemoryRegion
> - Convert DPRINTF() to using trace events
> 
> (series used as base for follow-up, better if merged via ARM tree)
> 
> Philippe Mathieu-Daudé (5):
>   hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
>   hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
>   hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state()
>     helper
>   hw/i2c/bitbang_i2c: Trace state changes
>   hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events
> 
>  hw/arm/musicpal.c            |  3 +-
>  hw/i2c/bitbang_i2c.c         | 80 ++++++++++++++++++++++--------------
>  hw/i2c/trace-events          |  7 ++++
>  include/hw/i2c/bitbang_i2c.h |  2 +
>  4 files changed, 61 insertions(+), 31 deletions(-)
> 
> -- 
> 2.38.1
> 
> 
