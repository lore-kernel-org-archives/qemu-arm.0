Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp309810wrx;
        Fri, 12 Apr 2019 22:04:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0cWXZYxCRnA0fS0w1ekQaCuA4Z12XOCmk8+yEx1K6MpCiAA+GGL550mSnLMSpJ8st2RnM
X-Received: by 2002:a7b:c309:: with SMTP id k9mr13550305wmj.45.1555131843983;
        Fri, 12 Apr 2019 22:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555131843; cv=none;
        d=google.com; s=arc-20160816;
        b=dCPvGxwmrYWyVKvlDMkfNSp5GLs1ft09XWTB9dTRGjZ2OdbHIPmSQsBruis9ubeMDX
         HWb0uab5+BpLiRVF1Qmy0R6gTlUqc7Y0ObAUMk5hrEqQVZM8FjgPVL76zTW0bY/04rFS
         Y4QiGFN21UHZjeQp50c8ltj/V/e3M/vfJEeNRcx4ddMOJLz1IYT0uHmwnlTt8osYAFg3
         PLwTNMN26qKDSBzSJZu2VFYWZQC6RSwnzIo/XLqpElqhcW42dZii4xu+9+0TPyb+R3AV
         HgJ7nBVxGHSyBfjoDjFgz35GV/LuHGJntIqP3UwpnC1pOaSdoYKTqX/m0iZbTuQjo5X/
         qejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=D/mVyuhj1mh+PEbCzNEhVVGMPy8dTI0m7Qi5rQcikNQ=;
        b=XOkTB9eQLT0mPOWXa9Km55MN4BLmwSmXBMuanH6gQdTIjvhxdOqZsakC4yY/0jMy2d
         xzIGKr0SZ/AvTUEPXbgXcAYO9mwLu7rwvKQgFVIkdEqU86tk/5hPBCj3H9pAZL9KHcEQ
         L9CTLUQThg472hp2olzg8sonzvU1F2Be2qqgCoatWOCFFt/6Pt3qLRnwWE3vaeqL/W/0
         VeNdrHr/OEId8CJzjJSirGYhh57joscL+v8sW7wFEqaUCGt13nWxyJLuvK2AARtN8sW5
         YpoR2hbQUMAYR7gQC+m2SJqB3o+hZckvgRTEV398K8IoePa4o+IehIkkiJNNjXPHS6Kp
         sdug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si28636606wrm.315.2019.04.12.22.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 22:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFApf-0004Y3-5v
	for alex.bennee@linaro.org; Sat, 13 Apr 2019 01:04:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hFApY-0004Xv-4T
	for qemu-arm@nongnu.org; Sat, 13 Apr 2019 01:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hFApW-0006Hu-Vx
	for qemu-arm@nongnu.org; Sat, 13 Apr 2019 01:03:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43970)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hFApW-0006Hh-Oi; Sat, 13 Apr 2019 01:03:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2DB93084242;
	Sat, 13 Apr 2019 05:03:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE2E05D9CD;
	Sat, 13 Apr 2019 05:03:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 449CB1138648; Sat, 13 Apr 2019 07:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <20190412152619.23542-1-thuth@redhat.com>
	<CAFEAcA9kXdUH3vkGLfEe+CFuD=S9XFEaWGNETre7gYOx5epFpQ@mail.gmail.com>
	<7d2fc749-e6ac-7646-8e37-3399d42b6822@redhat.com>
Date: Sat, 13 Apr 2019 07:03:52 +0200
In-Reply-To: <7d2fc749-e6ac-7646-8e37-3399d42b6822@redhat.com> (Thomas Huth's
	message of "Fri, 12 Apr 2019 20:59:12 +0200")
Message-ID: <87sgumh4xz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Sat, 13 Apr 2019 05:03:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/arm/nseries:
 Deprecate the n800 and n810 machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jB47OMXZ/DRf

Thomas Huth <thuth@redhat.com> writes:

> On 12/04/2019 18.02, Peter Maydell wrote:
>> On Fri, 12 Apr 2019 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> These machines depend on the deprecated bluetooth subsystem. In case we
>>> finally decide to remove the bluetooth subsystem, we likely need to
>>> remove the n800 and n810 machines, too, so mark them now as deprecated.
>> 
>> ...we could just remove the bluetooth devices from the boards?
>
> Maybe we could. But do we really want to spent time to work on boards
> that likely nobody uses anymore? Or do you know anybody using it?
> (at least Guenter does not seem to use it, according to his list, see
> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06125.html )

I think we're far too willing to drag along code of dubious utility.

Deprecation is not a death sentence.  It's a formal notice to users "we
intend to drop this, and now is the time to argue for keeping it".
