Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9714222wrx;
        Sat, 9 Mar 2019 10:08:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzI8iioyYUA0q0fUoe3heMshtDYyR5NS8Zi9yploO8hdytCX47/1KC9TIWEN8f5IXzI90R0
X-Received: by 2002:a81:3dc8:: with SMTP id k191mr19465247ywa.139.1552154920844;
        Sat, 09 Mar 2019 10:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552154920; cv=none;
        d=google.com; s=arc-20160816;
        b=zxQY9mC2zlJwU9jJV6GVuW1nGfd7mz95RKDC8OAAgMFb3XaYAdWrLJbLrZTAjE5vV/
         3vrg7nWnir5eaEQslqYdPVc/xhnK+qpT+1m3ab/4BSCLQ9n2ahSosucSY6mhdT1QwF2u
         vbyCzHB1hiuCWs9yn3KxMc3rDIHhys0cPDhYEw9KiZMaU76ibmFVWDpCXW1tgN8Hinz9
         dFf10BLng66qfBdFjLMhbd2cZGgxWA0bEec8J6eF+XjlDC+jEVUpBdbNUpWHayEY78Sr
         ov6TQ3qEhmRXpsvF3hkLgj6LO+HSaxhkjJOuQPT2EW1iSRoceXycaC/iuI5oz7UA6gRE
         m6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=QnrXQ34ttK1DBpNNcFgqcFN/lVLGLHrnwgV95ct9gr4=;
        b=FyF3qIlZOvezaBdkUbbrdHrVQnC4f9jPgk0rdveVjiE92gHh/V4ZCyYMB5hddWHoCa
         LSnODEi7aZxIK1mbV+XF4Bl1f5JEfPIHevdmQm0s52H/g0PUSwGiB/comnsHGlBT7g5k
         XGy2U3VixVYxEk/ejXageNPyOtLGKDk21/i2f3T+rozjNDGrHSeO4qSBZpkldkicYSBA
         JemP3KiEj5VCKHGIGRxpHu3c33Ut8i33OvosD9iQ1xJTSvYqCuZ6/wvIPAxv/Lr+G3V4
         aFrH7dLSslZ8X1qasyQcpxE6Ko1FRfaB81ig5n2APVCl1itGT2IyJXAFBSkPgBtbdc9B
         WUHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l70si560677ybl.187.2019.03.09.10.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 10:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2gOm-0007Gz-9G
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 13:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gOV-0007CC-Po
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gOU-0004TK-QY
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:08:23 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h2gOU-0004RY-Gt
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:08:22 -0500
Received: by mail-wr1-f67.google.com with SMTP id o7so756878wrp.12
	for <qemu-arm@nongnu.org>; Sat, 09 Mar 2019 10:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QnrXQ34ttK1DBpNNcFgqcFN/lVLGLHrnwgV95ct9gr4=;
	b=nCC4QPFp4mLLz3BNeKxCiog42VPSE4PPyt0f8sfuXFmMSPdfvmmQAE3Za7PKBRwJYJ
	eJ4I3MytTZ3NvNfnlsO6RQm9gSBIIRU8uhQErBGflDUEkRuAmXCGI+m1UKWpUuJ4biFp
	LXywHvEXp/Jqc86zh2QE859PWHxQNaq1EwesSn1quqWNt50HcZCfJJhXiXmiwbHkeHNI
	rcc77R1Cx34zZkWskGbn2yxKuRdlfKnqINM2bfgKzbVh4P4wkG+8qWlD2+W477YSRy2Y
	9SYtw7/2z8j1feZwn/uUKodEQU/HnSckdgsnfGGlvDV+7mHJLcDlmYF/pqwhnu2tIt9c
	d6AA==
X-Gm-Message-State: APjAAAWUlaU+wTob7iS0/WPf06DQZRBvKuRXn/p/QpEt95taz7kVbrNn
	2C+YfAyW6g5+OFxhOvtWfzg0oQ==
X-Received: by 2002:adf:8273:: with SMTP id 106mr15670522wrb.34.1552154900973; 
	Sat, 09 Mar 2019 10:08:20 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43])
	by smtp.gmail.com with ESMTPSA id u12sm1009513wrt.2.2019.03.09.10.08.18
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Mar 2019 10:08:19 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-17-philmd@redhat.com>
	<82e36613-3968-3459-4be7-f0e927faeb5c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <600d88c2-460a-3e59-f25b-f2ccac38ad6c@redhat.com>
Date: Sat, 9 Mar 2019 19:08:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <82e36613-3968-3459-4be7-f0e927faeb5c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH v2 16/18] hw/firmware: Add Edk2Crypto and
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGdBPNCuk0/e

Hi Eric,

On 3/8/19 3:16 AM, Eric Blake wrote:
> On 3/7/19 7:32 PM, Philippe Mathieu-Daudé wrote:
>> The Edk2Crypto object is used to hold configuration values specific
>> to EDK2.
>>
>> The edk2_add_host_crypto_policy() function loads crypto policies
>> from the host, and register them as fw_cfg named file items.
>> So far only the 'https' policy is supported.
>>
>> An usercase example is the 'HTTPS Boof' feature of OVMF [*].
> 
> s/An/A/ since "user" is a pronounced or hard 'u' (English is funny, but
> the rule of thumb is you add the consonant only before a soft u, and not
> a pronounced one; as in "give an umbrella to a unicorn")

I appreciate the correction, thanks :)

>>
>> Usage example:
>>
>>   $ qemu-system-x86_64 \
>>       -object edk2_crypto,id=https,\
> 
> Might as well use --object (both spellings work for qemu, but since
> --object is the only spelling for qemu-img/qemu-nbd, being consistent
> between the lot is useful).

$ git grep -- ' -object ' | wc -l
83

^ cover various subsystems:

$ git grep -l -- ' -object '
docs/amd-memory-encryption.txt
docs/can.txt
docs/memory-hotplug.txt
docs/nvdimm.txt
docs/pr-manager.rst
docs/pvrdma.txt
docs/replay.txt
hw/virtio/vhost-user.c
include/authz/listfile.h
include/authz/pamacct.h
include/authz/simple.h
include/crypto/secret.h
include/crypto/tlscredsanon.h
include/crypto/tlscredsx509.h
qapi/misc.json
qemu-doc.texi
qemu-options.hx
target/i386/sev_i386.h
tests/bios-tables-test.c
tests/qemu-iotests/127
tests/qemu-iotests/200
tests/vhost-user-test.c


$ git grep -- ' --object ' | wc -l
252

^ mostly for the block subsystem:

$ git grep -l -- ' --object '
block/vxhs.c
include/crypto/tlscredspsk.h
qemu-doc.texi
qemu-img.texi
qemu-io.c
qemu-nbd.c
qemu-nbd.texi
tests/qemu-iotests/049
tests/qemu-iotests/049.out
tests/qemu-iotests/087
tests/qemu-iotests/134
tests/qemu-iotests/149.out
tests/qemu-iotests/158
tests/qemu-iotests/178
tests/qemu-iotests/188
tests/qemu-iotests/189
tests/qemu-iotests/198
tests/qemu-iotests/233

I'll change, but I'm not sure what is the default we should enforce...

> 
>>               ciphers=/etc/crypto-policies/back-ends/openssl.config,\
>>               cacerts=/etc/pki/ca-trust/extracted/edk2/cacerts.bin
> 
> (I really should follow through on my threat to teach QemuOpts to ignore
> whitespace after ','; but for this commit message, it's obvious the
> indentation has to be stripped for the command line to be valid)
> 
>>
>> (On Fedora these files are provided by the ca-certificates and
>> crypto-policies packages).
>>
>> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
