Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5427C9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBABL-0001N9-9n; Mon, 28 Sep 2026 08:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1xBAAI-00016o-UV
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:09:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1xBAAB-00064Q-ME
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790597334;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N44NDMt7gH7wG13kKZD9HCNCFqKm7fCYbpbuur6UAAU=;
 b=Dti3AbdeRGsWLrWCTP/sOZ7DderBxXMlZ0AM9nICw5Q/5OnWLVBFxKaKn7EZd3oYKZpMJK
 +9ozR5F2uwSorfOJhRjekuUQeQE10AyxZuSMR+zubZA+5lO/B4rs+Rpt0e+355I04FRd8k
 6azmlFf5pOgx/5ZcAgkhYx0nDiNbLBk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-j6ntZwIoPMKF3X_682JZ8w-1; Mon,
 28 Sep 2026 08:08:50 -0400
X-MC-Unique: j6ntZwIoPMKF3X_682JZ8w-1
X-Mimecast-MFC-AGG-ID: j6ntZwIoPMKF3X_682JZ8w_1790597329
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFDF318009D6; Mon, 28 Sep 2026 12:08:48 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5D0161800345; Mon, 28 Sep 2026 12:08:45 +0000 (UTC)
Date: Mon, 28 Sep 2026 13:08:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
Message-ID: <arpYyt5_K7fGfQYz@redhat.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com> <87se2tfurc.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87se2tfurc.fsf@pond.sub.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: yeSf4iKm_4P9vozJbYJJ_g70VTNjnh3AW5G-giPm_AE_1790597329
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.238,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Sep 28, 2026 at 02:03:19PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
> >> query-targets lists each linked target, including none, with its
> >> arch, endianness, and the machines that target accepts.
> >> 
> >> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >> ---
> >>  hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
> >>  qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++++
> >>  2 files changed, 65 insertions(+)
> >
> >
> >> diff --git a/qapi/machine.json b/qapi/machine.json
> >> index 6aaa2af709a..d8cdea6203e 100644
> >> --- a/qapi/machine.json
> >> +++ b/qapi/machine.json
> >> @@ -307,6 +307,41 @@
> >>  ##
> >>  { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
> >>  
> >> +##
> >> +# @TargetMachines:
> >> +#
> >> +# One registered system target and the machines that can run on it.
> >> +#
> >> +# @arch: the target architecture
> >> +#
> >> +# @endianness: the target endianness
> >> +#
> >> +# @machines: machine type names, not aliases
> >> +#
> >> +# Since: 11.2
> >> +##
> >> +{ 'struct': 'TargetMachines',
> >> +  'data': { 'arch': 'SysEmuTarget',
> >> +            'endianness': 'EndianMode',
> >> +            'machines': ['str'] } }
> >
> > We already have  'QemuTargetInfo' struct which is used
> > with 'query-target', that should also be used with the
> > new 'query-targets' command.
> >
> > We need to add the 'endianness' field to QemuTargetInfo.
> >
> > I don't think that we need to report machines though.
> > We already have 'query-machines' which gives much broader
> > information on the machines. "MachineInfo" needs to
> > gain
> >
> >    "targets": ["SysEmuTarget"]
> >
> > to list which target(s) a machine can be used with.
> 
> Do we need query-targets at all?  What information does it provide that
> cannot easily be computed from query-machines once we add @target and
> @endiannes to MachineInfo?

Hmm, yes, I need to get out of the "target oriented" mindset,
"machines" are the top level object of interest, and target
just a property of each.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


