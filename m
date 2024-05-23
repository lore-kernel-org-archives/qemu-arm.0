Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1017609ejb;
        Thu, 23 May 2024 05:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXD4Jd7r8xZkAlY+W00JUTYkBcyaUzl08j9VYUtikojOmZjMCtrVZ+GQKY5P6nMGl12eKOhAkVL3JfcqIChiGjZWN0XBnpF
X-Google-Smtp-Source: AGHT+IFJghU4cZRy6UdX0pAc6WZhRjmI64yQykYwrjIhnkvp/F1Uyou8H7Ct/z2eqAW58BXBLqdU
X-Received: by 2002:ac8:5ac5:0:b0:437:7a3f:d392 with SMTP id d75a77b69052e-43f9e173090mr54899731cf.46.1716466627900;
        Thu, 23 May 2024 05:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716466627; cv=none;
        d=google.com; s=arc-20160816;
        b=blNDktGVl9oz/j5cICZZ/15B9zXbn3rrwlJ4LFsxe7hTbqlp28U86DGcaHbFxfmq3O
         6VPlg3XQQeZfRgHR1Xl/GHM+LAgmmjHUD6WrBC2ksXMZKE63//6jIKqm55lrTI3wp/09
         kWn97XLz2zKoF6XSLcSv5W4ULFfSNW1TCdcXlBZ3nkNUrETb625aCc4C0r15CgNCfQv9
         8EY1/gP7PMW9pN3ioFuixNdQ43zNaZYcnFsfMAux9XpA1JTCgJWb8h4DojqyG2iEJfwx
         61yYrTcTpD6bbvUsJFwp6NLtSnbWIX/OMBHhTfPxErIWeAT0ojyiPV7ajXJi5LjoQn2O
         ijAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DgmwViRWhStQlewph0KxsbbtXSLnBVz28LhZ+zdHzR4=;
        fh=fd8RsGtupSpZuaxM70Q5HX6mr+E8yNc3cyr16iBuXg4=;
        b=gY1K0/uy4P4vyXl6P8cbe4VWQLsul4dhw2eN/J+HUAk4PrcZ0/o7N2I1s9oFJwfoGD
         McdWS3a5IdozoZGO/LDtMqe01ZMFnWgt86VNbGvwuBtcvxyNhoGg6dpz71mh2NQSSP5K
         +1yj8n199GBKgIHNhn7vyyeieSoMQlHMrLFu4IWS8eiSlUJbcearmFn5ZG6bQG9+E4kk
         c8z9pnjFO8YpsYOVAZusi90SXTiqkuoj4s6xNDmRBr9naNyFCIcx00JWSVK2Bcvkc3e9
         He61aKzoj/otU/RisOkYG6ug6d1yOh4qIuAW1CxWdBrtNBKEAAiVXA6ZGCcJIbsdWPEa
         E6Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/WjRMsZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e3814edb1si192901141cf.321.2024.05.23.05.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 05:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="E/WjRMsZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA7NN-0003QM-5v; Thu, 23 May 2024 08:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7NA-0003Gq-Kp
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:16:40 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7N7-0005Fu-OH
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:16:40 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-574d1a1c36aso11301377a12.3
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716466593; x=1717071393; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DgmwViRWhStQlewph0KxsbbtXSLnBVz28LhZ+zdHzR4=;
 b=E/WjRMsZ4KBYOCUNYL1V3JRA7h7j6+oIQaKNRp4xbgm8DpecFNUHl/P0rM4T78mtfh
 XBWpvzat5jgGc/UObbN57Z8rv3G0urfgPbqv0CVG8drNnqyeMFxyXP76VVpXn55BWkQY
 yx6zaIYlza9Ek5v5dmmEf4qHkr/2/NTkOL/trzZC8O6Qikx1ke825d3aBInjtDUjE3yH
 1KxR/jlrHTKcV6q7jfgCSSKujTmCWTITcqy17Eo1KPcbM9Ag/Lva0PWPakSUZuXzVgOb
 Blt9z5iOj9paJEJZTanWeUDPdocKRXkMDinlVhdvs9aJr6IrLIc7A82bFaaK8osQb2SP
 2oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716466593; x=1717071393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DgmwViRWhStQlewph0KxsbbtXSLnBVz28LhZ+zdHzR4=;
 b=Z1UsPnc8SV/tpigsmE7sw33fcRhPEv+N2QGvDmhVnJmRqp3CzOd8AofxmjmAUxrH47
 ZQhNfabrfYVAdJfbYIFrnErrSV3IQwHRpK5Sv8dReTlRCLAtbHTgOKfku3lq8m2FHgm2
 cgknGWR3/HfRn3D2pinioxe3O48Dn+jS+U95BqvtAcR1cpuW23kFeFOpgBFAb11U8Gjw
 Tpb5/rgeXr2FWiVylh+u0YkLoOfR6WFOHeNtat0votnaw/NFvxTK9DRXq7FHSj+vdLjW
 l8+0fQHekq2piRioLLswBn/ykSxIFc1afO4zGdSp4vW/WzWgsMaiEZ9T06gNfTGTkLPz
 FE/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW06RRkztWLC+wgV4SlsgG5cPKXVhANC3CpnvDFI0p8O4uDxCeRb3ViOnForNeipLmAeBKFqfyYlAQ23kf2o+b5wYot
X-Gm-Message-State: AOJu0YyrwQF2XKhAkn0uyYtHSJBAe64O7GiofdlMBgTHWcMQgy9wyA9P
 Xjb6XFVUKEFCDyzHjm1rKZ/dPY+dPer0Dop7wTQPlw9GiYAx6o5IFBJ9X/GC7GUNRS39JXWaye6
 xAPWUzFzVaZJrU3d8VsWHgvOve6TdtQy+SVT6Ag==
X-Received: by 2002:a50:a6dc:0:b0:573:5c18:c2d5 with SMTP id
 4fb4d7f45d1cf-57832a07eb6mr3212784a12.3.1716466592637; Thu, 23 May 2024
 05:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-20-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 13:16:21 +0100
Message-ID: <CAFEAcA8ythNU_AXZyL2D+rXhEz0uk9c8QhdAnMmf=yz1G8-=FA@mail.gmail.com>
Subject: Re: [PATCH 19/57] target/arm: Convert FABD to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: za+OemGsLa/H

On Mon, 6 May 2024 at 02:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  1 +
>  target/arm/tcg/a64.decode      |  6 ++++
>  target/arm/tcg/translate-a64.c | 60 ++++++++++++++++++++++------------
>  target/arm/tcg/vec_helper.c    |  6 ++++
>  4 files changed, 53 insertions(+), 20 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
