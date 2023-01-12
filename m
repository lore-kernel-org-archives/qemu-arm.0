Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4753272ejc;
        Thu, 12 Jan 2023 04:48:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsB9snvEGqeDjF/4z5gVaBdWtMnvnvk/KAJsvNc/iOuN9Vgg1t4WQi8hkBSGBZWwrmjeE+L
X-Received: by 2002:a0c:9171:0:b0:4c7:2be8:54a8 with SMTP id q104-20020a0c9171000000b004c72be854a8mr106080240qvq.20.1673527739161;
        Thu, 12 Jan 2023 04:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673527739; cv=none;
        d=google.com; s=arc-20160816;
        b=B4G1eM39FCE1N1PmBgBzg2MQHd6puF+yEIYdZ3v4wYve2HoGCFbHtZ+utJG3Dj+3ra
         3aAOUNIcqpy/XJ0l0GbSVtCdZ4l5eMtjrCGpBT3exzTA2ylKBcXMot6CsBN9cOz5B3Ni
         w8Prd6c137NJBICFcnQFHD6eDFNGNjWoFEO7sh53gqdLSYs6DUklRz9OrFPXdz3yLrV5
         680QZvhX3lnkP7PUZZFq2/CtZcfP+oHc2lZ5rmCZym7t/uGfg5V6xDSe6rKuUX0KS3wF
         uEbFjtbby7YKtVf2ihp10UGMIYmcIUroi8CwfeZFPRwhZLYyTGcWfmRL6xAJHCdUli/F
         s4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4uDrzEhn9Ql1uGXWp3heg9u1rvBVu6E9pTu8NEZagTg=;
        b=NMf1BV6fsbXu/co632akdhtl91J80Gj/hKCNanVnm/hXhdD/k3m1lz+gdgO4bTrKAm
         vhisbuiXabrSM0YOU8jzPKWcahQJ3hAVorfFT5/vM7mtt6bUczzKz1Sj+l/NOIvTqTGT
         GrsfvxUfa0R6ohwVCt/bMOhIBFlTgslIz1AQshilY7erjmzI5Tj84r1OJ1GXMjW1JSMi
         LEoSEG1AS1SVGOZOA8PYkR6VzQQ6oq3JXDjLBgyD6QUlDfdMBP9QDKRJYzuThM76qp9M
         dMhqFbNy74pSw7RXfmx0+x4QaIAOhzCgMzt5N5z5ZUShuYZbElFkNRVVs6Ubks5db3fq
         QVWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxBVDuzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a0562140caf00b005346d371efbsi432773qvs.453.2023.01.12.04.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 04:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxBVDuzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFx0A-0007mp-Cp; Thu, 12 Jan 2023 07:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx05-0007kl-HD
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:48:09 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx02-0005AE-KO
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:48:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so776473wms.5
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 04:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4uDrzEhn9Ql1uGXWp3heg9u1rvBVu6E9pTu8NEZagTg=;
 b=BxBVDuzI+7uKbojvbKuBNQmK9GI9dyOJWj20Dx/X3Qm9tT7fwK7HXA5SruWSneBiIg
 ddHRwSH0hQNWN9FoQ13k8wGZBVqXZ2v84eKOlYnLuYjNWnOhMQQ8X6RUHfvD2WhSphZ3
 +1u88lLhR4HWLg6Ws452aNOi0SSbt7fmkfQVlMBJt59YQWZFQLdtg0AxaStVKKZ3FeDL
 tuaTueOoeQoFQWsqJXEUAIIwvyOFaQTWAcm/DEiZX2vLEpmZvvTWydpy3R+hl4j3w/Je
 1hSmolR3wO4zLij2tr4su3h/MaXCaGHMmhGvJiJ3krmYwAGcorlaE6uKuQeBTAtYhiRC
 3QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4uDrzEhn9Ql1uGXWp3heg9u1rvBVu6E9pTu8NEZagTg=;
 b=3fkN5mjZRsYPYLXbbQE/bEs6+vW0tzM3oZNlUlB/5HcwTt1J0Gvk61+F/2Sy2lOhAz
 N/D6dBSqZlwZDudPF0VbHV13Y4HyYLsn/l4tHhmqDlmGGU03WyAPTn+F9eRdgOUUOhGf
 p5ivh6TDbTozAsXlwM7Ko/fcz7lQAYsBoT5gOoFNtKdDKGiusvsRXe/VQpApqH0fgtkm
 oyOnatmpy6gDymOSGNcUbmFnBPWVWRBzobY6LQpld8AUMUmaMghtvugMYx50zPMyktwW
 o0QAgtmz4o+uOCEOcFlnr4HIb0ZDPI1hz2Q4tWstRrCMKx+4MvAzX6r17dTKX5OwDGtU
 ER8Q==
X-Gm-Message-State: AFqh2krrqPqIVbM7GJlH+KRPruD8CK+KTUTTClbIAcsNiLInxlRYlyjy
 4lJNE8K6zQdLd93MqZ6pCKWG0w==
X-Received: by 2002:a05:600c:46cd:b0:3d9:a145:4d1a with SMTP id
 q13-20020a05600c46cd00b003d9a1454d1amr34836422wmo.34.1673527684921; 
 Thu, 12 Jan 2023 04:48:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm30517209wms.43.2023.01.12.04.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:48:04 -0800 (PST)
Message-ID: <50473bb7-c91f-4264-45b9-525125e3c2bf@linaro.org>
Date: Thu, 12 Jan 2023 13:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 22/33] hw/isa/piix3: Drop the "3" from PIIX base class
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-23-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: kqsrcNLzz86G

On 9/1/23 18:23, Bernhard Beschow wrote:
> This commit marks the finalization of the PIIX3 preparations
> to be merged with PIIX4. In particular, PIIXState is prepared
> to be reused in piix4.c.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-25-shentey@gmail.com>
> ---
>   include/hw/southbridge/piix.h |  6 ++--
>   hw/isa/piix3.c                | 60 +++++++++++++++++------------------
>   2 files changed, 32 insertions(+), 34 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

