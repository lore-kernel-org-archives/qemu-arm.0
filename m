Received: by 10.25.0.6 with SMTP id 6csp335535lfa;
        Wed, 10 May 2017 07:44:31 -0700 (PDT)
X-Received: by 10.237.61.81 with SMTP id h17mr5717769qtf.1.1494427471059;
        Wed, 10 May 2017 07:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494427471; cv=none;
        d=google.com; s=arc-20160816;
        b=0mRTcPcz2I2VmvW2FjBXcV5QAsJhXSFxuqEH0y5IY4cW2HSBLRHN3oqGnatuL+RD4k
         jebN28Zt7Mb7sUO2ceKoP9bRn8A//3/7FyxujNU+77g2oT6ioJiBbX//AcnIkTXcHzrt
         z0l9mobyZPA/pVp37/aBnjjtg9P7xyWKKdftgfYjL7BqZ9U0JYYszUZdknj60Ku+NTcA
         p85HV3cJ4JgrTAMXEwT3Sbwm+ffnivS4/FwR3X+9j+6yEJ679AKC3SlajMm4NF24b7sK
         TLWA4XZXR8GuzIMJHTDnp+xK8y+9CqiNUDxoIpJFI/HIpz1ZdsiyVBt/d0lsJmWGmIlG
         Hzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=+NHXx4pYU4HGbpjzJMe4JhSdXpOlngShCnvURRlrWos=;
        b=eH2VYVu+H9+VQWPBTqpnDYfR4aPzPChdYI4/udPAxDYzmRoh+OB78pp1NDTPzjVWGz
         6PhGF/1CcLozEkoNEafsNOsw/yq6f4zqGLCzLDw6C4USO9r/NvPzgEap0SZq1N7HkJ5x
         ImEW68SChdCj7VOBnCC1kB0ZUC8VWTz2jgERwHuHroLQ337bDogalS3LwkuWX95K3icu
         dPk3c5blFKhEFkQH4UigYG43vMsaHwiXWhWYhMXk0hw/WD8Nd+/NfZL2M9Li02Df0C6y
         wZjMZX//AUn1WGI4HqGChnHgZJMASzNaFKA3puu+u3tnYKI/JsLWo7NkxQx+A8wr0fCr
         klAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13si3260050qtf.318.2017.05.10.07.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 07:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Sqs-0000kk-Ik
	for alex.bennee@linaro.org; Wed, 10 May 2017 10:44:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d8Sqo-0000kc-Nq
	for qemu-arm@nongnu.org; Wed, 10 May 2017 10:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d8Sqj-0006ut-PG
	for qemu-arm@nongnu.org; Wed, 10 May 2017 10:44:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d8Sqj-0006uf-G7; Wed, 10 May 2017 10:44:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47F34C05973F;
	Wed, 10 May 2017 14:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 47F34C05973F
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 47F34C05973F
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F4B17962;
	Wed, 10 May 2017 14:44:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 61FCD11385E2; Wed, 10 May 2017 16:44:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20170508211953.28017-1-eblake@redhat.com>
	<20170508211953.28017-4-eblake@redhat.com>
	<87inlap7k1.fsf@dusky.pond.sub.org>
	<81782139-d66d-72d4-c228-9dd9073a33b9@redhat.com>
Date: Wed, 10 May 2017 16:44:12 +0200
In-Reply-To: <81782139-d66d-72d4-c228-9dd9073a33b9@redhat.com> (Eric Blake's
	message of "Tue, 9 May 2017 09:07:26 -0500")
Message-ID: <87fugcwz43.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 10 May 2017 14:44:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/5] shutdown: Add source
 information to SHUTDOWN and RESET
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
	"open list:Overall" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Weil <sw@weilnetz.de>, alistair.francis@xilinx.com,
	"open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Igor Mammedov <imammedo@redhat.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paul Burton <paul.burton@imgtec.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
	"open list:Old World" <qemu-ppc@nongnu.org>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 31md5hkEstt/

Eric Blake <eblake@redhat.com> writes:

> On 05/09/2017 06:56 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>> 
>>> Time to wire up all the call sites that request a shutdown or
>>> reset to use the enum added in the previous patch.
>>>
>>> It would have been less churn to keep the common case with no
>>> arguments as meaning guest-triggered, and only modified the
>>> host-triggered code paths, via a wrapper function, but then we'd
>>> still have to audit that I didn't miss any host-triggered spots;
>>> changing the signature forces us to double-check that I correctly
>>> categorized all callers.
>>>
>>> Since command line options can change whether a guest reset request
>>> causes an actual reset vs. a shutdown, it's easy to also add the
>>> information to reset requests.
>>>
>>> Replay adds a FIXME to preserve the cause across the replay stream,
>>> that will be tackled in the next patch.
>>>
>
>>> @@ -569,7 +569,7 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
>>>          default:
>>>              if (sus_typ == ar->pm1.cnt.s4_val) { /* S4 request */
>>>                  qapi_event_send_suspend_disk(&error_abort);
>>> -                qemu_system_shutdown_request();
>>> +                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> 
>> I'm fine with using SHUTDOWN_CAUSE_GUEST_SHUTDOWN for suspend, but have
>> you considered SHUTDOWN_CAUSE_GUEST_SUSPEND?
>
> It was easy to do
> s/qemu_system_shutdown_request()/qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN)/
> for all hw/ files.  Harder would be picking a difference between
> _SHUTDOWN and a new _SUSPEND. I can do it if hardware owners want the
> distinction; but remember that this series will intentionally NOT expose
> that distinction to QMP, so I don't know how much it will buy us.

Understand.  What about clarifying SHUTDOWN_CAUSE_GUEST_SHUTDOWN's
comment

    /* Guest requested shutdown, such as via
       ACPI or other hardware-specific means */

by adding something like "(including suspend)"?  Can do on commit, we
just have to agree on a specific working.

[...]
