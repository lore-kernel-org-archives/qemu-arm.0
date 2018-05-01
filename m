Received: by 10.28.4.212 with SMTP id 203csp4874409wme;
        Tue, 1 May 2018 06:34:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrZzHptha8Rr4vRT04BbDplxED3LB+dkM+MbsYf2GUJ6UJc5qwxizoWxxu4aqlGqGwNZGc2
X-Received: by 2002:a0c:d207:: with SMTP id m7-v6mr10898277qvh.179.1525181673806;
        Tue, 01 May 2018 06:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525181673; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4J6mJ3H2tSvagrVWF8peFJPyzaMifOU3sJqoFQ0Oyq+jSqHSXavRdKPDTgHtmstRb
         xMHrxlQUuk/BEAMO1Vtb51YOush0iSCfmZWbSnevY7xPaHgLDzY9XAN608TusyaUbPRG
         7xJ2M4DrJxNcFJGG6HemfNCIeKcB3KEi4oBaXU/CQWlpExQJ5mVCeXF0q+BFUxefOG7M
         AInSPDui1QbGcCE6r7vgObgMojtNsOhg6rxt1RHvSgupGvGuWHZiHFfTFz987EglZmDp
         TGDC9DMXX2vNgkC2sB4L2yrUek3V3WkX8DWWmwqpIK1bAMeHu+Lbr2olArpL9WYUF8Yb
         YcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=96w5BGms9u+NjccKf5x0MiKBMVfnZVQTTU3JrHUa+lg=;
        b=L9a5XH6j2HTHA6kmD0DjTQ1fufsaw7MhOtsNhiguwncOn/q4Ui9P5AxGLEOpNF5q6Q
         CQxqO6bcfZDMZsq1KFL4mIPyT9PDF+Tgvm/Sr1GGirYE3spNgr/k/ngVxeqg+EBJX/LY
         JdVf4i1R5L6HQYo60xVQzTiCJDtW/q65B1YX5IWOXfD2UgakZVYyQSwntN3EqfPDp8tj
         us3Ie1wla8uA+ngu6vZRF5YukK/XfprJnQ8gx/DgcHH1G4K53iV+EYaNdoovbiga38sE
         R5fmizxcF1LlmhrnNl+OtgzgyhxR35MSORTLF39/IqYU6ynjvzppJ2H7QKk4rbhXk0ST
         e6TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10si1854618qkk.401.2018.05.01.06.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 06:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDVQP-0007KG-CF
	for alex.bennee@linaro.org; Tue, 01 May 2018 09:34:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDVQI-0007K7-AQ
	for qemu-arm@nongnu.org; Tue, 01 May 2018 09:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDVQF-00072I-7F
	for qemu-arm@nongnu.org; Tue, 01 May 2018 09:34:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47728 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fDVQF-000726-3B; Tue, 01 May 2018 09:34:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 945B8406C74A;
	Tue,  1 May 2018 13:34:18 +0000 (UTC)
Received: from localhost (ovpn-204-122.brq.redhat.com [10.40.204.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EBDF111DCFE;
	Tue,  1 May 2018 13:34:12 +0000 (UTC)
Date: Tue, 1 May 2018 15:34:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180501153411.7ca32d92@redhat.com>
In-Reply-To: <CAFEAcA8iq9gJuC=ODK7wY_3m4B66o0LqJi9aK2PEfHha4q68nA@mail.gmail.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
	<1525176522-200354-5-git-send-email-imammedo@redhat.com>
	<CAFEAcA8iq9gJuC=ODK7wY_3m4B66o0LqJi9aK2PEfHha4q68nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 01 May 2018 13:34:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 01 May 2018 13:34:18 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3 4/5] arm: boot: set boot_info starting
 from first_cpu
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ioKncmtQG5BC

On Tue, 1 May 2018 13:19:12 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 1 May 2018 at 13:08, Igor Mammedov <imammedo@redhat.com> wrote:
> > even though nothing is currently broken, make sure that boot_info
> > is set on all CPUs.
> >
> > Ref:
> > "Message-ID: <CAFEAcA_NMWuA8WSs3cNeY6xX1kerO_uAcN_3=fK02BEhHJW86g@mail.gmail.com>"  
> 
> Can you include the rationale in the commit message rather
> than just pointing to a message-id, please?
sure,
I'll post it  reply here.

BTW: I'm expecting this being merged through ARM tree 

> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > --  
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

