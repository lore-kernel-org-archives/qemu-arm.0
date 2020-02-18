Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5973815lfp;
        Tue, 18 Feb 2020 02:27:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNjm5b0BvDPHDM//3GzTWZbPbJP/UwBZmRrg0YDBMeScHkNJ+Q9kTEfXSJoJwzKsuDdmqm
X-Received: by 2002:a05:6214:38c:: with SMTP id l12mr15985171qvy.224.1582021621000;
        Tue, 18 Feb 2020 02:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021620; cv=none;
        d=google.com; s=arc-20160816;
        b=06ZdhIKjzvc1JACpTRHfDciSCr6+hvJDo8woORoZuusM90rHe41T0/KAipyeb0Nrmy
         +3dxDJaXmgsf3aatxN9DmL04U7eURr1CPmX9gD698U3HcCBaXayfQrfkj0BBbKNHjXIi
         xWZhympPVn5hvVc8T7HL5EVMI3O3g7DvN+Oxv6jDY9Agsy69dAZ44QAix+3LLpktZQZF
         2Z9QoE17x81HSsX1wzzBqw9VT7B79SVc30eH08NAeEQhzeMYnCUKGpia61q3J9EPb0Qx
         kaaodwCB/MdrcPnIZFA3+2D89/40vc0pYOfsBS1v5/PS97JdnAAIjJnYBVvWfIjCRRJw
         OFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=WCbpsxfqY1cpcRs6F3FX91X4AibwQQ5zYMBSxvZ3+WE=;
        b=vjGtbd86q0UXxaVLsPJs8EkU++Lh6IqJzqpt0rr1GlQJVJou3LRVYJCFuvN4fsHPIz
         PpcIyTdBd2dYRUMCaglU3dHz8K2esCqrSMWpi5JudoXVJUAjA+sMqofN/Cyv4SJ10JAT
         6W3NGw+dzYT73UntfMUsnBXcpy+ATh7btaXfy3fJxLgP/gdsHin+ok67gkXXYfB47y0O
         jh9omqfc5JJapoEwGE6UCNcRAtomfHRcwEKkwSC88Bi0i3KCwGP2JEBu/UyCIJiFUsvV
         nU6E4R+9j0HO9NqClyGvfF2dHGAHBwd5Zzb38A5I454L8i1O8gKsrCZQSIa/DKFeg45J
         6jEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gwDy0ouW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20si1577895qtk.343.2020.02.18.02.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:27:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gwDy0ouW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j405k-0004LJ-Dh
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j405Z-0004Ik-57
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j405X-0003oJ-0q
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:26:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21959
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j405V-0003n0-BA
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCbpsxfqY1cpcRs6F3FX91X4AibwQQ5zYMBSxvZ3+WE=;
 b=gwDy0ouWRIs0fdazCzwlvgXdxhMPyzihAMlaHhU1cuvq7BJXET5DK1C3KejXPzBukmwj3J
 +yUzLuD+o95YL5eqt56kADOpWsq2U3tFaFwazrnEKuJb/s9UyMLQl0eh/F0BkDOC+pAbI7
 ElnKhmAybPOaxs4JUW7lqpa+FiQwXa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-i5yuJSj2Nw65KIRjq2BZbw-1; Tue, 18 Feb 2020 05:26:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C36D107ACCA;
 Tue, 18 Feb 2020 10:26:40 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1E18CCC5;
 Tue, 18 Feb 2020 10:26:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 01/13] scripts/checkpatch.pl: Detect superfluous
 semicolon in C code
In-Reply-To: <20200218094402.26625-2-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:50
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-2-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:26:23 +0100
Message-ID: <87zhdgnqcw.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: i5yuJSj2Nw65KIRjq2BZbw-1
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
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yF7x15qqENqW

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Display error when a commit contains superfluous semicolon:
>
>   $ git show 6663a0a3376 | scripts/checkpatch.pl -q -
>   ERROR: superfluous trailing semicolon
>   #276: FILE: block/io_uring.c:186:
>   +                ret =3D -ENOSPC;;
>   total: 1 errors, 1 warnings, 485 lines checked
>
> Reported-by: Luc Michel <luc.michel@greensocs.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

