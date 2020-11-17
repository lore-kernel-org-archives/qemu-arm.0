Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4484161lfb;
        Tue, 17 Nov 2020 02:20:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwACZaV/xacd1pmWtAIKZezhP65KQ9i53LjF2EunMQZBqDKlDdYJka+fck/70+thjFNLmrB
X-Received: by 2002:a25:9345:: with SMTP id g5mr20717204ybo.208.1605608456061;
        Tue, 17 Nov 2020 02:20:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605608456; cv=none;
        d=google.com; s=arc-20160816;
        b=svf+HUScY1hOrsH49medy4HYWkrtNlD3hqRan+/5j1hJkmQyqAgZrVQljvCwghTVx1
         KzcpjSwc6lDl8adBA5LjbSEc6wEV3Es7DhkzAY3EXrL/a9nH/8GWdrm0JLvxIR89ZC/2
         BJsnOP0hCXMGjs817k8FrZvXDacokUUQgMp7GduZh15gUs9Y17QSnCSkSBOLg5CQlSC1
         K6tU5ILuKS9XvnnS9ncDmcYdJsQx3Bo5+mfV23/DNjX+vWvb5FNqA62sB2jc2DKnlpkR
         BrkT99LcXTkb7LFmhsp1EdcwiVzeZHiNr04+hgikgd37pyPzxo8FrU2dw5ym6NruVytj
         TZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=XlpjVT4wpL+vDWEQQtVl0Y8ATKvIeO8kp1DROjvnfOM=;
        b=Z+nCBS0iGBNZgl7OfU429sY5pshoWH4sj1C0Thop9sniA15rPvWjH8qa83q2V8C62x
         xOgSSBepk13fIENeneBgbqpcSzR9sVHlOmwOO9/tLCINbRMgrXULmmdQ2DYdoBMg3zsz
         PvekWb596Y6tj/rYvDZFbU4dgc7Anw1Hdc+2oI1ntRGo+FBXEGtpcl9FZa1gMQbBiCu9
         lrSpx4Em0Ph1MD1RoyeL2IQxZVbDVkU1/f6fBOcL9KFnlHHVmqG7BC0VGZU/rAR5v35l
         F0LCB/araKSOZm4lj/ysPHhmtFtffp1OS05vNEAxtHJ14DrRCpb80x8XJIOP/dGwpaqI
         Sljg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V024GjsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si22807564ybn.452.2020.11.17.02.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 02:20:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V024GjsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1key6Z-00040S-DC
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 05:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1key6P-0003wn-53
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 05:20:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1key6K-0002rw-BQ
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 05:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605608439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XlpjVT4wpL+vDWEQQtVl0Y8ATKvIeO8kp1DROjvnfOM=;
 b=V024GjsOHE29cZN29CweXLrg+ZvudrvIGrFWZniZt3WfCqA1n25QxyCPyhFVYFtjmDL/jE
 qSngFJvhurd5xWHr+6REUQOI0hi6TSR5kaC48+KgifP6jxQncSLMu4LGpHYHhkFI13YacE
 t5FvRMqhnmA2dycKnUvAoXWKDBrIxVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-Hsa01aZOPVaVKzfe65DHMA-1; Tue, 17 Nov 2020 05:20:38 -0500
X-MC-Unique: Hsa01aZOPVaVKzfe65DHMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4EEC8030D0;
 Tue, 17 Nov 2020 10:20:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0811F60C05;
 Tue, 17 Nov 2020 10:20:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7C94A11358BA; Tue, 17 Nov 2020 11:20:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 4/7] qapi: Use QAPI_LIST_PREPEND() where possible
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-5-eblake@redhat.com>
Date: Tue, 17 Nov 2020 11:20:14 +0100
In-Reply-To: <20201113011340.463563-5-eblake@redhat.com> (Eric Blake's message
 of "Thu, 12 Nov 2020 19:13:37 -0600")
Message-ID: <87ft589tep.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "open
 list:GLUSTER" <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "open list:S390 KVM
 CPUs" <qemu-s390x@nongnu.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 "Daniel P. =?utf-8?Q?Berr?= =?utf-8?Q?ang=C3=A9?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, "open
 list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3JrIdgo2KIY5

Eric Blake <eblake@redhat.com> writes:

> Anywhere we create a list of just one item or by prepending items
> (typically because order doesn't matter), we can use the now-public
> macro.  But places where we must keep the list in order by appending
> remain open-coded until later patches.

"now-public" suggests a patch in this series made it public.  Used to be
the case, but no more.  Suggest "we can use QAPI_LIST_PREPEND()".

> Note that as a side effect, this also performs a cleanup of two minor
> issues in qga/commands-posix.c: the old code was performing
>  new = g_malloc0(sizeof(*ret));
> which 1) is confusing because you have to verify whether 'new' and
> 'ret' are variables with the same type, and 2) would conflict with C++
> compilation (not an actual problem for this file, but makes
> copy-and-paste harder).

I consider 2) a complete non-issue :)

> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.txt |  12 +--
>  block/gluster.c                     |   4 +-
>  block/qapi.c                        |   7 +-
>  chardev/char.c                      |  20 ++---
>  hw/core/machine-qmp-cmds.c          |   6 +-
>  hw/core/machine.c                   |  11 +--
>  hw/net/rocker/rocker_of_dpa.c       |  20 ++---
>  hw/net/virtio-net.c                 |  21 ++----
>  migration/migration.c               |   7 +-
>  migration/postcopy-ram.c            |   7 +-
>  monitor/hmp-cmds.c                  |  13 ++--
>  monitor/misc.c                      |  25 +++---
>  monitor/qmp-cmds-control.c          |  10 +--
>  qemu-img.c                          |   5 +-
>  qga/commands-posix-ssh.c            |   7 +-
>  qga/commands-posix.c                |  46 +++--------
>  qga/commands-win32.c                |  32 ++------
>  qga/commands.c                      |   6 +-
>  qom/qom-qmp-cmds.c                  |  29 ++-----
>  target/arm/helper.c                 |   6 +-
>  target/arm/monitor.c                |  13 +---
>  target/i386/cpu.c                   |   6 +-
>  target/mips/helper.c                |   6 +-
>  target/s390x/cpu_models.c           |  12 +--
>  tests/test-clone-visitor.c          |   7 +-
>  tests/test-qobject-output-visitor.c |  42 +++++------
>  tests/test-visitor-serialization.c  | 113 ++++------------------------
>  trace/qmp.c                         |  22 +++---
>  ui/input.c                          |  16 ++--
>  ui/vnc.c                            |  21 ++----
>  util/qemu-config.c                  |  14 +---
>  target/ppc/translate_init.c.inc     |  12 +--
>  32 files changed, 158 insertions(+), 420 deletions(-)

Quite a few more instances as in v1.  Some of the more "creative" ones
were bothersome to review.  I figure they were just as bothersome to
clean up.  Thanks for that!

Reviewed-by: Markus Armbruster <armbru@redhat.com>

