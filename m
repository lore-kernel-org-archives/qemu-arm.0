Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4888573lfm;
        Mon, 6 Jul 2020 06:13:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7CdlUs9uonxWuq6S5/xAF2fnRTlI0t275JDRvcRC0lGMBf67bpqN2MqsYuWIkcmZQanFj
X-Received: by 2002:a5b:152:: with SMTP id c18mr39878323ybp.393.1594041206507;
        Mon, 06 Jul 2020 06:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594041206; cv=none;
        d=google.com; s=arc-20160816;
        b=iwOZt1v2p3Qe184Cd+QtSz7gmFg9RDDQwnX7UWfjly4I95WN9LzH5j2i/qxCQMBdze
         uuYnoYhYERAIEpplol9bb3CFS6ivZKNqcBgzNwaSddZy5T8NU1phTzigIGqLND1uEt6Z
         CzwwREhQwMgEQ/t/zIk1q/Mat/RMguqvi6PbVKKZnlIzIi5wZ3sj6GRQEyvQGa0EssIF
         3XuvwMtIg7g+KhYw84ZldB+WqeClz2xI31IW82FopcWwoWygSQk05NzYSKM3hwyhQGns
         3FaCdMYWSVvinx+eLQabqvADK6BR3+uQ89PZfuHPDApDSrxjrmICGFNFBjq33paSMg2v
         MJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fT/hLLdg2+88cLUyFSAOH1/RHevrdz3wUBOHtDQG24=;
        b=w7k2cu45jyHqIJohDllTu5mGXAr5c5vCsXM+19cXYIbqb3gILDCHCHr3x3R6qWmKfk
         8UeC2fRwgE/CAzCjouZPeAfyHBG1EYQ6Oc/+HX2lvZ+lmACAKuRYaN6FjywCbtiW1qOv
         TYjWMLRSa4vkur0Ws2yROr5kHU0DGyNPEE/Su/RPpHyD6L7+VkvLea+t2RJa9rcrDoMH
         ZVmOOz9KtYc6ctCtQnXAYOH4CwbcCwI1kKwr3FAOq+fwZdqOKsm38f9tj89bVFZn3w9W
         ykR3oB1YJ1472UfDrqAmzH/V3MnTbREu7RLMZhAG36T/SmZQqUI/BCdbxp0VztMLDkp8
         GofA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i+crjkCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si20238721ybi.149.2020.07.06.06.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 06:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i+crjkCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsQw1-0006he-U8
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsQvv-0006hV-8V
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 09:13:19 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsQvt-0008WO-HH
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 09:13:19 -0400
Received: by mail-oi1-x243.google.com with SMTP id y22so19332405oie.8
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2020 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fT/hLLdg2+88cLUyFSAOH1/RHevrdz3wUBOHtDQG24=;
 b=i+crjkCCZp/mK6e+6vPK4qh9VePJuVVMmDeftabgSXc3fLG/2enwse9ouVqsQzGdVQ
 71wAW/XlwdwdOx/KRCmPfLVYKu2Icw5rLMK3rPPoTJoCTM7o+CySuLG0PbYV3rCLqK0b
 1XpAs1PZdWE8aJjfXpg99UyNLILVn5ZXM25gkcEKF2BL70U5Ve+TstN19u2lDiqyrzhN
 QfDOy1q4cM9X0P8ZAq7X4nYjfjTHhkzNi8VmnjwmgBbZ2XJgWdNQbEZ56yQnBAu8Ejvk
 mKkvzbLiCGwJemffQTmuR7SYikQPS1LpzSUxEavYZ0sZ7CdJCX6o2C9iFVQIo3/NSjzV
 FwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fT/hLLdg2+88cLUyFSAOH1/RHevrdz3wUBOHtDQG24=;
 b=JIayhB+3OYiua0hfvDthjrUiKqjtU6iRPPL8/OjgAEFeg0Fh5nESrS8P3lavhH1Hog
 9iohGbZarbNM8vHnd117mPjxtZWM/6LaRUnptIsfaHXO/6A26If+GjFGfnQQgQdRNXpj
 KBVlJZUIth5Iy4VqzCWxiHb9/XK4FSpTvqLwXq4ORMz+tB/Dew0Rt/qcbUKiPofOL/jW
 rwjfcAuxnKErYOKEg3b7SdiHuT2jVqfGfi+GSt0w3eBzrYBFGfs9gdgX9eNJQ2YG3QzL
 tOroxn2w7X5lJ18mru+A4MrOQZrWInaPmd0Kmp7yS8HT5USoghsTiTJebTwFlwsZ9jEl
 s40A==
X-Gm-Message-State: AOAM530YTEx2oHYMKsvSE4qlzznYY86d1A0OEUMCpEuaefZp1gHbm2gE
 fSEUXobFT9nVwcdtZzth2vFb03nrrDH0jAfdbVO1jg==
X-Received: by 2002:aca:1706:: with SMTP id j6mr8745856oii.146.1594041196302; 
 Mon, 06 Jul 2020 06:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-4-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 14:13:05 +0100
Message-ID: <CAFEAcA809S_vB2wL0Ckhem4F16iFdmO7Vtak8tpRFFEKHToN_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] hw/arm/smmu: Introduce smmu_get_iotlb_key()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Tvmrcyftloy

On Thu, 2 Jul 2020 at 16:27, Eric Auger <eric.auger@redhat.com> wrote:
>
> Introduce the smmu_get_iotlb_key() helper and the
> SMMU_IOTLB_ASID() macro. Also move smmu_get_iotlb_key and
> smmu_iotlb_key_hash in the IOTLB related code section.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - creation
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
