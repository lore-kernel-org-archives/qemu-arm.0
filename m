Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp333893wrg;
        Fri, 7 Jun 2019 08:42:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxd61y/YKbdYTVMtzhrPz2qbe5qcqW1QS1wnbZNFrWEcEfz6fRs3AAx2EFqPDpJ/GdbhK+X
X-Received: by 2002:a37:4fca:: with SMTP id d193mr44713593qkb.298.1559922121803;
        Fri, 07 Jun 2019 08:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559922121; cv=none;
        d=google.com; s=arc-20160816;
        b=NtX5jwizlwRE+aPur6VdgH4zAJ0mQo5LIlBBvFSMdFqIE5x+ISONCNGYnRv8kzqtkG
         3M+Dsu9Eck5MW2MX1DD0Tu0EjayvZCRYL10RaAnmJpYoxcP6pfC4EWAhPLwhVwFUEAk1
         cuiNrFNvtS0sKEL6yqcByh+71odzFry03z2FN6kujq+/UdWA9f4BVxwVsRhdaIuKcgBl
         IOVseyUjN5HjJLu3LCkZ7JMEOrSoucIfrIjQfBg0BpbhSZdYiQmGzYe9rPZjq/eOLnxu
         BzF8aqbIoRkOlAapen0+jopnZ/c+C6YMwf4aMcafHfLLwUTvM2vTd8PsxXtYtaRkibDw
         satQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=4IGbLR/xOUnc0zxyrAdrCGsxVZ0sCSsFrqqw4DMRkJE=;
        b=juF1rlvQ3fCWuNX+X2WnC2tA6COlPICD4rBx8JAsogE0YR6vyZHfTxHE4aAQl+C3gX
         dbjnTAM7jO9g5h1yJTWll3CezqLsCKQxa3t3gsvrHNBrAnrJ58asV8fub58Te3cS28Op
         F40ap6GOoG7Ejg+5ub+Mq5+8lVEN/54k+G8v852Sqv1JHB0Qz15XbKikE7gTtdbZfSqx
         S55iCmeIPN6IGJ6iMxzHbm1lvl61Vkf3lB55l+TGowGfltC60J3nWbDtagQMkwrJ4Uh2
         sXGR6O4BeuQTQY2EUbP1zcJnc7dRPz/wrvQMjFMqqkMGS4memq1aYHEs7SrlaMfQjoUR
         cgpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M34QohYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si1334023qvu.178.2019.06.07.08.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 08:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M34QohYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZH0B-0003r5-L5
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 11:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGCR-0002YB-Iz
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGCO-0001fD-IG
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:50:35 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGCB-0001Eg-8W
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:50:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id x24so2075244otp.7
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4IGbLR/xOUnc0zxyrAdrCGsxVZ0sCSsFrqqw4DMRkJE=;
 b=M34QohYJK2Ue7WSjt/fT2wlTHFPZMsaGKcXLr2ITNlTNG8iy5dCanRvTbkqvhqA/wR
 Un2S3E8urmgCIUR0WvH4qC6n09waipqnLn5deZ9e7FWRNeKvxKWNyVkevTooco7f8UdU
 cClt6eyouGcHYLYO8oYsKfl6j//dXbVbAM4GpF5nIKci+eZENK5QIUxVEUp+3bii+IOX
 1ekm7/w+SmhKpQP4QjpyNVOcfxXTG4X1ZSxncGneq66JBc049+TIE8X9eMAgrjdWWumz
 IAngyNFvz6ydpB5aBrCqKE20kSOAqJhsQ8dWRzK6hGfDaFt6V9KfkzxDfsNCi4dA57YT
 LGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4IGbLR/xOUnc0zxyrAdrCGsxVZ0sCSsFrqqw4DMRkJE=;
 b=InyNSKxlk3cxUSHfVH1m7ctQAIAhYwKeXvX7PC0H/QBSYKow5OJzHoy48xz1/+SOem
 y2KeSB/cZWza+0ghLE0LMMkQ13f2P8APqRsu7BSalEKBPhpL3UkXA2ZBYMfpEDqWmyNA
 RnoZjqLq5c4r/PN9vhIbIZjFRleOIU+CNQT/lxsxzm3beuolcsVeivm67/50/rELwfl+
 U6052Vxk2B5KFbl9dBl1B0qKVM1PGBG/b8aPcgGK8mUbBRI1cD/MC/ipqcSBrbR7mK/d
 fOwBOk5vNd28PuUWM944q2MfmCTkZVwA3MNXZx7mL4DCaGfoRFQyWvlzGCDu7WOoglsy
 sk9g==
X-Gm-Message-State: APjAAAVb4ehIRNDRZFKOouuPduW27GPhq63DsJSZTD3ce+eHk8+oeY3J
 bv54Zjf4dGs4yS9C+xwhVpKI6RnbKOXHZg==
X-Received: by 2002:a9d:4d0c:: with SMTP id n12mr18754741otf.305.1559919016976; 
 Fri, 07 Jun 2019 07:50:16 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id n11sm813433ota.80.2019.06.07.07.50.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:50:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6540d63c-a6ee-5a35-f682-bd9287a96a8f@linaro.org>
Date: Fri, 7 Jun 2019 09:50:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 04/42] target/arm: Fix Cortex-R5F MVFR values
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3jbqPDCx0HFv

On 6/6/19 12:45 PM, Peter Maydell wrote:
> The Cortex-R5F initfn was not correctly setting up the MVFR
> ID register values. Fill these in, since some subsequent patches
> will use ID register checks rather than CPU feature bit checks.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

