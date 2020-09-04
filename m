Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1575533lfc;
        Fri, 4 Sep 2020 09:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0K9NJFsmGNBEGmawCwqHlcBGyawubutTBWD0Avs5D0utypJbngR/QBRx1od/pL93KdxyY
X-Received: by 2002:a1f:1c13:: with SMTP id c19mr5836557vkc.81.1599235695469;
        Fri, 04 Sep 2020 09:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599235695; cv=none;
        d=google.com; s=arc-20160816;
        b=y0bh9d5G1+Ki6BntMyX3vygmiQrOXOM2RzCPVTxGqbhT/33Iw12Ans1Xc9MdYEiFuG
         lctYPk4XTxrJf1OVG1ZXjyh1xSROzvwO+NNESw+ybH+qNjcdazIwhdrC71ftwqhyb5e5
         wsWo2L+P5A7c889hHtoXG5JOtLMyjXvmjWwdyp7quv6LD2RqYqWY1mNXc+9BFIrVZt9e
         8hElHbBtMiFswynf71Kt2Ejgn8TqWDhClKE9BPaqCRdukGwu5X8Qi7G6E8xuRH0i6las
         L8K1Sm1pdvpKrz2Vklt1bSWX4jaXUizkX34xVgjZ4LMnfVgDxdZIdyDZ/y8cgBLPTYtg
         94MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BmqhTmNJ6ObjaaWvIsaHhotNeVlbuyYbxnOSGt97p+M=;
        b=XUHKNZHPaERKPT8iz8sEWKPUe9iXorbXCBA40bLCRNe4L5s5jqEJkChtKeRhQoQXuL
         fD/ZD7B4V30aSUKKjkC+aU2rmkMZsMfzMfbO/YejE8jFMLzg2iCQYPDti4a46I3PGOFy
         rLCHXfoLLeR4NILDUqYhI19dJrdBURlSVwmW8C29pQK0cHe9ghfxChW+pD3jRm55fcNg
         5Y9y0RgNrHHTJTLtxWulkldVEzGdORiFnKlz1hj9je3ktI+LYFyx3h/As7BEU2sSh6Nj
         M75KX5adirAMB40gycGp9oSDest/qN88EOIfhHobFVx53Vm8kLVuvr9vjDmvFO1sfrmR
         V35w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZP6l6A3W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si1658364vso.79.2020.09.04.09.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 09:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZP6l6A3W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEEG6-0005lW-Pp
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 12:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEEF0-0004L2-2r
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 12:07:06 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kEEEx-0003Ce-KP
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 12:07:05 -0400
Received: by mail-ed1-x542.google.com with SMTP id l17so6597407edq.12
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BmqhTmNJ6ObjaaWvIsaHhotNeVlbuyYbxnOSGt97p+M=;
 b=ZP6l6A3WPQMWVEPI3sPyitBUfj9ex8VUo0aMBLGW3JTISiLrFSLV4/0doM0vF05ZYq
 6FItRu5jirdI8QBkCZP5aVYQutRFzKei5ag0TI2+IIDPVCdfn7GRF7tnB9iSVwizoLPo
 DGmmH0YSm7Sb3oIWK9AZuEDfM+Z8ygnYGwtr1qz6us6hYjMtDBTiLBxsm3DM2PAHKkZj
 K7131/ilyJ+bDtPK+yHeNw1GFLtwkevsHOerUCRJTkPLMkerRW7KDIsthuKaPPHeZZwn
 o/ZDNLkvWvqapAqArzcsd5BRBCHGJ2Ji40juBDdAuiumi/DzzQYuM3+4QG5kWJ69D9ti
 rCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BmqhTmNJ6ObjaaWvIsaHhotNeVlbuyYbxnOSGt97p+M=;
 b=KHMl/T/z3HcYLOWqQUvns5Q0m8k1Tij2u9WGc+oPiMy+zTmdPvLa6fkh9Y/0Uaegbb
 pLCrtd+TyQ/8+uP1wRGangEYYE4XzuqHAT/eXlCTMkzIeDf68n76u9O0tnoJ14+OPnKY
 BY0NhldzPQ2oj6fDKHOMlRhKEKw4iw0LUTkjUwDuKkVPCbDMEKrZhk519AC8Q8esx+25
 45W7nigeHkA1EWlXgytbQk6JVrdKB8w3qlMKFTFqG32iu11KXxne6SMh/COvGtkrCwFa
 rWPL4d5zZDJp5sxa6pEAtBXHz+yMvsjxpy/IpnO4EUV5RBAJEEF9/smh8Q9HwRpSilxC
 waGg==
X-Gm-Message-State: AOAM531XDfMitEDOK4MCPCCtPSUhYim66KRt/hG79e8rjxdEhtCRpXu8
 SZJKNgJEDeDAs1wbI2XbpblHWidx7xMrrF83bIkrNQ==
X-Received: by 2002:a05:6402:1495:: with SMTP id
 e21mr9004924edv.146.1599235621736; 
 Fri, 04 Sep 2020 09:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154156.31943-1-peter.maydell@linaro.org>
 <20200904154156.31943-3-peter.maydell@linaro.org>
 <11457fd8-725f-5836-e2ef-6c60aee344e5@redhat.com>
In-Reply-To: <11457fd8-725f-5836-e2ef-6c60aee344e5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Sep 2020 17:06:50 +0100
Message-ID: <CAFEAcA8+CSam2MENNiyafV7FkO2zmg4pb5D9Lv1gGjg_oxjzOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Remove no-longer-reachable 32-bit KVM code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KUs+p93nboP5

On Fri, 4 Sep 2020 at 17:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Scary :) This is the if {} else {} removed, OK.

Mmm. It would be nice if there was a patch syntax for
"indent or dedent lines X to Y by N spaces", but I guess
we're several decades too late to add such things.

thanks
-- PMM
