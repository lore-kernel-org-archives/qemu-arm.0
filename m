Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1209196ejm;
        Fri, 22 Sep 2023 03:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCzaApcUDI1YLaZRstB/ISquGnCBniQWazY5z0UGrPYkwRy1yPC6iAbqVXs2D5VCcnl/MA
X-Received: by 2002:ac8:7e8b:0:b0:417:a42d:c786 with SMTP id w11-20020ac87e8b000000b00417a42dc786mr9699720qtj.24.1695379344430;
        Fri, 22 Sep 2023 03:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695379344; cv=none;
        d=google.com; s=arc-20160816;
        b=nAwH1TJ8uhkF2MeGpcdiPRtdKcOIa+DxbkzqiCrOBHR/JTX9AZ6DtDZju8BH37DfwM
         AIS0C6DZK/D2HL0px0WCWuGtDN+N3M0KZNfsTSIRIZtN6SYInwW+5GlzQW/j8EjUw2TD
         RB3R4j8YUDmEmYalw0CDqpCe5JJZekZcLCm+907CRvnEPQ5GbBFSQRDvmb6PsAx0fBHS
         jNdMkQeyciOzdftObTMTQRDokI2kH0Sb4e5LoCqquU2jtM9ivslHTOac62FM/RcxZ3JX
         +3Duh1GcTP8bnUlOrdwLe6JrLcys7GbJ8I7VtForI6rl0HpBHGajaOTiQQQqWAs2X6WL
         R6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gbwKIMAQY843T2eDSSWgLUtteW4wUp4xBFENdl0MFcI=;
        fh=VWuKj5IT3rv5dFF9iSlbu4Bb7v+IVvCNZAx4HyaZ0Tw=;
        b=x3p3dZ2Abii8od8pPuzhwj5KxsEtTLoYjRfbnSfC4mv+mjkTCG4+DZAaLDsMLccD0l
         yk4UXGpQOdwDH/WCbAaudnDHlp8U8c5IfjKadToJ8gIHmwHb9/V+jUl7RBr5i13KWevG
         rmDYWAUsdzkxJQBIw+uTM4ZVvUQu6HyZooGX5SbsRPpv8H1OIKSnuYTKDU7TZ8JjwpWh
         wuc409d1wmuw7yXQ44eQlRouZzC0KiYai6jHtwKShxRmKaQpQjspaKc2OUwSSEY2kmnX
         1CVE4OtEgQT0xHvfiJeU/XyRIpJI69JFiuD9ug/7h8HrgVV0VN/wB0DuOJnQ7pjOXlNL
         9C3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gASbfIRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020a05622a061400b004120387cd29si2080369qta.127.2023.09.22.03.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 03:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gASbfIRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjdbp-0003l5-0B; Fri, 22 Sep 2023 06:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1qjdbn-0003kk-8U
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:42:03 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1qjdbl-0001ur-3y
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:42:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so41085e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695379319; x=1695984119; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gbwKIMAQY843T2eDSSWgLUtteW4wUp4xBFENdl0MFcI=;
 b=gASbfIRrJu6xFcQGaFykPdFPi4AvyPC8W+C1M//nmnrbqUDmt9RMzzxIWKf4+38dt+
 1m6YSXeT5eu+0Gi9onMGERVaBFNCtyDZDocK/R3Z3FBXlsWec6dheKOm4F2MNc8IH1Gb
 PvYCuv6y+9zu8EaW1OuFm+RhhGoYRdQRydvrixDPlWc3wNGvjUphEN+JYzPvj0tuzPZL
 GXPfHspqtMbW8yv9y5QlXUFaBEJdixjb6a9SueJVzE6Qvnzj0w0WQGW611Svz+yVorcl
 oTobIOdrZ8XmvVUpBIygw32MGtog8FuuyzD2qqU43GoSOFWOV8H0e4J0Q8MTwSaYfeaN
 37+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695379319; x=1695984119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbwKIMAQY843T2eDSSWgLUtteW4wUp4xBFENdl0MFcI=;
 b=tOrEeHzHXX9ApY8cWRFzkvph6iqahUINrz6QG0+BVa6Mupfc6kldvd2uKmPsk+3FIa
 1JhfJM12xk60ggNssITI6gexktlmw7Ed2x5oqPLcZNKgJBvilVDYMT4Qyo1ewNw0KMmw
 MH24oc4NBJQwpjbY21TLe0BUndzDyg7sne4+DEYnS93rLVhjPuCWHxzbc6WMv0rhSa0N
 nDLlLbPO+9TKbjhi7vSKR0jt1iD2jew5LfZktPIv5wMzVqdecfeCznzjGroc+mElKVm6
 6FOT+pY1hlLIp2v7CkIou9eCfHy4dKWCeBliXhB/9mMby88mw883xbecm6qLGflrJgU9
 CJBw==
X-Gm-Message-State: AOJu0YwYAKsjU6B1zDiNYd4NwFaCIRnUPS0KlGW4js/hZu+p9D0yMPEQ
 EOktKvgaC3w9ydd+8iTUvPsn3Q==
X-Received: by 2002:a1c:6a08:0:b0:3f6:f4b:d4a6 with SMTP id
 f8-20020a1c6a08000000b003f60f4bd4a6mr38078wmc.7.1695379318985; 
 Fri, 22 Sep 2023 03:41:58 -0700 (PDT)
Received: from google.com (203.75.199.104.bc.googleusercontent.com.
 [104.199.75.203]) by smtp.gmail.com with ESMTPSA id
 p14-20020adfe60e000000b003197b85bad2sm4140418wrm.79.2023.09.22.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 03:41:58 -0700 (PDT)
Date: Fri, 22 Sep 2023 10:41:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX
Message-ID: <ZQ1vctP8rVPLY966@google.com>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914145705.1648377-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: tsbIfQZp5Xkc

Hi Peter,

On Thu, Sep 14, 2023 at 03:57:02PM +0100, Peter Maydell wrote:
> The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
> supported, so we should theoretically have implemented it as part of
> the recent S2P work.  Fortunately, for us the implementation is a
> no-op.
Oh, I missed that, thanks for spotting it.

> This feature is about interpretation of the stage 2 page table
> descriptor XN bits, which control execute permissions.
> 
> For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
> IOMMUAccessFlags) only indicate read and write; we do not distinguish
> data reads from instruction reads outside the CPU proper.  In the
> SMMU architecture's terms, our interconnect between the client device
> and the SMMU doesn't have the ability to convey the INST attribute,
> and we therefore use the default value of "data" for this attribute.
> 
> We also do not support the bits in the Stream Table Entry that can
> override the on-the-bus transaction attribute permissions (we do not
> set SMMU_IDR1.ATTR_PERMS_OVR=1).
> 
> These two things together mean that for our implementation, it never
> has to deal with transactions with the INST attribute, and so it can
> correctly ignore the XN bits entirely.  So we already implement
> FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
> that we need to.
> 
> Patches 1 and 2 in this series do a little bit of tidy up
> on the ID register bit code. Patch 3 is the one-liner to
> advertise SMMUv3.1-XNX in the ID register.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   hw/arm/smmuv3: Update ID register bit field definitions
>   hw/arm/smmuv3: Sort ID register setting into field order
>   hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature
> 
>  hw/arm/smmuv3-internal.h | 38 ++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3.c          |  5 +++--
>  2 files changed, 41 insertions(+), 2 deletions(-)
> 
> -- 
> 2.34.1

I left a comment/question on the last patch, otherwise

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

