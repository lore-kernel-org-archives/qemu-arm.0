Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9550768wrx;
        Sat, 9 Mar 2019 06:51:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/cWXZdZzU/1RZz/Nw6HVwCgPxdd2t62doBAVQqEtz2oSCk3O1Qu1tjSk0/H7j3P2PjVpv
X-Received: by 2002:a25:ac5e:: with SMTP id r30mr14772866ybd.208.1552143061177;
        Sat, 09 Mar 2019 06:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552143061; cv=none;
        d=google.com; s=arc-20160816;
        b=Hme5k0ENMLHnqxfErBvDL3VxZDcPCMW0EwtzR1sXf6i5yAM4Pq6T5kwBTJZAydNoFW
         7rQoFGmCT90xZOCZr3Hkjc1n+0v9auzDhPjrDC2Xq+ZEAjaq+6DuwbI/D95gSPguQiS1
         sQgPxwGD4aBsUPO9T4hGV4gAbdAc8YUyAD84vEQis713du6+o1KXNpMwkLCYSUzvpmiS
         XUaGgcv0Yh1ALT1XKPV53NKeU3vcIcGcJHhG0ciMXzenxEfLVRunSUfYr3wgOQZohUP0
         pXd/6lnGGfjYiFnSqNa8YjvUsPccbfazWUQlUEKhMKsgrZJuvu2+3aI3aWg9f91slZMp
         OEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=xkiCBxk3ol9k2UAE8xjrp0d0nO1gOPAtvDRpSsUQixo=;
        b=szs3xyJNyj0ymrk5wCwde8HjmVrG/GGQCBV2i4+scdcD3xLfgrL8EZfIiXjNOc48Yb
         ObW7kNW/GEFqc2C1Kc6XQRENfhSxIeZQKWzFmZoKMQIQIBxG6eOKk8DiP5F3RcuQnax6
         Ps/Hks9eafF7OnLqmQUxzf3rSeDly4Nwm0VgrgB0hWt+5q96iTDe7tUkFkX76dMbVnup
         JeGKF21UqyfJ/b5REfeWMIc9spxF+5OQZg1/R2QSQCXdX/JaWpLl2d8W68lIUCdEp4Jb
         J3WnoUGQkhAttcsxer4k11bR2znhtKAK63rCrx8/JAtOvWr05CGjv6bDWmqyJHAlcGN8
         eUYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a125si298001ybb.390.2019.03.09.06.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 06:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2dJU-0000Tw-MR
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 09:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2dJG-0000T8-9r
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 09:50:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2dJB-000373-Gy
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 09:50:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2dJB-00035z-8U; Sat, 09 Mar 2019 09:50:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35D325D602;
	Sat,  9 Mar 2019 14:50:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 215CD7FD12;
	Sat,  9 Mar 2019 14:50:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B10491138660; Sat,  9 Mar 2019 15:44:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-8-philmd@redhat.com>
	<5166477f-67db-cf41-cdc9-a459597be80e@redhat.com>
	<390aa400-70ee-ac80-ba83-290875cca56c@redhat.com>
Date: Sat, 09 Mar 2019 15:44:42 +0100
In-Reply-To: <390aa400-70ee-ac80-ba83-290875cca56c@redhat.com> (Laszlo Ersek's
	message of "Fri, 8 Mar 2019 11:29:51 +0100")
Message-ID: <87pnr03y5h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 09 Mar 2019 14:50:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 07/18] hw/nvram/fw_cfg: Add
 fw_cfg_common_unrealize()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /33A2JBwf6SI

Laszlo Ersek <lersek@redhat.com> writes:

> On 03/08/19 07:55, Thomas Huth wrote:
>> On 08/03/2019 02.32, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Back in abe147e0ce4 when fw_cfg_add_file() was introduced, there

Suggest to say "commit abe147e0ce4".

>>> was no QOM design, object where not created and released at runtime.
>
> s/object where/objects were/
>
>>> Later 38f3adc34d finished the QOM conversion of the fw_cfg device,
>>> adding the fw_cfg_common_realize() method.
>
> (I'm not sure if 38f3adc34d "finished the QOM conversion", but that's
> just my lack of QOM knowledge. Hopefully someone can confirm whether
> this statement is accurate.)
>
>>> The time has come to add the equivalent destructor and release the
>>> memory allocated for 'files'.
>>=20
>> You should mention that the unrealize function is currently never called
>> since the object never gets destroyed (AFAIK). But I hope we can fix
>> that in the not so distant future, so:
>>=20
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>=20
>
> How about we delay this patch until such time the function is actually
> called?
>
> This series is already huge, and quite divergent considering its goals.
> (Please refer to the blurb.)
>
> I don't mind this patch, but I think it should either belong to a
> separate fw_cfg cleanup series (or "wave" if you like).
>
> Or else, we should have a bug reported somewhere public, ensuring that
> we eventually call the function introduced here. And then the commit
> message should spell out -- as you say -- that the function is not
> called yet, but it will be, because of <ticket-reference>.

I suspect filing a bug "somewhere" and making use of it would be much
more work than simply applying the fix.

I'm fine with including trivial patches for stuff you spot "on the way".
I'd be also fine with some patches spun off into a separate cleanup
series that L=C3=A1szl=C3=B3 doesn't have to review, if you can do that saf=
ely,
and with little effort.
