Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp4200084qvk;
        Mon, 24 Aug 2020 09:38:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/4ejkJBHzfuvIxO5wDHgXTqS+FE6RP1LH82q6WDH4DFth68C4V7CGqtKvIn695qG9UWEO
X-Received: by 2002:a25:d0cb:: with SMTP id h194mr9003508ybg.187.1598287112282;
        Mon, 24 Aug 2020 09:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598287112; cv=none;
        d=google.com; s=arc-20160816;
        b=aBk0fmyv5EddWi5jZ9e35LpsGzaf8UVDJ7CeFZurS0cwJ2RvsOpc0Lxp5n6qD60hQu
         DXxOa5/nPVDzKHkOaSc60M/4xSAxo92uvnHF8kUQ3WTVoR9Yb3kOnRg3hZD+Io/lajgw
         PW/scaXNELi1dy7mwgVeZt4/eP6MI+zKWlbopIewSMO9M1JsECmXZ7byxCZM+g1UhSP6
         SBWVD1gxPexyarECOCiqSwCpbsPqT0nlKGU6gSfidd9ODN4L6cslmEMxsszoDmCxG6Zz
         JASg7nS/M5zHjdQ41UjsZOAOXeT8FMettdINNkU6kc8Frtc9nLV33xvTm1eEfZtDM7hQ
         b0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=j69Ra+GltMdvMqa3E47KAbR3OofjBojR6kWy3Sz1HnU=;
        b=oGqfupadDoPOkDSzqmErJIg23uN517el4iTZlUoh2JpR5N9PzuwSMk58SIl1YXfYlB
         B21zvr02ov9USGRF+bZuc7jqDUiTunYinD2g0M7O/j0z4VklzG1eW56N4ZNYzfrASqu4
         lFvslcm/aMDHErH+LkzsMlorrAtTdcN+XZdMNwY8FRF6YqAJwpx2UI7CoiZOO9hTkjWy
         0qkiLQrVluTyAsYKauu+gaXAk6+Y+eNm0lTZNLeMYvigqzYj6BVollSPdpAYZikg0Cf6
         2Y1TmRVXXi9ORqz9mbmAk77jSqoDxKRxgB5Cy6jcFkEoZXGNH9mHI0PH1PBiEKfCShOz
         ddBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gokuci+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p198si12063469yba.131.2020.08.24.09.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 09:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gokuci+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAFUN-0001gT-Oc
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 12:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFUF-0001el-3f
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:38:23 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFUD-0007dJ-NR
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 12:38:22 -0400
Received: by mail-ed1-x541.google.com with SMTP id b2so8664486edw.5
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j69Ra+GltMdvMqa3E47KAbR3OofjBojR6kWy3Sz1HnU=;
 b=gokuci+hVONN5p4dfhFKZZk3IJAnAMUTNGW1PeHzrHMn4M7sy404KxjAbrJDczZYTZ
 JKoznlm6qRaSx6MLnxzQhqIeGHc+382UhssxhUcEqrqbtge+egchPzpYTwc5Z/t18iMM
 QgHskrTdrafrOLVakmuyDGGnNSENw38l+y73hPxMwE7dVfDtzU+0diilrz8WluAIe+U4
 +slKHlxBSBwBfkzqBELwD4MJ7CLgirr4X0SYProlBZDd9dgNhGJYuURh+MqnZHH+JprK
 DOVKHxrJ6rB/Mh3LP5Z5M4VDJahB5j9BRCETHKBxQNdYOygN/0CEMbwne4UKi65KS904
 rK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j69Ra+GltMdvMqa3E47KAbR3OofjBojR6kWy3Sz1HnU=;
 b=uh9Svln67HloITm7QkplEOw8oQNRsZDTClxNr9buijvrKHFJ8eHw+Iz6Q4Vm1Chwod
 j19fx4LQbHQoLNqWp5dTn1S9SaTAhLGza4qTjfRUcT4eoTkjdITaWRK3tjGQKGiWQk+E
 haKEz71wyBhpGNvvxYKdx1sbWVhWbklxSdGFGG6j863rIGoNtZB7FppcvjNFTPrh4SVV
 odAJQdIxGOQibEsAqJTEirkZO89JYd0sjyyPHllmJY4Thv9UhzbU4KZdMpffmRvUQ9y6
 pHDli1wmgVA7ewbFsoUxwUF/I5ZwxZOAMop29RbbzjNQza8rdsKISVRevGRlVDUVyJWf
 7zUg==
X-Gm-Message-State: AOAM531q9LZ4PKaPUwkaLpkl5m1waX8Mxwhs3c9ZCreT+3mQxsKY8PLr
 W+oez9zKsOzhtMGKF3dHPs398qeXj2InCD3raI1rtQ==
X-Received: by 2002:aa7:de0e:: with SMTP id h14mr6031972edv.146.1598287100379; 
 Mon, 24 Aug 2020 09:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200814122907.27732-1-f4bug@amsat.org>
In-Reply-To: <20200814122907.27732-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:38:09 +0100
Message-ID: <CAFEAcA-knFj=Eg-+XdgUVsaTQNtHeQ9RO=0fT=N5Y0vE3WFQ7g@mail.gmail.com>
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac: Use AddressSpace for DMA
 transfers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Jason Wang <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c7WC/5PYbMOp

On Fri, 14 Aug 2020 at 13:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Allow the device to execute the DMA transfers in a different
> AddressSpace.
>
> The H3 SoC keeps using the system_memory address space,
> but via the proper dma_memory_access() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


Applied to target-arm.next, thanks.

-- PMM
