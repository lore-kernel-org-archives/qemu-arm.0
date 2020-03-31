Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3969552lfi;
        Tue, 31 Mar 2020 06:29:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vviRJADJ8I0yDnGRkWwJo+a+6/+StOvds0P861l0Pz1seRr8Hbd6HugmaryyorX8XmPnM1X
X-Received: by 2002:a37:8ac3:: with SMTP id m186mr5027446qkd.371.1585661394423;
        Tue, 31 Mar 2020 06:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585661394; cv=none;
        d=google.com; s=arc-20160816;
        b=NJErhoLOl8l6HWfAfQXpotM5NnaIeXhFeGq5rQjiyues3GvBGWc7Pl/3+zZB18wMf6
         OGseRuvNKDWzI1Vxzn1z5HoPxdsVb31irJkNDOaxjQCJCUyz/54fOlO69d+738yFdrSt
         JtsY292YtgjlOIjh7JHmcu7s4pjWfURZF2ZxoSFO5x7ivu851x81/XffaW8q/lh1smtM
         26ekHFGptDyHG6JiPnY0dY9PQ/RIKfZapnUPmRWc4x1it37z2EVCwPJsxbVSXWksFvHH
         5fyV7Rqq1IU26gmoC+E9gazAHSVTFY3c0GMZEsAQOP/UkVHCzdx/tgwaeqVMAO3r8/4J
         362g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=Q9AV3zmhXly1oADjwZuu9kxsW2xfs8rViy6qV1bZpxU=;
        b=Mt1JCG/MlBHvaI9X6Fzv2pBT2oYk0bNebOqvKQ4XpQAJqx68KJzVlZALKpPcxcNpc0
         ufw5b3mkgl1e4smadWTMZIsvb5PqiI0pNNwGXjnQsXCssviFUV0pei8A3I41kgws2xcL
         zYixz6tx6wO0kOwIGPxgiYrMdd1emenyXS3h7aCcs+yM1QD7CAo9K8pExJrxoRN7r2Fi
         kwmcitkfZF7Yo8yE5vWOYT7jm1EF+Cd4dIdRk9jgYSb4x/VyPbGaeWNgMqr2/7MNvxLz
         VnGMdDhzLg40rT5IRkhuOktW5YhOvXz1N9pJ8Kk68JIGBCA/DiwW7Gt2D0rFbdPndhWK
         H6KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K5DMzEBD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si9937152qtj.240.2020.03.31.06.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 06:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K5DMzEBD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJGxl-000555-QL
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 09:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42325)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jJGro-0002I5-7I
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jJGrn-0006nc-2I
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:23:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47147
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jJGrm-0006nF-UX
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 09:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585661022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9AV3zmhXly1oADjwZuu9kxsW2xfs8rViy6qV1bZpxU=;
 b=K5DMzEBDQXrLNNyS1HnV/RDQv0fUV7ABzYJtSKcnSkSQVnoRX2VVYErDvz7RmL9rR3+Qw1
 B5NyVOiVUfOfBHH51xv/Kl3C18mrUbpvJ7K1TyDuTug6ZfCOep/8h/Jm80N8a4NMRZcTnI
 XLZ00xsVXqo92MMwka9uBDzrwmjbEso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-WSZlPJq2NmafmNw_DWvElw-1; Tue, 31 Mar 2020 09:23:36 -0400
X-MC-Unique: WSZlPJq2NmafmNw_DWvElw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FD6DBB1;
 Tue, 31 Mar 2020 13:23:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2A335C21B;
 Tue, 31 Mar 2020 13:23:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4EE0A11385E2; Tue, 31 Mar 2020 15:23:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
References: <20200325191830.16553-1-f4bug@amsat.org>
Date: Tue, 31 Mar 2020 15:23:23 +0200
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 25 Mar 2020 20:18:18
 +0100")
Message-ID: <87r1x8vet0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4OqYfzTEiRXa

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This series is inspired of Peter fix:
> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>
> Add a cocci script to fix the other places.
>
> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>

I skimmed the code patches [PATCH 02-12/12], and they look like bug
fixes.  Other reviewers raised a few issues.

I also skimmed the Coccinelle script [PATCH 01].  Peter pointed out a
few things it apparently missed (e.g. in review of PATCH 06+11).
Moreover, the bug pattern applies beyond object_property_set() &
friends.  Perhaps the script can be generalized.  No reason to hold
fixes.  We may want to add suitable notes to the scipt, though.

Can you address the reviews in a v2, so we can get the fixes into -rc1,
due today?

