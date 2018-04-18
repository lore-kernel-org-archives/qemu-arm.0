Received: by 10.28.4.212 with SMTP id 203csp296585wme;
        Wed, 18 Apr 2018 09:20:15 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49ke1AzfnS0MWhG++i4DUuAFbJXxGp3/fiymFVBSCvBB9AmYcA720VxEpt00RyIcGagLxPU
X-Received: by 2002:ac8:2bee:: with SMTP id n43-v6mr389206qtn.258.1524068414955;
        Wed, 18 Apr 2018 09:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524068414; cv=none;
        d=google.com; s=arc-20160816;
        b=rDy0Uho70KHhYP0Rkitw0JiPCFfWaW/p38m3uRC0wRVEu7GzRGo1ikoJkrbAaXpC/i
         PFkfd4F3NDUqzDXAIhWkGUfNuhAxYpgQaUUPqzmXd82Wf4Tr7veCnf2z4ONSXlNIxovW
         6ndtSXI4sUMUGf17zE8oED/sWM+c/u8L7w7W00Zs5hdrJYpEn3GXxG36PiLMvWbycZQ3
         12NcRSQvfdLxD8qLIzsMWCQqeSGUeYyS/H53hn/5I6Pe+0Ne0k6zQMh68p1AMIRRLOhr
         n4EsxDN5waBo2EWCFvFEegWL6LJCdDx9d+u5KFz/HH4GLABIMOrMV7Hm5FIx7M7L2QBO
         /BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=vxgjj28yxOcjiVVeEEQv4/QCTtugUd5J644XYdpF4LI=;
        b=Yf7wrBH2xuuegWRMGEcCBpS7fzOUI8nteJsrhwJIqD0/V6vPH5E73mBDkpS4PT+Pex
         sGyM+cYjdEMnBUHRYXaAMtseq2Jg+BownghHhJNDTE1vXuluMWLdXuY3YoxJX2Xv4Yue
         u9dZ9PL0CHIftkfrHpuTs1ZFMuy1Kd/QM4lDanWN3GGOr+gDfAWSaHGpgPfFP4ZYE0mS
         n1dGHLDp8Veks2GmzlIApAX3hos32xewxX1xOE533t10jihMb3DLzWSjkckAsxa/aBIM
         2AmfR8vKiQwBvIGmic4iRuPL00x06Ek4s0it4wDl+eHKJYxHSVVNm/bDqX7QiWd1mGDi
         6Gdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dIF/GWju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1si1955586qkd.135.2018.04.18.09.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 09:20:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dIF/GWju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8poc-0001QQ-Eo
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 12:20:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8poQ-0001Ox-4t
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 12:20:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8poP-0000U5-2G
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 12:20:02 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:47097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8poJ-0000Sv-QD; Wed, 18 Apr 2018 12:19:56 -0400
Received: by mail-qt0-x241.google.com with SMTP id h4-v6so2368296qtn.13;
	Wed, 18 Apr 2018 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vxgjj28yxOcjiVVeEEQv4/QCTtugUd5J644XYdpF4LI=;
	b=dIF/GWjuohN5D7NJQh2N3HXtjksjZ8OV9bGpAQEyPN47vyD9elII5lCfBkqlyV2HJi
	hqFPEeFyDkgoiE98pT1XHDf2G4D22O9RmpTwyr7OY12T0OvxzsblCzharJ5xAn9+zrtP
	OvScVsMv2YFyQlMWRoELDbnOI+1PDZaYy2O4ASb4patqYCp4fEd8xDMkYxcg6PqAp2pZ
	pqiNKwVMGWOfOAINnBvK5GSC3EE7ew+/xSS4/TDkPwZAPyl9mW/J7KdoGc+kkdwzDDXT
	67bIGT33tsMBKLp7laVI76ZWEEnIfDSkOGlK3QeHt0W1XJAvcHTqpnGFMicMui+ApV5N
	qCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=vxgjj28yxOcjiVVeEEQv4/QCTtugUd5J644XYdpF4LI=;
	b=aB7beZ5Evn/AvW8Wf09nkWiSCMAsNC9HGCEXgDwfsVd1DLU94a9pQBzboT8xRCxNOs
	7X9HwC9XbcKPLfY4vAoglgRxJlHM2g5pc9SWjFviqIrpqo0rJFUKjRdiKuvvIZJ0c+IV
	LhlaVapK6YcN1FGokzG96uY/VkevFnf7st0Ry4uBc1GGd+KV28BRwFI8gkgJVs0+j20C
	TJsE57WsR73ZBP1KNYq7S3h2V7GBTukb5T4V6+ATvzejNBA2IzAI848Kb5d5OLD7AI4q
	MkiOeUhJtYmKQJLGoqaqTNux+MHpUdnOoats9k08FYB1lfyPYXI3+dsTQ+o0a0jsf8sA
	ODgg==
X-Gm-Message-State: ALQs6tDjzLkN0PUdFHs/cxefSyTqUEF6Tu/Z3LmuxGh8R6ikNbuxpG3x
	9uoa57ap/YPXPDfLbaVaHNw=
X-Received: by 2002:ac8:3faf:: with SMTP id
	d44-v6mr2705582qtk.169.1524068395276; 
	Wed, 18 Apr 2018 09:19:55 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	j25-v6sm1113029qtp.30.2018.04.18.09.19.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 09:19:54 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-4-git-send-email-imammedo@redhat.com>
	<20180418145603.GN29865@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aa061208-6177-7397-b710-9f9ad93e78da@amsat.org>
Date: Wed, 18 Apr 2018 13:19:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418145603.GN29865@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH for-2.13 v2 3/5] pc: simplify
 MachineClass::get_hotplug_handler handling
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger@redhat.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pepa4EOVzrVV

On 04/18/2018 11:56 AM, Eduardo Habkost wrote:
> On Wed, Apr 18, 2018 at 04:28:03PM +0200, Igor Mammedov wrote:
>> By default MachineClass::get_hotplug_handler is NULL and concrete board
>> should set it to it's own handler.
>> Considering there isn't any default handler, drop saving empty
>> MachineClass::get_hotplug_handler in child class and make PC code
>> consistent with spapr/s390x boards.
>>
>> We can bring this back when actual usecase surfaces and do it
>> consistently across boards that use get_hotplug_handler().
>>
>> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> 
> [...]
>> @@ -2344,7 +2341,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>      HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>>      NMIClass *nc = NMI_CLASS(oc);
>>  
>> -    pcmc->get_hotplug_handler = mc->get_hotplug_handler;
> 
> What about assert(!mc->get_hotplug_handler) just before
> overwriting it?

Good idea.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

