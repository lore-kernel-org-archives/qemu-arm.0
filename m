Received: by 10.28.4.212 with SMTP id 203csp597544wme;
        Fri, 27 Apr 2018 03:34:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq2QmLE99rqlnsD8pOhHxfYj8jUBy1caC6Y1uJh1HT10y2dMQfF6WrwpCssjSezB1BMTr8b
X-Received: by 2002:a0c:d649:: with SMTP id e9-v6mr1400522qvj.14.1524825289776;
        Fri, 27 Apr 2018 03:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524825289; cv=none;
        d=google.com; s=arc-20160816;
        b=awKweCCJiqiat/shUr5iwkyaWihV07vRUlqSWZXk1xAehSRel2Uj3HsRyUUNkbIQa1
         iUjOF++w90HShEIt/oqPBu6w+Bl2k/ZCA45AR/YnF2SPfDsY0LWPrJZVQHnN+kCXuYYY
         9k8Q0dz5di3t8DRZij6J+nepqO6pCGo4516ETsR9stQsWGNac4JiT5TZJVjMLlOg973u
         wneWk1/+GS9IdipvZvgIXWU8IqIvkuVRzrStvkJ2DOD9YnPBj56hZxRzUQAaF7r+ToZ9
         dMgdYAk9Gz9jAg6Mc7EMMxllNlWASTD6gwLMiv56PZs9bR4qdrjBx/e2sB+KnCBtyZbW
         1geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=ofDjPZkI0LzMG/Flww5dl81DTxvLjYj4rFXeHs6GwmI=;
        b=RgCIKp1ilJQjHadQW8QzsaA/DfO0pLHNeSlg1UQX2MrH1B988jevn4nf6+CyjwdfBE
         vip0hwIti/69vzBzuQo8Wv2yMBH7ER++RlusrlV1C5ZfQJ/8IQc5LaGIv7O6rS/dqapM
         3jaKArvzGiEYpGHimkE4cV81ft4LJPu045wRpSHntYEx64k2N1HH/tVIr+NnWyqDW7gu
         Gc4of1PWQexEkV4tNV9ZCNrr4SGQKuE5KwMDJmWiggtq3kKulBt+v1loWYXrCae/Yy+D
         0vD8lVr0U63Goavo8pEUOFeXZ2XY+I5wqul0sJK0RT7CM9Suj3lHqGXRlco/UrBjZv45
         bbuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27-v6si1028652qte.207.2018.04.27.03.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 03:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC0iH-000463-9V
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 06:34:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fC0Yy-00031N-QV
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 06:25:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fC0Yy-0005ZD-3k
	for qemu-devel@nongnu.org; Fri, 27 Apr 2018 06:25:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56070 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fC0Yr-0005Tu-57; Fri, 27 Apr 2018 06:25:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 235C9401DEB8;
	Fri, 27 Apr 2018 10:25:01 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B754C2026985;
	Fri, 27 Apr 2018 10:24:58 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
	<099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
	<CAFEAcA_VAckXDgARe5dJdxe9N19quUD5Dn+Dseuj=itLbFmG0g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <40c06711-f9a0-3440-9a47-8230cbcb3d55@redhat.com>
Date: Fri, 27 Apr 2018 12:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VAckXDgARe5dJdxe9N19quUD5Dn+Dseuj=itLbFmG0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 27 Apr 2018 10:25:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 27 Apr 2018 10:25:01 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [Qemu-arm]  qom-test
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ziuen25hcHpi

On 27.04.2018 12:20, Peter Maydell wrote:
> On 27 April 2018 at 07:06, Thomas Huth <thuth@redhat.com> wrote:
>> On 26.04.2018 13:54, Markus Armbruster wrote:
>> [...]
>>> Actually, a worse offender in the "waste everybody's time via redunancy"
>>> department could be qom-test.
>>
>> Shall we change qom-test to also only test with the "none" machine in
>> the normal "make check" mode and only do the full test with all machines
>> in "make check SPEED=slow" ?
> 
> We definitely want something that tries to instantiate every
> machine, because that does catch bugs.

Yes, after having a closer look at this one, I also think that we should
*not* change it to run with "none" by default only. The 'qom-list'
command results in quite a different output depending on which machine
you run it on.

 Thomas
