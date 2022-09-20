Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1713146ejy;
        Tue, 20 Sep 2022 04:25:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SYXUJ/VGJslpqPGNCAUelPBS55OEkcrhqW28I49EBSRhX/XLfqbiPyVBOf3yrRssHteje
X-Received: by 2002:a05:620a:2495:b0:6ce:bbe6:5bb4 with SMTP id i21-20020a05620a249500b006cebbe65bb4mr16293028qkn.674.1663673144655;
        Tue, 20 Sep 2022 04:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663673144; cv=none;
        d=google.com; s=arc-20160816;
        b=He2D3HcK4MaIL+K1inPIMKdyoisqKvc3U6gARka37UkbR6fUOMde70ORDwyHFobxgL
         ofjJ0Rcn7gdBxzNQtqeQczs+NaAwgTcPu6F5Te6dUJiwTPejeAC0QoWR1OK3enhwSkxS
         ewSy7Wp2iMWKaWrcm6S00+Jh6tjNqycY2BR/DH2tjrPU3QlTtuyId5M3zV8tzcQ8kFC1
         DNONPav8uzfG8Mx4yvvzENtYu50NJ6tFSEWXlAezvyuIjTe8Oz5Sy0xrMjmTY8Uwk1gy
         Ss/zYllmn4Nqzisu1VgKRs7bY5AcNYHO9m5fMHI5NPmu7khprJrkXxpBzt+wcYyd0e7k
         JV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FARkd/geawKARyNW89YvFnsckZMn64TWLKArTQ/0GCM=;
        b=hJymSCOqGdFeo5RKnuEYHJL3natw8uYyQ2/NyedVpu4RuPAtUEPSsQn7V0l+VXEulS
         pVF5VvUFl/MTx/yVRepmPgckpRuUziKo28U3lI2mukFRdyseut90KP1MPcGdOGVxIdkR
         hOZ0U1oV+3ZHsNX8ljmEJOF03vroJaaLv+ZDIBdzcJaO6MMxQDimlZwycQv+oYwO5LOs
         sUV0EsuSXYAnjaarPapG+EjQGFsmvShYYMrR3RyEedxMPTgyP/U0tcyTqtnOgOHh953G
         rQZVkMFOspI7aZgzbZJ+ZyL+L2LmxsBTTAamlU4fuaOO4ADID2aIWQI9YhDIP/dyKSf5
         V0vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8O3VmR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg12-20020a056214252c00b004a52ecab76asi767420qvb.241.2022.09.20.04.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 04:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V8O3VmR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oabNo-0004ye-6q
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 07:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaQq-0004R3-Vj
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 06:24:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaQm-0002wm-3i
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 06:24:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e18so3155545edj.3
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=FARkd/geawKARyNW89YvFnsckZMn64TWLKArTQ/0GCM=;
 b=V8O3VmR7E52X/RPoNtb4WSt0h4CfNLsy07pyp9b34uzqymSv/Fnxv266TlOP5+mKo5
 sTalPLrhFz9x0Hiz0AFI5X32YSt48Zj5Ngc0LRcyGgD2+QWmYnBHmz4iW91awRFi6FCt
 VTuZLR0UO+WopDvfLMkgx9fuwq1VpivNR1PbT3QDL4BIgAcqYLHS01df1eF/NpIKEkC2
 3qtWDzO4VrgXstj75ozuRt8lntFnCsTqPnkXaN5Q4WMVXuTlcs3czU3mQWudHJ4H8STF
 doPAvd2W7iZMIH/X3R9jWWVoS94QOL7zz1SE6AOln+LsQO+dEjt0UeAMXXoDOAFRNkMV
 aNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FARkd/geawKARyNW89YvFnsckZMn64TWLKArTQ/0GCM=;
 b=28Qxrm80OciATVDzBUDTbclt4qPLKz+QcP9H8rKRW1U5uNboib17gL022o4ZBs3b4A
 N/bXdIziDT+BDscTdppNMWgrNCgsMcsXm0aAxPtSog/g19z3ChrhDtbzFQSqFIphw0ac
 o39p12CoQClCtKhqTsZ8xKeClbLA6cObQtDnG30VR7EuEfM9fbsRF4r2ypNbqaY4upN+
 Uer72/X2d5rBrg/MHVtLSsSk+QbOLzTFVEc4H2aLH/NX4PQ/u9InKN0WXFw27lFiCsN7
 OdlNQyx1r9RU+UZSd9wcjgy9OESul5AwNOUOo8JIEYnTOjs0yWCvNhffd0qlRuxX9w0O
 fUJg==
X-Gm-Message-State: ACrzQf2ai478CM8AbqCyqgG2geourGmV0Ekc1T80qsfLBF38ueS5RKYW
 iOIzTZ/VE6TxkbDsVZohbmIOBR+YlgfPnZhRQp+LsQ==
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr19729004edc.149.1663669481248; Tue, 20
 Sep 2022 03:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220914105058.2787404-1-chigot@adacore.com>
 <dbcca868-afee-2457-33ed-4d0274945c2b@linaro.org>
In-Reply-To: <dbcca868-afee-2457-33ed-4d0274945c2b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:24:29 +0100
Message-ID: <CAFEAcA-v30uCqKJT5mNCW72GJnxNVS6oUY0atfmbPR=nj_hC8Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix alignment for VLD4.32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: nNSY7WsZI0Rn

On Wed, 14 Sept 2022 at 14:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/14/22 11:50, Cl=C3=A9ment Chigot wrote:
> > When requested, the alignment for VLD4.32 is 8 and not 16.
> >
> > See ARM documentation about VLD4 encoding:
> >      ebytes =3D 1 << UInt(size);
> >      if size =3D=3D '10' then
> >          alignment =3D if a =3D=3D '0' then 1 else 8;
> >      else
> >          alignment =3D if a =3D=3D '0' then 1 else 4*ebytes;
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
