Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1229266ejj;
        Tue, 26 Mar 2024 02:56:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqP3SooFk1VzApSlQ6NKnXFutANtnknc72qurEn411dkTr4KRrbzgGCJrIqNWuewykkL2mqAo7i5Gh7XnD5yc0haPdIeD4
X-Google-Smtp-Source: AGHT+IGjxVk9Efvg0aH8NtTuZ06NNDw4yHrSG1evc1SKEJ1ut+8Tav4AHSfk7sNVnkWmVwLab5zm
X-Received: by 2002:a05:6214:f0e:b0:690:ba23:7db8 with SMTP id gw14-20020a0562140f0e00b00690ba237db8mr11748131qvb.18.1711446968130;
        Tue, 26 Mar 2024 02:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711446968; cv=none;
        d=google.com; s=arc-20160816;
        b=ISn3GtJ9jGKYdXfxquKT/tOAuoRMSY9bF4NrPHb6O5XPDrPh9MekOeUle91QrXRI3P
         V49m5N6Oi/gkEMJR8XdBmSXUk0hvalP27y9iuObuWdHsJ9qCXfSQKSk2KOFmDGnVV5gF
         sj60nSBRrvyweAL2ujR86xT1KRIoI4bR1iGS8tSAnyo93KmWCGOREatVn2Yw+z/sDul7
         dpkbd3Q4TF7sJPFA8jwQ4jPS28MKjvNfrNngBf7jESOG/7EW8AsTtQr4KZWziVoYR3cw
         kV0MxTwbLc7Bzjea4sCEWS9dOQY9MXncT49d3UO9+iTk8MjjDDpxLJoy5mbUPLrZnLNj
         jNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zCB0SA3PLv8WNhbjHVBiYQK5hT8Xlfs6CZwCJfO5OeU=;
        fh=5VDnSnXuEUpnqP1jGU2z4Jh37X2EDikUf6qe7Yn3w4A=;
        b=QCuC2YygR19rBJ9BG6oqm8PkKcwUA4ZlYuPdzl2gJUS4KMLPb8o7QO89UL7zByD0CV
         ZsrGPc6FhvCVbIv/BuguPKW+EdvOdV8JisJJ0KXnJPmZJMIxVPb836OEPj2niZI3sZab
         8XHcStPsMx3z9RU00ACYTamUTHxKcPqwAMLCgtGjEBM3LFGkZ0bV9nyrP3lLSHElaI3R
         t5Gu2XWdcZrsQRoXeMTSUuJasalaLwyPYRrjfioI5X0OH083lzKnTSslcD6yeKZWCLRy
         vhgdg+vf2WwPKIrhtDrKmbMAPD2o61Xe1ys0qDPbyJ1jAi9AmcxdazzHnLgPEyrIVz/X
         nbAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIK5g43d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if12-20020a0562141c4c00b0069689e194edsi4607948qvb.217.2024.03.26.02.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 02:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIK5g43d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rp3XE-0007cO-Ik; Tue, 26 Mar 2024 05:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp3XB-0007br-UB
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 05:55:58 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp3X9-0006sX-4w
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 05:55:56 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-513e134f73aso6808346e87.2
 for <qemu-devel@nongnu.org>; Tue, 26 Mar 2024 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711446953; x=1712051753; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zCB0SA3PLv8WNhbjHVBiYQK5hT8Xlfs6CZwCJfO5OeU=;
 b=OIK5g43dd+mq6qXBjqrRq/4NhY9CL3o3/aj65Eb4z7gJ21TfqWx3pNsIU/kwDqCEpf
 S+QTevvI98swtIVWP+dml8T1ZHd6lhGVu3VNQiVpJG6aC4N0m/iU2zt3kmfTvgpC3T30
 sLZcZ5fhLiqTQXh7UTHTLBVAaDVDG9LDMsG/EDhictXs+bKO7/iqQn2axM5NiUoyP+yh
 a1QzoUepy6Yj6YqkKfOjK7uXIPpMMGRZV0KhGXu3sdPxMy6bWPdCCERX/qDlZJM5v8hV
 S24KYRbm5xwduJoCiMdIIuubH/pKDP/AHo3r7kxYcdyaWQ3sFD5A+hUyIRWcgUZKE/y9
 lf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711446953; x=1712051753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCB0SA3PLv8WNhbjHVBiYQK5hT8Xlfs6CZwCJfO5OeU=;
 b=sturSOGm6b6uFSgSlPD2WxI60puMMwSDuy3DZSALC+QHVV+x9RszkHGWS40jv/+8ex
 ZiKQ0J6AT8W9Gsg569pZB28Ju215VWgtjSERp3k9FbDBcWuVtF7e5J9V7Db9uv4fVyJ2
 MHxHNGJNHAt/pMgrWlwxTwJFtVduzdDcaAJ65fzAS1ATTSMuWh99lUWDC9Ig8rKA3uuc
 cV/THzuWEUEd+OMETDyr9cAWPzEoSrWRJ7Ez58IZtUbvan8e4ELBCmjcB6h5aQRzOWV1
 LluNvSgOQnyTY4kOVszPyj6wOG4JYQLGnLHHzUqyfeTWdfYwIE9LjOopgVOpLw9GIFQ4
 QhQg==
X-Gm-Message-State: AOJu0YyGJMBwVtUvlS9fgDCl2FRYg9fcGOuzwsSEAyNpcJ88tS2jeVIv
 ot1aSsOljwgrTKEf1bQVfzI+CAv4OROqO1zNsD9ZYRSrezNYsy78I5hO2pg61Es=
X-Received: by 2002:a2e:9257:0:b0:2d6:d45d:b49b with SMTP id
 v23-20020a2e9257000000b002d6d45db49bmr3983563ljg.10.1711446952831; 
 Tue, 26 Mar 2024 02:55:52 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a05600c310400b0041462294fe3sm11043010wmo.42.2024.03.26.02.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 02:55:52 -0700 (PDT)
Message-ID: <10713c68-27d8-49b8-b50f-6648eef8d277@linaro.org>
Date: Tue, 26 Mar 2024 10:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca955*: Move models under hw/gpio
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Glenn Miles <milesg@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20240325134833.1484265-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240325134833.1484265-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sK1QVjObVKqm

On 25/3/24 14:48, Cédric Le Goater wrote:
> The PCA9552 and PCA9554 devices are both I2C GPIO controllers and the
> PCA9552 also can drive LEDs. Do all the necessary adjustments to move
> the models under hw/gpio.
> 
> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   MAINTAINERS                              | 4 ++--
>   include/hw/{misc => gpio}/pca9552.h      | 0
>   include/hw/{misc => gpio}/pca9552_regs.h | 0
>   include/hw/{misc => gpio}/pca9554.h      | 0
>   include/hw/{misc => gpio}/pca9554_regs.h | 0
>   hw/arm/aspeed.c                          | 2 +-
>   hw/{misc => gpio}/pca9552.c              | 4 ++--
>   hw/{misc => gpio}/pca9554.c              | 4 ++--
>   tests/qtest/pca9552-test.c               | 2 +-
>   tests/qtest/pnv-host-i2c-test.c          | 4 ++--
>   hw/gpio/meson.build                      | 2 ++
>   hw/gpio/trace-events                     | 4 ++++
>   hw/misc/meson.build                      | 2 --
>   hw/misc/trace-events                     | 4 ----
>   14 files changed, 16 insertions(+), 16 deletions(-)
>   rename include/hw/{misc => gpio}/pca9552.h (100%)
>   rename include/hw/{misc => gpio}/pca9552_regs.h (100%)
>   rename include/hw/{misc => gpio}/pca9554.h (100%)
>   rename include/hw/{misc => gpio}/pca9554_regs.h (100%)
>   rename hw/{misc => gpio}/pca9552.c (99%)
>   rename hw/{misc => gpio}/pca9554.c (99%)

Thanks, patch queued.
