Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp411565wrq;
        Mon, 4 Jun 2018 02:58:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLm2cTKbLy3U4xnpkpo6nYHkYm7XxTgQmnag/3X6T/GhiZZT+NjL1XmNHeQFszaVDqjdCFL
X-Received: by 2002:a37:7dc2:: with SMTP id y185-v6mr8978955qkc.232.1528106313016;
        Mon, 04 Jun 2018 02:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528106313; cv=none;
        d=google.com; s=arc-20160816;
        b=V6UXTDacYOZbzj6DMzkpRIsmaXQDW9DHu4OYn8hfkr8WKUDuKpyfjMFhjBZUlom85k
         7dpG/CgJD9C6ctccxkBw+6/4gTscFPSvmok44a6zusw5VkFHJ3JpeGL5/UszFxzoQxf8
         IvsKk6plvbX91E6RmUHnHohKJr+yGppJpOiRRcenCxkSszMjeukqWDo2H5BVyVHHMmNI
         Hp9yWn8w0mC3/UUnScTUQFqsvzduV2gdCZmgQ5SLV5W/4KUVlskZkHT3liZh4yTEoQbK
         KboXpNFV28SDjWnLtAIcXvUaxIawzT0mgLbOF/VIeTJmrC1lwIVqx2ZkfjI8qPlZ29GK
         9flQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=+cqYEkkSkIBaYjFrWsANApce6LB3wL1G34xOdCHgk/s=;
        b=ATYkuZb1nI9kUMNWJVfAP1FBcgxmUJCFHXsnxkiOEvCqDtR4qiKjfzUinOzpRKm2vm
         ruSXHL4Ej0rIocVK/Vrmza7UhnqaQDQEXc4Z5h6m1zsp7ri6p/84KapmLZUv+v21IKpA
         xiNumK0V6pA02VMh9av/z4/6pge7ld10NRiILChzkmuiRpO2iQQNIKQt4XY3xWa/fMAk
         y3XpvEn5pi+N2XhCmfqBa9eOePmmV1i4iPdg4T4pyOYcoEjdO5CEkTQFRGZCCLhYMUK1
         KemB/OWSIQQ/WhKeqNkv1VDol4fGNknK7jgvtuYIBc+fJwqRT28gyrvMos2okDA0Ohaq
         INkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l26-v6si1929587qkk.73.2018.06.04.02.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 02:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPmG0-0000M1-Ce
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 05:58:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fPmDu-0007Yn-2K
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 05:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fPmDt-0001B7-CW
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 05:56:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37176 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fPmDn-00018R-AI; Mon, 04 Jun 2018 05:56:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89391BD9E;
	Mon,  4 Jun 2018 09:56:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADF85202698A;
	Mon,  4 Jun 2018 09:56:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 05F1E1750E; Mon,  4 Jun 2018 11:56:12 +0200 (CEST)
Date: Mon, 4 Jun 2018 11:56:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20180604095612.hfk7zcujf6ph7fkj@sirius.home.kraxel.org>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180604092008.GA13674@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 04 Jun 2018 09:56:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 04 Jun 2018 09:56:14 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC v3] qapi: command category to stimulate
 high-level machine devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	Steffen =?utf-8?B?R8O2cnR6?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HTmv0pazA459

  Hi,

> > One aim of our efforts is to create a user interface that models the
> > look and feel of the physical microbit board and lets the user interact
> > with its inputs and provide feedback on its outsputs.
> > 
> > For this it is necessary to transmit user inputs such as the pressing of a
> > button to the machine.
> > In return, when the state of an output is changed on the machine, this
> > change needs to be reflected in the user interface.
> > At the moment, there are only a few QMP commands that provide user input to the
> > machine, eg. send-keys, input-button. These commands require very
> 
> QMP command names (from qapi/ui.json): send-key and input-send-event.
> 
> > high-level concepts, which are not really suitable for applications that
> > microcontrollers are typically used in in.
> 
> I agree that existing commands aren't suitable.  They are tied to
> QemuConsole, which makes sense for graphics + keyboard/mouse input
> devices but doesn't exist for microcontrollers.

Binding to a QemuConsole is optional, so that isn't an blocker.  Button
presses can be integrated without too much trouble I think.  One option
would be to just map them to keyboard keys.  As the buttons are named
'A' and 'B' using Q_KEY_CODE_{A,B} would be an obvious choice.

GPIO and other sensors can't be handled that easily.  The input layer
could be extended to handle them too, but maybe it is better to design
something else for them.

cheers,
  Gerd

