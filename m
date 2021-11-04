Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp904698lfv;
        Thu, 4 Nov 2021 06:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpP3GIUa1w1c0Fx0cngHSeN+4nevUm1tj0+2P4MCaYRHZl08SitdBtPA8aLPfssoD8YFIp
X-Received: by 2002:aca:1316:: with SMTP id e22mr9261258oii.123.1636032251884;
        Thu, 04 Nov 2021 06:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636032251; cv=none;
        d=google.com; s=arc-20160816;
        b=iArgCBMpCA8Fked4iwGkHMLF2pIretRrrDIOMDI28a0M6iGvB7DZpDw4QVWXzD1dCB
         3lFHm043USPOcfvucX742Nrp3Zc+eFrYAI3ncytZcWqb8B8wXTN/+UQykpCsB8WR7qVT
         1GCXXeYBZ4N7bnIcFULGU50hyzVnFnlI2d66kvFsbrDy9/KUrt/gIE82JyHFhdA41CQX
         uSyqCDwuwd9Cw3apVej533jviaC+ppJ4QlQtYev1UUC6YWI9Juoe+2YLewzORiI4kAPj
         OhvqjBdGlm5afllWtuZFBR9lPjVqCmbQ0B2ZdL3k1f/YG3iXBMk8DGOhO/IjL1D5JcWs
         m6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=a9NM+x8KecaJ9aR4sYtnU2DnCNIjRQZIv6/Z2BnnPqs=;
        b=ApYxY7e19EyhBXRidsEh+e/KiomD0XQ1a83xK+cJfXsWzNacBzN5jYe4CbK1hb9ZGv
         Mr2JzaQFwLw/9kftcshduKg32mRI3+EBX/8SBld+cpmpA7E9EMIXp5x8B8PtO/mTQFCm
         RW5UY461JRfEpev3bHFqIeX6BvfCAjWYt9NqE3ZTHhjwLeDYTwm8g+8YhtU8luYopwDO
         mlIR0Mk6EJqB8ZXfk3lwbFAXYjjic9PPcCvEeddnyLcRmpvupSgxnFw11Qc3A0rv3o7n
         sanMk9usgkypSwOaJ86Snb5CS3o/nzQnoMn7OOKDYYJ6kSzhZiYebrjiyY413YfhuE+V
         ItSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PNKLrEx4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si7027131oop.62.2021.11.04.06.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Nov 2021 06:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PNKLrEx4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miciw-0001gx-VR
	for alex.bennee@linaro.org; Thu, 04 Nov 2021 09:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1micah-000223-4m
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 09:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1micad-00036F-TZ
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 09:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636031734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9NM+x8KecaJ9aR4sYtnU2DnCNIjRQZIv6/Z2BnnPqs=;
 b=PNKLrEx4yEUvqliYXdNQu1m3e5arnzByrczKwUM/9h01Nd1AaGP/p5EzCiLt60eiJEaxui
 38+trpO/qiA+x9Vkz61vFkQtvq++sh/SCoIGO5OjLKZfcDvmr4iG2vhV3fkonD6wdH01zI
 tmGV9Am4tswBU9mOfVXwOcN9LI3f4Y8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-nVZ3Q8HGNdaOIFldIT9mJw-1; Thu, 04 Nov 2021 09:15:32 -0400
X-MC-Unique: nVZ3Q8HGNdaOIFldIT9mJw-1
Received: by mail-pl1-f200.google.com with SMTP id
 k9-20020a170902c40900b001421e921ccaso2691229plk.22
 for <qemu-arm@nongnu.org>; Thu, 04 Nov 2021 06:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a9NM+x8KecaJ9aR4sYtnU2DnCNIjRQZIv6/Z2BnnPqs=;
 b=hZXS5ANpkMvT3KdusYCAXUlMUCVImeUPdw2h9c3PfljLh9qlP7WNAuruFe1K4T0meM
 n4J4ki1Rsfaa92bxMpHswZ8MfEz5nBq71uOhfJLcjDmO0mU5UWaxX97LAEx+f4rdJP3p
 SJn3QuLsX9c2luM09sA/hZ8pCTsNsXqst7WjyMXGIC46WvJodze0GXV1B9F1mxUvxQZs
 Gp7q2NLK9N/obu6Iw3FLuzCv13pges+mtXaL3WFQX5xCSe0wdQZgnxtjtfHZTN5mFRqx
 GMtVuvJ3ZSIf+ErxI+K6qvtSRv3xC2Zvy2hTcVt0g1Wz/kiOweBy6v9lVHHAAKWlnky8
 85tA==
X-Gm-Message-State: AOAM531JIIwC1o5ZMPC9KXgWRTSdsy4c0MAGSlcB+3Gl3P8w8Y8xCieH
 3sHd+AmWLd/XC+H1dUGU3N+6y30kZxxv0u89MYdS62/e9xVxwoo8q7gE50AiezGtKpUuAVYJukw
 nJNBrO20ZP8K8PXnbWrS6zzvPkOhq
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr22297740pju.123.1636031731760; 
 Thu, 04 Nov 2021 06:15:31 -0700 (PDT)
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr22297695pju.123.1636031731444; 
 Thu, 04 Nov 2021 06:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211103211404.79953-1-willianr@redhat.com>
 <20211103211404.79953-2-willianr@redhat.com>
 <3f261dc1-aa3c-affe-1d56-1e41e2ccf6fa@redhat.com>
In-Reply-To: <3f261dc1-aa3c-affe-1d56-1e41e2ccf6fa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 4 Nov 2021 10:15:05 -0300
Message-ID: <CAKJDGDaZjZSJpxeHMOJw6iKfChuSNnZyfJfg+DcoXAKRWCZkFw@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/acceptance: rename tests acceptance to tests
 avocado
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lzZHibuJwcb1

On Thu, Nov 4, 2021 at 9:50 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 11/3/21 22:14, Willian Rampazzo wrote:
> > In the discussion about renaming the `tests/acceptance` [1], the
> > conclusion was that the folders inside `tests` are related to the
> > framework running the tests and not directly related to the type of
> > the tests.
> >
> > This changes the folder to `tests/avocado` and adjusts the MAKEFILE, th=
e
> > CI related files and the documentation.
> >
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  64 files changed, 113 insertions(+), 118 deletions(-)
>
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
>
> > -.PHONY: check-venv check-acceptance
> > +.PHONY: check-venv check-avocado
>
> > -check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> > +check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> >       $(call quiet-command, \
> >              $(TESTS_VENV_DIR)/bin/python -m avocado \
> >              --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_R=
ESULTS_DIR) \
>
> We should keep check-acceptance, eventually printing a deprecation
> message. Smth like:
>
>   check-acceptance: check-avocado a
>       @echo "Note 'make $@' is deprecated, use 'make $<' instead" >&2
>

I agree.

> > --- a/tests/acceptance/ppc_prep_40p.py
> > +++ b/tests/avocado/ppc_prep_40p.py
> > @@ -13,6 +13,10 @@
> >
> >
> >  class IbmPrep40pMachine(Test):
> > +    """
> > +    :avocado: tags=3Darch:ppc
> > +    :avocado: tags=3Dmachine:40p
> > +    """
> >
> >      timeout =3D 60
> >
> > @@ -24,8 +28,6 @@ class IbmPrep40pMachine(Test):
> >      @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted =
code')
> >      def test_factory_firmware_and_netbsd(self):
> >          """
> > -        :avocado: tags=3Darch:ppc
> > -        :avocado: tags=3Dmachine:40p
> >          :avocado: tags=3Dos:netbsd
> >          :avocado: tags=3Dslowness:high
> >          """
> > @@ -48,10 +50,6 @@ def test_factory_firmware_and_netbsd(self):
> >          wait_for_console_pattern(self, 'Model: IBM PPS Model 6015')
> >
> >      def test_openbios_192m(self):
> > -        """
> > -        :avocado: tags=3Darch:ppc
> > -        :avocado: tags=3Dmachine:40p
> > -        """
> >          self.vm.set_console()
> >          self.vm.add_args('-m', '192') # test fw_cfg
> >
> > @@ -62,8 +60,6 @@ def test_openbios_192m(self):
> >
> >      def test_openbios_and_netbsd(self):
> >          """
> > -        :avocado: tags=3Darch:ppc
> > -        :avocado: tags=3Dmachine:40p
> >          :avocado: tags=3Dos:netbsd
> >          """
> >          drive_url =3D ('https://archive.netbsd.org/pub/NetBSD-archive/=
'
>
> Unrelated change, otherwise:

Ouch, looks like I took one of my test changes. I'll wait for some
more comments and remove this change on a v2.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Thanks!

