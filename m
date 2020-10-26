Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2792868lfa;
        Mon, 26 Oct 2020 04:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNpLd67Rzj1AWnIFztzfE+2Np7Pp0l73w237hj5UJAJO1CMYL37vPLijImBo5DMYYz62Aj
X-Received: by 2002:a0c:b5e1:: with SMTP id o33mr13325731qvf.17.1603712342840;
        Mon, 26 Oct 2020 04:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603712342; cv=none;
        d=google.com; s=arc-20160816;
        b=FUkckKl5tbOA1gxsG8fdprpowkYublDTcNzAieXU43pPYe12Xm1oZbzk5tF9Rnx+yT
         M1JEEFYF2HSMkDltMKes/TfgjHy6a67PL4RaZTsspNX2xJVuoiyAaFcIrcaIv/WxClia
         15JibIGDQyb9yau8jSWWR/NTb35E8xJXyMUMcdfgGyge6XEDJKbyECB81coAK8oZGl22
         d0eWABYBr9EMzjHTlIBikwENgAl40qbBRm1QdWAp5hrl0or02tL9Uaus09VcZoAuw5bk
         PJMh6BxDeNQn7MwwW6f3KfeWe4JWKUswfooJCYOvqW3B9bvlbkHi4SxCdb5gKZ8fPgdj
         wJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8S2JinLb9lWGKscLwifjdAqWcMxstZyUBqU3LCeJXGo=;
        b=qDvl34QAda+47GN1+iS7xgcDwIHtSOaKD6xsTjbv8qwvipqTWeLXalwN4F4XmrWoII
         Nm9BkKkThZYYSl1GxbCH/ea3V1VPIFauuP0R/aSjeWN4HugSF5OswY5MA6iHK+I08q0i
         U57IvnRveqTrqP3myNqEmT4C/pCrtI+rQfqppn2dmNzDmU9RzOCZzqaP8aA1IlNb2bji
         7srIoGtfiTKl0XbXEdn3I1R2fGdA7oDl32vipJtXmmom5jkC7SYaWRNcEOkQUwPc/jEL
         u29vdX9L8CVJQqMR54h/YYxUjqHc7lTUDFjHmbT0Xs3RSQdABN8F8xhcpy3aUboMTkyi
         ormQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xFGbjG+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si5742209qtm.5.2020.10.26.04.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 04:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xFGbjG+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX0q6-0003cV-5p
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 07:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX0pw-0003aI-Mu
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 07:38:52 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX0pu-0006ok-2v
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 07:38:52 -0400
Received: by mail-ed1-x544.google.com with SMTP id o18so8882607edq.4
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2020 04:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8S2JinLb9lWGKscLwifjdAqWcMxstZyUBqU3LCeJXGo=;
 b=xFGbjG+WRzcNSnTy97NSIELrWn6WK7B10cNarI3kCpnT+oqrIMJvoz4S2tgUuhlfiI
 WVww3NDiX9aJiF0fhbTaf4l6fAvJQacIhnC7ec4NTMMx7qZClwT01YMmO3XZ22w8J+6M
 rwDu+n+0gYg3a3xWaS33VHtle7E/cEmgxh4f36zuDCRmP2rSMtL71qRue3P4X4Nibz4e
 oXy0dTnCvvu9Ier6WdB9A48xRsWH9fHhfzE98hqwGvb8MvM1LUj72XsZBj3fTdQxon+U
 Zwn7r2RNbU2pW8+JNH8+nsWcBY6M6Wj0aZAJAm7D+Mr/P4hDcDxO8R4TAt8kjaZcy4ZJ
 5vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8S2JinLb9lWGKscLwifjdAqWcMxstZyUBqU3LCeJXGo=;
 b=OiF2xvJzBZEkmIFKyFH4MLryyHlUb2DqWSzhQbvWd044sY0J38EzMkTwghnbYHOTd4
 /SO0GGJjKLlqtfQJvQco25B5OUSiRSW4xAsgxl8I4WvwPFm3/WIkXOVjsEGRChI/8Tby
 q44qGe2mjSz4Wjp6DMJRO+k0m6H+xwyXjiOONJrkQO0oZ1TtTKM/0Zuc8rbt61QR2OdN
 CPm5AAYbjm5ba1/8eoLvPeEVLs+4f1plx0I+fG08DB4auhm1QPgUHCuAetVmqg2uaWxq
 xMZIjhLJtfzXtUy4WIDrx0SfaZG7A0o0YwYz/3Ig6cPJ+ZRpID3L5xhomJAZppVidARZ
 wbsA==
X-Gm-Message-State: AOAM531tVFjkLOuNJJGPeRtVydd8oD4favqY1QE7vqBNjOAS9ylX2YAI
 8+1My5Dj3vlXLPVuDHvvvay0imFEftDI+BwlffNjnQ==
X-Received: by 2002:aa7:c683:: with SMTP id n3mr15018685edq.146.1603712328549; 
 Mon, 26 Oct 2020 04:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201020105938.23209-1-thuth@redhat.com>
In-Reply-To: <20201020105938.23209-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 11:38:37 +0000
Message-ID: <CAFEAcA8hxhVgpBdTd24opRKtnYa_73NSuU67Y17F_Rpbup2cFg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/highbank: Silence warnings about missing
 fallthrough statements
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Rob Herring <robh@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kfSrFma6YTN

On Tue, 20 Oct 2020 at 11:59, Thomas Huth <thuth@redhat.com> wrote:
>
> When compiling with -Werror=implicit-fallthrough, gcc complains about
> missing fallthrough annotations in this file. Looking at the code,
> the fallthrough is very likely intended here, so add some comments
> to silence the compiler warnings.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/highbank.c | 2 ++
>  1 file changed, 2 insertions(+)


Applied to target-arm.next, thanks.

-- PMM
