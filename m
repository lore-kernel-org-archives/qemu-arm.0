Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A4CCA471
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 06:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5ek7-000066-3n; Mon, 06 Oct 2025 02:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v5ek4-00005k-MH
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 02:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v5ek2-0004HG-HU
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 02:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759732235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lB120EpvNInxPpvYcMAZ+rI/mwe5jB68SwJ//QSBct0=;
 b=VVZLRrUIKEsdRxoRh4EEvIVJaNc3UNJo+KWwuVOpn4tNpenPmiOAUauTsR9pAdIzLYQ9Lx
 H+NX2OKrRCqQI7tQi7DRzuzyifLlguJBigGR54JmjTg5H77Y4ggrT1+l28jDY79TMRthIb
 ndmKw2o31Wx3kOj2KUEMUxIjmlm+a7g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-WfkugYTIPj2jNBV0yAP_Dw-1; Mon, 06 Oct 2025 02:30:34 -0400
X-MC-Unique: WfkugYTIPj2jNBV0yAP_Dw-1
X-Mimecast-MFC-AGG-ID: WfkugYTIPj2jNBV0yAP_Dw_1759732233
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b41c67edce5so461624166b.3
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 23:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759732233; x=1760337033;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lB120EpvNInxPpvYcMAZ+rI/mwe5jB68SwJ//QSBct0=;
 b=e81ra3Xw6Y/uPo32kxZFCPu0QuPgCYHWFoAnx0m5Z3+cG+BnbW9TLUZwipZ2JxbA3B
 0pZNdNO6pTp3XEOFGm+EiMAf5yJYmSE9BEn6FxUaweaKM6EIWIwPUv6aQVegehJbWTMX
 ExK34CIDFGBjEoqNjaFvhQ+24BuqdcUuExGLHgkCiStCGJe8edK1A3krKpga34hAZ2HE
 LGerK+HW98YUn8nuBVHNDIyE/l/c7qLdwvoxf5QESY8RRgOHdVsMECATzp1Dit659XPx
 mwjwGBTaW5+tqUuTmdlppeIzse8SAgCs57CJ+auLyfB+xpB5UXNsvlXpV9qZxluy4xOJ
 oWyw==
X-Gm-Message-State: AOJu0YzgqfAf6CwD+Fz6DWSMAvPmO3C/12f2Ibn+VmPfauEJt2iqusEZ
 i0NBr8+5PiHiiJCi+eyeJ9ElWYWH4f1/+60JvQr5aKCIspn4PnWiXhF958Nhb8SgO4/aTXsOo9p
 G3ZUHuAmHxVTVxkr4nWPJcezvFLWBi8MTdExqtMymJ7Rcej3bLwjLiA==
X-Gm-Gg: ASbGncuUgT5RjCa9Y0knSb9uA7xWg04e1MCF/NmBh1nMXnq4gegUxcf83zQ91cGVFx3
 sulki30QAYZpUOz5gDNCvYIY9o/Uf8KUMcbwLqVuw/HgiJs6qbgrS8xtCerLyt6Yk8mg4AaCule
 FkcGjjFUDXovo+kgCiPqXTYdIr75gyEgEF4UGKJcqI6Er0Bhtg4L2gvPdGQaYP/Fnk1EGwOtr/Q
 MYEEmJP+rY2FEuCwM3pKbh4d0Jqf3WmZXWFBTe5vnIbdfMRT3XU8nuUQpNlFDOsTjWhcPRfpWfW
 tyHihWvrSDEVag7mhI9N/1voTHMiatEL2Zy+Q2q5Lj1Kr8iTIhJZULDgaNoMNbEsb+jOKRtxzBT
 lA/32Kt/7KA==
X-Received: by 2002:a17:907:3c89:b0:b3c:896:abdc with SMTP id
 a640c23a62f3a-b49c525eccamr1336933166b.60.1759732232815; 
 Sun, 05 Oct 2025 23:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvvtRHiGi+JN1dCDKNvRstMBdzNGVxT8oZI+lBCa0DHDMFHl93AfLw3V1NziSK6IGixR0ygw==
X-Received: by 2002:a17:907:3c89:b0:b3c:896:abdc with SMTP id
 a640c23a62f3a-b49c525eccamr1336930366b.60.1759732232364; 
 Sun, 05 Oct 2025 23:30:32 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486606bd5csm1069244566b.44.2025.10.05.23.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Oct 2025 23:30:31 -0700 (PDT)
Message-ID: <7aae5daa-5e07-463c-bc3a-6581050688af@redhat.com>
Date: Mon, 6 Oct 2025 08:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] tests/functional: Add GDB class
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
 <20251003141820.85278-5-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251003141820.85278-5-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ick5PL3E_I7ysFKB95a91HGdE3uAQDyXZZ8yL9y1XxU_1759732233
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 03/10/2025 16.18, Gustavo Romero wrote:
> Add GDB class, which provides methods to run GDB commands and capture
> their output. The GDB class is a wrapper around the pygdbmi module and
> interacts with GDB via GDB's machine interface (MI).
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/functional/qemu_test/__init__.py |  1 +
>   tests/functional/qemu_test/gdb.py      | 88 ++++++++++++++++++++++++++
>   2 files changed, 89 insertions(+)
>   create mode 100644 tests/functional/qemu_test/gdb.py
> 
> diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
> index 6e666a059f..60d19891bf 100644
> --- a/tests/functional/qemu_test/__init__.py
> +++ b/tests/functional/qemu_test/__init__.py
> @@ -18,3 +18,4 @@
>       skipIfMissingImports, skipIfOperatingSystem, skipLockedMemoryTest
>   from .archive import archive_extract
>   from .uncompress import uncompress
> +from .gdb import GDB
> diff --git a/tests/functional/qemu_test/gdb.py b/tests/functional/qemu_test/gdb.py
> new file mode 100644
> index 0000000000..05e4c29c2a
> --- /dev/null
> +++ b/tests/functional/qemu_test/gdb.py
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# A simple interface module built around pygdbmi for handling GDB commands.
> +#
> +# Copyright (c) 2025 Linaro Limited
> +#
> +# Author:
> +#  Gustavo Romero <gustavo.romero@linaro.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.

  Hi,

just as a reminder, this still needs the change requested by Daniel:

https://lore.kernel.org/qemu-devel/aN56GkbIFxs5IDRR@redhat.com/

  Thomas


