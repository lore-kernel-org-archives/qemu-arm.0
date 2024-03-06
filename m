Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp747846ejb;
        Wed, 6 Mar 2024 12:44:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYsVAWmyPv0OHlFBKocCsT5NiEW0wuvYdhj+GDRI/bIJSnZGxWPLnmtkT8lQsi9ZXD7gGLKrqiMBc2Xc65FP3HCvbb/5fo
X-Google-Smtp-Source: AGHT+IGEAtXEp744kzGndwRiyuFQCY4Uwl744dazqRBq2X5hycdEpBB1TiFgW4BehjatRh6M3Vpm
X-Received: by 2002:ac8:59d6:0:b0:42e:f863:a6ec with SMTP id f22-20020ac859d6000000b0042ef863a6ecmr6961283qtf.20.1709757882700;
        Wed, 06 Mar 2024 12:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757882; cv=none;
        d=google.com; s=arc-20160816;
        b=Bb+uiwHzmUnuts4qTtTLfFPNjlZ1YOlQz4xwrMnPk7JbXjsot48Wl7aPiHJDzsBDnn
         6mQXskQIhQlBj90WFPGTR0YKkigSoNTcfB7rtTYNnB5kMCAk4pWziDWEWhjYI6MuhhSX
         c3a+8vhlcc3RRZSra80E/KvHP8AgoNKwT/LsjC779ZDEHOjoKXEW9vZedGxxGx4hFEP8
         txI9ewDnYa/HjiR3d4Bna1OX41q5osa/HXraAOvh2PQXI1OgMV6tYvWfDATIIzcVyn/k
         WArwGVmo1ejyGEW9jVa802MkArbjlbHT8fLNuNvOqeOKxBNjIPbcCXLErSDqrTRx/9CV
         /qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qOs77BSVkN26lRtJwEwSVGiJq8nL5CI5avAC0pC8yu4=;
        fh=kwP6zYfVMS9MF7BCGvzK3sQFb0AA4faFJQznrVJjvAs=;
        b=YZeL2dapbidLfB7i33i5EumKI3Uq9h5MQlRGzEd3tWANrTonp/N+OrAtWDoUWmhPr1
         ezUW/u518sWxhJYzhrSL7HlWObmVU1tLeZpwOAq5bqPoIeKFXXYLjbFkKGD89lCJ2skF
         yXOy/jH/1RrX8pY6qn6D3PZNSFaMzz0eYIdCcXfK5Gp8TcijX0KWfephjB6X0h2WdEQz
         BtGP0g2KUprqlqgT87q+G01MYSH+khpeImIOBVgIj/eSyFflDvLbHRSann/+ykMRqlNE
         jOP74gdz0ei51E4PW/ukuX22aBpgP4c/z0IUeKyd56PJ9jGLLpd2digSDl07+LZQZFiF
         7dlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1NexMJL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056214076b00b0068d185e9c25si14600152qvz.532.2024.03.06.12.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q1NexMJL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhy7p-00057B-PG; Wed, 06 Mar 2024 15:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhy7o-00056n-0y
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:44:28 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rhy7m-0004ys-Be
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:44:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412f692be21so1716095e9.2
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 12:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709757863; x=1710362663; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qOs77BSVkN26lRtJwEwSVGiJq8nL5CI5avAC0pC8yu4=;
 b=Q1NexMJLu6VVVPFa0SPj2OiMXQ3RqsMg39HMOtYrGh0HOd1U/+0B7V+wcUoz7l933h
 pf6egPUMdA49GJXQLSD3jbJb/+DoMci+bX+t/UocjljyDXjHFxubteN6X351YD4EFBOF
 rfufWvKOX8v1eX5Y1WWkuJ0Fq3t9N2BIS8OIdMRLebi8oAIPfJZIT+5bOB+3F2Dpt3JN
 y1/v9hBmaBi+0/o9UwKZsEKk8v5l7ltpNyIwiHuj5x/RNLZQusjB5VcFz2XT+plDb3nS
 CuT15YNN0xuIL+0MIAfxmzyotRiVuJIORSWBu0bup3zB+wYmBIm0K8vPJH1AUJHs8HBu
 rI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709757863; x=1710362663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qOs77BSVkN26lRtJwEwSVGiJq8nL5CI5avAC0pC8yu4=;
 b=d7kGq3ijp1r6b0RJmw3jcL5INQZYofRfs4ZMxKN/RASPc/sCUHJYkMcBpY8Vys6RLB
 QUgKHrPXwG5H8XnpV/TUWYFJiUBYTZD0DfezHdCrjpn9+ki3O67NKX0jLl7Z1KCeb+p2
 1R/bzq5YaSjLZUP8qPdHpbWKfXMhDBTZPOfXFCSSoYVF8Z7KK6KZxLmAK+d1txRjtNc3
 sROQ3iBdxLqO/QaehOxpMDbgPC6mSMzPHqjKwZfvItniTpxt7xL5+4AN9HxkPu1b/lGg
 VPWrL9GrvS4kUXB4iKG315y0jKJ52PBy/5veMbCabZOoBPUtYRoQNRsPXog14J73pxHu
 Kf/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjdTldXepdOeKT4MQ4T1gLHKIgmP5jPOZzNOD9U3LbOGe3XpDHwu7s5/4uCElUSdnTRO+iIqSK3fPi4YNPGD4VDvNk
X-Gm-Message-State: AOJu0YxrGPTnDpnTovHp+LUeWxkHO5/SdmNMTvYFL8APTdfTafuz6cmv
 1EZu9FX/H51xJeBsF2D0PKXvAV9sRhfix1VCNufcSxrV5+0xRJrHQcL8NyLaVQc=
X-Received: by 2002:a05:600c:cc5:b0:412:df1b:4875 with SMTP id
 fk5-20020a05600c0cc500b00412df1b4875mr7975337wmb.30.1709757863682; 
 Wed, 06 Mar 2024 12:44:23 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 jg7-20020a05600ca00700b00412f778c4c7sm364335wmb.16.2024.03.06.12.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 12:44:23 -0800 (PST)
Message-ID: <fcaf95d2-bb09-4c55-a333-21a93a707ad2@linaro.org>
Date: Wed, 6 Mar 2024 21:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] qemu-options.hx: Document the virtio-iommu-pci
 granule option
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, imammedo@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240306203348.65776-1-eric.auger@redhat.com>
 <20240306203348.65776-5-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240306203348.65776-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: s0pksQSHBGST

On 6/3/24 21:32, Eric Auger wrote:
> We are missing an entry for the virtio-iommu-pci device. Add the
> information on which machine it is currently supported and document
> the new granule option.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   qemu-options.hx | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9a47385c15..757df3eac0 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1172,6 +1172,14 @@ SRST
>       Please also refer to the wiki page for general scenarios of VT-d
>       emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>   
> +``-device virtio-iommu-pci[,option=...]``
> +    This is only supported by ``-machine q35`` and ``-machine virt``.

Don't we need to precise x86 and arm here?

> +    It supports below options:
> +
> +    ``granule=val`` (possible values are 4k, 8k, 16k, 64k and host; default: host)
> +        This decides the default granule to be be exposed by the
> +        virtio-iommu. If host, the granule matches the host page size.
> +
>   ERST
>   
>   DEF("name", HAS_ARG, QEMU_OPTION_name,

