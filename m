Received: by 10.182.105.169 with SMTP id gn9csp1017958obb;
        Sun, 8 Nov 2015 23:45:00 -0800 (PST)
X-Received: by 10.140.19.13 with SMTP id 13mr27683438qgg.97.1447055100459;
        Sun, 08 Nov 2015 23:45:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si10167327qhu.79.2015.11.08.23.45.00
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 23:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvh8O-000501-5T
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 02:45:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zvh83-0004iA-3Y
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 02:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zvh82-0006iX-8B
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 02:44:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zvh7x-0006iB-RF; Mon, 09 Nov 2015 02:44:33 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id A81B2A4512;
	Mon,  9 Nov 2015 07:44:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA97iUPF006427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 9 Nov 2015 02:44:32 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2749C303F90E; Mon,  9 Nov 2015 08:44:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
Date: Mon, 09 Nov 2015 08:44:30 +0100
In-Reply-To: <CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	(Peter Maydell's message of "Sat, 7 Nov 2015 16:56:47 +0000")
Message-ID: <87twovpqg1.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: error_report cleanups
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aEAzml2KSgHM

Peter Maydell <peter.maydell@linaro.org> writes:

> On 7 November 2015 at 15:25, Andrew Jones <drjones@redhat.com> wrote:
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> ---
>>  hw/arm/virt.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 77d9267599b7e..9c6792cea16f6 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -941,8 +941,8 @@ static void machvirt_init(MachineState *machine)
>>      if (!gic_version) {
>>          gic_version = kvm_arm_vgic_probe();
>>          if (!gic_version) {
>> -            error_report("Unable to determine GIC version supported by host\n"
>> -                         "Probably KVM acceleration is not supported\n");
>> +            error_report("Unable to determine GIC version supported by host");
>> +            error_printf("KVM acceleration is probably not supported\n");
>>              exit(1);
>>          }
>>      }
>> @@ -990,7 +990,7 @@ static void machvirt_init(MachineState *machine)
>>          char *cpuopts = g_strdup(cpustr[1]);
>>
>>          if (!oc) {
>> -            fprintf(stderr, "Unable to find CPU definition\n");
>> +            error_report("Unable to find CPU definition");
>>              exit(1);
>>          }
>>          cpuobj = object_new(object_class_get_name(oc));
>> @@ -1126,8 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>>      } else if (!strcmp(value, "host")) {
>>          vms->gic_version = 0; /* Will probe later */
>>      } else {
>> -        error_report("Invalid gic-version option value\n"
>> -                     "Allowed values are: 3, 2, host\n");
>> +        error_report("Invalid gic-version option value");
>> +        error_printf("Allowed gic-version values are: 3, 2, host\n");
>>          exit(1);
>>      }
>
> Would it be better just to have a single error_report
> for these without the newlines, eg
>
>           error_report("Unable to determine GIC version supported by host. "
>                        "KVM acceleration is probably not supported.");
>
> ?

For consistency, error messages should be a phrase, not a full sentence,
let alone a paraphraph.

You can of course turn any parapgraph into a phrase by stringing
together its parts with semicolons, but that's cheating :)

Reviewed-by: Markus Armbruster <armbru@redhat.com>
