Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AF4D2ED10
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 01:57:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vijwZ-0006mN-JJ; Wed, 21 Jan 2026 20:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vijwY-0006lb-9z
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 20:57:06 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vijwW-0008EM-Nj
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 20:57:06 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-59b72a1e2f0so538795e87.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 17:57:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769047022; cv=none;
 d=google.com; s=arc-20240605;
 b=UM2nm0Cr+uEyq26MU68LouwuX9CrU4NRINR6mb+vM9R5+PrCvQtZW5TcP2Bz0TbL/J
 U2IwsGLWdZH0R7Jf66M03g9BDIY7M8aTse+AaqFcWNltPCzstj+toSsoYdyC2lLb+PpF
 5H91sg4myOqiu9y4Oz54X2h/Js3CuVFtv+Hvy7CaQBgePdTl2T15KF/tXSPOEoPLXiD1
 Q6qPaCzuI47MHwl+s9cqeWdrjP0pn1LF9Hbr8JsyrhyuC50H54XURiJPD9tR3Mi030NI
 93xtM2s0fHnx8ONyPyYsDtBYG01acvzl2uuGVEBU7KRxng6TtYLaqW2Qi+f8xENqeRNf
 VtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vkpk7pq3esGtWXbo5pS5jSpvXFYzcH1PyeC1ISOGftY=;
 fh=hjKUCI5kTEVgmb7/q9wTjCoZRUy0tO/FsTMZyJnaRTg=;
 b=iTiEKGAzcgwJezSEJXJnGFXa8Mv3m1QRVgBdZSAJ2IX6kVl2bs2nafLy/QJru4ZMpQ
 1ZL4s6grjwsl2e6Mqh+2+wKHl2VoaIHkGFvwdJx8Okmm4/+fzNwGr4GmxeeLWOzNwXOH
 IBVHuzf1k/iXCBs6tqD9yg4lvBV/y4FS8xODfSKg6qejPXl0OPV/AD3mBX1YP53OIgJ9
 9c207OtI0mxLsS4kEYK7JTqJjPjNyQfGb0T6KgyvEr3UJWL2kHRuck5qlyb4IMga28LP
 ZXOsRGX1866Y8OuQaq+H8CWq6UiivPTz1I9hga7fZJjh0zv0hQ76R5e4IzJqBQPtirpz
 msZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769047022; x=1769651822; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkpk7pq3esGtWXbo5pS5jSpvXFYzcH1PyeC1ISOGftY=;
 b=Ijc6N4M5gOHwMckZ8DwCSewkhlKbWUPfh0seFvZgIHLGKmAnzVkBDvDGZ2PRoKoZVP
 N3H0rfHOQ4raB/m8GqmdJooDWv3KVkZaRr1NVBDADbThIvLQMHry5TMcIda0Nf2ZiRcp
 BAgBnPou7a9AQNteXpLpTeRNte5o3IoUo4ZUQmrY9EAY7FypdyyOCBcQ/WiHIux9hsz5
 SFyse9H35Mqy14TUKO9MsdOZwqChZNpmvD9DYJLIvvrLyw7fEMr6yl7FOXDtNR4sTxf7
 3Llz6rCT7agK6w6amd0WDspGXoh/8GHYsVQuiIEHRBhn9qAm0uhDlP3G5WYkrwkFcCg2
 rDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769047022; x=1769651822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vkpk7pq3esGtWXbo5pS5jSpvXFYzcH1PyeC1ISOGftY=;
 b=YhEDCBvHhD0lxvjVsDEv3pWgMjJsP0BU5/KUokqfdnxDXZCIXjrRZDQP3SjDhSx9m7
 bkEU2BsZemtp/DREcZ/t4dyrckW+mQJPoHI6s6XsTa0dGqu7eBY9kUsVaVnROTh+cjxb
 QEPzBJtuU+GL9JFMofxeZz6BmKgwVb2gE9WmmCmnJmc4FnuHRixTe8C9/ffHuWZVh7YA
 5XoaA87Gb/N0k9XD+h5f+n6Q53NxpeFcGuI3CbOl4bruAhOWSKL+6flTN9n2qRN1huWL
 GwdG723K3KjY2Y0jZGvJBlS5+FvvGuaUiuJMiTXRIl3u/qPfPkRQVLHiF2QF05rgXoJ6
 iJTA==
X-Gm-Message-State: AOJu0YxCk7WynPUzm9rOd2LtNaGaf+QL/7G97XoNkp8Audv4zlzL+ym3
 P9/qA1OmZhs6yD/cRsUY/xEHBp2NU8phZHX224RtGBzajQRprR44nK52joDFdfliZFxVbqw/wGl
 jmkzWq6nrBlMOt4Y/HrmdWZGulJfaM9SLFcf3oEJ1GQ==
X-Gm-Gg: AZuq6aJurQcZi9CQ1uFIeAVwItySdc/Foz1JO5kd3I6UQvGSu1lTJ3cc2cOzSrNVJr/
 qVyQfTFlRNFvAmbuYlOhNbPukX+lcmcXxSskyOevznTuRC4Gnm2V4dahHzCRg9aHYFrgVX2gpzS
 cMtuVgLxrWRcCX08GNOc8OrHUuB6DS/JCDoNFOsVz6kNQFZieu0jucGoH+LHzx0kGamv+d5mbsW
 vaVLmaR7h5m9SzdrvLXqBUFqt9SHsdyC+W4NqmRj3NW2CcreVOdfYnDLMsYbW0KpB0s69RV
X-Received: by 2002:a05:6512:12ca:b0:59d:d799:b7a0 with SMTP id
 2adb3069b0e04-59dd799ba84mr412298e87.36.1769047021637; Wed, 21 Jan 2026
 17:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20260121175248.87649-1-skolothumtho@nvidia.com>
In-Reply-To: <20260121175248.87649-1-skolothumtho@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Thu, 22 Jan 2026 09:56:50 +0800
X-Gm-Features: AZwV_QiIi7rsl9-GyCN7J4E-LYjXFexVtzPMPuaGbmlle5snTHqoiqeRq16A9E8
Message-ID: <CABQgh9G7Msyuto_S2nQdn6GHMzmD6OwL1eQQ9E_2CD5shGim0w@mail.gmail.com>
Subject: Re: [PATCH v8 00/37] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com, 
 ddutile@redhat.com, berrange@redhat.com, clg@redhat.com, alex@shazbot.org, 
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com, 
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com, 
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x12b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 22 Jan 2026 at 01:55, Shameer Kolothum <skolothumtho@nvidia.com> wr=
ote:
>
> Hi,
>
> Changes since v7:
>  https://lore.kernel.org/qemu-devel/20260111195508.106943-1-skolothumtho@=
nvidia.com/
>  -Addressed comments and collected R-by and T-by tags. Thanks!.
>  -Rebased to latest master.
>  -Reworked PASID support patches (patch #34, #36).
>
> I think this series is in good shape now and mature enough for inclusion.
>
> Patch organization:
>
> 1=E2=80=9328: Enable accelerated SMMUv3 with features aligned to the defa=
ult QEMU
> SMMUv3 implementation, including IORT RMR-based MSI support.
>
> 29=E2=80=9331: Add user-configurable options for RIL, ATS, and OAS featur=
es.
>
> 32=E2=80=9337: Add PASID support, including required VFIO changes.
>
> Please take a look and let me know your feedback.
>
> Thanks,
> Shameer
>
> A complete branch can be found here,
> https://github.com/shamiali2008/qemu-master/tree/master-smmuv3-accel-v8-d=
mabuf-v4


Thanks Shameer

Retested ok
https://github.com/Linaro/qemu/tree/master-smmuv3-accel-v8

