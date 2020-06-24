Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp576438lfm;
        Wed, 24 Jun 2020 10:07:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzszLEwmUodvsHxpItNf9zC5MmUGu7kmGI8TTtvywqAh5o41l9eDvRVhToVge+OOr6DFIou
X-Received: by 2002:a25:ce06:: with SMTP id x6mr45082359ybe.319.1593018469352;
        Wed, 24 Jun 2020 10:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593018469; cv=none;
        d=google.com; s=arc-20160816;
        b=x6YUM6IhFfv1i36YsKqZlJtkMN14GLaiZ5wUWK+Bx2l+oXK1yd6XUsRF1DakUUzw+i
         Ie5aSoG247UYujq//EINNIW3FWT2cEIC61xPazftv1vU7+JZ4hmvK3VbtvTqlbhXvf99
         jvLwwAfQUhuoMtDCBv1sCJHIGaMT3sYjcIF2ihqH+NJIzijZfG0dRH74d1OYiUlo+G7e
         T2xZUxOIbW2BQ8PZXEzbdQQ+qSXN8TTzwG7krf7yBtKXckvC9L0xLydgSG8wXPMiGz7s
         l6FXFK1CuA8EKq8JnH6luwW0w9S+HMT6g5C5eujtsnv1zv3op5cXNt6ch7VTXL9r5SbB
         kTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=a6S4bFuq2ksSYnhHtpwRXYgyoZWUl1SmVKgAtXplKrg=;
        b=WTaDCa4vtye9/ccCEoLwU0qpBDYaOorN1IEUvYaPPG1y3xCPFVjB+zeKjNlD11fbPR
         Z0AlEePVrFHh4NM9Nvd/e/pCkvgiYFfh66NppRkkhBdeizviw25ypm1SkphGsSM/vfAL
         hq02aBeVp1LrP1krsFleGnqJLhc08ZgXEckxh74dwl7ypU2Mdgn/ds0TpinyZBKBWvgD
         6w9Ykjl4yhQeuf7ilaebMWoCSvKHoTTLcMKF1tVUJFhMO6MsRSdZKkOdW5NOVyz2ZZJi
         BFf+qcrJfHRHR3Pt25ShV2hJHZcIzQqQsdxRwHqDn60G6vqvZK1eBRF9kmhqc6a8j2y6
         DLBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e129si20961609ybf.359.2020.06.24.10.07.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 10:07:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo8sG-000223-L5
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 13:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jo8fc-0005N7-60; Wed, 24 Jun 2020 12:54:44 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jo8fa-0001aW-F9; Wed, 24 Jun 2020 12:54:43 -0400
Received: by mail-ed1-f68.google.com with SMTP id g1so2015486edv.6;
 Wed, 24 Jun 2020 09:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a6S4bFuq2ksSYnhHtpwRXYgyoZWUl1SmVKgAtXplKrg=;
 b=fItONiZaafpOPdAlp3tJzUto5PiC1AIn0jW8KE+Wc2DIkxRiARWFWTGmSmP754fWKn
 /buvRB6lNHaikKwn4FPEHXnli/wHVuVGphSw9XzxsbaUx0Xh1/iJBisvWsfKMamFYcfb
 lrHCJnmSnMIy1WxChWv+yDPUaxF3JxY9J3JXpbf/u9rSOKL1fREdtWNaRZAAwGmXYEWd
 gChsO4DAXjUSILrpfCKLMiJtrbEgTQWPC2ajCdDfkJiorbFRN/7+ApBSaS4LmtbkKmWL
 lII4/kfaVixsdur/gYI/kZDYEmxfx4/UhAx64gLr7K8CUhNytDCWEbIuSEZNAYDhjCOQ
 TG1w==
X-Gm-Message-State: AOAM532ZSvYZY8bVm5d8LVo5GMPq3chj2q4GJMde7U70rHA1/b3NkjQw
 xLBmTjmg6qv3qzAwuqruVNbmSnga0WjzVAvUjnw=
X-Received: by 2002:a50:fa8d:: with SMTP id w13mr28138716edr.324.1593017680589; 
 Wed, 24 Jun 2020 09:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-7-f4bug@amsat.org>
 <38918d0a-272f-c05c-6a03-c6ddd8cc592e@kaod.org>
 <a046bcd2-1937-d971-8a1c-23fae0dfc9b1@amsat.org>
In-Reply-To: <a046bcd2-1937-d971-8a1c-23fae0dfc9b1@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 24 Jun 2020 18:54:29 +0200
Message-ID: <CAAdtpL4vFQaD_7uUvVAOy34ySXrZCQWnALM9=FOfVZo3750ufg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] hw/arm/aspeed: Describe each PCA9552 device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.68;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-f68.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 12:54:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=1,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IkiTARn3d4OP

Hi C=C3=A9dric,

On Mon, Jun 22, 2020 at 10:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 6/22/20 8:49 AM, C=C3=A9dric Le Goater wrote:
> > On 6/21/20 12:58 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> We have 2 distinct PCA9552 devices. Set their description
> >> to distinguish them when looking at the trace events.
> >
> > It's nice and usefull but couldn't we do the same with a QOM object nam=
e ?
>
> qdev inherits QOM and overloads it with the qdev_ API.
> Since we have a qdev object, isn't it better to use the qdev_ API?
>
> I'd keep the QOM API for bare QOM objects.(I find confusing to use
> different APIs).

FYI you can get an idea of the QOM -> qdev -> sysbus -> ... tree here:
https://observablehq.com/@philmd/qemu-aarch64-softmmu-qom-tree
