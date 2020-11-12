Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp544630lfb;
        Thu, 12 Nov 2020 07:35:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPtSEm80H8THoqukCb/BTSoZ/36UXYcjtRPLsWAehb0m9QbCiU/s1Bzx53reEA0CDXZF9x
X-Received: by 2002:a25:c6d5:: with SMTP id k204mr25308781ybf.363.1605195327245;
        Thu, 12 Nov 2020 07:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605195327; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhR7UDreCda/besaZIkMFDQ4Vg318NmSJIrE1/7vVK8IhGuzJiewSD7Ts5f+FYN+uf
         rtr+PZbHEZMMGwRbCql4UNVVgbAIm5t5fd5ejh+R7F5PF2LRn8Bl/G0bJn8Xbn6rEOS3
         j2b8K2YslI7fljLCTGp5DUIz7zAGdZbRo09rYLsJs9SbyRSX8XbPHq0p6OdNNm4YKbQH
         GtuRIjWUHvLu3Xef9zwOxNcTYcUCwJI16fn0p4+1FLT8v+QfaUSpeQyX2tgW66mBIEXW
         lbAk7F3VFPgB7FWwK16VX6Nv1ywFJNDcEpzskd2g5+DTXtpX9x/VXIKOO4g035wb6+r+
         SFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKoPeZwiLqIh4N7f5OVbuo6h/Zc0LfCvpFgOreWJoKw=;
        b=O++/UVQuR7/jovH0cL9gZmsj9OmPM7qxEvgYBb/QBfPCHzuHsQWraOjIuiQYDVq+lY
         asEzs8zeo3jBoqUoji3mIRRwkIR2NE/3buukKKoVbnbICX3Gd5sDN/qV8pdbRXVIRllW
         /FvE8uN6HdchnCac+ITJSkIjKAJtXaccjXUP3s2U+2vfYxelaSu24cAPuiHwOMjO+7N+
         4UUd/AXAFR2VH7Kwua7Ow7tQaVnsmd10bm0D+7PrXrGSkbjusbxFQf/weKKbxX3k+aMh
         OzfEjilyGCgphdIxTK6oAWIwZB9TTrSbNG/OsapMDSBIwEdsSDVowOrGYoUrgKuIORG5
         uH8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F9i5FzCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si5656435ybf.396.2020.11.12.07.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Nov 2020 07:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F9i5FzCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdEdC-0000tX-MH
	for alex.bennee@linaro.org; Thu, 12 Nov 2020 10:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEcQ-0000IJ-Rk
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 10:34:38 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEcP-0006wI-7D
 for qemu-arm@nongnu.org; Thu, 12 Nov 2020 10:34:38 -0500
Received: by mail-ej1-x642.google.com with SMTP id i19so8408434ejx.9
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2020 07:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OKoPeZwiLqIh4N7f5OVbuo6h/Zc0LfCvpFgOreWJoKw=;
 b=F9i5FzCvhdN38Bp08sn8S80LwKEkStrNpqiNB/CbxW/IGOEUitCq65JEbrWD2gdlZV
 hiGzRGuhdKu99HtakRXzJfAMHv5EGy2E6VQBXxLNXeZli7gINljH8iwJlXsDN28Twye1
 SY2iAcbYV+4TYswyvrENNjAjrsOMgLG7yBdmi7Ok4V4gTOymdk9/LwNFTEHefY2VI428
 PnBe2lkC96NJ+gaeAaRsxQNXt7RCZAEbNxwgOfusa/bmoaE+FcpuDwLWJU65FBNAStDY
 VLV1HWRVTGI69Pxpi4Yuqvy8LvlQiSRLhqvmJwsHf6xva/VTKZNDLWl263CdgKlnNNCe
 POQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OKoPeZwiLqIh4N7f5OVbuo6h/Zc0LfCvpFgOreWJoKw=;
 b=cZxwTYTxPUxxYEko6ox7zVNaH5Ik3ZnMjXeUFqiSnILJZaBw72U9MDDvXauPyY8oR2
 HCUNt8A9RkXen6Sn62frpI2q+S9I+Y+8IpXMPZQ1fixC2YFibla+ktX9+E4D+wGR2rwb
 sIivqqM1LQlp6Waq+GQUiNsU+KKMhesV7y/Br6+flWMi92IegEPrd08OkNwNKCKaqHe3
 raLBQ548oZ8DNeKSeQVc8aVFFxcM8/vosU4OGu39PS2Qh0asc+mKvFlhJBML/E2P8nkz
 7FfIrqFj53bCD2v8+l+Gf/xRO8zWSMdys8AbbiVBEv8pOpDsWzYSSkTWUtlRnfipcMjw
 YR2g==
X-Gm-Message-State: AOAM530g3ZmnyhX4yBLcDBYHKD4vYdsdduXiWhWs1CNqhJ2TWJiGGLcX
 QD1AjU5Z0OWO4vBCn0jlidibqNs3qjPFRwQKDPn4ZQ==
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr29810213ejb.85.1605195275707; 
 Thu, 12 Nov 2020 07:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20201111073651.72804-1-alex.chen@huawei.com>
In-Reply-To: <20201111073651.72804-1-alex.chen@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:34:24 +0000
Message-ID: <CAFEAcA_RL3otj-p+_eUXri-TNwrCqQv1ppHhY8X7BX5zpGVR-w@mail.gmail.com>
Subject: Re: [PATCH] exynos: Fix bad printf format specifiers
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: be9LCTURs7zV

On Wed, 11 Nov 2020 at 07:48, Alex Chen <alex.chen@huawei.com> wrote:
>
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/timer/exynos4210_mct.c | 4 ++--
>  hw/timer/exynos4210_pwm.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
