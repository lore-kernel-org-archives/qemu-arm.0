Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2110712ejb;
        Fri, 10 Feb 2023 10:09:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9BYqkhjexInfjegwVnq0qUU8qRBsc5fOhrD278BIEBUqaKqsuusjdZMOfN74jWVOlpTKSR
X-Received: by 2002:ad4:5d6b:0:b0:56c:2247:c7cf with SMTP id fn11-20020ad45d6b000000b0056c2247c7cfmr14483374qvb.23.1676052556534;
        Fri, 10 Feb 2023 10:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676052556; cv=none;
        d=google.com; s=arc-20160816;
        b=gf5rI0P8fI1OE32C6emUifAE8jqPZUx3ca9C7Y6OFN3vI/woGwTsuxG1tG2+/PfV84
         IwoNd6J3rgROemZ+36gCefWtzt1+3EjIp/MGZ2ptNVw5KsBOiWTPWVtpDROyEGm41hLI
         xy9cUe/L8ySs2oMOx6B5hFLrkAok3mrK3GMNs5ekijtVVqch8I759wZeiG095D4TWwun
         5FL4W2Xdw2WQdop0u7J858ARL5Yk1Rg7X+02musP/LOFwPflXeIAxQViJPHJZiboN7PU
         UJwovzCbf+OlTIXgtCqlE0JxKTT/8LoE+N6JYalY8UDqwXr9jnwbAhUNafrgXj8wiAqH
         pduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=4MMKLhxRBN0RBzX0zGlv/Tbr/Ai8XG6lzKS0FZP/2jQ=;
        b=q0faw4kyvC8y//OXgsNGc4bGyK5gJLlSu9digg5t/lcAjaYQ/nnlsRsNffORoKhgH3
         qnuMouYVx1ps58Nm/oosi7UdRSbYw1S36EBgHUjsHUlgD5Hu/QSKAMBU5bfvaiOad/X9
         PkZ2QICmxJ9mBFltev+BIv/NLdgBmS+gXCinD4aNSJysTL/QVP/3K1y5emfPOqxZ6N6A
         Ad0f90NPQubpuhdXraIwvA8qUkSs7inAwj8KUu7JdVwChS+G7/OVQaN9YGqAan/9d2+f
         NhEQuP7JSHZ60mT1gLXLl11mDnBpGA1a9utIfHeK8KtsNLfwfTeZCOtkbaBqzyBp4vlR
         8EPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=C1jeKOtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a0cb309000000b0056bea5ad78asi4392651qve.363.2023.02.10.10.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 10:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=C1jeKOtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQXpL-0005Kw-3Q; Fri, 10 Feb 2023 13:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pQXpJ-0005KH-M5
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 13:08:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pQXpI-0001SU-0L
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 13:08:49 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so4651691wmb.5
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 10:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4MMKLhxRBN0RBzX0zGlv/Tbr/Ai8XG6lzKS0FZP/2jQ=;
 b=C1jeKOtC0r3iY0Z9aihNisFbqbMJS6iGfVzO/wn3K0Whm+POCoDFMjvL8s/4n9NV2L
 V8/oT7w0xD0tFBs1vsTdRx+tyAP1GzFdzgZSOLXjRCQxXDtbZe8SGy2+vEBM5uctazVj
 7Deyoxo70Ap09rlyifWNjcEHQfazjVjsZ7k6UOOppC7H2zCiaEef4XDdNtdPv9DDE8wh
 JEWdgpriC0VPgfOsxIJdcg5x2ZDGwJCSoDDX+U5uk0ZId07U6r9cZL8qNc/qfQ6uD3SX
 6xVbHlomF3wBlnf5NSY/VXYFZ6XVdd36Xsa7fXVwQUAIEaBHUIEP9sXAjZH/46hS2hUk
 8ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MMKLhxRBN0RBzX0zGlv/Tbr/Ai8XG6lzKS0FZP/2jQ=;
 b=DO8m5hWBoPKA5UxUfCWn6KaHLZnjMU0XuUeLam6wOnlGFANoobgQKzeZMxBf1DP7dV
 AtZhuFs0Ltu4V0Zhd+1GNrL87ni4WPkvnmOyvhwDaolbzIQ/M6n5GVqt3FngaznJAglG
 PiZrdqvB2z+svh0zPKlAS6UeuUryujdH/MJOl8OWDrUGeBq35xi8eFxP2yPcQg+V6WzO
 /Kk/gvPVzEcKbtd0uGmf7oQFLgCUaFUHXiI6aA+qTFdOC20KomuhI6XUJ3XZbObcpR7M
 FF2x7PhV5RJIHEWCvlCjBPjJum1lLKXR+8nJyLnM7xeW495UsPuw5cVGDIkECgTOSg3R
 HgLw==
X-Gm-Message-State: AO0yUKXEWvAvlluOckM2+NtRMEtVsR3T67EVbYv2OmrKuGfUSD+9x6WN
 R+xVLHuA5b19cIYnC5fuhwEW5g==
X-Received: by 2002:a05:600c:540b:b0:3df:f3cb:e8cb with SMTP id
 he11-20020a05600c540b00b003dff3cbe8cbmr242032wmb.4.1676052525355; 
 Fri, 10 Feb 2023 10:08:45 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003dd19baf45asm6427978wmq.40.2023.02.10.10.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 10:08:44 -0800 (PST)
Date: Fri, 10 Feb 2023 18:08:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+aIJy56YYEKkpgW@google.com>
References: <20230207181933.1999817-1-smostafa@google.com>
 <CAFEAcA_WW1_d3y6qE3G99cZKyPPwycKAbkGDM=5_6B9t1uDQ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_WW1_d3y6qE3G99cZKyPPwycKAbkGDM=5_6B9t1uDQ6Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U+zgNouhxeLS

On Fri, Feb 10, 2023 at 04:11:37PM +0000, Peter Maydell wrote:
> 
> I think we should check the whole register against its reset value,
> not just the ABORT bit. Otherwise if the guest writes the other fields
> to non default values we won't migrate them. That doesn't change the
> device behaviour now but it will have the weird effect that the guest
> could write the register and then after a migration find it reading
> back as a different value. Plus if in future we implement actual
> functionality for any of the other fields then we'll want to know
> what their true values written by the guest are.
> 
> Linux never changes any fields except ABORT so for the most interesting
> guest it won't make a difference right now.

I agree, I was trying to achieve maximum backward compatibility as we
don’t care about other fields, but this can be weird for forward
migration, if the register is not fully migrated.
And if SW touches this register it would probably want to configure the
ABORT at some point, so it won’t help much for backward migration.

I will update this in v4.

Thanks,
Mostafa

