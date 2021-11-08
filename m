Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp359648lfk;
        Mon, 8 Nov 2021 06:23:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxB+uMm86K+FvbF3hjmLzYnHOGx50VkexfPdkGw7XVAL+okrSowzHkKi2anlFAx9yRsAWYk
X-Received: by 2002:a67:fb05:: with SMTP id d5mr29847919vsr.41.1636381407180;
        Mon, 08 Nov 2021 06:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636381407; cv=none;
        d=google.com; s=arc-20160816;
        b=xAdM4n/cFQMwtZ3S13TEcGp72IzB1qIp7ELgipxQfivIi0J3RQiFBsvy7fna8FSkCv
         pTtx8fgGnVSMtnpzNxCdUDIHFaMP+9cRYgtOcgF7oPerhjaK04OFItrsEpxeT6Vuf9MP
         jzkz0zwUmVqrNNPWrY7Kq1s0DYduaJselE7+A0X77M2BS062BlvcOwQJnM0US1VBu5PN
         o2lLfwjsIpUKxa5hB5MgzbwSAIzz6Jkz3zjCn8jT7PVgpp5Ntw9ORvOU1PCckrzCkCke
         P1IWOQLlHN4eDf6lpeisU4A8maX3JaQps8IA5+EaBQkh0AdHW2avo0zEcaUl8Z1afHQf
         BFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R74r8Qa5QVcJoIVcE5bHlwBHeeseAGJmUak8PJIPs28=;
        b=rv7qrO0WTp/se6Cdng9ydQQxN6H6IwSPy7b3geWCzxfaviOMQn1hd4vead9TTPvzps
         f7aYrG5Z5YvRNlN2bkMzD0oMFjhhj8a1jDK3VXXhmmuOYJDenpggfgmLnOk+25YP+pYT
         2DJ0o3oTRWVMOtBPfNQ0HikzSdGoAnygbGsh9QgEMUIBxNjxif9yKZglj0byGroLOjCQ
         K7Ns4bYuEENjf54WKkSkMEl1iNCkpl//xvj87V7L/X+QPcxkHf/JzG1Hux0PV0B2hRJ4
         hn5Pw84XRGv2bz4EIkBb3N6RCcU4Ar4s7ZrD/+kz53jkynbcC+OQJNTEGIyWfa0ILXbh
         YRNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GbgE8YiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si34471810vsh.54.2021.11.08.06.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Nov 2021 06:23:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GbgE8YiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mk5YU-0004dN-Ey
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 09:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5YL-0004bT-3W
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 09:23:17 -0500
Received: from [2a00:1450:4864:20::135] (port=34626
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5YJ-0000jU-7q
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 09:23:16 -0500
Received: by mail-lf1-x135.google.com with SMTP id u11so36632137lfs.1
 for <qemu-arm@nongnu.org>; Mon, 08 Nov 2021 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R74r8Qa5QVcJoIVcE5bHlwBHeeseAGJmUak8PJIPs28=;
 b=GbgE8YiCpbJ9FGYFsZWA2BHTZ4xJz5O78mkoq3yu+R0Bvi54Y8zZrsu3HU8tYwFuQ1
 4aJQyIrfsfPjMMjaoWsE5K369FNylo1TjPvbYENJzPtVldP9s8NH4MdJ9SwfIW7T4wv/
 TBNaqhPdW4elkrUNqn+jqnOqOOLUffE5brYfkcdE2UxruBPaAIbh/PVJqCY9PxCodqLU
 PkcJ7ttY1EW4a5mcoAwb/6RKekaNDGfeKsyJOkG1Ra42BDN6+DeiWhEtpWyJJ+9Y9Anb
 MJxxG4MgLYXguKIJSxXqSoPmjRD+reRJz1EOp8ABtGJCChTwfSDop5byK19vf5zCZAWl
 L4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R74r8Qa5QVcJoIVcE5bHlwBHeeseAGJmUak8PJIPs28=;
 b=RftE63uHoIiu6tqbVhs/3SIdviFHBhbC8kXzzeTguY7DRD4/JUHy8zCbTCH70vT7yS
 aMM3mJFLu6wKhuVhGWCrHmjNuPfO6gs8yFN4vWo1O9cLVeUMPkCGCI4p1Ut/kCFtrx3w
 0FI0FOAo4jUa566fl2n2pWxueVqCda4WoNnjQGPv+y0NmnEjswcymcy+WOtNoQwFeTzJ
 e/3yaSH8FB3W13c44fTxM2rGjpqJ3VRmUEFVHJUa2wvsgXa1jb718a7QL6j+wDQJpepb
 4BMwJBJwdtLCiw//64aclJlDD2IcdmpRWHW9sHLFktBsA8DvkeK4/8UkCCYnNbuDRhKw
 W3Zg==
X-Gm-Message-State: AOAM533iNRMs671HWPHkBfMSXGS2c9cbJBSfObU0TPqb1JlcJXdO32zx
 87puRrKILNhzdH/iAg5UqAkFpaTGVKpSMHkzJWhyt0qkdqA=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr118960wrf.302.1636381026365; 
 Mon, 08 Nov 2021 06:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Nov 2021 14:16:55 +0000
Message-ID: <CAFEAcA_xNteFJzgmGjmzpEZUNQnV8yiEHojL-ocsX4Zj0VamHQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] target/arm: Fix insn exception priorities
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdKcpT3W0K97

On Wed, 3 Nov 2021 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Raise pc alignment faults.
> Fix single-step and pc-align priority over breakpoints.
> Not yet fixing insn abort priority over breakpoints.

Do you have a view on whether we should put this into 6.2
or hold it for 7.0 ?

-- PMM
