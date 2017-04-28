Received: by 10.25.0.144 with SMTP id 138csp239457lfa;
        Fri, 28 Apr 2017 08:01:27 -0700 (PDT)
X-Received: by 10.98.13.134 with SMTP id 6mr12091914pfn.112.1493391687172;
        Fri, 28 Apr 2017 08:01:27 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 88si6407809pfm.258.2017.04.28.08.01.26;
        Fri, 28 Apr 2017 08:01:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1165687AbdD1PBX (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Fri, 28 Apr 2017 11:01:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49014 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1165683AbdD1PBV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 28 Apr 2017 11:01:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A3EC03F21E;
        Fri, 28 Apr 2017 15:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A3EC03F21E
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A3EC03F21E
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com [10.36.116.149])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id DB8D0179FD;
        Fri, 28 Apr 2017 15:01:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
        id 30BAE1138646; Fri, 28 Apr 2017 17:01:12 +0200 (CEST)
From:   Markus Armbruster <armbru@redhat.com>
To:     Eric Blake <eblake@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        "open list\:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Alexander Graf <agraf@suse.de>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "open list\:Block layer core" <qemu-block@nongnu.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list\:X86" <xen-devel@lists.xenproject.org>,
        Richard Henderson <rth@twiddle.net>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>, alistair.francis@xilinx.com,
        "open list\:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Igor Mammedov <imammedo@redhat.com>,
        Cornelia Hu ck <cornelia.huck@de.ibm.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Kevin Wolf <kwolf@redhat.com>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Max Reitz <mreitz@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list\:Old World" <qemu-ppc@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [Qemu-devel] [PATCH v5 3/4] shutdown: Add source information to SHUTDOWN and RESET
References: <20170428021317.24711-1-eblake@redhat.com>
        <20170428021317.24711-4-eblake@redhat.com>
Date:   Fri, 28 Apr 2017 17:01:12 +0200
In-Reply-To: <20170428021317.24711-4-eblake@redhat.com> (Eric Blake's message
        of "Thu, 27 Apr 2017 21:13:16 -0500")
Message-ID: <87h918bmpz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 28 Apr 2017 15:01:18 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZH+UlDQkIgV/

Eric Blake <eblake@redhat.com> writes:

> Libvirt would like to be able to distinguish between a SHUTDOWN
> event triggered solely by guest request and one triggered by a
> SIGTERM or other action on the host.  While qemu_kill_report() is
> already able to tell whether a shutdown was triggered by a host
> signal (but NOT by a host UI event, such as clicking the X on
> the window), that information was then lost after being printed
> to stderr.  The previous patch prepped things to use an enum
> internally; now it's time to wire it up through all callers, and
> to extend the SHUTDOWN and RESET events to report the details.
>
> Enhance the shutdown request path to take a parameter of which
> way it is being triggered, and update ALL callers.  It would have
> been less churn to keep the common case with no arguments as
> meaning guest-triggered, and only modified the host-triggered
> code paths, via a wrapper function, but then we'd still have to
> audit that I didn't miss any host-triggered spots; changing the
> signature forces us to double-check that I correctly categorized
> all callers.
>
> Since command line options can change whether a guest reset request
> causes an actual reset vs. a shutdown, it's easy to also add the
> information to the RESET event, even though libvirt has not yet
> expressed a need to know that.
>
> For the moment, we keep the enum ShutdownCause for internal use
> only, and merely expose a single boolean of 'guest':true|false
> to the QMP client; this is because we don't yet have evidence that
> the further distinctions will be useful, or whether the addition
> of new enum members would cause problems to clients coded to an
> older version of the enum.
>
> Update expected iotest outputs to match the new data.
>
> Here is output from 'virsh qemu-monitor-event --loop' with the
> patch installed:
>
> event SHUTDOWN at 1492639680.731251 for domain fedora_13: {"guest":true}
> event STOP at 1492639680.732116 for domain fedora_13: <null>
> event SHUTDOWN at 1492639680.732830 for domain fedora_13: {"guest":false}
>
> Note that libvirt runs qemu with -no-quit: the first SHUTDOWN event
> was triggered by an action I took directly in the guest (shutdown -h),
> at which point qemu stops the vcpus and waits for libvirt to do any
> final cleanups; the second SHUTDOWN event is the result of libvirt
> sending SIGTERM now that it has completed cleanup.
>
> The replay driver needs a followup patch if we want to be able to
> faithfully replay the difference between a host- and guest-initiated
> shutdown (for now, the replayed event is always attributed to host).

I'd prefer to get this right from the start, but that requires input
from replay guys.

Scandalously, replay/ is not covered by MAINTAINERS.
scripts/get_maintainers.pl blames it on Pavel Dovgalyuk (cc'ed), and git
shows recent activity.  Pavel, please post a suitable patch to
MAINTAINERS, and please help us figure out what to do about replaying
reset here.

> See also https://bugzilla.redhat.com/1384007
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
