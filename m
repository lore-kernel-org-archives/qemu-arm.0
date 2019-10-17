Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1061624wrm;
        Thu, 17 Oct 2019 07:56:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpyUVG60569+0NK5iAjHh6GCjqS2v2WFKn1T4i8Vr34RaDjah1vV2Op14CcpvfbKwb988X
X-Received: by 2002:ae9:f003:: with SMTP id l3mr3615085qkg.156.1571324193677;
        Thu, 17 Oct 2019 07:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571324193; cv=none;
        d=google.com; s=arc-20160816;
        b=q09DT482fivltFGTz/IIcqZI/kNJdNyLMC8PcKCRmFVV7HeJGs75ed3B8Pmlan7VGO
         6L2J2cDRCeMh8magxrkYKDKqu9aRIETrkZbZiRuUBh3B7pQd+oVBhj+QBIusIqCdeso5
         Qgn0XBAuSgrVUHwQSN7hLi5XXudxKvK086cvhyE97PW8lIjaNvDN/Stmg3rrYhlpp7NO
         wWbmYY0+XFck4athTOowsjVKS4F4LMEjBEYvZMmPWGTzzGOoQAFbCpz7tZ3JEARXcNN4
         9cfC2gg5bvTCxwAV7a/LC4QGGxho0crxswI8+HuscHtU5CcXZS2hFhP3PgfsvFNCdJ/p
         eZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=39QdY9botuqR+h9waZXbXLCganEZXR5K/YXJ+T4KP6E=;
        b=wxAF8Hp2Rtn0ZB7yc/uevvAiu5A+w3g94wtefkbP2vSdxJfeF4WfJ2AIXjGglQMVP+
         Ql6y5WYAtX4+UR530ZstNb9gB7jFD9nlF7yTCtFuT/COk1nyAPy2UTVNek9cylv9SbUi
         mGXL8C2f6lJb86HEQZWvTt7ABHKspku/DqIjEvY/W6dYhPybIxlsrSvW8xCzTN6E1rkK
         KJLThSOxG3mcEuq9FYfKtq9wWbM9HpMRno786DX5jqqb9jLCIJZrg9+swWcmMp7UGjEk
         ak06PL8UxHl0frtYA0F1VwnzlOYG3knc1J/9IsJ6co2wGJl2Mgv9BhEi6IiIZfOYCjkm
         Ssog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWSPd9Kq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si2171409qkj.165.2019.10.17.07.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 07:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWSPd9Kq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL7Ca-00039o-JZ
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 10:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6aG-0004km-Fs
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6aF-0003Pb-BR
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:16:56 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37107)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL6aF-0003Or-5g
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:16:55 -0400
Received: by mail-pf1-x444.google.com with SMTP id y5so1755863pfo.4
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=39QdY9botuqR+h9waZXbXLCganEZXR5K/YXJ+T4KP6E=;
 b=PWSPd9KqoKl9Ey6P1Fcui9pHT3LynI2fZr2YnNhbjkSRTvoTORwHCFtyK1w3vYsZfy
 f3aZOtR4vFrr2Mzpq8Q4CLtW4+K65cFREmJiiRhpG4PgxdGcW6Lm4x+4cDZNr+8HTJA8
 3PxmiOI87jaPMroRdSF0jI5HXxiIWBQB90W+0cQpaBJ1wa49442GVqQKv4C54HY5skQk
 p4WImdR0SEAZAYsg2NqHrlatjzffwh5gYNAJ7KnogVO8s1CTShMwo3DCGSaPd9eCrqVz
 1P/tLejLVtjY8hM2ykiKzLPlr1L4b0RFbJh7/aeypVYOmrELI+Fa9h5VE/JurwACUY77
 rz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39QdY9botuqR+h9waZXbXLCganEZXR5K/YXJ+T4KP6E=;
 b=P43Blc72nt3OkeYUYxCjldrkonOf56gZPxd0grM0jerQiVM9jC8yhzGFsMqZXPMdxG
 i+cidDh7YZQ9usmrDkNc0iuiypZd5yLmdXoroislrrdsxYsIVyA3EJX27Y0AMNjtOz6v
 qr87C4GJxyM7C9MLWQcoBCVqfFMMeKstImlCuuHSfiEqCQxjAz53GWq/z+XzgNosejg+
 WT7JGR52E7QZqTlA5VmbTWWkmmxH+ZJGZk3NsOepLoE3vDaohFhzXRB8rkryODvVtioD
 zVDTkrp10CzrR6GPPawUq5LSwC0h+wpRzzeT54yRBr7he7cshmtoMD9Q9BsjkPEismPS
 XQLg==
X-Gm-Message-State: APjAAAWAZ7zhGcRdMwU58y1Dxl6GoZ5l6vMOKqK/IvMfiyaVxqY+0ayI
 pDUVKDnD2qBkbAVi2Smq4Z2NIw==
X-Received: by 2002:a63:f904:: with SMTP id h4mr4436053pgi.80.1571321814116;
 Thu, 17 Oct 2019 07:16:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id e184sm3180583pfa.87.2019.10.17.07.16.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:16:53 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/dma/xilinx_axidma.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6ab49b0e-809d-7100-a10d-5c0f2576528c@linaro.org>
Date: Thu, 17 Oct 2019 07:16:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017132122.4402-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UJXykWdtyPgS

On 10/17/19 6:21 AM, Peter Maydell wrote:
> Switch the xilinx_axidma code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/dma/xilinx_axidma.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
