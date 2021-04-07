Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp714462lfr;
        Wed, 7 Apr 2021 11:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfDZe9Wmt1X2GbgyTMo2lEsFpKdBMC+8I3M9KuBKlDbIROs5NWQHcSL4Vi48RbafSWJwAr
X-Received: by 2002:a05:6e02:17cb:: with SMTP id z11mr73968ilu.248.1617820675174;
        Wed, 07 Apr 2021 11:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617820675; cv=none;
        d=google.com; s=arc-20160816;
        b=pJj8f1CXqAah+XgmRedfA5uN2V6QUFlOxmLLTv0AY1SH23cGEq1FI1YeXXb/O1/eA7
         xIYLFCeJqO4cf4/gmnLsl703MNUt/K2FR5kuCs/BjlIeREZ02T6DfwxT6FYZon3G93iQ
         S3X3f5UDpnW2rulYx01gqgrR6mBs24J4m1xyvRIHXKZTKscBwJ/RJK1AvJlBm9HabEMk
         /QMWoOd9rKfkK1UmnN5U0QwJh9XfqKdR4EEdb8NxYjT61IFhCDPs0mcgORhzLHrvZoV3
         C7mHQpQQwTXNCZURsZOMF0I6XuMshxC0JQcBe73FdlCkt4j/Bd6xNSIx0pATQqL1Y+wf
         XKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h5nDwPlWGqfi+Yw7ER5eFUI9R87eG1GkeVtPF9LEyj0=;
        b=ZYGGD2K2JOFnN+ke9+8sRShd126iymUEhFvi+SLBNycu5//mSKt23+9lPLGi8qz5ZV
         hkgP/F7P3NZSTngL3Ay/hsXUEueKw22esOSyO5rE2l7dMKkmixN4YqJvq0jL/iePaVmz
         KCxO9wQvP+BoyQXNkldnNi5T9E5+vErsqx5BJISlofV4w5n9T2V/yUGGsFTm/Hny9LQl
         F5G8meOkaCb4qI41MTyfqNumDKEZx3+X/6Gxg0ct+0yBNg5PIgH8EXJC4FfsKJy+jNIN
         bC92k3iyFjYjLibyHSPWAOKEIpUFBmKuuuEFTVdKivkV7Lc8OPo9qUak0ThBvHydP07H
         MSFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjoMkwBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si21795817iob.26.2021.04.07.11.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 11:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WjoMkwBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUD3q-0007p4-Gt
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 14:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD3S-0007ny-VP
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 14:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lUD3P-0007IO-39
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 14:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617820644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5nDwPlWGqfi+Yw7ER5eFUI9R87eG1GkeVtPF9LEyj0=;
 b=WjoMkwBcoJcEkSmxmTRZ+a1dD3PwPXgDMjg5tVS1WOl0VqmRWYsJf2ZXFb76CqYe88Ervy
 ilptitc26ao6cc3CpsCOcu/aMfOfYx7MSEF1xRvSDRjhasYvcm9bUMdjsJ3ewpITaCXSx7
 qZMWkYsjJ1V2aP0MXQUuPLhm7xcqq1Q=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-h_AuwLCqPBmTN5pnDVLGcQ-1; Wed, 07 Apr 2021 14:37:22 -0400
X-MC-Unique: h_AuwLCqPBmTN5pnDVLGcQ-1
Received: by mail-vk1-f197.google.com with SMTP id b141so6209849vka.23
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 11:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h5nDwPlWGqfi+Yw7ER5eFUI9R87eG1GkeVtPF9LEyj0=;
 b=KDW74etcXfVyR+EVpkNUk5nCXbxlL0HxDIJhxjTWItyn08pty+ZjM6TFWrpJm3WvFl
 NTpluYkGzmQcMzQ8+aSyv5PcWWXjp4Ye2Xww7wqmouUJz8c4sdvbmlG1gW+qvmgF3Tqq
 Lr/Orx/vpxuWWxZnDjtt3aK39TXzWis/qOCB9fsmEFV3F/74vdqbE0xq/pq26izdDBi8
 JA/zy6l6JsexGSVZsq9nzumqMiBRvPkSUs6PPEVoJ5dcxg4LkMlTdetTlMT9CbIBa18Z
 RXzr4BxV8XbiixLWKeCA2hAUn+Ghxwa3Uy211B1X+BSXikpYx0FvbUWOzLqNmgQH5TuN
 FBIA==
X-Gm-Message-State: AOAM531x+qt7/6Kr4lOCqSAjyExYcUIqpzH2nr9O2rnjpRZaJ9Ew1bJC
 n2e4uVenvt9PPNyD7s8pB2MEuR9Yvk3H6lVEHUvwmuGf3reu2VbWtBzbCFYlS1MPRkaSCX/1Qr3
 N9LmkWCDdJs7ZdlGLUnEA6TXR4Q4X
X-Received: by 2002:a05:6102:1085:: with SMTP id
 s5mr3473637vsr.45.1617820642506; 
 Wed, 07 Apr 2021 11:37:22 -0700 (PDT)
X-Received: by 2002:a05:6102:1085:: with SMTP id
 s5mr3473628vsr.45.1617820642376; 
 Wed, 07 Apr 2021 11:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-13-clg@kaod.org>
In-Reply-To: <20210407171637.777743-13-clg@kaod.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 7 Apr 2021 15:36:56 -0300
Message-ID: <CAKJDGDaX1eF6ANC=PMKhGbLK+ChhTrLwX_qeRvhErcZw48Ksyw@mail.gmail.com>
Subject: Re: [PATCH 12/24] tests/acceptance: Test ast2600 machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vuZ1av7XLWcw

On Wed, Apr 7, 2021 at 2:45 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> Tacoma BMC machine.
>
> There is no root file system so the test terminates when boot reaches
> the stage where it attempts and fails to mount something.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> [ clg : - removed comment
>         - removed ending self.vm.shutdown() ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20210304123951.163411-3-joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

