Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1284566wrq;
        Thu, 12 Jul 2018 05:04:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc4EepOgiUhpLnZc1i1ZHhT/5aSHAz0U8wUiWmbcKuaAtFu3zNXITYwGC36BtejFPWVhRzu
X-Received: by 2002:ac8:91d:: with SMTP id t29-v6mr1528161qth.188.1531397076978;
        Thu, 12 Jul 2018 05:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531397076; cv=none;
        d=google.com; s=arc-20160816;
        b=A7CF45jeQ41UDQQsCsxjEnjIyFSXKBVw++SqunZZ2HFYbcnoTrHEjO9kdnNeWiAwdi
         CUvEFO751dQ6LU4K/R8lXQgxUosj0zeHP71Wmt6snPEb7QafKJB9PIiARJVWOCbQYzEO
         rsfkyQlz5DDsMBzzdLOcQtDSO2nSlSXfB+BPQaerj21Q+Miw5G0v3fK8ELyHqj3TOGij
         Tyk0ApigEZwsY7nMeDsNczqRJcf0TXGvMV9ObwcVGKbmlUfWre85XSpqfkOH+NxQGjcS
         GpdNnVotC7ztdQbC9PrJagAfp9y/dOEfDOy+PD4HJMZdScuFWJTbDlhG78Q3B6ZJusxx
         su+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=DyJtI/IlAf2wTByEsIeF4q0R2iwu7mh7sNK5ea4MRmU=;
        b=nmVZCmumKBSpim8cc9J5v28n9DrL3jlVI19oXCBjGzhtmol3am2OlclJVyUR5uJzXe
         WtZgZOH+AsL8RNcNaT2tWzbXpvNhHNJMZJEvvpykgRc7ErN9BoTeWvO0bGsi8kJC4FLz
         oD3hy+EePPj/aZkm9LZrNlcG4A+8hFiqrWh+jKbqTADohmwB3jaipgdxd2LWaY0HzkAI
         JCS0ehwcF+dvfFusjys1j/CQNF3VtqlLC+rOTRpVZclJOMAIURXSY3u4SLHteUgTFBph
         uoINO6KT7BXi9F0tgAwsqdNWc/zziEL5XrfeuTyuAkTWkiFSEWxXtZ/lhgj4jBoW+qwn
         3viQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g42-v6si566786qtk.298.2018.07.12.05.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdaKq-00025b-Gu
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:04:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdaKb-00024W-7H
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fdaKV-00009W-M0
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:04:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43918 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fdaKV-00008y-HL; Thu, 12 Jul 2018 08:04:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F5BEDFE5;
	Thu, 12 Jul 2018 12:04:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AEE22026D6B;
	Thu, 12 Jul 2018 12:04:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E8F8C11385D6; Thu, 12 Jul 2018 14:04:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
Date: Thu, 12 Jul 2018 14:04:12 +0200
In-Reply-To: <5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com> (Thomas Huth's
	message of "Tue, 10 Jul 2018 00:03:39 +0200")
Message-ID: <87601koe2r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 12:04:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 12 Jul 2018 12:04:14 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
 device_add bcm2837 on unsupported machines
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
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ORcD/2mIDHX5

Thomas Huth <thuth@redhat.com> writes:

> On 09.07.2018 23:42, Peter Maydell wrote:
>> On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
[...]
> Hmm, maybe we need a qtest that first executes "info qtree", then runs
> 'device-list-properties' for all devices and finally checks "info qtree"
> again ... since 'device-list-properties' should not change the qtree,
> the output of the "info qtree" should be the same.

Lovely idea.

>                                                    Currently this is not
> the case :-/

Less than lovely, but I can't claim to be surprised.  As Peter remarked
elsewhere in this thread, QOM is underdocumented, and is too easy to
misuse.

On documentation: we sorely lack documentation tying everything
together.  GDK-Doc function comments alone can't cut it for something as
complex as QOM.

Even with adequate documentation, bad examples in the source will
continue to multiply.  We'll have to get rid of them.
