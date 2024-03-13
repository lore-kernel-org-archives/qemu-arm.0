Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2400970ejc;
        Wed, 13 Mar 2024 04:49:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTblwIpycQUjgt4PUxyaxL1VTdDQAgk/R1cVX+AaZTB1FhGINVThrv07gqcM7C4PnUafYUZzUAFJ/lZ3A7jB4uJacAuSyE
X-Google-Smtp-Source: AGHT+IGfmolqpbGXuussnSI2J6AlCIlN/enM/ekUlzKlgPg4mtw0/zPdVZ1wtJz/sQ9pq/UcUVtR
X-Received: by 2002:a05:622a:4e:b0:42e:ecca:c8ee with SMTP id y14-20020a05622a004e00b0042eeccac8eemr3539953qtw.16.1710330574108;
        Wed, 13 Mar 2024 04:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710330574; cv=none;
        d=google.com; s=arc-20160816;
        b=pLIRJo6bPPOMsNaSnaisDjcAcnRss2TYNGGG41JlHnnvEO8wJXVDDAJMJcqJyXeLaw
         xdPgPa4x8nKFQ+18U+DUfXqnYOddm01iUEzTwa4nxL7zGfmmtqrB9clcJJdFQX9tcPrZ
         cfjmfqpsfUTc39b6RwxwPjwPbL6gGebm6Y/uprpoa741U1GfImBiqG54LEy6NI5vXkE7
         9WwM1FM1f53pauInszohOm/2JSA3xH+hRinafIFQRl0XZ0BYIJ2D+uojFxThy7MRWbAm
         r214/PHTVruEt5m2Fi3CBUO986qX6Rb4Yqjgfi2t9gCAK6i6PUhTcSwd+9rdbcSx3qj/
         zVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1THYEQEsQJgwRa45jnQXidYz3+zTDduzx9e0SC0WCVg=;
        fh=9WhruzbIUkKskD5zTw8hJg3qjATtBupFxQ4ZoLMqFM8=;
        b=ZX9lQzTrdSuuw/+6DtBP/UlgXlPv1F8KcIC+Qh7AeiirPP/dlEdoBJO8Uh4JKFSzNu
         MvewvUBEELA52wQeGGqu2BqO04mnN5fSMS5ofU+FEZle9njAzxLWUV0pLgbGK01SYO6D
         PQSNiQVEe/zSxZzO9O3Y4txgdZdp4wNBSVxNaAnSx90aaPA3O1TY+HAC9cYdoQpkmbLL
         EOImza3EVtg2AUutHEhhK/9wnXvj3bv62Np1NgYIFYuz1U85Hf5ru5QH6IwXnTl5xOPf
         KQOM4EE1OT9OfZdEl/v0p8hs5S53K0Ytz8EeDVbDWXLyFu3W1TQTmZcJHlma1OLH+gAA
         XzqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWeSeRyH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020ac85787000000b0042f2609bf2fsi9648252qta.413.2024.03.13.04.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 04:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWeSeRyH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rkN6b-0005Tg-Vt; Wed, 13 Mar 2024 07:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkN6Q-0005LV-7Y
 for qemu-devel@nongnu.org; Wed, 13 Mar 2024 07:49:03 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkN6J-0003Fc-3d
 for qemu-devel@nongnu.org; Wed, 13 Mar 2024 07:48:54 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d208be133bso77754981fa.2
 for <qemu-devel@nongnu.org>; Wed, 13 Mar 2024 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710330529; x=1710935329; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1THYEQEsQJgwRa45jnQXidYz3+zTDduzx9e0SC0WCVg=;
 b=OWeSeRyH85yUXHSr38jHr5m3q0rC3a4/fRYbRAeRcx3zcywNEaqk5ZHQp40iiaF2S3
 I/x6mMD/39B2IqImR0Ys+MB9AxcgyylcUB2GexNXRCs62ycUD/WwJI354uYUyL+sIrJm
 KHthqTFMnitZHMZd413yw8r5R+6D5W/DiPzFstfaaywwr98XExmpsqcG+V2kdO2xdR0H
 WMa7qpq4nbHe90PZLiIPHpZFrOGuU7Xs7lu59dj12ZkmhEyLe1OqfvTKWZGzsNOE1e19
 q5NP59Jpvckd7PaKTQhyoqet5U/bCdWulSArH141upy3GgYdHMyiwFfLi1YuyHdrdhaq
 NEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710330529; x=1710935329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1THYEQEsQJgwRa45jnQXidYz3+zTDduzx9e0SC0WCVg=;
 b=vxfgb6fY3D1kFEPmEEZlBTBn5p/X5ZhOeZfss3+pIhgFRFUl4aLXNokiyMCjEQuQYN
 T3Sv9TYNXiLEM5ggTK2Bs4prVMpxSDStwYXMp5Hs8rxL7+6wn4NN4/AV4Vu3xSzAx1/K
 s7n4SG1SnmerPSTV6bhH7tz+LTitmMJCZoa6Dz4z3jejbuRvufPCGz2HxtEufLEu3/Uc
 nCPT79WzVcBrduFyW4YU29PfmfZ8tMkfUhhDYvKpA+MCZvm12W1Hq8/PIENj2VP2UUiP
 yQikZZEgISyOYxLEhI138cyC9QpRFDnXjNxvBbPg8+c+jwNi+cUCKVbNEKSwfzRNpj4M
 AdoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHUA04u99qvAj9veR3uV2w1vR/PsejwJPWFRrohrku0k5ueWwBne/vGxev2YZuZaz6SOnqBRxD1+5ao2BTR6GwaNTIdh8=
X-Gm-Message-State: AOJu0YyxnWatn4B1BOMR5M7NEphnIOZTZrxVdTfgBKHl1zdLfMFRDSyy
 NUpTt1OnQRUdBqLacHo+Kyk3PwVx6g3oMGFzZ7AHJ+RbN+n/uFAml+v0gkPHuo0=
X-Received: by 2002:a05:651c:124a:b0:2d4:6d3c:3989 with SMTP id
 h10-20020a05651c124a00b002d46d3c3989mr733296ljh.36.1710330529213; 
 Wed, 13 Mar 2024 04:48:49 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 bo3-20020a056000068300b0033e9d0b3faasm6385589wrb.82.2024.03.13.04.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 04:48:48 -0700 (PDT)
Message-ID: <e6e12dba-04df-4964-81d0-34890906f647@linaro.org>
Date: Wed, 13 Mar 2024 12:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tests/avocado: update sbsa-ref firmware
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
 <20240313-sbsa-ref-firmware-update-v1-1-e166703c5424@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240313-sbsa-ref-firmware-update-v1-1-e166703c5424@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3gRJnP2yegyk

On 13/3/24 11:08, Marcin Juszkiewicz wrote:
> We now have CI job to build those and publish in space with
> readable urls.
> 
> Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
> 
> Used versions:
> 
> - Trusted Firmware v2.10.2
> - Tianocore EDK2 stable202402
> - Tianocore EDK2 Platforms code commit 085c2fb
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 40 +++++++++++++++++---------------
>   1 file changed, 21 insertions(+), 19 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

