Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5976252lfp;
        Tue, 18 Feb 2020 02:30:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdzFlzqa88ua+RbFHk9h8QeB8S2BJKsPI4AZWo77xMpsYSPXTVYDmlbg507D2fYFr2sTvq
X-Received: by 2002:ac8:1866:: with SMTP id n35mr16313877qtk.28.1582021800081;
        Tue, 18 Feb 2020 02:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021800; cv=none;
        d=google.com; s=arc-20160816;
        b=DEhDMdxP83so4993rtea2KlIe6O//Omayyk3BG4933QuvvJHhw124wmBa/AHHK8pzv
         NZ3p0Y7jO01vS3/8mbakBjkyJ/HJvGK8w0H7sLsQtXeQc96D041vEoDkQzLqqf3mvW9p
         Il0GwjcxXklyT10pXiFX/j9ZgttC6SR56Bi9jaNFrEC2hlJgRX8YxOY+KSMtzXE19ipq
         ogCc2gapyYJRGCb8Wbiohxst1iE3H6/aEIkC5dh191h4A1Yg6yyolWrWJ1261JfMjPPA
         PO8m/kEzmzCn21Del3BebGyjYAApwVjsbuIm00zFRPHVdFI5JJleHQZGbn6cfkSFplAn
         anyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=9jTv46vzrzvrTeAyTWjCO6MKyfbXyPCXlQNOROblhPk=;
        b=NkzGM/JZ+Xt7Nvx71p9lShTAC4VVOEuxEeZe3xp50nS7t87BGwSple6c3bFCxTAGBL
         buaFydcwuZHQ2WZ5qP8qtWJtiYMM1sEYR31NUd2TZBIBePDKoJw+cPSkmpT0ez/l9Bgr
         i6DZ+XUJlGSPXCH0Zhj8FW4Q2fcvGQ4mzYDiAnKfaEP5F3rqnGIaHXznhpxzjIVX66IR
         5PSvst59gKjhBcSrf7Ei4OOmj32J8Mqt9eJMIvuJXvufEUOM5Ya9xGpXb2x6CE4DpgNy
         lDzlY5iok2IAlxYZRYvu22bKdYD/F/s4hqu8kta9kMMJGFR6wQZ9ZiP09LesA9gE6Px8
         ANEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="K0JTd1h/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp6si1464760qvb.141.2020.02.18.02.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="K0JTd1h/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j408d-0000pU-IX
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j408S-0000lG-Jf
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:29:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j408N-0005M7-OX
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:29:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55038
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j408N-0005Ll-LK
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021783;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jTv46vzrzvrTeAyTWjCO6MKyfbXyPCXlQNOROblhPk=;
 b=K0JTd1h/SHH6/Eip0KqF2md+9rUnsKImgkyaz08QVG56SDLyArF/Z9wdenDxcLyzSLPgUb
 2v6IhqDJZaonGZXZeC3LXv4vpmy10W3e/UkBpf2tmBQko0y6islKFhipKpt4+TO2urhiC5
 td1ouVPmgN9jjIo6BdrfN+e1CPk+IeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-bexKI4FQMV-emdGW_pNipg-1; Tue, 18 Feb 2020 05:29:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278EB100550E;
 Tue, 18 Feb 2020 10:29:39 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 041B319E9C;
 Tue, 18 Feb 2020 10:29:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
In-Reply-To: <20200218094402.26625-5-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:53
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-5-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:29:24 +0100
Message-ID: <87eeusnq7v.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bexKI4FQMV-emdGW_pNipg-1
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
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
X-TUID: /M/NgblwYJV/

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 6663a0a3376
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

