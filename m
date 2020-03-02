Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2362970lfg;
        Mon, 2 Mar 2020 04:09:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJ6fko4ZEPq69yaGndAEotm/jKYSicl4bxkKaGCTQb2ggJ43OVbCIu+Y3DncvmN8grd0qI
X-Received: by 2002:a37:4808:: with SMTP id v8mr14195859qka.263.1583150947840;
        Mon, 02 Mar 2020 04:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583150947; cv=none;
        d=google.com; s=arc-20160816;
        b=e+H3VHjknAGHXkl5GqA4JXprlVIRVLoR/qBbtXzx1dmy5EWSZ8UARH80VBTWnU7w+W
         nsDFI9ff3swiITFozNnHi9LvBWaxPbMZLjY4sZK3vefYWddoD1K3uqrE8pdApbB3GH6m
         wYvnocUITRuNzrff/Pss9ujF3GIvOGIyBYTMuOC9lEOaNuB3T4bYyRBlfq7xcBx8Cjeq
         WYWZ+ZmiFTQbFOhSV7ZTMizu0/nSShpQ8IpjVmB8SNirXKbogAsfPSPOUyBexoYJDyXA
         qZ9HZKSancxnqurUIQCifdjgISs1t3+SVBl3TlSP3WWXZHPHC5KM5lBP11NBN32MiJAi
         y7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wgFa7yBWDk5Brv+NVClMgEkZR56+nUWQrhcRGazyjU0=;
        b=eYxIUo04iqAokS7kj5hqDPTICAUcPG2rTyW2o7GQakrvlQ+oJfMaJO4zbxUnQyu95M
         kUoGTQMzrpzG4mZ17ipBqFh/74jhlLPUahUr5AJpg3WFS+gH083tWg4ZQzGT3+DNoIR7
         y/5eSb+yPkFU12aqQTsIn+zIR21RnclP7foQYqZbSyjgqBHIx2BbLdUikpcVil2WC27j
         9xDftr3bTdHcjKjUTYCq2znQ9qfrGmuOaSmm7ppWp8LG6dlO6Q+SflJJtBNk0wBcjrth
         +G7Rr4QN7DtGeBWARKC7KG1hIdUCAhNQffGJiDS68/wpg0V0nXjlq/pXYfnAScx96q1x
         gr8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHBIx+l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si5774278qkn.133.2020.03.02.04.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 04:09:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHBIx+l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jsh-0007x6-9M
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 07:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jsV-0007pK-RI
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jsV-0007KL-0d
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:08:55 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43007)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jsU-0007IR-Rg
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:08:54 -0500
Received: by mail-oi1-x244.google.com with SMTP id l12so9997912oil.9
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 04:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wgFa7yBWDk5Brv+NVClMgEkZR56+nUWQrhcRGazyjU0=;
 b=HHBIx+l3pvHmKyE2yY/wLMDDwYCVK4nCjmLqNhfMQFpVtIrsLOyEpinYpzN/f1rWQF
 F+PnjUJy0dvy1XfrpQn2sJWZ3+lgmBms3YjstangqrbKT1ctR4VURcMnPhTL0yOWI2/J
 yW1cHR7TTKtBkUxkp8ar9LyxAXDT9EMsTGiH0RQgdumhS2EqZQIvQNN5TIewifE2/ueE
 mZOEccgvcmIHB5sV+te3haqvyOLZ9ZRjKW7M6GuFLF2dPq3WPYOBNickxQGMkPg5m93M
 e3rj9LDsZyIhIfH0JbCrj2QCKgm103AKB4vK1FTU83fMFtHCCY3ahJliZtIsspJlekTF
 4yLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wgFa7yBWDk5Brv+NVClMgEkZR56+nUWQrhcRGazyjU0=;
 b=ccaOl+Fqch8nvJ8eNzpIN8nYqPfkDz9snBJkybY0paWOq/hwx4jmi8+UC4VDHNMQQ2
 k2SiJc4Gg/JaI4KKQalzOQuisJdu8LCciSY1ZpkjnpWy7VaoXA+AiPMUr+gmVuo9vmrU
 m8Rm7hLlTWZy8lGxheOrJuppFqd/6mBfa2E/G2Qske736fi4Ega49/6FWfhLqphqZM62
 Nrt1fmaDDys5oh1CvccwM+Ee5b62EaoiJjeuiUs78aU94cxeXXR3ByaDLD2ZIyI+XkiQ
 z+opKloThkLftKXMu1hGcPCy2fToQkiRpAB1NtVWhjxv/uW2F7/aAtGIQdrzr5Wg12O+
 C8KQ==
X-Gm-Message-State: APjAAAVcSqP9CNoRX1+WBfsLTfRhO6NEGlrVPV91YjnXPhiZPIaGYBy2
 AE08HwG+Oo8zuUTa7cLEHsj3kjlIl+6vxNbNJTBVYQ==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr10892037oic.48.1583150934004; 
 Mon, 02 Mar 2020 04:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
 <20200225031414.15649-3-richard.henderson@linaro.org>
In-Reply-To: <20200225031414.15649-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 12:08:43 +0000
Message-ID: <CAFEAcA_NhOBjdiQH7MCkZDDRa8Uy2xUJdO2-OPHEayo9TUA0zA@mail.gmail.com>
Subject: Re: [PATCH 4/8] target/arm: Move helper_dc_zva to helper-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: dWVhYog6NaBb

On Tue, 25 Feb 2020 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is an aarch64-only function.  Move it out of the shared file.
> This patch is code movement only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
