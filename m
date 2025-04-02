Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3262865njd;
        Tue, 1 Apr 2025 23:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2tMeo2NRaA3LXu/QoQzNpb+BJkFviHdKEnazCladPUFqBIM/9WVLhi9xn37LxoqmNbPy/BIoyxanDKg==@linaro.org
X-Google-Smtp-Source: AGHT+IFryw2pdOhEVML1dZ5CWOsuu7aNvTrfreYBL6Oxs0gah3t4QW4NSX2Nm3ooKvon/NgN4OHK
X-Received: by 2002:a05:6214:1c4a:b0:6e8:97c0:76f8 with SMTP id 6a1803df08f44-6eed6217d2dmr248857476d6.27.1743576347190;
        Tue, 01 Apr 2025 23:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743576347; cv=none;
        d=google.com; s=arc-20240605;
        b=PI0AtlIlpVgBqD2xF7YyNOyuBZfYqm2/MM28+mqRssvB7ladefFg4ux88g0BoXyPGE
         wvRFbSVlsaFylf96bCsrrwH17S3oLtnf3Hy/AwgqtBGBAxWsNWbqUjU0++KOM/HyNtLY
         5KNKDrFxpbyfLUnJrINNlK/EuUuVPlzb9Ocr6gcSodt0TiKxDPMemJemwfNooPuu6bFG
         jTVlJ1+n35RqMEnsqgypeegT2ElybhqovZbOynzsmIgLVYQU+5Jm07XPB/AtcR7aLEdq
         /LwEG4SGkkPNMDE7TZZizGQ13kSBEYotysP9gqHfGhtui/LZmh0UEnu83rBhUdt/ozV1
         AqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=66le4xdRwCwExmc00i+ptfK0z39q5TMVnh7p70vuVso=;
        fh=yU5rjdSPjN6zen6s/SthlR0CvCmB8YnJ3GGU1++QHwA=;
        b=D3ui+zyLTWhCVPG/ZJybE0EtxhnAdOo21TKKlGD45WCPY1BYVsWrh9ClRqkLdXuvLR
         PQRUY9usc4a+XgZr1M1o8tFZNftsv+wB4GsenbpP7rEyCNcqgNqODlCm8IxY93brcpP+
         s9D3HQDd5Vw+c9MrDjTnNUWmHoQO/45fq0JMKol4SPP+PpUqX80t7326U3JFrTZ8n7cB
         TGyxE/Q8+6HMaHY3zFYmdaaNKq+0x+L/JJfTdpNEaE0BVC9GwcBrRDoRZseZLI/ZrJ8r
         XiHA6r+PWgU3c+75fMV2iv1RIrxUmPsWsAhddsUoiGDYeK6lAgQ25XsEi8s/u4SmBJHM
         dmwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVkJp6iQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97a4f38si104473996d6.328.2025.04.01.23.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Apr 2025 23:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HVkJp6iQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzrqw-0003EN-9p; Wed, 02 Apr 2025 02:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrqu-0003E3-UZ
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:45:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrqt-0002Rq-1d
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:45:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2241053582dso109468035ad.1
 for <qemu-arm@nongnu.org>; Tue, 01 Apr 2025 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743576329; x=1744181129; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=66le4xdRwCwExmc00i+ptfK0z39q5TMVnh7p70vuVso=;
 b=HVkJp6iQwxB7Gn1Evn1RSl+8i9oAVq5U/OtHw2SNLPyzr5D6hc0NwEsJYRVbgJUX6U
 skhUY2wgTChCeiMqd8bgNXhbXsAKgE2WYMje1FhyUZrMV0j7Tw3gHWEKm6Je+a93mB38
 cDMNVXoo49KVyiHAyvSfwYEpdPup8V7vN8sCJwDjCScaScaQgysp7ZT1fwefazsY26Wn
 yX3t0ENBPB+u3KQxTAziGSiaVcjJmSL4ig7zf4iHz2fiGlnsnY/jBCrmlsS2cB6XJ5JF
 /cS37w9hnuqrM53JDurhik1uqfIULA4n2+Gi/ySv5QQcIjsaGJpx40e/88pvYt7kicdS
 WRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743576329; x=1744181129;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66le4xdRwCwExmc00i+ptfK0z39q5TMVnh7p70vuVso=;
 b=UXExAqJSbYh4Cfp53g4i/7vFN9CK96nHMaVHNHdl3dwledBtGMcTs2jNORsJkeoKI/
 mJPPoKEepES+/PLVZpESGZR0jdZovPjLwRbWjRSaWAjNy0m/EkO54+2q/qfTxusCtcZX
 v4yy8eFwV8o+IkXPkjLCreyHbi3fcM+HaQrDrrU28TDQEzkdsl5a8eOGvVAi1xnAHO71
 sWSDjGgIKarG9A62C4WWzjmDEEHMez6efG+rraOPxEvFPojw51u4tstirJ5X5UFh8HoQ
 i7QS5o4tMX2fLx0HTtwOznVvdvFHxVam00iKRDlHrHUQ3sqVsXzFJfvuaSdHSZ7es1BK
 YsTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfioiww8YA+gyCmPW6fevTyPGfA5IFCqvgZ82TpT4Rt4OxV8O90+LPJPOz0+uZEVZyIo5IeFBi3Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzk3ZEKhL1MGPVmAkM09f3ACmhvFmt6bdLkb115K4B/Gisrtjg5
 xbT8tarJxcTUaHOhLDTxJKsp+Vp5nx48eRVldq0TA5sCwPfZ1tmA9RTqEi+vnsU=
X-Gm-Gg: ASbGnctB+jYTMZ9FmCJvDbgM6HQjBUpsD1nK2k9bvOhUUXOhqR/tX8Yva5M1FWyJSF2
 siIlnc17cNoyH/4t6GQt46S2WcKDQRwCCV1wpHSKukruX36uLEp78VwNg7aKutrakGUYu6m2F78
 FhTU1v/op55rNY5cm+hlZIaVixD8hkuTLvM5r/nvijdz1RUsG2kboiTK6pb2Zn38PHP3DqQuqOc
 u659eQvDYuXh5g+dl6+IORFjlhbIEC4itMewiMTQKa98UbworpEMkORh6b9Y98SBSv+9oL6g6Dx
 y26OLlT4V5ymAR5b2vohfTvdzHqjFGclHMalREepCKGn7NhqQAo8yB+3
X-Received: by 2002:a05:6a20:9e49:b0:1f5:63f9:9eb4 with SMTP id
 adf61e73a8af0-2009f794eddmr28096469637.35.1743576329448; 
 Tue, 01 Apr 2025 23:45:29 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739710cd08dsm10090135b3a.160.2025.04.01.23.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 23:45:29 -0700 (PDT)
Message-ID: <82110326-644a-4b66-a8ea-ade303cfd467@linaro.org>
Date: Wed, 2 Apr 2025 03:45:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 4/5] hw/arm/virt-acpi: Do not advertise disabled
 GIC ITS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-5-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250331221239.87150-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: epoGAl8xGGVr

Hi Phil,

On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
> GIC ITS can be disabled at runtime using '-M its=off',
> which sets VirtMachineState::its = false. Check this
> field to avoid advertising the ITS in the MADT table.
> 
> Reported-by: Udo Steinberg <udo@hypervisor.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt-acpi-build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fdc08b40883..b26f0ac8585 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -212,7 +212,7 @@ static bool its_enabled(VirtMachineState *vms)
>   {
>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>   
> -    return its_class_name() && !vmc->no_its;
> +    return its_class_name() && !vmc->no_its && vms->its;
>   }

Aside its_class_name() apparently being tautologic (please double check it):

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
