Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp168661wme;
        Thu, 17 May 2018 09:12:14 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqOzpEpxKPtooqKT6cqg/2djqe8jVs4lucQQkB+4Tw0WSoOYfcgwNdXWisGDHrbg4oV/Z57
X-Received: by 2002:a0c:b026:: with SMTP id k35-v6mr1944606qvc.190.1526573534694;
        Thu, 17 May 2018 09:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526573534; cv=none;
        d=google.com; s=arc-20160816;
        b=Rg2KceoiOBIMc9iNnUv73SRVCi/1S0dT0sDsHjmfPAjTwksHk5ZnyfuP+D0NR79nG/
         Ab0xvjlDi0a62IIvySkuX3ExC+Lr70DH2y0/aX+8hp9Lb6GL9yJGutJ3lU4p3bjQhGVs
         rDRcVPdNacVmEt/Xq1FKA79y1zypjMGm2S+ZhCLkUu8vJ6vu+pyeuSZyMy0Wo4pMSME/
         3d8accRLGtvJeAi2EJonZMXqKx8Msv8mJPyNrQecUXCTif44nlfgoDqT5a+IRXcH0A4M
         mVK8vaAbVrqYtBSmgAXetTkv8dSGCiA/hP8v++aNCedOW8B0mHu/lWya417KJclMuH7Y
         JyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NKN4d+MrWaCAg5mOmBdtgngkbMIzMMY2wKVP+kWc7kI=;
        b=PEwYAM6yGZbQTesmWWWy7ARQJUllPbbaFN3aPsrkR7Euxlcgpczpq9VPbAZ3wh1T+a
         KVTBRwbGHpvINjgJGd/7/JFVp0zlZVJmdmAT8uT24E/B/bxzlPuAAHOugQ+Xeiqr/o7V
         w1mjB/cdv3xWGwvdISTJZaPcL8ZDYDVX5T/hKNqd67eAKRCMxtx6kuZMpzZsEcGF1aiS
         04H9jWCGy64UEUzzSXB6zyAt01+FJ3GV2VDvS3jE54BepBavtENmcF1F9uOAUTeqh3/z
         eYfj0gETzzylPoW1E9Ow5V8SVnR8lFm9gI68b/1Xl/xtMWSVt96T6BH5NVXFBM7yqlee
         Qn5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jk0/kmyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si1245824qtr.91.2018.05.17.09.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jk0/kmyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJLVm-0008QA-5e
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:12:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLVc-0008Od-Jo
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLVb-0008L4-QR
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:12:04 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:42610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJLVb-0008Km-Kp
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:12:03 -0400
Received: by mail-oi0-x235.google.com with SMTP id t27-v6so4479537oij.9
	for <qemu-arm@nongnu.org>; Thu, 17 May 2018 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NKN4d+MrWaCAg5mOmBdtgngkbMIzMMY2wKVP+kWc7kI=;
	b=jk0/kmyr7YNys5o8yyh+JTS9VE0d/ydFswuroYgFlTO9oLMpRy3kVhMXR1NSG6x2Hy
	G9G+UZ4SKav3hk9qRDxy0OkEUMBt4TNV0nwF4RQGM9bjiGblCsTZ7U94mYcmxX3kpb3D
	agmFoN7bNn2MyAtbah8wq8ESZAxSg9B3I+yOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NKN4d+MrWaCAg5mOmBdtgngkbMIzMMY2wKVP+kWc7kI=;
	b=JvZ7Ro8CgUpopF3iSo3haZ8QRQB2Rn7zLet6DtKAQrzo3oaux49GfePv+4+lXju+DO
	8eP50jzMZDG1cLaZE7NU5YEqvDCADiPx2uulBAGz6DCRsBtj/R4VsXYhYLuGdy0RMRex
	eNvEagzsg1AOTX/ZVfKuNT5HxswufgWaUKsLRICgU0fClYPnFGQq2ac+O8mQ7KY++rlm
	wpIyfIH5IWXW9oqbosAXZgfL91CRiy1KT/0XLjSZkm9kZE3sPA/P/rzjrfJUlj2dgmRK
	w/B+6RMQ31qIK9/x3byBLj4sCLKihuytylXjkhoMAE47NC761H9r/PdYuOBS34PwFHn+
	xm5A==
X-Gm-Message-State: ALKqPwdlWR7sXhte6W16C5t3vvLlgVBmmLZBveUMeiI/6tArUkRvNMRy
	1XQzm2sG6SAP3Pi/JGUGcU2+/LMKIXHrXrsz4kaTPQ==
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr3398907oig.337.1526573523025; 
	Thu, 17 May 2018 09:12:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 09:11:42
	-0700 (PDT)
In-Reply-To: <20180516223007.10256-8-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
	<20180516223007.10256-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 17:11:42 +0100
Message-ID: <CAFEAcA9GVQxE97rzWDQn0V5yTTcGXdCej9zvxX_wMVOc8PBgCg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-arm] [PATCH v3-a 07/27] target/arm: Implement SVE
 Predicate Misc Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ba8J4nQKtfOy

On 16 May 2018 at 23:29, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |   4 +
>  target/arm/helper-sve.h    |   3 +
>  target/arm/sve_helper.c    |  84 +++++++++++++++
>  target/arm/translate-sve.c | 209 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  31 ++++++
>  5 files changed, 331 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
