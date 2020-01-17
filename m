Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9750905lff;
        Fri, 17 Jan 2020 04:42:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyh6hD2JHOJEQ2BYsNR1Da5yeoL/9SEySSfB8F1sT/cp1Y37aOr9dO3MRJqQItDjink5b5
X-Received: by 2002:a17:906:d7a6:: with SMTP id pk6mr7607075ejb.234.1579264942106;
        Fri, 17 Jan 2020 04:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579264942; cv=none;
        d=google.com; s=arc-20160816;
        b=Gz9aoZjRv5qrd2j5QBZ495dqHdWITk9JBBQ/1Oos8RaZADQzDEGJtLZTNmDuMG5/ow
         42ruhgILkbcxLRsi2+y1a9JhFVshhSJ+ic16N5r/3brXwtjEldBkI/k6IdErRmnHePF0
         gFoDotwhh8VzgE0LKB5eqFqTviOp49mIN1OQ5bkbsKMJN+71sCDJjGkvDyvev1XCbkQg
         TML0oCZ3ekwsw9938aSzT1OZNT/T6QupyRgwTFV9x1Ha9d1K2dHvRTPj7ixyuZVDrwj1
         lYypnzw8brwwMhYMrr+IMD+xcM1p4K0p2JxzZ3Re71FmUhVbrojO7+Z1jd26pSm4P4wX
         u4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=eh7Su9XRVJELxFjifmVuVmwobjvclC1M6s7MdeZsngs=;
        b=jJnLH6DgJg2Yj9k1whJKqsbKvgirhaRB1qsYsLdCvUChwZ0coVkAZOG4Ay8EWWB6QY
         0UK+JOG0tbl8UC17oKYn+E6xqQ2qNryx+hYLXvAstu5nJbWqcxpmjt67G7q9SjQgrWA0
         gLOSZryhV+iAsz2Riwn0ABshSlsKYzxMA65wLVNvjPxSylLLo81pEsQcAub8uoG70Qrb
         omRyU7NGK6lMoLh0pWBgbmw+/ukOdkq0YnhXdIzder1GeAy1PhMSHBC4aazLzrS5VPjR
         IqfD527Vzz3wPOC0R+HSarJVxER+BrYGF/zI2d0q3HvPd50KtJC4wfotauhVKLfwwVqK
         XvIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BrIv5cmJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si16231643edx.326.2020.01.17.04.42.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 04:42:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BrIv5cmJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isQxA-0003Lr-UG
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 07:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1isQwv-0003JX-Ff
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 07:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1isQwt-0002po-U6
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 07:42:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35559
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1isQwt-0002od-Pk
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 07:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579264922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eh7Su9XRVJELxFjifmVuVmwobjvclC1M6s7MdeZsngs=;
 b=BrIv5cmJzaSpb7VxJWwEyCVEafrXbgFNF//5HTt8rBOvUJoL1iVeNP0HQV028h5pzshveC
 8fiZYBYFiV7werUCFyc9PbVe5hriSD1aq5RcpMNznU1j5HJZ4G9lNIgnRAyFzXgKo8YlEZ
 kwFm2d+XT/NJIezUpYKm6f7NZXtfHrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-wvTr3PxsNFmtO-YUcIiwBw-1; Fri, 17 Jan 2020 07:42:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A2CE195AD20;
 Fri, 17 Jan 2020 12:41:59 +0000 (UTC)
Received: from redhat.com (ovpn-117-238.ams2.redhat.com [10.36.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE066675AF;
 Fri, 17 Jan 2020 12:41:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/30] Migration pull patches (take 4)
In-Reply-To: <87tv4u2ryl.fsf@secure.laptop> (Juan Quintela's message of "Fri, 
 17 Jan 2020 13:22:10 +0100")
References: <20200114125254.4515-1-quintela@redhat.com>
 <CAFEAcA_n21bu1gk0fqbzSr7iwurYCVR+wS7-RpDAJWnrYdVQ5g@mail.gmail.com>
 <87tv4u2ryl.fsf@secure.laptop>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Fri, 17 Jan 2020 13:41:52 +0100
Message-ID: <87pnfi2r1r.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: wvTr3PxsNFmtO-YUcIiwBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LFbavyV9H0Bh

Juan Quintela <quintela@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Tue, 14 Jan 2020 at 12:53, Juan Quintela <quintela@redhat.com> wrote:
>>
>> I think you need to find a system which has 32-bit ram_addr_t
>> and test this, because this is about the fourth time round
>> for this patchset failing on this configuration.
>
> That is arm32 bits at the moment, right?

Not, i686 with XEN disabled appears to make the trick.

Guest what I had enabled?

Trying to see if I can reproduce it with it.

Sorry again, Juan.

