Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4814721lfm;
        Mon, 6 Jul 2020 04:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKapy/WAGD2fealGWBskixmYOgzBEv9nYl319/WpVrHWzlGKhZ7u73MnE34e566tQYAg0p
X-Received: by 2002:a25:cc4e:: with SMTP id l75mr30481918ybf.165.1594035540221;
        Mon, 06 Jul 2020 04:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594035540; cv=none;
        d=google.com; s=arc-20160816;
        b=OgHc0wbE8+vBsnv4BkFmtDhNOpbSb24BDcPnmEIIWzKcpO4WvQ1AuQQexpavjXxcOS
         PTri/uFRPAHp9qMr0FxP4i00uUhUhMMVp+aIoCwjbEngqBubN2JAZZ5PyJXPwD11VBfI
         NswEWmnlQZrPVGTQiL++W8ZWsceayMy3/DgOkUoDOjPguTAkNbxh18lJ8xmI4vzE09d6
         WxqzkeJ//hQSW+Z47R3weL0S2PE1nox3drzUdc8eieyMef/uCw69PyHGurqXxvb721xu
         L8bzQ6JMlZZVJKqj9slnMTyGNrNI1awxI1jlf7/knbIdc0duzlnX/zILuzHENvasxoOq
         hQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kAjOy405mdzvOiXwIbBWwCtYghiu1SkzlY2tU/CuGr8=;
        b=dTdpYFk4557MtqYr6hSmhYEW06nScZ8tqJTC63H/cPTP1w/2as8W4XQoA7DpBklTI2
         zxc/PBxoNDWtsaPVI1mQjExXhLsJ7pqWGO5pC3wQAmtxus6+TRHggPx2YW/0iyqaTvPX
         cLacnhk5e3eF4gA6vviLIMrTVBjF0+J+c9clmJC1q183U6ZjiLLMfn9ZLXKAKuHL3O84
         tDp/Ckeme0SXkUbH7BcNitPetGH0hSguTk8o/+tRTrTh8qI4c3tPEBYF+ihv+4aBVXkq
         3u0ZlhqZJyhUlVosj+O7RyfCplyhb2pMuWKU1eksadLajBkzUv2p6V0ceU1DkuakP4k5
         Z8YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IOp7Q2zc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e132si19984561yba.459.2020.07.06.04.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 04:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IOp7Q2zc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsPSd-0007AO-Ha
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 07:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsPST-00076Z-7D
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 07:38:49 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:45340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsPSR-0002O8-9r
 for qemu-arm@nongnu.org; Mon, 06 Jul 2020 07:38:48 -0400
Received: by mail-il1-x143.google.com with SMTP id o3so15183996ilo.12
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2020 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kAjOy405mdzvOiXwIbBWwCtYghiu1SkzlY2tU/CuGr8=;
 b=IOp7Q2zcU2UXTXBkKne9A6A3vCCTT4/calpX1l6rd/MeiT6WbpxL1D2B4ohKyAwiV2
 XYDWwgNnxeQR43FLRxt7ukDiPKNwwyikW6spovqdw7CFIeoLuoz0mh1sU7uT4HhF7faI
 agwFqoww9dCj1rpuK8AZNgeBfLvBYurkWOYdR88L2322Nt5PHlxZNhg8JeKqOhmhaZyk
 aBe0Bt0Mp4qdsqGHOueOPeT6joGQTeyNDeT3blu6zBzP6MoE5Nxet1NiRY8RDcCVEdWs
 /D8NKwnAoeEcPKK3OcPabRi5FNvKdZlZLA4i4Kp4u46CR/o/F3XFYUvnh0WobFcfoMgG
 lKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kAjOy405mdzvOiXwIbBWwCtYghiu1SkzlY2tU/CuGr8=;
 b=a39fJUdn+iZEkp5miTCJyISf9P+D3kn9qdKmtbhgW3e9Y3RxWLGXgyhyCYgIeZtMuN
 IzQIRZw6VtVP8UHaAfzra1347g5VJ0YHtUyj3ElG6EWzvbOdi8EFOsXVsKDrpfR4gn7x
 9vuOg0058ArrYI005lRRRrACmBowVZtVNZ0S/BStbfMlwKoWgQ2Iy1MYJy0vh3UC1LiP
 C3WyW5z4QoQ9InKslRAUA1ASdlp4y4OLLj7ayfxmH1FJAVtAvKNVOe2xOjIH11C0JTGg
 V0r5hD/mE1dELGl+YMMlHLTmAR0akV9si9TontB9NYWMsw/L/CPet8Axr7EA1X/EL5hF
 TvMg==
X-Gm-Message-State: AOAM533YR+j4svBIP1ZkLgpS9B5OxznQiRlCZqDpNo4pkp4AndwZhPg0
 A0APAYoh0FKiIek83po2wImYPgMV9JJgsnLO6MrDPw==
X-Received: by 2002:a92:d3c7:: with SMTP id c7mr30315954ilh.292.1594035525479; 
 Mon, 06 Jul 2020 04:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200703200459.23294-1-f4bug@amsat.org>
In-Reply-To: <20200703200459.23294-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 12:38:34 +0100
Message-ID: <CAFEAcA93Ak+OBuUJ_tmevFB+-rsfQTxdXqSKNmvt_Wbg6Hr2fw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2836: Remove unused 'cpu_type' field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=peter.maydell@linaro.org; helo=mail-il1-x143.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/kmA23iD9oK

On Fri, 3 Jul 2020 at 21:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The 'cpu_type' has been moved from BCM283XState to BCM283XClass
> in commit 210f47840d, but we forgot to remove the old variable.
> Do it now.
>
> Fixes: 210f47840d ("hw/arm/bcm2836: Hardcode correct CPU type")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/bcm2836.h | 1 -
>  1 file changed, 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM
