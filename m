Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1906698qvn;
        Fri, 5 Nov 2021 10:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNbKOkIlYDokMqehvt5C5bdkj9/9eq7RwqnBviqxre1+8JRmwkGf+1wRFNqpNbh/SpNSXN
X-Received: by 2002:a9d:5783:: with SMTP id q3mr39033480oth.81.1636132318656;
        Fri, 05 Nov 2021 10:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636132318; cv=none;
        d=google.com; s=arc-20160816;
        b=xTjGee10gkKfLl2pNG/7lPGZ103IhQ1G4ztgpjd68nETM6hF/hy00bwypeaCYyjGJk
         8OMSZE9IYklBR/aRrGMYBUFVkFaIFPGDifJNhu7NOQZc0TADJfhKE11zLpG0e0E6n5zu
         MsLx1aqJhNRV9x/SLHTCa6Z3TadEt+6qO6pX250jJs9F9FZIc0jbygBAQu0//fjKdcSJ
         SUJhuIK8fTbxBiAv4jHX13DWm2JW3/jPR3O8Ib/pPPYaSEAEfHO8uN2Moum1tR59L1a8
         MMWdiccDWp1h8b8t8B8UV0F9kloWAy4QPikSux7DDEnTW59zUzsNc7B6pUMmE1BMb9SJ
         OJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PDddDKSiMid+mGy/vrWAQvj3HVpGJ4Wy/QtQOrSdvYw=;
        b=czufO7tkEu7VTVtkKWAmQdeD8FtQbuCyqKIol7M0/sPV1FT9osKoOiVLFlmQ3f1Vc+
         uRT1C1hW8lLNwNj9uYc7RJTCO7EH4yKbwwIEjI04ixgEiuSFwuVl+Jvs4ccibSgavFyx
         tI3uP50PqGzsL/v69XuZa0v4Ye8YI+XzQB0+eJP3GZv9A9zoSgHtYFETV3rJODimnJdQ
         p9V8WU3Rr93PAOKiiVG1JsVBF17TXd2eFddxnUWXs+yO6BR96CRzE2nGLfV42yr3EAKs
         bGUMqJe5U8EW/Z0kIy2AnL2tl/872hty0UhH9ldMhPS2Rn1q+wtwK3PF1YAZH/kwGEWU
         T/TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=up7TfK1A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si7628559oiw.7.2021.11.05.10.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Nov 2021 10:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=up7TfK1A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mj2kw-0007vO-1K
	for alex.bennee@linaro.org; Fri, 05 Nov 2021 13:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2ie-0005dH-0M
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:09:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2ib-00042w-HA
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:09:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o29so3810381wms.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDddDKSiMid+mGy/vrWAQvj3HVpGJ4Wy/QtQOrSdvYw=;
 b=up7TfK1AVbVbEE6YKaaT7cPHzo5osbYWioQj7HvwRT1oK8JETAYbfTdPAXnQXvTE8Z
 hCOzCuejPXFAfGVRwDKgjESLI+lgsHdZ5yiCRmlybLQR8x6/lPBRbp+62HoD7Ozf92Ky
 zFLU7PYHof0PSWTxI5pmnGHeZMADX3DZecqHep5dTuwVv//3GCDccRXSBvEgVp052PO1
 TT2FpBsci2BwRDtMtD/uYNMR9rz/6CVMSmjb6CrQFjWfVoMD2NrwRk9VtM2Nq2I2rjqO
 lv6MX0kLJ1kHvlo0X8DN4hoJXy0gVIRw7bNZtq3Rz1EN8yZ0n0LbpMbPDQG/BHeJpa7I
 HIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDddDKSiMid+mGy/vrWAQvj3HVpGJ4Wy/QtQOrSdvYw=;
 b=gDt8VEsN7DmwdUxw/2MTCtFjGQptQqnwoCbExcGDlZp+5nrUMoNShEjKbwQwtWe4Qb
 nnYhN0AzcxjfVc10eq2z7HssbAKG2YIn5OsT01yYHvW9bN6Cx4GLn1pSXabWHMh6QKry
 75jLiU+HDW/EmptobJ+2P/VggU9DT9Kpk0pYszUxjL17LNwD0re98IY3ogalH9nFOw5y
 gdwnQyO+XoPsbEItm9CM0wO9rqx2SkxDJbGpaPgevpacvLiwMSlveRJTYqW6by4bWPfP
 36a5gAz4svAoOQCyDFH4R6EiXqlSYcZ+6lv2H0SpnvyXfmDM+4j4UMmMs2gjrfRYf6jV
 QJXA==
X-Gm-Message-State: AOAM5302FahND+aNNH59hQgdMtxpHVtXL+QvctZEfZb4Qwi5wfIO3FBV
 Em/B3LpcgRcvViEFMi5ipW0Ea4NBDQeW582jBMJQDg==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr32176395wmh.37.1636132171068; 
 Fri, 05 Nov 2021 10:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-7-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:09:20 +0000
Message-ID: <CAFEAcA9_3s3yVE8=cjcUt9uFNpxhzuigUeXKVS0bVC91zfFmcQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] target/arm: Split compute_fsr_fsc out of
 arm_deliver_fault
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9VKAZflMfse

On Wed, 3 Nov 2021 at 04:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will reuse this section of arm_deliver_fault for
> raising pc alignment faults.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
