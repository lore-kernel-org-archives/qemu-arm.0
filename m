Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1425573wme;
        Tue, 22 May 2018 05:23:59 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo5lE94zeRxNriiJwmuPXVS80rYDIcSJlqA/zkfF5n5u07cw6rlM5saS4zYSHLup3llktpZ
X-Received: by 2002:a0c:bd02:: with SMTP id m2-v6mr21893664qvg.123.1526991838980;
        Tue, 22 May 2018 05:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526991838; cv=none;
        d=google.com; s=arc-20160816;
        b=i19nARdF6U567ywgKm+7SW7lCAouWy+5SDeOoSBiXOExYBr8v2vWM79GN3jmDu25pa
         qmwbNFjRHjltTNLo1BuO6VeKA4J3cFiiu3iGdqhiSrU3pEM7M1mEntG+h2XSQemciiCR
         4gKP5UzTLMpgDupDUEWmRa3mO+3LguxD75ODzdq7omaVVSThh93pPJC8c9PB8YAPbrqn
         m/vQw2cJjmvKwLEu6U/Sqn75MV+Cdz4FHK68bsd8ZtdIGDLIjW4/oMAKOWgMADtXxAnT
         7cw1wDU3URjjv6J/HvIGUeO47Qqk9Lixqdp9dSpwLmXeQ7lKZ/+2sllQihbiHeEYBf9w
         z1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=OfDMVQ3gkTYWDV2L7/BJtcpDF5Q8OpwmqalqhLnEMZE=;
        b=XKa/cnL2TVxZjctjvRH9E1bAzRLA6RheKZWE6AbeK6L3i8S24LWo6f/HBgMsFLD2Zb
         Lyl3R+DDuorDFVO5obwkO1gIHtTnkFKvoWzjOENKRWhfkKQdobh19C+PD43lohWx1RwK
         HS8E+LVFuMvNfPaMBRERr9JjisvM5rQecRtpRjQKqBHfCSas3H8sbQioYRBKdFd9YdZt
         4Fbo3/VrpkklEjAhWTzmJpcMz+jas4fsLtKqwyn3kWrichKx2OmFyDFIGP4fvgRCfIkf
         lI4cKkDk3EOCu2jMwWyQd0lWemYuQKW49IiVtKLu+l85J1SNrjQR/raohLcru66+P1K7
         aTsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id x17-v6si1306988qvh.260.2018.05.22.05.23.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 05:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8024A7A7E1;
	Tue, 22 May 2018 12:23:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B6F215CDA7;
	Tue, 22 May 2018 12:23:57 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 18/27] hw/misc/tz-mpc.c: Implement the Arm
 TrustZone Memory Protection Controller
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-19-peter.maydell@linaro.org>
 <5c004b51-6d28-58e8-2674-0df659c51e65@redhat.com>
 <CAFEAcA_NWGczOhpRqRaZfdeeifubEiLqjZXytuYx+vRrv7rPTA@mail.gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <40a90e77-cc48-bfdd-db74-f1938325a644@redhat.com>
Date: Tue, 22 May 2018 14:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NWGczOhpRqRaZfdeeifubEiLqjZXytuYx+vRrv7rPTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 22 May 2018 12:23:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 22 May 2018 12:23:58 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: CwwmYvHIKmPj

Hi Peter,

On 05/22/2018 01:56 PM, Peter Maydell wrote:
> On 22 May 2018 at 12:30, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 05/21/2018 04:03 PM, Peter Maydell wrote:
>>> Implement the Arm TrustZone Memory Protection Controller, which sits
>>> in front of RAM and allows secure software to configure it to either
>>> pass through or reject transactions.
>>>
>>> We implement the MPC as a QEMU IOMMU, which will direct transactions
>>> either through to the devices and memory behind it or to a special
>>> "never works" AddressSpace if they are blocked.
>>>
>>> This initial commit implements the skeleton of the device:
>>>  * it always permits accesses
>>>  * it doesn't implement most of the registers
>>>  * it doesn't implement the interrupt or other behaviour
>>>    for blocked transactions
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> this patch does not seem to apply on master.
> 
> Clash in the MAINTAINERS file? There's a dependency on another
> MAINTAINERS patch, see the Based-on: line in the cover letter.

Ah OK.

Thanks

Eric
> 
> thanks
> -- PMM
> 
