Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp233663ejb;
        Tue, 14 Feb 2023 22:39:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8WGF8azbwocvlTPYTSm1YbPihkpQfxiSm4BiCFgQWWoAVDLvdhpT4hRkwGQci3y27IRBDX
X-Received: by 2002:ac8:7d12:0:b0:3a7:e625:14f with SMTP id g18-20020ac87d12000000b003a7e625014fmr1649405qtb.9.1676443157942;
        Tue, 14 Feb 2023 22:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676443157; cv=none;
        d=google.com; s=arc-20160816;
        b=lL+sArjkzExPISqodAwXg3pWTEOSpfISbp62bGOL+YGnO9BgUINFrvfDyQZTU4whbg
         N5OcsRzgd0mdobrdwbpEzYEkHDvteWe61Xz0cxLRvLUzbIxRkLAmV5rhqbcqYAqm9KNk
         wYzRa8rcpkcM+1eI37Wy0Wb/rGarQkWRy1z2vJ/10MOwUZobieXq1IcZhVkjTOUpdsfg
         Et5UYhWxFJcun5jgrgOEiAaIFNhzzbjqaIXDJtFP6saiSip7+btcADBkczQQAYw5Bokx
         Dyecaoe+7syrnum5+fFAW8QcuxAfaHA4IV+O3ijXix5l8imBt+3Fp9K0XFfEOd0rxCvJ
         +8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=kMpfFdbg2TIYGxTDJ8apwvmPmF3OWMEnIIL9HoRz/wU=;
        b=JyMhOv23LtDkCVTKxbIQvnYUnNvOJk9tSNTSNCrKDD6VpuC7/KUJZagey4K6myQpZo
         dUoMhvbOyHtuJWur70y5M1i868qpZClTW0DyjJifeitFnoag57IheQnhGhmgoKj4pW5o
         z18ir+m99tnp7DNrQtb7gJxHYEP/nmjtLGIEFzxZTqOgFUCH9uJymduaJVqZp55+gd0b
         DeGeD6LFUEnEjXYW3vpVU81nnvU3lgB08OCCl9AgIUjELMez9Bh1nB7R22Q9rrf0LJC2
         hvfQmo4WnmHoK4lcxCDy81Ggl0AHckrXmTPlY/NIc9z2JCAdmpKznrtIJHBQDnkrlu30
         pJFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BRXsAelG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac85856000000b003b1ad716005si13978964qth.577.2023.02.14.22.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 22:39:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BRXsAelG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBRB-0007se-17; Wed, 15 Feb 2023 01:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSBR9-0007rf-9z
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 01:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSBR5-0006a0-8g
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 01:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676443114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMpfFdbg2TIYGxTDJ8apwvmPmF3OWMEnIIL9HoRz/wU=;
 b=BRXsAelGEmaWolwERIZRdZeH+CK9rRFR7cZaeLJZsJ9rvhDeJPDHi6yTlWWKtNccDRz2/6
 2Dq8zvaQ+ZCyXgsfQC06vEB+SKgWUBY9JtdyoFHgAU3mAM8+WbIqrDzNmoe7xkBAwsA9NM
 Ls6Lfj+Vg2H8XPO8HKBJGBgX/S1PiUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-DlBwYsQmOyaMjimDk8QbhA-1; Wed, 15 Feb 2023 01:38:30 -0500
X-MC-Unique: DlBwYsQmOyaMjimDk8QbhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C2908027EB;
 Wed, 15 Feb 2023 06:38:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E06B540C1423;
 Wed, 15 Feb 2023 06:38:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B23D621E6A1F; Wed, 15 Feb 2023 07:38:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,  Andrew Jeffery <andrew@aj.id.au>,  Peter
 Maydell <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
References: <20230214171830.681594-1-clg@kaod.org>
Date: Wed, 15 Feb 2023 07:38:28 +0100
In-Reply-To: <20230214171830.681594-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9d?=
 =?utf-8?Q?ric?= Le Goater"'s
 message of "Tue, 14 Feb 2023 18:18:22 +0100")
Message-ID: <87fsb7e8m3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K3y7zhDrQpeu

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Hello,
>
> This series starts with a first set of patches fixing I2C slave mode
> in the Aspeed I2C controller, a test device and its associated test in
> avocado.
>
> Follow some cleanups which allow the use of block devices instead of
> drives. So that, instead of specifying :
>
>   -drive file=3D./flash-ast2600-evb,format=3Draw,if=3Dmtd
>   -drive file=3D./ast2600-evb.pnor,format=3Draw,if=3Dmtd
>   ...
>
> and guessing from the order which bus the device is attached to, we
> can use :
>
>   -blockdev node-name=3Dfmc0,driver=3Dfile,filename=3D./bmc.img
>   -device mx66u51235f,bus=3Dssi.0,drive=3Dfmc0
>   -blockdev node-name=3Dfmc1,driver=3Dfile,filename=3D./bmc-alt.img
>   -device mx66u51235f,bus=3Dssi.0,drive=3Dfmc1=20
>   -blockdev node-name=3Dpnor,driver=3Dfile,filename=3D./pnor
>   -device mx66l1g45g,bus=3Dssi.1,drive=3Dpnor
>   ...
>
> It is not perfect, the CS index still depends on the order, but it is
> now possible to run a machine without -drive ...,if=3Dmtd.

Lovely!

Does this cover all uses of IF_MTD, or only some?

> This lacks the final patch enabling the '-nodefaults' option by not
> creating the default devices if specified on the command line. It
> needs some more evaluation of the possible undesired effects.=20

Are you thinking of something similar to the default CD-ROM, i.e. use
default_list to have -device suppress a certain kind of default devices,
and also have -nodefaults suppress them all?

