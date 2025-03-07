Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2459955njm;
        Fri, 7 Mar 2025 13:04:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/Y+UcwJKvcZ04z/E9mMLONPzWRCLaJvJKk/V4GTXGdq+SOj/ywnzRZZqX04xUEcP4LtbghxtUtVGZPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHOZIdu29XDqS670x/xJh90FPNvVNLNzga/xg5eqBqiFL6Sa5y3ixj1Q2fKC8/lffXo8i85
X-Received: by 2002:a05:6102:f90:b0:4c1:8ded:2d66 with SMTP id ada2fe7eead31-4c31b759ad4mr1121126137.12.1741381458529;
        Fri, 07 Mar 2025 13:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741381458; cv=none;
        d=google.com; s=arc-20240605;
        b=YFNNgCE9QBoPAVEc0NvBA3Nsa8ACxTM1hgRZSj6axmSXfKwJlOettvseov7wu9amYr
         +KSbmlGwsES/Pfr1ZVqcJtWAuLjhxHEcqVMXIJcfqAjyZYRPBGaOp1rNH3aUB6Ynoubd
         x/2syjvK8Z6U/xEXc18+28QO0Sz08XcrOY5+eE4zXNK89a6E7RnGj+eawHj2Q1YLbLJa
         wtXXfMjLAzoGHnNkb4cUQRDH1h4L/5RkM+jg4Zxlvd1i/Hok6ZURwjUMf17tSEUd8ZOD
         VB/tVJnorSpMvqhCBbYLXjrMChUS1rKdmlcLVumW5PtctvXt0Nh8l1r4Q06GZ+jk2psm
         Ww+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s7lIJgOA1tjiMK/XknTysFy21ttJ28wSLFCbPOi8VqE=;
        fh=LVFufGs5OFV9F3goVf+QEVTCa2XHz9eJAx3KAZHhqG4=;
        b=jjaFpWEYysoZ562yGCoMN4qLtFsZLkDwC9ktZ0l11QljRdtIvOUO+axNW02+K4L2ng
         Vhdk56PKr5fMrKhWeP1kdGqw50UjceUuP1ANKq50xIGnBVep+0AvPzU+Bgel6VrI9KCX
         R9xD0DOZikfy22h4tf4k2SxVgoQSOq833T5g9Y+0/lH0PvLAQ62ApBHpMeTMbyMgS+FF
         JkkZ7o+T+l6B424WGoeFxsk1cVLboSiG4PKZ9pJnBvsZw66k8fbOUeo+cLVN6NMDjYm1
         LhH/5ry9TD+pE/G/FoOeCPCFfIKn/nWjtONvHQoYL1v3kinaNTis2g7DCMA98E7jPmz2
         8qEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSTF6UtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fb427365si1195973137.50.2025.03.07.13.04.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 13:04:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSTF6UtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqerb-0002x1-51; Fri, 07 Mar 2025 16:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqerY-0002w8-TN
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 16:04:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqerW-0005sP-RG
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 16:04:08 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-390eebcc371so1539896f8f.0
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741381445; x=1741986245; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s7lIJgOA1tjiMK/XknTysFy21ttJ28wSLFCbPOi8VqE=;
 b=fSTF6UtXr9Oh/5sFc2imDZc+Bpxxwnp14r0i8xg4gtLbA4vrh/o1a+8qlT4ZeDgt0q
 pIobZg4WUsLcXsglca01GrulGJGiPVeMX/xrysiPOUshaXHUuMTU/GusQrggJrTr9CKa
 IUyS7DeItTLItKGlTDLGJBC7ADyCEOQ7hz8OBL/Mc46/IiAzhB9K5e5ekL/6HH4UPXhw
 sxeTJ6l3Cs3+DODqCGMUMQvGTUgAkPhOW3Lj+kRtDbwUi0Oni4C7QFI51iZMUEbwVyeK
 jl1hMyx67inra066VDmS59qWaqmFTj9gLVHU+Tb3OJh7E3DQXb2Y5V9IQIaV78sPSgQk
 yneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741381445; x=1741986245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s7lIJgOA1tjiMK/XknTysFy21ttJ28wSLFCbPOi8VqE=;
 b=c33tWt1WsdcZt6fjKeMkmJuFAcAiQJdSe1eSB0rLEx4yV6BBletRlywUswBa96QWRn
 Up+yEIRJDeZjUgOwqmrE44YiNb4ePyYRI97pvis/Ktruux8p848mqHzc1uujCZAk1rft
 KeeGwo5DzziF+2KkQd9PwPcKKmisz0ghOI3RQqWOby8w7hMT2PFiW6reHaGbjbtFK3iJ
 HzjEENEF/xD7bY5sDGnfWTkte6/w1i6J4JjmVyvLmdkJXxq6bUwqgCNt8Q2Amh36kPbD
 NKQKT6a0PaqxKBcWuPO2yyux+NSq5vRV4Q67f9UjVql8UyI51oXJZ+lEmfgjqDy1LHAk
 EE5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUepSKUf8k47QDfX13z41wjd/NNRwGGiR5N48kV+pzmV/KdrsKVhHB3Y4VDvZhpsmT52e2nKo4l6A==@nongnu.org
X-Gm-Message-State: AOJu0Yx2HWJAbZaEEUJdz5qnW37rJ1onqhJ6tc5HvM8GCLcRH88t0JB7
 b8X0B9tfopPGUQ5QOZBFKVAdzyX4Lj6UuBOq0gzvedK3zlKDFliPIroSTQdWffg=
X-Gm-Gg: ASbGncu/C8LtFnuJAqc+q1IQIA9AIQsDRmP9ToX5ZVMrBAvSf4Ieaml+462HAy5cKFL
 U1ajLKOW+aTSBD+G7kvilYe5k5cwLlXzxM5FQ1IMrBibhwhG+GOWVadnZ6buSKbRdfoBjoD2+GV
 UqeeAsLjOAM3X9y2DtvepEYaHEFnhhC3H+99zzDGO7toM9kGGJJAzh2EqWRyHzS/aS+I/qv1A8A
 jyi6FapCuwln0mVA1KIe8j5pvKB5EuyC7vJCBLOuYJ/HgIg+R98TlV1s1dKz4+FgWX7B10w0YTa
 M+985medDoIgma82HhR0uvTGqzm+T+SJszPTaYCVPw3zhskf6orFeegqYM1lxGvXEfpn8dQPTGu
 WC0uRJrnS4hhH
X-Received: by 2002:a5d:47c8:0:b0:391:2889:4ea4 with SMTP id
 ffacd0b85a97d-39132d06142mr3560982f8f.9.1741381445333; 
 Fri, 07 Mar 2025 13:04:05 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01cd62sm6359734f8f.46.2025.03.07.13.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 13:04:04 -0800 (PST)
Message-ID: <4eab7108-4e57-42df-9141-b213327395af@linaro.org>
Date: Fri, 7 Mar 2025 22:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/20] tests/acpi: virt: update HEST and DSDT tables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
 <c8f4dcf726b8813f00c917062184ad3348edd647.1741374594.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c8f4dcf726b8813f00c917062184ad3348edd647.1741374594.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: psZijo+IdFVx

On 7/3/25 20:14, Mauro Carvalho Chehab wrote:
> @@ -1,39 +1,39 @@
>   /*
>    * Intel ACPI Component Architecture
>    * AML/ASL+ Disassembler version 20240322 (64-bit version)
>    * Copyright (c) 2000 - 2023 Intel Corporation
>    *
> - * Disassembly of tests/data/acpi/aarch64/virt/HEST
> + * Disassembly of /tmp/aml-DMPE22

The other path is more meaningful IMHO.

>    *
>    * ACPI Data Table [HEST]
>    *
>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
>    */

