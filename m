Received: by 10.25.27.66 with SMTP id b63csp1981622lfb;
        Tue, 7 Jun 2016 05:32:56 -0700 (PDT)
X-Received: by 10.55.110.65 with SMTP id j62mr20348998qkc.166.1465302776260;
        Tue, 07 Jun 2016 05:32:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si13912662qgk.13.2016.06.07.05.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 05:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAGBj-0001t1-Mx
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 08:32:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bAGBg-0001sw-56
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 08:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bAGBc-0005p8-Uj
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 08:32:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bAGBc-0005oS-PH; Tue, 07 Jun 2016 08:32:48 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C84081F03;
	Tue,  7 Jun 2016 12:32:47 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57CWjqu012380; Tue, 7 Jun 2016 08:32:45 -0400
Date: Tue, 7 Jun 2016 14:32:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160607143244.2d4ddb81@nial.brq.redhat.com>
In-Reply-To: <934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-7-git-send-email-imammedo@redhat.com>
	<934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 Jun 2016 12:32:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 06/10] target-i386: print obsolete warnings
 if +-features are used
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DPRcgq83hVYE

On Tue, 7 Jun 2016 13:44:58 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 06/06/2016 17:16, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  target-i386/cpu.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> > index f791a06..31e5e6f 100644
> > --- a/target-i386/cpu.c
> > +++ b/target-i386/cpu.c
> > @@ -1975,6 +1975,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >                  error_propagate(errp, local_err);
> >                  return;
> >              }
> > +            fprintf(stderr,
> > +                "'+%s' is obsolete and will be removed in future, use '%s=on'",
> > +                featurestr + 1, featurestr + 1);  
> 
> Could you detect using +foo together with foo=off, and -foo together
> with foo=on?  Those are the really problematic cases, without them +foo
> and -foo can become synonyms for =on and =off.
That's (legacy)current semantic of -cpu +-foo where it overrides any foo=x,
potentially it's possible to track foo=x locally in parser
and then compare with +-foo both ways.
But all we can do currently is to print warning about such use case.

I think Eduardo's suggestion to just warn that +-foo is obsolete for now
and drop support for it in several releases is sufficient(good) enough.

> Paolo
> 
> >              continue;
> >          } else if (featurestr[0] == '-') {
> >              add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
> > @@ -1982,6 +1985,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
> >                  error_propagate(errp, local_err);
> >                  return;
> >              }
> > +            fprintf(stderr,
> > +                "'-%s' is obsolete and will be removed in future, use '%s=off'",
> > +                featurestr + 1, featurestr + 1);
> >              continue;
> >          }
> >  
> >   

