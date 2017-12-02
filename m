Received: by 10.223.159.82 with SMTP id f18csp2229494wrg;
        Sat, 2 Dec 2017 03:53:55 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbImHGiY1+p9eyx2vTQAhTIK06MJzsOfn6ERzxjGsqEcaeS/7SExGiRI2NKeJmkfFRztsfa
X-Received: by 10.129.105.213 with SMTP id e204mr5883425ywc.394.1512215635326;
        Sat, 02 Dec 2017 03:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512215635; cv=none;
        d=google.com; s=arc-20160816;
        b=irxBpsYz+qEJYXa/AkM3L4wx4EsoeRzd923z9ygcAFmBbLpxiJP1IZU7/JMQhN+3y7
         Y4p/wJJFta/XfC6xhLWlFKH8C+3QNNzEUfhoHLoquNe+erzycufmVsJ/jX88xNLISvUB
         iE+tfL8ncgQAz0P8JVWwoQnYmdUJhcLMM9g3slKdReg7ROuRXaZwzrRL8rTRPuFo7FSB
         YXvnqwU0xqtEpTVX+nMKaZz3ahfcp19PzzHckpbmdYp07Su//iSz241MPhv9jYcQ84y0
         6Szpx61USlPH6KgKc/eKyepeWUFsHr3nas38880BvuCIWjXwqkdwZxMFbbapT4t6Dt0r
         nxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:arc-authentication-results;
        bh=LphxuG6n9qjWxtnBBZ1GPEJV6UpEmw+Y6XieHYe2s3w=;
        b=KzrtXyHzxP8D76frRLXMEtSGAfQ0I7bAWB6M5cIw5AaWZ+v4G0mg8ZrTPl5TbxmWXk
         dRnFi7Vz2IMZtLAKhbIe3hdQc8Hrymp8QofXksEW2HpOOHV5DJBat3oLhTlwuuuiJSB/
         GO2ahLNHhSpClYGPrnu/nQ+NAW+xTS44bOMvW08yyXmkB2w+scC+LS0x35jeJSEj+hUr
         trQ/8flMd8UfD1XKNNynkvALgJZsDQWOhRWPRnHTCQJCeRz1xAY/Ki9bZ4PJ4LZqM6+l
         umz5xr1FbQQA/7nlcdijKGBaTCX8RZnpf7Wf4Gip2DHsliDbSLbDw5eFsvwBYl4ej8M8
         9MCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si1095329ywj.261.2017.12.02.03.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Dec 2017 03:53:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eL6Mk-0004eb-Ne
	for alex.bennee@linaro.org; Sat, 02 Dec 2017 06:53:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1eL6MX-0004d8-T0
	for qemu-arm@nongnu.org; Sat, 02 Dec 2017 06:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1eL6MT-0001PX-VS
	for qemu-arm@nongnu.org; Sat, 02 Dec 2017 06:53:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1eL6MT-0001P1-Km; Sat, 02 Dec 2017 06:53:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CAD7C049D4F;
	Sat,  2 Dec 2017 11:53:36 +0000 (UTC)
Received: from localhost (ovpn-116-30.ams2.redhat.com [10.36.116.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFB1C64446;
	Sat,  2 Dec 2017 11:53:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
In-Reply-To: <20171201232433.25193-7-eblake@redhat.com> (Eric Blake's message
	of "Fri, 1 Dec 2017 17:24:32 -0600")
References: <20171201232433.25193-1-eblake@redhat.com>
	<20171201232433.25193-7-eblake@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Sat, 02 Dec 2017 12:53:28 +0100
Message-ID: <87wp25qrbb.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 02 Dec 2017 11:53:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 6/7] maint: Fix macros with broken
 'do/while(0); ' usage
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, armbru@redhat.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	"open list:New World" <qemu-ppc@nongnu.org>, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nw/idoW1/4A+

Eric Blake <eblake@redhat.com> wrote:
> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop (particularly if the macro has multiple statements or would
> otherwise end with an 'if' statement) is so that the macro can be
> used as a drop-in statement with the caller supplying the
> trailing ';'.  Although our coding style frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> that is the classic case where failure to use do/while(0) wrapping
> would cause the 'else' to pair with any embedded 'if' in the macro
> rather than the intended outer 'if'.  But conversely, if the macro
> includes an embedded ';', then the same brace-less coding style
> would now have two statements, making the 'else' a syntax error
> rather than pairing with the outer 'if'.  Thus, even though our
> coding style with required braces is not impacted, ending a macro
> with ';' makes our code harder to port to projects that use
> brace-less styles.
>
> The change should have no semantic impact.  I was not able to
> fully compile-test all of the changes (as some of them are
> examples of the ugly bit-rotting debug print statements that are
> completely elided by default, and I didn't want to recompile
> with the necessary -D witnesses - cleaning those up is left as a
> bite-sized task for another day); I did, however, audit that for
> all files touched, all callers of the changed macros DID supply
> a trailing ';' at the callsite, and did not appear to be used
> as part of a brace-less conditional.
>
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
