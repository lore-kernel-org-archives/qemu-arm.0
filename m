Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6105082lff;
        Tue, 10 Dec 2019 09:16:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqrsxBY3twM3cou/VebQT0KZCpt7SPvFtYmV5pq8m+h7Igo+86m3cYqyjo5WDTfQczLJAK
X-Received: by 2002:aca:e084:: with SMTP id x126mr4729670oig.97.1575998217407;
        Tue, 10 Dec 2019 09:16:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575998217; cv=none;
        d=google.com; s=arc-20160816;
        b=eE/VbOWulROrJZlfvsFIoTd8wJhN8v8wuiF27MoR4Ii+A6i9H39xiOddSBtta+tiJH
         YNkuVKjBoAK8odssiRS+DDKU+RTi2HH/jaPwkEeVVMyNVlDH9SbdNOTxVgRQzmiUy2LV
         LcG5qiExs0cmiAmL3ekwBF3pANjnnCc9v3FwvbJKcQeDtykR1a68lft356/aTefePOcQ
         giuLrLEi6tXk0s2hf0N7DEUUZPB+97qLMlV5B4nnr2Jt6ayd8xmVZ3c96iAZE5YNv60m
         aJWYSvledh3pdo+pIGFjPZyZZpBw4r7Ezt5lmytSq0OuE0wNOD9oGgYPcnnwOXQFkLPN
         COyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=vbeUY1tYvNFELFptAI6NyGsSXcrw+gBajlhVpD0Q4A8=;
        b=lls6y3gs0wpDkZh2W0pKOs83SxXYi4AQqmw0urqcezWz+w8j9qahJPVMjfYxPygEfK
         9LWWZNB/jCaOt8QQzOw2x1o96ldiDCljUtCM/PIa5ABYIoyFbpw+BhOYpEzQo4n3yeRr
         qX2W5o9dnn/8+u4Jy5Ky7EJ7gZ50bBzwIRyFytguDo1X+wuwV2Cr4oUTNa2wOFcibOpK
         OCH3a63GW7YuoM9AMh7RAdTUFU2aaH4DRIrvm6RkfWOiFb/KoufaBtk8KReRBB2ApRuq
         GlVOCHucD/RDJwqOK+SfBwjmnZv7KFpv9kYaGdYS7xK/Z9spCyPR/i9hC9RLHEcRz24y
         zKYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DGuGYqUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si2163874oib.55.2019.12.10.09.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 09:16:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DGuGYqUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iej84-0005IX-B6
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 12:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <abologna@redhat.com>) id 1iej7u-0005I9-Gu
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 12:16:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1iej7t-0000PQ-C5
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 12:16:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60571
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>) id 1iej7t-0000P4-8m
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 12:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575998204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbeUY1tYvNFELFptAI6NyGsSXcrw+gBajlhVpD0Q4A8=;
 b=DGuGYqUmvuSuYSRG0g/eOlzKJIkFUQ3fvG1dG/LtRwycXGT8uUKueP+Z2l+j2dYUXwe3im
 maWC7MB1ITK4IiwPeuMwC8LQmuBhiSHaQ2u7QOqsfcWGY278Ut+SMeUry/ouypnWjKwdVZ
 csgVfyLLIxp2ppfzea85eDmbp8dWQBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-m-J_QNgtMqWr3h-gqil5nQ-1; Tue, 10 Dec 2019 12:16:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623BC10054E3;
 Tue, 10 Dec 2019 17:16:39 +0000 (UTC)
Received: from ovpn-205-189.brq.redhat.com (ovpn-205-189.brq.redhat.com
 [10.40.205.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 907081001B03;
 Tue, 10 Dec 2019 17:16:36 +0000 (UTC)
Message-ID: <ca3212971a456fe8bfb15bdd718dce5aa821daf1.camel@redhat.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Date: Tue, 10 Dec 2019 18:16:33 +0100
In-Reply-To: <20191210160825.ioah26u36eu2i3z2@kamzik.brq.redhat.com>
References: <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
 <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
 <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
 <CAFEAcA_M61hTzU=qCiUbR4V9Mnwd0phFNqTJG9pCWKreVmjy6A@mail.gmail.com>
 <20191210133254.22vcpvr3eabcnthe@kamzik.brq.redhat.com>
 <29add42daba074ab5bdbd462b2d377115fec7c3c.camel@redhat.com>
 <20191210143311.4sen6blhfhzop6zw@kamzik.brq.redhat.com>
 <e0f86b200d0b3c08769cdbaa080569c3ec3db3ab.camel@redhat.com>
 <20191210160825.ioah26u36eu2i3z2@kamzik.brq.redhat.com>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: m-J_QNgtMqWr3h-gqil5nQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uWd/mj/hB1bo

On Tue, 2019-12-10 at 17:08 +0100, Andrew Jones wrote:
> I don't have a strong enough opinion about kvm-adjvtime vs.
> kvm-no-adjvtime to insist one way or another. I agree double inversions
> are easier to mess up, but I also like the way the '-no-' better
> communicates that the default is [probably] 'yes'.
> 
> All interested parties, please vote. I'll be sending v2 soon and I can
> call this thing anything the majority (or the dominate minority) prefer.

I like kvm-adjvtime better because it avoids the double negative,
but on the other hand if the new default is be to adjust the time
then I don't expect many people will actually need to use the
parameter, so the name doesn't matter that much after all :)

-- 
Andrea Bolognani / Red Hat / Virtualization

