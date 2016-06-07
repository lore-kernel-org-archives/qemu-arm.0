Received: by 10.25.27.66 with SMTP id b63csp2192633lfb;
        Tue, 7 Jun 2016 13:25:56 -0700 (PDT)
X-Received: by 10.140.135.200 with SMTP id 191mr1455272qhh.88.1465331156802;
        Tue, 07 Jun 2016 13:25:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si15073860qkb.148.2016.06.07.13.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 13:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bANZU-0000vx-9L
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 16:25:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bANZQ-0000vo-JI
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 16:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bANZK-0004u7-KW
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 16:25:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bANZK-0004ty-FV; Tue, 07 Jun 2016 16:25:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15C9E85543;
	Tue,  7 Jun 2016 20:25:46 +0000 (UTC)
Received: from localhost (vpn1-7-78.gru2.redhat.com [10.97.7.78])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57KPjbX016647; Tue, 7 Jun 2016 16:25:45 -0400
Date: Tue, 7 Jun 2016 17:25:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160607202544.GF18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465226212-254093-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 07 Jun 2016 20:25:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 02/10] target-i386: cpu: move features logic
 that requires CPUState to realize time
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
X-TUID: Jpl8zaww4hVq

On Mon, Jun 06, 2016 at 05:16:44PM +0200, Igor Mammedov wrote:
> Making x86_cpu_parse_featurestr() a pure convertor
> of legacy feature string into global properties, needs
> it to be called before a CPU instance is created so
> parser shouldn't modify CPUState directly or access
> it at all. Hence move current hack that directly pokes
> into CPUState, to set/unset +-feats, from parser to
> CPU's realize method.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I will just edit a comment below, when applying, for clarity:

[...]
> +    /* TODO: convert plus_features & minus_features static vars
> +     * to global properties, once broken host_features is fixed
> +     */

I will rewrite this to:

    /*TODO: cpu->host_features inclurrectly overwrites features
     * set using "feat=on|off". Once we fix this, we can convert
     * plus_features & minus_features to global properties
     * inside x86_cpu_parse_featurestr() too.
     */

> +    if (cpu->host_features) {
> +        for (w = 0; w < FEATURE_WORDS; w++) {
> +            env->features[w] =
> +                x86_cpu_get_supported_feature_word(w, cpu->migratable);
> +        }
> +    }
> +
> +    for (w = 0; w < FEATURE_WORDS; w++) {
> +        cpu->env.features[w] |= plus_features[w];
> +        cpu->env.features[w] &= ~minus_features[w];
> +    }
> +
>      if (env->features[FEAT_7_0_EBX] && env->cpuid_level < 7) {
>          env->cpuid_level = 7;
>      }
> -- 
> 1.8.3.1
> 

-- 
Eduardo
