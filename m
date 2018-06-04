Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp388376wrq;
        Mon, 4 Jun 2018 02:30:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKwI3H/jvIRHcrSLnyddqA4P4WpJs5z4A/yuebMSR4HLIzXyFUAgquW/AKm/QBUB8TW1Wz1
X-Received: by 2002:aed:3b94:: with SMTP id r20-v6mr20506934qte.364.1528104611743;
        Mon, 04 Jun 2018 02:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528104611; cv=none;
        d=google.com; s=arc-20160816;
        b=fG/MOOLY1scZOtGmIXiUh6hluYgeX0JQGUR5oW8nGDXm5+1aW9PKHXGVIRi+Oud8KB
         kKUmBJpZcuuIDAMZUbuEAF/yIgfRE1my22KJvowHSHO7Y+3YtkptpPwElcC01NJ7HBHe
         7cn6+NdIKA9MYU3lrcYT/8uqmENkxvRUP/8aLSU1Pfq19sovoTguayHZiSF0K0Xs2IoX
         lBXLW6QgBZjWHI7HQd2oKZ4XQ0fuUd9GSYfyNXkvso5cuXxG/Kr/XaKL0fB3NFZxgCNj
         MP/xmPyoYepo/tQevRqtHWfzNzR8ZkYr0SWffR0j0pL+9StXATDYRplbPkPd8Yo8y4S6
         h7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=V2Zdh6MMb3IrM5OZRqVW9Pct1nE5eHXm/zv2oZCqfjs=;
        b=J+70B1IeOCajvQQ5rzuoOQMuPrGv7hEx+SVqNqe7yAkq38oWnB+7tAHUihb4bvxjAC
         ol41DTMn29Bho0ZGjzJyGl2mYa6YhoN9gW2aYxtQOnhNZVb+pNoz4nG2BRD+EWuRFUFO
         DzxdRB5RaqDWPwtfDJ/2iYUI+CRGYK6PW0bL9fkm243TSbSAZGvRfm61AUEv0uAKH0ZU
         L7SW0H9P+ADMmK+hGtzsINRgZiN8CV5dTmAVKWhNu+TXD9UV/62Wk0Ao89oumhNvCrsq
         nhW/oI1pc++TJZTU/M8Qpd1yjRbk0EpkjVQul9myu77tx6wylITbv/EBW5W422IB+Vd6
         X56Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZKqYRd6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64-v6si1400134qkf.210.2018.06.04.02.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 02:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZKqYRd6c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPloZ-0005Ii-8t
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 05:30:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPloQ-0005HE-75
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 05:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPloP-0000IU-DN
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 05:30:02 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:44251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPloP-0000Hf-7n
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 05:30:01 -0400
Received: by mail-ot0-x234.google.com with SMTP id w13-v6so9353974ote.11
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V2Zdh6MMb3IrM5OZRqVW9Pct1nE5eHXm/zv2oZCqfjs=;
	b=ZKqYRd6chEeZOSzvmGz5weIFLYse5AAu3taMSrBUBIumW1bTdybcPJ3pZ/3duYaWv1
	NnqZqmkVh3+hYy3V0ueQlVnaOEaCF9tqj8e3D2rmpp4UoPxMrYy3vA9Db2tgQl33kETg
	vveXd/wbZ3mZIr/KsMmdIdNt3CH2wL/sWU1Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V2Zdh6MMb3IrM5OZRqVW9Pct1nE5eHXm/zv2oZCqfjs=;
	b=MsLlBmeCddSdajdvu/cMsPf7V5dAZJjX+BvoRExNBpm97gJT+t8gvdusRbi5uUVl+3
	5wKNi35Fxd3dSUUsEvX4JsgO+2FNlh/koJQQnxLPBNRtUbp0kHjC5n3QDuJBxGCBnMsl
	f03hsH+9a3JCVkpzTxvbB4jQiIall92T8wS5RxubTWZ+bumRcTJH6em3DXnRrNOU7lxl
	PcCbPL5ngRh9p3bxMdjk9VCowgsjURSvJv3Zvy02iaRrC3l0M99c7PLHnqjegktBKHHQ
	VFzQc1sxN1y4E7EWkaX06YIVe4QvErEV7COZshaIm+gUAxr89tXw43dQSCQ8ApyS16Xx
	4qPw==
X-Gm-Message-State: APt69E1EiEsyWgAh4BPpU2Bx+Ei+IzJBkP9AmZxybUBp8i+D30iBUwRU
	PzeveBg7GZjvcu4BvN9Izyb2pNuY2lzqPRLx15Ztog==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr4420274ote.205.1528104600513; 
	Mon, 04 Jun 2018 02:30:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 02:29:40 -0700 (PDT)
In-Reply-To: <20180604092008.GA13674@stefanha-x1.localdomain>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 10:29:40 +0100
Message-ID: <CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
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
Cc: Jim Mussared <jim@groklearning.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h5WEnudUzxTe

On 4 June 2018 at 10:20, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> Many of these inputs/outputs can be tied to an external UI.  A degree of
> timing precision is required so that the UI is responsive, although
> cycle-accurate timing is not what I'd expect from QMP.

Would we also be able to tie them to an internal UI, ie
something that appears as another view in the GTK/etc
UI frontends we have?

thanks
-- PMM
