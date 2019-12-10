Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5868805lff;
        Tue, 10 Dec 2019 06:21:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2PL54HVOMRfKKTWnEhJ759cgU7y0DipavE6wloaaamYtUaUiHxaYpbzddVez1CIKc7Wuu
X-Received: by 2002:a37:4d10:: with SMTP id a16mr19640660qkb.325.1575987693569;
        Tue, 10 Dec 2019 06:21:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575987693; cv=none;
        d=google.com; s=arc-20160816;
        b=M+qfo56mHkeotbEzOFcjXUn/TBnVoRuvdUNxTlMOQRatfUcEjxhj10Gm4NqDC8OCHj
         xB9fGevDov9k/DUavcx8gBZ2L0R7mPGEwBrqkPaHEj8CTRnFqwB1PZeBiZi5BMlk3TwS
         nEqc0sGIXIbZ3Idn+v4C5nyvWN2uz7bSiu5XP2BqKZNudxn30nz6rjwZWaDWLle7zFyo
         4yk2UNOuuoYe5Ic6CnqlDP6yYncnUG6vB3cyYc9Li1T8kXbj4VIkqNtPppdUch1YA0Jg
         9Vef2dL4foUp00BsvYjwzXd6c5gCikL1TRwMzud/MC4sPF+qR6ndMcReFJdSOolZlf3I
         BiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=moUHla2XqP5eoohiHGzDGD1SQJpqUmN21LiF4ELBiFE=;
        b=xZS2BBJhITGRr7zKPc8TWhuzTa3r50gxOZLgvu6Z77e4ZeKo0SlloLu5aNu3i+8ghI
         IVJpXzKUKNjxNmngdEQzyyU4oVrlSCwbotx7t27UUdhK6BNa6loDgzW5W1zQ5ylDSEzW
         tYz2+hVfmRP9FiTlZOqqzJXOZY5HiGha4X8yPB20r8PUf0d7fbzbuOknKv13P6Hb6Z8f
         MinLk1eKULIYYkVN7wjoKmYqBSNTVfgtos9F9gy6HH+xgTvDIa+zFIGHEivGBLN/oscd
         jKDqS/L7BcDOKi6c87YO8p+TbDk0GLiNLRmmys6eOiU07w7oGhoqIoJVJt0mSj1y6bhU
         bpkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MalhjYhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si1942755qkk.9.2019.12.10.06.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 06:21:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MalhjYhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iegOK-0002OC-IK
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 09:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <abologna@redhat.com>) id 1iegO5-0002Nj-GJ
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 09:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1iegO3-0002zv-Du
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 09:21:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49652
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>) id 1iegO1-0002ym-V4
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 09:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575987672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moUHla2XqP5eoohiHGzDGD1SQJpqUmN21LiF4ELBiFE=;
 b=MalhjYhfGuV7gnWhRTWnitROGnc5cu9zZNFMyO+TpUdWW8oLZ2UOOcWDqedU/mNgJ21fRa
 js/WLtgZrqZAtNFdnWQIQaFQLqo/Qub901r2I2p7Xvesnxk3b59hG1Ih+2S5mVJ9QcobUi
 4I1Pa4pmF/D2w8adjgQFyG/Xq6WNx5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-OwFQM3SrM72eeLypHmqsUQ-1; Tue, 10 Dec 2019 09:21:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23C4F107AD24;
 Tue, 10 Dec 2019 14:21:08 +0000 (UTC)
Received: from ovpn-205-189.brq.redhat.com (ovpn-205-189.brq.redhat.com
 [10.40.205.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7043B60BE2;
 Tue, 10 Dec 2019 14:21:05 +0000 (UTC)
Message-ID: <29add42daba074ab5bdbd462b2d377115fec7c3c.camel@redhat.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 15:21:02 +0100
In-Reply-To: <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
 <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
 <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
 <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
 <CAFEAcA_M61hTzU=qCiUbR4V9Mnwd0phFNqTJG9pCWKreVmjy6A@mail.gmail.com>
 <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OwFQM3SrM72eeLypHmqsUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, bijan.mottahedeh@oracle.com,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9iNq2tblxDf

On Tue, 2019-12-10 at 14:32 +0100, Andrew Jones wrote:
> After having done this git mining, it looks more and more like we should
> at least consider naming this feature 'kvm-no-adjvtime' and probably
> also change arm's default.

I agree with everything except the naming: why would

  kvm-no-adjvtime=off  vtime is adjusted      (default)
  kvm-no-adjvtime=on   vtime is not adjusted

be better than

  kvm-adjvtime=on   vtime is adjusted      (default)
  kvm-adjvtime=off  vtime is not adjusted

? Both offer the exact same amount of flexibility, but the latter has
the advantage of not introducing any unwieldy double negatives.

-- 
Andrea Bolognani / Red Hat / Virtualization

