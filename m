Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp293047ejb;
        Fri, 26 Apr 2024 03:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCLovzcHDU/Nj9edhNvLYCiuLZjMoGCyWjirLQLFkFOMCLbfawtjGqZHblkVpx4Yv1+hjDSGKPw9USEQSVwUo7585HU0G9
X-Google-Smtp-Source: AGHT+IEIzBUAGuqGlyckxunO4ZDuHsVu4T8Mz0ocPHRi5sHvQPtwamCJeWKMEySFlEtFysUlqbfV
X-Received: by 2002:ae9:e915:0:b0:790:62f8:d5f5 with SMTP id x21-20020ae9e915000000b0079062f8d5f5mr2758761qkf.22.1714129181946;
        Fri, 26 Apr 2024 03:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714129181; cv=none;
        d=google.com; s=arc-20160816;
        b=iULfVhNzRpnmmpPayi+wbJYARYqa/KvpXD0qCi5nArrluauc3KwspuQNX1TTAwjpVS
         c61QhKnEsyi+l3G8ZVD0f/F/IgTgk9L+9Dqcc0eerIVxsaMLWVPemlhUbuP9YDw4wQ/O
         +4XZjLBOBj1+AlXwUpN3n07ArtCiRzhpTKkpXekzQhTHzarzMUuOPekH54xevzjK0RYy
         8bieXZVE1GXqdY/rtPA4sKQ3G/f2j0RSb8HVqkT4n7+nqFaQSEavH2Zqz1/R0Yu3naFZ
         wWZyYNOREO5t1FrKy4KdGltrjBiIkt9iRtFh0jZlGb0+5zorSiR0xpNcHe4bTY6x8Ckm
         NNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=voT8UCcnqz6VM3ogjtv8L+inv5gyz1R2btDp3ebZ/y4=;
        fh=UceNKasAvV09dANhzANs6LGVurTnoMH/4PxIO5p75g4=;
        b=ay9NfptdKdhllYFTU+BRTkwQK3rsrdFrbgSfw/LPqsgBL76DbvkRBWb+H5qAI4LjDp
         NRWNPV6tQlqKKzPW+hzONPnRIpl9LpxyV9U+xayZUUvWgd1Ewq2GSRU59eYc6koEaYGJ
         Qnn+2NwlP5TTSMmjkRI9IS1ERR3thZM2pikYUzYM/OrLjaY5hJBY3THAX68sDfrKDlwp
         F3d8ZgkTHy+TH+vxnfI0mIncg40IfE2130cmR7bdIbRvsSlQrLAIX4+cnVeRP7jLQ5wI
         /TM1fcFlq9bNOCJOzllsdLD2eI5sNiBu+IeJx4HoNx1WLlSI9ZLBcRRnN4oE9iVoElMl
         TEHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LUX09euN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op1-20020a05620a534100b0078f0532cb9esi19110847qkn.436.2024.04.26.03.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 03:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LUX09euN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0JIf-0007kr-Cp; Fri, 26 Apr 2024 06:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1s0JId-0007ji-1y
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 06:59:27 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1s0JIb-0007gW-Gb
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 06:59:26 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a587831809eso236308666b.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714129163; x=1714733963; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=voT8UCcnqz6VM3ogjtv8L+inv5gyz1R2btDp3ebZ/y4=;
 b=LUX09euNRyKAJvaRO0mqsn+BwZVEwgYb4yZlq7IuW4l2PGOGeMsIpWLJhALJOG35dT
 hWqomhYUkstgVQjgq1Jiawa5nnBoGvx8MWboEtg/OuNW9Z+DEjyScd7wrpPytczaa5Zo
 Sne6SbTUz22bG6dp+3DY2YENgN0XaksBsEqVkSdq0KPmC1XUOUKZKIZSUiD+ap2bYloW
 ae0v5WSfaCLVbdTmYXcCFtKXJUJ6qE1Ft3MxW2K0bw94omioXryBzI96n700euL/MY/c
 2CFRZHA1Rzbv49aqazOXepH4dJcs/eTW1DLhZHcLbKbwegpYzFAURR0gfzIF3Cd3QBDL
 rT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714129163; x=1714733963;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voT8UCcnqz6VM3ogjtv8L+inv5gyz1R2btDp3ebZ/y4=;
 b=vs7JFUAQFmCQvwP0C1V4FO2Z0LQTe7P1VQIRHi38OPsx2IHsRS4u92CoO1VyEQeId7
 YnPR0pWxYZGKWD+bC/kvMoipgxq/BrGFZrKA825U+21CsTOA9uH2IhCLSjjjjxx5em5u
 CH4zZFVhR1mUxrUuCVW9H3ngcWT+jiEHJL0ni9722TZ2uEBOtwr6hWorrrhWKwtB5GeS
 IqAOqCQL1y93jtAeC5d9b2mblohyB7ZQKsFWkcCkNQEMPAaWSlGXiVCkZaLXOf4Vthry
 s24ShHVitGPRpkBMz8xryazIBjCQQ85IwDLSJ9+AMGtiiGMB/HTVC2TZ69zv+92tBhYd
 Af6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD1ll2gO9Jn/OSvRNlqe67C5QyhkD7hCFGbGo9TqQrZg7iRbmoFgz0aa0PKZzJCpdWMQTOoK493qWubRzcakmkkLP/
X-Gm-Message-State: AOJu0YzCdTz+CJ5fc9WYO0RU6J3Q/W4R4MXcqMXcBA0PUtPWH6/RE4pZ
 NOfuQr8TQzZVVKCcenHjaLI1wjJ4DZHf+lG4Uj7t5w73r5AvoML5X5o7DqlRda0=
X-Received: by 2002:a17:906:1c48:b0:a58:9297:91a1 with SMTP id
 l8-20020a1709061c4800b00a58929791a1mr1715465ejg.53.1714129163124; 
 Fri, 26 Apr 2024 03:59:23 -0700 (PDT)
Received: from [192.168.200.106] (83.11.4.140.ipv4.supernova.orange.pl.
 [83.11.4.140]) by smtp.gmail.com with ESMTPSA id
 mc11-20020a170906eb4b00b00a5256d8c956sm10445325ejb.61.2024.04.26.03.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 03:59:22 -0700 (PDT)
Message-ID: <a3541699-966b-4940-8a58-bd41dbf3001d@linaro.org>
Date: Fri, 26 Apr 2024 12:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Xiong Yining <xiongyining1480@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com
References: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
 <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TZ3rNMJGVD1x

W dniu 26.04.2024 o 09:35, Xiong Yining pisze:
> From: xiongyining1480<xiongyining1480@phytium.com.cn>
> 
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
> this topology can be passed to the firmware through DT cpu-map.
> 
> Signed-off-by: Xiong Yining<xiongyining1480@phytium.com.cn>
> tested-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>

Thanks. Checked with TF-A and EDK2 patches applied. PPTT table will be 
more detailed now.

Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
