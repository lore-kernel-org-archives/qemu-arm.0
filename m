Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1179862lfm;
        Thu, 25 Jun 2020 04:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbcGXoy5RZYJouuPKsH2pXhk1H1b1kQMdEpmCD5wLtJznPkNHw7VEHEgouyv1E457f7ixh
X-Received: by 2002:a5b:143:: with SMTP id c3mr45950679ybp.168.1593083359820;
        Thu, 25 Jun 2020 04:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593083359; cv=none;
        d=google.com; s=arc-20160816;
        b=TfXo4FKpTibyesHIqhoAo3Vb6i20sHEix1IrXxudnVI7GkbCPEXvwtn7drslWsPG8O
         7T0XMFwXj6vbrcGfWOJI8KYjQ+igeGBV75SP9qDU90tg7vKb2hCJcZL520/3GgHXA9UL
         PRMBHb7BLYvmb9egdrMbmN+erO7jOxs0h0Iw7er97Vr41a/HbTkTh4btyk2U3e0js8ix
         f3i/9Z2j3EfGR3j2WQoQBGUJy4o8t7dVHlLvlyTDr6DqVuu88Uomelqzxdi34WBNDpJK
         MMURu7kZbj3SC4ce52yz7pgnuMsM6BBWLnP6IXsV+VGFWN58SCGedz/hE6OYPA2ukgmh
         dEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3wbqJep8gHiXx2HxZz4ctfBh3m5wAf+QVL3Jo1vi9Q=;
        b=fMqHIxtnOWyVI6ttDmAabVel9j4ceatS3iaeNZ7Dv2MlbmynXEbkGtvS+GgNgkvYRE
         2ojn9rufWtOYQzKLat2trHb9VDxv4h+CuOaLYjq6OPT5ibsZwzQlFOo1unQs6V0lhJYO
         piEngYewPl/CWFQQACMuj4Z5ayDlUmNpMzHYfQBiCKOCBe6oai/KJe/c0GNKFdnNS6yg
         OGLQd52MuPvK9hwjCv84R46yHGN7ML7JMWXA2yDYcc5bjH1mJYoGVdEQ+8CN0WNvm4Wp
         q8JNdE3/85kyaioLB3ChkSS1afe2vsQK7eFIJBpFPSQQ2OCEvMkpZ/Hyz0QP5U7ZEGOC
         /U8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ubx9fhzs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si7298821ybk.163.2020.06.25.04.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 04:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ubx9fhzs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joPkt-000472-7S
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 07:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPjS-0002k3-Td
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:07:51 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPjR-0005Sh-E8
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:07:50 -0400
Received: by mail-oi1-x241.google.com with SMTP id a21so4580567oic.8
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3wbqJep8gHiXx2HxZz4ctfBh3m5wAf+QVL3Jo1vi9Q=;
 b=ubx9fhzsnw07ZVDr2q8BHMzDcmTvNjydOzFwquXbjyOPl+ta08A95qAq5+ykNo42TN
 OFlCrEmc/Z8IDHDs2XERuRPbjcQDcu1UIS8YPwPXqxJrMcXTaqcEZrZ6lhQckoL1UOyK
 ADEp9Df/+N534TuIhWFNwM6rrvIUGoJcoWqnYtWa5B7z1KZrZ+Yc7eXo/1B1vcqZEiI9
 u5z5/KYzS6vC0PC5FpRGGclGH68e6C3oZw1IIY8fVbHYDMmcJDXthhAUVhcGrAkiG+p/
 cPIugWAJZYduxxbyws/Xk+4T2nSeCycaFJlbYDPtCURsf7kzuM+plT6KF3yDDop8OXoa
 LX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3wbqJep8gHiXx2HxZz4ctfBh3m5wAf+QVL3Jo1vi9Q=;
 b=GKK8JEjjc617z4IKO/Gqen3WIBNJkqLu3kitecA0EKOi6vr3S4EIjkfAHRDbKUnZKI
 GLMXJZEjXB5b2qGOS9E/r3UIw0BZFJFs8VEAYGqZZLhQyx3WJ08Llr99SFL3gTXpGXuJ
 DvwqJXezt3epVjEPXnjYMvzdAFjEGrT3R9f60Gn/iKsDwbY2MYCoH29/ceZzQD+1UFXN
 gOuQx9KRKHp5myeQ8/Zep/70asATYq+1GkmqM97DRa377w8PbaJi2jLLjXttGx4xmANu
 h1FR0bTsLQoL23/IholU0pFQ2SEByfyk9Rtp/lo4YAKFaRjDEXrATQ9STRJD/u+6pFKy
 7R+Q==
X-Gm-Message-State: AOAM530fcvp61hVWOBaDn85zToVsHkOZsO9bdBE4YC8ChtXW5Ex7vMlR
 NPHo5+RKIWZWy900hBlt4yBVJw4LorPI3/GbiyVGQQ==
X-Received: by 2002:a54:4694:: with SMTP id k20mr1635876oic.146.1593083266822; 
 Thu, 25 Jun 2020 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-30-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 12:07:35 +0100
Message-ID: <CAFEAcA972PpX2CR1iFzmEc0XEsOgjLs8JhFC-J=CgwU4nRUruQ@mail.gmail.com>
Subject: Re: [PATCH v8 29/45] target/arm: Use mte_checkN for sve unpredicated
 stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ggKXDoCMIghR

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v8: Drop the out-of-line helper (pmm).
> ---
>  target/arm/translate-sve.c | 61 +++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 28 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
