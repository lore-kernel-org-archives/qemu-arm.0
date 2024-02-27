Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2541490ejf;
        Tue, 27 Feb 2024 00:36:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWU5XkQLapwDe4PUE5pJtHguaomqqlYSvbicyHGzk1Ap9yizdwn2w9tdN+UmBtJQhErd3kYWq/9HZ/N4MbDfX1qyHG9I69r
X-Google-Smtp-Source: AGHT+IFd5338gs0c2sn8if4tbcsCg7SrAPk9elcgtK4DKY0L1+JWVuR61i0u4ziRyZuApf2AwCoE
X-Received: by 2002:ac8:5e97:0:b0:42e:74bb:5fd3 with SMTP id r23-20020ac85e97000000b0042e74bb5fd3mr7385320qtx.55.1709022968243;
        Tue, 27 Feb 2024 00:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709022968; cv=none;
        d=google.com; s=arc-20160816;
        b=h+xpuFM/7o1mL/Z0tTDwJnLLAXjZeGc677Ioz7crzz4+om81AIyeuA540O9sn3qdEH
         2GxNTcabXaEivpK8VeBpf1LyE5Y3pVB4AXX+Dg8bQj+QO6VQ8Qod6DbIj3LwKuYs/mPh
         iDqZo6dS0xNTXh+bqFbYDtw/v2whZoBSQ75kNA8KjSIF55gX5EpqTlUgc/TQkZCZUrS0
         RNWckSfllnRydIclO6PfI5lZ0pap+RJFbP0djjeuPjSrT8pv60yEMfnRXygAkPOVaAT9
         sx2t854LfRXONDqhbGLMEECM6iimLkfA15IzC7fLoVKkcz2kQliA777DSQkr4pZvYed+
         MS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VDOx5SO1DOxTpjcvJTrE8g3gdYi/XgVRkYC/Dopt96M=;
        fh=wZp8Lxhzr85Wt0/Mty4wykpsCfImaHrgHFVTYCacP1c=;
        b=yi6N7b4sEYJinkeBmR7Qhfj+dLyQJ6kljrxLJbrV6SlozxaGlAYR9dd8+ckBLllao5
         hpRbNc9uRsWRdkjwcO/jhyi1dfT7YAmj+C0coFwuDtSy+ejLLd6EHk/jgI+Dzn0vXcDn
         +QO8QVNaSB8vQmRVmZ6YvReKsEvhtMfoJznGOLEeCBH9/cPbuBwPQxl0pQsr07MqTSqb
         +pBywvfp3SZ/qvnXeXv+qtxAD0bnXCcsyU1fjw9h3ZkMWM+H0P/lZ1ZL5tmEX763bYbX
         3O8M0aQSwHgLnZdAIxHFkP42ig9P44XAi48OHpX3D1vt92+V5BOQqzNScGPm8/MX51YM
         LRrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gIkMdc/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s30-20020a05622a1a9e00b0042e7b414b2bsi6277520qtc.689.2024.02.27.00.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gIkMdc/V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reswM-0002v9-MI; Tue, 27 Feb 2024 03:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reswL-0002uQ-OD
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:35:53 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reswI-0006Y6-LT
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:35:52 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso496090166b.2
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709022948; x=1709627748; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDOx5SO1DOxTpjcvJTrE8g3gdYi/XgVRkYC/Dopt96M=;
 b=gIkMdc/VIZh3+ziCHFiXA1SlJT5HWcCrVmrFknaLJjfAR9xio/dMSlIfmpJxeNLVPX
 u8e50FDHyQ6rSiFhlngiDJhT48X2NKlVsVwr2vFNYhRSNqPLrPxB5tsr3GziF04CZOtv
 1xVjI2uDmNhF1U5LTTHkuSBphzaLhuy6G/uNiDeUiFpGonYpMGBseqm3Pr8Tyi8C8Eih
 BQkNWY6T7BrPom+4uoBgGTU9iiMrlgNQ/rEXZSQX9EIFfAGgkUYAkl0Ry/6u0hdW+Zvo
 mGYzE8+z/8W2EaTzjbKFjkSRYlEg5pwrQgRd/3DLjoeHMkC9WiufMR+Q6GKU+bGOzpLb
 48YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709022948; x=1709627748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDOx5SO1DOxTpjcvJTrE8g3gdYi/XgVRkYC/Dopt96M=;
 b=DALjeaXnyXc0xJ1DNdnla4hooAAxK7mAwUASL1+Mi3rrHEqVMShrKW8MMrL6q9L96B
 55WFE+TlbwrCfQk1xSc+OdmduBn5hH6TJgOWMR0mi+QIhvAih9k7ufDWKpnf39lstfb3
 ZixQJkqVzLqjVZzvp3SdgzUqHNnV4z2LWX1CBeNoQZciogTQkjCXGqk6sAGWMVkwOVFN
 zQkIit92ryovQINzVLGhjrC0STh2BNpMLx21ojDHdw7SYBJtVAi+pwyj84qKG9aRA/ne
 fDEh8mO9l0Bsu5UAFnUQ8zU/Psdu+9Vz50F9oOaKHzLom+trm6mU/1oEYwAslTtqH4Bn
 oUNQ==
X-Gm-Message-State: AOJu0YzUfhSyn8MWt/od9qq8UML4oC98Ox1+FQ4T8Mv75gZ9CaXQvBra
 WgchlcEMrpDD4yOcHvT0kQ5FO9YiBnA/XSrVjLW9mdCEPUWdg+oWpc1TosbaerQ=
X-Received: by 2002:a17:906:3c05:b0:a3f:db30:8999 with SMTP id
 h5-20020a1709063c0500b00a3fdb308999mr6938614ejg.4.1709022948541; 
 Tue, 27 Feb 2024 00:35:48 -0800 (PST)
Received: from [192.168.69.100] (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 m16-20020a170906235000b00a3d153fba90sm524141eja.220.2024.02.27.00.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:35:48 -0800 (PST)
Message-ID: <36af99eb-06db-40ac-b086-36394c2457a1@linaro.org>
Date: Tue, 27 Feb 2024 09:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] hw/ide: Make "ide_internal.h" really internal
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-block@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20240226080632.9596-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226080632.9596-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tIjBWi8QCV4q

On 26/2/24 09:06, Philippe Mathieu-Daudé wrote:
> Missing review: 3

> BALATON Zoltan (1):
>    hw/ide: Remove last two uses of ide/internal.h outside of hw/ide/
> 
> Philippe Mathieu-Daudé (2):
>    hw/arm/sbsa-ref: Do not open-code ahci_ide_create_devs()
>    hw/ide: Include 'ide_internal.h' from current path

Series queued.
