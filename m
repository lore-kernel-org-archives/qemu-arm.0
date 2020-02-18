Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5978199lfp;
        Tue, 18 Feb 2020 02:32:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzT2C9R2Ri/c6iUtdgdTnA+W1TrkdgIh2xqY0hf2cqTvl3prrhls4pjU7kLVSjLQfcTjpL2
X-Received: by 2002:ae9:e210:: with SMTP id c16mr17245303qkc.334.1582021930558;
        Tue, 18 Feb 2020 02:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021930; cv=none;
        d=google.com; s=arc-20160816;
        b=UKdvrz4bhEASe4UUb/lpZCB1FeZgnX+oVtAi3wvkK5C/b4cx1RECuYxLsr8RwASsse
         D8i6tQsbHCNqJPMdd7p380ezsg+P6LqyKshHcY67h7Bh+BAnXhNR2hsVbp3cpPdytARx
         uRAqj1Gb9g5JDfZadz6rVms1nYe0m/QBOx0XRnszoLCmpjyTEdqP3JSUt17hLlske5BJ
         RVWlaaDlOiPhzH3Q92IQuTihkN9CC1OYxAgVBWrOXCgslwWOz9KK3RR8rs+3f/llpwz3
         R8X41YzcSRSbMGhyTgneoxdq1YqB4D9NTAM+63bGM/dOcX/DotZSZWjDxFDXyyah0IPi
         GzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=3ATs3tYcYDSuXzQBjLK23rT+iyN0gezw8N8BeGeujP0=;
        b=W8FpEmSVImrOQQQnIkQF7ET1oVx9dg4mcphrjjME4YRAZozZJ6eHYLgtZn1M/pA+p7
         2gan2vygBdrRd7ZVssMMMCT3YeRjcsJiEizrBy12D9FiObJIXuPiNeGAVQ2sz0sBnlay
         sTZUGvWkbrRZ9+O6IL1rdUKkFtGz+1KXgHb0o0rZxIavs2aPuO0Cku6Tzuxtqkeu7Yhr
         Sh4dvc/lCIucMkA21Wn4ObBC+kI26qs63FU34DSpu3Gkle60gXizVxUv5lc/KIk10pOM
         cwXF1751ZG2/kTdaINb+UrEvjpHU8Z3yqkEYeAIndsa2p25xfZna25tQS1hLNH/rrRSU
         0QgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hoyKbQFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si1509453qtj.362.2020.02.18.02.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:32:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hoyKbQFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j40Aj-0004Bt-UW
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j40AO-00048K-A7
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:31:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j40AN-0006KI-Dk
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:31:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58922
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j40AN-0006Jn-9W
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ATs3tYcYDSuXzQBjLK23rT+iyN0gezw8N8BeGeujP0=;
 b=hoyKbQFRDDXFzzB/BT+uWofgaJVWUhwQ6VMiWtIyP8T1OM02wWFfvTH2PxObvVkZEdu+LS
 xQdHJBmccaAJ532Il40WjzchxpoAV7umXqOmEdvIu801W2Uj7g3A7zF/YCQxbmE4jWO9qU
 H5TUi8mdc32b8L9a+K2R1OqpfkwW0gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-GZ-chRhqMwKyzJMCebd5xg-1; Tue, 18 Feb 2020 05:31:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11855801E6D;
 Tue, 18 Feb 2020 10:31:43 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B55D95C241;
 Tue, 18 Feb 2020 10:31:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 08/13] hw/vfio/display: Remove superfluous semicolon
In-Reply-To: <20200218094402.26625-9-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:57
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-9-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:31:26 +0100
Message-ID: <87wo8kmbk1.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: GZ-chRhqMwKyzJMCebd5xg-1
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
X-TUID: gsGI77T0Z4jV

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 8b818e059bf
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

