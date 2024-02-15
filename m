Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp451857ejb;
        Thu, 15 Feb 2024 01:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbnHINoHmF8Rq3T0wpfm6Qf+WhQalrL8/nu85fUqS6mw4YP2EllDV6fJYAzbV6epM+4bAdH4zItb3GSiVEzo/dM4AbVtwS
X-Google-Smtp-Source: AGHT+IEVUfDYE/MWzQR6MGggvZexm8wA6Bkuj/3RoOCvQNFNcROY/6Sxa3wuYXLcFu9UnEUHsvyx
X-Received: by 2002:a05:622a:11d0:b0:42c:7b97:d9fc with SMTP id n16-20020a05622a11d000b0042c7b97d9fcmr1569975qtk.0.1707989654603;
        Thu, 15 Feb 2024 01:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707989654; cv=none;
        d=google.com; s=arc-20160816;
        b=SJ/uzCGNl5D4ZGwN+oXyrBUMn6w22eFJQYZDQAM0EmbRXzPhnnfg8Ojz3VqpjHjxFd
         knp3uI9ZKveyc27SqQzE+Os4N1PgF8ffvri8xTN7YkL16fshBgZnLmRpXXLzKlKqQ78P
         W9N6SBo/KHEWiYOFaDOtuzD3zy8U2CQGFPYSpOrRENkndezj0uxgaRB14Ua3ZHNDx9VX
         aRhSvXycURJSF7hsg0rVPseeETqHf8UlhJWFr1Gj/kYk4oEmvOyuU/54O/D5P2HIG51c
         nKA7QwvWVpU3CXpbdtNr2nBMSf0JHsLeKrNDpomeT6s0sFH9q1GrwTM/gsKQ9H4pZHr0
         wK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HzhtXHLir8CDQnAkHAFmNr4fZ/GLTywIOTaBPghvAdE=;
        fh=OSHsuifRGgyin2curf9WI9TgcR1C89Pv5c9/I2GpZRI=;
        b=SFRTy7k2amf1nDUQe5Xn2/AEZ2ovoAPM2yMQlUPuJngphLXs4DxdufiJFyr9Ei+mfv
         RpVgLwncYVhyFgkturCN0z46JCgcF1S4NqqUMxjixEvLpWK7wjc8U7SyWNUmsZDqqgya
         5ZaHXUtVOsIquEyQqJKvWPiCuaOaUAXLXBbIrLw7gYvMUvLw/yMSXJ5s22AtqBWyLtyN
         jWElKHywS2O6a1s1D1vJ3QhdcLmygLhJ1nt3rj4OznHB/RrP0D3HfkBhsUS1KAb6WSSf
         GOgXIXZXGjkzit4g8aDvHxYGVBUQbj25la6hsDiibkURbJQ/i9vRkj8oWhv1KBXX4Thz
         I0RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XXGn/xTx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85913000000b0042dc23be7ffsi1016123qty.528.2024.02.15.01.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 01:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XXGn/xTx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raY7z-0006PF-TU; Thu, 15 Feb 2024 04:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raY7x-0006P3-Nq
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 04:33:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raY7w-0005Ee-8m
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 04:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707989635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzhtXHLir8CDQnAkHAFmNr4fZ/GLTywIOTaBPghvAdE=;
 b=XXGn/xTxUbJ+wF5u5HoLm03SnurhDz4E1Kv7P2cUaBvmfPP62wXuVHMnvakqoHd8PNqMlK
 0L2wmwaZfjg2kkBPer2J3zdO2xlnU6LZlxJVSMOqS9f7iKpCfnGTMMeQmSDAzahL8Dpa+f
 cNzyYABai4U1POCHO87DsQSE2BPoU7Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-z_M9CpSaN-mo6gdlzqIlCg-1; Thu, 15 Feb 2024 04:33:53 -0500
X-MC-Unique: z_M9CpSaN-mo6gdlzqIlCg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6800aa45af1so9197956d6.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 01:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707989633; x=1708594433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HzhtXHLir8CDQnAkHAFmNr4fZ/GLTywIOTaBPghvAdE=;
 b=wWmXF6A0KWjBAiHi868MGqailGdljmZbMr5nq8xUgRV0WzaOs8hCR+iWTjZtdn0Zzf
 QWupKjChAN/xbwzgvRtBSDhyctcpYEPh4Y7yuwIUKgfOz9DdaG3l//yG5912T5H1wZtc
 FNSUk2XzF95kTZr+H58sBGPFQPXva1Tj5LmX91TZ6kgZGTBzMXs28+rxcH/97anq0fmd
 aNI9f24P1x9SB7/DCl3b9V/0iKe8+iwt79/gjR9q/QPR5Punhztf1BFTi28+WCkIXCps
 maYHv3WofBSDhYAp5iTLfpfU9yJUKrd0vRuwhDD1RLCdOFTD8TuUUCw6Z9r18qqQ80N1
 LG8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZfzQD7ipvd2QBUUPLstzuBNZo0DSqQbos9eNm1h7UksANgO3bteiwvFxOBOzW+jTdyR0BgYsnNfGHZ2OQ4A5wisL4
X-Gm-Message-State: AOJu0Yycy2fsE8VCC1cWfuVjYygx1vgRpnhtZE7dFd67GBTrid6tA8VK
 eUlp37c0xL6YLcaHBR/iT6N8ufZM8+e1cq4Df+qgd/dQoEOoTlrCDyP1qF0WsP5usPZ/RZ6JT8+
 2XHtLBOxk59aquw39EgkfJcrhICaI0WOwRdeISDVvYHBh5lBXQw==
X-Received: by 2002:a05:6214:c4b:b0:68c:5a4d:35ac with SMTP id
 r11-20020a0562140c4b00b0068c5a4d35acmr1415078qvj.1.1707989632997; 
 Thu, 15 Feb 2024 01:33:52 -0800 (PST)
X-Received: by 2002:a05:6214:c4b:b0:68c:5a4d:35ac with SMTP id
 r11-20020a0562140c4b00b0068c5a4d35acmr1415060qvj.1.1707989632749; 
 Thu, 15 Feb 2024 01:33:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 mn14-20020a0562145ece00b0068ce5582a04sm484742qvb.80.2024.02.15.01.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 01:33:52 -0800 (PST)
Message-ID: <ddf8b1c4-059a-4567-9ecf-4186711b89c2@redhat.com>
Date: Thu, 15 Feb 2024 10:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] qemu-options.hx: Add an entry for virtio-iommu-pci
 and document aw-bits
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, mst@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, zhenzhong.duan@intel.com, yanghliu@redhat.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com
References: <20240215084315.863897-1-eric.auger@redhat.com>
 <20240215084315.863897-5-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240215084315.863897-5-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.531,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TouOt+yfmhQT



On 2/15/24 09:42, Eric Auger wrote:
> We are missing an entry for the virtio-iommu-pci device. Add the
> information on which machine it is currently supported and document
> the new aw-bits option.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
argh forgot to add Cédric R-b collected on v4

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Michael, please apply it when/if you decide to pull it

Eric
>
> ---
>
> v4 -> v5
> - tweek the aw-bits option description according to Cédric's
>   suggestion
> ---
>  qemu-options.hx | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8547254dbf..a98bc7bd60 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1172,6 +1172,14 @@ SRST
>      Please also refer to the wiki page for general scenarios of VT-d
>      emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>  
> +``-device virtio-iommu-pci[,option=...]``
> +    This is only supported by ``-machine q35`` and ``-machine virt``.
> +    It supports below options:
> +
> +    ``aw-bits=val`` (val between 32 and 64, default depends on machine)
> +        This decides the address width of IOVA address space. It defaults
> +        to 39 bits on q35 machines and 48 bits on ARM virt machines.
> +
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,

