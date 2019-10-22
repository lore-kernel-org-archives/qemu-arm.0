Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6067841wrm;
        Tue, 22 Oct 2019 07:15:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXg2AJSOUBpmnijpFghXGctV/M8NLgCZBGUL2WOlHY7h6p7r+yOh8fTHeRa/qnYNQzI5BX
X-Received: by 2002:a17:906:1f44:: with SMTP id d4mr27190892ejk.16.1571753731364;
        Tue, 22 Oct 2019 07:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571753731; cv=none;
        d=google.com; s=arc-20160816;
        b=B2CBKCHnR9bI8/eGhbC0kAmjYmaoOAjk+p9KFYBZ1N6sv44lPXMnKxm68GjXrDR8cJ
         zcqstqqOVhQLj+86DbedgFktUS/osvjaS5Ppv8Uj9wYMXyvMAjgj4J15XU4Ea+LF+zFu
         jznbPFAfVGbJiqtbEKkl+kmY9j4WlpAl2Zpn1xNNF3AruYYC9nzKF/KLtO/2rKwdy/YH
         2r9uJ6ppAOMYHxCJdqO/PGMePVz1eHJdEb+EZgZeXSnVNFvkmL5Mj6YQkY60HFHob9uI
         p0FIfd5NcoY9ftF8O4OYncHV+7fwFWvGjiQSM6OE3BjL13KjyYfZbQolfxu79T4qCYwb
         6xOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=/W4zpMPfxin2/+pblGLbLKG/XhDmRWhzIIgHVdIhsBk=;
        b=lKsiiSB8Dky7yzDJZba/jF49xtM0XHNnh/L+e+zLYzeFc/lMr/I3uPB6t8dj57Iphb
         7UacjG5ZggKFUpqGxeL3z7TIp+V170qAXyWqg5IGz0oVemJg7yhcfomdoRBvJQsI3AS+
         uCx1Z+1yyN05FJ7zHepCJWck6uat/7G6m6KReJnM8LhY+j30C5mbaAQ82vYdbs5inTXl
         npSuVSMnTtRft5J882niMbnZSLnZcZtnz6PFA2Am25GmnenIRuekG7WvcLqHbWT/mS7E
         CCLigvN+ELQelC3WeuIEJPtEr6iuhM5Ux1sHrkIt+M2mcR8BaT4FeExdrujJYzXT39cc
         aWAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XKVVaf9d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si11101520edr.71.2019.10.22.07.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 07:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XKVVaf9d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMuwb-0005FH-KE
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 10:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iMuRd-0008AB-7H
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 09:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iMuRb-0005sY-TG
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 09:43:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47704
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iMuRb-0005sG-Ox
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 09:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571751807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/W4zpMPfxin2/+pblGLbLKG/XhDmRWhzIIgHVdIhsBk=;
 b=XKVVaf9d4NAdFgvRrj4ASK8dt3nbtVHtmI1Ozp3osO00njoOZt8kAsdIKADgrZt28iMSRK
 a72FZ/6jFqhzYQmOAdorMscjOQIbvAQDDti5iquZCGZZ2XaNToT4hWDR8In3kpySR5STGf
 gadepr1wEF+IdXsk0Rkf94z/bJSKiGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243--gAuC4VSMHON04l7XP0aUg-1; Tue, 22 Oct 2019 09:43:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C681800D79;
 Tue, 22 Oct 2019 13:43:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F83960C5E;
 Tue, 22 Oct 2019 13:43:17 +0000 (UTC)
Date: Tue, 22 Oct 2019 15:43:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v5 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20191022134315.fuz6dou5f3pxtfte@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-2-drjones@redhat.com>
 <CADSWDztJDUEd+_7XnBPWL1bk5Xh=V_aLc1+VrP97_Ycbe3489A@mail.gmail.com>
 <20191015105628.7ln6ph5s3vpsyfuw@kamzik.brq.redhat.com>
 <CADSWDzsKx7+4mR4pmsqi0+rddUv47q=UKwVt509B8g68UoRiMA@mail.gmail.com>
 <CADSWDzs9sdjE+-1AedPnU6o7U5XjTk=dcHf-BXQXQQkrp2O=Bw@mail.gmail.com>
 <20191016135025.k4szpqwgkhfnd6dl@kamzik.brq.redhat.com>
 <CADSWDzuXpTHDtRmTL41CXbk9GmDHO5iEgpiRgnD=buQU+nnXcg@mail.gmail.com>
 <20191016161628.rf752xuu6fzkihun@kamzik.brq.redhat.com>
 <CADSWDzvT7E9P3uEJDV9z+L=HEBuDRwQ904-GG0M9T-NUz+OsoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADSWDzvT7E9P3uEJDV9z+L=HEBuDRwQ904-GG0M9T-NUz+OsoQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: -gAuC4VSMHON04l7XP0aUg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 armbru@redhat.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iARfEkE2tLPj

On Mon, Oct 21, 2019 at 04:07:14PM +0100, Beata Michalska wrote:
> Indeed, the patch got bit messed-up. Apologies for that as well.
> I have been testing manually but I did try the test you have provided
> and yes it fails - there is a slight problem with the case when qdict_in
> is empty,but this can be easily solved still keeping the single loop.
> Otherwise I have seen you have posted a new patchest so I guess we  are
> dropping the idea of refactoring ?

Well, without a patch that applies, I couldn't really evaluate your
proposal. And, TBH, I'd rather not hold this series up on a refactoring
that doesn't provide measurable performance improvements, especially when
it's not in a performance critical path. Indeed, I'd like to get this
series merged as soon as possible, which is why I posted v6 with your
visit_free() fix already.

>=20
> One more question: in case of querying a property which is not supported
> by given cpu model - we are returning properties that are actually valid
> (the test case for cortex-a15 and aarch64 prop).
> Shouldn't we return an error there? I honestly must admit I do not know
> what is the expected behaviour for the qmp query in such cases.

We do generate an error for that case:

(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"cortex-a15"}
{"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}}}}

(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"cortex-a15","=
props":{"aarch64":false}}
{"error": {"class": "GenericError", "desc": "Property '.aarch64' not found"=
}}


If you have any more comments on the series, please send them right away.
I'd like Peter to be able to merge this soon, and I understand that he's
waiting on your review.

Thanks,
drew

