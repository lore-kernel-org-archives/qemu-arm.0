Received: by 10.25.0.144 with SMTP id 138csp697112lfa;
        Thu, 20 Apr 2017 05:09:46 -0700 (PDT)
X-Received: by 10.98.91.69 with SMTP id p66mr7258741pfb.2.1492690186748;
        Thu, 20 Apr 2017 05:09:46 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 67si6271929pgj.210.2017.04.20.05.09.46;
        Thu, 20 Apr 2017 05:09:46 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S969289AbdDTMJp (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 08:09:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56512 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S969286AbdDTMJn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 08:09:43 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 735B78051F;
        Thu, 20 Apr 2017 12:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 735B78051F
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=berrange@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 735B78051F
Received: from redhat.com (ovpn-117-195.ams2.redhat.com [10.36.117.195])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3EB80B0D;
        Thu, 20 Apr 2017 12:09:25 +0000 (UTC)
Date:   Thu, 20 Apr 2017 13:09:22 +0100
From:   "Daniel P. Berrange" <berrange@redhat.com>
To:     Markus Armbruster <armbru@redhat.com>
Cc:     Eric Blake <eblake@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexander Graf <agraf@suse.de>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Alistair Francis <alistair.francis@xilinx.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Scott Wood <scottwood@freescale.com>,
        Richard Henderson <rth@twiddle.net>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
Message-ID: <20170420120922.GJ20955@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k26fffxa.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 20 Apr 2017 12:09:43 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Helor7HA88+/

On Thu, Apr 20, 2017 at 01:59:29PM +0200, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
> > Libvirt would like to be able to distinguish between a SHUTDOWN
> > event triggered solely by guest request and one triggered by a
> > SIGTERM or other action on the host.  qemu_kill_report() is
> > already able to tell whether a shutdown was triggered by a host
> > signal (but NOT by a host UI event, such as clicking the X on
> > the window), but that information was then lost after being
> > printed to stderr.
> >
> > Enhance the shutdown request path to take a parameter of which
> > way it is being triggered, and update ALL callers.  It would have
> > been less churn to keep the common case with no arguments as
> > meaning guest-triggered, and only modified the host-triggered
> > code paths, via a wrapper function, but then we'd still have to
> > audit that I didn't miss any host-triggered spots; changing the
> > signature forces us to double-check that I correctly categorized
> > all callers.
> >
> > Here is output from 'virsh qemu-monitor-event --loop' with the
> > patch installed:
> >
> > event SHUTDOWN at 1492639680.731251 for domain fedora_13: {"guest":true}
> > event STOP at 1492639680.732116 for domain fedora_13: <null>
> > event SHUTDOWN at 1492639680.732830 for domain fedora_13: {"guest":false}
> >
> > Note that libvirt runs qemu with -no-quit: the first SHUTDOWN event
> > was triggered by an action I took directly in the guest (shutdown -h),
> > at which point qemu stops the vcpus and waits for libvirt to do any
> > final cleanups; the second SHUTDOWN event is the result of libvirt
> > sending SIGTERM now that it has completed cleanup.
> >
> > See also https://bugzilla.redhat.com/1384007
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> >
> > ---
> >
> > I did not wire up the RESET event to report guest-triggered, although
> > I had to plumb that through all the guests since qemu has options that
> > allow remapping reset to shutdown.  It's easy to add that if we want
> > it in v3.
> >
> > The replay driver needs a followup patch if we want to be able to
> > faithfully replay the difference between a host- and guest-initiated
> > shutdown (for now, the replayed event is always attributed to host).
> >
> >
> > v2: retitle (was "event: Add signal information to SHUTDOWN"),
> > completely rework to post bool based on whether it is guest-initiated
> > v1: initial submission, exposing just Unix signals from host
> > ---
> >  qapi/event.json             |  8 ++++++--
> >  include/sysemu/sysemu.h     |  4 ++--
> >  vl.c                        | 19 +++++++++++--------
> >  hw/acpi/core.c              |  4 ++--
> >  hw/arm/highbank.c           |  4 ++--
> >  hw/arm/integratorcp.c       |  2 +-
> >  hw/arm/musicpal.c           |  2 +-
> >  hw/arm/omap1.c              |  6 +++---
> >  hw/arm/omap2.c              |  2 +-
> >  hw/arm/spitz.c              |  2 +-
> >  hw/arm/stellaris.c          |  2 +-
> >  hw/arm/tosa.c               |  2 +-
> >  hw/i386/pc.c                |  2 +-
> >  hw/input/pckbd.c            |  4 ++--
> >  hw/ipmi/ipmi.c              |  4 ++--
> >  hw/isa/lpc_ich9.c           |  2 +-
> >  hw/mips/boston.c            |  2 +-
> >  hw/mips/mips_malta.c        |  2 +-
> >  hw/mips/mips_r4k.c          |  4 ++--
> >  hw/misc/arm_sysctl.c        |  8 ++++----
> >  hw/misc/cbus.c              |  2 +-
> >  hw/misc/macio/cuda.c        |  4 ++--
> >  hw/misc/slavio_misc.c       |  4 ++--
> >  hw/misc/zynq_slcr.c         |  2 +-
> >  hw/pci-host/apb.c           |  4 ++--
> >  hw/pci-host/bonito.c        |  2 +-
> >  hw/pci-host/piix.c          |  2 +-
> >  hw/ppc/e500.c               |  2 +-
> >  hw/ppc/mpc8544_guts.c       |  2 +-
> >  hw/ppc/ppc.c                |  2 +-
> >  hw/ppc/ppc405_uc.c          |  2 +-
> >  hw/ppc/spapr_hcall.c        |  2 +-
> >  hw/ppc/spapr_rtas.c         |  4 ++--
> >  hw/s390x/ipl.c              |  2 +-
> >  hw/sh4/r2d.c                |  2 +-
> >  hw/timer/etraxfs_timer.c    |  2 +-
> >  hw/timer/m48t59.c           |  4 ++--
> >  hw/timer/milkymist-sysctl.c |  4 ++--
> >  hw/timer/pxa2xx_timer.c     |  2 +-
> >  hw/watchdog/watchdog.c      |  2 +-
> >  hw/xenpv/xen_domainbuild.c  |  2 +-
> >  hw/xtensa/xtfpga.c          |  2 +-
> >  kvm-all.c                   |  6 +++---
> >  os-win32.c                  |  2 +-
> >  qmp.c                       |  4 ++--
> >  replay/replay.c             |  5 ++++-
> >  target/alpha/sys_helper.c   |  4 ++--
> >  target/arm/psci.c           |  4 ++--
> >  target/i386/excp_helper.c   |  2 +-
> >  target/i386/hax-all.c       |  6 +++---
> >  target/i386/helper.c        |  2 +-
> >  target/i386/kvm.c           |  2 +-
> >  target/s390x/helper.c       |  2 +-
> >  target/s390x/kvm.c          |  4 ++--
> >  target/s390x/misc_helper.c  |  4 ++--
> >  target/sparc/int32_helper.c |  2 +-
> >  ui/sdl.c                    |  2 +-
> >  ui/sdl2.c                   |  4 ++--
> >  xen-hvm.c                   |  2 +-
> >  trace-events                |  2 +-
> >  ui/cocoa.m                  |  2 +-
> >  61 files changed, 106 insertions(+), 96 deletions(-)
> >
> > diff --git a/qapi/event.json b/qapi/event.json
> > index e80f3f4..c230265 100644
> > --- a/qapi/event.json
> > +++ b/qapi/event.json
> > @@ -10,6 +10,10 @@
> >  # Emitted when the virtual machine has shut down, indicating that qemu is
> >  # about to exit.
> >  #
> > +# @guest: If true, the shutdown was triggered by a guest request (such as
> > +# executing a halt instruction) rather than a host request (such as sending
> > +# qemu a SIGINT). (since 2.10)
> > +#
> 
> "executing a halt instruction" suggests "halt" is a machine instruction.
> I think you mean /usr/sbin/halt.  Suggest something like "executing a
> halt command".

Well technically /usr/sbin/halt just terminates all processes / kernel and
halts CPUs, but the virtual machine is still active (and a 'reset' in the
monitor can start it again. /usr/sbin/poweroff is what actually does the
ACPI poweroff to trigger QEMU to exit[1]

Regards,
Daniel

[1] assuming ACPI poweroff is exposed to guest and supported by the guest
    kernel.
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
