Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1388476lfc;
        Mon, 9 Mar 2020 10:29:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsOt8PuG4Tttgy0CZHLBVFQjnAz2eVW66csjiZ3xYTWqLiEOV7PhFdY+dSiU4Lilru4r+xA
X-Received: by 2002:a37:a4d6:: with SMTP id n205mr5898672qke.352.1583774962397;
        Mon, 09 Mar 2020 10:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583774962; cv=none;
        d=google.com; s=arc-20160816;
        b=pZKMRf3VIAz8zCVYMsc/NBDr9yNCX0oMZ3WCRM8/J4X58FNjQCqSNuaG0pXGCAviyL
         FjzvR2mEfj86kE+JTX9I91MN6Th/Bk3L0lS6V8FHjLpLIjdPyk7KSSipW2xElWBfb1cz
         xeU0HSzN8m3RVVtt8Kw4FPHSlZPVemR9CzXdVCxCYGa16WPEVYK1gk9Zhs1EsR1Futh0
         /iw56mwwZ+++cQQMfZvm+82iNRaSzenBxeFgnbblABrK2hL4MIo5et61Xa78zM0+UxV4
         oF62wNfE32o6aPWuZpy7NrWHV6VEAxZOXvNVMbbC23hDvPdphBTBWSxZ/JaemzIkzqoS
         8Ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uqVOgb+lTyAQcvV6Wk8ZxybR1Uio73gyBjTghuQNQw=;
        b=BfczqhKiyFdY9S7VQ8SYv7nIZh2JE53naa7jIJJA13M+R6EgqPTi5Kg7UDiS83PcwC
         yG7C+TvT/m+tgUAOSfwulRJsPSWgpOBLfesb0Ldx6d0SjHiQMLtEzzGwXLZYTBb+2wLJ
         NFjhgdILi4PiU4nqCYSE9iRy42kA9dzzpHtGP2djmYKFt2xmGCM1a9jyjNmbweg/rKha
         namoYJSgLwPXFSF3NUL1XxKQugrGI5nprkKbZKIetqB4vJAgl+d/N+d4uYvdEs/qkfOP
         3QEU1EPVt+7j/VBxx9BhUoqtSQLxI5DLFLvC+MaVZ2LOhYDuEFZizcUSuQjCMYEhqaEZ
         O3+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bzM+qNxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si2144402qkc.297.2020.03.09.10.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 10:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bzM+qNxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBMDR-0000VG-Os
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 13:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBMDK-0000T4-Pn
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBMDJ-0003Pj-RT
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:29:14 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBMDJ-0003PP-MI
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 13:29:13 -0400
Received: by mail-oi1-x243.google.com with SMTP id w13so496284oih.4
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uqVOgb+lTyAQcvV6Wk8ZxybR1Uio73gyBjTghuQNQw=;
 b=bzM+qNxzEWFhrLBdl4gC+pkx6QA/aKV/P3XZtF7fw04d/PoQWa2SmcNX0k40+i+iaZ
 QDKv74fA/NCrezMjSNp3QIoSZKmxkcNmx4f8+MqkvyO7r9FDXBpEhHZWylQJ5Tu6PZFt
 IkUCaJbg5c6VuSa8BaG9kUKiYUOB2+SlMPErfgZ8IJ052mymvAcNsxjcW4YtlyaniX6v
 Vw7P8x3/A2jvhs5PdXLJisLpnnsUyG8rAXVODVE1bx+wxis5QwSQ1G8e13efDh+8zknA
 Bjd0GRvh7JfkTutfxXX91YX5inzM1nx6apRt2PG+KSbGEdTTFu0JVceqjxpRCm81/YrR
 S8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uqVOgb+lTyAQcvV6Wk8ZxybR1Uio73gyBjTghuQNQw=;
 b=ZODe8Pc15wjTt0lGrahxPPuekN/MDKNYnQFqOBsw+WhqOLEXTGsL23fc6uS2CG+cLq
 yx9cl4L/zAjNsH60/9ogNzJde8Wt3ol4hsGSLiKkkipz5zLYKrBWRdXDYb9M8DTZcy1X
 bQgiSfKi7YZZO/jRFamY8ylDKeukODM6LHZPZ5H5R08aDGVHCDC3ooljror8GQ1uDGty
 HwXhAvawo4AQgOnyT7NPTInTI8osKVWKiO46PMNtA5QD5XSyI2sVfpQwiX2q/Cl6XgBO
 Q5TdwIY5KJteqMqMDh4UZ+dxSQCU24yvwl94eHPG8AFPbjXV9c1k5JPPUjcr8ID0bp+U
 II9A==
X-Gm-Message-State: ANhLgQ3Ki4Diw0MFHflt7qBR4u6Oy9TljKGJQWZI0w5hAHIBlnHrr/6D
 mNaOuV1maYU2ZxkLHWB26+DpPDVdSV/xN67Pk3m1Yg==
X-Received: by 2002:aca:c695:: with SMTP id w143mr136793oif.98.1583774952905; 
 Mon, 09 Mar 2020 10:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200301170443.12904-1-linux@roeck-us.net>
 <CAFEAcA_VuY+1egn8B6=Tk8PKGuhAPuP4-=pwuWHQGQsfdXB=dw@mail.gmail.com>
 <20200309172724.GA25106@roeck-us.net>
In-Reply-To: <20200309172724.GA25106@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 17:29:01 +0000
Message-ID: <CAFEAcA95xW4vZtVwBySAp9GZKxpcCf9AAkC-GtkJ4OrNVAVXfA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Wire up USB controllers on fsl-imx6 and fsl-imx6ul
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oCk2jK38ME8

On Mon, 9 Mar 2020 at 17:27, Guenter Roeck <linux@roeck-us.net> wrote:
> Sure, no problem; I don't really have a preference. What would be
> the best place for such a dummy phy ?

hw/usb, I guess. hw/usb/imx-usb-phy.c ?

thanks
-- PMM
