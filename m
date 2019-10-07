Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3975087wrm;
        Mon, 7 Oct 2019 08:57:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxiMvZ11/w4Lb1Xco8EzTRk4XLumA4kjxg500H3EbD8XZ7vNYp4bWrzADlEtAkzIck6f0jQ
X-Received: by 2002:a17:906:a2c9:: with SMTP id by9mr24525231ejb.29.1570463837576;
        Mon, 07 Oct 2019 08:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570463837; cv=none;
        d=google.com; s=arc-20160816;
        b=RsNZoX0dUkhjmnDy4Ti/3sxZ7XJcj0uMwM/LnFXReakqubD8Q/FoHs3KlXW+P3Km0n
         dvPwNoKTeHk6tBUWQ8mySMW4yP19xAxO1snrWaSFPbe/gR3B7DdTD1FJFuqgApHMfSZY
         hSMtkIqK/A/LEDEf9KORyXjumemdvAhzUU60bqpfIUVvHEehZTOMngXDCtUeM6rbAXES
         K6pzRb/RKFJYsVmAFuM7K8zflBfFobPC7UJntVaESZoBkFqcSVeFv176nABuZPM7bWQm
         aVkeIy8dpjFhyUkhJOAwdlwj32V+vuungOrL6WMH763ZuH1CUTuukSZforj173pBA+6d
         L56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date;
        bh=pi7a46TtuaidAvglL3jzH4BNmPcJqtOhbju83K8kc8w=;
        b=N3wZYt2c3AyrFwtfvIKt4WumQOlnQOTZURfjG4fZXHRoaGa4szCBeHrYXnRhub/5E5
         OP2P1HtN55CF5JDeLF6/HAlbPx9aU4+D7DIgGUtu1OxmGR+kpOk7Ckqy1Rv3wm+3b3L5
         hs9yQNybX31edu88y7SHfWSPxQXOIl7UrqWvC6K1ZSM3k6q7/RSaqd2TnWLPMPmYOKFg
         k0MjFilKVsPVab0WeC9OaT6JbkDm2FQpb+0Ex1vZvGR9QIm7lhrfineZUDo7bh7OPsjJ
         VnCsKJ7at0x9A10hRjOvWl/po8htsyf77qC3GKkrZXOejYXZEj7Ar3vT1vWvFYQGcHlf
         Dghw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w54si9276781edd.427.2019.10.07.08.57.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 08:57:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHVNs-0002Vt-Am
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 11:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iHVMu-0002SI-Qa
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:56:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iHVMt-0002Q9-8z
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:56:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39862)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iHVMl-0002Mn-6D; Mon, 07 Oct 2019 11:56:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95A2930860B5;
 Mon,  7 Oct 2019 15:56:05 +0000 (UTC)
Received: from gondolin (ovpn-116-231.ams2.redhat.com [10.36.116.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4C125D9CD;
 Mon,  7 Oct 2019 15:55:17 +0000 (UTC)
Date: Mon, 7 Oct 2019 17:55:14 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 06/31] python: add commit-per-subsystem.py
Message-ID: <20191007175514.19360a2b.cohuck@redhat.com>
In-Reply-To: <20191001155319.8066-7-vsementsov@virtuozzo.com>
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-7-vsementsov@virtuozzo.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 07 Oct 2019 15:56:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: fam@euphon.net, pburton@wavecomp.com, peter.maydell@linaro.org,
 codyprime@gmail.com, jasowang@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, kraxel@redhat.com,
 sundeep.lkml@gmail.com, qemu-block@nongnu.org, quintela@redhat.com,
 arikalo@wavecomp.com, mst@redhat.com, armbru@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, joel@jms.id.au, marcandre.lureau@redhat.com,
 rth@twiddle.net, farman@linux.ibm.com, ehabkost@redhat.com, sw@weilnetz.de,
 groug@kaod.org, yuval.shaia@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, clg@kaod.org,
 stefanha@redhat.com, david@redhat.com, jsnow@redhat.com,
 david@gibson.dropbear.id.au, kwolf@redhat.com, integration@gluster.org,
 berrange@redhat.com, andrew@aj.id.au, qemu-s390x@nongnu.org, mreitz@redhat.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Euu0kVLjVCb9

On Tue,  1 Oct 2019 18:52:54 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> Add script to automatically commit tree-wide changes per-subsystem.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> CC: kwolf@redhat.com
> CC: mreitz@redhat.com
> CC: jsnow@redhat.com
> CC: fam@euphon.net
> CC: sw@weilnetz.de
> CC: codyprime@gmail.com
> CC: marcandre.lureau@redhat.com
> CC: pbonzini@redhat.com
> CC: groug@kaod.org
> CC: sundeep.lkml@gmail.com
> CC: peter.maydell@linaro.org
> CC: stefanha@redhat.com
> CC: pburton@wavecomp.com
> CC: arikalo@wavecomp.com
> CC: berrange@redhat.com
> CC: ehabkost@redhat.com
> CC: david@gibson.dropbear.id.au
> CC: clg@kaod.org
> CC: mst@redhat.com
> CC: marcel.apfelbaum@gmail.com
> CC: mark.cave-ayland@ilande.co.uk
> CC: yuval.shaia@oracle.com
> CC: cohuck@redhat.com
> CC: farman@linux.ibm.com
> CC: rth@twiddle.net
> CC: david@redhat.com
> CC: pasic@linux.ibm.com
> CC: borntraeger@de.ibm.com
> CC: kraxel@redhat.com
> CC: alex.williamson@redhat.com
> CC: andrew@aj.id.au
> CC: joel@jms.id.au
> CC: eblake@redhat.com
> CC: armbru@redhat.com
> CC: mdroth@linux.vnet.ibm.com
> CC: quintela@redhat.com
> CC: dgilbert@redhat.com
> CC: jasowang@redhat.com
> CC: qemu-block@nongnu.org
> CC: integration@gluster.org
> CC: qemu-arm@nongnu.org
> CC: qemu-ppc@nongnu.org
> CC: qemu-s390x@nongnu.org
> 
> 
>  python/commit-per-subsystem.py | 69 ++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100755 python/commit-per-subsystem.py
> 
> diff --git a/python/commit-per-subsystem.py b/python/commit-per-subsystem.py
> new file mode 100755
> index 0000000000..d8442d9ea3
> --- /dev/null
> +++ b/python/commit-per-subsystem.py
> @@ -0,0 +1,69 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2019 Virtuozzo International GmbH
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import subprocess
> +import sys
> +
> +
> +def git_add(pattern):
> +    subprocess.run(['git', 'add', pattern])
> +
> +
> +def git_commit(msg):
> +    subprocess.run(['git', 'commit', '-m', msg], capture_output=True)
> +
> +
> +maintainers = sys.argv[1]
> +message = sys.argv[2].strip()
> +
> +subsystem = None
> +
> +shortnames = {
> +    'Block layer core': 'block',
> +    'ARM cores': 'arm',
> +    'Network Block Device (NBD)': 'nbd',
> +    'Command line option argument parsing': 'cmdline',
> +    'Character device backends': 'chardev',
> +    'S390 general architecture support': 's390'
> +}
> +
> +
> +def commit():
> +    if subsystem:
> +        msg = subsystem
> +        if msg in shortnames:
> +            msg = shortnames[msg]
> +        msg += ': ' + message
> +        git_commit(msg)
> +
> +
> +with open(maintainers) as f:
> +    for line in f:
> +        line = line.rstrip()
> +        if not line:
> +            continue
> +        if len(line) >= 2 and line[1] == ':':
> +            if line[0] == 'F' and line[3:] not in ['*', '*/']:
> +                git_add(line[3:])
> +        else:
> +            # new subsystem start
> +            commit()
> +
> +            subsystem = line
> +
> +commit()

Hm... I'm not sure about the purpose of this script (and my python is
rather weak)... is this supposed to collect all changes covered by a
subsystem F: pattern into one patch? If so, what happens to files
covered by multiple sections?
