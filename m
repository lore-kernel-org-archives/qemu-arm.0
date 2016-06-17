Received: by 10.25.21.96 with SMTP id l93csp366333lfi;
        Fri, 17 Jun 2016 10:17:33 -0700 (PDT)
X-Received: by 10.55.133.6 with SMTP id h6mr3762482qkd.82.1466183852990;
        Fri, 17 Jun 2016 10:17:32 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o34si32270542qtd.10.2016.06.17.10.17.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 10:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF2F92636;
	Fri, 17 Jun 2016 17:17:31 +0000 (UTC)
Received: from [10.36.112.68] (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5HHHNUH009103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Jun 2016 13:17:25 -0400
Subject: Re: [RFC 2/7] exec: keep CPUWatchpoint references internal
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, mttcg@greensocs.com,
        qemu-devel@nongnu.org, fred.konrad@greensocs.com,
        a.rigo@virtualopensystems.com, serge.fdrv@gmail.com, cota@braap.org,
        bobby.prani@gmail.com
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
 <1466181227-14934-3-git-send-email-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, jan.kiszka@siemens.com, rth@twiddle.net,
        peter.maydell@linaro.org, claudio.fontana@huawei.com,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Riku Voipio <riku.voipio@iki.fi>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Michael Walle <michael@walle.cc>, Alexander Graf <agraf@suse.de>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "open list:ARM" <qemu-arm@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a9743bb2-0c88-f9fa-18d3-743a98ce732e@redhat.com>
Date: Fri, 17 Jun 2016 19:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466181227-14934-3-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 17 Jun 2016 17:17:32 +0000 (UTC)
X-TUID: Bfi6UqNAyBMl



On 17/06/2016 18:33, Alex Bennée wrote:
> +    wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, index);

Worth adding macros or inline functions cpu_breakpoint_at(cpu, index)
and cpu_watchpoint_at(cpu, index)?  This will also be less churn in
patch 4, because the macros will always return CPU{Break,Watch}point *.

(I'm making the suggestion as I skim the patches, but they often apply
earlier in the series.  Sorry).

Paolo
