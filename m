Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp429772lfg;
        Thu, 4 Aug 2022 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4htpvIOK/aDpFj3fm2S/Wq4v1WSa7dEYDg81JOAYki2FcVNJ0TzUwKZn5gTy3wMXj19bHG
X-Received: by 2002:a05:6214:2625:b0:474:742b:a59e with SMTP id gv5-20020a056214262500b00474742ba59emr1817353qvb.126.1659625019933;
        Thu, 04 Aug 2022 07:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659625019; cv=none;
        d=google.com; s=arc-20160816;
        b=fNFvNexrTapzfv4sf5FYmLkBN9tlqELxOwpRwhyA05mWAIe4Kn8oLJYZKtAoNilsMh
         8CbuSzdZteWI+UH+30r6yjqMvR0A09hRKDtpbACDrVa2MQ+LWwedB/m3q0w7c+ScgDZ/
         QyhaAXRfYYd+kgBCQgbfr/4b9mitCq7vVEchYFUKzpiH072x7ZmNXLnNpjnj/9QIWvoL
         F5hS49FzhcBUXYEx0fIIna226k1vm9Txkcv4IjZ+hAejqjg9C+qQIKG9e+UZA2ld7Ns/
         bUimsSde0rDy3vzODC1PXrbi3ovF9Y6DFSdZyWJHtz75c//LohL9qYD2SrjF4cpDilwM
         8gSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=3ggKv28E2L0L6K7L+gbW8rAA6Ey9l9IxtjHH+OWAnuc=;
        b=APXR9c+kYZyh+qEpEAvZDXrhkTabqhSMGluAdzlo6p8CUxO+qaRt4U+zRRab378cwE
         Mn7UdXEiTNsvBfLR2yI9e6ZtHjRppKtG1FPQatvM72KOkGkP/8S0Ou77JsFMJ5rpJO/Y
         mV8ANYJagyZnkNlu6o/1AuObV2vizZ0Eq/AAJ7VMhmaDYbuuzkp5oBK58pAnkoiYcq2s
         7VqasApwEMVRuyXdu1W0HOlbPXg1e3IU7NgVMOwjWXXHP5Y2Y+pSsmCuSKNcEzTlm0Wd
         5PQuWkNGHsSfSo5SO3HywzGimSZBVlOJIX2JgMmEq3wuqTuqyxQcy1nESjuBT0PSfkAU
         Ip3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RL435F5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a056214062900b0047498aadfa8si676909qvx.0.2022.08.04.07.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Aug 2022 07:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RL435F5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJcHT-00072g-EI
	for alex.bennee@linaro.org; Thu, 04 Aug 2022 10:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJcGw-00071F-Ne
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 10:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJcGs-0002pd-5e
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 10:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659624981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ggKv28E2L0L6K7L+gbW8rAA6Ey9l9IxtjHH+OWAnuc=;
 b=RL435F5DudPgSVUvZlyIa600E/qUiT5wxbmeRGTG3SbiVBNWFFwUezHNLwob+yGpsAeyHV
 ZNSupgTcgh2SUiJmqdijQQfa44xyPZvgWFEa04AAcVi8EmoZOevtlyzNNVsFzUfDoDVW5a
 ketjqbQQu2teIDX5lKbBy6cLXPwwIe4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-AQjZ_KUlOhSt5JPdM7-DMA-1; Thu, 04 Aug 2022 10:56:17 -0400
X-MC-Unique: AQjZ_KUlOhSt5JPdM7-DMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB4CA3C2F760;
 Thu,  4 Aug 2022 14:56:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A5E400EA8E;
 Thu,  4 Aug 2022 14:56:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D65621E6930; Thu,  4 Aug 2022 16:56:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Kevin Wolf
 <kwolf@redhat.com>,  Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,  venture@google.com,  Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com,  hskinnemoen@google.com,  f4bug@amsat.org,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  thuth@redhat.com,  Hanna
 Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuvY8/WL0Jojv1Uj@redhat.com>
Date: Thu, 04 Aug 2022 16:56:15 +0200
In-Reply-To: <YuvY8/WL0Jojv1Uj@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 Aug 2022 15:34:27 +0100")
Message-ID: <877d3odpm8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7PcW//eMuKcT

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
>> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
>> >
>> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
>> > > An OTP device isn't really a parallel flash, and neither are eFuses.
>> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe=
 of
>> > > other interface types, too.
>> > >
>> > > This patch introduces IF_OTHER.  The patch after next uses it for an
>> > > EEPROM device.
>> > >
>> > > Do we want IF_OTHER?
>> >
>> > What would the semantics even be? Any block device that doesn't pick up
>> > a different category may pick up IF_OTHER backends?
>> >
>> > It certainly feels like a strange interface to ask for "other" disk and
>> > then getting as surprise what this other thing might be. It's
>> > essentially the same as having an explicit '-device other', and I
>> > suppose most people would find that strange.
>> >
>> > > If no, I guess we get to abuse IF_PFLASH some more.
>> > >
>> > > If yes, I guess we should use IF_PFLASH only for actual parallel fla=
sh
>> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may n=
ot
>> > > be worth the trouble, though.
>> > >
>> > > Thoughts?
>> >
>> > If the existing types aren't good enough (I don't have an opinion on
>> > whether IF_PFLASH is a good match), let's add a new one. But a specific
>> > new one, not just "other".
>>=20
>> I think the common thread is "this isn't what anybody actually thinks
>> of as being a 'disk', but we would like to back it with a block device
>> anyway". That can cover a fair range of possibilities...
>
> Given that, do we even want/have to use -drive for this ?    We can use
> -blockdev for the backend and reference that from any -device we want
> to create, and leave -drive out of the picture entirely

-drive is our only means to configure onboard devices.

We've talked about better means a few times, but no conclusions.  I can
dig up pointers, if you're interested.

