Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp614713lfq;
        Thu, 7 Jan 2021 13:09:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJN4hXUmv00culv/Oe4iTUnq8NZgr0wdk4r3RGLa57dSMV66gzwSlodZAwAqSHHWYMvGqc
X-Received: by 2002:a25:ca85:: with SMTP id a127mr1016629ybg.432.1610053742570;
        Thu, 07 Jan 2021 13:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610053742; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6/EeuUbrdmgi+cB90b04CTGJNbh9w0t6gV8aoggngJPuJMzAMHac/iLGyzkgwhy+a
         1or16yUmH/f3X6kT+Rr/PPcrkxqH/GmMMRmQf9FEOVUnvOjlds5si3WTHGdTAollGz5p
         NSAQbdEYS3dbIsgURnCifPpmO576WSLcZoer2POjkBqxQfyXCBXQtukQSg2ZJfpZB5Pi
         MWLJlDEzh0gwUvbTxAAy6ZISI7mL97qxIYOPtIFxE3LM8LxHguZaO0/zh3epu14QRcHK
         FOqIeVlbKs5HML7X/qlmGvo1DEIKSqk3FjeYNlF2r3LPGc+oUIjJInMjUqD1MNp1yMMX
         GCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zMl9HB+CoeXivwtGRa00mnivVk8GGwQAiI6UYMzRyho=;
        b=zP9ctpYkrPK303WZt0yaNAAfOua5u/Mo5EKUpjfLd23d+yz5DWicB53DUhT0xy5GB+
         Dqdhl5E5vqela49ZNco0J8kMAfjzqBdS8XkXsHEL05riDJxgVT7ZLVGtzbitAWV40L9N
         WPAKvmsEJ8P7THP2al+n6XTc+mpp5G0g5fZJ58OE3HyOsLXoDr5Kh8U/dOm3Mekfzx6H
         QNnQ4ttu6SWtrQHwbbphwq38pLPYdfIP74HVtf7WGfi11pROcbbXnyckTYkwMgLEwGMJ
         6cBTDMCwUginMkqdr6EXd1IycfYVnizuN/9leaC7RE3vnL9WxeE7JWAkSNv2Ga5ICFnd
         68eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cXMp+Cy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si6886551yba.113.2021.01.07.13.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 13:09:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cXMp+Cy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxcWj-0005hU-Vs
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 16:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcWE-0005SW-9x
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 16:08:30 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcW8-00034a-Gx
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 16:08:30 -0500
Received: by mail-ed1-x534.google.com with SMTP id y24so9069964edt.10
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 13:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMl9HB+CoeXivwtGRa00mnivVk8GGwQAiI6UYMzRyho=;
 b=cXMp+Cy/JMgy9H01KiWx4ox09DK+ha8i9819ixe4IZnC1PIkjqlm7z+s7i3uUOsc3R
 WP5AG5FRVIWqK2cODy6n8fjXpkXkUGHLiiQzEsMuTPhfwgQk8QbQBYNRi99ZJYtSW+af
 QLFHah2y/ygnez4HR/zBEKC6aVCu9EBHvMFHN0M0wfySdAPIwGhuKaYfkFjgTYRP+GOZ
 bNrGKosxEPhfeFDj/ZvP+TY8nxsEI1cEFozxoKkEJWTzhfI9eg0zXT7lkcW3Gyw4buyd
 2thOqB+UVgjMu4E76tSvk3VfSSENlyIwLBjog+z64ko9lULsEFqyR7oOyFvRbv+5WInS
 N7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMl9HB+CoeXivwtGRa00mnivVk8GGwQAiI6UYMzRyho=;
 b=bRqb7akbEfwH92g/j11t9kSOpMnoEqLWQIrisuPzu+6NDxqm8yMEwR5c5jlmS07OYi
 vtSu7qvCeYqcgCT1zP8fT2e34cShIEnBA7d6sAdsPdMWHxH8Jt2Xcdorddays+3BpCzz
 nJmGKDxxl9pTNLo9FYOOcL8HjHDLQ1i9Q87izt+KnFKYgS+ZlNTX8lDOaf/WsXn6hokz
 dohrb5LO4tHJIPmwGErnd5h4YGYpVhvsqvai0D3byle5BVHW9qenonteDQyvDkGoVdKM
 NnLTeXFerkTt4HR64KjmeWKOdjflZa2BDiDMkLsGWTl/51sUuLBZrZZv/s8BTBe5ZkeT
 Vz5w==
X-Gm-Message-State: AOAM532A8VKrhjHmiNjJFuCbPWzabwT7greki5+hOpQutypX8ucMT77M
 4aYVIxukcWu03i/dpKeuk3URy+nTOy8ZCnocNtGaVw==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr2971927edr.251.1610053703000; 
 Thu, 07 Jan 2021 13:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-7-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 21:08:11 +0000
Message-ID: <CAFEAcA_dHwgAPcDxPW0xWcGrA=zW46Y+s79eK3KEt4A8m4=Emg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/*: Use type casting for SysBusDevice in NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xfFosnXU0423

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> A device shouldn't access its parent object which is QOM internal.
> Instead it should use type cast for this purporse. This patch fixes this
> issue for all NPCM7XX Devices.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
