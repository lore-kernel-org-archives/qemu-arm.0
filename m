Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp603939wrq;
        Wed, 11 Jul 2018 13:17:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfsiesmZk4fmxoG1aPDUfwUCoDZXfhH8TasTolQ3jJRz7POAcf3Bj1nJXk/+bRGoua6dFTl
X-Received: by 2002:a0c:d21d:: with SMTP id m29-v6mr152661qvh.86.1531340228967;
        Wed, 11 Jul 2018 13:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531340228; cv=none;
        d=google.com; s=arc-20160816;
        b=oCJzx4HrldB8Qzx6meUgLn2GrzkHNq8Ga20BC7hz9fASQAgrvzMTa/lyxMgbso3xKU
         iZDFHqE0EHzmaRNQD8ACfurOa+ZgD6LvRnjEHQWk0c92ebK8puGRCHZOo555IJ+XRAso
         vlrSi/PbPeyPbWIcABfvtl0p7CI7hO7ZIYiUTFoJX2XpjiSvtJBk/qsWXfcr6lJ848zz
         5ecO+uHk3Kg7IymbumCbQMTpSIwN1PLtUQh0VdBnQDbOaseuZh1eljghwfjsaXiR8FFr
         EYmnV5PYoBLO0mffjxbVQMdQfdvbm5zn1BOJtfYv18sZVNQABaz2hP0yGoDBKac6t+mC
         oskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=879o69OQJuTvPFDlhOg/49rGUakZJmUWsoMm2KOerxo=;
        b=GcMC8D2u7VfUwbyiN0U4OBxl7k0P0Z1l45IoHjHLim6+fCIODQEmT2wN/NUJkDheb9
         g5Q6+Zdll428udcr4wk0c8xP5xUMQnVIgyLYyR5OT44NPzrM/8bMjnElvdiJYEZL6aWy
         xKKBnxn8ApahIC0AUUqIt+C48LpGzm8AVRTU9a/d6pimq2wN35Rpm7NVtaHebkcsF4U2
         kgkWuNl4DHkzBIGBHIA7BB7BW/jtt0BdgYuzTsLW5roXcLITZQpXFgg4fiPP2iRPoMf6
         pupjMRJTBOybsCZBKkQXYBlEGM54f3nJS12UWUFf1NAdVlZnu6UICi174y+LHTa48LbF
         mf+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="iJK2c/9y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f39-v6si4018919qtk.237.2018.07.11.13.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 13:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="iJK2c/9y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdLXw-00043H-Fm
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 16:17:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fdLXc-00041W-Cd
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 16:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1fdLXZ-0002uh-9S
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 16:16:48 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:54632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1fdLXZ-0002uS-2n; Wed, 11 Jul 2018 16:16:45 -0400
Received: by mail-wm0-x242.google.com with SMTP id i139-v6so3514128wmf.4;
	Wed, 11 Jul 2018 13:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=879o69OQJuTvPFDlhOg/49rGUakZJmUWsoMm2KOerxo=;
	b=iJK2c/9yXesjQQ1B+qFe7qBTO4IAzgR17I4v5LqEi9Z8VVin0NrjPOKMxzJfkryYl8
	ePrKe/KSU3io/w/Nxo5/8o9rVy1Dzq9pjBeCjmLyXh+n8erilEVgQKXrwLNiexamq64j
	cTfPQvsWhj/GKVBJ/VdPqotLJJ87v4YrsD29wSk1ZfXljHI1+mTa85zzpVUrebH6b6YB
	qXhYYuJtCWaDsYaJb3aI7u7bhf/uha8ypuWLCsV0TDtWrG6d946hfR0DlMgOnXGwuQqQ
	t/zaU22KFOTq8nxW5SG0jpcXUlWnwUSQY2Flo3941y1MxCDnJS5y7jbRlX64Yp66+zoR
	aShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=879o69OQJuTvPFDlhOg/49rGUakZJmUWsoMm2KOerxo=;
	b=Km6MAuiSTV/Sghsqs/z21e1Ck1649rpsNvaf9MkPZzRd0DIGNPQku9UzKZIVzhBXgt
	eZSi4HZcUfBWF/ukc+54MQxnymLmyOkmEtS9pvHTtDXgSwBXJFUhYqr0DJDGTGbOXlgn
	KlG/w6Al6RtR3VR/eyk+41DqPFi8I30mZgnzZk78lliWjWh2gqROMLJ/G8BjugQigQnR
	IVu2Td8dQ4iM+U/yctWQfpAKP8l3Feb+HoAQWf13u/pTRwwj5KFQpW4e2y9z0dr+b0zy
	em0JM1VCb4+MqjXarjvE5QSy98I3hAa7zeKz+UNvm+/1lHNlN7qgXtIyo+f4/gB6lx1y
	SgtQ==
X-Gm-Message-State: AOUpUlFkkVjDGCWIYxKy8hGhD9Iqq+fl+xpaX5TTxh3eJdQHPv3xVOQv
	VR5ph4L9QDfQ/BJgQ7uhdfY=
X-Received: by 2002:a1c:6354:: with SMTP id x81-v6mr13704wmb.23.1531340204055; 
	Wed, 11 Jul 2018 13:16:44 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-151-35.clienti.tiscali.it.
	[78.12.151.35]) by smtp.googlemail.com with ESMTPSA id
	f18-v6sm20941593wrt.64.2018.07.11.13.16.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jul 2018 13:16:43 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<20180711183031.GM914@localhost.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; keydata=
	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
Message-ID: <ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
Date: Wed, 11 Jul 2018 22:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180711183031.GM914@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8WAlwIeBhZ/k

On 11/07/2018 20:30, Eduardo Habkost wrote:
>> The theoretical behavior should be:
> It's not clear below where you expect
>   qdev_set_parent_bus(..., sysbus_get_default())
> to be called (if it should be called at all).
> 
> I don't know where it should be called, but I'm absolutely sure
> instance_init is not the right place.

I think instance_init is fine to call qdev_set_parent_bus on contained
devices.  Why do you say it's not?

Thanks,

Paolo
