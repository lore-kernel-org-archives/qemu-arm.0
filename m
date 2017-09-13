Received: by 10.223.172.38 with SMTP id v35csp742452wrc;
        Wed, 13 Sep 2017 00:55:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDtCv62iekTB6iUE/Eboc+O9x5CJj7VPXOErBZGjlSWKh1ZDptEDKCXkE6SfCbv4viYSiFl
X-Received: by 10.55.221.217 with SMTP id u86mr24522256qku.64.1505289314272;
        Wed, 13 Sep 2017 00:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505289314; cv=none;
        d=google.com; s=arc-20160816;
        b=YVzYpzbvD9RuOkFD3pYh4zwFNVBf2h6ZCjtbRubC4UHuTqcIue1STAuqUbAay+XDsu
         +u2zZcGhdwV+glShpW6HUQk8B6+W2O44O7c9FuQ4KfHuiSmTnpvLdaTRB4ZzJCBP05M8
         ua3FM1FW0tNVPAN+Yt0uCWUrOjrZQSKe5qYZnY+TJB3j6JqCOmnZB0t527mH2jiSl2Op
         aVskFGw3MSO4wvGxXY6Mz1GNOG2pIv8q4U8biXejJhdRvaaHCA4Hh7TfV2P9vBkN5hGj
         Yb2V6aEKshUU01gOY15LkoUDiKcJXN5dMCpOhhP30r5iTFklKMSE6KdRGvInLTfRDRCf
         mnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=C4kcO1lZabk1NHznW7DVZalNWoWzYOu4i/wZbCoiOns=;
        b=vt/wo9FK+kQVhOOmR+4K3XAuVhLF556N9td22AMb52iUF8uXF3Jrg0OqFXwsYAfQV3
         9YYSM/E88Jv+wl4ZveDvYxPFENoHcp7V9Ni+bKMhGIQhI7fK9j4Qj2V0UFpOFgYHkecC
         c0joq6qTKSsfHtLp0y1fXhhZLOOwwTHdHGRNj5pEWnyIuIYN3nipyHHQfvH67Bp0vJCF
         n0MjV6p6DKHgPxgCZQGx6xJIocBV7dnwmJ5QXeoqzQJtPLZf9nFkx5hzzNo7uz8miaV8
         odN63OY8ZQHkZP0+ET4Z0hhcuNTpKch8wJw/hTce9RtR0ed8msstupwVNVlmI24PXFg8
         rYQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b19si14214513qtb.319.2017.09.13.00.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 00:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds2Vs-0007lC-3r
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 03:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds2Ud-0006kN-L4
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 03:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds2Uc-0002g8-Rc
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 03:53:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ds2UX-0002Wv-3b; Wed, 13 Sep 2017 03:53:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBAF0478A;
	Wed, 13 Sep 2017 07:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CBAF0478A
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2555C6D7;
	Wed, 13 Sep 2017 07:53:43 +0000 (UTC)
Date: Wed, 13 Sep 2017 09:53:41 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170913095341.6505861c.cohuck@redhat.com>
In-Reply-To: <20170912140149.7692-4-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-4-lvivier@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 13 Sep 2017 07:53:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/3] tests/hmp: test "none" machine with
 memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t2NGPZry6COJ

On Tue, 12 Sep 2017 16:01:49 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

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

s/no memory/no memory by default/

?

> +    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
> +
>      return g_test_run();
>  }

Regardless,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
