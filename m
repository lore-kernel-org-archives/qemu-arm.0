Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp590706ocg;
        Fri, 7 Oct 2022 09:26:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6udcSKPMMBJDMWOKNXv8ZkwSAtSGT9Yxb42QWIoDJ9kjOk8fVLA0FyaA+Ry95pi6VAtO+R
X-Received: by 2002:a05:6214:1bc8:b0:4b1:b217:cce9 with SMTP id m8-20020a0562141bc800b004b1b217cce9mr4824357qvc.31.1665159975573;
        Fri, 07 Oct 2022 09:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665159975; cv=none;
        d=google.com; s=arc-20160816;
        b=nrSAopAGxKZvv3upJ6xe/ICJB1jR4G/p8rSBWSTzF1k+OXoEXEQBlqCWXRVLkeIJsg
         MV5VnAtjB0unxo7MQ+8bhHyxb89IjH/q8g/pXcWWK4Ugm2r8qpivhGu6ZObnIIWx4LpR
         +JFuMYo6AdI8gkWNBL6X5ror6F/os1iLv+JMbyCz1lH3uZvdLSVCGq++fOwQfGlHI0Xn
         SLL46NDv3h122dgBVi2zML63fSkBddrp63srDQjf9wAAo8OkDvrsESIoYdZjlUtTwsPy
         cjWlK9VA0a2ZHT4Uh9ZjvHDyCtI4wHpYGgv1f6Y+KIwyjCnw4wjc4u+61u+B6K5YHXeN
         WK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ebO80EGiEl1K01kjnElVpT7a/cmS7kvWbcW65J3edjg=;
        b=onldF5keHBTn/i+O1GX2gFSAgywMNlxLmwp6tOobEJI4yn0HBWDmpBp5PVRwP38M7N
         s9jkcOJ2ozf5bEYls/73E8SRy5Bu7PkpUnoc5zx7A2aBewfxNz8ZRyw6CfvXBX4mrdft
         XHrF+US7BJSw5L3rLxeJ7nzJhPwEIwcbcZ9/1D1P+iQdX2+oZ4eHrOSaid9uq07wuWoV
         +mWGHtaJAgYWtjMKEoycdK3sW8D8Wf7767YqxaZYPWvW5HUub9XnFUA2Iw5KmLuVPJam
         mpJua+nCNd14y6B5UX6BiT9VIdKJwBNg9qI/dbFPqNhTF2868v7j7vu69vkbN6PtG3nt
         Yl7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hV1xi/p6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl15-20020a05622a244f00b0035cb8515642si1365947qtb.579.2022.10.07.09.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 09:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hV1xi/p6";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogqAx-000513-5P
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 12:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpuB-0004QA-4I
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:08:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpu7-0005Vg-QD
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:08:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so7628931pjs.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ebO80EGiEl1K01kjnElVpT7a/cmS7kvWbcW65J3edjg=;
 b=hV1xi/p6QeWaQXvTJYffeuRt694Psrv6eguZepGMxW77/h4wikWSgCx8Lt/euT5EKq
 2ujgRu8HMwAxsjsJPxE+THSrVGHhNOEctuMhWewizRc4Kwm0ifeywmPiO69iDZ0iGQ7x
 gORXlKAJ+7JTZL77eHGTfUrcOss1viF+u1dp3Y7+NTCsoD4wM3uxFdLYRuwoZyFwLrP0
 8eyRs8KHF2EiQFTNRVmsDNBGIz/TkKTGyTg5FuHsfzRhphNowY0Kc8lBysu2uDcbfRMu
 srVPmOXz6RXiGx/NBfEWzH9icqa/QpPKQmh4oRN8x24ndFNV4jtkJE3mk9TH09nzWTK8
 ynpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ebO80EGiEl1K01kjnElVpT7a/cmS7kvWbcW65J3edjg=;
 b=XZx1tgDeaOJtHeDZMkj20DV4mzjDyDG6KDdRwCW6DWSN+d71WdrihLJsBKukRd4TM/
 j6GNe5zdj6R5g8CLL4pf4E5IVa3t49fb3I0iIBzGivvMEt/Yd8vZqYFYGka06wfsERyA
 Rt770/SSqAt0jyIA9FsMEBd21j/BvdzXDesB8t6035+IlMRCGdhfNgSzeb9WMcN/f2Cz
 EHKpIHpL5WvBs4gj8B3fMM44AJDNG2d2vXMRGXN3sqY/YbEkwFGcrEX88NwA6sps1/iy
 RLI46GNJbpYAtPkIHLIgUquZm3WsLtmsOoybovFOcMMQ3QFoEH8cDMtrzww8ruPD23J3
 6NTg==
X-Gm-Message-State: ACrzQf3I8glpypBSi+TxRcIv3yS0FGqNcUKdsp6Ylt8AqCB2PozxaNtR
 EL9S8wiaEnzyJATBFXOpZTCU8DCNCIZ4UF8YRS2iyA==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr5451213plb.60.1665158930414; Fri, 07
 Oct 2022 09:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-28-richard.henderson@linaro.org>
 <CAFEAcA9Vd6mwMf9-70vo=t_Yec+fPh3kM_jo7wn=oNi1+cvgkQ@mail.gmail.com>
 <92b19bab-1115-cbd2-40e9-45deaa14e857@linaro.org>
In-Reply-To: <92b19bab-1115-cbd2-40e9-45deaa14e857@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:08:39 +0100
Message-ID: <CAFEAcA_HHn_7zoF2pMfKM+rmFy4iPj3575V0u61d=z33geg43g@mail.gmail.com>
Subject: Re: [PATCH v3 27/42] target/arm: Use softmmu tlbs for page table
 walking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pM/9HZPVueyf

On Fri, 7 Oct 2022 at 16:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 02:01, Peter Maydell wrote:
> > The upcoming v8R support has its stage 2 attributes in the MAIR
> > format, so it might be a little awkward to assume the v8A-stage-2
> > format here rather than being able to add the "if !is_s2_format"
> > condition. I guess we'll deal with that when we get to it...
>
> Ah.  I had wondered whether it would be better to convert the result here, so that we
> always have the MAIR format.  I decided against it within the scope of this patch set
> because it meant that I kept the existing s1+s2 attribute merging logic unchanged.

Unfortunately, for A-profile you can't just convert the s2 attrs
to MAIR format, because their interpretation depends on the
s1 attr values in the FWB case. So you have to keep the s2
attrs as raw until they get to the point of combination.
(v8R doesn't have any equivalent of FWB.)

thanks
-- PMM
