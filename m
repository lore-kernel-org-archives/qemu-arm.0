Received: by 10.25.21.156 with SMTP id 28csp1226086lfv;
        Mon, 18 Jul 2016 12:35:43 -0700 (PDT)
X-Received: by 10.55.122.65 with SMTP id v62mr44829658qkc.145.1468870543028;
        Mon, 18 Jul 2016 12:35:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65si17225862qkj.271.2016.07.18.12.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jul 2016 12:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPEKM-0007dt-84
	for alex.bennee@linaro.org; Mon, 18 Jul 2016 15:35:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bPEJV-00068x-1R
	for qemu-arm@nongnu.org; Mon, 18 Jul 2016 15:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bPEJQ-0001Y8-Sr
	for qemu-arm@nongnu.org; Mon, 18 Jul 2016 15:34:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bPEJQ-0001Y4-Mm; Mon, 18 Jul 2016 15:34:44 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8E98C0B73EC;
	Mon, 18 Jul 2016 19:34:43 +0000 (UTC)
Received: from [10.35.202.35] (vpn-202-35.tlv.redhat.com [10.35.202.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6IJYY0l011091; Mon, 18 Jul 2016 15:34:38 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, mst@redhat.com
References: <1468503826-10617-1-git-send-email-marcel@redhat.com>
	<1468503826-10617-2-git-send-email-marcel@redhat.com>
	<c4294e73-88a1-ba9b-9e52-3527b142ae57@redhat.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <578D2F4A.50607@redhat.com>
Date: Mon, 18 Jul 2016 22:34:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <c4294e73-88a1-ba9b-9e52-3527b142ae57@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 18 Jul 2016 19:34:44 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, leon.alrae@imgtec.com,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cbPVqNG2wrYJ

On 07/14/2016 04:51 PM, Thomas Huth wrote:
> On 14.07.2016 15:43, Marcel Apfelbaum wrote:
>> On a slower machine the test can take more than 30 seconds.
>> Increase the timeout to 100 seconds.
>>
>> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
>> ---
>>   tests/prom-env-test.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/prom-env-test.c b/tests/prom-env-test.c
>> index 6df57d2..7a62857 100644
>> --- a/tests/prom-env-test.c
>> +++ b/tests/prom-env-test.c
>> @@ -30,7 +30,7 @@ static void check_guest_memory(void)
>>       int i;
>>
>>       /* Poll until code has run and modified memory. Wait at most 30 seconds */
>> -    for (i = 0; i < 3000; ++i) {
>> +    for (i = 0; i < 10000; ++i) {
>>           signature = readl(ADDRESS);
>>           if (signature == MAGIC) {
>>               break;
>
> Ack, but could you please also update the comment before the for-loop?
>

Hi Michael,
It seems a V2 is not needed, can you tweak the comment or do you prefer me to send the series/patch again?

Thanks,
Marcel

>   Thanks,
>    Thomas
>

