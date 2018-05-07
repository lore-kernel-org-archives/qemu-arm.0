Received: by 10.28.4.212 with SMTP id 203csp3214493wme;
        Mon, 7 May 2018 10:10:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZodz2KmCptFzg1/GjAXtO0I65BbGL5Oepry45Rcz4mXAFBSE8EAnIY+f93D+oKc80YXMjkW
X-Received: by 2002:aed:2805:: with SMTP id r5-v6mr35114403qtd.28.1525713058745;
        Mon, 07 May 2018 10:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525713058; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9PbX6KoAZKJkXk/wzwRULoIruIskx7HTMlnYwgJZ5IHsvscvsJosDXaNLzBLMpQUh
         uhWPgFXrWPyIzg+kTWp3oNDsyinFyQxffODMe9IwcG68kriy8jvpYm5JkYF09FnVDFCB
         XRD64yCBm+w0OvnKmwb7akuCeFnhdTjl6sV4EtXSlp2UYmkdz/fyrtxcn39Ej5nawSje
         EaNfdD5ZMdz3FDIntId+rmlTZ8M1QvvmR1XNugjo8jbCvRWy3xRRNfOLAL5iG1xdLRW1
         2vwzYDmqCWQUstIdqNzrYroloTEMWGJgr3QFwF5nEpCKZ1NVbgwBWzcC6xdEHaBSqpIW
         gKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oybINZFk3mG+PEj6kJthBrcOfGuYFa+3wgsvhXZVRP0=;
        b=ImEp3N79bv0at2aMtEpGo42uKX137XUEdEDcvwzlpnABZ+j/wzSY6Qm1ln7jbBZ7aw
         u6GW2gBkxTwQ3riX6/3m5eOw5rseZ+qKOCgMsKyOCmxTNN6j097dJEixh9cRIDW2Q032
         o8mKdfG3D3J7P/upHAON4q8lFzED7KvdrVWkK1LX2/Zzgi6Y4tXZANJFx6QCvm026KM5
         bMIoZFHw6T5rc7bR+ZEzJTllROehjJhY7k49FhKmlfNCgpagdUTTan4svvSMe8Jk00l3
         IldvxbN/iK4N3r47x2Fmibg41suZi/+YRd2uOpaPAhSCTTcCeRZu0CPbXH/lekPLQPt0
         NGRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a+SjNXxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y44-v6si3233896qth.51.2018.05.07.10.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 10:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a+SjNXxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFjf8-0003s9-80
	for alex.bennee@linaro.org; Mon, 07 May 2018 13:10:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fFjYk-000758-QC
	for qemu-arm@nongnu.org; Mon, 07 May 2018 13:04:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fFjYk-0008AM-1w
	for qemu-arm@nongnu.org; Mon, 07 May 2018 13:04:22 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:47042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fFjYj-00089d-U4
	for qemu-arm@nongnu.org; Mon, 07 May 2018 13:04:22 -0400
Received: by mail-oi0-x22e.google.com with SMTP id y15-v6so25802097oia.13
	for <qemu-arm@nongnu.org>; Mon, 07 May 2018 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oybINZFk3mG+PEj6kJthBrcOfGuYFa+3wgsvhXZVRP0=;
	b=a+SjNXxX3+9owmM9V2rbc72SawQB28pI7hhtbg+QKcBRoigg9lT3CX1QWrUHwMVLSQ
	qA5SCOC3PqtDTA1W5oVjowchztntc7WtLRHIJxAb+gmBFIApbSL0qvyrQlge3/PFWFi1
	Q5J8NiosJcjIJejIspzm5L/J6qW4YxAQxsu3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oybINZFk3mG+PEj6kJthBrcOfGuYFa+3wgsvhXZVRP0=;
	b=MkiZsubBxSU+30O+ptigL7sTl+seiJvbaombNHleWyMdtjoC++DWLVlCqwLmFRvKo9
	ON6sTaXJBDrK8i0azc2oJ8Xgc/0ygtH9ifuG+mK16LOewZm7CbhY3la9AwRI5Q0CD2v8
	iV1vsP6OKWZhLHJ00aeSnQUa5yAYpbhwPfwX1Fv59sP2KoSBVwscXuHyTcvH1MCEPXlB
	bJY6J4/Xt2hHNyJ3S32lxgqoQoHKR4chBRRYQkbtf+DNPBQi558I1/HdeiaGsYNSAwaD
	7oT4OF012bulGFlG7vcBWZwsLTjE45hkLPB96hFAXEpLPve+cVHnUCi+5R1bVzpJegQ5
	jFmQ==
X-Gm-Message-State: ALQs6tCsuqpDHUUMJa87bhGZf8f3cn7xu5LQPoYySDfa4gPe0AySkx22
	FG790b3Mh012a0pdkVg8WJwU7Cxxngi4SrULBM694g==
X-Received: by 2002:aca:b855:: with SMTP id
	i82-v6mr24308115oif.12.1525712661175; 
	Mon, 07 May 2018 10:04:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Mon, 7 May 2018 10:04:00 -0700 (PDT)
In-Reply-To: <87h8njtnok.fsf@dusky.pond.sub.org>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 May 2018 18:04:00 +0100
Message-ID: <CAFEAcA_Hmrr4v3HW17WyCFz=dmfLMqZCyu4fGpFqcsfocUKetQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNhVB+GbE2OV

On 7 May 2018 at 17:50, Markus Armbruster <armbru@redhat.com> wrote:
> I propose:
>
> * Stuff that's required for QEMU to run is not suppressed by -nodefaults
>
> * Stuff that a real machine has soldered on is also not suppressed
>
> * Stuff that can be pulled out of a real machine may be suppressed, even
>   when that means the guest won't run
>
> Does that make some sense?

We might also want
 * Stuff that you can't add back in with an appropriate command line
   argument is not suppressed

though we might optimistically hope that the category is empty :-)

thanks
-- PMM
