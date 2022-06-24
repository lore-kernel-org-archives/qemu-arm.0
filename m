Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp399716lft;
        Fri, 24 Jun 2022 08:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzSwI/TyAfQbXjVN0hKqCeHtKS/GoVNfpVHpVU7VzftKIp6pLn1CIE64nb1vUys3PIIEdk
X-Received: by 2002:ae9:ec19:0:b0:6ae:e43b:80ff with SMTP id h25-20020ae9ec19000000b006aee43b80ffmr10411821qkg.324.1656083886394;
        Fri, 24 Jun 2022 08:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083886; cv=none;
        d=google.com; s=arc-20160816;
        b=WqTftCgmGZtMf+mE9CnQReuWUXezKA8glwf77xEcyF6CtgSakqjP43s8o10ZmVKVNJ
         9xMWIgZ710VXJh4poliTCxaMSIN7ruLWdOspmpzpiu1rjOZ2XJ2ORHx799rm/iw0PZ6h
         ST2fljhxNnUrTZGikCy1F+N8l/pB9O2nyJStKkmzBgyLt2S7GYh8scQJ7tuIhxKV+vrQ
         U3v0VdNd8X7qzIHfWE+txJy1bF0JhFIUIo4DVoecabmUIImqDu9kDxTz7PtS5T8FbFrU
         fpJWoqr2soP7d1ICBvOVSFcdTACM4boPCwqEHW5dyzliXon+H6CqjjReDLtm4lBRQmQ+
         Qu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c7yUWMo0qXMJVFx98C8iv0Mp5JhFV+I9j3UEcKND8K0=;
        b=sw90exMD5R7BR1vHXyHChhPwi94gucIxi/qy1gMj866S5McO+EmYSsy0jcHrnMuUG0
         Li5kpZvZC0z4T1pEk2KIBg3lB/wJJOxSOA+m9LrFn7loxdsfBrCPLGSJ2XHd13aAKk5q
         hZXNi5ubTDV1kDBe53PJ6bTDUpdH6cu7LQ1uUM+bvnr8BN6Lt+PmfoJz5c+845ynk46Q
         2USLG2HoQoI80E2K+NStLeiHcAwWhtv22lsjQ7F7vRkX6WDHa/tJMm9elsZLMhYPl/p2
         Jod8rAHBU+FYixivoaYxaGt1uLTTMS9y3wRl79Pt4q32sC+s1N8+rwbc+iSYkTH1Oin6
         nk0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=doLuzt3O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a025400b00304f1f952bdsi1821204qtx.531.2022.06.24.08.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=doLuzt3O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4l4P-00074W-Rr
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kxJ-0004HG-Qt
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:10:45 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:37412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kxH-0003jJ-S5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:10:45 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31772f8495fso27768187b3.4
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7yUWMo0qXMJVFx98C8iv0Mp5JhFV+I9j3UEcKND8K0=;
 b=doLuzt3Oo7JykcCZ4Lww/cUv70+uCqUgJJK09ph5Kmvbx4nz4oOUVi/qcPydaX0C/o
 ZlP2sDwjLFWBrfmAq9X7Kbb3iwsQV1vTjbADJtfoC5UWJkzvPmmC/L4wTEaC4DO4Rp7h
 fFlJRti14gLVd0Nh20z99twxO87CkX2psA9C5bfmhaIhe2o0CiXoyrqPtkyXf8HhBL9m
 KniPrVYUIk1QtympSSA3t5ihnX6iBAu4twSBI2wwvGb3WbH65xpOf8mm40zfvLXEQ0af
 QFDzKE7AChPVv1qRY9fk1i4g8i5EtBfp56LRihpl40CHyQ0bItSv20gBlFzwg57X0C+X
 w55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7yUWMo0qXMJVFx98C8iv0Mp5JhFV+I9j3UEcKND8K0=;
 b=kNb3XVUWBlGuRpaoJpWhPkDKLKHGac3HCWXP9gRg5g2hJvYdBA3iAZQs4sUgNuNsaU
 m/JxSGeDoQmuw1f0/0Pd48+SEyHEugXt7CEel02tm1vh/KbqXM3eRIHMneut7mblHcMZ
 LMcFSo/DqOwSBxj8LPv2QOJoOsrJB2lo2xsn/c+JOd6aa/K+pWUeVEn1Q5cb1OFUD0pG
 nDQLHQcddPhoj1rqwXc9+aJ2zI7OBR9BYdGr8TSQlHnxJqPrbu/w4R1lLADtbQwNSSnF
 VMgPnXtkpwezcABjRZ6Sq8+fBL9W1eB/eEnzXzUD/+LehGPdTje+zzlk09fDXSZ6vRYB
 f8iQ==
X-Gm-Message-State: AJIora+3Krl8OSStcLnV0ZKWoebf27oSUPoH4O/wY3Zja5GsAWk6ErWh
 zD7s2wA/qmDYO3Kx6w9APRefsXyjpKICyC8ZaAaoyQ==
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr17595345ywf.455.1656083442567; Fri, 24
 Jun 2022 08:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-47-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-47-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:10:04 +0100
Message-ID: <CAFEAcA-VOLo6gwdJ4oejhUB54aPMHOgAiby8KNGN+-uQ0Li7OQ@mail.gmail.com>
Subject: Re: [PATCH v2 46/54] lasips2: use sysbus IRQ for output IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EduuDtW3Ze94

On Fri, 24 Jun 2022 at 14:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables the IRQ to be wired up using sysbus_connect_irq() in
> lasips2_initfn().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
