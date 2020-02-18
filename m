Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5980806lfp;
        Tue, 18 Feb 2020 02:35:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQfmubfkOKH/IvvG0FfqgEXZeIcF78EdqcfElSqW+HgVchf5oAjkxDlTIyInSt4rRb0Z54
X-Received: by 2002:ac8:1c1d:: with SMTP id a29mr16506911qtk.183.1582022105908;
        Tue, 18 Feb 2020 02:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582022105; cv=none;
        d=google.com; s=arc-20160816;
        b=Xz9OSUjgqhYSCt1tXTJGyqx4vsZVihIdogGMkq0QtJfmKvtohQ8/KKXlbuBwV2MP4B
         R8iV2CJId97aTYlAnui5LJzgfCQoopcwo4ifHZA8/foVTwqAs9M9w/SE03aMBFZNM2qG
         3XsD0WbbuWzth4Ks3EbthqpVWEhw4lnU95vIYAMur3WC1S+Vk6CtzVTpI21scsrcPUqH
         8AYxZm8XmW58sL8z25GYxQAyk+XIf+i7bEPWmY9YjFatOA8bT895SipN/w47pzuBxRi9
         mH/pj49cDHsKlhXIocBwkZmDoOkYM8y5zkCXdEUW3ETatvq7ynzOetr98q/tXgPzC3T8
         +ghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=cHvYpcDrHNi0jmtvHi5F3RD1e3HRjxtiCWreI9vii74=;
        b=0yxSG+6qxJwQc8WTs6OX9tEvmUCqa7Nx2hcpPPS4P5g6JlgrtLkpXzOqJRhHBQXYGW
         4hIVc7d6QinKz9XH5DqGVtZh4MSTNs0Z7xtbTob3tgTBTuokdtapMI3BVnt0htctbAG6
         fR7CSRpsrnX7/92zafr1RmYxhoXCeXm3kFakYNEm1WRQGlZ1oIOvL2izNNDsNzI62I9R
         +Fl3ZRWKM8DFeAE9Fa7Ni2IULfzK2PdAsMCHXDhMKB0/0G9ti19i8H873t/3fKygzh9o
         5VKMBlyDkn3lm6BIWzS/Kq/H/7phAmUg1DS2nk19T+um/fZ4picUwRbugxndKTOPijU9
         N9Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tol1xs+C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si1582118qtl.95.2020.02.18.02.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:35:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tol1xs+C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j40DZ-0000ix-B8
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j40C5-0006sc-MP
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:33:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j40C4-0006qf-Qm
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:33:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33749
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j40C4-0006q3-Md
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHvYpcDrHNi0jmtvHi5F3RD1e3HRjxtiCWreI9vii74=;
 b=Tol1xs+CAJn7EECc3Gh6B8nl+jgeFWB2lmdC3yNytgmiEm3zuMmZRREHIFEzAup8wVV54t
 f/EC1NiXRfL/rnJqWGTeceoCQHGdb7E1kXFfTYVVy1dEkWAVa7aANcWd0+j8lsWjZpZUCJ
 iwCs1ZGrc1GEfDbE8Z2If/e6fNeGZmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-aLTvOjWmOoyfIACJsGpPXA-1; Tue, 18 Feb 2020 05:33:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62445189F760;
 Tue, 18 Feb 2020 10:33:27 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF13A5D9E2;
 Tue, 18 Feb 2020 10:33:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 11/13] target/i386/whpx: Remove superfluous
 semicolon
In-Reply-To: <20200218094402.26625-12-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Feb 2020 10:44:00
 +0100")
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-12-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 11:33:10 +0100
Message-ID: <87k14kmbh5.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: aLTvOjWmOoyfIACJsGpPXA-1
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
 Gerd Hoffmann <kraxel@redhat.com>, Justin Terry <juterry@microsoft.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
X-TUID: g655qaxWTtL+

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> Fixes: 812d49f2a3e
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

