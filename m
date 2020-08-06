Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1601926lfy;
        Thu, 6 Aug 2020 05:55:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyydxcryK5OV3tG7oQiUaReodITIhsZWY/vcwooNPEVAMVYUcKGrvDKNkoV1jt/KpExswGS
X-Received: by 2002:a25:5d7:: with SMTP id 206mr13002238ybf.512.1596718512224;
        Thu, 06 Aug 2020 05:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596718512; cv=none;
        d=google.com; s=arc-20160816;
        b=x4yUQC8hqb0iY8QSxS5biEIif9acrSP2pIlZU/C+/APCi1FmfDWl7LQ2NEVHuumHHt
         i6C7YUTLJYlGe68UIU7bLxtViAdqKMxakSOfX6wGHcyK7LQwEhH8KoyuyzRF2UJk3uE7
         h9N22VJzWXEymrc8+VBQatn36aMANy++szq90gXtxBxWOUq1LYZqmufXLgVwXY2m5E6a
         uOmFj/ZySHdOSgMh34+8HlrRCDFjfHcpnWq5U5RgN64RO9XWO00ghvyXrmewkoj9XCwi
         8KIPj1zMHMRBpbV56tfqEC02hZi11AwKmv5WF1JYR3hX9ObVurE8QAQMrpFQxqeo+7zX
         NdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Xv9JbfgdSPkznTm3rAcpGMr/8FgBsek9LRQfnOTdiAM=;
        b=MMLyG79vSBqU8aDpFbf/d4s+rZUmYeRNEFtwPyNjpLZvz5hK3z/0t/vMU+MvH+aldl
         kI47VwnfE0/UOg8V4JadodmgVvb8caqSctMsI4qGLaoSDKXW7o+HlKCdVOTTO0L4I2Sy
         l1PNXW/cJgzMTpD6627AD3mKYpmG+uzJ7/iBoAPaSkluv7wTNAMorjlK8nYxS7rSLD2Z
         A7AExGKO6WlVz6B9/iwIftAgh91bm5mQAJLG6CwK4jYOBQ7XQNCrJqXpVxHWdPZcAW89
         fgCHrMIkH8XG3R1hMok8pDAUfJdOEQU1rtoapfMOXil1da0D3d/kTHju40PsY+zUSw3o
         jfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ytShs9Jk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si4973803ybj.52.2020.08.06.05.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 05:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ytShs9Jk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fQN-0004ha-FG
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 08:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fQG-0004gK-3Y
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 08:55:04 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3fQE-00060S-HC
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 08:55:03 -0400
Received: by mail-ot1-x341.google.com with SMTP id h22so6823996otq.11
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xv9JbfgdSPkznTm3rAcpGMr/8FgBsek9LRQfnOTdiAM=;
 b=ytShs9Jk4kW+kwi9e0nJcyUUl6HzRKro8BdXzQ+vrP8pI2DV1cL7mPVmybv0rzcYTW
 g7t8B33HWxeTf38JOQV3EyGGjQzANGgcBWJOO8AqgWRU/+z3lWftSHsaO+VEIgk985mm
 j2nePhhGMMQAUG8GTqmBxNJbCppdAc/mV51kvuFuRRFcJisu842uPCSpsFHvxOSKjJgr
 z7rN1tuKsvAkxazLgUeLkz7V/6XNtNgHr9MM/CMyWt1rM+iW1HEZJqdCMO6hKWt8Y4Lz
 TUIDpRpMLGOnhcC2JJGFGeFbMyn2mY9CIhklROBgzAdUDGap2YSSB276XNsCv4VhZsve
 LXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xv9JbfgdSPkznTm3rAcpGMr/8FgBsek9LRQfnOTdiAM=;
 b=SBWOThPVk+JOTOgvI8Q5a1UefPBMAOfOE8FRNScaR+OMrqPiTdrrz8FO4G2nXAlk81
 mCVqXdFKmIpOVT7Y9I7dPZe22WL4a1b06g4EQ4L/nkM9mJy60YwXYVBw2xLYct/4j3Cv
 ACwv77VmbopltgRUKca7+Txs35YlDxYiAAW9mJGinUkSHjpcrK2xkmTI5QGDDBaSOHNS
 XtRK56k5qmFZLL+sF7EALJBzrZRI5x0gWPoDYpAZ3qXNAGlzhr+mL5YsvPdjpFDOfbA5
 OqFhiyz8UCt/4sTRBXhw+aoDU4//vduIYdppVPsjNHAKFTv1+RpOzaXSW0Lj0upBVCCU
 ENxQ==
X-Gm-Message-State: AOAM533pnZB50LIiQ+IqtT9KWqjwvvanl+XODm0loQ7IgNFISv8TLzz4
 8P/xsR0bpScRZqXDW7zgz9IA0xLHPXz7iLZVIQCyuQ==
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr992915otq.221.1596718501383; 
 Thu, 06 Aug 2020 05:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200715173418.186-1-erik.lucas.smit@gmail.com>
 <b3c8ef39-5a1e-c49d-6ab8-342f42be088c@kaod.org>
 <CAFEAcA9H633W4eDsXJ40o0pAje6t103MaKjkaSqrW2BHLmaP7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9H633W4eDsXJ40o0pAje6t103MaKjkaSqrW2BHLmaP7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Aug 2020 13:54:50 +0100
Message-ID: <CAFEAcA_j2_TqLfizv8VgrLwtx14LCLvM2pzXuo1Pky4HgQxjCg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/aspeed: Add board model for Supermicro X11 BMC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, erik-smit <erik.lucas.smit@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: erWCGnkaDY4K

On Thu, 16 Jul 2020 at 15:07, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 16 Jul 2020 at 07:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > On 7/15/20 7:34 PM, erik-smit wrote:
> > > Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
> >
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks; I've put this in my list of patches to put in
> via target-arm.next once 5.1 is released. If I seem to
> have forgotten about it please ping me once 5.1 is out.



Applied to target-arm.next for 5.2, thanks.

-- PMM
