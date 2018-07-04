Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp450582wrq;
        Wed, 4 Jul 2018 04:55:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGGEAQfPz9hNI+iCBmps2XT9ZROeGVB4dgLZIxAo1U9JIb5XrmMwugU9jkZEBjozB1iZNK
X-Received: by 2002:ac8:2969:: with SMTP id z38-v6mr1294194qtz.386.1530705318224;
        Wed, 04 Jul 2018 04:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530705318; cv=none;
        d=google.com; s=arc-20160816;
        b=bDtJeaJbXwRdKuWmNNAoPxbowthYpy28bomaQpjEnzk76HK3p8ap1yvSzzJo/5T880
         e0pcQmkmLvVjvmGq69X0CdcNkqgshypfU+HRONL7BUArTDANqUTR2LUSVQOUXdGlbVCx
         kvT30CbQuJzQ3uUwax6omZXqVRhe7kf1eJr8YNwEAHB3Xj+hac7wqC1IniQpYlfgGkSl
         S1g0CRQwa4/wUyicyikYwA5h+/Xk2hPyBwA/Ql5wZt7OFt0O+AbcCNfxAK9ie9T3Fh2G
         iYVVfenKR/R28QFcbyQjzxhg4f8dB6L8ro+xQ+tzztP3RT6M09Va25eXR6QnIuXOaAAz
         mGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:arc-authentication-results;
        bh=D7fKWShmJn6XjG4MuNJySvirj0HDJEbzoppWK/ZHZTY=;
        b=j3hjmTkkvWyFutlrKPciva/GZuOo19CJllreFVpHgHGuuipaiQW1NH274XosFA08i5
         xIgM4/x2K17p1NYjD42rnjhoXb/NouJVUziwJRpaPQY4z1aUKWVIDx6SdjXANdfSOvs5
         hJKLVGvardrh34DBfPMsS5p2x7HFxM1cS5ev68j//3ovHJ7+Vc5nk8nvNH/ejCAw8ZbW
         K2NrsVsy5WPZ6aRRtyB8vyHtABZXGGZUP03CKhcatSeLIiRP8Mv/HofhgnHms17lw/RX
         yGPqVwWA7zycxxPQpctPsp+qNs6+x6TkMSgvnIcJaxDd9XmOPqPkpKpfwbmEBzyvNpsY
         y79A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d38-v6si1809819qte.221.2018.07.04.04.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jul 2018 04:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fagNR-0000hk-Ld
	for alex.bennee@linaro.org; Wed, 04 Jul 2018 07:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fagLz-000899-Vf
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 07:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fagLw-0005kz-2Q
	for qemu-arm@nongnu.org; Wed, 04 Jul 2018 07:53:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51680 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1fagLv-0005kd-Rw; Wed, 04 Jul 2018 07:53:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D31BB798;
	Wed,  4 Jul 2018 11:53:43 +0000 (UTC)
Received: from [10.36.117.192] (ovpn-117-192.ams2.redhat.com [10.36.117.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5512026D76;
	Wed,  4 Jul 2018 11:53:41 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-6-git-send-email-eric.auger@redhat.com>
	<8495014b-5811-4f4f-5af3-d065cd6561b7@redhat.com>
	<2513e4a9-8980-6274-b933-a5e107b32da5@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <401ccabc-584a-8754-bcb6-b4fdea6fe836@redhat.com>
Date: Wed, 4 Jul 2018 13:53:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2513e4a9-8980-6274-b933-a5e107b32da5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 04 Jul 2018 11:53:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 04 Jul 2018 11:53:43 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 05/15] hw/arm/virt: handle
 max_vm_phys_shift conflicts on migration
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
Cc: agraf@suse.de, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UwZ9p0tQAdDh

On 03.07.2018 21:32, Auger Eric wrote:
> Hi David,
> On 07/03/2018 08:41 PM, David Hildenbrand wrote:
>> On 03.07.2018 09:19, Eric Auger wrote:
>>> When migrating a VM, we must make sure the destination host
>>> supports as many IPA bits as the source. Otherwise the migration
>>> must fail.
>>>
>>> We add a VMState infrastructure to machvirt. On pre_save(),
>>> the current source max_vm_phys_shift is saved.
>>>
>>> On destination, we cannot use this information when creating the
>>> VM. The VM is created using the max value reported by the
>>> destination host - or the kvm_type inherited value -. However on
>>> post_load() we can check that this value is compatible with the
>>> source saved value.
>>
>> Just wondering, how exactly is the guest able to detect the 42b (e.g. =
vs
>> 42b) configuration?
>=20
> the source IPA size is saved in the VMState. When restoring it on
> post_load we check against the current IPA size (corresponding to the
> max the destination KVM does support). The destination IPA size is
> chosen before creating the destination VM. If the destination IPA size
> is less than the source IPA size, we fail the migration.
>=20
> Hope this helps

No, I asked if the *guest* is able to distinguish e.g. 43 from 44 or if
the device memory setup is sufficient.

Once you create the machine, you setup device memory (using the maxmem
parameter).

From that, you directly know how big the largest guest physical address
will be (e.g. 2TB + (maxram_size - ram_size)). You can check that
against max_vm_phys_shift and error out.

During migration, source and destination have to have the same qemu
cmdline, especially same maxmem parameter. So you would catch an invalid
setup on the destination, without manually migrating and checking
max_vm_phys_shift.

However (that's why I am asking) if the guest can spot the difference
between e.g. 43 and 44, then you should migrate and check. If it is
implicitly handled by device memory position and size, you should not
migrate it.

>=20
> Thanks
>=20
> Eric
>=20
>>


--=20

Thanks,

David / dhildenb
