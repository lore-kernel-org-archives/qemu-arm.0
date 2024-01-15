Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp285740ejf;
        Mon, 15 Jan 2024 06:43:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvA7IyOPVPlMwZVjsT0QmzY/bSJWPdM9eE0BZgFTeh+mVMOn2rJJjr38OThhTogyHhFjgn
X-Received: by 2002:a05:622a:1786:b0:429:f3f5:ac9b with SMTP id s6-20020a05622a178600b00429f3f5ac9bmr1847851qtk.54.1705329811205;
        Mon, 15 Jan 2024 06:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705329811; cv=none;
        d=google.com; s=arc-20160816;
        b=NkVHUsJzihaPf5OAim5iRKlj+z6J/+9OpgjNS9oZD2OIfJd8l0tUrq1t+2fFjT2OZZ
         2Yx/Kr91O6EJtDeMD3JjPwoIxcrs0b/hqni2uqaXXLQvS1aEMx1LfrmV4Wos/CrDqE0H
         lpMr7xm1yWZP2xlUmjwFs3Pbly0pGdcQSCqKQHwFQi6Oj0siJLPeHe98xAnK4xOoN+/b
         QE3Pjk1qJiPpjsfJbhzXE7gTj/KFNvknGy+Tx644lHHRFd7Hi6DvpSdEN9k2uxPSqwIL
         RFraoVUEb8i/klJjb5R7vhr2w84cusWLkZKaMxk2pttCzO3JO0Z9sScypjSsbsDkjICO
         g0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nLpdw6hlwYu1su834MYR8Ydtrr0Kp5o/313w+8EGdkg=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=s8xEVdJ5sC7sfIGNJCnSElBkSifW+v79d0Mqg9E/YEx5OJ6uSD2W932lBTDxs7FMuC
         ezD2fUAvrq0zKrPg+81zyetM4FTp7bKdLd4PBWBD1LPjMLJIMc0bZY4Twp7BtT/BrAAg
         P88wNLUkIHjevQIp3z/8F+aUUneFlouNBIPVKYEUq/HjwEIjTE599WPEtAmd3eqIPG4g
         dkFZmsskfTbcS5ymRD1l0iyF1y5cGlKqe/W9M4Pgb+nQwCYDx2WuCbxVQgUHlMETIk1G
         xr5jfD3XvN64POsJWiMRwy5w13wxIiFGYvM+FRQI8VOsQzlMHI9io02nwMPJdNU2+dCa
         7g2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyQCRaJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv8-20020a05622a0a0800b00429c9578c91si8025629qtb.314.2024.01.15.06.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 06:43:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyQCRaJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOBL-0005eX-Ok; Mon, 15 Jan 2024 09:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOBI-0005Ve-NF
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:43:17 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOBG-000597-T2
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:43:16 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so9995617e87.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 06:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705329792; x=1705934592; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nLpdw6hlwYu1su834MYR8Ydtrr0Kp5o/313w+8EGdkg=;
 b=nyQCRaJg8EzYePGKRfmmDmzB2fuEIfJTa+tD/uULlB9M60bZgSheUK2B9cX1SOfkm6
 S4uSglHRhkd4kFSmaOSaea4SdzMkRTPKolmUxVCpNO1pNy51CIwnjuAn/EZLVZ6DJUw6
 fkPjLZmLjhplU5tcSMYvM9UFN8YJaCvH3dzS8akHuCPAsRw0bbBv3BP8dLBVTRrRKby/
 HIiuji/6ywDw82hoFA3ej2kJDoRa6NWt5Cxu7Sv5DvABtakc5T+7cJNiyI0EjBls7gk6
 pq6Kz04eu1kcHN9mvPZiTcjaR8SCRWMchjgC+7YD/CwOlUsmqAe++fKznRehavnJ6S50
 w2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705329792; x=1705934592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nLpdw6hlwYu1su834MYR8Ydtrr0Kp5o/313w+8EGdkg=;
 b=OTWMEBDlC4pAt+VyhJhNXyn6SSn1IYKwT/c3lOccdnaaxt1Wdps1LqA5sVOnyQBvjJ
 aavfngDPnfnr/UYHhdd9rGh8S3fpZV3eNjKCbnsLpUdfy3pwUlnSxg2XUIWZUGLFHxyc
 SdMfzOBMRyq6F+Z3JjicybF641VRbdNRvXgSRSn1X84AGzMx/ckzPGu0TZG0rKK4NmUU
 OawRP19TlVFiXM8vk64plM899ilhtcTLXo7w500nLV/gPkse8yZSzeiB6RNWUDzDsuVB
 h0Nx02+rf+EA/swlQqdV/uIXuhLtilnY4o4hFX9yU8bpHKVtGi/afiyeJZa5+xBqBsUq
 WMCA==
X-Gm-Message-State: AOJu0Ywx7YaOxkqQJP4xVcCRjXF97siqWl2nMjy9+9aGqJYruvomroSq
 C9USSwLo2BrvP8QAAXOG6DoyGbn1tZexHN+XsEff4uiPkAmgfg==
X-Received: by 2002:ac2:4910:0:b0:50e:70b4:79ce with SMTP id
 n16-20020ac24910000000b0050e70b479cemr1426391lfi.185.1705329791986; Mon, 15
 Jan 2024 06:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-22-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-22-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 14:43:01 +0000
Message-ID: <CAFEAcA_n-uXJc9fd9n3c5Xj=ibtpokWpaozE-G+imyV6X=DNTw@mail.gmail.com>
Subject: Re: [PATCH v4 21/45] Add clock_isp stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ocg6MkpQ5cEP

On Fri, 8 Dec 2023 at 02:40, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 6 ++++++
>  include/hw/arm/bcm2838_peripherals.h | 1 +
>  2 files changed, 7 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
