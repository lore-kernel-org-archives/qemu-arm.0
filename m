Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3536024lfk;
        Wed, 26 Jan 2022 10:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxblS3GS5UPg1cA39jxSOavEIL40xmnW9MT/KxftE94uageJ3DUcfdXt9L7q5pbyCsSuI6F
X-Received: by 2002:a37:a92:: with SMTP id 140mr11680877qkk.185.1643220755158;
        Wed, 26 Jan 2022 10:12:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643220755; cv=none;
        d=google.com; s=arc-20160816;
        b=YyUYT3lYhWBvq7mZycD2NpkSwhlz5/q7scIi69AfXZ6eIzwD0HtVAnaiMmn7nd6FQq
         ocvGx6+O4m4oGt3EJBoAndW7bmX0+IJn6wd3GP5+DDi+NhQttdyThDSG48xuQ0+Sp/EK
         bnSqlqm/dzf+zoWrTUdsVmhhTf24ZgdlZnjt5W8YN8Y5CZvVmBsNFjaDRq4RTe+uLzMH
         R4ttXCwfi4y92aDg1IJybefMPzxsQha5IdIpNxyaWEdX2uVYTgi/p7b+rdrhNHQhorAJ
         0kU+Oi8TvynNpBrA2QrrjtmEay6/1n1k3hHSQ/xp3pTT8vMTZVp5AbP9e34+7MpHfZsI
         7rPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21tbACb1290jtk1zPwZdgD7KgkQFiOrqL1EkpKtXJPk=;
        b=UjdTa/aUTcsIKQD0v5inlTDLsTOjQZ286jYlTtPGbKOmlE/ZiygzPIlbwan9dz0/9F
         BqWbfpgrM4FHUEcwTYthV3Bcs6hqLiqDUKT0qXjw2E9zG8H2e4vD/mmcoI+MOSdVRrCI
         KvAwkskJk3UJyOnIrvwktiui14X+m3cY1gBB5qQ4ogleWTMTrHeEHvMvcbSABVZ8WIZn
         b62ULyMxXgKskjpkf+Q4d52wdNrtd8JXjtPGttdo9kvk0zq4pqgIdBQhBOXN/tghKW7U
         xtmalnFJi69/yajNLbUoJzkh7kPFQSJxIEoFSfJbsJQY0n6sOwFv9/biEua0H7DkIeQT
         dS1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z83oa0bx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr10si1095414qvb.441.2022.01.26.10.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jan 2022 10:12:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z83oa0bx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCmmY-0006dj-Gk
	for alex.bennee@linaro.org; Wed, 26 Jan 2022 13:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCmeF-0007Bc-Am
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 13:03:59 -0500
Received: from [2a00:1450:4864:20::329] (port=53079
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCmeD-0001fG-B7
 for qemu-arm@nongnu.org; Wed, 26 Jan 2022 13:03:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id v123so220195wme.2
 for <qemu-arm@nongnu.org>; Wed, 26 Jan 2022 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=21tbACb1290jtk1zPwZdgD7KgkQFiOrqL1EkpKtXJPk=;
 b=Z83oa0bxNdElHZRS3ouXSWpwMboHgNeKu4ShewRPf1izAW153ZpWwQNiSK/dqgKlkI
 z5EXJIZGLMzNBhKqn5fbAZ0NvEuUYq2BGtZFkewVNMr6lr71X7p1lmkZ9f5t0y3PLZXJ
 f1bjsEX+0g54Ge7R8W6H7D5fmDuc5KiD+pEWSSfirGlvJTop6ghu6tDwCGFZprDo0Ge5
 SLc2uNwxx5T1nzALVztQ95GSe411dFaEHm8vpCdSrDQCSb0h9zn9E8AAbC5GExu8gkfg
 VbfZnzhuOYmfnIN/eAiJhetsWr6+jKi6yDz0WKlw14fkFLOoe1BpPX0Dw13biI9EbNcS
 KjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21tbACb1290jtk1zPwZdgD7KgkQFiOrqL1EkpKtXJPk=;
 b=mY/YXjr6Wa/d97iq9ax3mbPzaxDm0/jOhq5oDgDdV++yOLS4Hhf5jzkJs14K1T8Lm/
 q2GQWWp+D0aEL7HEwNzojSP+L7CJwV/g+8dY5SjGyIYpMYixZQpieNX+TRiC2U/9Rro4
 rLaH2S6nNMIs7AWzuzz/bkcSy5zdWCv6l4u7IcHJNyjiFIk20iwkPtBwui7kLpWup0gC
 zTCbg6Ed1N4kC1QojI0V3LkGt23TK3UI3O0WMNwzZStU14cH88VdXJRm65UmmD69xubA
 jSDS6hwBkCA1+KLtUqcdtonUKolS1ZMIdUKB4s9DWRufDwfQ4lKkTxZQdGUYwhkbNuZV
 8uuw==
X-Gm-Message-State: AOAM5320D2t/L0id/ZsShh9CYU83+gvmlYZ0lf5NqQ/vyw1VUQu9yH2F
 0Le0vs4HVWMYWYc70wHbajQyeFOKFqF0n+LyQ8lcxg==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr95861wme.32.1643220235208;
 Wed, 26 Jan 2022 10:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
 <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
In-Reply-To: <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Jan 2022 18:03:44 +0000
Message-ID: <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, Patrick Venture <venture@google.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fawznSVEe90t

On Wed, 26 Jan 2022 at 17:12, Chris Rauer <crauer@google.com> wrote:
>
>> I need to see a pretty strong justification for why we should be
>> adding new kinds of devices to the virt machine,
>
> The designware i2c controller is a very common controller on many
>  ARM SoCs.  It has device tree bindings and ACPI bindings which
> makes it ideal for this platform.

No, I mean, why do we need an i2c controller on the virt
board at all ?

> >Forgot to mention, but my prefered approach for providing
> >an i2c controller on the virt board would be to have a
> >PCI i2c controller: that way users who do need it can plug it
> >in with a -device command line option, and users who don't
> >need it never have to worry about it.

> > (We seem to have an ICH9-SMB PCI device already; I have no idea if it's suitable.)
> I didn't find that device suitable because it is part of the Intel
> Southbridge, which may have some Intel platform quirks, and
> we don't need all the things in that IO hub.

That's a pity. Is there a different PCI I2C controller we could model ?

thanks
-- PMM
