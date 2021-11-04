Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp1369186lfv;
        Thu, 4 Nov 2021 13:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWbo3MD4xeIixZBrv3GePCBEr632CfochvNppyOWTAmkQoJnP7IQRwp0OT6LTfgpLChn9T
X-Received: by 2002:a05:6808:118a:: with SMTP id j10mr17990403oil.101.1636059038539;
        Thu, 04 Nov 2021 13:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636059038; cv=none;
        d=google.com; s=arc-20160816;
        b=Mak7JEiULvDj6zmxCtTW9OugF5ecLCrj8x0Mo2XWsdAImNOykb+zA2w4G7YnOoMHvr
         28B4p4elqB6jWumbfU2toz5IwLQJE7nDcWRycNaTxLbzHNYEnhNCq+R2RXThsuNY5Xuc
         SPiJwzafhPwI+LMN2HM3CYtFbEA1HNmrqwwjqk6Qd5/yExhryJ8h6uOJyRCXSP+1KzcQ
         EeJtBPukorZKqG30cOpRgwzS+VGZQ20+NhQHiITFXnKiheagEiowShEbsdlEZDbHhtEy
         JGll9jCI2bBaNlpwQy1zuQKePwNtbpER1PkTSfbDBiaPpIwpB89VznI7gDiZPiEAAB50
         SWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3DAnWFDJKL8MSUC6DiANPUVM9Jd5d//kKOBIw49u8Q=;
        b=ftYJLv6VfoPy0f9oN35zwQ9ZeNpP1aYsNJKzX/GetTB/xkGc+W7s1bKo8WOtG5SFoE
         UcwoT+0tQi0xCI9qSfU5JAbzaN0LncJWo0htgHRdETezWmGVYVTzs4TR5JSDhhzX+ZZF
         o8EocBIET+Wf3x/C5w17ouzxBE7gwmcYbcb2QmJ9IyfbV5MvXSAg7m+/0fCjX1WwbB2G
         P8PgT01/fH3a36v8m/jX53qsUa6RNGTeb06QGNm4qTMI6eDr384Zn9ANMYBADq1C191g
         sJ6QMJCWNEYrtwmVH/tTmUZDXpD4INl7J4WRaXm/xp+ggJ1EdLac0y1GDhAYSs/deXXf
         TREA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UKHm/5Y6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l206si7718310oif.57.2021.11.04.13.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Nov 2021 13:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="UKHm/5Y6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mijgz-0004Wb-T4
	for alex.bennee@linaro.org; Thu, 04 Nov 2021 16:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mijgp-0004WR-Qp
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 16:50:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mijgn-0001rA-PR
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 16:50:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id v127so5492193wme.5
 for <qemu-arm@nongnu.org>; Thu, 04 Nov 2021 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3DAnWFDJKL8MSUC6DiANPUVM9Jd5d//kKOBIw49u8Q=;
 b=UKHm/5Y6chDX6HV9JGjxLUcl7qFnMG4t1j+zNnYmv3UCBXQE/xgRPVOUu9JtBJwxa6
 OFiUmz/lrx0EIgNzGy4o0xhJ0rFGlS9aTwERrDvqyWvB8816qwnya/kma5gyMPbJAsZR
 /YP/Uq5bDdQyOjjOlgJnwaosGrUaBWO2fpZiC2s9UBMIQn6JYQ17qr7mbxnnUiefgIZ4
 /GuOI61raRLHMfvcymzQACoH9XzyqUfLguJJdOHTkENNDTIZ++IiDLm3O5HDX/dxcfJ4
 k9USa3c6hUZlNijBpzBp45PadbMm5VRT1jvBlvQRsN1+OEOFydM+K01JN8YcOP4/LL3f
 N/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3DAnWFDJKL8MSUC6DiANPUVM9Jd5d//kKOBIw49u8Q=;
 b=MhUj7LkmZs84mmiB00n583kHysUxTbaFJKJFcW383g/kov7xNUe6To4YkTCLxql9N9
 qAsfY4EHJWQx9WCHj23OR4ds+iT351wEBC0NzkFIYLtPXCaoLPsa257k3vW4HP16sm7V
 d5F3wlBgwmlPlGwJqoK2b2JUyO7Gw/POxKMpbCTno0gmZvyMZPPbyV0Ig6ANJ8hiHVzz
 HDHqg7SmuNc+wXrQO+Sp8oz9fwTWw15ajMpEUPMQ+s5mMXkAZn8MmZuHbBsAK2CQxmfN
 d6QacaR6Q1SPJq299qZP2sMfB7wQTH0NFT5//6Wc5Uc2vbiP2SUKJkBJPb0vOYV4Vbxm
 CE3Q==
X-Gm-Message-State: AOAM532rSN6s7YrPUx6AQ85YVHGkyYIpIk2glJEM5ixmpf9d71j8B+hB
 zj6xuB0D9T/HmcfMr6gbcSUSrVSvTl2+Z7WqIp0I4w==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr26050854wmj.133.1636059023100; 
 Thu, 04 Nov 2021 13:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-6-wuhaotsh@google.com>
 <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
 <CAGcCb13jV8r6nRspELZOai_HYJ4t6E1OfOYSx7-wCjaAX8Fodg@mail.gmail.com>
 <1567de73-332b-dcf6-9a8e-fea0cd071f9a@redhat.com>
 <CAGcCb11p1fg_WSRsYzaOE3kD_GUx_gf3KLmfrTFsrJKaiCMbaQ@mail.gmail.com>
In-Reply-To: <CAGcCb11p1fg_WSRsYzaOE3kD_GUx_gf3KLmfrTFsrJKaiCMbaQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 20:50:12 +0000
Message-ID: <CAFEAcA9uG7QD0RjsWoE9766Y0_=oy=BgBnW1TDq2Z3_sTvKaiw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPYPt6T8QgXo

On Wed, 3 Nov 2021 at 21:52, Hao Wu <wuhaotsh@google.com> wrote:
>
> Thanks for the comment. I'll upload a new version using IF_OTHER as discussed in that thread.
>
> I don't know if adding the assertion for type != IF_NONE is a good idea now so I didn't add that.
> If you think that's good I can add it as well.

We would have to fix the existing use of IF_NONE in the tree
before we could add an assert. (Awkward because it will
break commandlines for that existing use.)

-- PMM
