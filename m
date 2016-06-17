Received: by 10.25.21.96 with SMTP id l93csp365603lfi;
        Fri, 17 Jun 2016 10:15:37 -0700 (PDT)
X-Received: by 10.55.125.7 with SMTP id y7mr3670096qkc.46.1466183737225;
        Fri, 17 Jun 2016 10:15:37 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r6si22979408qtb.44.2016.06.17.10.15.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 10:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E08FC04B311;
	Fri, 17 Jun 2016 17:15:36 +0000 (UTC)
Received: from [10.36.112.68] (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5HHFJDS007559
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jun 2016 13:15:21 -0400
Subject: Re: [RFC 4/7] break/watchpoints: store inside array
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, mttcg@greensocs.com,
        qemu-devel@nongnu.org, fred.konrad@greensocs.com,
        a.rigo@virtualopensystems.com, serge.fdrv@gmail.com, cota@braap.org,
        bobby.prani@gmail.com
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
 <1466181227-14934-5-git-send-email-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, jan.kiszka@siemens.com, rth@twiddle.net,
        peter.maydell@linaro.org, claudio.fontana@huawei.com,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Riku Voipio <riku.voipio@iki.fi>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:ARM" <qemu-arm@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3a482f63-4d66-f05a-128d-58db3d215137@redhat.com>
Date: Fri, 17 Jun 2016 19:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466181227-14934-5-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 17 Jun 2016 17:15:36 +0000 (UTC)
X-TUID: dwM8Ic352Ne1



On 17/06/2016 18:33, Alex Bennée wrote:
> @@ -807,18 +807,17 @@ int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
>          wp->flags = flags;
>          wp->ref = ref;
>      } else {
> -        wp = g_malloc(sizeof(*wp));
> -
> -        wp->vaddr = addr;
> -        wp->len = len;
> -        wp->flags = flags;
> -        wp->ref = ref;
> +        CPUWatchpoint watch;
> +        watch.vaddr = addr;
> +        watch.len = len;
> +        watch.flags = flags;
> +        watch.ref = ref;
>  
>          /* keep all GDB-injected watchpoints in front */
>          if (flags & BP_GDB) {
> -            g_array_prepend_val(cpu->watchpoints, wp);
> +            g_array_prepend_val(cpu->watchpoints, watch);
>          } else {
> -            g_array_append_val(cpu->watchpoints, wp);
> +            g_array_append_val(cpu->watchpoints, watch);
>          }

Please define "watch" outside the "if", so that the "then" side can do just

    *wp = watch;

and there is less duplication.

Paolo
