Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5474751lfc;
        Mon, 8 Jun 2020 15:15:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl92fnIglpORap9ZhEqWw3bc89uhk7a+mWvf9j7M7uR6/53zsoCmRtJhXPGBJz9cjQNtfd
X-Received: by 2002:a25:2488:: with SMTP id k130mr1410339ybk.241.1591654520579;
        Mon, 08 Jun 2020 15:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591654520; cv=none;
        d=google.com; s=arc-20160816;
        b=wC/TEO4liWNzpqZHIJGV0Kol+YrFxf04lBj04GNZnNM/gRPy7oJbiqUooJbks8cDeW
         g0b7rSfIV+lIhW5FPPOdxqajFYBQnEAKGjmysQXwKELJtLAcIeLQYR0iEQJBXpd89I2R
         Z99L3PEHX+M1SF3tHANA8Pfpk7yzPUY0HYLJTNlJ/3G6KSLiNuLhqGgV6kpSkt0twbis
         T9YXitedzPjhSvt7aQcDqM0zQbW7mSDOPMXZB+ighShMOC2S/MuUMDSHM7Ebz2EHfrzh
         Hq5DE4K9y2sDQvoJrEs0c+lJslOjiiwk3hJp1+FodYiU4SGfzaAlUumryMGdH411pgPo
         uNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gwtv4IjPm3W/47yWBHlgJMaTuoF3z9vgsEf55kpSKzk=;
        b=hnuCr9ZMVuw5czAot6spDHMpAoAZfhYJxtIlI68fbAJa88IssNywjkjzSlU/Du8A4F
         IcGeG13fMYTKKzP4crfp75+Rp1YW0zd3OaMIa1PytvOAv6hMnumyHZUHtho6bQ0DClWZ
         PIWgI4PzTesYnMh+cdruy8JGLWBGreK9sotxxivCrqEOd3HPjPiFzxU22QzLTsBNi6sF
         sd4/1mgPBX9WiOqMIuHW4jbMke6O3lmaCw1dO91+EKKEVz17fZh51kyKPnBtJMTtNFAo
         VpJ29h092xWKW8C4vSY23a1b4pm4QKI/OefK0gmlg9AB2XQOS39ZJjkmPyU/nHRqBmOu
         1V3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="l/DVRVbm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d142si648848ybh.180.2020.06.08.15.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 15:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="l/DVRVbm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiQ35-0001rX-Qf
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 18:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jiQ2v-0001r6-0D
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 18:15:09 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:34872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jiQ2t-0003ex-6M
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 18:15:08 -0400
Received: by mail-vs1-xe44.google.com with SMTP id t132so10518581vst.2
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 15:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwtv4IjPm3W/47yWBHlgJMaTuoF3z9vgsEf55kpSKzk=;
 b=l/DVRVbmsP0eL2ExJ9PFQZCWSmOGdmAz1pNg/olI0pooQ14iSHn7N1cobWsYq5O97r
 SkXZXbIjgtQlWncYrLxrIykFxQqWx10c1NKbKIchIp/uZ4lGRtyK4dk5WiGLHyWPq9xj
 mUgZQsajgkhYOA90Qb0HwoGigpXTSymwkJGuA8Shl+SQzDnsR0etGpYbukaJPtlLHRQ6
 Rjw/Y/US31Qb5cU4NEc4zqcU+UZmkrWsDkG0xlf5le0hz3ce+jtRa2ufpJzu9LBE3V1G
 3idfWENI+hzQg+Qk4VjztAkBH1aWgNmJsYDX5qNnPECuULUoetsJ6T5zEqkGcoLaIAqn
 q+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwtv4IjPm3W/47yWBHlgJMaTuoF3z9vgsEf55kpSKzk=;
 b=TzPMCow5BBKAg3d4SukHm+f+6tJMk/h/P0LW2hkIqAkmO3gVYTOSRzzHTm9Ap/sQfP
 44vywROLTXn8ykVutcsoB+bMo4kMsZoyj1vIGcka19KXYnfaSyHIORmo1HzsvrWOJNnY
 u98oI9ZnFp5jFrAwHvwrYMmo5ASDl7axP2aqvXrItkc5F1jaFDfFTOuLpTdoqBDSqvrA
 Y9kVWsc5oNWPA5Lo1f8dAoygpDorYBxGIfQT2xiPDPk4iPkNFB0T7msV/6kvwfWQ2r3w
 CJKFZyBUdEeyb78vib8da8Paw/HWzoy3Bw/eGHEuk5ZtS/XqHT6OezfpdT9pUh3P0rKl
 a+/g==
X-Gm-Message-State: AOAM533qTDauIqlFn7nqA/epmFeHyv4eHJSNVg4N9QP7ZVwKtZzuyn3W
 4gDK6dmZcRbOqnnDh9MXvjWIBqjDsbBcvZx63N5Cgg==
X-Received: by 2002:a05:6102:22ca:: with SMTP id
 a10mr749158vsh.152.1591654504367; 
 Mon, 08 Jun 2020 15:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-1-hskinnemoen@google.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Mon, 8 Jun 2020 15:14:53 -0700
Message-ID: <CAFQmdRYYhoWu7q350n0vNOE+pesp-UG975v1f1Yjwf9Ao0mjcg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="00000000000056fedb05a799f17c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e44;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovhLe5Sw/6L1

--00000000000056fedb05a799f17c
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 12:21 PM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to
> boot
> a minimal Linux kernel. This includes device models for:
>

Does anyone have comments on this series? I'm currently finishing up a
second patch series that adds flash support and a few other things so qemu
can boot a full OpenBMC flash image built for npcm7xx.

If you prefer, I can combine them both into one series and send it to the
list.

This series can be found here:
https://patchwork.kernel.org/project/qemu-devel/list/?series=291809

Thanks,

Havard

--00000000000056fedb05a799f17c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 21, 2020 at 12:21 PM Havard S=
kinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@google.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">This patch series models enough of the Nuvoto=
n NPCM730 and NPCM750 SoCs to boot<br>
a minimal Linux kernel. This includes device models for:<br></blockquote><d=
iv><br></div><div>Does anyone have comments on this series? I&#39;m current=
ly finishing up a second patch series that adds flash support and a few oth=
er things so qemu can boot a full OpenBMC flash image built for npcm7xx.</d=
iv><div><br></div><div>If you prefer, I can combine them both into one seri=
es and send it to the list.</div><div><br></div><div>This series can be fou=
nd here:=C2=A0<a href=3D"https://patchwork.kernel.org/project/qemu-devel/li=
st/?series=3D291809" class=3D"cremed">https://patchwork.kernel.org/project/=
qemu-devel/list/?series=3D291809</a></div><div><br></div><div>Thanks,</div>=
<div><br></div><div>Havard</div></div></div>

--00000000000056fedb05a799f17c--
