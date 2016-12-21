Received: by 10.25.205.13 with SMTP id d13csp3306434lfg;
        Wed, 21 Dec 2016 10:02:08 -0800 (PST)
X-Received: by 10.55.16.67 with SMTP id a64mr6748573qkh.215.1482343328739;
        Wed, 21 Dec 2016 10:02:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l128si5626777qkf.269.2016.12.21.10.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Dec 2016 10:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJlDK-0004yZ-5f
	for alex.bennee@linaro.org; Wed, 21 Dec 2016 13:02:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cJlDG-0004s2-8w
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 13:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cJlDD-0008N6-60
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 13:02:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33260)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cJlDC-0008Mq-UJ; Wed, 21 Dec 2016 13:01:59 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE2ED285A5;
	Wed, 21 Dec 2016 18:01:57 +0000 (UTC)
Received: from localhost (ovpn-116-3.gru2.redhat.com [10.97.116.3])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBLI1uJv031682; Wed, 21 Dec 2016 13:01:57 -0500
Date: Wed, 21 Dec 2016 16:01:55 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20161221180155.GI3808@thinpad.lan.raisama.net>
References: <20161201170624.26496-1-lersek@redhat.com>
	<148227487620.73.10055858460424473693@790289a7ca88>
	<20161221152226.GH3808@thinpad.lan.raisama.net>
	<70b42a58-381d-7011-7eef-2120af178f91@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70b42a58-381d-7011-7eef-2120af178f91@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 21 Dec 2016 18:01:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] checkpatch.pl false positive (was Re: [PATCH v4 0/7]
 q35: add negotiable broadcast SMI)
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
Cc: peter.maydell@linaro.org, famz@redhat.com, mst@redhat.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	michael@walle.cc, qemu-arm@nongnu.org, kraxel@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xAjmhgzXTs3H

On Wed, Dec 21, 2016 at 06:47:01PM +0100, Paolo Bonzini wrote:
> 
> 
> On 21/12/2016 16:22, Eduardo Habkost wrote:
> > On Tue, Dec 20, 2016 at 03:01:17PM -0800, no-reply@patchew.org wrote:
> > [...]
> >> Checking PATCH 4/7: hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cfg file slots...
> >> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> >> #126: FILE: include/hw/compat.h:4:
> >> +#define HW_COMPAT_2_8 \
> >> +    {\
> >> +        .driver   = "fw_cfg_mem",\
> >> +        .property = "file_slots",\
> >> +        .value    = stringify(0x10),\
> >> +    },{\
> >> +        .driver   = "fw_cfg_io",\
> >> +        .property = "file_slots",\
> >> +        .value    = stringify(0x10),\
> >> +    },
> >>
> >> total: 1 errors, 0 warnings, 119 lines checked
> >>
> >> Your patch has style problems, please review.  If any of these errors
> >> are false positives report them to the maintainer, see
> >> CHECKPATCH in MAINTAINERS.
> > 
> > It is a false positive, but how exactly can we fix it? Should it
> > become a warning instead of an error?
> 
> It should already be treated as an exception:
> 
>                         my $exceptions = qr{
>                                 $Declare|
>                                 module_param_named|
>                                 MODULE_PARAM_DESC|
>                                 DECLARE_PER_CPU|
>                                 DEFINE_PER_CPU|
>                                 __typeof__\(|
>                                 union|
>                                 struct|
>                                 \.$Ident\s*=\s*|       # <---- see here
>                                 ^\"|\"$
>                         }x;
>                         #print "REST<$rest> dstat<$dstat> ctx<$ctx>\n";
>                         if ($rest ne '' && $rest ne ',') {
>                                 if ($rest !~ /while\s*\(/ &&
>                                     $dstat !~ /$exceptions/)
>                                 {
>                                         ERROR("Macros with multiple statements should be enclosed in a do - while loop\n" . "$here\n$ctx\n");
>                                 }
> 
> 
> so I guess the first step is debugging it. :)

The following code replaces the whole "{ .driver = ... }" block
with "1":

	# Flatten any parentheses and braces
	while ($dstat =~ s/\([^\(\)]*\)/1/ ||
	       $dstat =~ s/\{[^\{\}]*\}/1/ ||
	       $dstat =~ s/\[[^\{\}]*\]/1/)
	{
	}

The following change fixes the bug, but I don't know if it has
unwanted side-effects:

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f084542..0aab3ac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2200,6 +2200,10 @@ sub process {
                        $dstat =~ s/^\s*//s;
                        $dstat =~ s/\s*$//s;
 
+                       # remove braces that cover the whole block, if any:
+                       $dstat =~ s/^\{//;
+                       $dstat =~ s/\}$//;
+
                        # Flatten any parentheses and braces
                        while ($dstat =~ s/\([^\(\)]*\)/1/ ||
                               $dstat =~ s/\{[^\{\}]*\}/1/ ||


-- 
Eduardo
