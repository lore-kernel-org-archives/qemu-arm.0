Received: by 10.25.27.66 with SMTP id b63csp502692lfb;
        Thu, 9 Jun 2016 13:26:45 -0700 (PDT)
X-Received: by 10.200.34.206 with SMTP id g14mr12246283qta.56.1465504005491;
        Thu, 09 Jun 2016 13:26:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30si4359837qgx.85.2016.06.09.13.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 13:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB6XM-0002Nv-V9
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 16:26:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bB6T9-0007N6-GR
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 16:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bB6T5-0008En-6q
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 16:22:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bB6T5-0008Ej-1O; Thu, 09 Jun 2016 16:22:19 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7FC08F4FF;
	Thu,  9 Jun 2016 20:22:18 +0000 (UTC)
Received: from localhost (vpn1-7-121.gru2.redhat.com [10.97.7.121])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59KMHOl028880; Thu, 9 Jun 2016 16:22:17 -0400
Date: Thu, 9 Jun 2016 17:22:16 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160609202216.GE17952@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465492263-28472-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 09 Jun 2016 20:22:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/6] target-i386: print obsolete warnings
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X0PWARV6Dt/9

On Thu, Jun 09, 2016 at 07:10:59PM +0200, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Applied to x86-next after changing it to use error_report().

> ---
>  target-i386/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 947cf18..3f886a5 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1979,9 +1979,15 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>          /* Compatibility syntax: */
>          if (featurestr[0] == '+') {
>              add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
> +            fprintf(stderr,
> +                "'+%s' is obsolete and will be removed in future, use '%s=on'",
> +                featurestr + 1, featurestr + 1);
>              continue;
>          } else if (featurestr[0] == '-') {
>              add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
> +            fprintf(stderr,
> +                "'-%s' is obsolete and will be removed in future, use '%s=off'",
> +                featurestr + 1, featurestr + 1);
>              continue;
>          }
>  
> -- 
> 2.7.0
> 

-- 
Eduardo
