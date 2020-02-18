Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6279068lfp;
        Tue, 18 Feb 2020 08:10:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEONM4iNZf5lenLAemErvZ8T3moXvW/6wxEkPVQlVJBVa5PbZHjXOhTYwg/TEobvLb6oQW
X-Received: by 2002:ac8:65ce:: with SMTP id t14mr17890821qto.72.1582042222518;
        Tue, 18 Feb 2020 08:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582042222; cv=none;
        d=google.com; s=arc-20160816;
        b=j5b/Jx0bfLoTVqp8sMYUeAhOEqg87M0BQ95oCkv9GJu08xlBhTLVPfRmhn+xiGbO+j
         KrA63SfllYmf4K4luadSoEb5ub7e4Tig3QQz+6Sfj+QU5jSdUTCqHLwXzLfNf4doMMIe
         H6LZYstk84LLWFx50YYjyxNDMynCy3fZ4abtaOPywOm8fmvc2nGzgerG9KXMSc+yoXNj
         LFcXTaG4BjGRg3n74ISHDiQQqBzYFTkSwZNnOnfyGB26S2OIb38EPcJF0e77mWt61MsI
         pptfzqj7zkihKqPuaEhu/4n6JQYh2UMgesIxU1HILGamhmuQTLMMWiTJtW0NiSWN7RBZ
         Cecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=t7p2AL800g0tA9mPCX0eHjCpMAO5vYg4IbIyHr0cdy0=;
        b=DDbpYnt4t6u3xMEwW3gi9DgkN1yCVAB5Bdfujufqr9VlMdOG/pkAwNDEn3LvFxruLQ
         Z5klNNK1pzq4beKI2SKso9dBPuPhp3n6ctDv+4vi93BNeN48nDC/GJeqbnO3qZswa71L
         FiX6lIlXOiFmQnoQkhf8n7SZm3TsHRjquuINPmf4p4RgwgephEagoWHj04U8mu1zhiHa
         TjEqSvi+QVsR4S7ap5pm+zHcoWP7heVzx73QbOXNyKcgIfQYSoayj2JdbuGXzvL8qzU5
         2764sLMixvm03/dZihQG4nKXvRnOF4OtmKWzc+7C844fFlRnI8LzsYbFCIRk8yWGp+OE
         kpQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ByPbfQUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si1893040qtn.202.2020.02.18.08.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 08:10:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ByPbfQUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j45S1-0004q4-TM
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 11:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Rt-0004n9-8J
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:10:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Rs-0000xl-69
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:10:13 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j45Rs-0000xN-0h
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:10:12 -0500
Received: by mail-ot1-x342.google.com with SMTP id p8so19968088oth.10
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 08:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t7p2AL800g0tA9mPCX0eHjCpMAO5vYg4IbIyHr0cdy0=;
 b=ByPbfQUP3lgO5vT8Jz9QW6W91b91T9clri4jKv0neji9tEQ9X38q4vIaxNdbLRJ0lU
 /rofGgLJmBkL5eYRVIM3TyQqJnMnxhbtTrlLrEa++k+WOqevRczOsiacXkxueHUXqz+Y
 3LuGHuilad5X2kohuWbYf0sEP6abTgv07FAZl24zvkuEeKyC8buvA6XTXNDAwDPULrqn
 IJsRVGnqB6VFHhihEhCJh5nBvdzSZueVJ5CDilvpCDRl4srLXR21YRObu24XnXqZLwYO
 VdwvbuRLegk+esdf+mzTHuc4KDmfA8d+xOCfCINBYwA/HgVD3XoA1MeiVJ2K/aqHR6tH
 xfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t7p2AL800g0tA9mPCX0eHjCpMAO5vYg4IbIyHr0cdy0=;
 b=gIf9NThbytnjETHuLTc9vZtQ2vFKwELvPYBdDlZ/wNK1RE+9UmNyupTs6GPz5tHjWF
 rsz/2BBafTvWC1zr8xzV0MsZ8OA83mvSnIIX7mkMhT6mBDWqGlQgBTUkaQnqQt+QxQK/
 RGKNFIaq8mMlBpM08UocJIhCPSpZgxvZxO+kEpU/nyzyRB7tF/tetoutagu3LQecjIgv
 CaKnrwacu1U9R5mB/jpK7CjOImcbolLEQeMWHYIx5wvsG+svqVpSnhD3UXqr/arq1b1f
 R/XmmGRGpvjeUFaQNrpzwD25N0YwR22r7Rms2mpl0DVZMA69nBCPiRCsQg6bJKmPgaO1
 KdtQ==
X-Gm-Message-State: APjAAAWYkCZcI6CoJ4kUEpWWN/fpESjE1z4/BlDI4TDhjmwMyvHVfSVz
 VhmvPb6LaBGx9lJY2Rs2SGQoT2xxbg0a7ZTGwvaIow==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr15564957otq.221.1582042210952; 
 Tue, 18 Feb 2020 08:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20200217132922.24607-1-f4bug@amsat.org>
In-Reply-To: <20200217132922.24607-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 16:09:59 +0000
Message-ID: <CAFEAcA9OtE-S5HX1_HB3+Y1Sf6idFDipsCp_oz4y-G10xXBzgQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt
 Clear' register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aHdHQ6hRTAE+

On Mon, 17 Feb 2020 at 13:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Fix warning reported by Clang static code analyzer:
>
>     CC      hw/misc/iotkit-secctl.o
>   hw/misc/iotkit-secctl.c:343:9: warning: Value stored to 'value' is neve=
r read
>           value &=3D 0x00f000f3;
>           ^        ~~~~~~~~~~
>
> Fixes: b3717c23e1c
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: AND the register... (pm215)
> v2: Corrected bitwise-not precedence (pm215)
> ---
>  hw/misc/iotkit-secctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
