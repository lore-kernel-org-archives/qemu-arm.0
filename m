Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5981648lfp;
        Tue, 18 Feb 2020 02:36:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzdh5/Bheo6s+Y+uXbnkWdCN1/1wVNAOHiM/sRBS17QodmNWDdIZNSf1aM3RfBxX7ZUMMcJ
X-Received: by 2002:a37:5044:: with SMTP id e65mr17218097qkb.294.1582022165587;
        Tue, 18 Feb 2020 02:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582022165; cv=none;
        d=google.com; s=arc-20160816;
        b=CelIE9BKJ0pDEkdvs7AK9Ob7ZdHi0tHDgshPwqsG2VGJkY4LH3IjnPlleED35M6qNN
         Gjq4duk7//ookRd8vJStGJ+/OxIoU98F7akT4a9R6KMuSQFfvy4SLvXRJNXyFUU5wNtx
         tmHS2qa1KuFxAf4uxNpJYo3AsUnkX9oPkoAhL1UOAA9YF0EdT4pVufc3i7KFJu/6mUAF
         x6EgqTSHyYfkc/twC/Qyzx7xwN/jsX67v5+76A5/R6HmfjoseavvFEXl76ebiOEtRMDZ
         R4xKWTlSFT5WMG84IChr/HAQohFsOAU2Am4tcY9EB1Sgj8YLuqGZl9X99jfsNCrXyqSg
         Kqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=OBqKKwiYOpQVxnpf7l1Q5k89hpg3u4gvO+NH/dOpbnE=;
        b=rMaWNlUZEmuZIDxlQpl1+3PVoAycSJWyyz0lJDRhyoa2+sy4WS3IPSFzgOE1DRb+6W
         ZvCRd65xmqMVrntaiZr1M+ORiqbJvVgR9YhEy7totgUSF8isL7X+hcS1LlZib6bwwkig
         TETeXA92WAM8eVgx79I7O7iBFKFU3y4YGbSFFnaTdYqE0I7w45+8wrRO12mDNsH9i+Fd
         Gs0RXUTO47W+HLJ/yao7GDU1cPIP39uaQBy5eSpi8Sf3TaIIrkUjn1OMGRN+z3mQzmFc
         FB6w72PjcinX0Mq9lu6neO4lSlX81B3ZGLRjrHGsXjb1T4SScpwEjGsODLRd3xwdxfcu
         xsIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SssgOMzd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21si1694675qkg.167.2020.02.18.02.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SssgOMzd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j40EX-0001gK-05
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j40At-0004pF-Ps
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:32:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j40As-0006VW-TP
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:32:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58204
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j40As-0006V2-PW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021938;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBqKKwiYOpQVxnpf7l1Q5k89hpg3u4gvO+NH/dOpbnE=;
 b=SssgOMzd3TJ48zMHNJeiAUIxQ8YxSA5N/I6NUIlaGgl6qjtqxUDO88ZHF5LCRPPTPlTKpA
 JyvMq3vI16v+KGBcOVMNngpWnfcXCwIbr5Q6VDZomwWhHt155ITuuxw4Rfz3dWezc4l0gO
 bcmDMEWCB3vf7JIcTxjFx305TU/lKcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-6PFsKkRqMlCAWQWKBjkHMQ-1; Tue, 18 Feb 2020 05:32:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4035FDB6E;
 Tue, 18 Feb 2020 10:32:14 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0EAE19481;
 Tue, 18 Feb 2020 10:32:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 09/13] migration/multifd: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-10-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:43:58
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-10-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:31:58 +0100
Message-ID: <87sgj8mbj5.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 6PFsKkRqMlCAWQWKBjkHMQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wEurs8ocXkxk

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: d32ca5ad798
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I forgot, queued on migration branch.

