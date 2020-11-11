Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp730460lfb;
        Wed, 11 Nov 2020 12:07:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5vfzSD9o3RxLh8HjI2hk3hWQBtTtPcVbzTJhSaylim/kxV7FUKxsu8GDRa9wysy4IgUNj
X-Received: by 2002:a25:a247:: with SMTP id b65mr4150135ybi.146.1605125231361;
        Wed, 11 Nov 2020 12:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605125231; cv=none;
        d=google.com; s=arc-20160816;
        b=TId+Gc/UyTb3Xi+rWsjYTS9bNzIH8B6LKq/ScYvPurgT/Wt72Amdi7T5c1ncs6D/n7
         h7qHrvI6vHOXU9c36cccxzm9IpbIh0MyCNKq+Q7xsoA4GcKShTXhJGfA2iSOAmnlGspR
         mzBfr8+9QfeQvL5a+q6b8kW/isPTm8Zw5B/BWDXXivAVCWDXWDFd00D6VEaXSF14wOho
         lIZ+fGcbeVoxUaUal/+QGfVvaMDonx5T0yx4n8aV3QdXZTRoC9E+4oA9wZ/s3+RwRl2m
         XtdkWNL44R1zLgycmJ1HT1pnv2lhBRBb6WBOD5Es3/GbujkyN0oaFKVx3Lj0+LSamdJJ
         yHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j6zW7sYbClA161CzruKopE/Ybv3TG45xOqCSbEpl0dk=;
        b=Hcqv556OJ23U2TFy+lK8sRxC8BmSyii4NKhKhXUV2dadok/ts0szqq8/bAnfBE5PAi
         cNAkIJU5BXV8Uq/FEcM4woM7fuv09cfYTwzfbWARhPts4RO38W+t2RzU15RkjffFAmnf
         PSYmD2cbfmkkKgp9qz8uk+ohmdk9mnzFKr8+4Wpp/25L3Cmrg36MUnFRWkya/ILmNl6l
         B+lk+FXz714eCtqUpj2MHw0r92OTzeo6iw9BGxU/fggJodXX3TVZnQ9CmoAfZe0ho+N2
         3fLhf0V8P7SiUVGkToAVMGtvZxQXPEy6cnXZh9/ypkPaKSgTdHppFSn3+rPG1eyz7ri5
         I4jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dkhj58/U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si2935469ybr.412.2020.11.11.12.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 12:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dkhj58/U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcwOc-0006nN-Nf
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 15:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwMW-0005eR-LE
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:05:00 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwMU-0000YM-9c
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:05:00 -0500
Received: by mail-ed1-x541.google.com with SMTP id l5so3599613edq.11
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6zW7sYbClA161CzruKopE/Ybv3TG45xOqCSbEpl0dk=;
 b=dkhj58/U8nBd+93+QaJgB9itKnEyX58kWh1LzVkC765VuErNM7GCo6lPotb1xEHczB
 pqtJO+JXJLFdaAbVPxQ+isRMIvxpdpn6TT2CfcFquVSnB5CV+h7pXiMiRtmnmrkI4CDP
 89bWXFWk+EXaCpLDTnIlpJFQYAHGlhaokrAH0xZNQdYyvFyPiIAZrblU4i38JXLrLyVE
 IgzuiAVVA5Uc6jTJRvzRZfEqu/nHrAGHrcv972hOsoKLPBIO11fibwvD+E14tP5yFzQt
 JAHHNlenCGQXZ/OPeIBMgdzG7H0y1TSRRKVzXfMJ7FAe82ewFoZmir8aLeESBs7Xzy8M
 +uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6zW7sYbClA161CzruKopE/Ybv3TG45xOqCSbEpl0dk=;
 b=qtO3l2adXfj6+eQLQHURWrXOTHA9CnK39sqdGXo51fy6QFbME6FkTTqDpU+7tKxUL9
 bBLRsoyXyVDczPRVRVniII+Jrg3xeJ4VScOciS3zgFhsn2Nvw0nLGT8/7DNF1RjjUVEc
 R8g50JLjTAGXaPJtiXm687z8gKLWcyDOCGAkNAnU+9JKJsZ3k/CPuEh1jicxChoV1wmI
 KzW68cbV6khkawsoe2yCYUjj/jsmobtU8lSb1wxnCbIngCgQhuxkjGN7IvTivq7UCh6o
 gbOY64RA05BQVSaICprqaDpeReEGRWA1OBKxKoywRd61ARRF2mGkphztsZ+8z36VyKDS
 a+vA==
X-Gm-Message-State: AOAM533732ZyVsA6eloc9N+BcxfJ1rOs51sOjqpkiPbs/FMFNCoMFTnR
 TfJQtJ0wEWzv4ErI3j2jYLDuIeq/H4gc0EF1A9Y+lA==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1344919edt.204.1605125096843; 
 Wed, 11 Nov 2020 12:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-8-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-8-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 20:04:45 +0000
Message-ID: <CAFEAcA9qhpzW6i8OadfB2mR5T09Ok2npgLS38s_DxAuv437rYA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm/cpu64: Register "aarch64" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IclORPO6B3xq

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  target/arm/cpu64.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
