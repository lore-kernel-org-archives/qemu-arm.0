Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp603084wrq;
        Wed, 11 Jul 2018 13:16:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeC/aUdQlsWXt/I5Bj6DoIOAdmbvaSI4ZX2+it8ZUst7MTPyUDkpqq0cJj6mlAkvAqL3IJV
X-Received: by 2002:ac8:2384:: with SMTP id q4-v6mr110975qtq.136.1531340164931;
        Wed, 11 Jul 2018 13:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531340164; cv=none;
        d=google.com; s=arc-20160816;
        b=CQJb0SedJthNz9dc1ykNH3eMUtZlL77j2GfOxH30Ui45S/ep/UZlDbcmyNzOZuAGnJ
         hDsSP1dc1GcQucnmUrEjWgox1OAGPyKk5sXfMEJVR3q0icuUKtG1i4X5zIV3OTneBVfb
         c9btl5wz5LL47F867hukBU40tt24BsGUTO30OxTJzrD4oOIpk4p4H7rPoS6v2tV+DkKp
         eQMo6KWZfASq1ZByK/CC2ZcHlYESD/ck1dcjSSc7WEBKkSgW2/I6NfIiuYj068TWfniL
         W70VgkEyvmeB9GKYa6Tk7Z6wFm3qQZOhrwYsGLE//JCaWuTX/Yjqiyv3Hnc0hhgGAFmt
         epag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=3yhRtA1/hZTyR12gBvSfzrjoz+QTLhflMvTiJx4VTpE=;
        b=qkZTIf7mQ9nGRJbK/KEY/cMgklgAZIcMfgy3VbM/huv6Ro+xaGnuFq6upQ1p/p0fMi
         yNLkyzqVKmkJWrFKVg2sQ9jOoEXz+WY4HQ5X0YrHILjVsj11Y+UBjgTdCZVD7GUReNyK
         rbEFtgbO3DS7ZN5ezX523cAHQnkTEL23qY/rp9LdKERvwEFlLIYa56jDHcbEGoZJTfTg
         NLzCOgfelff7lhti4Y925d8YhCqixG0YP9+w/pIoNw7hzsfjmy8HNSNyUDitu05kghZJ
         R/qsgb3+47j7C7PkOlPiGxDgRD39BkO8b2be3u1yZSb1ve6829hmfboMDMkOAb3UxC1i
         qy+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aEKC0Ciq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4-v6si1740870qta.149.2018.07.11.13.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 13:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aEKC0Ciq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdLWu-0003aP-C0
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 16:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fdLWh-0003Yt-Dc
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 16:15:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fdLWe-0002Ye-8k
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 16:15:51 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1fdLWd-0002XF-VY; Wed, 11 Jul 2018 16:15:48 -0400
Received: by mail-wr1-x444.google.com with SMTP id r16-v6so19398651wrt.11;
	Wed, 11 Jul 2018 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3yhRtA1/hZTyR12gBvSfzrjoz+QTLhflMvTiJx4VTpE=;
	b=aEKC0CiqSRSEuKSWjMZYfYrBFp3mb9jpU81ZFsRwO7p3PR0r/pA8Id3xZGAIr3im7P
	xyns5zzI6kZjS9y/Km4Tn+9leW77i/KhxYWNxQRpID6i1mWuSz2czbuAIVzN3fFbUdox
	GKl/KDn97lV0ORIW0JaFCN9zOWSKLHe/6CWelu/w8TH9icQOiYrk+6htShruuXLCQTj6
	DLKIxcYFGxrSzskpOXmSgbBwCtH5WBwEWn1bNq5rjb2LaWykanG54QM9Z8x80xQRVGLU
	u4WONjCiM8sUe/1+7tnZSxUapwRu2luVXaH8vLsu9XOFyDHfjqQCkRlwkEsWUH0T/lGu
	Y0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3yhRtA1/hZTyR12gBvSfzrjoz+QTLhflMvTiJx4VTpE=;
	b=fPCwv1Kr/3CWZauF0piKMTvMhRjIEvaTYcAUVgo8xyKpusbwnBSoIH6Ps5X553F3w5
	KM42rUxMEJp0cnh5hnZzj3yX66qHRIGOw+ojd9oUT+HcZISV/lOE4eqskRA1SK0z3DW0
	xK2qP+7NNLOW+8Ca0WYL1X/jAB8oh6uymTvWg5hUkXP2v4XQD87+lWQ0O3xK248Mo7Mc
	fyMiAB8FBAmVlTy9H0pef/L/RFSAI+O+0XdEjNZkkqvAMtl3kONq/K5du7wV1FJY2rH0
	doU6rwTkfro1kOjD9+7Puv0AdvVZnALLMTlcec4k7WvnxIDh9xOUP9uBOxtDlNRVVjT8
	EYxA==
X-Gm-Message-State: AOUpUlH+zZAjawwu8EZolMlRP9lO7OkJp0lSN/R+iP24mrAaKoCssWSS
	x/I+/wJtzsJBwseeKicRpHA=
X-Received: by 2002:adf:8541:: with SMTP id 59-v6mr43945wrh.223.1531340146767; 
	Wed, 11 Jul 2018 13:15:46 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-151-35.clienti.tiscali.it.
	[78.12.151.35]) by smtp.googlemail.com with ESMTPSA id
	i6-v6sm15793671wrr.10.2018.07.11.13.15.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jul 2018 13:15:45 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<163e1c54-c953-e5fe-3142-eab18e0362b8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; keydata=
	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
Message-ID: <016ebe6a-91e3-24f3-9e2a-26613bd9f61e@redhat.com>
Date: Wed, 11 Jul 2018 22:15:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <163e1c54-c953-e5fe-3142-eab18e0362b8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aLrETQwR58mb

On 11/07/2018 20:43, Thomas Huth wrote:
>>
>> - realize fails
> In this case, the failure is before realize is attempted,
> qdev_device_add() already stop with "Device '%s' can not be hotplugged
> on this machine".

Still, object_unparent is called by qdev_device_add in the error path,
and it should work the same way (in a nutshell, recursive unparent when
child properties are deleted, and finalization of the contained objects
as the last reference is dropped).

>> - object_unparent is called on the device that failed to realize (see
>> qdev_device_add).  object_unparent calls device_unparent
> Hmm, are you sure? I can see that object_unparent calls device_unparent
> indirectly for the *child* nodes of the device, but not for the device
> itself...

object_unparent -> object_property_del_child ->
object_finalize_child_property -> device_unparent

I think you're on the right track, after object_property_add_child you
need to drop the reference to the object.  For example qmp_device_add
does it after qdev_device_add returns a device successfully (just an
example---I understand it is not the case with bcm283x).  In that case
the call to object_property_add_child is in qdev_set_id.

Paolo
