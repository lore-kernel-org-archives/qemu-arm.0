Received: by 10.25.205.13 with SMTP id d13csp3315951lfg;
        Wed, 21 Dec 2016 10:21:08 -0800 (PST)
X-Received: by 10.200.40.175 with SMTP id i44mr5828158qti.258.1482344468314;
        Wed, 21 Dec 2016 10:21:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q46si15590344qtf.194.2016.12.21.10.21.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Dec 2016 10:21:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJlVh-0006Jq-I8
	for alex.bennee@linaro.org; Wed, 21 Dec 2016 13:21:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cJlUD-0005dt-Id
	for qemu-devel@nongnu.org; Wed, 21 Dec 2016 13:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cJlUC-0006lv-Hd
	for qemu-devel@nongnu.org; Wed, 21 Dec 2016 13:19:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cJlU5-0006ia-UQ; Wed, 21 Dec 2016 13:19:26 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57B643D951;
	Wed, 21 Dec 2016 18:19:23 +0000 (UTC)
Received: from localhost (ovpn-116-3.gru2.redhat.com [10.97.116.3])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBLIJLF5004773; Wed, 21 Dec 2016 13:19:22 -0500
Date: Wed, 21 Dec 2016 16:19:21 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20161221181921.GJ3808@thinpad.lan.raisama.net>
References: <20161201170624.26496-1-lersek@redhat.com>
	<148227487620.73.10055858460424473693@790289a7ca88>
	<20161221152226.GH3808@thinpad.lan.raisama.net>
	<70b42a58-381d-7011-7eef-2120af178f91@redhat.com>
	<20161221180155.GI3808@thinpad.lan.raisama.net>
	<e45bb195-578f-6afc-8617-f75e7775193e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e45bb195-578f-6afc-8617-f75e7775193e@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 21 Dec 2016 18:19:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] checkpatch.pl false positive (was Re: [PATCH v4
 0/7] q35: add negotiable broadcast SMI)
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
Cc: peter.maydell@linaro.org, famz@redhat.com, mst@redhat.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	michael@walle.cc, qemu-arm@nongnu.org, kraxel@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KH/lf2xwLO1M

On Wed, Dec 21, 2016 at 07:08:29PM +0100, Paolo Bonzini wrote:
> 
> 
> On 21/12/2016 19:01, Eduardo Habkost wrote:
> > The following code replaces the whole "{ .driver = ... }" block
> > with "1":
> > 
> > 	# Flatten any parentheses and braces
> > 	while ($dstat =~ s/\([^\(\)]*\)/1/ ||
> > 	       $dstat =~ s/\{[^\{\}]*\}/1/ ||
> > 	       $dstat =~ s/\[[^\{\}]*\]/1/)
> > 	{
> > 	}
> 
> Maybe change it like
> 
> - 	       $dstat =~ s/\{[^\{\}]*\}/1/ ||
> + 	       $dstat =~ s/\{[^\{\}]*;[^\{\}]*\}/1;/ ||
> 
> so that it requires a statement?

I am not sure the point of this line is to detect multi-statement
blocks, but to replace other types of expressions containing {}
that could incorrectly match $exceptions, like:

#define FOO { \
   Foo f = { .somefield = 1 }; \
   some_statement(); \
   another_statement();
  }

In this case, $dstat would become:
"{ Foo f = 1; some_statement(); another_statement(); }"


>                                   It would have a false positive on
> strings containing a semicolon, but that's not a big deal (or could be
> fixed by similarly turning strings into just "").

String contents are already replaced with "XXX" by some other
code. These are the contents of $dstat:

 '{        .driver   = "XXXXXXXXXX",        .property = "XXXXXXXXXX",        .value    = stringify1,    }'

> 
> Paolo
> 
> > The following change fixes the bug, but I don't know if it has
> > unwanted side-effects:
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index f084542..0aab3ac 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2200,6 +2200,10 @@ sub process {
> >                         $dstat =~ s/^\s*//s;
> >                         $dstat =~ s/\s*$//s;
> >  
> > +                       # remove braces that cover the whole block, if any:
> > +                       $dstat =~ s/^\{//;
> > +                       $dstat =~ s/\}$//;
> > +
> >                         # Flatten any parentheses and braces
> >                         while ($dstat =~ s/\([^\(\)]*\)/1/ ||
> >                                $dstat =~ s/\{[^\{\}]*\}/1/ ||
> 
> 
> Paolo

-- 
Eduardo
