Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3296119wrs;
        Sun, 25 Aug 2019 18:11:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXl+oVUh0TYbv+7GkXUWOrYdX2jU/WUzg1VM/U2cEABaJN2TzI473Yqj5xJnABBjMn7v/F
X-Received: by 2002:aa7:dc5a:: with SMTP id g26mr16313068edu.62.1566781871899;
        Sun, 25 Aug 2019 18:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566781871; cv=none;
        d=google.com; s=arc-20160816;
        b=deHqe+E1k/S21pq5FvHBkQxqsh/tBKAu0PvifxkYprm7RGbhYAu38yGP2VuXu8Q71q
         sKh70JeomfTi5/CX/oLVYrChRIrdTgc9Ce5AHa8goxrZoQFScIXRmIEmrtSBcxrbPnMY
         g0kXao2RZcb10r0nTt4BIoMEjPAZZzywk4cdGGGzLW/7t8dIC2o3CgUPfJXhsU/iGK4Y
         SXTPZ85Ue/iBhiqbLDAvfwXhCYz+dQC4zNzh82spRdPM3nIYpJ1gSL/jyhIos35VPpvK
         +MWKvteDcJVP/2zBJIaUSXMLq2P7mmZlORKcYlE3MKEzSitT1Ak/b0nUYpBcgJVOeG7K
         Pq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=YlVxrPSpJtVUI0ukGunV7p/yIvUAp7XhFNmZCnoyr9U=;
        b=PjFtveJrBsb9h7kfEPnOzFX9NBl93rYowkFW8q8kgr8qhBYbOQ2iXmi/bSMRkbj1/S
         KKkp4VrXbUdFGKwhOxlQsKho1Bg2Og6L70kKAZO0C71Iu5SZNrPbYuFV/VyBn2oVFCaG
         1fHtxLikgCPW+j7e5R1Rf93FTJ5tmQWaIyZU/Pb71bVcYdynACTFCTLRvQcOrK5EI30T
         B2SGFGFQpfb+v5Ywe253J1jerjqrQjwP+pjQVf8APFBECOl+XnOkaJI0lC1Lj32a2Khj
         Oo6JX5guVu2bLnATq6F43TGRn88VAAfCywzYUnEaXT/G3spccjubiz8KHpg6u0n4sV5i
         pbiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7P8XFwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oe22si4806749ejb.79.2019.08.25.18.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 18:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7P8XFwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i23XL-0001Zn-12
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 21:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i23XB-0001Zb-Es
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 21:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i23XA-00051Q-ET
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 21:11:01 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i23XA-00050t-7B
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 21:11:00 -0400
Received: by mail-pg1-x544.google.com with SMTP id u17so9484440pgi.6
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 18:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YlVxrPSpJtVUI0ukGunV7p/yIvUAp7XhFNmZCnoyr9U=;
 b=d7P8XFwTZVLINw8ol36XPgsceTQ9fmVIqDVXAd/mwGQAfRvEOB/QtvmWV2YxOwVr9x
 tIp5dcJkxhhmWThL4DiB5vzYaQhvMBxp3WzmIU5FmxbiVYzCmzn4uCwptyP1Rd4nlju5
 UzgJYBO9DZN90dZ2DVmWGL3OlrL5H5gcSv06vBi8TTYcyzuJ11nBkQl22hiruOksFSer
 GXnzG5InmUU6n6tUDuIJO6zt4iaVp4R2xLN3778b5qt5dk/FddLYN4pGFnk2iJISL/Sh
 ZGpmezOcL772WFU9TBGJpgWLSODFO9PXTf64tRV+L0ZhEFOKqguzzXr2Npke9yq7+sBl
 SdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YlVxrPSpJtVUI0ukGunV7p/yIvUAp7XhFNmZCnoyr9U=;
 b=Cw3g6MYBOoNCO05lIGyDe5nu4GHwr36yBOlklOk47Wn/DleoiPlx7J8os3Wp004Hl9
 7iaQYhXskl7IWHz7TgrYHbdLsz1ssUtOql65Z99o/A5Uahcky/KW44gma3bAmj3cXDBz
 CTPl8VI4MGMAh8r8BwzNiNiJ2p0ZGNmx1kDC2961bNpXLjMLtjzIYH7rw/epvmVu0z1z
 II9VScdNrOkjlznD6tVOQp5S9rKeFCSR5lnsSMON/81o4kPZiIf6ZbAUWyJwZcX+MUdA
 uqv1lVLIGRePW7xdaWdFGjIM/GNLquNwPsPlBN41OK3f9G/3EjNZ1yGa+a5X93hyf2Eo
 zJNg==
X-Gm-Message-State: APjAAAVb5Md48nAcb5QjPla2vJxefvdSr8YYZvAqkAtu0xxpk85o+Fp3
 jzSt4MB6c72VE0SLIy2pwyE/mQ==
X-Received: by 2002:a65:6713:: with SMTP id u19mr13211669pgf.403.1566781858576; 
 Sun, 25 Aug 2019 18:10:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v189sm10115477pfv.176.2019.08.25.18.10.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 18:10:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
 <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
 <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
 <CAFEAcA-m76JW2=t8uX6nC8E54TMKLe4nbCGvd8bOKx+wSYRtGg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <516fa14a-2e6c-9496-9318-920ccd164b6a@linaro.org>
Date: Sun, 25 Aug 2019 18:10:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-m76JW2=t8uX6nC8E54TMKLe4nbCGvd8bOKx+wSYRtGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 35/68] target/arm: Convert
 CPS (privileged)
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
X-TUID: K9Kcft7bqiVC

On 8/25/19 1:43 PM, Peter Maydell wrote:
> I'm still confused, I think. The hint space is
> +  NOP            1111 0011 1010 1111 1000 0000 ---- ----
> (plus the more specific hint insns before that pattern with
> fixed values in the [7:0] bits).
> CPS falls into that space; but you've placed it with
> SMC and HVC which don't fall into the hint space, because
> they have 0111 in bits [27:24], not 0011.

Oops.  I see what you mean.


r~
