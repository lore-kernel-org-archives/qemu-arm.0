Received: by 10.223.172.38 with SMTP id v35csp7118379wrc;
        Tue, 12 Sep 2017 07:14:10 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBLVBdtjZPGLxXzAWVGxLm/jLzTWFggRURoTHRELrA9SmVmyIYqHK9S2ygEaeyWdFJX5C5h
X-Received: by 10.55.64.136 with SMTP id n130mr715277qka.10.1505225650880;
        Tue, 12 Sep 2017 07:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505225650; cv=none;
        d=google.com; s=arc-20160816;
        b=jBAKx+fjWy695O/EPd+yitFlrLWHZUX7ktQtvNsXtB6BOq3x8/IGgqP/5SW5iGK6b7
         CEfYnqcpZb+3Lnta3nAM09szhrFX0vrMoXc0BvJ1OzdADAKO89CHsPeoqBUIS+thb++i
         N7BXzE/5VKvDHCnmcowdqkyA6Jb3rIX78m5+gVmSPH1J/2XEbRfEchRT1Buc578HTsn7
         6qwsxHoQGlgR4vFOD6HINC7Tc4e3+Mqeos/IC5fWQMx7otL49B+JXvaWTVUkHOG/Eyiw
         itMkM2FjnVV81UhVrucBPFAzy61e1n+vgEhcxEuSanC3ceOmpvPs5lVQZl5oeDDPNn9g
         1e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=yIAEFLz+IgyUAL1WP9lpSM7iBjFeBfpKIBBuy+fB53k=;
        b=PK6mtqKad2ifuFoB1SZj4aa/lHalqtLNcftzPzp8aVPqgWC2eDMrvwTa6rTQodmQEq
         yEE8xqbiY3DdocDowe2hxwsUyhrfaOigKJKTCN3JRlKXaFNvlTFTUxCtCQFojl21rQzb
         fDIgEbx9ZpaBVyHvWitAttVAvMpbycovUsuJC77dhhbmxOxe+i7hQhT/WD7ZVpVrLEK9
         8qjjwbebrwK9orHgR48SLnWtpzs50ZtIyZcH02+DUMnZ1RFwSjII+PTnu+qNIR7HA6r1
         nGqxEUkq6+U9WCzWIZlE5WcO0JhRt+lFMXrfvWd4S55ftyMvrgpvvzAZuG3PbubwKLGN
         8a3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2si4973325qtg.521.2017.09.12.07.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:14:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drlx2-0008VL-Hc
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:14:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drlwq-0008T0-5A
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:13:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drlwm-0004Ct-6Z
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:13:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drlwm-0004C8-0j; Tue, 12 Sep 2017 10:13:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F08902F9447;
	Tue, 12 Sep 2017 14:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F08902F9447
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.40.204.137] (ovpn-204-137.brq.redhat.com [10.40.204.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB4C66851;
	Tue, 12 Sep 2017 14:13:47 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-4-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <de8d4495-15d0-5175-3c2d-63a1cfefd8a5@redhat.com>
Date: Tue, 12 Sep 2017 16:13:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170912140149.7692-4-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 12 Sep 2017 14:13:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 3/3] tests/hmp: test "none" machine with
 memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fSsBQUBjVp3d

On 12.09.2017 16:01, Laurent Vivier wrote:
> and add a test case of dump-guest-memory without
> "[begin length]" parameters.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/test-hmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
> index 729c0339f7..6b2dd5f8b8 100644
> --- a/tests/test-hmp.c
> +++ b/tests/test-hmp.c
> @@ -35,6 +35,7 @@ static const char *hmp_cmds[] = {
>      "mouse_button 0",
>      "device_del mouse1",
>      "dump-guest-memory /dev/null 0 4096",
> +    "dump-guest-memory /dev/null",
>      "gdbserver",
>      "host_net_add user id=net0",
>      "hostfwd_add tcp::43210-:43210",
> @@ -159,5 +160,8 @@ int main(int argc, char **argv)
>  
>      qtest_cb_for_every_machine(add_machine_test_case);
>  
> +    /* as none machine has no memory, add a test case with memory */
> +    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
> +
>      return g_test_run();
>  }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
