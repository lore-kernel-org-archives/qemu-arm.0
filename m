Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1175564ejb;
        Fri, 15 Sep 2023 05:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHJ8iUBxWBHLTTbDdsf0S573vCIXRWTC9rw2LAgzBPi1Wim6OBQ1YAOGRk5SxXB402QwDk
X-Received: by 2002:a05:6214:560d:b0:64f:62d0:ecec with SMTP id mg13-20020a056214560d00b0064f62d0ececmr1289913qvb.49.1694779497554;
        Fri, 15 Sep 2023 05:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694779497; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0dln/bfRdfJR57g43T7V6FP0L5SJsz26eZ8asW0Uxod4szTIVB9pe9r+365/qgbde
         nvG5cbLP5bSCN9ZRMdWRMVlLWQaI6UueJpICPt5tt6cklOhWepcHkfUj+LU80a3keN44
         AhNl6h6H6axMaxN1FX//5ptTC2Ey+eaO5ldjHnk5raYnRsNhxcCNrsvRvmMfVpeDpkir
         ihpz2D5i1DYnahwxOSArWGZnF5sp78XGklmp7Ov6EavRvyUCPE2MH/syb70J65aQdtUw
         aVSZu7ZLM1DIhXtQcGE/1vN8j96Lw6oMGgYySY/pzzPEVJ9Ffka2EOfv/DfrUlpqQUr2
         sJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=P6eM/yXaj8PkWr4TkEd5T8HyKUWTDYyMeFOOkASi5e4=;
        fh=DWBMfkww1EeXFVXLOIUP/S345hSIEM55oTV6lqZeNz4=;
        b=QrQp04Catd+dxx9A9Xjkw3+SZoO/tPzrJccnUYRy3fc57HRozcqNJhISo51hG3Guc7
         j4B15tjBfcQE7bk4Xzv3c1IgXhRbNkq2x9U5aQ67LvumJ98HdM4yRPscBkC/N+keX7cS
         mIVjtx4i198xykb7leTFpEdBPZi33zax+Sc8wLx8RRnsb7WBUiyzSlW1dLMqbqsvq1lo
         WvMNtX4gMb2g3ucM+oPBr06HTXANmvVigS1TGfwLttTSZoi3bm2fqxNk4r4MqrMNGUMh
         5WCYNTailb9CWsDdwclN3/64UAmMQkLdAjN4d9wzpWaFxDNVP8xbLMFxVXUVY6jOOr+i
         oVyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYVdstXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a0cb212000000b0064f3a1809b1si2196039qvd.273.2023.09.15.05.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 05:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYVdstXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh7Z6-0003eO-0B; Fri, 15 Sep 2023 08:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qh7Yx-0003a2-Kl
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 08:04:43 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qh7Yv-0007Ew-JB
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 08:04:43 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2bfbd7d49e7so33000511fa.1
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694779480; x=1695384280; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=P6eM/yXaj8PkWr4TkEd5T8HyKUWTDYyMeFOOkASi5e4=;
 b=UYVdstXXQVbAPlzr7f6z/y2lBeTZHUorXOtoqD9vFbRgkzArJn+UvOJ97WwFaJp8lU
 TCxE+spUTQoO9uOj7tYfiEvot2lwXc0GeZCcvFEi9lEEEMEhpKXFf9O3cF8c8wxSSyTw
 U7GcQJ8HXgX2loH0jtFQF6iDSFURY6eZnL9NwYJeku4AAHCynBaCHFuVXu0lWArQnvbk
 uCfbZeZh9Qr5fAiYGv2Gyf7gLjULDjYSRqqIGf8z5203Y3yCaqxbrtcwnwnP80IHJXVF
 m3N0dbzeuKv82zI+8xfzq3m86urRcUT8HTCu6Gh2UalNxfCMb8dstSUBE/JAaRvV2GM8
 kZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694779480; x=1695384280;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P6eM/yXaj8PkWr4TkEd5T8HyKUWTDYyMeFOOkASi5e4=;
 b=lUDxbvSZgikrXX577lHWiCydnuQ4ZjzsCzCq8hW+K5VXgACAcLCwiV4w0Kunt0TI6P
 9SyQXqocwNgTwcgSO6fkrzvl/eojk27x0/uK/s6FhvSNuhNKF16R1TCJdluDt+KEY7F8
 emkBs/QZNFyn9rmI5OyF5SyC3bcPFkaKjq0gDbeS0E5HkzzgIJYe2Kayv1C9E68ArL+7
 SjNo6FXqL6Cs7QdAfkG1+d7RS8uD7W+lbzzn3k5RREVtZM1Jgbfag2eYTT1SEGEedETP
 9FZEOyJS3GhtJVpLnai16G49wzDnaRHcZW9Zn8PX45elkX4ACrPmiUYKM1MZHiWXXNGi
 okRg==
X-Gm-Message-State: AOJu0Yy9uiHX0wzfu2gB22N7jaFJ6OdeDF5tvufvp+Q13rjn1LbnsVT8
 Y/yv7814SBX6xWkG89igAbKNjA==
X-Received: by 2002:a2e:924f:0:b0:2bb:b1da:27be with SMTP id
 v15-20020a2e924f000000b002bbb1da27bemr1376020ljg.45.1694779479724; 
 Fri, 15 Sep 2023 05:04:39 -0700 (PDT)
Received: from [192.168.200.206] (83.21.94.247.ipv4.supernova.orange.pl.
 [83.21.94.247]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05651c022200b002bceae8b9fasm686129ljn.109.2023.09.15.05.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 05:04:39 -0700 (PDT)
Message-ID: <27a83a16-20ff-47e5-b71b-82e6b9ea832e@linaro.org>
Date: Fri, 15 Sep 2023 14:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Refactor PPI logic/definitions for virt/sbsa-ref
Content-Language: pl-PL, en-GB, en-HK
To: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20230915115535.129834-1-quic_llindhol@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230915115535.129834-1-quic_llindhol@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: EnIeaXpdcrb7

W dniu 15.09.2023 o 13:55, Leif Lindholm pisze:
> This set reworks the handling of private peripheral interrupts in virt
> to use INTIDs instead of PPI IDs, to make it easier to cross reference
> against Arm's Base System Architecture specification.
> 
> It then breaks those definitions out into a separate header and switches
> sbsa-ref to use the same header instead of defining its own values
> locally.
> 
> Changes since RFC:
> - Compilation tested
> - Reordered patches 1-2 as suggested by Philippe.
> 
> Leif Lindholm (3):
>    {include/}hw/arm: refactor virt PPI logic
>    include/hw/arm: move BSA definitions to bsa.h
>    hw/arm/sbsa-ref: use bsa.h for PPI definitions
> 
>   hw/arm/sbsa-ref.c        | 23 +++++++++++------------
>   hw/arm/virt-acpi-build.c |  4 ++--
>   hw/arm/virt.c            |  9 +++++----
>   include/hw/arm/bsa.h     | 35 +++++++++++++++++++++++++++++++++++
>   include/hw/arm/virt.h    | 12 +-----------
>   5 files changed, 54 insertions(+), 29 deletions(-)
>   create mode 100644 include/hw/arm/bsa.h
> 

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
