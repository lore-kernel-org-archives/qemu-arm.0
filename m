Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1430839wri;
        Thu, 7 Nov 2019 11:32:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzow6RE499VYlZPGWHJfPGhKgYOn2HCpoaVf68bu81TJxaJRQeEj1K0Wa/5WbwwXL+gz7/M
X-Received: by 2002:a37:e10d:: with SMTP id c13mr4477076qkm.35.1573155179565;
        Thu, 07 Nov 2019 11:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573155179; cv=none;
        d=google.com; s=arc-20160816;
        b=QbwLVo1KljJ1EoiL3gV4/u0uFC7PwV/kmcLdY5oyRqP0v2TKkLAhhs6i30s4/Ac3sT
         6fIsrKIWqpDdA3iXaCh2Bi7GatlqV6V85Ohul1+AN5b3pcRjIs30GZSuHWqd7P+E2MXX
         Il05AF7lE4Qr+T6kbsYg5zfZdl7Tfug+Ujxy3SPsVf4pVgpY9omPytfnAYdKNBEwkhDi
         TSXl1XXomjI1jBUQ07JuZUehRHQ5q+nWXSsZvbrWnksS0A0VMsmFx9/i5XNGVDSonzDG
         40Wg7CTnMeZAwcxV+SdOwrWIoMSNpEy2HbRlALk2Z+jmoRzrIZCkli8h7kHErbzorNdA
         TJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=x4JupZN51xQJAmN9k43J70Vc8dSEcR06TByvDZ0NiUY=;
        b=gPRc6KlvP+Sq7fhfGulJ9YbSfeOuUzEgxETRH0odM1mh5aSvurLK/xy+xhdeu/kGRN
         io4nagRCr7bF42uQXY2RoFd1kNJpzSRxPxWblqIg/b762oV83ZJ+y0H3+wC8IKUmCYZa
         5oI2cLJs46l9YAQgKHI5AVzAiTgaBUUJhoVgY+Ie1ePBxWuk68EriD+NCebll1xZqkb6
         keq/CMwwSnx92EmBJ6sLBt9R/Hd35+rYRIJNVcLgDOa4KT35ULXnwV6WOPkc/vCmn+sI
         6Uf6UWcwl4MvKRWuc2dHckA+v1GSJw3ZpuZoAB4OxoPgz+KuOrC8WyRXsSSA+H2VCfoa
         tsVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UPdiqSom;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21si1941309qtj.15.2019.11.07.11.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 11:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UPdiqSom;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSnWc-0003wp-BL
	for alex.bennee@linaro.org; Thu, 07 Nov 2019 14:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iSnVu-0003eo-DE
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 14:32:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iSnVq-0002xV-AP
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 14:32:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56820
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iSnVp-0002wH-LA
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 14:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573155128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4JupZN51xQJAmN9k43J70Vc8dSEcR06TByvDZ0NiUY=;
 b=UPdiqSomVa0S51/6dFtw89FihXqb/bEfwDILN8XPDzaeYM+bnYxD6MFawl7NJoI8M+KjsV
 c1JRAJuxAQVJMlclZcq69pRsIcYi2X99jWGcWOn0ngDa3bHx4Lm+D9PP/fNqYcNPQfU7uE
 +wruuAA9rMaxwDzv47hhKKwOzA8yxdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-vOBXN-JKMQ2rD0TJMMjkwg-1; Thu, 07 Nov 2019 14:32:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEDB5107ACC3;
 Thu,  7 Nov 2019 19:32:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
 [10.36.116.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF523DA3;
 Thu,  7 Nov 2019 19:31:56 +0000 (UTC)
Subject: Re: [PATCH-for-4.1? 0/7] vl: Allow building with CONFIG_BLUETOOTH
 disabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190712133928.21394-1-philmd@redhat.com>
 <421f2fb2-6e8d-7579-029a-e8de726c6a5e@redhat.com>
 <56d102b4-3f55-7070-c012-56ad65138873@redhat.com>
 <CAFEAcA8axpVeXjWV+2cz8PL-gR_6GvU=i0BMt01pYhff_1LOwQ@mail.gmail.com>
 <4ed2e2b7-91b0-197f-7532-bf9daac075bf@redhat.com>
 <d79cec06-ff17-a118-7bf9-91ae1791c014@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <831c720f-17b7-c19d-292c-4832b7d8b1b8@redhat.com>
Date: Thu, 7 Nov 2019 20:31:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <d79cec06-ff17-a118-7bf9-91ae1791c014@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: vOBXN-JKMQ2rD0TJMMjkwg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vkad17li+/Pw

On 07/11/2019 20.09, Philippe Mathieu-Daud=C3=A9 wrote:
[...]
> Bluetooth is dead, long live BT!
>=20
> v4.2.0-rc0 just got tagged. We should stop linking unmaintained dead=20
> code. If nobody step in to nuke BT, we should consider applying this=20
> series before we release QEMU 5.0 with dead Bluetooth. This approach is=
=20
> still better than burying our head in the sand.

FWIW, I'm planning to send some patches to remove the bluetooth code in=20
the 5.0 development cycle. Unless you want to beat me to it. But I don't=20
think it makes sense to still make this configurable. The bluetooth code=20
has been marked as deprecated for a while now, and nobody spoke up that=20
they are still using it (and as far as I can tell, it's currently not=20
usable anymore anyway), so it should simply be removed now.

  Thomas

