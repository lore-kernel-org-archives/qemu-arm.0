Received: by 10.223.172.38 with SMTP id v35csp5641533wrc;
        Mon, 11 Sep 2017 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDzKASjyteUTYiu9rKC5uTMJ4HP014i1N2SQj1ebl46ZYtAVl74qFPCaitXFAHUTCnTytWj
X-Received: by 10.55.132.67 with SMTP id g64mr16581418qkd.268.1505141531770;
        Mon, 11 Sep 2017 07:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505141531; cv=none;
        d=google.com; s=arc-20160816;
        b=CjH5HLV027Urb3Et6oaqxWC4xTfKYi0hcw6/ZnHB+/PMvQx7UcedFTmqHt23UuX1GA
         MPhhkUdn0Luw1i+++B3oyKoOkNRp9PGIVOBH8DYJLFPAzNhTdUz69U+a86/YbTVreahH
         S/H7j1hqeKzuFN8gbUYmjbE4wgxXauRu+xOl6UE9YHa5HfMmcSthzUyqNb18b4mV+KnX
         EZUW5QyKEBStS7JcgFecPliPTA6vhEd7KaTs21b0LwihSZegtXYrzS4q0ZDDkT66ywRZ
         m0D79fnwO4uTIHhtnOgrHG5L1vJfLrs4+iRll14g0wwL9yR0FnyTrKhE+f/OzMtutW2x
         bs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=Sb1KuXIy2zFT/4/R7arfRqweZHSMI0j/MPViBgg4PvY=;
        b=vOv0K4hdcBhlknMNDOAOX0dCEn2E3f0/lcUKNb+6bDP3tnz/gjJD5yGNvPMSlHokLA
         EZiOJWrgglYTjgbqbeppYQ3CQfJeTdhhcJ5OFiUHDUDDvRsgEheigWzZY7no4y3ZJcwD
         IWyXXA85XQ6YDQ2a0X67coK8DiSOLoYrt4hbqb6vW0F91pZn69fUjqIsZnkCDsGvnRjs
         7if6FTyh9+fVWMav6iXLOd7AoamEQV72Zocg/c9rMErkW9aeXXTm5reHUFSTlnJUyTQT
         wpaXPAK4cOPrS3cE69Si/+0WvVa3Zb4HdXnTVuIxNE5MAXZgs5qZBkxFHS5PpVkhFLSl
         Z9UA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si9378014qka.85.2017.09.11.07.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drQ4H-0007SB-IR
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:52:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drQ4C-0007Pj-I9
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drQ47-0007He-0T
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:52:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drQ46-0007H8-RJ; Mon, 11 Sep 2017 10:51:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9613CC5488;
	Mon, 11 Sep 2017 14:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9613CC5488
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.113] (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63614612AA;
	Mon, 11 Sep 2017 14:51:50 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-4-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1299bf0c-f887-bcfe-2e97-3c7103d407a1@redhat.com>
Date: Mon, 11 Sep 2017 16:51:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170911142056.15643-4-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 11 Sep 2017 14:51:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 3/3] tests/hmp: test "none" machine with
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
X-TUID: TVEHntHYJfOZ

On 11.09.2017 16:20, Laurent Vivier wrote:
> and add a test case of dump-guest-memory without
> "[begin length]" parameters.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  tests/test-hmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
> index 729c0339f7..90693c0ce2 100644
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
> @@ -159,5 +160,9 @@ int main(int argc, char **argv)
>  
>      qtest_cb_for_every_machine(add_machine_test_case);
>  
> +    /* as none machine has no memory, add a test case with memory */
> +

Maybe remove the empty line after the comment?

> +    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
> +
>      return g_test_run();
>  }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
