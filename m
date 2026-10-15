Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF927CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 07:49:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHGCj-0008Ck-Qd; Thu, 15 Oct 2026 03:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xHGCi-0008CA-HV
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 03:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ghoffman@redhat.com>)
 id 1xHGCg-00044N-6P
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 03:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792050520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvrAb39CBS/m6Qa501kHY6otTYYAf79JfX8qgJU3AIw=;
 b=BF3La7rZFbFGIv6ZKW7uq710v+etUlSPsSA5Y01ZQnmBa+ThDFZI8Aln9xp7Xd8hELPIqk
 SFcCpO8QyTYMGhMppZuFcmdVpwbsMMIx0201kjHyzvF8ZBkXXzA7sFfoMYbteFOxA3cCLI
 /rD20ArdkDgcOvBqsLQ9w3kbr+2tWAo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-hqMu0piFMT-ze9S6kHYBVw-1; Thu,
 15 Oct 2026 07:48:36 +0000
X-MC-Unique: hqMu0piFMT-ze9S6kHYBVw-1
X-Mimecast-MFC-AGG-ID: hqMu0piFMT-ze9S6kHYBVw_1792050514
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F2AE918004DB; Thu, 15 Oct 2026 07:48:33 +0000 (UTC)
Received: from nucbdw.ghoffman.csb.home.kraxel.org
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E7EC8195608A; Thu, 15 Oct 2026 07:48:32 +0000 (UTC)
Received: by nucbdw.ghoffman.csb.home.kraxel.org (Postfix, from userid 11758)
 id BD34D40785FB; Thu, 15 Oct 2026 09:48:30 +0200 (CEST)
Date: Thu, 15 Oct 2026 09:48:30 +0200
From: Gerd Hoffman <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 David Hildenbrand <david@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 7/9] igvm: release found memory region on success
Message-ID: <atCEEIRn9yFLj1hg@nucbdw.ghoffman.csb.home.kraxel.org>
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-7-2b21e63974f3@redhat.com>
 <CAJ+F1C+NLd2Nzmg1eLnH1La2yA1vw8dm7nEb2k93tcUCK4LzrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+NLd2Nzmg1eLnH1La2yA1vw8dm7nEb2k93tcUCK4LzrA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: DSn7Of3332n5pIuJpICrchUfCG8igb66Lo4a1RflJxg_1792050514
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ghoffman@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Oct 13, 2026 at 05:31:41PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Sun, Sep 6, 2026 at 12:55 PM Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Not only in error paths must the mrs.mr be released.
> >
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> 
> ping

Sorry, slipped though.

Ani, you looked into this recently, any comment?

Also: what is the overall state if this series?  There is another igvm
patch (8/9), but trying to apply the whole series fails due to conflicts
in the igvm code.

take care,
  Gerd


