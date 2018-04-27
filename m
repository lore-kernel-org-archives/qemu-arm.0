Received: by 10.28.4.212 with SMTP id 203csp404929wme;
        Thu, 26 Apr 2018 23:29:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoGXvZG7xlW4rydZBizVi603uo9yUEVmthV5qWNeZ3lLrdR1RrifFFCQN5cxk5WMN0cKPs2
X-Received: by 2002:ac8:6718:: with SMTP id e24-v6mr859716qtp.79.1524810597222;
        Thu, 26 Apr 2018 23:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524810597; cv=none;
        d=google.com; s=arc-20160816;
        b=KjtAq0TkAs3ZJEW3bXx0vZFSBqO8WwS3i/i3tzDyzPClontpALdTDoVquFTzOYgjNi
         iWQCWcUCiUcocO6jnK7jcM4DvrIjx+NWgGjD5o2/ReBS6Q4pd6qfEVzqtsnZDWbJcaIY
         n2abGUgfnleh3W4u0QNxYX+sAh/znOacx3B9RULGobgTdY6hZtxZkI98IZQES3ZPMH16
         5bS3QHqt0sOoVWAcngchm5vBCbF5ZUzSOAOdOoVE8slFhC4KGJ6xBMK6CBA5G6orrEFC
         Q1qt0V8jRm4PfeYmSURoiz9rq7XmrNgsVqDve7Ca7jAnoxL/LrhQug1lA0Tlai5d8C9c
         neMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=EnhS6uGUBRH38VgPHYT4igHUoL3+AKomuH9lSmAEWio=;
        b=VLMgwzzSbs5HD70Kho1hKh2QjQAAzP7dpm/sVd1ZjWT0+1r53ptX0ZL+LvEFs87JGF
         8TTEZGdplijlxMrak9lHHGTKEdjnXU7ZSGUFJ7iWfjI8htAsVE8hBzlszfO7mxDhfDof
         ttI2U5zIQQhpLyRBzqgSpuV0gpYMRR6YJmGUb8t8y/PNMQlvccQUivc0HpFwrg0I+8cI
         jk+0X80vcRPHoAL3eYfm1fQC2XgmILs3ejCWhs4dwaHhswaPLhXOnYM7dvwNwGkE2fbH
         pipGEzQtG42IHXX9UIwNUb/OrsJkWxIcxwv0OYHfdab3f3U9FRlNiUq4/j3sFbIJNeFq
         vH5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64si629089qkf.205.2018.04.26.23.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 23:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBwtI-00032K-LF
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 02:29:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBwt8-00030r-DQ
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBwt3-0005RW-H8
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 02:29:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45414 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fBwt3-0005Qp-CV; Fri, 27 Apr 2018 02:29:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7728F401DEB3;
	Fri, 27 Apr 2018 06:29:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6341B202699C;
	Fri, 27 Apr 2018 06:29:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 435481138645; Fri, 27 Apr 2018 08:29:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
	<099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
Date: Fri, 27 Apr 2018 08:29:31 +0200
In-Reply-To: <099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com> (Thomas Huth's
	message of "Fri, 27 Apr 2018 08:06:48 +0200")
Message-ID: <87sh7huppw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 27 Apr 2018 06:29:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 27 Apr 2018 06:29:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] qom-test
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Philippe =?utf-8?Q?Mathieu?= =?utf-8?Q?-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JdxXJS2k1jCf

Thomas Huth <thuth@redhat.com> writes:

> On 26.04.2018 13:54, Markus Armbruster wrote:
> [...]
>> Actually, a worse offender in the "waste everybody's time via redunancy"
>> department could be qom-test.
>
> Shall we change qom-test to also only test with the "none" machine in
> the normal "make check" mode and only do the full test with all machines
> in "make check SPEED=slow" ?

I suggest you give it a try and see how much time it saves on "make
check" without SPEED=slow.  If you like the result, find out which
devices this no longer tests, if any.
