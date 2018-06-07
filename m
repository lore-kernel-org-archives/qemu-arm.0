Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2068285wrq;
        Thu, 7 Jun 2018 05:59:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLIKngh5Ef0EPrJSw1Vo5U3y325a+P4E7uOKdFyKxPOov+oWNhgQOoPSXwU7xY4UcPVu0Kl
X-Received: by 2002:ac8:2fec:: with SMTP id m41-v6mr1620934qta.55.1528376348446;
        Thu, 07 Jun 2018 05:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528376348; cv=none;
        d=google.com; s=arc-20160816;
        b=tD2euJpYyydmA63mFtUJo5FICbP435vMpbHmYKHHD0CvmdorLS6A2OlI8XH3cljNIu
         b9NPPR8WjVyKlBlLed+w9mzVV5zBNugy/FDpjECoT/JMKjq7URpbdbNk29XbuUETIt9Z
         dpv1kwAQ+SrQvK2LLtiXC1W6vErGILIqM2IHy9x+DOkNWBcwE5DeWatah/xSdZSKwAdP
         kbtJxljZVGRMnteu1Uoabw1+NRPDgR1Hca7cE7HnYfoiDXYmTwRYR+kqMKl48KALCHuY
         fqvdEgLQcV19bmcNjnp2KIHpwzvROFBAaDY6bd5fPekT7h4/igjykiXnhrZgTYvZOdZx
         NRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=x0crRKEUAWnnh51gazKQwYxSvpFKr5jUJtIA+zB445E=;
        b=EgyH+2o0Bcbtj6zWRb2Dj3WtQJK5E4lFjWWiqIZ+gBw5zoo0+mxgmVHlrs1nvPGJI/
         8ZMeIhqiBmrE4SkuaXetNCsvgXVRwKbg/kYetJz8XfJrhz2q9H7xbW4+LyHlAx4m9qyM
         84HQSnTpecnyQronidChYaR+EPHKGMoA3wjWLAUwAjgcqgDMKi2FSE1zct88vJqgYUkM
         cEirDZ3FG397VgGBhL0hHnAlBpawPoX3t/4NoH/YUgYwZPI3LRr7Og74Q33iL/uJcvfv
         oxc3gj8GS8OtbJraoh8VQeSR2YDqJ05+fAfjmFqUPjKAOwj2wQBB7KqCabDj0jWex2Y2
         GSDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r71-v6si1515197qkl.257.2018.06.07.05.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 05:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQuVP-0002nM-VX
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 08:59:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fQuVG-0002mL-LN
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:58:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fQuVD-0006YY-Jw
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 08:58:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56590 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fQuVD-0006Xp-FR; Thu, 07 Jun 2018 08:58:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48AA1401DEA4;
	Thu,  7 Jun 2018 12:58:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C71932026993;
	Thu,  7 Jun 2018 12:58:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3555531F63; Thu,  7 Jun 2018 14:58:53 +0200 (CEST)
Date: Thu, 7 Jun 2018 14:58:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20180607125853.5hcd2bhhjedfngre@sirius.home.kraxel.org>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
	<CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
	<20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
	<20180607102455.GD19032@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180607102455.GD19032@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 07 Jun 2018 12:58:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 07 Jun 2018 12:58:54 +0000 (UTC) for IP:'10.11.54.4'
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Eric Blake <eblake@redhat.com>,
	Steffen =?utf-8?B?R8O2cnR6?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: St9t03S50GH9

  Hi,

> I prefer the WebSocket route over creating a fake display that will not
> be able to implement complex widgets well.

Makes sense.

> Gerd: What is your preference?  Do you want board-specific fake displays
> inside the QEMU process as the long-term direction for UIs?

Well, it isn't the one or the other, we could actually do both.  For the
deployments you are looking for the websocket approach proably works
best.  Being able to do at least simple stuff (say led display and
a+b+reset buttons) with a fake display, without requiring setting up
something separate for the UI can be quite useful too.

Your call.
