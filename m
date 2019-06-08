Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1551098wrg;
        Sat, 8 Jun 2019 12:42:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCrYvzRHxzZr7aGATuj+YoDTovhsOblVAmq9NmJe3e6T4sMWCUrpTxHr3ul1Kt4wDdxdBj
X-Received: by 2002:ac8:368c:: with SMTP id a12mr48406376qtc.334.1560022949850;
        Sat, 08 Jun 2019 12:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022949; cv=none;
        d=google.com; s=arc-20160816;
        b=gB4PrN8kl0ihjZMZ1HRl8sQPrQICsd2/L59EQF7e7fCwQFkMuudijoHsXVC2fvzw/I
         GUozYLrx6vzLRR9JF+GPLtQ2oZ71VorZ4BONmZFY+umdH9aWEUqo42lB/wC0bxAC9Yyc
         /wAyb28yFbKiB1rKeyofBWTl7RcgCip7UO6CwqyY3dJCXz/iGjo0yadcjGzaFk1TYXaV
         azJX3eCXWb4q+KS2SCcQgcdamlDT/+rlHvJu6wjy+f4Ncjw8GsLTdsrWNO9RNNE0vnGx
         H0G3sf+wKGX9cMNn6Y2No6W+VRSAVoy8t1i1OFg9e6Y3r/T+uuQpJMcgt5Z4L6KhBXRu
         8XvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=zhimUqTFYux+e19jXVSmtxmLIMGmKegJ58FRgEvqCVU=;
        b=DEZCdYiHgK33jyzQGxORELY9IyIPpUKlM4asKRi15PQP1Br88c+TH7nJjRo/rEd3NB
         ZC3e9GAKM3xeGU/WZDUD29o6x7S8wnkwymEEUb0KicGWaAeC+E4eyo4E+n8R618ZkZq/
         +SyWFF/KJo3/a1FVrYAM+EViusb+pZAhC+yI8rOuK4/Qc2GdvrCsaiFEw7OFuqwqAI26
         +WHWufDiOQeRtu2Dfw82RzsSsmd3MgcRgBbZUGDjk7TKPt/4u/hnPb7IpX2d08KAcJma
         uFo02QTOVhFuy6n4FO55KjhHI6fSQRQdU+9K8u35OWwTK5VCnRhbzZVLW2UIf0Urg/x5
         rxww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RCHEdZ/F";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p40si3770789qvc.78.2019.06.08.12.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RCHEdZ/F";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhET-00030n-5P
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3V-0000wX-9x
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3T-0000cj-2L
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:09 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh3Q-0000aE-SQ
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:06 -0400
Received: by mail-ot1-x342.google.com with SMTP id r10so4925100otd.4
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zhimUqTFYux+e19jXVSmtxmLIMGmKegJ58FRgEvqCVU=;
 b=RCHEdZ/FNPEC4khCeuXSTq8CyTfblIBv6hmDnOXGhrJuqPMlfWVLtVEZOhEo2ZJv/u
 PJBi9Pklvyj7eYx8RlURcgC7sJoPuiIJBLO2sMAcQpORpnw+hGFsEsfb9PsHmjB8P7Fx
 dldeSPDASUBm7cGRIyiWc/SRrmZWqQyD7+Devf6W6/3wJxVl2iL8hU7YXCXnaDtxLBnX
 5bXspOyyEqMjeXWgGZy0sjXY7mTBCsmVY38tfyebvC1XQtIrVb0yXEnFVClPEccMLqp9
 RFcPcPMKIt4YNGUU8hIZ8dbdQfnmNFe+7lNQ39XxR2U0TWrQmiqXehAPiJu9JW5FlEDH
 yB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhimUqTFYux+e19jXVSmtxmLIMGmKegJ58FRgEvqCVU=;
 b=Y13MgqqVw/k6ZjEWaYYkyDqpgs3u9E6F5zA9SZiHhHQuSjA3RDqdf/j9+TZgXwcFOL
 ZgEQ/rAXq2OPebWxOJEM7kgdg3+QLXFLCJEGXZD8vu4Bs96AJV1TOdhsV3dST3hmno6R
 KD/Rfvi0oluydp5/4uekFbsAVsYkr+g3160/6+gKQDf2lbinMrY7fk/EVW5PovzL+0S6
 sI7D8ZKukQQO+7Vyjrsv6wBcLGV0nXyj3PPM+JnVpAoxWdcIkRpOWPh/B8aiyYvoXTOL
 Vg5ZKbm9Hy6GkUGi/7dfFXH3i/hwgMYMSnB4U3gUC/4Yo83yU4+omMwym9SM5hztNiaY
 o06w==
X-Gm-Message-State: APjAAAX3JNx12Mjh1X2BTSFxSInOhPHDVUfVHQXkgSSWUOEzNxvLwLLZ
 0Y+2bW+vpBdfPiJpI/xAdO51EjSOyT/CXA==
X-Received: by 2002:a9d:2c26:: with SMTP id f35mr24244141otb.362.1560022262636; 
 Sat, 08 Jun 2019 12:31:02 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id f109sm387961otf.34.2019.06.08.12.30.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:31:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <948b4878-acb7-b0e1-510a-a682023864ea@linaro.org>
Date: Sat, 8 Jun 2019 14:22:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 40/42] target/arm: Convert VCVT
 fp/fixed-point conversion insns to decodetree
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
X-TUID: 0KZY2B1bUeVA

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the VCVT (between floating-point and fixed-point) instructions
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 124 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         |  57 +--------------
>  target/arm/vfp.decode          |  10 +++
>  3 files changed, 136 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
