Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp146974ejx;
        Tue, 21 Nov 2023 23:46:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5HXvzTWcwhkVz0ClRVu9QzLrf6RI0bKdWSuyu3xLRMLXPiDEzw607fppBvAhIh//5qe/z
X-Received: by 2002:a05:622a:1910:b0:421:c94e:4cd8 with SMTP id w16-20020a05622a191000b00421c94e4cd8mr1940751qtc.33.1700639189441;
        Tue, 21 Nov 2023 23:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700639189; cv=none;
        d=google.com; s=arc-20160816;
        b=LfN6v/Pzk9YoQQn7PxKPJs2Tbm2Ynig79nkhSCOl/f9Am7utQBdNFyA28xjT72N50v
         KZ59pSQ4Xj+tdqMG6uWAMOKgOljHIBERnCxc6NPCTWLkzcZB9bd7GXm5EhTFQk6CcKES
         YW+2Tovmjwb4tjf5bEMPffD7phFzLm6rRb01c7rNAtgEuaxq5MKXxgPxmOWnMxuPVQ9Y
         coyl3iVHXAq18UDsyYY39PJtO57Zn4M8Wp77SqOrUZMfklPzroewE/iLRBKE6MwkvQyJ
         2G606e3rz1hYulvWNBuf9ltHoy6PspPgo+9wikR/mowrBqbuZsHct6YhHppW3S76uxWu
         Amcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=iXAuw48OkpAEeRbPCTU8NIJgNe58jIcg9tuWZLUMaO4=;
        fh=UJNoRMXvawh+Nz90wsqCB4hLiJ339wMcpkkSd2G8ai0=;
        b=QAMArIuMN73wwhOriB9dvzKtGpfeIbOW6iJfnclBzwfhMZg0naMezZRZnLAiZAlGkz
         WyTaBPD14XdVHMRWPzXQsvMWxHE89li4x/eoxkENypmqRJFMS0+s8o6NmNZ5SCPslrHa
         D4KjWVJJaFVPGL+PKSAGnmuUQLV9zJz0kculMtnnJ+qFTLDgrlAsRdB/pW5FLUJ/MqiP
         kq65mKtMtpiPGcXLCSJs+1Dz0V3JX+YnIZs0J1lpB5nstz7jEPOzMeBmdW/5v7E5wPlc
         iW72pZLToz2YqobVkis14XCJLd6sa9luXxgbpnMYAYFHdSLsj2pzQ6xIdgta6t2OUH+o
         EC2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2Ye9sIs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ck8-20020a05622a230800b00423776022a2si1633279qtb.238.2023.11.21.23.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2Ye9sIs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5hwI-0000v5-Hm; Wed, 22 Nov 2023 02:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hw9-0000tS-JV
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 02:46:18 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hw6-0004R0-SO
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 02:46:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso32382745e9.2
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 23:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700639172; x=1701243972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iXAuw48OkpAEeRbPCTU8NIJgNe58jIcg9tuWZLUMaO4=;
 b=G2Ye9sIsHM5rZ4ck85qBgllnTtfS2Xn0zNf4LYb2JgcdYPTqS4QuP8YmApf64/OQFc
 ZQJqDMksOgVJdq2jN1BiA3ndNROnM3aF8vvLqlT201Oj8TQp4356/m7RYmLKBm123RXX
 IkBDFNUi34o0qfnVZD3SPBV2yqPO17RfO9lsj/CYv+dBY0/zHVhaMsFNT2RZrMsc1j4e
 5Xqcl5hBiDyJxP300k076N06C07zhHAmBl9sq+0fabZigXrHvfs0mwOGuhEGv8BjYjp1
 S1O6m3f2o5FCrSXjQkVCxofhEPNChPHiYW4AQ0LRN/XHk5YVepIQG1nbfGGQm0sr2ZMp
 gaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700639172; x=1701243972;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iXAuw48OkpAEeRbPCTU8NIJgNe58jIcg9tuWZLUMaO4=;
 b=UxKMuUf/yt3RBAxxD1h3nb1cEKHDUvcHhE1dkYS1UIVx/qoRSPqs+VgN8NpT523Hpb
 zBy59EGe5knLbhzRicT1Bh7hAfnu/zkziGfUVnNfye8AHd6huAaLQ3SzItjjjoN2Y5A/
 WnkDVqqu9nKjrzqKTStUaJiKhQ0Sj20TVPAayuvnGnwjITCFYzDNPUNpW25pC0pjAky0
 nUkxfwBmd++C9tgTG1lmb9D1dZjcQ+a72LUv+zkrqEZWRT2cNPlOWHh2mU+8crAVjTCX
 iIf9c/X+AWdh8rnlfzSkOLVBbrbnuL54p/K2FSq279IgL6WdcFuEWHqa+0lF7G6kYx8E
 GtSw==
X-Gm-Message-State: AOJu0Yzo8gxGfncL6yPW/aAMr8CeE/YtU4Su3gTbafif07M31CyYvq6I
 mwIlrMjIRzXyMpzP/aS/rKibQOTiU0atu93Zwb8stg==
X-Received: by 2002:a05:600c:4611:b0:405:348e:aa43 with SMTP id
 m17-20020a05600c461100b00405348eaa43mr1212580wmo.12.1700639171687; 
 Tue, 21 Nov 2023 23:46:11 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b0040531f5c51asm1273181wmb.5.2023.11.21.23.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:46:11 -0800 (PST)
Date: Wed, 22 Nov 2023 09:45:44 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 23/25] hw/misc: Simplify
 memory_region_init_ram_from_fd() calls
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-24-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-24-philmd@linaro.org>
Message-ID: <4ilkx.cuzwqu33z4dt@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PRUZLSjCq5Wa

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Mechanical change using the following coccinelle script:
>
>@@
>expression mr, owner, arg3, arg4, arg5, arg6, arg7, errp;
>@@
>-   memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp);
>    if (
>-       errp
>+       !memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp)
>    ) {
>        ...
>        return;
>    }
>
>and removing the local Error variable.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

