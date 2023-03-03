Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1411633ejc;
        Fri, 3 Mar 2023 10:50:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/ohMAwlFWeqq2XZalVfAEmBvt3JRnuT/KMxXNpzOJsZyq7uxNvL4t2ApEJKVBiHtjRyUiv
X-Received: by 2002:a05:622a:38d:b0:3b9:c889:ec24 with SMTP id j13-20020a05622a038d00b003b9c889ec24mr4889313qtx.12.1677869457342;
        Fri, 03 Mar 2023 10:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869457; cv=none;
        d=google.com; s=arc-20160816;
        b=sIzJtBYH4ERt+7KwQnv4ZEPd66/EPihB30QMXrP0HV8FlwB6C/mYXXPcJtUoroNFi9
         lGrn6FxHJ8ZdZEC3yjzgPNHNMUNHS6QsQY+YY/yQWlxCXyUVWFGa7ZKLCcGwRBhXFMD4
         u2ZU6s9Tj4far2RCyAe/dwEt76rmXHX9mPRdkvmM5Rt68McHJuQ1t6qogNKGXIswHkRh
         TuMi2yYa42UbAzj5tId4XKBozwQWHFTVHWryltZXtsh5Vj5AEUasTXVDHmAbOegaThuM
         6OhbzRshE3Tqgjw+Z0F/9bK3tgh8eJ0fI4jmi9PjdUtkD6pOh2FJE+ckBQPcEhuGwR68
         RQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
        b=cBICpZoUDwPgYn4gcn7aJq2UJM2AjMHOBz4eH8YB+jtXMcwREWn38lWniiLcCUZ1RF
         5sk64nRo+/ZH6sp4SL43wj40+mnzjSOzlkRQfDSb466nft8KHogC4i0bkJDDDqfunUYy
         imWthj6UFhqj1hne0vcNjof4sd05o7HeV9sxZnuNplzpAx1yM8Be/CnQ+KVYRKvMq/QS
         s6f2OOvRGyP4x/njmqPVyQNiQ2y1/MRjipPN4Nu7C6dP0Rx5eZxNuxpyAGz4FbK3iNp0
         3tUYG4RdWcgGn0neeWy3PCoNEKXFosaykn0qavr7Hbtg7GEGRriC5PHNs47UIX3X9k1j
         FzpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k9MmJtlh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020a05622a110200b003b9e1a2624esi2299093qty.336.2023.03.03.10.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:50:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k9MmJtlh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAUW-0001Yz-Gj; Fri, 03 Mar 2023 13:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAUV-0001Yj-KW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:50:51 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAUU-0002L4-4J
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:50:51 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so3583222pjj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
 b=k9MmJtlhVO57bp+C8Bosmderp7rQxPt9Pk0n6UrZERM7iin6QwiwFJN5J+9hZjWHC+
 aSEvq4mlVdfAZn0Eb9kTDwMeIVbWMk2+LnYpk0BmDhcjkfayoO+fSPIwntkbeU/rwMvP
 Ky+eDPvbOOzjxYHKrVyn4vnoPSWhvn5TQa/Mexsb3XoDmsraZq4cgPJbxAkxKBlKDPNr
 ld1AxSnIcC3aiVMEo7HdNmOaZQNGmse3cj05fiscaLXqgJYnUCnkgEvlBQIUJVnKMRwW
 SC1QHXQoHYAvHr2uXznEa6AsZTSWiARccH06wKhxKYWgDn1Ew82IagiTPHo1wVlCn4Ok
 6JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869448;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3tedVeNjogK4knQjMdZiXbJqYYoMooAY0dZ0PwBr1fM=;
 b=0d5dQnIJdf75MEn1gGa+yoB+on/Uu2VeAo9ff8E98wxLNoP/fnkI9VcLuD4p2Ycyxk
 dRPtY9IbMQ7kBBTJqm75py/JtmntfrVA2zkmQqLPdAYYo/YUd/RNkVsI1DyOSKxIxYpe
 gn87sbNJWu58jbCdHytZ3OYCqu5kY4pE5qA8x3Z0MkobcSHfTernpwPsA3ge3Tf8JeCV
 H7P2POsLgVyLODiVPidCxcmLyXuqK87IQnBbMhR03uLX8O3WmgYjc4r138UrmzMyOITE
 ACG9n4dELR7JsMrFVZV0Ib4D2UTO01oMmgLKsfODSP/vR5+NgVANvnral//TNMZpskox
 mOqw==
X-Gm-Message-State: AO0yUKUcSIq3gXdiO+Qe/ZMjSDzg7pS/hWA4bP4pidAWM+iMclsfVe5a
 27jqYEDnFsOpYtUF71rDoyWt3qsKYFZ0ajmNcVA8Gw==
X-Received: by 2002:a17:903:258f:b0:19a:98ea:5ef1 with SMTP id
 jb15-20020a170903258f00b0019a98ea5ef1mr1067363plb.13.1677869448571; Fri, 03
 Mar 2023 10:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-55-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:50:37 +0000
Message-ID: <CAFEAcA8Wc1_kmgakVTtL0Xcut+fnFFqN1ttot05F7q0kcLioJw@mail.gmail.com>
Subject: Re: [PATCH v2 54/76] target/rx: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xz1thiWM8adf

On Mon, 27 Feb 2023 at 05:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
