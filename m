Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0009606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bfMI5FGV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVQdg-0008Nz-1y; Mon, 23 Nov 2026 04:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1xVQdb-0008Mr-J9
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 04:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1xVQdX-0000Co-P4
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 04:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795427216;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FW+YQVJV2Wr/PanDz3pUuTIXzvlW0oKXdbadxrtAinw=;
 b=bfMI5FGVtWcRv+crFYdIkiY2wfdecBy+nsaKjgkfSMGWJH9R08Wz/lGM71QIlkCtb49do/
 e8CgCNyFG4p2Ay/22JtFb36bDOin8HVpR1ndaZ4Fu252yyp+FyrihcVAZJvPbfOhwPFaSo
 LTGZ4w8P5Gx094CVCE1L+t5P7jcRcbA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-M4_wU6KDMnK4S4J3G6haoA-1; Mon,
 23 Nov 2026 09:46:52 +0000
X-MC-Unique: M4_wU6KDMnK4S4J3G6haoA-1
X-Mimecast-MFC-AGG-ID: M4_wU6KDMnK4S4J3G6haoA_1795427209
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 471E31800607; Mon, 23 Nov 2026 09:46:48 +0000 (UTC)
Received: from redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 72126343; Mon, 23 Nov 2026 09:46:42 +0000 (UTC)
Date: Mon, 23 Nov 2026 09:46:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-ppc@nongnu.org, Thomas Huth <th.huth+qemu@posteo.eu>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 02/12] tests/functional: update sha digests for tuxrun
 kernels
Message-ID: <awQLf03cS-zAN6jU@redhat.com>
References: <20261120121458.3723625-1-berrange@redhat.com>
 <20261120121458.3723625-3-berrange@redhat.com>
 <CAJ+F1C+eBx6qUmtLGw2vSgk+Pp=Zpt92_tokyyGsrCREaE45gQ@mail.gmail.com>
 <114d8912-4aee-4312-9527-69dce1b8d5e0@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <114d8912-4aee-4312-9527-69dce1b8d5e0@linaro.org>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: pBuFjb1njQIPB09xl1sKN1Cd4NuEu3VjM1q4LWTaJUk_1795427209
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 01:54:10PM -0800, Richard Henderson wrote:
> On 11/20/26 04:23, Marc-André Lureau wrote:
> > On Fri, Nov 20, 2026 at 4:16 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > 
> > > The images appear to have been regenerated since the recorded
> > > digests no longer match
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > See also
> > https://patchew.org/QEMU/20261112133320.418012-2-marcandre.lureau@redhat.com/
> 
> Indeed, Marc's use of dated urls should avoid some of the issues, until the
> url is removed due to age.

Agreed, consider this patch dropped in favour of that one.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


