Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4133916wrp;
        Tue, 24 Sep 2019 09:46:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybr1pJTXjqTiSFTCVcaTAvAG2xxVep/+ouWJD/xwJo7CwlNhqIIsIHfNaI8IeIqOy9xdqf
X-Received: by 2002:a1c:a8cb:: with SMTP id r194mr1081369wme.156.1569343564150;
        Tue, 24 Sep 2019 09:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569343564; cv=none;
        d=google.com; s=arc-20160816;
        b=qKvu+QuxBlIqM0H4zHpIntE+XISebvT2+RDlgNTohxRs+YphJhhiZ12IUzrwMWcQO3
         +n++wgKqBpORxkNaIKCYVRvz7qE2NuojX3LhMHeZDqi5eWfz1bqBfMQD87+RZoMIt6yy
         VwGarzL+WUyXLA+FJ71La/YTwZYnqsy4ovOIcxzOGCeRN10X7roy9p6SSi2TAcI6MyNH
         12AiXjotTRUTjcGESuJcS0NyKiAL0fn4eNhox6CmIEpoJ2G1Quq5oauTSOX3TZwO78tI
         5wERIPIDJiRB7+hT3ZMxdSqg7R8GO4E6C7BErvcZlTzK3T5O3jLsjYdV8rn5W+elkbwD
         ZXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=aTtS8qV3trO8mRsFgFOU8pjFuPXPct5Lf5U7HXg9JUw=;
        b=XggULpQqmoky5OVoBQqDbeLAa3xs75bl83fOEcZaUq7f5ieluu9bcSXQpqzio9TgLN
         wx4MgZfQTQo1v4oNpWJ8s1pZTZuWwulzlqdW23Uh3hDzjVoKK1TxEW2Git5dP6yFBgs+
         mH3nzU60Rer0jcjFd7NnDPYkGggtSlFJ/sBoPtGQOAeZBfJvzHOOmlpUfyTMAE7kE/ok
         3nVg3bZxYjzsZZm7V4BoczBFfI7X7Ou3Y3MKpWPOoNW6TZPzjTbzy3mCf6XT+sBWiZ+2
         KT8wucbGdKYEpVkcOtE+rD21Wa/Y09U+CQJO0dJmhtjHHr3iu+EfUCJBKavwvbspidIz
         yHdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O5sqC7HR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si1486990edb.133.2019.09.24.09.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 09:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O5sqC7HR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCnww-0007kO-8D
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 12:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iCni7-0002gk-LL
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 12:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iCni6-0006x4-K9
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 12:30:43 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iCni6-0006wT-Ep
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 12:30:42 -0400
Received: by mail-pf1-x441.google.com with SMTP id q7so1677565pfh.8
 for <qemu-arm@nongnu.org>; Tue, 24 Sep 2019 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aTtS8qV3trO8mRsFgFOU8pjFuPXPct5Lf5U7HXg9JUw=;
 b=O5sqC7HR6qWUWjDZm4SPh+Cu5tI4JzsilgxFSkJynPQ9DNhAmtzLQeWvMTHPOpG2te
 2OPZ6lPNfZYrudeqzIHrN65rqyJbtGw3VlXclbPb+9TxSS42Og6F9R9Ip4GK0RRLLobr
 6UuInSTvjPz+bFtGkXqciyyi+/VRa2g/ftM2g2uwVFEcKdrOFZGiyzYLJkKHHAqIoIhq
 eclkxPZstluYEdmIr8PLX/Bbe9wlpApxmeOYV/F6BRenALFPIbCoSyejegZMl0zSwZ9s
 TE3NucEMGWDM9T3Gs2nV6xobuAC0Sr2wspsGwTcPuoAF4HOhJk2Cwn66m3iN3mf2tLyH
 lnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aTtS8qV3trO8mRsFgFOU8pjFuPXPct5Lf5U7HXg9JUw=;
 b=OXPOIlI/2dUhxl1NRxndtpF3jAGDPp2dTuScgAmJpVbn3swtmB1FLvKeDix0PDEhm6
 +44RA7ig9NSc272Zne373U1nCsedmEleyVHf4donV3/rzT/S/wUCZx0+sgaBS+oGjR0g
 o2MijFg6c16oaDiULg2AhGNTZdlnLyDG8QF3g7dQ+uA0hAH2S2WIXM/XwVfO27Kyaew0
 VKNx1Ca+h/qKM5OhxAgsvDCYB9Kg5nE9eRB6UHocsNPuSNasq9LUKnpZUxfVDTtBSWEx
 JYmi+MFVfaEJaBmEVUlZMFePFlRHOL+z+IUE+gzvPi6e371eXc+z8ML3XBOHbNuYvgqb
 CxRg==
X-Gm-Message-State: APjAAAUe/z0zbmNHU883FGmMSakHhShXADfve2SLWinXsoMvfYimbf9j
 vh4GkJ5eSIkVuMtpNG2B4B6HQQ==
X-Received: by 2002:aa7:980c:: with SMTP id e12mr4194696pfl.79.1569342641546; 
 Tue, 24 Sep 2019 09:30:41 -0700 (PDT)
Received: from [172.20.32.216] ([12.206.46.59])
 by smtp.gmail.com with ESMTPSA id p88sm493715pjp.22.2019.09.24.09.30.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 09:30:40 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 3/4] migration: ram: Switch to ram block
 writeback
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-4-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <999eee11-71f3-bd5d-e9fa-85d1fc7179da@linaro.org>
Date: Tue, 24 Sep 2019 09:30:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910095610.4546-4-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dnt/7Ck+/NAN

On 9/10/19 2:56 AM, Beata Michalska wrote:
> Switch to ram block writeback for pmem migration.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  migration/ram.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
