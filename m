Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4562399wre;
        Wed, 30 May 2018 03:13:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLEomQCBqE3QdI6K7ivZ+gc8yJYtk7HCSMHfLRRYyWmYQTrJIwiAWLosP0up7Roer0OVBTX
X-Received: by 2002:ac8:2d0e:: with SMTP id n14-v6mr1910901qta.338.1527675206285;
        Wed, 30 May 2018 03:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527675206; cv=none;
        d=google.com; s=arc-20160816;
        b=esKqyC8tVcfyTGcUH7mmsmiq5JK05QsSVT4ExVMRNE+3GbENuBrldhzxQAEyjm5tGe
         JhFircJvXn3QC6818bCVCpBjrbc8pZb/m6rOwYdC00dMXlc5UXdTjSCEigh70Tm/blKQ
         2MUTd3KgyVrEBOi5fMipQXnk1r7I5Ok2V1tMyVtz2m0WeueWxnMsSwAe2OsiB90fQ9Ir
         lC71tuzijHQK9gi2ZrOVnz0zruD/DCXumdAy3hjzQuIQk1t/4RkI80ABCYiA4E4rEmJW
         AhPGH9UdE5Pv2Ebyki9ZAz2FZsQ1c+2/fpcWT4FHPSNS9JZ+IyT4sCWc8GhYivBsYRct
         04KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=Kc78UMZzGD3Ej3qjxT+DJOkR0lShDjhjOEbXyHqZQo8=;
        b=tNKYZ8TmHyVkk8DUgfJM2FmshU+lbzxkUO7nMsuRpHp+jW5Wlhs379KaBGdM67cPSz
         zJUXd8PDucOQ+t7W0VJ2ihaN1ID2d0PDuEDa7pgfFm9+c1zCWiog8aU6OV99irnFydh0
         hvKOuvpfSWzVezdfF/el5Wfsn8YNSunFDiiSgNhgRXf53RqcH1n8SlRhdcjDDuUnXECo
         D4NTvTXz07PK3cijdlW8VAtcNojsUQj3MOJteMFFts627+kw7Ev2EUD7MSrmLxWnncT5
         pKQlc0Kii+SKleS5luLn724P7RIsKIdgtu8KV5EwgTLYYHQeKrKv5tpt6rbQkgeIow6H
         D3lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c142-v6si14141074qke.296.2018.05.30.03.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 03:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNy6f-0008M4-Pm
	for alex.bennee@linaro.org; Wed, 30 May 2018 06:13:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNy6Y-0008LZ-2o
	for qemu-arm@nongnu.org; Wed, 30 May 2018 06:13:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNy6U-0000PN-Ty
	for qemu-arm@nongnu.org; Wed, 30 May 2018 06:13:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44488 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNy6U-0000OJ-Os; Wed, 30 May 2018 06:13:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AC79818BAF1;
	Wed, 30 May 2018 10:13:08 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8977A6B5B1;
	Wed, 30 May 2018 10:13:01 +0000 (UTC)
Date: Wed, 30 May 2018 12:12:59 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180530121259.74bc4234.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-10-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 10:13:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 10:13:08 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, "open
	list:S390" <qemu-s390x@nongnu.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Vhrfj5UVcn6

On Mon, 28 May 2018 20:27:07 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Code change produced with:
>     $ git grep '#include "exec/exec-all.h"' | \
>       cut -d: -f-1 | \
>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|si=
nglestep|TranslationBlock)" | \
>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h                        | 1 -
>  target/arm/arm_ldst.h                  | 1 -
>  hw/i386/kvmvapic.c                     | 1 -
>  target/arm/arm-powerctl.c              | 1 -
>  target/arm/crypto_helper.c             | 1 -
>  target/arm/iwmmxt_helper.c             | 1 -
>  target/arm/neon_helper.c               | 1 -
>  target/arm/psci.c                      | 1 -
>  target/arm/vec_helper.c                | 1 -
>  target/cris/cpu.c                      | 1 -
>  target/hppa/helper.c                   | 1 -
>  target/hppa/int_helper.c               | 1 -
>  target/i386/hax-all.c                  | 1 -
>  target/i386/hax-mem.c                  | 1 -
>  target/i386/hax-windows.c              | 1 -
>  target/i386/hvf/hvf.c                  | 1 -
>  target/i386/hvf/x86_task.c             | 1 -
>  target/i386/whpx-all.c                 | 1 -
>  target/lm32/cpu.c                      | 1 -
>  target/m68k/cpu.c                      | 1 -
>  target/moxie/cpu.c                     | 1 -
>  target/moxie/mmu.c                     | 1 -
>  target/openrisc/cpu.c                  | 1 -
>  target/ppc/int_helper.c                | 1 -
>  target/s390x/cpu.c                     | 1 -
>  target/s390x/diag.c                    | 1 -
>  target/s390x/helper.c                  | 1 -
>  target/tilegx/cpu.c                    | 1 -
>  target/xtensa/core-dc232b.c            | 1 -
>  target/xtensa/core-dc233c.c            | 1 -
>  target/xtensa/core-de212.c             | 1 -
>  target/xtensa/core-fsf.c               | 1 -
>  target/xtensa/core-sample_controller.c | 1 -
>  target/xtensa/cpu.c                    | 1 -
>  tcg/tcg-op-vec.c                       | 1 -
>  target/xtensa/import_core.sh           | 1 -
>  36 files changed, 36 deletions(-)
>=20

However you arrived at it, this looks sane, so

Acked-by: Cornelia Huck <cohuck@redhat.com>
