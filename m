Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp249382ejb;
        Thu, 5 Jan 2023 04:01:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMcOeJFPAFkFTAP7mTUVzA/Aq8z1T2rV8/bxnbuixggrL3Eld2J/UKoitDcsTkFkFyqCKX
X-Received: by 2002:a05:6830:1152:b0:677:a9e7:dee7 with SMTP id x18-20020a056830115200b00677a9e7dee7mr27544447otq.15.1672920078067;
        Thu, 05 Jan 2023 04:01:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920078; cv=none;
        d=google.com; s=arc-20160816;
        b=yXVADNJIz9rkQUxIbdt2Q6f22h9WwPfsWPRvhh5zzDxLMLdiBfQbHunuXQ7Kp7l5bz
         FeB+w2F4v5swtGtx80KChCWU4U7oae6YZyMNboAwG6l++qHQsr4Hl245uSxOer3RSsy2
         aePKrhr5vTFcXtT64eim5Zdna11x42krTdWNfEKCzqmpzywtYhQPi/9g+nQRKiMohdv3
         VE+94g+S1QtmUl0FP8PaDGo2INNmXbelxQHQUL5JdcscjKXIOXShcahSr4LSUvfIstwM
         R2Ilc2y1+iYEUQ3ih1lUXHrlxxofHIxCXm/cAceOHdtkvJDLzudoxbmOHxgABr3EsF/P
         kqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=k4aXZB5CAe2RGX7pZm+qkVZRnJqL1F+GkHrZt9dnEAY=;
        b=fuOqwJg20bEmLeknFc7o8RoLeCT+vH/svl+TSk5DIQ9HVOjFp1kNcu4yWAMF/ZysgW
         jetoRTtGo+eM/Ff6ZT5DalkfP43GbYUSWJ3sT9YeqoRf/YnrKb6ysDgY93bpkt5hj8iw
         DUKfG/20Gh5RrXQ5OMtg0NV0dK6yR5q6juC3tzVYGvHWAwv1iRcmQ/mBeZoGMabZMA6L
         I7EqNAx5Iq5EZhQAiTt/hPEzzyzjChsylmNoik5tnJ2YPmFDmHooVdT6DMqvJndEAO9x
         JurgQKma7mFVE167UJkRU5XtENYP6uns65bcmh384XcumUu6tPEnuYAAT5fbUdamlNnG
         QL7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t/7j3o9c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de32-20020a05620a372000b006e9872fce2bsi20699221qkb.173.2023.01.05.04.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:01:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t/7j3o9c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDOvi-00008m-1g; Thu, 05 Jan 2023 07:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOvf-0008UX-BO
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:01:03 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOvd-0000Jo-Ip
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:01:02 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so3234642pjb.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k4aXZB5CAe2RGX7pZm+qkVZRnJqL1F+GkHrZt9dnEAY=;
 b=t/7j3o9cEX6R7UaEUFMStx/tqoNWqrwwGqflKOzZ/xKZhn8E/oD/sg3yJH+HtiSFh0
 hhFVIXH20EfqOya1x7Mc4DBca2TRAPweWGzGqRWEgG4firiRQTaCs5NwkIiZpmmewTS7
 vchcM+jeVIbAY9FRPv/3cO0K+FvC9ykNp2mf1z79MHGb1os0zZjsps25DeUHWvk7boBk
 X8vqmsZP5ZCfNoo5Gx+Nyxl9vvMLy1kuqWRFWuIUfugR/omV1wmS568sslCjv4cCGJ2P
 deqAQOkRgIt79E9SWz0hhxUjAHrqPYfUPZ6DITd3mdJ0/N+H5UdscH29D86+SatIJYiO
 WDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4aXZB5CAe2RGX7pZm+qkVZRnJqL1F+GkHrZt9dnEAY=;
 b=ooxtq9lp429d4OeRajN0GALfhS8KVC9nPSXIdN1po2mpEwdE6gyfrdn3BnBevpD9oS
 W6cBb4jIbHPgc8dSC02pSoYl8n61foXVhq4hcl+s/YFJ4ycYl1a/3MXv8+8UjBsZtusC
 l91/kpXwBAtt0tlTFA81X9ViImDo33O3bCqIluh4cjlDGhMZ2CO71xXC3upD+zOuTO74
 CuI6c3cZQoLMLZv+6+fWRkAVNX2h8dmJL1Pw6qgmPB1AC5cY098PxjXlfC8VoDXfi169
 vbTDodBgFGz35HeaCFscLoCzwSbU+Suy+139fJUFb4Wtt881W9fxgWTVJkQwoYNCUiJh
 N8aw==
X-Gm-Message-State: AFqh2kqSpcXP5YQ+eW5QExKLEHTt1I935clSqapeJJKFLgzFERMThZ9N
 Fuls9qaPciY5QpzItyGHQaP3v5KRYylSTFFk/a80+Q==
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr388115pjq.215.1672920060192; Thu, 05
 Jan 2023 04:01:00 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-2@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:00:49 +0000
Message-ID: <CAFEAcA8SmtaZmQEFUuwD94p5CGB1iSGjur6+=KyWbTeXdoQCvA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 2/8] hw/timer/imx_epit: cleanup CR defines
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: icLZSNrmJWJY

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> remove unused defines, add needed defines
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
