Received: by 10.182.105.169 with SMTP id gn9csp1325942obb;
        Mon, 9 Nov 2015 10:52:13 -0800 (PST)
X-Received: by 10.55.78.143 with SMTP id c137mr32045186qkb.72.1447095133390;
        Mon, 09 Nov 2015 10:52:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q94si12205789qkh.115.2015.11.09.10.52.13
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 09 Nov 2015 10:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvrY5-0000gQ-5g
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 13:52:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZvrY2-0000fx-Ca
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 13:52:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZvrXz-0001im-33
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 13:52:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZvrXy-0001ii-Sb; Mon, 09 Nov 2015 13:52:07 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 7A86A14AA9;
	Mon,  9 Nov 2015 18:52:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA9Iq4AW001707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 9 Nov 2015 13:52:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A6529303F90E; Mon,  9 Nov 2015 19:52:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	<87oaf3jww7.fsf@blackfin.pond.sub.org>
	<CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
Date: Mon, 09 Nov 2015 19:52:03 +0100
In-Reply-To: <CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
	(Peter Maydell's message of "Mon, 9 Nov 2015 15:47:00 +0000")
Message-ID: <878u67atv0.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
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
X-TUID: oCk21mjuChoD

Peter Maydell <peter.maydell@linaro.org> writes:

> On 9 November 2015 at 10:21, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 9 November 2015 at 07:44, Markus Armbruster <armbru@redhat.com> wrote:
>>>> For consistency, error messages should be a phrase, not a full sentence,
>>>> let alone a paraphraph.
>>>
>>> This is in direct conflict with wanting them to be actually useful
>>> to users :-(
>>
>> I appreciate your drive for useful error messages.  Judging from the
>> error messages we got, it's a rare thing.
>>
>> Let me rephrase.  The error message proper (the thing emitted by
>> error_report()) should be a phrase, and it should be short and to the
>> point.  It can be followed by hints.  Compare:
>>
>>     qemu-system-arm: Unable to determine GIC version supported by
>> host. KVM acceleration is probably not supported.
>>
>> and
>>
>>     qemu-system-arm: Unable to determine GIC version supported by host
>>     KVM acceleration is probably not supported
>>
>> I prefer the latter.  The error message proper is short and to the
>> point.  The hint points to the most probable cause.  Sensible line
>> lengths.
>
> I agree that the latter is preferable; I had been under the
> impression that we weren't allowed to use newlines in error
> messages, though...

error_report()'s contract:

/*
 * Print an error message to current monitor if we have one, else to stderr.
 * Format arguments like sprintf().  The result should not contain
 * newlines.
 * Prepend the current location and append a newline.
 * It's wrong to call this in a QMP monitor.  Use error_setg() there.
 */

If you want to print additional information, that's totally fine!  Use
error-printf().

>> By the way, the error.h API supports this message + hints convention
>> since commit 50b7b00.
>
> Thanks, I had missed this useful improvement to the API.
> How does it work in cases like this where we don't have
> an Error* to fill in?

You do what error_report_err() would do had you had an Error *err to
fill in:

void error_report_err(Error *err)
{
    error_report("%s", error_get_pretty(err));
    if (err->hint) {
        error_printf_unless_qmp("%s\n", err->hint->str);
    }
    error_free(err);
}

In other words, you print the error message proper with error_report(),
and the additional information with error_printf().

error_report_err() uses error_printf_unless_qmp() instead because it
wants to tolerate misuse in QMP context.  It isn't an assertion failure
error mostly for historical reasons.
