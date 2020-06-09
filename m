Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp317953lfc;
        Tue, 9 Jun 2020 02:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysS5/HssX4SFjDJZYYxgZb+/WfYl5W3rGLVtWp8gPjsmBhB16GJ3kGi2H8h5J4B7VwsKx/
X-Received: by 2002:a25:c904:: with SMTP id z4mr5158903ybf.338.1591695541208;
        Tue, 09 Jun 2020 02:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591695541; cv=none;
        d=google.com; s=arc-20160816;
        b=KDa9/N0tXOXib/5RlVGIr86rWX7qSRmlcOQJWWXQVeRf4kS/yMd8kXsDnRO5vBNseb
         59XYEfYhtpajtC4pPx0V7PexSHJCVoq90DhUZRNqBLp+NjukLSzCC9/gpw5Eotxt145S
         7Wq5DftzLKC6GJs3tlbuOJ5+II49Qtzqo3R05Q9lpR8v2Mte7GnOIc1sCNMwhrKKt6Sq
         MplDnBPfQ0gdl/onQeqF/OodACxK85+sRupfXHLfa4JkPoMIcxe5aE6LVLdbLQ83ZQfh
         sjHLjcEg4XF22TGmepfliulZDPu/pRb+B8AGjUm62H38L5kybVu/F8v/CXM/eFrmhhH3
         UjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uceSILUB8eUj+wn7zNiyYInUIlWMYM8o2B3VNA8F+Cg=;
        b=HdX1T2esxdKq62TSFj1XrvJ5ew4Lexy6yKeIT2wIUuEgLZJ9jO9UFqAswTeBiAecjo
         ypIjy8Ma/v4g9STH4aV6jx1anNTlihGYCnIkgI+wk/PhBCgOStfwMm0yidrXnXLn9+27
         XffLrRf2rHRtU4ovjltKsDXiGZhpFlVC7vZ/IvFfwzm5v/2HjS6BPiki+hpPzilOLtCU
         0xd9wG0yUMSR4YRdJz66dyBfRGvh3oAlcXm8m1mI4idgvEs5Dm+CHIo5eGsTOracrzqG
         o8pKJ5AmIbOC4cCEk4ZEMuGhYGl754KpCTcM3PwMMHjlJlEtDHiwdy5XQR4Nlk8G8tv+
         U6fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cw9Trb18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l143si2060211ybf.155.2020.06.09.02.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 02:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cw9Trb18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiaii-0001U3-Fq
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 05:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiaia-0001Tn-Lk
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 05:38:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiaiZ-00036G-Lj
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 05:38:52 -0400
Received: by mail-ot1-x341.google.com with SMTP id v13so16096110otp.4
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uceSILUB8eUj+wn7zNiyYInUIlWMYM8o2B3VNA8F+Cg=;
 b=Cw9Trb18SyrQAYmO6fk7kKcKu23/uVpD7j8mNuCsaeyab2RtrpflZbJHPXR9t1Ptn7
 VB/iOqC8D5BZchLjmbLm8n/cs0FzWixzFh9fjlJm7LEUkDdQQA6A258jE61eqpwSfhF4
 RzjwyUjChQh4EBsRnRfkdQdNyQfjEzEETa5pVrsci+ybonSX6fPRvGyKcCzNkd8mKSvr
 4zywtvg7+1zorkGbfj+KRQ3yvUJkuikyFTP2MNv63xaSjWyrR2jccGvTgVdhUqFYhrcC
 rWQ+oUbfS6/ejWbnUtjHilABrC0OYMvZG6XHAHCSM3/ou6cAPIeBDIbNYUN3eprZc41Y
 Wl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uceSILUB8eUj+wn7zNiyYInUIlWMYM8o2B3VNA8F+Cg=;
 b=fDMxik+hjcAxDsvbz4lyD6yo0OrXwbLXvJxxqpy41iUl2GeSSr+P96uA4tkbJO/DdU
 ZF2ItM7m+RoCHJddbNAXrr2rN3ZCLemKKTLufnBYPDVAxBxIYqzjtB6O5Sr/wXseuiSp
 zvBnW5myvFD4kCarIWoPKbEz2OI6+nqK3csJkkCHFZCTzKi2ipaDIhBgXbRAhrIDbnY4
 TZBD1Zsq5798tLbMs+cAMPlBcCSmBEvu13csdieBJLjTQmun8TjfawXsoL0sX5b9ogsI
 GUHkwdSf/xH217q+SW5Ueg/bEOGM0d0ietsi/TC7AJT29DVBlb6hM429tdor1LgfPu/3
 J0Mw==
X-Gm-Message-State: AOAM530RMjEnrJO7zOpcwUvEtx94SXAIp8l8C2Zx/ZxoSikNalfzjHGR
 OH2pslU1L0JWqkQkufWwC68dYIlk0rJoRRSUHqTwgg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr8281704otn.221.1591695530172; 
 Tue, 09 Jun 2020 02:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <CAFQmdRYYhoWu7q350n0vNOE+pesp-UG975v1f1Yjwf9Ao0mjcg@mail.gmail.com>
 <60521645-6e85-cc59-7048-94db9634ad0a@kaod.org>
In-Reply-To: <60521645-6e85-cc59-7048-94db9634ad0a@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2020 10:38:39 +0100
Message-ID: <CAFEAcA9ph6R1wmPps9BZ1aBvaiJ67AEVWN_URuYTKVCfCg1f5A@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 URIBL_SBL=1.623, URIBL_SBL_A=0.1 autolearn=_AUTOLEARN
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jL/BB2XlSEcX

On Tue, 9 Jun 2020 at 08:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The first series was nicely presented I think, but you can extend it in v=
2.
> Documentation needs an update in :
>
>   docs/system/target-arm.rst

To expand on that: the new boards should have at least some basic
documentation in a new docs/system/arm/something.rst (we have
one .rst file usually for each "family" of boards which are
similar enough to make sense to document as a group), which is
added to the toctree in target-arm.rst (note that it is supposed
to be kept in alpha-order-of-document-title-text). aspeed.rst should
give an idea of what ought to be documented: a basic summary of
what the machine is, what is supported, what is not implemented,
any machine options that the board has, that sort of thing.

thanks
-- PMM
