Received: by 10.25.27.66 with SMTP id b63csp1959671lfb;
        Tue, 7 Jun 2016 04:45:19 -0700 (PDT)
X-Received: by 10.140.195.69 with SMTP id q66mr20607691qha.79.1465299918565;
        Tue, 07 Jun 2016 04:45:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q185si13763417qkb.158.2016.06.07.04.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 04:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAFRe-0005NM-0S
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 07:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bAFRY-0005Lz-Ba
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 07:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bAFRT-00037I-8Q
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 07:45:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bAFRT-000372-1o; Tue, 07 Jun 2016 07:45:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FB223B723;
	Tue,  7 Jun 2016 11:45:06 +0000 (UTC)
Received: from [10.36.112.45] (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57Bj1dF004767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jun 2016 07:45:03 -0400
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-7-git-send-email-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
Date: Tue, 7 Jun 2016 13:44:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465226212-254093-7-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 07 Jun 2016 11:45:06 +0000 (UTC)
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
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3O4yaXDLGERZ



On 06/06/2016 17:16, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  target-i386/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index f791a06..31e5e6f 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1975,6 +1975,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>                  error_propagate(errp, local_err);
>                  return;
>              }
> +            fprintf(stderr,
> +                "'+%s' is obsolete and will be removed in future, use '%s=on'",
> +                featurestr + 1, featurestr + 1);

Could you detect using +foo together with foo=off, and -foo together
with foo=on?  Those are the really problematic cases, without them +foo
and -foo can become synonyms for =on and =off.

Paolo

>              continue;
>          } else if (featurestr[0] == '-') {
>              add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
> @@ -1982,6 +1985,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
>                  error_propagate(errp, local_err);
>                  return;
>              }
> +            fprintf(stderr,
> +                "'-%s' is obsolete and will be removed in future, use '%s=off'",
> +                featurestr + 1, featurestr + 1);
>              continue;
>          }
>  
> 
