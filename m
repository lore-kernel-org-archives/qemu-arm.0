Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5940396wrw;
        Wed, 14 Nov 2018 08:40:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5dfdPdDdPxNGUzMBwbHStrBjZuVoqOLNdlsw15yBI9RhXGMpU8v+85uAshju3tG4969gkY2
X-Received: by 2002:a37:a3c6:: with SMTP id m189mr2450769qke.173.1542213616933;
        Wed, 14 Nov 2018 08:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542213616; cv=none;
        d=google.com; s=arc-20160816;
        b=X5bFNytslcgaF5OwqEPjyXAnmU+Dk5ZtoYm9K82jB6+IpvsOw+JzeU7uzGXoYH0rJI
         fwVy6nE4Zq3jvCWyhGJwmjwMXkzI7vJQmYB+2rSq1nc/p+7dYA5q9jIo/zaAnNUozEBw
         3ln8z62M8HAGhHAt8k+aXH+EnNtVMzNVh0mS7uf8NIIj+a4W2dizD93cxi7qx8fD1yz6
         xQhPWUxMgByAz8TMFDeBLHP+zJZ+Pmjcilnw6iMnKHzLZV/k7PDCQlUq3ckbW5po/JNt
         2O78hzUqtGBkzGz6VnVOKygRX+TYbAqi3bwv1A0u4XjZEEz6W+poyVZUyEGox/qepshQ
         J91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=sfHPBC7vAuEQNH6wRBpfuLpixaimB/gEJ59gZrWcvRs=;
        b=cOjfp0wCYdlpeeOTp5Rb+XR6ulFyUGuZjaLlZ8tm9lF4Ssb8YFtvgtIjYgAWckteO9
         MCxpemhAOdDhIC+pmZ0m3Vm4daF7NupIFlEmTuk54hrhLUVJGutrc7GyPbcT/FJUZB3M
         Jcy5ottYRvgtCe760vyt9whgYRhNeJWt8OuDcOnPSWcK8HCSdEnsrKx1FeVB6yLMEoZ3
         9T0WP0S6Jbso1ISG14CbkcBnrTTxVsINl66z0GsparxY97qcqviqySQWvo5RFx/gL73i
         36V5GqJVfjwttUMv2C3UaPEnaQMWEAbuP2kuVRpO0Bl3F6VCVQyWokL6TfEyQhOy7R/z
         yE0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m13si4972907qvk.140.2018.11.14.08.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 08:40:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMyDA-000494-4D
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 11:40:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMyCy-00048s-KK
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:40:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMyCr-0002zE-Fc
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:40:04 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gMyCr-0002xQ-7Z
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:39:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id z13-v6so18027092wrs.3
	for <qemu-arm@nongnu.org>; Wed, 14 Nov 2018 08:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sfHPBC7vAuEQNH6wRBpfuLpixaimB/gEJ59gZrWcvRs=;
	b=EyEhQNszlqND6jkXqo43cMAbnijELvBHKd44YFqdsZrvO6wqH80fNxAVJELK/0/d04
	2hjHVnH8wEe36sBASfmtkPTZFpcSi9Fqe/KWOWsB0Lfp7/SYd5SmLtEL3vDE4mXBYXFB
	54BBIveAW9ARN0pn2lr6e26A1jkYboCM1ZhI9vMDXLOr1tHhMF0eOW4es+VsrEEmIvNW
	LSt1SxG1qAXGVrEtGC6YnUgMO7GLRLFE37Nm1IfjBRWKgmNns+9kPR3xKpSx2XEdaum6
	LGlZ+zvAZOQezvz6FTvBthjzldea+o9sqPX5g499/uCNeg4AIXxA/79APipfcbxhNb2t
	p6kA==
X-Gm-Message-State: AGRZ1gLGtZzgCMO2oWK+LOIM3B3s4EqGiAy/BWlNFrXQ0gl+/MYbx40N
	Ld6wHtKkkzAqAV6rjWUSxw6I3g==
X-Received: by 2002:a5d:5146:: with SMTP id
	u6-v6mr2514009wrt.299.1542213594361; 
	Wed, 14 Nov 2018 08:39:54 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	s5-v6sm25618671wrq.16.2018.11.14.08.39.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Nov 2018 08:39:53 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20181114132931.22624-1-marcandre.lureau@redhat.com>
	<16b78816-f2cc-a1e5-0d21-906fc2dbaa3d@redhat.com>
	<a2d9a2fd-2c1a-66e3-86ba-17da9f564e79@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c0601dcb-142f-3033-b11f-1b951aaf0e3f@redhat.com>
Date: Wed, 14 Nov 2018 17:39:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <a2d9a2fd-2c1a-66e3-86ba-17da9f564e79@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] vmstate: constify VMStateField
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	dgilbert@redhat.com, Artyom Tarasenko <atar4qemu@gmail.com>,
	quintela@redhat.com, "open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0H+JncCi+Bmr

Hi Thomas,

On 14/11/18 17:29, Thomas Huth wrote:
> On 2018-11-14 16:32, Philippe Mathieu-Daudé wrote:
>>
>> What about enforcing the constness in the typedef?
>>
>> -- >8 --
>> @@ -32 +32 @@ typedef struct VMStateDescription VMStateDescription;
>> -typedef struct VMStateField VMStateField;
>> +typedef const struct VMStateField VMStateField;
>> ---
> 
> Please don't. For rationale, see:
> https://www.kernel.org/doc/html/v4.19/process/coding-style.html#typedefs

Thanks for the pointer, I am interested in understanding why not do 
that. However in the link you pasted I don't see a rational about 
enforcing constness, I understand that since this case doesn't match the 
5 rules, we should use 'struct VMStateField' directly and remove the 
typedef.
