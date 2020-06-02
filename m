Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp580345qvs;
        Tue, 2 Jun 2020 02:49:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrYM75RYiRq3w/SvAon+Ek4wHbdSCvUs9ujXW8XI6a9Y+xh/uC5+zbWzQKCEEtSBsUypbT
X-Received: by 2002:a25:c647:: with SMTP id k68mr10890360ybf.345.1591091351886;
        Tue, 02 Jun 2020 02:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591091351; cv=none;
        d=google.com; s=arc-20160816;
        b=eGYSiZiElFB09TGXl6hku4frP3iAy67hG4w5oZ4qI2jpanSD1Az/t0G5Owt8QKYc0A
         6SnuSlp3PJNiIuXHmQJjKlQalOvNDg+mEMBnhq6Jv4EowjrlM2jfI/LR8AyQWlFC2000
         bfVV7GcJlQ/VbF+EySWfjA2/mDOk74odZsLRN700iakS0z2VtRo2uIY34G3E+gpmMndz
         3Q/CcHiarqrgby68W6OGUc9kKykhwrBy8lSumfpS08hF6tGbaHdkta8qT9AwCIi/1fh0
         yJfz/18ljZTv+263w/VMwproQi3qJzJAo0YcL3seAVr98KKZ10YQ4miXEAxt5yci12JY
         CxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Kf23+crxbvcNs8rpOa1mRe3cjJNjA3G4OLGcUm0cFOE=;
        b=jUGaciO4PV2RmjA5pPXbNKArcXJilchGECtxQfy7O1MIi9wZ7dKdPJGWyrcAG+4JF1
         8yGEgi+c0k+f+G03B+5K9per2RDbu2mKRmR+3C8G2d8V1BZjUaXTeRrmVgyFndbgbZn6
         +GC6O1Ft9+RJ58P9RiSvRSzhZGauHxjygx6Lv7Ghw7dfUW67EKcscMEwJu2hPxG2ThWY
         P04FNOIRaFhsnRT5nhuPHK4CLvuPnjWtzJSbMTwwfkyf0ocOOGgzqpUiu+bJFkfUJGWr
         QsR4Ff17IX+LgTTHoUz47zV/XETTVJsTHYMlhzaNShgoDHTx9pCXI21V3LWtL9bPJV6v
         UhrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HiCBEp8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si1746834ybr.347.2020.06.02.02.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 02:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HiCBEp8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg3Xj-0007oU-D0
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 05:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jg3Xb-0007mb-6j
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 05:49:03 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20620
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jg3XZ-0000TG-Is
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 05:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591091340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kf23+crxbvcNs8rpOa1mRe3cjJNjA3G4OLGcUm0cFOE=;
 b=HiCBEp8sSt6cfSdu2xiaJTnMm7tbipGNxoD2znvnKDzQTJq18HRRXVKj4Ji+JxAOFgytkK
 8CZo3In1ZgFF40+xX4Q3rFEdtplo1S5ejF3xZJxbqEq76NUs4tcURb1pq8wJhcfZ82MoH/
 Qkyo5avOJUoFp1QnzdaWZohVMqqs+Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-YCHKOPBKOdiU2rh9VigP4w-1; Tue, 02 Jun 2020 05:48:56 -0400
X-MC-Unique: YCHKOPBKOdiU2rh9VigP4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2AB31B18BC0;
 Tue,  2 Jun 2020 09:48:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D8255C1C5;
 Tue,  2 Jun 2020 09:48:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A7B017477; Tue,  2 Jun 2020 11:48:53 +0200 (CEST)
Date: Tue, 2 Jun 2020 11:48:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/21] Vga 20200528 patches
Message-ID: <20200602094853.tmt66smnvnbm6asi@sirius.home.kraxel.org>
References: <20200528123609.27362-1-kraxel@redhat.com>
 <CAFEAcA98OyyyC6gs34e3U03=dXz8GkDn5qf38UaO_XBB679V+g@mail.gmail.com>
 <bf43132b-71c2-d411-7cf3-e9a00066ccdc@amsat.org>
 <CAFEAcA_Su+2O6nm0hRfj1BqwQzSsLva+ft_f=1O47-o6U8NxBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Su+2O6nm0hRfj1BqwQzSsLva+ft_f=1O47-o6U8NxBA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 22:14:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: It2T4g1G0c5R

  Hi,

> Some days I wonder whether we should just do a bulk detabify
> of the QEMU sources.

git & patch utils have switches to ignore whitespace changes, so I'd
expect such a bulk change shouldn't be too disruptive in terms of
conflicts.  A one-time "git rebase --ignore-whitespace" for WIP patches
should handle it.

cheers,
  Gerd

