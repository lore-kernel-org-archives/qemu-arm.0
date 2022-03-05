Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp139894lfo;
        Fri, 4 Mar 2022 16:19:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4jbJZR/YeUFzQfpf3QL8zdSSOMhxJpuqPBtWk3YhQwoivs7NNIjdqip73KBbFYtUzbhxT
X-Received: by 2002:a25:3bcf:0:b0:628:c396:67c7 with SMTP id i198-20020a253bcf000000b00628c39667c7mr975691yba.46.1646439593013;
        Fri, 04 Mar 2022 16:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646439593; cv=none;
        d=google.com; s=arc-20160816;
        b=NS1aWJEI6ZpF6DJkmoF/70gQzSX5SE0kRQN8b16YyGewyAXNam8REhJk73mKt5NrOV
         XZ7WBiTxMWfoWNoqqBG1ezAsWpYtvmdcbU8cifTY9rV/S2Ro9KKtLwMT9ZXMbnU2p1z8
         5gzy2/GH/nc73am4EukvMzExXR2BSrdF7TJYmb+nFF1JQ5i3vOfogYGI2YGXgCVoo3gZ
         7qqMUwZOvy/GE+59/VNb5E7zgVXS/K2I1s2qCX8W5wC0VOEBiPjE0dk8HgzRHvgIDBee
         CeeXh3TCm8P7hWTdZ54pGS7NqXJ1jo4L/Z2z2yyK+erbHVZ3wW9OLaU6afYhHpt/B0l1
         CnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=MceOeloZv1WrCppHqI4VVwedJGkMZkpa1JIjGlC6tYE=;
        b=r79w2gJFpucX/b3QrQ1++FemTrjQhwh6WdVB9fLSEYAtodKnSPN/sJ48ldcLoXTA99
         k7EAcAlwmu0WNZve8jVNaqHTO+jj2CV+/Z1k8OrG1Y74S7Ou4n7/lygiEFewtWqXXCVf
         nqgItR6mbQoKdqIxM5MCNnLGnldNfX5RjJ44TFacSn66lFUmv+KZakKM/Vmv/1ZwzODc
         BD/U2qNXhUAfrmuiCmbJUeSMmIyhLcfwn0sn3NtQh5HGV4KGvnYn2DfV20ULT/LNucHq
         hAxXYF/CFzvMnEgjXBblDUXUc8neWYeKmy7lgoEDLTq0oI4tT8fj/ClwuJzPfWEYg7iD
         uNRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=DpKsAI2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a253009000000b0060ed7a07467si5402208ybw.249.2022.03.04.16.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 16:19:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=DpKsAI2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQI9I-000707-Fu
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 19:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQI8v-0006yR-3g; Fri, 04 Mar 2022 19:19:29 -0500
Received: from [2607:f8b0:4864:20::62f] (port=41613
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQI8t-0000Jd-Dt; Fri, 04 Mar 2022 19:19:28 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z3so663314plg.8;
 Fri, 04 Mar 2022 16:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MceOeloZv1WrCppHqI4VVwedJGkMZkpa1JIjGlC6tYE=;
 b=DpKsAI2kLHG+gBk710woR1ZoyIFNvtgEP1lhsP40tohaStKhbY2AKuQcVgZezIX9Nl
 a5940UOpP3JBFZc6vpJ47Xn8et/VbdTcDQ9SRyQaTinOsvM7dDLw5U86IgBYkOR95lDp
 Hv54sbSE0tD8ol3F/T2s1kQb3ui+2nPLDxudejH5dUK1rrXlEWcTb11bY8nzN9c6mNvh
 abpx8saGsi5q+97RQkzycDhDla2yYOGq/6x+XOttDOb6X4CeH4zu5LqY0pMoRwJdJtbP
 w4aWvxEDbjTV6Vsf0t2oP7H9lDERvTAp+jKLwbFI7a46r4dVzilkHv0odX0wcmm0cvPy
 MuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MceOeloZv1WrCppHqI4VVwedJGkMZkpa1JIjGlC6tYE=;
 b=RLE26Vf6kwT86v0DUL7aiHLRepxswgySaifzN2dxXvs3lSthrhp0X+c8RrTquKuCfJ
 ANaNDOGfZ3wYuI6W4MT3lGKz9Ea271uaoooglrSugch25cVXNwBArvGt5L/lyppaqHBz
 sQWE1MmnlluqUT21NIKPgQBdPeDYVSs/Xto21rm8TPepFVSkFXv5mPpDl7zI+hLM7umG
 fqj+5IK24Udss0vTL8KO9CyQSCdvmzY/T+lKIgwAkVDSqMb+xDddsCa8JJeZG2OJqgrx
 W0u3hfb8KNMeEC6I8rHeX5IH77q8wlDQHl1FAvi4h8v5pZ1bzVnBnRdf5vcQnDRPqSAS
 BZUQ==
X-Gm-Message-State: AOAM533pOuOJzw3GsmXRtMrib6Fca90li0y9fBTIlK5nQZmS5XM3aqTl
 VFWfWjhyNaNUH20qLgh6Wi4=
X-Received: by 2002:a17:903:2301:b0:150:140:c69e with SMTP id
 d1-20020a170903230100b001500140c69emr904143plh.82.1646439565752; 
 Fri, 04 Mar 2022 16:19:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm5457877pgj.85.2022.03.04.16.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:19:25 -0800 (PST)
Message-ID: <3f22917c-9e50-1aff-6a16-a61aa74f0d50@gmail.com>
Date: Sat, 5 Mar 2022 01:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/9] hw/i2c: pmbus: add registers
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-2-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-2-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P2bNdsd8QQf8

On 2/3/22 02:50, Titus Rwantare wrote:
>     - add the VOUT_MIN and STATUS_MFR registers
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c         | 24 ++++++++++++++++++++++++
>   include/hw/i2c/pmbus_device.h |  3 +++
>   2 files changed, 27 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
