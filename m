Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2229376njc;
        Mon, 22 Jul 2024 18:15:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ+nZDgDWDoNrBTFkNYRRUrW69jBYWYz+tCNWnmU4m0GjIoav+T/d/S9RnYGuY0cylYc1whPJyvqhqkKC9Xn8BmhCobWjp
X-Google-Smtp-Source: AGHT+IHwkxHwe7NTfDcTP34YMoTlXO36/9AviS31u+uWh+q8Jub6EcUZVHpI87bOK7Rrhu+dkluU
X-Received: by 2002:a05:620a:444f:b0:794:eb81:32c4 with SMTP id af79cd13be357-7a1c2eed914mr128893085a.10.1721697315882;
        Mon, 22 Jul 2024 18:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721697315; cv=none;
        d=google.com; s=arc-20160816;
        b=fytq0+8pcbKaXPz1s1vUWM1gWhhf4asXt5uaXzc4UAUrmoyg+TqxJegIdme5JVYaBR
         IKNp29bVvmWzQyKJwvbsb3sZiPDO8gXnnhQeL9MMbOg16/zXxw00z3dkdpssb/geUM1P
         CbaJKpc08stdGXXVBBiKnP1dEzgtvNBsjbzNXfKKvH9XOtrDqJoIeDNaUQfHWaHIY+bD
         VDgkr9leKkcVoCDvmhlfjbvPwDcRGxkpt4ilYv6aqkcbZKZvu1vbQEUr5U1j19k2GMwD
         AhLYsZ+LxbnHGyovTXrMdcM+xQi7cQYfRUCaZAq1iExfsNm2gzx5Kwet2Rlx8tFgIgLo
         oO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xkTaHaVwx0wmRUpXj0kKUkOvHZTx2SEVkZ1HphGDHEg=;
        fh=n6KyFyfwfhgnENFICPHGzZlcgidRF3XhLZv12MmsOnc=;
        b=MXpssBEt9/UWaITi4gU9WbD1DAa9XBOK2aRsekXbM14STqXtyFzJMlUHywCelhYqlP
         Oz7AAErmAmTH/M08fUiio/KXkPe2HUq6F+hCR8EOWUGTPTQ2nQ2q7Qp0yPwS3t3IoTC/
         0w+NMjvPxaRFXX2AYShDtTYkHhuUtRCEWw5YtxKfmUwNQh6x+DNPUjDw7a3qKNZPXf8o
         gZqpRcjzDTA5vjojA/TheIN5cJ96aeCR3XV14a0Y5qJI8A4TcH9s75TdZlw3NKOT8ScO
         t52DnuRfCjmsn77JW+GtPccNK//0v6/902baCwkNezhuiJ265lo59Ai6SJAqGKXC+B02
         eM3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/32yjXN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a199066cacsi945409085a.440.2024.07.22.18.15.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 18:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/32yjXN";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sW475-00067d-W0; Mon, 22 Jul 2024 21:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW474-00063N-PT
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 21:14:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW473-0001gm-2W
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 21:14:46 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1fd69e44596so2228585ad.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 18:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721697283; x=1722302083; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xkTaHaVwx0wmRUpXj0kKUkOvHZTx2SEVkZ1HphGDHEg=;
 b=N/32yjXNQSxaSNbQAu/+sWkN3kRDlayYUTyCv8NFpdAvrIxBCmzzeSfe7BbCxxveqC
 3grdCrPWo0nzymyCBxyT4pkaFgxDnv+vWJRvikGyAkJ5UTfkYqCk4YMVLSARvWbXhIqS
 bEBj4TndHklTkvtcTulzldCDXR6No8nglXlD1SIp4BV+KecHVLi1c9iJB87zoOivRpab
 Ctv4rA3zC/85/C8P0LKWz5BiS+elCofr2dPsar0zRvtFkHraYm6eFKZSK44yptYLBO53
 1Tf78q/ScCgcMuhf/AvG5zmYpo939xcbMwFuyyoWyZx49WHlsV8g4ylqRsBOIaymLXTk
 8gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721697283; x=1722302083;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xkTaHaVwx0wmRUpXj0kKUkOvHZTx2SEVkZ1HphGDHEg=;
 b=Rt3vRH07drra3DyTdxAeYESPFxGzXDERCyf8/ziWPaANr+udOspMaZqZyU/47rs8nr
 Oc6rl5665RoDGpJgREHHCj79Zry85Brm+SLnayj+JtLSllAO6cQph1sDfGdvQU8eWwOr
 NyUjiyDhbFLTeUhyIkpf4iaAAB53GO502/MxNi8lmvT4f+P6RsCcPOzXwpAwnhYdQqSf
 BFEkZpxJQB40BX3NOot5kJf27hsQkYgAWBxCSk9gIDv8cOZvgKaLBlSjyF98ySni23pC
 oZjBWhnbrHZXAmwbURoaX7VFkoiLmIsLrTQ+fzsqPmExNAbqZnGy0Inh+JFalxqOQ0Ul
 7rpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOF6o+V5dMP2/4j8if4fBGFig7VC/a///5zCWh/IA+pqf48GGDFMRduiefCPpp29BbiUKC+UJ4mWF9XEYXvO7Kug+qVhs=
X-Gm-Message-State: AOJu0YzJO4fm8cWP51lErfIgSPelT7DnliKv83iOXoUvPqmfDTIJhq3e
 WdBasdJ4uAZsRXhwwKGQZcHMQMM4caY4ndScZxsHa/MvLS+qF9tmdIq1VKe9zzE=
X-Received: by 2002:a17:902:e881:b0:1fd:71cd:4431 with SMTP id
 d9443c01a7336-1fdb9581b6emr9639715ad.24.1721697283326; 
 Mon, 22 Jul 2024 18:14:43 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f2ac662sm61712825ad.115.2024.07.22.18.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 18:14:42 -0700 (PDT)
Message-ID: <5fa0906f-b732-4721-92b5-58649632e3df@linaro.org>
Date: Tue, 23 Jul 2024 11:14:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] bsd-user: Define TARGET_SIGSTACK_ALIGN and use it
 to round stack
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-13-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722214313.89503-13-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MO+T9h34iyU0

On 7/23/24 07:43, Warner Losh wrote:
> Most (all?) targets require stacks to be properly aligned. Rather than a
> series of ifdefs in bsd-user/signal.h, instead use a manditory #define
> for all architectures.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/aarch64/target_arch_signal.h | 2 ++
>   bsd-user/arm/target_arch_signal.h     | 2 ++
>   bsd-user/i386/target_arch_signal.h    | 2 ++
>   bsd-user/signal.c                     | 9 +--------
>   bsd-user/x86_64/target_arch_signal.h  | 2 ++
>   5 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
