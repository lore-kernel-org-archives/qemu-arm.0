Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1087028ejq;
        Fri, 10 Nov 2023 02:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQuFUFndjDxv6e38lk4KEFgbqtnNRPl7isfD/Ep5t2TJeH0C/5zL+P31jbB0++pQpv9Awx
X-Received: by 2002:a25:20c5:0:b0:d9b:90d2:aadf with SMTP id g188-20020a2520c5000000b00d9b90d2aadfmr6820620ybg.49.1699611603550;
        Fri, 10 Nov 2023 02:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699611603; cv=none;
        d=google.com; s=arc-20160816;
        b=ge+cEB9hdn/JRuSR5Ifytd8KWqy3esEe2nr2IS/O4MhZUX+F010x2Ju745GyQgIhwK
         5O3EYE+lVShutXw2VxS3oCGKvuIC035gKiRDuxq8bI57dXK/lX3YOABaJiWaeOJx+f7r
         aXdni+dT+qNe1v6+ZksRaMwK1XpL83AYDZ93gPjRViBSqUy2mAkifW/wkapv0wTjO7be
         KpOxLuKxjPLTpnaeV1SWd1P7BJBNcmvbu3lvvKXuoeAbiIrxHomPY5YyOvEfKvh0APSE
         LiYNxJGm2hdaZEfDVxB8GRQmDM+Img22f+Y45xrc1m4ThfSf+oSrfc5dRcLcymF0XiVx
         3tNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UuTVwkNU5aeIlhkYLSuV1jLn77VkG1aW0M33v3Y6yWM=;
        fh=auo070E/Mdhc6mhwv2UBoZ+01lxy+zviDJ6pob/+/Ws=;
        b=ZUjEq/yw/67owsAUCNOye5VUe9slY8DUtm0KxLzVED4AVvQjxuBIBxt0t96r8M6I/C
         LFKbmsLMnqIONejchgAO3DR2tbbjaCY0iZvX05EzJhBVD9L/pr96JYon5mlyDVGbIxmA
         6OOwFpl9U19gjx6XmaejcE/anfIAQue3Hh5krpqVgu344zL5eKSjjWIuigPwXrwwZJeP
         eVGn6vvyz/dMgIW6oFmq2hONut+9rmoXWGc2CABysz0g71igYpQFGEAfUIozOSLP5qdQ
         0YcHwUVBL8TWgSw0pFlvfkni5nyh1NbKgTMK5fdbMsBcGSyUi0FmURSRIBrnYpziIc06
         4+4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6hpY6MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe3-20020a0562140b8300b0066d7ec3340asi4205946qvb.63.2023.11.10.02.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 02:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6hpY6MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1Oc6-0002YI-Ih; Fri, 10 Nov 2023 05:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1Oc4-0002XW-TT
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 05:19:44 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r1Oc3-0007Sj-8h
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 05:19:44 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so3034825a12.0
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 02:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699611581; x=1700216381; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UuTVwkNU5aeIlhkYLSuV1jLn77VkG1aW0M33v3Y6yWM=;
 b=A6hpY6MM09VIQvCzWL5BmQ3o0OUGUN6CJ1ppNtnMucYft64pSXdAnEBooEpxIo+8Xi
 23r2goCGvQBtD9Ohnq70NCVnqQ/VJR8EIcqxb+iGrvUarOiDwiR0x/9trLcFTAGxyKb1
 kWMs+v1KeHtrNDEXACBw2LtmyrT14wdujUBLeUkZO5iPAXieNSwmAGm5/EALod8o43rL
 YAR9/J8UoJ9kWT7u8maIw9q25+LF1xO7UYKdmrHOXZQ4WI+jqTAjnEL7x9AQjLKnSTml
 piuwvrLkHOZSy6AmxHidfJak6jNv0iwPeMP1dWyUdCcGzQaOdjw+EXFI2L9dqcyEF6o/
 1O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699611581; x=1700216381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuTVwkNU5aeIlhkYLSuV1jLn77VkG1aW0M33v3Y6yWM=;
 b=QzY3MVAZWnua22kZty8IgDsgSL6njddYGSyci+gMIdnPIf4jw+Ee/p6gh1nsbmt8FB
 IH39L5bUMUAxr/qIzy4qvdOG1l55UPqCmLLipc8F9tBHKZHrvBOlC3Wp97RPqvZ+SJJ0
 A0gOptAiHCKiKq2y6O2SsxVo5k9GkKGdrMLru4Sa0fjgBifJOGtWMzjjFB3zqGafwXdk
 gSVM/3GEN4t2WCUKU/M0Uo4gEe9u28JxOU9MejKCFcc7d96CLqESEBJrscqdb6qmmmUW
 1c6OnludShUGmuwZHiI1oKitO0bH/cov+PSW5VRjqZ/6CEyJXgdsrUfXOh5AGxOzovqG
 EdlQ==
X-Gm-Message-State: AOJu0Yw/o5cEhVHsdmG3DsfZ/LlmeJ9smCnLmkFhWyNIwjgREmWInAl6
 YbOFfYCLXWmh9L2ep5NdmaX/v5rwidlIivmsM8cORIWX1utPuNWM
X-Received: by 2002:a05:6402:268e:b0:545:5674:4293 with SMTP id
 w14-20020a056402268e00b0054556744293mr4572736edd.28.1699611581683; Fri, 10
 Nov 2023 02:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20231110090557.3219206-2-jean-philippe@linaro.org>
In-Reply-To: <20231110090557.3219206-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Nov 2023 10:19:30 +0000
Message-ID: <CAFEAcA_Jja7MT_cSiEJ2it+wG7LnUXfnuoo1vmoUf1-+KSgtAA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: fix GIC maintenance IRQ registration
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: SllCGagMjScw

On Fri, 10 Nov 2023 at 09:07, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Since commit 9036e917f8 ("{include/}hw/arm: refactor virt PPI logic"),
> GIC maintenance IRQ registration fails on arm64:
>
> [    0.979743] kvm [1]: Cannot register interrupt 9
>
> That commit re-defined VIRTUAL_PMU_IRQ to be a INTID but missed a case
> where the maintenance IRQ is actually referred by its PPI index. Just
> like commit fa68ecb330db ("hw/arm/virt: fix PMU IRQ registration"), use
> INITID_TO_PPI(). A search of "GIC_FDT_IRQ_TYPE_PPI" indicates that there
> shouldn't be more similar issues.
>
> Fixes: 9036e917f8 ("{include/}hw/arm: refactor virt PPI logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Isn't this already fixed by commit fa68ecb330dbd ?

thanks
-- PMM
