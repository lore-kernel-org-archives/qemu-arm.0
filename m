Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4754636ejc;
        Thu, 12 Jan 2023 04:51:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzExJI/8sj7O/PbDFVe8k7mmkO3oQ5lEb0TdbJ7BmXlpF1CaTHRhb9UuG2/BP0Vv6GucpH
X-Received: by 2002:a0c:c508:0:b0:4e5:a127:382f with SMTP id x8-20020a0cc508000000b004e5a127382fmr102358364qvi.48.1673527889467;
        Thu, 12 Jan 2023 04:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673527889; cv=none;
        d=google.com; s=arc-20160816;
        b=H+U05oFwcKEd73Su80rFdrESXNWnF2+8FWnBacB6GXFq54LvtJXdbfIK9NW8ye6+RK
         Z4PiS2V0j7MDysJALCVi6wB76zBOkcT0JQpT1zx6HqYtUid2QehnVyzmmgZ2kyQEmyQ8
         3jDcUIozzN0EEik3jR1NIF2MQFUQmLW+C+5j1eNRcXcwspuSYzgTPqyypjmtk4kR7HU/
         nx3tpufBpdLdxsR6pJXxl6bfYIIaQQA1ZUmjHRtx1/zA0LMmkY6xKViYc1wiVIKWLygl
         SYb7kap439Tll52JWc44gHwzoncFdt4ZWk+RFBh+W2YZu8CflKx1LXlrlIXv8ozBmcj+
         QMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J616QJ//uvkH+sjki8Z2eWVa2X0z97if1viP1TeGMZM=;
        b=J3AwfM4oJusSpW7yfXfED+QhbfpAFojOWIXvFwfoHj4txBbc/tTUIIRoTEAXrkvFID
         xhvRaO/m7XJLKTEWX0IJBeXbCTdFk2a1SLiqWOot+NObR3YAtfyUz2lo6TRcagKNb48q
         wXugmSqYiHxuwZkQHcDdS8ga6PydUw9B/9IITNCbNRowyu9tXvTxpRaJl7jfbzzalq0T
         DqPWOjEw//srSe1z1Xm1b5MffV/NYuuqAvdkiH7FNQ14u+4zwu5FFEPdcaBpnPG8zdjE
         XZsCAwha+dVjtd2zlNORigx6o7MIuF0olhqARt6md9OWPxkfpH49PFVUhGnHLwq82icD
         eCJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=erxTFlOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a410300b006fefb4b755csi10152607qko.6.2023.01.12.04.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 04:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=erxTFlOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFx32-0001KS-De; Thu, 12 Jan 2023 07:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx2u-0001Gz-N8
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:51:04 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx2r-0005wA-1X
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:51:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w1so17977390wrt.8
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 04:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J616QJ//uvkH+sjki8Z2eWVa2X0z97if1viP1TeGMZM=;
 b=erxTFlOmFMKKwwrm7CgkXBvYxSfUHmwgsWLKnkhMfQf38Woy9Vf5vHgo1WJLbrERra
 C/OgRMjXzeNr7O5qmTzXtLMWXU3VfIMYLsDilm9VxwI9ioxU0yu1PxTiSNcY568uVvTx
 fj168FKhMA+TPnNQNUIfUhHeOEWIJrrIXwRKvHivSENP+G8F6kTTlPVRQDFnpEQxivi4
 UmhLbOod8sGBeZn44Djipyo2RcsznnUP/QvV8C33ls3lPvVhh9yz/I4XLfZqufV7yHMv
 R13AQ0TOYCAluTQkfISbg4Z9lEBe7WmAdhIDm/Pc3XfeivLwKFaJOb3823hVsUVwkeeN
 JPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J616QJ//uvkH+sjki8Z2eWVa2X0z97if1viP1TeGMZM=;
 b=PCKnY+wOpgbO/Tm9BMXT296T+HiaG6pf+3nQ4iWkF4lrnijuDbKezeNi+za+cUhhpu
 pJddDwn4ajInpxdXDiHQfMANuy5oxfpjZEoknNH5EGZC+w04IwSF6P68Y2iwVkBia4I4
 qDjEF5Qdz1+KTvVq6z7O78y9ECYBPeZ8y41I6DJp9S5pS7TyMtIaDCi+ZS4gUHeMEg05
 PXSKOFECp07samoIkDhOlTSTsXgprds/yjJNCvhlN8m+hM5epu9TCUuxdRZ3BX+kZj8L
 cS/hHfMFhUAWHDhjWRJQrUwcS3vajQ4r1FVFVZIsnKiAq7X2yawEya2MLpyhYTdFzpx7
 TV0w==
X-Gm-Message-State: AFqh2kok7PHBYOvYDz4ZIZf2KjKE/eocHYzgMlbZMcI6Dxoe9RIVkzC+
 VLw480TNXBNmft8W+zbNTbyRCQ==
X-Received: by 2002:adf:e8ca:0:b0:2ba:bd95:e3b1 with SMTP id
 k10-20020adfe8ca000000b002babd95e3b1mr18837491wrn.29.1673527859507; 
 Thu, 12 Jan 2023 04:50:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d66c9000000b002bdd7ce63b2sm1051893wrw.38.2023.01.12.04.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:50:59 -0800 (PST)
Message-ID: <f4c3ec2b-6005-6b7c-9f66-a942e9e0a384@linaro.org>
Date: Thu, 12 Jan 2023 13:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
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
 <20230109172347.1830-29-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-29-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Hu+1fxe7TcyK

On 9/1/23 18:23, Bernhard Beschow wrote:
> Now that the PIIX3 and PIIX4 device models are sufficiently consolidated,
> their implementations can be merged into one file for further
> consolidation.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-37-shentey@gmail.com>
> ---
>   hw/isa/{piix3.c => piix.c} | 158 ++++++++++++++++++++
>   hw/isa/piix4.c             | 285 -------------------------------------
>   MAINTAINERS                |   6 +-
>   hw/i386/Kconfig            |   2 +-
>   hw/isa/Kconfig             |  12 +-
>   hw/isa/meson.build         |   3 +-
>   hw/mips/Kconfig            |   2 +-
>   7 files changed, 165 insertions(+), 303 deletions(-)
>   rename hw/isa/{piix3.c => piix.c} (75%)
>   delete mode 100644 hw/isa/piix4.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

