Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp690441ejf;
        Fri, 23 Feb 2024 09:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEx5tu3wElybY/zEm33C51IzBWIEakygL+d3yRnGSG75hjOtk12+xDy2oUI5KifIfSWrAze3wXbmIn/2wkgHdQavzv6GR7
X-Google-Smtp-Source: AGHT+IF1gniHks3LqiC+IlVLtUXdmkBsyXUu5YF7Y+pm6vef3m4Kw/Y5iTX3JP3XfF5A4KFF8dUQ
X-Received: by 2002:ac8:5a08:0:b0:42d:c7e2:f1cc with SMTP id n8-20020ac85a08000000b0042dc7e2f1ccmr329795qta.64.1708707806004;
        Fri, 23 Feb 2024 09:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707805; cv=none;
        d=google.com; s=arc-20160816;
        b=aGVb9divVrdkReqHOgFI9mLWmRjV9yu9Z/vVVyLkPO1U1S4Z/uhrGu3/1xRXV2cEty
         T5qZqNgT2UCI1P9J9aM8MVAdyGaQp2+0LqQkdLBpqTKU4vGS6BJynvOpgGY+TCL+nc61
         h5hzOY+XTwMwY14+bSkNH1drvm3yPrKiJ1Bw3TqfOwBPoz9g8VPXPzhxmqvvWbPZpn/N
         G/qVnqN8ZLVR2Z91Y506uoIPGUrv2zYgVo0dXwqjPhmpgPNz3IzBEL5cln/njtKXvMeW
         96re7PzboCWBvOU/BPReJfl5LOcMnw4JU+jGVpFWOQhkvi8ikmVoci513qEmDaCz997L
         hfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=llXsudmdYQAx5QfO0HXhkgqlqTsadywEAWz29qbJw8E=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=Ze6GcP5NSl3sax+dRlSjT2vzrlgIAhiZig18psJmnSaahIg95hgw2gf33RjzZLbVJi
         c2+nwmV9watQfmPf1+h4GTqJBLXbu3tt2bZUT5/xM8kdxezN/gn1Flb2dzMHU6ls9iwU
         fAdRUFTDpxm5EznPfHQozSiU3ly5oytig/DBRb3LIxr1Hc2D3IL5cYTwdhK1eN5u2zy7
         dXafeBngDlS4rwhMAdnfVPSTpAqpBkeiqfxuY3ULdpYv+a6HNZn+QvuiN/U9zCB+LHV+
         r3S4dhFQa+1YD0TYrZG/w5hpIfjfAZMFnudXH7kgJV5Of2IEyHq6sCBFmxClQGdb27+U
         Od9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=THFyZ0bU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020ac84583000000b0042e4cf463f7si3494156qtn.340.2024.02.23.09.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 09:03:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=THFyZ0bU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYx1-00018U-Iw; Fri, 23 Feb 2024 12:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYi0-0000fX-I5
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:47:36 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYhy-0002Fe-QB
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:47:36 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so1946406a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706853; x=1709311653; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=llXsudmdYQAx5QfO0HXhkgqlqTsadywEAWz29qbJw8E=;
 b=THFyZ0bUAX/JeW6eF0ayyVSJ6WGvt0abosdMJBcUT4XE1Z/u7KS9Nq8q4mOdWgPTy/
 PwdNm48z6Qy9koh62scD3UYHg5FIHEkdkVekdsKHCR4ooUZkqdNSe/8PM/+lMI5kVuZF
 D9O+q4TazgMj4VNWIXaWqXPo9usAv+qgujUz18vSuM8Cq4UAkC7GEB9nbxq9uCC2PsJv
 VmHU62/bQDKBHKBXaUhSJCHCqKBN9Kyk8rp1uYO+tbA+RLuUV36lDnsluxGxO3L3ivnR
 C0DRxX2CSLX1bnBg9X5x0hgZ2Gmxa5DZPJhp1WYBBQke7VqJMfJ1q7Pd7R1sFhlgpcV8
 ORyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706853; x=1709311653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=llXsudmdYQAx5QfO0HXhkgqlqTsadywEAWz29qbJw8E=;
 b=FHE+oc632r7cG9+hPPtUriE6tYZ+zM/mO+ONDaMFhGmkCFtaVkYZnEpF+7R1X3CGg6
 Ton/glxy+SPxaQzkihp50XOzCeRGThoGaNI6denX9EUvXuD1ruCh/Ftk6X0tYBv3sFGS
 NDpVLc1TyOAz+xL3hh/loZuRAKNtNl5hD08pt/PKU6tkqHoi112tlFYbC3ueN1m1XpkN
 /sjlaJ1MaMVzU3FrUNa6LYg6MSg4AYhj8pvPtLScfehDuzmL8SpFUybJswihPjkWEoqz
 PvZqukGprlG837yb6X3rZKY+tC7EtyFUI/yF05POZCAJZErEtSyDz2Cw6vZ07eFr3Jsj
 Mxhw==
X-Gm-Message-State: AOJu0YwemPkRusfFcvYXU4H1UmofjiyV1dS6BoT+4qs5u57aE38Z9uwQ
 ID06n27MEvTskrNsarj03eQU0qYP2DZNzHr9C6t82Ws3iJ/VW0GH83TCJe5RUApiqbfgbyV/LSf
 mvLzXMSYaN0AksnuwwRVYOJ7gduoVsQJeBRZ/QJ5fkZeg7bog
X-Received: by 2002:a05:6402:40d1:b0:565:949e:1530 with SMTP id
 z17-20020a05640240d100b00565949e1530mr135399edb.7.1708706853260; Fri, 23 Feb
 2024 08:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-13-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-13-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:47:22 +0000
Message-ID: <CAFEAcA9Fc2oHp+vVxRgY0PMGeHcEW187rFFK5-4viQGb3hHgaQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/41] Add memory region for BCM2837 RPiVid ASB
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: oXZW1UhgjGAn

On Mon, 19 Feb 2024 at 01:23, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 3 +++
>  include/hw/arm/bcm2838_peripherals.h | 2 ++
>  include/hw/arm/raspi_platform.h      | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
