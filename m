Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2010328ejy;
        Tue, 20 Sep 2022 13:07:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4i4iidnf+VfzKoZkup4GLsFPZh9jVa6OL/hgjrGxUecAU0ryelnRHuki+U3Km4CRfDABnC
X-Received: by 2002:a05:622a:204:b0:35c:bfa1:3a8e with SMTP id b4-20020a05622a020400b0035cbfa13a8emr20784728qtx.514.1663704476798;
        Tue, 20 Sep 2022 13:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663704476; cv=none;
        d=google.com; s=arc-20160816;
        b=MVPxnIBMk8GRBzHR5zdS28192DBqp8JqbBT9OiuxPkC1FEzV6ywvQb2PE7bUj6siQ1
         zKQ421Prem9Zo1WT9ArywLtTozEk1Nae7l+DxXBJ6fL/HINiHksKu+4MH0Gt5gwAJaFJ
         84YELVy+Iddp7ExQuIY2UxLYMbYwPpZqXe15UmnOlbl2kAdfY9wcMl0sQKtT8Vv3vzsZ
         LFz05UwK2VklfYGjcr/pmSaxwSbqpf2bMl7lQrn9sAXP7bVoyCPhgc0FigOUUX8Wlwvj
         kIsfI0FTYDi7v+FB+14aTZDzsOjhRLRen//qRm6f4BztFA7lLRQp5OmhD8Sn3iLjbBHE
         9l0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ssM9+aX31tyZon3JtI3Oed1n4xMIJ1QIEQdSqlyk1jM=;
        b=NX651wx2tkntqMei4osxNVMDIT5q9gK5EVI7nmNjwbxdNRhA302tJyXLBXK7cbu4QM
         EpArTosqCG4b1xEc+KMSe1NQ3pXzA5JZqyhXZE/kMgYZ5OfJeuvqe/PveLH0iygA+q7/
         osM6F4EqsEsaYYHaL1ZNptet9zOAqpXoU0lAv+gsUX+W8RLx5khpzDvmst8ZyvnzkuL3
         cQn0L1uuKXwcQ16Jkpoob/ArMuaXPdVU1XV4tPt+Az+5lP1VK0GUrQ83r7D6z9r6fcvA
         u/x1rRLi3frGCS/Pi6l83JFTQNFPKLvxyWgIvWPopVkI3xDSCy3ko+N7QHMT/xp0hzM2
         8hfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYrqZNV2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24-20020ac86058000000b0035ba353cb1bsi354923qtm.68.2022.09.20.13.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:07:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYrqZNV2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oajX8-0006ul-FF
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafVl-0007pd-Dq
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 11:50:14 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafVi-0003TD-QB
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 11:50:13 -0400
Received: by mail-ej1-x633.google.com with SMTP id dv25so7117300ejb.12
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ssM9+aX31tyZon3JtI3Oed1n4xMIJ1QIEQdSqlyk1jM=;
 b=WYrqZNV2Ust7zkVmktWhbKDqebe6sLnUyQArpdUgPEo0OH1Y4VOj+zoWurDppZsF1F
 g9qbt6TkylgNrppdKJno6rtIRztviw7MFYcN3OOYiPyTn3nMZj/L41ylh3ktFXPswB64
 qiE+CFRe60U93Ml+e6Bj31DP0LNW/Jm+iOqF81kGBGHzQQHcr9WmUniaP/RTSGDoSEng
 /PLNnUS0/wzItVmALzd6WfsuHZR2Vy9KAeH118wolaR+utUyKTpWxfu6LrQAJDdYLFG4
 aM4y/eWYqa54ih5azXzYN/Aaj+TYte4iJzBoyT9h4JYg1fMPDWk1z1qAL2n/Vt2uPvai
 EKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ssM9+aX31tyZon3JtI3Oed1n4xMIJ1QIEQdSqlyk1jM=;
 b=EHOtB/7IQHodquRPpwyqDv3DyMb9b9QCCn0kidCxRr6t+M1UnlE+qcm1QEVX6fR8CJ
 MxKDgnhc7VpJ+IcFJiT9lc/VmTmIcUW73twf9arufrLu7Z9JXeBcLKeWs9epeAr2AC4x
 wAP9KK6mNqDfzcoRyNUsSccCb/EXNnmlxbnAlQ8bdiIsiFVC9JP6P9XaOdD9ICl/7iwc
 eRz3sitjbeCcpJg88+JGckKs5XYchG3j7kPJMSug3k9kF0ZtSoyM7KLUYtfaAXYD5rLW
 awjUKBkb8/RzXfhjRGe/DSJNhQoVVsVR9qOewn+CSR4q9jfu0K7Fwikwgl8QKD4bDw8h
 yQEg==
X-Gm-Message-State: ACrzQf3/DKwmPEAuF6YQ1oeMGbmR/nZtoM57mzsdnD3bWaesmUeU5wQw
 Fwg2zTiuC7Ms+6CwT8JBykF5traBFz6ysYR4y3s1Rw2nG7Q=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr18014326ejc.659.1663689008570; Tue, 20
 Sep 2022 08:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-29-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:49:56 +0100
Message-ID: <CAFEAcA8AwN4tpEPLrLh=47VKN_J9wgADvihy0nfX6X-cMh4ymA@mail.gmail.com>
Subject: Re: [PATCH v2 28/66] target/arm: Drop secure check for HCR.TGE vs
 SCTLR_EL1.M
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RYrzUlAPE8kv

On Mon, 22 Aug 2022 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The effect of TGE does not only apply to non-secure state,
> now that Secure EL2 exists.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
