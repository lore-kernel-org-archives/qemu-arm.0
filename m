Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5975382lfp;
        Tue, 18 Feb 2020 02:28:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxe/7EPp/GYJc6QFx+LGV4BeGrkdsw8JvJCxEEb/o9yy/SmGvJQ8rZQTilE4S3V2d2tgola
X-Received: by 2002:a05:6214:1874:: with SMTP id eh20mr16422681qvb.122.1582021736829;
        Tue, 18 Feb 2020 02:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021736; cv=none;
        d=google.com; s=arc-20160816;
        b=I/EelCBA3Y+MELlEbk7eLTYDF+0kb/Uz0U7wMCruhb2rz17kgUIBB2Wi/738dAKBDF
         fzaJXRvZCZuWcHAkfwXZo35RaLKDficu9Ea0kib7KQnaYM4RQ83TXuPDkN+IqmS23o39
         hJhFKJ2gZrE0qANMFTMPKfxrDc3Dhw/k8SinA4jiZBTg5bmJASkX59GzR3PJUSix3fx+
         1aXPpx3J4TivgZDo9SFNMeBeo0uUnM8rzCmv1uG/qLxl3z2PDOwJ7LMmZ0iCP7IjYGNv
         jAe4+OySWrLvP+s+IPtCbwLjbTCVd6F7UhVosdXn8lcCmi3hWfV8RUB4fGpB0dxj08IP
         hPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=IadpGJehq9SNKgNvjiCpws9Uw/ETbPYF/qGm5t1UImE=;
        b=preIhR82JBCiF/XB+HzFVmdwU6rykJfTWj3y96CZVqjNYe2dJrU936Pvkat6GasVyQ
         8M8ZiBTw2FYbH2AhODdNH6rtDYGAAltQz7jdQvZbFFQcjYSOUxpTAReIGDDDTs8RwFF0
         Zm8CGIDnxYYG8S7Y6rqcoAVM9XDUOXBtJQye+Y5Gc+XPSfO+8OyqJssd+KezSPeTWbfJ
         2I5BhBUvdk60LQVDwpwSt5trQeklddx6v7X8vbuD2XuBxloacWbPufrCWAuATSz64O9A
         +JG9OZLbl/SINbV5vlDJwsGC+FEe2lzIbuahBpZx2LfRRX0rTqbYJYmZfqL5v9iWNxPH
         vNkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e0cJynZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si1457074qtp.76.2020.02.18.02.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e0cJynZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j407c-0007Hc-9k
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j407L-0006xl-RJ
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:28:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j407L-0004YY-1J
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:28:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23946
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j407K-0004YB-UV
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021718;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IadpGJehq9SNKgNvjiCpws9Uw/ETbPYF/qGm5t1UImE=;
 b=e0cJynZBPUzDGPPfwTr1k8fGyEo84dQW+YMeUKx0drDQcGtPLvu76ULXucreWxiPmZ4K/x
 pv+p353eqz5UMf7l2rIBi0Z/ICupjaavEbn+1Vco/SfuhF2Jk3VmVVLyE7BmOd4HuwPmo+
 BuSkOX5bLBb/uHDuK17LsQs8sp38tYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-vVM264jGMFaF2LsgrEb3Nw-1; Tue, 18 Feb 2020 05:28:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E74CEDB6F;
 Tue, 18 Feb 2020 10:28:33 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E58E19756;
 Tue, 18 Feb 2020 10:28:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 13/13] contrib/rdmacm-mux: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-14-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:44:02
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-14-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:28:18 +0100
Message-ID: <87mu9gnq9p.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: vVM264jGMFaF2LsgrEb3Nw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Shamir Rabinovitch <shamir.rabinovitch@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KUYqB+bMehpx

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: a5d2f6f8773
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

