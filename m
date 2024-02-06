Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1926970ejb;
        Tue, 6 Feb 2024 08:49:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDgDh1hWmzxALyqx7Oiyow29xhurujeEpNaXAJW0/4FxPgaXOEfL6rMDFeN7qzAq4v7i7o
X-Received: by 2002:a05:622a:1453:b0:42c:b29:ad6a with SMTP id v19-20020a05622a145300b0042c0b29ad6amr6810163qtx.31.1707238175386;
        Tue, 06 Feb 2024 08:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707238175; cv=none;
        d=google.com; s=arc-20160816;
        b=Ft4Lyz5MbgJ4v/gAidJYxaD7XiV0PW4t28ugb4np/w9oWQstIiqAmAXziGVT2aoTQn
         gYW7OKo+qe5DfUj0b7NszMMxrX4+sPagOPJXwnqqSTmi+oBq1cho6BPc2ijgXPVX7XLq
         wbreISxYkQ4cXtusSRZwpDZ7nXj/6CIoSfBb6OK2/l0fHJoXibsZ9ggTjUOYCLvwjPy7
         kr/x6NS3+ZwrP2m47FHLh9NF4tnNslrPutxpRei+glNBufWflAu8nhOyqePIrFhKtRMm
         peRpvwzV6ckJFtFMiMVMiRfYjAiLhbVHp0Upohic9JbhTtWJAjuzUUal6fujnCmodXOX
         kLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YBKSlLtaNH8fxIz6B7TtoPw5EWlHODBuxDku4oG9bEA=;
        fh=o+TPxMbVrKlBjT3ucfNquEVca8DUnlsqU5U8fNeTu1Y=;
        b=QLpgjs30wgaNaKplCrR2vjYG9wizUmy+uha/fxpY3NH/aHaMSTHFmXeT/xuHeK4Ray
         Qt2ei3U07rLngIVxtoTZizZg2/QIasHjSSy7fw2SmLBXAbQlQGJuvdPKwCpGwTYencGk
         Goh/eJVPe8VqXz2glDsjZtVhSqJthT8JAH891IbMGdsAjBetAUR/sbtqr02Rsm1FPx+r
         XcHHTAgCWF0LkKn+xUSiRdtGVRLE0MO/nZchrdIdTZONlTLXntuFGmQfQWWRO+nZzKaU
         PifM2Dxm7eql1ZPuH+SnEtr4ygH4Y+NRNVIFrkkowJEqhbXiSzpCoMlM1uQZ2ndJzWna
         1Bsg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hs8pAz4z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXZTB02+dNOZFhIZCkRf4sWbotJQZTlZX9fEmQnZY2dQZ1IXF4XHbeOy9qEQwKMKN8oHixiundPGn0Ivn2vidATwKYK54RQ
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020ac85d07000000b0042c0d92f3d4si2825546qtx.587.2024.02.06.08.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hs8pAz4z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOdY-0007WP-QY; Tue, 06 Feb 2024 11:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOdX-0007VC-Ha
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:49:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOdQ-0006mS-Ae
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:49:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ff0697271so4572915e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707238163; x=1707842963; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBKSlLtaNH8fxIz6B7TtoPw5EWlHODBuxDku4oG9bEA=;
 b=Hs8pAz4zSuXfZQfUcyhbQIr3/g5rXAUy9mrABnxa3oY0BIK2JTlTMwHmYtGGegG+qw
 dvJ3SjQMPuzjEY/PnQ6UR0hAxBAKZ8WSwuxNdHO9U4z1KQh27Z5BSD0OeLVpjcQVUVWV
 DuutccK1m1cr+IyG9FDWw7hJW8enFA3dEI/8Cj25K6tM5W5YQ+xRW2Jlg2MS6uk+dnFv
 q6IV3PHEhLvExgPyU2dtPbMYDn2ZrxJlwiUZEkj2I2w5smeMBdxFLEr/i/+wq5KaqnnJ
 RqzU6n/FMZvyH1JjGs7xmzcMnQKpurDW5uemLh2Ln+tlvVlExR8YwoVu5/fkCWVZIq/3
 DmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707238163; x=1707842963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBKSlLtaNH8fxIz6B7TtoPw5EWlHODBuxDku4oG9bEA=;
 b=eT/LZwMjz2ENx8aP2p2bLMueHBF31E0mWQP6gQUz7Um1rWrrGQOOl5/s2pT+zNrliH
 87HJ2dMTDeYQas8J8OHHruaNtisT/cybfuKzUgPhr0SyGBQfqb0AIWZ0bOZOmkYL+VmP
 6MOaOc2BEATSVRy2VImWsiLBA/iopqD28+8nIPjvqoh74AiJW7HUq5RQQlMp6Mc5XW3V
 ZifbHOQqsmqX895LDzlEiv5RnyfEOxBw88a0zcrb5q/R9I/dup3S72s3Pi71edQrLKQV
 ByYOo3jYih6MAzRvravVGzp6BCxDdMNcSaTbUwuiv4vS2SEu5t7NqUTipJVaVryDJU4v
 64Yw==
X-Gm-Message-State: AOJu0YwbKfpUJsHHdN3P5XM6mVdfsreEK5yy/EA5QfVileWjmDbmHbxK
 yJRlkiy2lB5iQr+qQXNhw6ofZpgrj0Dfs58gcwcys+Xn1MRm1WZo7gP9QQh18i8=
X-Received: by 2002:a05:600c:4ca4:b0:40f:c655:aaf0 with SMTP id
 g36-20020a05600c4ca400b0040fc655aaf0mr1940019wmp.23.1707238162830; 
 Tue, 06 Feb 2024 08:49:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkR6Qe196rlCSeZ4rLQ0+a6GcgQb6KUa4ITyxrJsCxEpPfjaD6T1xD3rxbCvnlzUi5MLxR+kUsRFZinPmDu7gLAnH/qcdcbAq8PvIfI5hvZE2Cn8Wfw3bYJRU=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 l31-20020a05600c1d1f00b0040e3635ca65sm2534632wms.2.2024.02.06.08.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:49:22 -0800 (PST)
Message-ID: <fcc684db-635b-4640-a0e1-51b0f12a459b@linaro.org>
Date: Tue, 6 Feb 2024 17:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] hw/arm/mps3r: Add remaining devices
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9yUWlHfN3YQU

On 6/2/24 14:29, Peter Maydell wrote:
> Add the remaining devices (or unimplemented-device stubs) for
> this board: SPI controllers, SCC, FPGAIO, I2S, RTC, the
> QSPI write-config block, and ethernet.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/mps3r.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
