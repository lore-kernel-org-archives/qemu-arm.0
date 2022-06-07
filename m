Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1986312lfb;
        Tue, 7 Jun 2022 03:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywA6b6kn8EZAykUPcjrmDVz4Eab354wyGCAyXS27iOxRqzshzAvvnGSm1MJIxd+UnLEm/e
X-Received: by 2002:ac8:57c9:0:b0:304:fd1b:df4e with SMTP id w9-20020ac857c9000000b00304fd1bdf4emr620383qta.512.1654598011752;
        Tue, 07 Jun 2022 03:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654598011; cv=none;
        d=google.com; s=arc-20160816;
        b=rFDqxqnZDBZUXL1vwXVi2F2uxBfq7644ayARW6OXW3Kt0s984LXPEZycTDEgIk0zx0
         TRxtX6tprrklcXZHunN+MDoXLsN9G9sUAKF8+AYUaAtnku5yKDW8oHVsjTxFGD7jUDRi
         HUJrAHGjeQHOCccph0jSxWg4th7L4J1GR9VQulkGSVq7x/jxoFDJ8/em3NGrrxnZeCwk
         ttUPQChRmj8KFPQddk0FPTjwAmJSufASyY41RuZLN6XOpixTXsBqLCaWxVnYPkxUzvED
         GOrMiiJmLwHbeJ0M1gPBzJtXkMujuL7kEONXb6w/IEpfXY50vU2Hrn8ZyQd4sacSYioM
         d7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mInI91R0PXKv0MZpXvrNXelzJblvF7ifWargfRR9fKQ=;
        b=HBnVS7Z+coyXosb7c8F8KTujbxQDtFs+qral2I7pe9j0GiurVfS/Nx4DXK4FF4/Zu5
         CWvbgECzlZyRV4HJTejOCMQZFDbjFlkVTuCDCQjJVRd93SyNYLfX+MtpDjbvV4rN1qNV
         bbLekUXKPwgLePOOVzICGtVxnqM78YuX7JxN9nt2XM5I7GUTBysJuYs0KT+GDyJnhZ/R
         u1M9muLbxZu+tJj7ROEHmrsSzOsZPYPXVlC7h0xOfJdoHj2l//LFFPKyLQhzPLbK2xKn
         JgAO6fv5oZWALKKr9CpKTYVxy2QLWMztu9YuvH719wx5rM/Ew5MH5n6VFc+UdSAij4Rr
         KsuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm9zk5C5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a40cb00b006a6ccb630c5si2133375qko.601.2022.06.07.03.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 03:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm9zk5C5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyWWh-0008H6-45
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVzQ-0004Sy-Ds
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 05:59:08 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVzO-0004fs-Ob
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 05:59:07 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso169308697b3.13
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mInI91R0PXKv0MZpXvrNXelzJblvF7ifWargfRR9fKQ=;
 b=wm9zk5C5zG8EyDvgRPAi8DhiRopWNc7d8NqrjyKfcqnZYmm56do5jvkNcXh5nG3xh2
 al7L+P30/cj83yrIqa56CCxspM2pSYy/DEMt91QT1vfaXatxjEvVYYBz9Ufwiyy3ubnG
 WytK8OJOeCyLgKW1GeZjWLUUfJJwcqlOI+w1ox3+iDJ4YabkwjeDnG7wg6LDpO8hGKr8
 HEmfF0yOOEd0U1JeWZPi0l9IKm27tCbvTaBx0d0jKZmNU+e8cWyzbE0uVPjYnIRIUOGj
 Nrrzqyolttvr2BekV3eEHRYwkuokUHWcAlcj3JVoU+F5Ol1aKOt6cvb5FemoXHGkQlfD
 7oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mInI91R0PXKv0MZpXvrNXelzJblvF7ifWargfRR9fKQ=;
 b=bX62E3Tk9XoOWg1aHaRpSccTsrEHHRRbkq7VpIuxuVlscsDPm2AsOhfjcBY/pGW7lR
 vvRsVnrl7Y1/xt0G2HlVI3HThebHyTNAMhzWZU2QofSZFrFNlnT4bUv2hx8Xdz+erzBs
 zhJsT7P+0NHAJzoXtuGGwqDB7VZWSZjzUjzHkymyFZtZagaDBziSLgHxIt4/YfSEafN7
 DT9zqkewg9L8kzamIXxFWyKyvD+d1b4zJSGAL8BNU0U/NFnPYUIcTtqdh+TPT84fL9lo
 zDqjkZ+InVkbrqHRZhOOiNzkXNcyCovjlcQdR812i8FwpqC1b3+nWLiGgZXEOtj216h6
 bseA==
X-Gm-Message-State: AOAM532VjoOad7+b75TdsMuTdN53f/3hd5TzDn/J966qQ63VWV6afBCl
 TVb+W+W2Y7i+T+cAyAux7hx7jqAfn9bFVERf9cKy2Q==
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr29878571ywb.64.1654595946122; Tue, 07
 Jun 2022 02:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-41-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 10:58:55 +0100
Message-ID: <CAFEAcA_v=99UsZ4V4_vZSpHtb4dGGV39-sBnks2wHgAkfj2dFg@mail.gmail.com>
Subject: Re: [PATCH 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPN0FUz72ABQ

On Thu, 2 Jun 2022 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need these functions in translate-sme.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
