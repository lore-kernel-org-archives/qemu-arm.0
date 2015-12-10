Received: by 10.182.158.201 with SMTP id ww9csp444504obb;
        Thu, 10 Dec 2015 04:31:19 -0800 (PST)
X-Received: by 10.140.166.10 with SMTP id m10mr5664401qhm.35.1449750679175;
        Thu, 10 Dec 2015 04:31:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si14565925qhc.25.2015.12.10.04.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 04:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a70NS-0005x3-EB
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 07:31:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a70NM-0005wn-M9
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 07:31:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a70NH-0008PC-UN
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 07:31:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a70NH-0008Oz-PE; Thu, 10 Dec 2015 07:31:07 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 15CE519CBAA;
	Thu, 10 Dec 2015 12:31:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBACV4Bb026018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 07:31:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 948BC303F916; Thu, 10 Dec 2015 13:31:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
	<5669589E.4050904@redhat.com>
Date: Thu, 10 Dec 2015 13:31:03 +0100
In-Reply-To: <5669589E.4050904@redhat.com> (Paolo Bonzini's message of "Thu,
	10 Dec 2015 11:49:02 +0100")
Message-ID: <87egeufptk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Use error_fatal to simplify
	obvious fatal errors
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uFATQRu+mr0f

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/12/2015 11:19, Markus Armbruster wrote:
>> +    object_property_set_int(OBJECT(cpu), ZYNQ_BOARD_MIDR, "midr",
>> + &error_fatal);object_property_set_int(OBJECT(cpu),
>> + MPCORE_PERIPHBASE,
>> + "reset-cbar",
>> + &error_fatal);object_property_set_bool(OBJECT(cpu),
>> + true,
>> + "realized",
>> + &error_fatal);
>
> Something went wrong here. :)

Once again I demonstrate incompetence at proofreading my own patches %-}

No idea what happened.  I'll fix it.

>>  void qdev_prop_set_drive_nofail(DeviceState *dev, const char *name,
>>                                  BlockBackend *value)
>>  {
>> -    Error *err = NULL;
>> -
>> -    qdev_prop_set_drive(dev, name, value, &err);
>> -    if (err) {
>> -        error_report_err(err);
>> -        exit(1);
>> -    }
>> +    qdev_prop_set_drive(dev, name, value, &error_fatal);
>>  }
>
>
> This should be inlined entirely into the callers (possibly as a follow up).

Yes, a FOO_nofail() wrapper around a FOO() taking Error ** is pointless.
I'll prep a follow-up patch.

> Otherwise looks great, thanks!

Thanks!
