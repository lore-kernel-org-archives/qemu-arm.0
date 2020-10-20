Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4698042lfa;
        Tue, 20 Oct 2020 04:30:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwvWLgqpEoaPOg6MHU7GVnNmLbB4PfX99dlCp6sImClME+sMjef76VbxDL57IfyZhMX5cL
X-Received: by 2002:a25:384c:: with SMTP id f73mr3032423yba.135.1603193446022;
        Tue, 20 Oct 2020 04:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603193446; cv=none;
        d=google.com; s=arc-20160816;
        b=jk04QPW3LH3nZdgLTXylOw7fCy1dTdm+WMGJ5J+njfnzar6z1m/JiOxaXKP9EmAo/8
         Hudnz9EQ0Al885hbfIOfrRzS8jtYirQaQn9Y+fVx8lSm2qd/lhpFZ9+wuXgkwtWt+VNp
         47vXTEKJrQdCdHIxMiSx1uvWT7cHX47nHXhOW2AiP3RlqS2gSkMBsZ5FZNxXKHPWNJlF
         +vENr+FeEsCz3hPjuu9o18KGG7r0v2dvHlOYiPgT7kHht6Uulb1yZjSx0nMoDaII0T59
         vO0fKN6N+aqJA3av80B+3Oy/z3+mLa1S1fUKIX3vlbjnfH/vhKPD2U/Mkil920cgq7fB
         gzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Pt+QhO+deaAVcVZrNp3M1mMZwIEtRPo3Vp3HQGR5eY8=;
        b=if8w87Na6nVtCgQ3RBYFUtCqerXrWJ3dmKe/ApGgUAAnHR1WBR69J+EVc/kKMpqbEh
         HQiGGkYPGuiytC0ekO9A15UJYxmCI2VrfikLSm44ABY6OHsQPiYedGtQBa6Bo86/dHvO
         o2/jLXXlmgOfsNpCWxTLro6HzEicHOa8Fi2bz4R9wo4VDNoy8Y6ovtA8GV3D7uR4x0ai
         9pjG6S7fxveq7+GTMez1lPc+/MKsFFOINQTliSau6XMki18gsKPK4CRJKYPeXR54Km7V
         J+aksXSKid5keoYIV3zDpTJWUJooxs+FblHGupP2ILK83lHcW9/NnWg0cNjRmMlfvcRe
         JEhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lwU7Q2Gg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si1437490ybl.60.2020.10.20.04.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 04:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lwU7Q2Gg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUpqm-0006JP-92
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 07:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUpoF-0004gs-EO
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 07:28:07 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:35032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUpoD-0001dS-PW
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 07:28:07 -0400
Received: by mail-ed1-x543.google.com with SMTP id cq12so1447806edb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pt+QhO+deaAVcVZrNp3M1mMZwIEtRPo3Vp3HQGR5eY8=;
 b=lwU7Q2GgHH+IKRFxMPqH/yVpPgaSdAlEHLJF3VNsdsFuUqui2ncY+vmYoUbTKT+EYV
 5vyZqcydTvdnv71nWwU6mg0kMJ29fdWsopWPV4V/oH+aDIX71mYGW1MExSi1KA/rD+DK
 np1R/vJl7xE9O8mw3ntQk6uSbqqdPuNCvas7Q0qL8VvvN7QSQRlP4h5N6arnAaxhMIp5
 8/s7Tb40RqLQS5K/mezN43x2VKDlz9/uY9UEMQE8x9lC72xSlM2A1VKLAu4TYzRreufZ
 z7Lzx7bfZLownavSkqT3aXMPoKJ6ASnP8rbUbUdc/sQoKKPc/J1R8e0To6NZ77RKMfRN
 c8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pt+QhO+deaAVcVZrNp3M1mMZwIEtRPo3Vp3HQGR5eY8=;
 b=T2XrXwlYhbF4Uoq1WAYGD5JluB9CpvC3y4Un+wUKbuYFjXfdVM/FVnsIXTJ1iP1Jxr
 EOCjGdWAI+EDlH7XcJfMlbNmvMLlOEjFIm+Ez5FeDMHQ6XPgr2lLs6HVS75OE04FnAf1
 EsfuGxuUv8BRSTqQtsxDjY1WZ4YWyX0PYfaZzQg4nRImBuj1Is4lH77U2fsn+mIKYJxU
 C8GilXzLCZZW6x45E117jNlPHGCwF9DCeYs2cpNPnlJGvrgrDFToDvEYVxM1jR5EV4lH
 ZWhSqnFXjTzkX7pQQRfMQ1Ftdn+o6bx123LhsbTI1LH/qiudB+ceGizW+elb9TRp/WpJ
 y1Fg==
X-Gm-Message-State: AOAM5329QvnfxPwaXLIMKNqXKOcZvNl02Mmq0kLjfdDa3kXesPdVlrT0
 Mpm2nTldcJk/4rFpwllBzI88ytRU7o013HNTa6T/TA==
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr2338027edb.100.1603193283909; 
 Tue, 20 Oct 2020 04:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
 <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
 <0c174303-50bc-128a-26ab-c062f98cd6cd@huawei.com>
In-Reply-To: <0c174303-50bc-128a-26ab-c062f98cd6cd@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 12:27:52 +0100
Message-ID: <CAFEAcA_AQ5V4ZrWYjCD3DcnUGFsA-HBDWsQZ=SAQh6hydoa-kw@mail.gmail.com>
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: Peng Liang <liangpeng10@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xiangyou Xie <xiexiangyou@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8r8guHJizQEo

On Tue, 20 Oct 2020 at 12:17, Peng Liang <liangpeng10@huawei.com> wrote:
>
> On 10/19/2020 6:35 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 10/19/20 11:34 AM, Peng Liang wrote:
> >> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
> >> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.
> >
> > It might be easy to add a Coccinelle script to avoid future errors.
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
>
> I tried to add a Coccinelle script to add VMSTATE_END_OF_LIST() to the
> end of VMStateDescription.fields.  For those who are not defined as
> compound literals, it works well.  However, I cannot make it work for
> those defined as compound literals.  And Julia doesn't think compound
> literals are supported currently[1].  So maybe currently it's hard to
> check the error using Coccinelle :(

I think we could probably significantly increase the chances that
people find "missing terminator" errors in the course of normal
debugging of their device if we made the terminator be something
other than "is field->name NULL". That condition is quite likely
to be satisfied by accident shortly after the real end-of-data
(because zeroes are easy to find in memory), whereas if the condition
is "field->flags is a magic number", for instance, then the chances of
it being satisfied by accident are very low, and so a simple "loop
through the field array until we find the end" is pretty likely to
hang/crash. (If we don't already have such a loop we might need to
add one in debug mode when a vmstate is registered.)

(This is why the REGINFO_SENTINEL used for Arm cpreg arrays is
not a simple all-zeroes value, incidentally.)

thanks
-- PMM
