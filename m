Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp455337lfm;
        Fri, 1 May 2020 02:41:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLqJNpJVYVT0Osr5hRyLJX8kHEUgQdtCUhEVWtz1wXvazHCSgodlJVorBUmMwtirWkkfHj7
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr2873431qtj.154.1588326066530;
        Fri, 01 May 2020 02:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588326066; cv=none;
        d=google.com; s=arc-20160816;
        b=EXdeoZqNgY8GEfUESbER35BkhtErW6+jC3LFIlYjwHlbb1blTo6UO0q2+jWjI3zL43
         EV30W5HkGj6JYKnPNj2+OD0yfVJ4BRfjREs/R0BvqMFO0ndo5WoiEFhs9DViA5UA4yI8
         bik/quH1cxlW1o43sjhFUmcbsQbSqowxQD/y8tSk3mhRzWe2Djn6VgSUrsFrcTB10yY0
         E5xNtTxPDQxK/L+bDZ/ZAMfHaWc0dP1ZRfhtRKbRj1mnHX7+OHSHoougv+1X0MszuDku
         1dDqgTLdY/evBVFKIH1477zWcRD5qj5xHDbPrDt+/pcEmFn6BVVlUKIAElG+2Qc9nXA2
         EpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=86cJaDzcj/Fg8SZUL/fVe5/8isuLytAcuUban1rHdMU=;
        b=UXitQefBz3Ue7aMPirHy8ZgA0CYC3nDJ8RCOxR9Y9we1IhiX3SUCltumW0XAQjyN2M
         e0Bd6r+bAQshHdLVQ7y73dr4+RvgpwF/cLBG/692i6OZ0MxeQzqrmZCUEqBXl0ASvEud
         AVyBTmwSs2c6a9rT3oce8vCYKyMQMVwsAVJsM3lozbFTjsIlxRsZZ2CwglDK0Z9Dj71h
         rrqkgKzMz68cxYCbwJf6qRnIeT5+MG21ME1Rbu/w1TIrX/Js1omyQ7Fna5NI0dhhvS4W
         LBLui1S7Xu4Vdrnyf4J21xJsHvhWHMZPGgv7BRGU6dQLjgIk/Uqcm/qCtG+0VwR8b8qg
         22XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eXrpfrMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id cf7si1462598qvb.33.2020.05.01.02.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 02:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eXrpfrMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUSAL-0000UY-V5
	for alex.bennee@linaro.org; Fri, 01 May 2020 05:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUSAF-0000Tb-9N
 for qemu-arm@nongnu.org; Fri, 01 May 2020 05:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUSAE-0007y1-DP
 for qemu-arm@nongnu.org; Fri, 01 May 2020 05:40:58 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUSAD-0007rA-SY
 for qemu-arm@nongnu.org; Fri, 01 May 2020 05:40:58 -0400
Received: by mail-oo1-xc42.google.com with SMTP id g14so609897ooa.4
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86cJaDzcj/Fg8SZUL/fVe5/8isuLytAcuUban1rHdMU=;
 b=eXrpfrMV/EEDeWsxyJacPFHs31DOzO8+yiefKxQOg60hH0rasGlZIE9yni4RZ4WYD5
 kGvL1ENN6c1G1d+1Jeqa5mC6FFDKZhAR7o6Gvxhh8xR0W5jJqo0NX0LK/cKe60N5pTsn
 +3LOw4gojL2zU5hE2SFhHrqSFRUJI2K3c1y2xH1nzh9238vBzKEkpd2rkWTW++fgSYYm
 4TdRgeNBeb3lQ+07LlS+4S2CuMMqsNBgMhPKXIomoyMPnefM3TgLBFlXY0hbZ3i5Q9pi
 dIM/CSiB6QMxw3ALxWFgyvcAOycnnIK0lXL7sEw3gEFAcPMOS/gnsY0yLO0otFXBcfSB
 m65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86cJaDzcj/Fg8SZUL/fVe5/8isuLytAcuUban1rHdMU=;
 b=EjHyX4q+j7A1E2ksfEp55cTRrv27zEUWErRStwE7l1IcHI/D/t/UD2JVUMnyIIqxiz
 82TYGCzA6vyG0I7uB6MSQi6mBk401M0oro6OP6e9s1ctKT8x3ilMsLs/MnhQlXG/do2h
 W/OSmaNOGoD1oqQFl5gK9DrQlgWTVJcjdzx9PdqtgCfW8n7t+NB0BqiZRWnw6OrtVQke
 vsdXHs1WZszULeyj/5K4MT7mV4+DLbi9gfiWD05kpt7XNl57qn2Pfi/nMaDZf2YeGXMW
 OnUQKw1ZWgRv98hqyDvINE2ZDMcw1YTSEc0kJ83YdV2H1h4Z4pqOa9HTR8Re064y45v/
 7qnw==
X-Gm-Message-State: AGi0PuZlJbx8xx6gE/N5wwwMTrdXq5ZtyIaqxmP+8zLWj66oo1W0jcJT
 94kbpAuOiXgYczckYDJw45cFT7c0/wlzQEIFH4SADw==
X-Received: by 2002:a4a:890b:: with SMTP id f11mr3033428ooi.85.1588326055957; 
 Fri, 01 May 2020 02:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200427143145.16251-1-eric.auger@redhat.com>
In-Reply-To: <20200427143145.16251-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2020 10:40:45 +0100
Message-ID: <CAFEAcA9ePwOFkX1pbh=FfryYbxteSAevHHU+_Cp0WX6_obVYgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: Andrew Jones <drjones@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H3iok+hueZgz

On Mon, 27 Apr 2020 at 15:32, Eric Auger <eric.auger@redhat.com> wrote:
>
> Instead of using a compat in the mach-virt machine to force
> PPI off for all virt machines (PPI not supported by the
> tpm-tis-device device), let's simply change the default value
> in the sysbus device.
>
> Best Regards
>
> Eric
>
> Eric Auger (2):
>   tpm: tpm-tis-device: set PPI to false by default
>   hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off
>
>  hw/arm/virt.c           | 5 -----
>  hw/tpm/tpm_tis_sysbus.c | 2 +-
>  2 files changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Stefan, feel free to take these through your tree if you
think that makes sense.

thanks
-- PMM
