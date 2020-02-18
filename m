Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5976623lfp;
        Tue, 18 Feb 2020 02:30:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2dm2zzD9sErgVG+vwub9tA4ONDbgFsirgr1zdVMqSg6BXsjTOcRieMCiILRzlYgnjXqOF
X-Received: by 2002:ac8:187b:: with SMTP id n56mr16812316qtk.173.1582021828618;
        Tue, 18 Feb 2020 02:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021828; cv=none;
        d=google.com; s=arc-20160816;
        b=VNce+5LK+9cEB3O/KY3rqap1H6mLk4k9oEmAKMA7UqySWFoIvWKvVXaKM06sPboTwI
         3XfaNGd/AoYx6ILRc2BnZrpXemvR1uFjGt6EYrMTOTtyWVEQ+Zr8FkVAhnngnTB5QFz/
         Ucc5iws+pkPd9AHftn/rqwO5CCp1tJNbad4/BfVR7opysnFaDYcl+UBmYVkaQ9GziNBT
         YWw16HSaCioCcqoRgp7J5yvQBRrq9Zj5iYmyOU3cbjl/UXqc/K2pmiv9CVnGGMfQxl5h
         ZwJzfVCblwUmkZUfFP7rkBf9cjOFUb6pLKpupgbuLHs1/JT/nHkuuusrUQTR/Z2Hq7Qk
         NRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=O+FMTbtm9xLdN5wiEFqoo6mDjZzH5YVxe3dOAA6TqpE=;
        b=WkVYuUeG8CIOglZBbzuUXTwqD28lFwhT5MsaOmRhhpJijWwgUdljw///xpZV1kMTxo
         AqF2RQkk0GVyHBbQyBTfMENpLf6PlyvnHf+oCT4gsZ3roH/piT3dXul1wGnI4rbIjDWw
         rX3ZPzSxcCosWBdArQShFwoMnKruU6kgDXwHRMyiI7V02LapCeMz/53vHHOg89U5xl/z
         3ZIg7ydwuMs586gKVub2sZpGPBhH7NM/2/H+lKitQ31MVwnLger3E/w9iZQFR6ZHxgFJ
         SPeM6pLezj+nX40GpIsAbWWzX3KaLwMQVmFHpaDVx54iXClinvF6L56/UwV882XQZYuK
         mPEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YrokM7No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si1493461qth.81.2020.02.18.02.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:30:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YrokM7No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4095-0001d5-UB
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:30:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j408s-0001V6-PX
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:30:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j408r-0005V6-S5
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:30:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51424
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j408r-0005Ua-NK
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021813;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+FMTbtm9xLdN5wiEFqoo6mDjZzH5YVxe3dOAA6TqpE=;
 b=YrokM7No3bG4NJ7ct5Sn3dvue70AMoBxC7hPnYg5cRG/+komPML+R9kXxGAYtf9Fc3h80m
 1YuVx5eF/eDszhmV/uvgU/gtRGCy0JTTlN/YyZv8Kajd/L8O/nwGJFjJwJrTSDfmmVru3W
 +/XtTd1Sa3PKYO4P+4WGM1cKSYhVjl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-EPodNNTOPnqGn5qTyKejDg-1; Tue, 18 Feb 2020 05:30:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E23DB62;
 Tue, 18 Feb 2020 10:30:09 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDED21BC6D;
 Tue, 18 Feb 2020 10:29:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 05/13] hw/arm/xlnx-versal: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-6-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:54
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-6-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:29:53 +0100
Message-ID: <87a75gnq72.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EPodNNTOPnqGn5qTyKejDg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCKA6pbgDHnC

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 6f16da53ffe
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

