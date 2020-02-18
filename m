Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5975317lfp;
        Tue, 18 Feb 2020 02:28:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+sT/fGWRsWnokyIxJWkKAGbBcSkdRQPxnn9RyNqAKnNMCLnbxy/ehb5TCKaUfj6rgYsHe
X-Received: by 2002:a05:6214:28b:: with SMTP id l11mr16403634qvv.15.1582021731853;
        Tue, 18 Feb 2020 02:28:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582021731; cv=none;
        d=google.com; s=arc-20160816;
        b=PFoiygLGcvzF+3xv9p9zUzAxvB5sNDPXk+2nzJMHk7reN98zBZAoYmwBycGHsWJvAc
         l69zBo25xxezZ11vUyc4uu7pXuR+ni0MiHLQ11vdXI2SjM6OKl9ERRbdZmc34L6wY6IT
         ewZI0E7LV2WTKqNpONQkVGEXCdOHsNIqIJEh4/RxmXmRFv2pwkWRxVN6Fsm6SmDeobil
         REChe2Gctpw+oHHwxHypDC7fbnzQnueij4lIZwlF2UnL0uD4TM821fdbkWAjAaovCSde
         RJxX8L0Bx3FaNRRQdUSPyz6g6X+bIcbIT3byFHuT6SQg+1AKzp/ULBvKwWyRZCq4rKB+
         kPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=9G2T1FJIseTGfv+LxXtntL+vyZxljGI6k3rCeHwwlHs=;
        b=MAEvBxIWjiJPlBjeWF4SE5WCfXkMbZoTBZmI1DqIetFZAX5yvq0KW+knwe1J+FMCyx
         mWQFuBrKIeLWgNz3B+nGe74sFkc/WKr+Pn4S/9w0RTeT+foks2a/u85pRd6SKdpoGURN
         5Sgr8Q0HWNa3lZmgXLQkfuf29AacLKO6BXeYAJF5B3HhWh47la2tTFR3GdVGCkQakVnr
         LbKTAuzZ5wHcCMduYZCJIvS7Fj/ZhFhzouF4zJnRbCsHsKZ9fYBgWjCumUoqJijMnJzo
         BdMigZbjNZ5MudaYkZk7ydNNru5PmNZMKIqACHfQUu59CKFiJYB+UJZMD7T4x/+XGm7R
         UyJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CvxQO3jM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si1398716qvf.158.2020.02.18.02.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:28:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CvxQO3jM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j407X-0006pH-BD
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j406u-0006O3-K9
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:28:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j406t-0004NR-Oe
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:28:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56386
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j406t-0004N6-Kc
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582021691;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9G2T1FJIseTGfv+LxXtntL+vyZxljGI6k3rCeHwwlHs=;
 b=CvxQO3jMzymmrpGgPk7x84qKY+aZH31ruDkALW8H9K4C+rO6ZY4I4ZZXWuW2hG3kfvUji/
 3qBDepMTn+ozwnezviAY48A/qu/8C2N+9C9Yrhs57QsAeDBZ6kqhE8ruH1GerQ9wEibA6K
 4T71WRIPki/24htemkfYzluXYCyvmrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-b_QUBF01Mjm9yQIJQsz_Kg-1; Tue, 18 Feb 2020 05:28:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41440801E6D;
 Tue, 18 Feb 2020 10:28:07 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A17010021B2;
 Tue, 18 Feb 2020 10:27:54 +0000 (UTC)
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
Date: Tue, 18 Feb 2020 11:27:51 +0100
Message-ID: <87r1ysnqag.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: b_QUBF01Mjm9yQIJQsz_Kg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: IcpiAHqNa5sH

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: d32ca5ad798
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

