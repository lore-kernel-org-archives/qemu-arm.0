Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp900037wrg;
        Fri, 14 Jun 2019 05:34:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoXxr09kU7Z6Gf9uose0Ti0UPIK9B5z4Gio+GXbS0cmeocY6BMsfZI5CoCccYggsMyA/JS
X-Received: by 2002:a0c:8b6f:: with SMTP id d47mr7836068qvc.32.1560515650803;
        Fri, 14 Jun 2019 05:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560515650; cv=none;
        d=google.com; s=arc-20160816;
        b=RDCoafDI4heWMl95f6o/tbtQsTevUIEvE7cro6rYoNkluxPm6GTeRozG81ocHVGtxn
         EgPdhPPZb3hmHLtJr+CCGnNm8eezcwiHkcA6Q3+EgRjtkKk8fUYl5CJGCXTHeFwNgwjf
         1sDeHz+s4IjdEt6D1/MFyQ8J98EF6wCcPMFcend87+iIlGHsATCOXR51WOKDPv6Wd9YZ
         k3DCWLNZQWlbKuytqSzavBpD1W+pgatYnzT0xIYF7wkl1pQULU7t0o4ICHp7AozDp7z9
         PsURFO1r8m/GjA5pBdVQu6kKN4vu3wjAQzR2wfxsdfr8mSxyfW6M6fP76+YHYMfGO80c
         7OpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=fOJOXybyVWH0IOEQeI6XxgSeydz4kVUmZfkpKTZH48U=;
        b=z37srNb6MU1tiOYOeMzQdoPs9Y958vkJYcGwfQRyqNtDZBK4AqlCNFLTjmHU6mhmBk
         INNlQWF4OlS10mZacxU8shuhrDpf0MYYDn/GGgLmlptx2tYJAlCmpx2BKKpMgdrHd6YR
         A+j81SSq+qTNZytmvcK6osgR15J3TCW+2MXraVftEfPzGDmw/lEeGIrN5w0sgQJvcDFC
         jHPcBkOhtxnEJBxDmY51aM2jasreXc2cwPZvK1sbz5qCGLl3ZMYK0fOitzUJ9YbzjO+i
         Bu3A1+S3JJs8Q0oPi03hl7Bh0767uxv1QyaBbU83kiKzm61dZ9Sn4DQ7RX2oVbfFoT1x
         lqOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e62si1518644qtb.187.2019.06.14.05.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 05:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hblPG-0002kS-BQ
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 08:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hblIV-0006MA-K9
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 08:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hblIU-0006RA-Fp
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 08:27:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37459)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hblIU-0006PG-9I
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 08:27:10 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so2342264wrr.4
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 05:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fOJOXybyVWH0IOEQeI6XxgSeydz4kVUmZfkpKTZH48U=;
 b=iYRErxjyA9v9RITjFsHVRb2iC4xGe1XmipQiMart9j/igHX7Ccg2JPo1avh5bw6Guh
 1iFJUszWF2ve53LZNxv2znJjUlRDI1uuYxAlm0LocIk7V2kLwoZ3o3BqGhwV3P3efNZB
 7wcWTQfXNDtcyrKyt5F0K9UvJ5cUycfe/IuTQOy+5lv7vx48cu6jaBuuNQZ/e7RummWN
 kQZHQPmRiRoX8yoAa/BfUYdo9vY0fONjtXxIN+pnr1PcWNwV+3WybQRtMbLlMdkBbh0M
 vgNNpcwfaulCg4L+AoNwfYKbHR8xKkgO3RFhbz8fxh1VePB1YzJp7WMLKGvBs5F8X/fH
 HCxA==
X-Gm-Message-State: APjAAAV93TZPIYAFMm/CPHfeh+rfySHgL47BJhL2R6N7mSU1IhNSaN34
 cCC7XcRtJ6nd/R/qeEYo4zAEoA==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr3710970wrw.254.1560515227604; 
 Fri, 14 Jun 2019 05:27:07 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id d17sm3885264wrx.9.2019.06.14.05.27.06
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:27:07 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Eddie James <eajames@linux.ibm.com>, qemu-arm@nongnu.org
References: <1560286476-23494-1-git-send-email-eajames@linux.ibm.com>
 <dee5afb8-cc31-8963-6a7c-169c77e23d3c@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ec91b789-c2da-4ebf-ca6f-ae8113e4d57f@redhat.com>
Date: Fri, 14 Jun 2019 14:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dee5afb8-cc31-8963-6a7c-169c77e23d3c@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw: misc: Add Aspeed XDMA
 device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fPqp3ODlL7Kb

On 6/14/19 2:10 PM, Cédric Le Goater wrote:
> On 11/06/2019 22:54, Eddie James wrote:
>> The XDMA engine embedded in the Aspeed SOCs performs PCI DMA operations
>> between the SOC (acting as a BMC) and a host processor in a server.
>>
>> The XDMA engine exists on the AST2400, AST2500, and AST2600 SOCs, so
>> enable it for all of those. Add trace events on the important register
>> writes in the XDMA engine.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v1:
>>  - add trace events
>>  - minor cleanup

Thank you for these changes.

>>
>> This patch is based on Cedric's big Aspeed update:
>>     http://patchwork.ozlabs.org/cover/1105343/
> 
> Eddie, 
> 
> I have pushed the patch in my tree and I plan to resend 
> as part of the patchset above.
> 
> Thanks,
> 
> C. 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
