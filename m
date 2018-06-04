Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp425469wrq;
        Mon, 4 Jun 2018 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKNsLOJb1L9Y9cIxlfngvOXydfkhDSuhDNc8VLDUzR5iy8kuTy+q53HbNmrG8pBBkiCa44S
X-Received: by 2002:a37:5109:: with SMTP id f9-v6mr17989125qkb.305.1528107154379;
        Mon, 04 Jun 2018 03:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528107154; cv=none;
        d=google.com; s=arc-20160816;
        b=v7v/q25c8OpAjNzooR5woYRfHvBrl/snQyKfuFHhMpA9+49c+wALtGXdMd8fK0O3fm
         TYLZHi+wuxMhd0Dm2Pcsp4HmsGQm39PwI9pBqYjqEDlsR0ZbRNRHAb4iiMYgPCjV7uMi
         KRhyv5yI0nz126pe3goeMTxBtZA6DJI5lMQ92AyoHe3vcdgcHqzjxajaK+tH0Juo1pv1
         KGRSrBLKKc169JTVtQ5xd9E6f+KXldvf+/pDzwRQc2rUcyg1ZXCf3CC1brsOnDC44ca9
         B92bGHwRKLFjSxyTKQsb9kA2vzVF36nxqyfNYub1zcgDrZqNwU3fH02nPPRtmr68GupI
         eXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=qMggXF2lW3pdBg0GrJlytkWntXvwrMVghKj1SI4SIAo=;
        b=EHmQXjqS1N6LHeK3WG4hV3/OFDxICsYc4gBQD+oNL+mhF5/d+HAyMiR50g0fuco1rs
         7ky+iQqj/8+A86pL100eBDJYPgvcPG6f1GdSnRQKuFGWXsBkcki91Vapsd0l9c62AJXT
         zPeXPne4RDBFRKDohUkYHXKXuBLRIgSx2N6unamzsnX+4vhQt22qjo8FM3wScbXSXUQP
         i7k8jEC8MPtihHpr3k1SlxhZNd0tkeiwwKx784irp0d1+Aium2nTrDFOQB4dOstNi5HX
         YrcwZEqN2iQa706K88k1J38cMqZCJaPMTSa81HSVm2WPAPCe3WAXuX+SDcFnkJpgOS1+
         36zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u14-v6si363132qvb.224.2018.06.04.03.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 03:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPmTZ-0003D1-T9
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 06:12:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fPmTT-0003Cv-L1
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 06:12:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fPmTP-0001CY-JL
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 06:12:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52152 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fPmTP-0001CP-Dt; Mon, 04 Jun 2018 06:12:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B908D4002248;
	Mon,  4 Jun 2018 10:12:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2525F2023580;
	Mon,  4 Jun 2018 10:12:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 74CC21750E; Mon,  4 Jun 2018 12:12:21 +0200 (CEST)
Date: Mon, 4 Jun 2018 12:12:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
	<CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 04 Jun 2018 10:12:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 04 Jun 2018 10:12:22 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v3] qapi: command category to stimulate
 high-level machine devices
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	Steffen =?utf-8?B?R8O2cnR6?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNjIZV033EGr

On Mon, Jun 04, 2018 at 10:29:40AM +0100, Peter Maydell wrote:
> On 4 June 2018 at 10:20, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > Many of these inputs/outputs can be tied to an external UI.  A degree of
> > timing precision is required so that the UI is responsive, although
> > cycle-accurate timing is not what I'd expect from QMP.
> 
> Would we also be able to tie them to an internal UI, ie
> something that appears as another view in the GTK/etc
> UI frontends we have?

Should be doable too.  Basically a display device, which isn't a *real*
display but the UI.  Could show a rendering of the board, simliar to how
web emulation environments are doing it.  LED status could be rendered
directly to the board.  A virtual mouse could map mouse clicks to button
presses.

Doing more complex input that way (say a slider for the temperature
sensor) isn't going to work very well though ...

Sensor input in general is pretty much unsupported in qemu.

cheers,
  Gerd

