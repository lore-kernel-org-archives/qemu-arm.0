Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp495400lfb;
        Mon, 11 May 2020 12:42:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9g78IFHlj8qs166A169UeCoBMURPd/iLJOBHhI2YwLnHEDZJDQQNPPX7PqIeqIbtE+CIT
X-Received: by 2002:a17:906:17c5:: with SMTP id u5mr14868794eje.275.1589226136744;
        Mon, 11 May 2020 12:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589226136; cv=none;
        d=google.com; s=arc-20160816;
        b=THqsBi751rIMddXgIGfdX4+zn8vNIOiUgPhbPRDLHQysWVgEieVtuuPpbxnCafY0Xn
         YD55IkhDg6iiRtn00ahs0cxRBU1QTGbp/XU2fk/pTGTFopelVYXS4BG8hAwT2GAMqSlA
         +U665Nw5M4a0UgtvT1xbSYtdsj4sBtlmRneDegv4Tp/RDR9mFgDjdv1MhoV1ZHbPuC4L
         9jSsNgpLsF7GyWTHZmf/psC1tcmVCkE5/M0X/7ezT0GrQ8ink5e1/A/sksdkKww/ozIy
         /olPwtnaGqQTqWfnjCE1yuHwdkmHyCtWPFXKfzGasrAxtp7uw7VmjtJ06/fj8nM38KfK
         B72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=oOh2Z7/M0Scy2VhE1vh2P6Ofb/aNSQeEkWCfPFiyStQ=;
        b=KSGMuEy5KehjNnRL2N+35KRC9sqc39iK8rzdch82yqcdNopWlVB4p8i7Oy99bvypjJ
         Sog+goWWB2JMwBDqjgTteqpdOf4GDRth3Dsn5UzycHsIwa5dXA33u9nDnQ4IuD3yPi8M
         FzVrXnKzHeV3tlSDSF7B7VrF9hrCFD4yE7ePbBgNvHxmTqWjUyv2zy/s5sD45QPW2M+V
         NADiScN2YWWc+Y2oMN2MY/EN2/PWGUWIw5bVrAjubGuw9WkTyothSRSXUKSjOSWDF3tr
         NgpIxlNuXNdplPSByXtDtQUWsRbKU1d9hz9QovqYkSY+pML4qChxmGYeSVyTTX797ic8
         mARg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXHW1Q3D;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id 5si6211771edx.30.2020.05.11.12.42.16;
        Mon, 11 May 2020 12:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXHW1Q3D;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbgEKTmP (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 11 May 2020 15:42:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40219 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729453AbgEKTmP (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 May 2020 15:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589226133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oOh2Z7/M0Scy2VhE1vh2P6Ofb/aNSQeEkWCfPFiyStQ=;
        b=aXHW1Q3Dw+2X/BeUerCiXSomWqCHuUYB35xLt/ZWbEHNxPYuGaWeA5OfNiEfa9+2HiqLpy
        ZpA3mvwK2Zqse4hE12EHapcJ3E8d2+H+BwXdUvTsN3E8ZXTO5woxZXOMYhs+SMel84U75i
        xPKa0lVirpvOC4jtfnoBFW7vivhwoy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Ycbk1aNhOuef7Tn96R4PIw-1; Mon, 11 May 2020 15:42:12 -0400
X-MC-Unique: Ycbk1aNhOuef7Tn96R4PIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C63E8014C0;
        Mon, 11 May 2020 19:42:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 345611000232;
        Mon, 11 May 2020 19:42:01 +0000 (UTC)
Date:   Mon, 11 May 2020 21:41:57 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
        <mst@redhat.com>, <xiaoguangrong.eric@gmail.com>,
        <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>,
        <pbonzini@redhat.com>, <fam@euphon.net>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <mtosatti@redhat.com>,
        <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, <zhengxiang9@huawei.com>,
        <linuxarm@huawei.com>, <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v26 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a
 common macro
Message-ID: <20200511214157.6a64526a@redhat.com>
In-Reply-To: <777c44a0-b977-a8fe-a3c6-5b217e9093af@huawei.com>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
        <20200507134205.7559-2-gengdongjiu@huawei.com>
        <4f29e19c-cb37-05e6-0ae3-c019370e090b@redhat.com>
        <777c44a0-b977-a8fe-a3c6-5b217e9093af@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3b5E7cycXj+i

On Mon, 11 May 2020 22:05:28 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> >> +=C2=A0=C2=A0=C2=A0 (node3), (node4), (node5) }
> >> +
> >> =C2=A0 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%02hhx%02hhx-%02hhx%02hhx-" \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%02hhx%02hhx-" \
> >> diff --git a/slirp b/slirp
> >> index 2faae0f..55ab21c 160000
> >> --- a/slirp
> >> +++ b/slirp
> >> @@ -1 +1 @@
> >> -Subproject commit 2faae0f778f818fadc873308f983289df697eb93
> >> +Subproject commit 55ab21c9a36852915b81f1b41ebaf3b6509dd8ba =20
> >=20
> > The SLiRP submodule change is certainly unrelated. =20
>=20
> Thanks Philippe's review and comments. I submitted another patchset "[PAT=
CH RESEND v26 00/10] Add ARMv8 RAS virtualization support in QEMU" to fix i=
t, please review that patchset.

for future, adding RESEND doesn't make sence here. If you change patches th=
en just bump version.
>=20
> >=20
> >=20
> > .
> >  =20
>=20
