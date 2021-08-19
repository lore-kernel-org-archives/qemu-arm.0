Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp316959lfg;
        Thu, 19 Aug 2021 06:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyeV+fSfzINVOoF8IEMwz4KQPSOhgK+2LqluDQW33/QH3HJkGSyM8VblzO/zzV7lSET/Bx
X-Received: by 2002:a5d:470f:: with SMTP id y15mr3894264wrq.292.1629378962782;
        Thu, 19 Aug 2021 06:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629378962; cv=none;
        d=google.com; s=arc-20160816;
        b=BI+UeDbaBHV7I+LamM3nHehMlU2rmHFhWkE7KKnauv58rYFqFAPWmNuy3we0++YYxD
         VsBLqs4pLu6aHt1hNMje0aWZcq/u6w01AbYpgsSpFOQVePEyygRQ8BFOhQ5bFm0s5g91
         uLn22HPA9NgMX72K9jJTJi+S+v81U4oHpreT651LcOh4oHBUgwvYNrU3AixWYdtBHZoj
         v6nNmc1p8panaJM2dKH9eUfTVE6qxlhbWoUk1HGdYqZWe05v67TKPCs42yvpVHR6R6cd
         0Z7rckl2G7zWFiJ+/YJRrkYKsNCrsftewfa246/RmkF51MuRKF0eSvIj6GldNMp1gXLR
         ZvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bhFPMyl4/KhH1v5/AK9mR1o+Yq4S/nsOL12jd7z/lAU=;
        b=ung0D+IZK7gd1/m9+In/tXkGHnLtwtE2AQaJijMSbJ73HhJqh/LMNODLoJs8qorVNZ
         hFIld+k1fQ/z5saR6UmQEGTEh10yKvJ1whoIMeSVt3cbhML3qZSSmUF39enIYzJvriFb
         mp4QtoNHWD4kq5dq54R7ZDvYgBoCd37ShVjnI9PAqwONoVTkpU1Vi6hyLs+svrlPZP8h
         aPqJqLO9FqCQji1xjKTXeUVp1ncUsylU4gCbeRfuxvLpSuIbvE68AES8jCYSqCqahBKx
         Sj9EZL/TBn5sddFpiEcpmkT9gy9yPtCC/LWOXW6A3SQg/dWWvjJi8BORdE2th542kjgH
         TMhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HO/qwdz1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si3986818wri.108.2021.08.19.06.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HO/qwdz1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGhtp-00006o-MI
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhtc-0008Vd-IP
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:15:50 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhtX-0000uh-Dn
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:15:48 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bt14so12893072ejb.3
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhFPMyl4/KhH1v5/AK9mR1o+Yq4S/nsOL12jd7z/lAU=;
 b=HO/qwdz11UDCBO4KiIKhZuaVbOiv/NbdEfQv6mRrC8N4dhuM/jwVaRw2EcuUhVDM2L
 0dUximsN5Qcel4zDHndp0qTQelmv1UU+XSAJl8FDjwJh1KLLresByAEM7tOR/iAfawXl
 pXZhgrm+q0jtaIyiRGz1LNuIrLKStRGuh6yjZFbCGdBOGlF4jOQPrgmHuOEQkdMR6J9t
 AYGf3CuPoFpEG1ZfzvUow52vXG9qLvSwC1AxTcmAKxsyZabxjy5oQgTr453mxngjmQJJ
 76BRR0MAA7v5N0YZMwL3CvF3tswhTNSDxf9ESHujfXUvO2+7sTaGWRcvB83DLdAsAPln
 R6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhFPMyl4/KhH1v5/AK9mR1o+Yq4S/nsOL12jd7z/lAU=;
 b=HsdPBhEaI/SZoYOtB1JyrXZ8WLc/X7OTeyYx9psESHo2i+vO8sXkQH1tRutaS68qdb
 X9JseV0j+/HWeEc65BzTgMYJFNPxX+YDOL7t3TsHKRhNIglvYI4X+CnhT1/G88RDF1Mc
 G5IasImrdnQleVMNx5d9xLrInDzZ1kvB5d4f9saqQ9mvXrvGPeG/GuDNgAPGB05d6rOr
 6b7VIM/Kls5R2PsFyKXWlqI0Q9swlLDpzdnuCMuvaXp4PTE0JNrgFKSC4UKZAofP7TPw
 AMrl9ob6avmCJ3MAIjEcSJROsvCZt3sE0+2hVhJMCUIceRXuaUvj+3YZcp69swpNtlI6
 nO/Q==
X-Gm-Message-State: AOAM530bo+pHnrV2SNQTaGBv2zb/3fODZ8y3E4LzFkIuxb899kWb67jD
 RTHtLz0d1iefKVKsXZAtfsfz0KF8i/g05FEXpbMANA==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15614047ejy.407.1629378941856; 
 Thu, 19 Aug 2021 06:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210810175607.538090-1-linux@roeck-us.net>
In-Reply-To: <20210810175607.538090-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:14:55 +0100
Message-ID: <CAFEAcA9awrjL8smkZsSZPJzyf8542Bv1yc=jyWLv6T_MjAA8dQ@mail.gmail.com>
Subject: Re: [PATCH] fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHa6Y2QKBvbI

On Tue, 10 Aug 2021 at 18:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiate SAI1/2/3 as unimplemented devices to avoid Linux kernel crashes
> such as the following.



Applied to target-arm.next for 6.2, thanks.

-- PMM
