Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1584339lfr;
        Fri, 9 Apr 2021 08:22:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlivruqlWU9ku6WEYSladycl/99Cl+BlZwbkGKzLBO2/y1UnHpbtdtOCBIFc2EeHgVu9kH
X-Received: by 2002:a9d:51d1:: with SMTP id d17mr4782362oth.74.1617981732587;
        Fri, 09 Apr 2021 08:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617981732; cv=none;
        d=google.com; s=arc-20160816;
        b=GIQv6Vsv/dTGij5hpxKbN2TaNirKCHanChWd65YszNPoM/Q/Iq5Uj0aEClX2B+UFqc
         mJLLnWC/gn7Uer8pH1zS+W67ln8uPYtzPD6xc5ArMSTHimWFxySN/CkKRgNtXzhPMrDr
         In8VMLwjKO+rY2OmfWH/dOUFNZac2UAQtt0uqrkwinEe17VIky5z3fcIH0sxs3zWiw2J
         gOby69mp6bByo7NRjPhYZmzRbfvQl3T9c0jvjiMtbIt2+XyePGL2OIakOQFfOxtcTKv5
         MGTqvsoVsEiVa37QZzM20GACITNZaDj9+tkQIbPfHYiT2jBOn3GBnCk6ZcNaF1JzT7R/
         QVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sXQRsfTQxWHp93vfbYY7KUgBSSsTXGRrbJLA0wnJmtA=;
        b=AWrT9IR0dV1a5rNgaG/DM9OnhmiIJR9DTZCPKsDX9MyF0vsjTMZQIEJrWt0AVvPtbh
         q5xNcDFuP1szuZ9/OGcinjJTkGkAeRwZEpa3FawF3qzUyZBagqP+/WBdPksaFgMOPlSI
         ol2yVMBbcSzyYXTxlNj3IWghQ3Xo569QrnYMRuPAMd3VRz9uk7B67ohoL5GKxnlLQZu+
         CeEiRcriNiv5nIxc16WxMxfN7CcATXOXh3ug7ldi7kcgZ2qOeO/PxJjs+t8UBvqv/+cf
         IEqQJnD9n13NfpbW89ncFveYr7Lo9gvxw8T+4YmGPc7AM3iFfx1hYIcCIouYkd9gcCQ6
         D5JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XHQidgDy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u198si3100940oif.121.2021.04.09.08.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 08:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XHQidgDy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUsxX-0007av-TY
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 11:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUsxN-0007YC-CN
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:22:01 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUsxL-0003tT-PA
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 11:22:00 -0400
Received: by mail-pg1-x52c.google.com with SMTP id p12so4147622pgj.10
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sXQRsfTQxWHp93vfbYY7KUgBSSsTXGRrbJLA0wnJmtA=;
 b=XHQidgDyC9Q2K2zCrilVlYQG2eh7WW3/d0ehKECNgn5KlEXondSq+zMMPSv15np2OS
 0MNDK5DOYcyZqUF4OEEYWSaWoluumUkCpcjCpIqPogaP6LjBlB+gCWkxPBr79HN6B4Ae
 ThaBh0hgJnMp3q8QAcQxSLtLXYvVCUgfCtio+htdf+QVz9uEU35AP27mtpu5ETQVhO+m
 NHyNROdw4IwO5Qo0dKaMDHDxZkSS+dYlnty7pFaINgIOznLqzmkbED9p7remq7BDmxYc
 Uu/RexUXxVMJK7WvdR+1Wg30auSlv3MjNUNfVuHH9X3FMa2gmsT3WzGVjCxOSTel22Rd
 2MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sXQRsfTQxWHp93vfbYY7KUgBSSsTXGRrbJLA0wnJmtA=;
 b=EC3SfvqvuYbBZ08VOXIOMRUKqETwIxk/XtxX3aB1BSRsWTTf9UiY2QAhmtI51qVd0L
 SWLZN7RwD/OUB4yWGheMMFgyhdM2r4dK8DlXNM4rJTopPU9CgzifwFMzqmDDHgD/lcWy
 xmlcM+CKflEnqmnixWwGFyRS1y5ngjpGmc9nRK8sFMmYCmjjQ4rNBwjtBTBKwITSd7fD
 FZNeAndZaNVwz7GKp+PRGDlKpbwbOSS5caFijGK9/TIVwc4DN6Jopq01O1+Yj5hcJ9GA
 W8XFGoQU0PjZ5gAC45r1pwnUhMNZMCOZ//kRCCIkl4XSFx19A9RU3avoBoyAC+UZGItx
 Ymiw==
X-Gm-Message-State: AOAM533LvcqC1maNlzUC2StDG4AMKoSFxE8XImjXIvdQY8dFpw8GDZXm
 BKiyeccCnqqeVh8SCQ/Zy6t35Q==
X-Received: by 2002:a63:1303:: with SMTP id i3mr13540344pgl.32.1617981718392; 
 Fri, 09 Apr 2021 08:21:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h68sm2831482pfe.111.2021.04.09.08.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 08:21:57 -0700 (PDT)
Subject: Re: [PATCH for-6.0 0/2] mps3-an524: Fix MPC setting for SRAM block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210409150527.15053-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b82524a-2482-b651-d575-ccdf3fbe1f5a@linaro.org>
Date: Fri, 9 Apr 2021 08:21:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409150527.15053-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TNJ+GRtHdCWo

On 4/9/21 8:05 AM, Peter Maydell wrote:
> Peter Maydell (2):
>    hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block
>    hw/arm/mps2-tz: Assert if more than one RAM is attached to an MPC

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
