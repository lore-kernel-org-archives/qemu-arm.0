Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5978692lfp;
        Tue, 18 Feb 2020 02:32:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5ym9+H3vJLu1Ki6l4fuVEh4Uh1/2t9HwyUeK34ikmzfuq0NDrA9YurGbn7s96oLoRFZgM
X-Received: by 2002:ac8:777b:: with SMTP id h27mr16779252qtu.251.1582021962485;
        Tue, 18 Feb 2020 02:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021962; cv=none;
        d=google.com; s=arc-20160816;
        b=I8tcyaWQyMxwjZ9JslxArSWymljL1wq1D1msj90lJoum8bVvcEqlHgPijUdoB9Qz9h
         n0OK3snlNXYVVI4eaOiqTMJi6WqefiM3iGTRJ7PrUw03mu7z6XSvINvwBfYpVUKCLpsS
         rSZ6R7KeWLTdZDIeGPkTXo2vR/JsXP6jfRvDao5N3XGF5S0IJf+xoL8TEJmMm281SBye
         xDSzbznytE2HzySt2TmNrsyQISJ2uRmUc4Ex8c1+htSc3mTG3LcOQkddziZC2IEgclO+
         XWrqqY8IiSfPCiSNFlFfCvF0Ce3SZSTJsQyfZRienoX1URvkkp7ldLd4cZBi0iX3grfY
         oj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=j32x0zvinhdY5/GKyI+CL3xHypBWnu3J08EDk79NRFI=;
        b=dkYEdo4R7+qlxn/mODNHLhNjr4KV3PCWYRDY3JLHYGehLPAsH+vB4awsxJcewO7TDP
         Wcu29ImeAnNKJt1TqTs/oGeCiP8ztnJnQLa1DJ7b2I+ZaDUKV0DnmIsJIw9MfLlYh/Hl
         ykQdDsMBbJVL2T7IvZKTkCd2zbISV12DCc7IqrcBv6r0TtfDpxaa4F22IHDsLPTDMKnf
         fFZyNOhVBJbFzTJapOtqrirD/r1t9stpcJqpy07PZbesNEhSMNDeEHnp9RdMCNITgU5p
         TWnWomC+iKfZ/YQbTHN/c3pSxQ0WSYxpmZjLftzuYO+oq9YjW6UpHYK66/OXcvsrqpi9
         8WtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MDggo1ZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q51si1558535qtk.65.2020.02.18.02.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:32:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MDggo1ZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j40BF-0005Lq-CY
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j409w-00039F-Bh
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j409v-0005yJ-Cw
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:31:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43816
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j409v-0005xv-9A
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021878;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j32x0zvinhdY5/GKyI+CL3xHypBWnu3J08EDk79NRFI=;
 b=MDggo1ZEPmjgX9N74ptJDrKcoxj7sOFJrKVPL/YVfTJYnKKWGFyp8dEV29OIlpx6jObja3
 E8nJ3tlasNCYFr/HdkE7UEcoG+//sbWFyAx+1qxCyw8fFYuz37Q6Lg7JyDsGYbiHhuEifr
 bgBScqZaZWrDVrrbCPvlG79QyT3DYGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-MqLd1LxWNyaWRpuBbJJt5Q-1; Tue, 18 Feb 2020 05:31:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D55A28017DF;
 Tue, 18 Feb 2020 10:31:14 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96D9E87B32;
 Tue, 18 Feb 2020 10:31:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 07/13] hw/scsi/esp: Remove superfluous semicolon
In-Reply-To: <20200218094402.26625-8-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:56
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-8-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:30:59 +0100
Message-ID: <871rqsnq58.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MqLd1LxWNyaWRpuBbJJt5Q-1
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
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
X-TUID: 5+5Fq7TGidny

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 74d71ea16bc
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

