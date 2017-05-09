Received: by 10.25.0.6 with SMTP id 6csp164547lfa;
        Tue, 9 May 2017 07:34:38 -0700 (PDT)
X-Received: by 10.200.1.142 with SMTP id x14mr500473qtf.26.1494340478615;
        Tue, 09 May 2017 07:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494340478; cv=none;
        d=google.com; s=arc-20160816;
        b=O7e+LNBQKyD7yTHQXmoEaDqv15PPrV5dqS+f7/3YDxJ/KvDL3L8qNWRlNLPLSjjcvw
         pbnJOqrSq1GnEbcGV7jMZi0ocqCdkvSdCLDN5Rzf5mdLDW4oAdIzwoawZudLL7tRXlwi
         DowSNATmzrId3gaETzevKqbIkTIRC3uiGEBIgm+qtsUyMAw6/RSk3dxdqvjbfp2XBLXv
         2R2F6GyL7bS4vVyOygirkxUf0SvdGSMgn6YT+DNSaQ+wFxh9M2yy3cejPvmQMsHbPmqg
         pduKU1Ou8lgdYD1TZ6BY4W753CumChFf4T4CJ9UhShYdJGhAm3t1w5qJV736VXQ1yM0W
         J9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :user-agent:references:lines:date:in-reply-to:to:from
         :arc-authentication-results;
        bh=aLeCVBJY8JNKwiSKqKvQ8elJH247QLpE4e7zIFWqWt4=;
        b=afchbBEAFNXlGPskZg1KEk/CNWBuKcxCIyLM6WsvTa/HRatL7MNh2eZRDzW4QPt7P+
         fjk7rboH3Kte881UIyg84lVwfg5ZXYiUninG9r+Of6LGHpLuM9pg68R8z41k52RIqH3X
         9nhBu2X/fWaAtupFconq6gX9yNM6VcWFhLh/cYjEX+oXYi05wagEJDaKXgsmuWA166oj
         Z93DJPc693aJQYXw/C/sBOmwLIVYEvPrGH/DE/SO9EkQ6IRFDsiLvdrDnKXJM5ajDrZO
         OPfOUmMPltKczAgGrIlU6ic6QOAQlzNjC7Ev2SgeNWr4AtZvN9GI76DwVD+PpagyO38X
         OwMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b4si174270qkd.303.2017.05.09.07.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 07:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d86Dm-0002Dh-5A
	for alex.bennee@linaro.org; Tue, 09 May 2017 10:34:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1d86Dg-0002Db-8V
	for qemu-arm@nongnu.org; Tue, 09 May 2017 10:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1d86Db-0002hl-Ua
	for qemu-arm@nongnu.org; Tue, 09 May 2017 10:34:32 -0400
Received: from oxygen.pond.sub.org ([144.76.244.19]:46288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@pond.sub.org>)
	id 1d86Db-0002bt-H2; Tue, 09 May 2017 10:34:27 -0400
Received: from blackfin.pond.sub.org
	(p2003007F8F538500DACB8AFFFEE0C842.dip0.t-ipconnect.de
	[IPv6:2003:7f:8f53:8500:dacb:8aff:fee0:c842])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id B17672C450;
	Tue,  9 May 2017 16:34:15 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 160AF11385E2; Tue,  9 May 2017 16:34:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
In-Reply-To: <20170508211953.28017-4-eblake@redhat.com> (Eric Blake's message
	of "Mon, 8 May 2017 16:19:51 -0500")
Date: Tue, 09 May 2017 13:56:46 +0200
References: <20170508211953.28017-1-eblake@redhat.com>
	<20170508211953.28017-4-eblake@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
Message-ID: <87efvyhzfc.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 144.76.244.19
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/5] shutdown: Add source
 information to SHUTDOWN and RESET
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:Overall" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Weil <sw@weilnetz.de>, alistair.francis@xilinx.com,
	"open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Richard Henderson <rth@twiddle.net>, Paul Burton <paul.burton@imgtec.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	Michael Walle <michael@walle.cc>,
	"open list:Old World" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BW59TvrkDaX

Resending because first send didn't get through to some recipients...

Eric Blake <eblake@redhat.com> writes:

> Time to wire up all the call sites that request a shutdown or
> reset to use the enum added in the previous patch.
>
> It would have been less churn to keep the common case with no
> arguments as meaning guest-triggered, and only modified the
> host-triggered code paths, via a wrapper function, but then we'd
> still have to audit that I didn't miss any host-triggered spots;
> changing the signature forces us to double-check that I correctly
> categorized all callers.
>
> Since command line options can change whether a guest reset request
> causes an actual reset vs. a shutdown, it's easy to also add the
> information to reset requests.
>
> Replay adds a FIXME to preserve the cause across the replay stream,
> that will be tackled in the next patch.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> [ppc parts]
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [SPARC part]
[...]
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index e890a5d..95fcac9 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -561,7 +561,7 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
>          uint16_t sus_typ = (val >> 10) & 7;
>          switch(sus_typ) {
>          case 0: /* soft power off */
> -            qemu_system_shutdown_request();
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>              break;
>          case 1:
>              qemu_system_suspend_request();
> @@ -569,7 +569,7 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
>          default:
>              if (sus_typ == ar->pm1.cnt.s4_val) { /* S4 request */
>                  qapi_event_send_suspend_disk(&error_abort);
> -                qemu_system_shutdown_request();
> +                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);

I'm fine with using SHUTDOWN_CAUSE_GUEST_SHUTDOWN for suspend, but have
you considered SHUTDOWN_CAUSE_GUEST_SUSPEND?

>              }
>              break;
>          }
[...]
> diff --git a/qmp.c b/qmp.c
> index ab74cd7..95949d0 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -84,7 +84,7 @@ UuidInfo *qmp_query_uuid(Error **errp)
>  void qmp_quit(Error **errp)
>  {
>      no_shutdown = 0;
> -    qemu_system_shutdown_request();
> +    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP);
>  }
>
>  void qmp_stop(Error **errp)
> @@ -105,7 +105,7 @@ void qmp_stop(Error **errp)
>
>  void qmp_system_reset(Error **errp)
>  {
> -    qemu_system_reset_request();
> +    qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP);

This is the only place where we pass something other than
SHUTDOWN_CAUSE_GUEST_RESET.  We could avoid churn the obvious way, but I
guess having the churn eases patch review.  Okay.

>  }
>
>  void qmp_system_powerdown(Error **erp)
> diff --git a/replay/replay.c b/replay/replay.c
> index f810628..604fa4f 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -51,7 +51,8 @@ bool replay_next_event_is(int event)
>          switch (replay_state.data_kind) {
>          case EVENT_SHUTDOWN:
>              replay_finish_event();
> -            qemu_system_shutdown_request();
> +            /* FIXME - store actual reason */
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);

The temporary replay breakage is no big deal.  Still, can we avoid it by
extending replay first, using a dummy value like
SHUTDOWN_CAUSE_HOST_ERROR until the real cause becomes available?  Not
sure it's worth a respin, though.

>              break;
>          default:
>              /* clock, time_t, checkpoint and other events */
[...]

Reviewed-by: Markus Armbruster <armbru@redhat.com>
