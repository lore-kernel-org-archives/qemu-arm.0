Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3242536lft;
        Mon, 4 Jul 2022 06:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUmXbP3jnIYUvo3jI/D23gLtXsRjEJfzFr7DYDySl/azR4Lg1OzHVWLucltbLHK6HF7eBe
X-Received: by 2002:ac8:7fce:0:b0:31d:34bd:66b4 with SMTP id b14-20020ac87fce000000b0031d34bd66b4mr16319051qtk.673.1656942594071;
        Mon, 04 Jul 2022 06:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942594; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd/BxgcJXjHSz24MeUJ7+9xHN2B++WF/oDEQU4NMxvjlc3vuABm6tFWdY9/n4SXNjf
         uIP6fgzrFyjdeXRheBHbHIWvv8PDGJCdOKuWD/ucsKHK0MGsxRzSxe/ztV9Tw5X7Guge
         eIzN9j9CdBVn5SCQjWNfojSw7hZeBzmm+wRTl/y2lEktRYfO7QuM4N/KFtv7P7u92ksa
         WNgtE6KwovbR+Rb73EsRmEyKBfrnPnG0N17ryPn8vSXhm7yNN3zMUeFlP7/uP3N6tzeT
         NQZgXDRTiekC2fKi2uodCv8582/6Jz+KvL+tlv1K5NDrbSEwt1ZOqupLTm2VNmvZYd1/
         IAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CBK3Zgxt24yhhFTqzB4RfQ98zvYPshzpy0HdVp7SwLc=;
        b=S/nXoQjaqa3JkPPsXRaHUNzY0wKA1fbT1/dnGfV6aIXbN0f/YukycVkxRJ1GVDbDTL
         RQtskslrgPg7Mht4CWOp1QeWpqy/hTzWG58/ze4oanoDHYN/DRKHDpxQ1/wlegGysO2M
         TxBp5TXdpQz+YFdsbn/Ret0xjFIjinmeE6vayiXmaRIXLZFLxJhfn5vRI+BAgGs3L0Fx
         vO15D/5eavIPKdlCAplQZRkzl2XVkxIhi858H1z5MF4KZuMefIJ01hHIMTt4kdAXGFsC
         osY5/4L9FQ+uguO7+WvbpwB83fgUrN6FkGKI0dpXXXPkaJMiNPBSQjB39eAYHY4jaGwx
         yGRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dlvn4jPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05620a44ce00b006b15b762e7csi12937018qkp.656.2022.07.04.06.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dlvn4jPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MSX-0000LL-Ee
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5G-0002l2-Pd
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:25:51 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:44619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M5F-0003cT-8z
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:25:50 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i7so16866146ybe.11
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBK3Zgxt24yhhFTqzB4RfQ98zvYPshzpy0HdVp7SwLc=;
 b=dlvn4jPuW72Mxhv9+XzRMqFKXIuvBiPdzhg0w2nOix8Imr/jKsyrHzvoc4xRJqE7Q8
 0hqTMF+PaV8rjok5rfxEKJWg3zCSklsfGr3xKDz2RD7URoZPt3DOhLU1pRo11XTj/6pL
 4/Q3odLSev8/erHUVTm9/SngvGz2PBUBJ2DMTQLo6NceEDJRngpyNnpr4F2C5tq9LAws
 iBQHBdoXqvqerxg6WDX8cvS+lEVrBaWv4a39wF85I9RpE2wyTJMXJTHMVL/lBSsgdvcs
 XN+H0lYKP981GOLrrwleRQmPGL2Ob1l6MIQ/dJD6RU8qlFJeLLEXBWc/PHrf0pjLi8NL
 l+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBK3Zgxt24yhhFTqzB4RfQ98zvYPshzpy0HdVp7SwLc=;
 b=5O51fi63KMBBMP34oBvkajhiEzRqs3PU2HEm/PgS0fznw9ft3YRSe4gu/g/6rIVcKu
 8PYPDTVmrba7sA4WhwAoG7MoTRHR/0K6l60TZrh3EMLB4I1BJWC0IfHn8DRNna8JtTJl
 34uh1ZqHz3aJhZlUR/oyLL0VgEnVa4OAkiPS/qKOhd2JlvbeGyIyIOwzeZz17KbXVNFI
 4ge9kLOWLm+v/5u2SaKri0mHrWvNY+z+m1PmlnZfgZzeb9Utc+znthdde96YEBa4MWza
 Jsw8teywGVicm7N0A4mK6YpGq+f25qEfosWilneRhC5ikHZDvcQED5Pmsf/tGWaq4JWH
 yE4A==
X-Gm-Message-State: AJIora9+0HnEsEem6kVCc9mWokskespchINEvatCZabXBQNKMT0gRhHJ
 oRp++yZ+ikYC+spWmwXz/PFJ/WUQgiLQ5stF590WlA==
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr12241251ybf.67.1656941148083; Mon, 04
 Jul 2022 06:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-23-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-23-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:25:37 +0100
Message-ID: <CAFEAcA9i8nGOoxk82eEE55NycwoQxFonH+Dj1X-VUtcF=3riKQ@mail.gmail.com>
Subject: Re: [PATCH 22/40] lasips2: introduce lasips2_mouse_port_class_init()
 and lasips2_mouse_port_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aVcZ0zvlNY5C

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new lasips2_mouse_port_class_init() function which uses a new
> lasips2_mouse_port_realize() function to initialise the PS2 mouse device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
