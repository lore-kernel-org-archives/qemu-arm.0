Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp810320ejb;
        Thu, 19 Oct 2023 14:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgOgbtdkFmC+GL4HWSY8LFnnfFfTAIAM/DwwfLOw2/BIi/mRBnwsQuc6OqaglPu+JPOCMW
X-Received: by 2002:a05:622a:40a:b0:41c:c2db:217d with SMTP id n10-20020a05622a040a00b0041cc2db217dmr3362332qtx.43.1697751704195;
        Thu, 19 Oct 2023 14:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697751704; cv=none;
        d=google.com; s=arc-20160816;
        b=maKcx7wb2TIWFWb1BeK/TT1++y90A7aV6me3FFmI8b7wNoQ0f1BicVOhL5vhPrskE7
         s0vtLlPIWD691bxaEy8cpctLNvwxCFlYDaAMpOFzU24LCFn/5ct+aDdboTFeJ+NDrbL0
         ADulysYC2v9hWNCtC1kOEBIFDzr3t6xVApY3C4viEgk729aYjjseAp10Nq33N2u9MQ/2
         A1jY68VtxrMvxar3TJJe9DcOJbBqGiSgRfq7FrgoRVVo2hiNpPlANiFN48i0gRsAwf2Y
         8fCgYzdbn50MFSPBICz3f5BGiVu3PYpCOhVsDrmKJnfdKssWN16w33/QwVJrP/0oIcaF
         DJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=g9fHF1Lm2z45kA/ks0p/qc2goX8ifReYHByDbDQUh3c=;
        fh=SqJiY79zU9q3R/NbOX2mHTtgesZ/ZHHlb3kJrGtoozs=;
        b=nKxMOfXWSCtyNORcVrV+9uW0IP68PemeXG7juU49nphk5+L/t+r3nXEiho8WSG9Svs
         QyzCzrhcD9smuVGm2vywyeV1Koq4l0AS//b6lXi3FlK9cg/0DVeAgcUhDqS/IpMZ2Fs/
         b2OC0f4rxsEqrMcQfON6Aid6gEtJy+Fu+GdN8vdvfZ+N92D/ZIAKP0HZgh2I0TXzKFlq
         fFqjD1CBE5imBsIQyenNeyPh6ZrcV30xkrAj7kQP3LE1xuTovgP++7I/tK2ifAsGlA4m
         NuP9pQnXV5atoLEMDFRDMW0OXy2aLXIlZcK6S3/OsFWtCEuNvscICsD7NOfX4JOy/xnw
         6iUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crIaWZws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac87e88000000b0041812491f01si265201qtj.470.2023.10.19.14.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crIaWZws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtalw-0005h9-WB; Thu, 19 Oct 2023 17:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtalv-0005WT-Gk
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:41:39 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtalt-0000Rq-TC
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:41:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so25083466b.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697751696; x=1698356496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9fHF1Lm2z45kA/ks0p/qc2goX8ifReYHByDbDQUh3c=;
 b=crIaWZws03rSZWplmR4I6dz+OpahGg/HYRPxYpUK2ywx4TwNDSwG1oOy8thQFywDR9
 RPr1MCyOe5V5VdSDDj6jA0RKf/Pi5G2o0xG/OZ+O3WLT1owSD+cPmhKaYtmYCloyZzhg
 PEBx1JrbIx9tfUIW5YSfALxCtDZvdSav43O5Y90UwZXriD39OX5yqH1MAFYtM+PW/mG4
 63ZBsfpxZPAYM8+iro60FOmd1uGH0XUbQAB0gFYPm4I0/4Ru8QHOwmHxpeDLzjRk/xbE
 nTvVKOalGgRXHszbLkS97tHzCNoTh/5f1PWndk6Zoqp/IwVZjFKfgy7Nkyes8hkdeH4W
 h03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697751696; x=1698356496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9fHF1Lm2z45kA/ks0p/qc2goX8ifReYHByDbDQUh3c=;
 b=HAKoiJCMs7YRnRNoeLrnP1Ly1KVG4LbjjrRCwOImheThjmV2g1PcojpuVIoGxtmDGc
 pClNlPQXqFjbjaT0r6Q8swiTjPGqOhGoxXFUxbZHycu/h3iEYiK/D/2g6uIBSi6InDpm
 E2yiVrOnw/omJ31mGJTSlqmVbNAhEUZb4mXH6gRNYBkyIuqxa11zyniuoFbbR5BixkcE
 g49Ux17gBswLOOiE0M9GFYsDc1uDaFwKZiB/FUJu9YwFdxrjlhlxBEuL6Vnc4Nv5QbI4
 KYVIGkGDwAQtt4u4LmZU6sCVTRx8O4wKICcKKYHfz1ZdGLUbNuYcsASpVm7EEicgm6Iv
 JTIw==
X-Gm-Message-State: AOJu0Yw/ExZ8aff0qedvPj8IlTd7fDB5NRH+ucyk2BAjjKnaEoUhrFgy
 yxwleIs6JDxN8fS/z69e3A3UBA==
X-Received: by 2002:a17:907:60d4:b0:9ba:1d08:ad43 with SMTP id
 hv20-20020a17090760d400b009ba1d08ad43mr3496384ejc.70.1697751696023; 
 Thu, 19 Oct 2023 14:41:36 -0700 (PDT)
Received: from [192.168.69.115] (176-131-216-177.abo.bbox.fr.
 [176.131.216.177]) by smtp.gmail.com with ESMTPSA id
 a7-20020a1709062b0700b009932337747esm224113ejg.86.2023.10.19.14.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:41:35 -0700 (PDT)
Message-ID: <b2d724ca-5369-76ab-30bb-88cf9bcedcb6@linaro.org>
Date: Thu, 19 Oct 2023 23:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 0/7] hw: Few more QOM/QDev cleanups
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>
References: <20231017140150.44995-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017140150.44995-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: FMB8pDFWi9Iq

On 17/10/23 16:01, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (7):
>    hw/virtio/virtio-pmem: Replace impossible check by assertion
>    hw/block/vhost-user-blk: Use DEVICE() / VIRTIO_DEVICE() macros
>    hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
>    hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
>    hw/dma: Declare link using static DEFINE_PROP_LINK() macro
>    hw/net: Declare link using static DEFINE_PROP_LINK() macro

Patches 1-6 queued to hw-misc.
