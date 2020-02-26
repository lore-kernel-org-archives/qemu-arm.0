Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2808805lfg;
        Wed, 26 Feb 2020 01:17:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwD12watZ7SC1BttO1pRyjxr8y47niknYoYFym12VqjAVyc6SA7q89GjVHTozXbbr9THzOr
X-Received: by 2002:a05:620a:6b6:: with SMTP id i22mr3769642qkh.301.1582708678609;
        Wed, 26 Feb 2020 01:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582708678; cv=none;
        d=google.com; s=arc-20160816;
        b=xn6zZP1kbm3bB2dsPzDruvQvxGtwWnkrcGSk29n1aSvpFB0eB7vjDhipLaJS6V28rX
         8Mkj9LQgkZR3f138wHPB9M8y0HafdkdKQ9Fc5Cxd7nl1cCwr0QU3v5ZOmgTdU65cpIcV
         r2p+wUzZit0LA0/MM2hnzJs54Pj0dyYZOSYu9kwSjrkoEGnJY0Z3yDaYbOIRV1c398Xj
         ap5E32fgunSCVcgTZ3/WMLo8eJHDd9aPhcOuDYoR354zKheQoqXkeBSQV4LudV4CxYDL
         0oCBIjRBUYwXJT9BXCmop1PNnzC6kppn2M34Q3pLg0o95NNm/505p1m3eIVMFtqlRyMR
         JFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=5a1j0mSl+M/pIz+M919dsVJFe539qaboygWtsmycrPg=;
        b=M5s6x5gtyUSexNhdzEsxtNkLHB8d0xn41iJtFqGfU3HlCwt/AZXJgO5jhdaEcEPiNz
         yWz1jN/RawjjN8PUNuOI1HCmtJQSvOpsNBPjk9yM9KMncUIb4JFhA6WXBc5fG9YZUSKe
         +tI+gxrSA+6x9dVYuZ9l7a6sa/oSsybMwBARGZnF7Cw34a+J3PYgjosLHDqtajtUBs+h
         bYG2MC5AjGW4SFb4jY6dE2VUmd24yniLt9E1LW9dwSNZNBjy2Wxkn6vB3NgnaNKOSyR6
         Dkyln99pnpVHyFZlXMAha7FK21Gh1pnAUCK2oZMay+KyYOlmLEyldykKg4m2TCgNwPap
         Gtbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iblg1E6y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si627177qkk.358.2020.02.26.01.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 01:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iblg1E6y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6spJ-0008EX-Js
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 04:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j6sje-0006YS-Mv
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:12:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j6sjd-0001iT-MB
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:12:06 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42373
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j6sjd-0001gZ-9P
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 04:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582708324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5a1j0mSl+M/pIz+M919dsVJFe539qaboygWtsmycrPg=;
 b=iblg1E6yeStP6YInPbo7ki0LhCb3qqZptK8dU7ssm336ySAPO9yU1zuC0mYZAHVEfztSSx
 NcgKxOuJc/lUJ/o0D/D2cQ99+Nr6p0TcN2RsoVcjg/pyLN+Vrh5WqiYk3NBi60KJlUI/A9
 HdTF1DiMCeBjnHnRjBfhJzn9nVTh3J4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-fH5xlxwPNkmUOmyDk2hpCA-1; Wed, 26 Feb 2020 04:11:58 -0500
X-MC-Unique: fH5xlxwPNkmUOmyDk2hpCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED14E1007276;
 Wed, 26 Feb 2020 09:11:56 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FE815C54A;
 Wed, 26 Feb 2020 09:11:55 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:11:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Sudden slowdown of ARM emulation in master
Message-ID: <20200226101153.2fd3f7f8@redhat.com>
In-Reply-To: <CABLmASHCnd-BmdbgyCb+Sjmau5A+nqwWEwjqviabibzjMxe=5w@mail.gmail.com>
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
 <CABLmASHCnd-BmdbgyCb+Sjmau5A+nqwWEwjqviabibzjMxe=5w@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UBUb56ju4OsV

On Wed, 26 Feb 2020 09:45:48 +0100
Howard Spoelstra <hsp.cat7@gmail.com> wrote:

> On Wed, Feb 26, 2020 at 9:42 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > On Tue, 25 Feb 2020 at 23:08, Niek Linnenbank <nieklinnenbank@gmail.com>
> > wrote:
> >  
> > > Just now I was working on some small fixes for the cubieboard machine  
> > and rebasing my Allwinner H3 branches.  
> > > While doing some testing, I noticed that suddenly the machines were much  
> > slower than before.  
> > > I only see this happening when I rebase to this commit:
> > >    ca6155c0f2bd39b4b4162533be401c98bd960820 ("Merge tag 'patchew/  
> > 20200219160953.13771-1-imammedo@redhat.com' of
> > https://github.com/patchew-project/qemu into HEAD")
> >
> > Yeah, I noticed a slowdown yesterday as well, but haven't tracked it down
> > as yet. The first thing would be to do a git bisect to try to narrow
> > down what commit caused it.
> >
> > thanks
> > -- PMM
> >  
> 
> 
> Perhaps related? I noticed a slow down on qemu-system-ppc and tracked it
> down here:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-02/msg07262.html

There might be some implicit dependency in TCG that depends on ram_size.
I'm looking for what it could be

> Best,
> Howard

