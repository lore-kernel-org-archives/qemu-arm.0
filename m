Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5979551lfp;
        Tue, 18 Feb 2020 02:33:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzj94Yvw9WtDVztzZQAyOX2lw34XCE/LJylp5U2R669SxUPJPRHWbWhOrJUIQnc0xyNxA53
X-Received: by 2002:ac8:1ac1:: with SMTP id h1mr16526901qtk.255.1582022020222;
        Tue, 18 Feb 2020 02:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582022020; cv=none;
        d=google.com; s=arc-20160816;
        b=JXLOkeCPQcUhMcJ7nHxPHIk5KtPJOg9RWFHeZ/WaAjylRQVKfoKqo9eGoXbu6h9IuE
         JlTeQHY+8LVt9moPdTHzBIYb+Zux8hLwbjdr7t88wtkG3JJZFJOC6HzZXLLIUnJK5lPl
         cA7N/r64d0rwqe1vDucpVSDoDhquCvXHUSFBEwHyQXQL9frPanlGs42CL1WgycrudYJW
         1iBH44OMcbBjHnGyNdDaUcfv9Lqc4fy/ErTqV64uaJCZTweQoCrnteCsUVrUpgLBy7Q8
         boUwmjPzzaUz0OF69kDEb0fqxFVDfnj0oxRZUhTRhodtn2qKnwLZJmYqFIVbRtbLjHdJ
         8Etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=L9v5WMTJxgvO5yfSaXlwBe9NDsyI92HU4kpr1EmsiCA=;
        b=MKC4hF7lw3h2CGYG/FkoII43ZbtvFI7BSHPFFy3irfRUbWVzF7Po7x+FwR5nnj/TKN
         AQvPliAPJZ2wGvlU6dh7+YNB2I/E4N0/INc8YT/cL6/GwjsfsDXw5dIc/jtlaLZML1YL
         OXTtR7zK/eLYckUV3gRQE1KqwhhVRM+CPHOFpaT2JwpRMTI8Y/JxcXJtNo2oX5KrTaJy
         8zb7R2gY1mERHsgnVhKUSUSDXq+J/NDjhVjZLUg45H43y0VdWfKRyrLeXrl2C570mycz
         pKPoMgGHY7pRqBLZ2sNcwcRyZEbaEXimvzza2g0KQynIpKkJ8R+LcH0+0Kel3hEvSCvt
         YdTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Idt7shl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si1391530qvt.161.2020.02.18.02.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:33:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Idt7shl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j40CB-0006fn-Hn
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51535)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j40Bf-00068V-73
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:33:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j40Bd-0006iZ-D9
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:33:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40044
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j40Bb-0006ha-M8
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021982;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9v5WMTJxgvO5yfSaXlwBe9NDsyI92HU4kpr1EmsiCA=;
 b=Idt7shl2wLHgv2iAqaZkEzUX8VlVGYeA+hV9rP09xTUkm96I8l+wMoymLAx0dPUSMu9ZC1
 bzk6Xh6HkSQhcYp6glrRsxdVMka8HphVXZekRPsoKefkwOKwC+e97CcxR3LTgDfrjSzqXb
 jY1ba/yYi2hUihVKBXxivaYio2xQmLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-YwU8GrtGObOqfueBzChldA-1; Tue, 18 Feb 2020 05:32:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4105C189F762;
 Tue, 18 Feb 2020 10:32:57 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0611F5D9E2;
 Tue, 18 Feb 2020 10:32:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 10/13] ui/input-barrier: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-11-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:59
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-11-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:32:40 +0100
Message-ID: <87o8twmbhz.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: YwU8GrtGObOqfueBzChldA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-TUID: JyXv8o0NA8vx

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 6105683da35
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

