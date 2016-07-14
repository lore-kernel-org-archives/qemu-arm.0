Received: by 10.25.21.156 with SMTP id 28csp127184lfv;
        Thu, 14 Jul 2016 07:43:40 -0700 (PDT)
X-Received: by 10.55.156.7 with SMTP id f7mr18436072qke.123.1468507420708;
        Thu, 14 Jul 2016 07:43:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126si1493053qkf.208.2016.07.14.07.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhrY-0000nI-46
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:43:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bNh3b-0003Oj-JQ
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bNh3V-0003YD-Fq
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 09:52:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bNh3V-0003Y6-9s; Thu, 14 Jul 2016 09:51:57 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C35FAD6846;
	Thu, 14 Jul 2016 13:51:56 +0000 (UTC)
Received: from [10.33.192.219] (dhcp-192-219.str.redhat.com [10.33.192.219])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDpr0H005910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 14 Jul 2016 09:51:54 -0400
To: Marcel Apfelbaum <marcel@redhat.com>, qemu-devel@nongnu.org
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
	<1468503826-10617-2-git-send-email-marcel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4294e73-88a1-ba9b-9e52-3527b142ae57@redhat.com>
Date: Thu, 14 Jul 2016 15:51:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2
MIME-Version: 1.0
In-Reply-To: <1468503826-10617-2-git-send-email-marcel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 14 Jul 2016 13:51:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] tests/prom-env-test:
 increase the test timeout
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	leon.alrae@imgtec.com, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: byB1q6aVT6c8

On 14.07.2016 15:43, Marcel Apfelbaum wrote:
> On a slower machine the test can take more than 30 seconds.
> Increase the timeout to 100 seconds.
> 
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  tests/prom-env-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/prom-env-test.c b/tests/prom-env-test.c
> index 6df57d2..7a62857 100644
> --- a/tests/prom-env-test.c
> +++ b/tests/prom-env-test.c
> @@ -30,7 +30,7 @@ static void check_guest_memory(void)
>      int i;
>  
>      /* Poll until code has run and modified memory. Wait at most 30 seconds */
> -    for (i = 0; i < 3000; ++i) {
> +    for (i = 0; i < 10000; ++i) {
>          signature = readl(ADDRESS);
>          if (signature == MAGIC) {
>              break;

Ack, but could you please also update the comment before the for-loop?

 Thanks,
  Thomas

