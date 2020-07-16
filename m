Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1831132lfm;
        Thu, 16 Jul 2020 13:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUPanpUlatkAQCwy5hLf/R3JC0QhG5LZtKyIEkQYJGiGFVvCRTpQJnU8BlbtKEE+kpbCWA
X-Received: by 2002:a25:b7cd:: with SMTP id u13mr9051015ybj.362.1594933067828;
        Thu, 16 Jul 2020 13:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594933067; cv=none;
        d=google.com; s=arc-20160816;
        b=dpG3m5PfE2nwA2tcxQv04L1cVzpFdKPsC719XomzwFY0hTSkR6l+YlayuZojbldpzM
         DGxMgJwx3zJKQfXL2uJt8lNpbU+jHeGCtixjObTcSKTv9IC6aeZJmzydOmBA3V0LwssQ
         3xSDM1gGKAT12uFss3+SvN5O6gZU4ImOgJBPe3UiPNYxn6//8E2quyl/xx0CxqHFbk+4
         XoasDwrMVXwHUPCE5ptOJsvKMVAGxfPk5yhkR+zGIzM6ItoBcxqndmVX5kQNXIPHHJp1
         /dpu1IMMnEpoW313yIxyDkXpG8qPD2htubLlVRJHfli2WtSDgTJMUwDFdDH3bGDhJfGL
         Ybxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KaTxWEFwh8YfXI8KSxg7J1l0+flvZY2xPiPzQG9QEM8=;
        b=FFnn4PTGbK6RWyK+V1kJxV72J5EV7UY9p+67YApVltmZJOGvQyFA6h9gS2xQBYewoM
         rINXm/744hMO7KVdKoREtD8G8kBL/Zd+3jk1MDWJeosbi960687biUSOfG9QlEJthoAG
         QO4BOvvrdCcdw6o2GPuVUTc6AGBOtiXm2CFSQMj2tV0/I2HIXuNaBO04ltyoQHSebtFP
         7Xc80Ku7/Lw0nXV3eXjxvFJzZSauUQExrNyDZiCCkufCW8ogNrE2rh3A8tPWh31EiTRF
         4ZRVGUKouCRwCB1edsl9q9I+RLz9QCAu8efmOiaYoJH/Ww0mMo0Jr1QVMvbvFjD/hq4o
         9WDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=S3MXJtmC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si6605357ybe.484.2020.07.16.13.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 13:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=S3MXJtmC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwAwt-0001XC-8y
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 16:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwAvw-00011V-HZ
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 16:56:48 -0400
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwAvu-0000Ln-OT
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 16:56:48 -0400
Received: by mail-vk1-xa44.google.com with SMTP id h1so1637084vkn.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KaTxWEFwh8YfXI8KSxg7J1l0+flvZY2xPiPzQG9QEM8=;
 b=S3MXJtmCJIVmtNXryZSm7wuf5r5YkFHxZHttHyYYzH3MeJh3WtokxPap+d9wFrUFgZ
 mdp293ouPSm7y30wW3sV6IDAa8+OKXaobmMGm/49WrU4+oOpiqNETeQomAXnCmPMHGhl
 AT/sqhEodfo7trB56LXS5f+pdgsyIq4gdQyEqAMLTCYOcIm+T12qzl/zHLeueYrPlZ3t
 7r9AvVIlf0svxJQZU+xkp7646ERHoxgjLBDY4D8VPWg3Y/3YiYzWAIQ+EusmpFIRVvwT
 SYsJVfrQXKZmWGsG4T0jRHFQCt17CrvmCqWfVlf+qcg5FYKLkBL3u1AHkjMcNsYPK+QO
 Qsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KaTxWEFwh8YfXI8KSxg7J1l0+flvZY2xPiPzQG9QEM8=;
 b=KoXcBQwioUb9Umd8XgaSE4ol4oTdEbWYnGSGg2zowolRf0cBF2s5jlwVui7VKjBYkt
 GDX14TF/P2UdbnZzaZKVSW+HFR28i9CQnYxaRa3ikW5EkerxPEhMigqK+c25TcUB3rVM
 6Ur0Z+dfQ2sLmLwZm6Ld6wa5osDTaNa27rzgQxGn/FACQmQe0XuKcLpZkfM3jedoFT2o
 5FCBLRPfUvuDCNYzCeQQdBKij6maOQj4vjKRptVl7JB/OFrXDW//2p6b5xYPmoHpojAm
 Tnv3Y3o15Gpfju/hpW0dKUV10HyTMMD3B3pqBe5hY6GrYObrQHz7fr88XAN0+w3v1cZ6
 pNwQ==
X-Gm-Message-State: AOAM530XwXPhb1DTf/6T5dFgxtyMJG9rrg7aoD5gTgtsQNA5uKDEmRJy
 v/Lh90okkQkgk2fceb3fc+gun4TFPikDi2dp63Rubg==
X-Received: by 2002:a1f:38d2:: with SMTP id f201mr4830349vka.91.1594933004141; 
 Thu, 16 Jul 2020 13:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 <875zaq78xq.fsf@dusky.pond.sub.org>
 <19733456-a672-595d-e721-e0ef26d7f665@amsat.org>
 <87v9iq2hkv.fsf@dusky.pond.sub.org>
 <e87663cf-7cb2-ca6c-a751-e5c1cebc5440@amsat.org>
 <87pn8xywz2.fsf@dusky.pond.sub.org>
 <b3bc658f-a865-8e6b-c904-01c7724e89cc@amsat.org>
 <CAFQmdRa9FiP6yX=XDrJy5KpjifQyVkQiY6DXtSoJSvfoq7Vm6w@mail.gmail.com>
In-Reply-To: <CAFQmdRa9FiP6yX=XDrJy5KpjifQyVkQiY6DXtSoJSvfoq7Vm6w@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Thu, 16 Jul 2020 13:56:31 -0700
Message-ID: <CAFQmdRac6tsZafN3PsnLhPA_Ny032ZAjOFuXkmYvJ-ubjcpPPw@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Qemu-block <qemu-block@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a44;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbknzTGHAH2c

On Wed, Jul 15, 2020 at 1:54 PM Havard Skinnemoen
<hskinnemoen@google.com> wrote:
>
> On Wed, Jul 15, 2020 at 3:57 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > On 7/15/20 11:00 AM, Markus Armbruster wrote:
> > > Now my point.  Why first make up user configuration, then use that to
> > > create a BlockBackend, when you could just go ahead and create the
> > > BlockBackend?
> >
> > CLI issue mostly.
> >
> > We can solve it similarly to the recent "sdcard: Do not allow invalid S=
D
> > card sizes" patch:
> >
> >  if (!dinfo) {
> >      error_setg(errp, "Missing SPI flash drive");
> >      error_append_hint(errp, "You can use a dummy drive using:\n");
> >      error_append_hint(errp, "-drive if=3Dmtd,driver=3Dnull-co,"
> >                              "read-ones=3Don,size=3D64M\n);
> >      return;
> >  }
> >
> > having npcm7xx_connect_flash() taking an Error* argument,
> > and MachineClass::init() call it with &error_fatal.
>
> Erroring out if the user specifies a configuration that can't possibly
> boot sounds good to me. Better than trying to come up with defaults
> that are still not going to result in a bootable system.
>
> For testing recovery paths, I think it makes sense to explicitly
> specify a null device as you suggest.

Hmm, one problem. qom-test fails with

qemu-system-aarch64: Missing SPI flash drive
You can add a dummy drive using:
-drive if=3Dmtd,driver=3Dnull-co,read-zeroes=3Don,size=3D32M
Broken pipe
/usr/local/google/home/hskinnemoen/qemu/for-upstream/tests/qtest/libqtest.c=
:166:
kill_qemu() tried to terminate QEMU process but encountered exit
status 1 (expected 0)
ERROR qom-test - too few tests run (expected 68, got 7)

So it looks like we might need a different solution to this, unless we
want to make generic tests more machine-aware...
