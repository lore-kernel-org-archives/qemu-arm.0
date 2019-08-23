Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp840524wrs;
        Fri, 23 Aug 2019 10:19:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxs/qONR75/lvrGUKWtA7tbcYAJXtIfmJjpR2NH74eWCnK8XWGIy/gC8w6M8wS/pD8NGDP3
X-Received: by 2002:ac8:43d1:: with SMTP id w17mr5602383qtn.171.1566580774090;
        Fri, 23 Aug 2019 10:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566580774; cv=none;
        d=google.com; s=arc-20160816;
        b=ylRq+VbB7kQtumhbIIt4sLaTussUjAZcmCl0GzCQ8S2FojgVaW98MvowRLGgu7W/z2
         50GLJjVEqzxswigsZ6DmSKG4QeiFewkyIFir/Y1ulQ6SBXPTW2zAjTVFOO4r802FGUcb
         tR9AJVPwQ2IgIcfEc+i72EkcaDYtsz3zYxj6czmdk1AVsl0BK3qW7XtEGVigo0KtRsp2
         lTsvtpkI2yHApO4WJ+gt0vpNa5CGFBZ2Law98cQDFRzRZHf9KnkOd/ptodGjb9c2lPeH
         xqTFNrATL3Yheb+F2utVgyWFqWdm2HrB1iWLziV/8Rq2eBwL/FRNFnaI9wbw5sDAbGrM
         Z/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Z2x0jFIlNL76Uaj2LvW0TIgjYOb8Ha7i6oGNV0+efUY=;
        b=U1oknyrZZ+B8xW0DFNxy1CgjNUXqqY7n30TEMJuYXYCrWlRxCVQE3RjUZNKPBOB0Lg
         jbHHAGoT6xEIuKD2hLqlhfXdL5eS0PwTEHDV5LxqkOGA0af3yinfgOszWMXVUVDsN0qJ
         G4AMCQfNbkZDWdsHCKri1F4gvi2plnilEzQc3ycTGiEL7qTjh3J3rydke/fuIxY4+Z70
         PTIdUOX/lsOJhWCl/wPxUcnCbUmUBGjqDF7iVEM6T3c7luWGcjK43lbGLeWNB6SfP+4o
         b0/BAy1GR9WXIp3oLv/sFtMyZu7REe1wsOdah/Sa5O1fELupoWI/p5wdhdO1Y1WyU/J4
         eKBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zsr3Ogkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si2402800qtc.8.2019.08.23.10.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zsr3Ogkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DDp-000662-IO
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DDh-00065a-SD
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DDg-0001fB-VZ
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:19:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1DDg-0001eX-OS
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:19:24 -0400
Received: by mail-pl1-x643.google.com with SMTP id d3so5935220plr.1
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z2x0jFIlNL76Uaj2LvW0TIgjYOb8Ha7i6oGNV0+efUY=;
 b=Zsr3OgkhCYAl7nknzayeh5HWZ69VAi9UaGnGvfoehqqBKpFNZCREazGz9A9YH/uS0v
 6seM3mZKAivOgrBIDFzYrEPnhwFXYDTAfBPjl52jLyJ7A1MPxr+abIfjzjecqp+6tkQw
 d+jAP2gQNU96hokkbo3Y/XQ7XkdgTRdKisGzilTunKu5M/gPqgZ5+jPeoJynF6746a0g
 FJEEMxVmu8J+LUu5ImNbnUGSYcK1x1MW0TqiS+ITbKaDMbPJJhcBMLrRKPOg5McoPGCt
 w4hzM6t3OISJhky5s0XvlhL2MMkdhX0Rt7VbbUk9A8m8TFrufx3xr793N/1ch04zjhvA
 6fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z2x0jFIlNL76Uaj2LvW0TIgjYOb8Ha7i6oGNV0+efUY=;
 b=ndkSc0jRyy720rj1QYaGiuSnY44C0fkhhEEnCBqSPfcLX7fB2lQObnBuDF6X5jlldV
 UPvRtrnDfnSwBCIIdnDv97LPfLoRNK5kAM7woMLm9zEMV0ZuaIG+8+Y8F8iG/n++BGQb
 Ah8Tp/ngM0fKsXUGnhTtOYYE1bTvCf51mEWGupezuVVKo64DGrNrP4nWkboURI7YazQ+
 AQt4OobwStW9u9/iUIyFtcKnb4uHsALXTCWPLKE42IsubrXs9DImrUxt3GSg1q8HKPRO
 qeFF1+mEG+6mi3KwESP0qcGmN5y+yVRV0jWQIHX0fXIN4iL1LKv7KgKhahpKFKU9jQm6
 p+OA==
X-Gm-Message-State: APjAAAXx6ijAhXxQRdc3kOgQ1Gsbj9UJy6zXlMGrTaL4903rEx8WQ2QB
 xSkEtLlvsg0WzQaWb3HYkJtf3A==
X-Received: by 2002:a17:902:20c2:: with SMTP id
 v2mr5523918plg.209.1566580763504; 
 Fri, 23 Aug 2019 10:19:23 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t4sm3572917pfd.109.2019.08.23.10.19.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:19:22 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7032b17b-148a-47c4-7347-8b954ae1dc52@linaro.org>
Date: Fri, 23 Aug 2019 10:19:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143249.8096-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] hw/arm: Use
 ARM_CPU_TYPE_NAME() macro when appropriate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y59NcCyK37g/

On 8/23/19 7:32 AM, Philippe Mathieu-Daudé wrote:
> Commit ba1ba5cca introduce the ARM_CPU_TYPE_NAME() macro.
> Unify the code base by use it in all places.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: rebased, use in imx25/31 (pm215)
> ---
>  hw/arm/allwinner-a10.c | 3 ++-
>  hw/arm/cubieboard.c    | 3 ++-
>  hw/arm/digic.c         | 3 ++-
>  hw/arm/fsl-imx25.c     | 2 +-
>  hw/arm/fsl-imx31.c     | 2 +-
>  hw/arm/fsl-imx6.c      | 3 ++-
>  hw/arm/fsl-imx6ul.c    | 2 +-
>  hw/arm/xlnx-zynqmp.c   | 8 ++++----
>  8 files changed, 15 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
