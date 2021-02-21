Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1010722lfc;
        Sun, 21 Feb 2021 05:35:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznVMt6IFlB3HupJQ0+1UfIMZw300P4VdXh4CkV22sBz61nMr6toBH7X0pi/4XLwLAhz6bd
X-Received: by 2002:a05:6638:96c:: with SMTP id o12mr18065171jaj.24.1613914537654;
        Sun, 21 Feb 2021 05:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613914537; cv=none;
        d=google.com; s=arc-20160816;
        b=din/fsl1wEQu+aHnHkHFS14GSrOpF7sr+T1cj81proHFGJ+SXFol2mw8rEIwiM6GGy
         +iLCYQH6/r68SSIoewtBjMhEZBsTc/4a+GJdWWIAzysythkjiNduO8UpwpIZ3RK7rioC
         CQ4xAg5jjHcYyeceCBgyhadtKkfzRhWc0pXwTupP4iX4y5KGTARVtgCBuWd7e3ZHIlgo
         +pw3rKygfIsQ506z5vNcCi1Ls0OfyXZwTNfiU3i+hC4vABAlxPZXxV2QIfdPEqMXuGyY
         YxY0Odxx4yI9ycEaM3hFil+6QFUb7jqTkuCC2aysgwbRXhCBEU/WjvL3QDd6imjoZsdq
         Tlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W3Tdmuul5Cs4K1EGUI7N/Ng/a7QaIyQ3aVKntq5AeHo=;
        b=rAsioX2XOKD/NZUGR803WOExii/A75quDnzP/y8fACxgwL81P45GEIqI3jdYBzsb10
         kxELrBld7EubLxFSAA9/j5+IGHWxbV1BKf9n75tpkrM3L4LKISyNXF6AgiIuTvyntAnd
         RKxrbnyl9YJNXhPPFObdFfxW7ofigwBm22vAMX/iqQld4i+SUh7MSL96/82q3LzeUoc6
         yRZ5u4TTEmRTFLn3dPQK/NQx5SmHG+yOby65zhykkyiugYkrGX2MCA6afWHtX1uHB27e
         PjbLFPHqVT679zuGt6LY/gxDMTgJzm+KMkm8+SXAXOVLa9jsvyhIvVzaOOI1Pi09S3pt
         i1yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="L6/6SD+K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si13191581ile.158.2021.02.21.05.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 05:35:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="L6/6SD+K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDotc-0003BK-Uy
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 08:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDosE-0002wx-Gl; Sun, 21 Feb 2021 08:34:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDosC-0001PN-DA; Sun, 21 Feb 2021 08:34:10 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so16222348wrx.4;
 Sun, 21 Feb 2021 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W3Tdmuul5Cs4K1EGUI7N/Ng/a7QaIyQ3aVKntq5AeHo=;
 b=L6/6SD+KDtRW1C9LqSn2KBQj8Lsa9PHnWz6fD+42OxRgwYeI4+mnquKlwYL4MtNthz
 t2RobbgXNy2KD0aF2oOGwb1S4llZJmucG/0kt32M4COiLF5Fa7KAfw/jRRx4hZt28vHQ
 o1AGfaNsHKGOTKas7Y/tHNP42a+DIqXAE0skHGhJgVu/W81HrAfJefJaXZcdLWyjRZ2z
 lKmwPOL0k+8zWopKYb2M42ea+byMKqoBb2/kNpIER2wjJIX6chkmBw5igmcXLi9FiqYq
 W1bd4HpYqGGywkMPShA47AaSQxwKqHzPkqgLABEMNk4Tm34fFBhLRdugg579ZZ6r7K4H
 rDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W3Tdmuul5Cs4K1EGUI7N/Ng/a7QaIyQ3aVKntq5AeHo=;
 b=in7wMjcAPH5MEN/+BQQizAevXvjdYtGQQG9cSYWBtNWKxYv4tS5TjHPn+q5qpK7ixm
 J6kRDmd8zHJce3PGZ/XWoi/cOsouVuD6iobjjrAvPe37YZnntRONEoaWxgRtWbHDBxvZ
 iNp1ugwcI39xe+a8i48W6l+ZKTVz5MEn2yvt7j7V0MY4BcHzmALeAbY2FYyflnOtbNkH
 uueEuoFLWiQFq09rqGkEWQDMGEnavdA7O8Jn4urP301PZ08Ansyrvs9RjmgsBF7dIPGz
 4uym4QxifJlG7Zm9gkKLzB9ksUPjt1wAH+L+j42uNSbbe7LIxnkHMbzlL6EiRpIEQd5v
 jsfQ==
X-Gm-Message-State: AOAM533TScdfy7cFDG1WwtMS6mXzzKp2Hrlqj1X41COaBnZ2oQZ/wWaa
 I2gBQZgZmb8sRSrST72DcGhrlMnqP7o=
X-Received: by 2002:adf:e884:: with SMTP id d4mr16931848wrm.275.1613914444902; 
 Sun, 21 Feb 2021 05:34:04 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm25272677wrx.82.2021.02.21.05.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:34:04 -0800 (PST)
Subject: Re: [PATCH 21/44] hw/arm/armsse: Use an array for apb_ppc fields in
 the state structure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-22-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b0bf4b8-72d6-32f9-5e4c-1298d25dbdcc@amsat.org>
Date: Sun, 21 Feb 2021 14:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cDj0GR7qQZhi

On 2/19/21 3:45 PM, Peter Maydell wrote:
> Convert the apb_ppc0 and apb_ppc1 fields in the ARMSSE state struct
> to use an array instead of two separate fields.  We already had one
> place in the code that wanted to be able to refer to the PPC by
> index, and we're about to add more code like that.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  6 +++---
>  hw/arm/armsse.c         | 32 ++++++++++++++++++--------------
>  2 files changed, 21 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
