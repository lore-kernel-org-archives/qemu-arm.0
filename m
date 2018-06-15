Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp846853wrq;
        Fri, 15 Jun 2018 06:23:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLqNwCAtNaqzdB1lcXG6CgRVmNNupwdBk68c9fk03kKYeMsFbl4irLsT8QdtKF3FcJMgv7v
X-Received: by 2002:a0c:ae0a:: with SMTP id y10-v6mr1337136qvc.157.1529068991852;
        Fri, 15 Jun 2018 06:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529068991; cv=none;
        d=google.com; s=arc-20160816;
        b=UqSQAtZSMhIgIqsNZTEU4T4748EylrTYSnX4JsFq93WC1jLM9nneMYmtyP/DrPG+bt
         DyN73/DcyfWxNUUKblbSKkgMP0/GxxszfPjBhMnhpeHl1iXh+vP8efn5mEbTfUFZoJzY
         xQ+VDqiQRwS5kLVMI4Jp3V310FeDkMOpxuoButGfTxsocZxwA1AIf8lHpD2K0a7ARHnt
         oGVthXS/v976Ty527RvjMJbShlU6zNnx/xaCmEVKzg72c1P7ow9zbtjzi8UbXtA3Jx2n
         kNfh8EoaFlAKAfZTID4/wdugQljBdXgSRALgE5vULhQRgByKb+EJfaZdxnEjigutcDOe
         krjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=IwCann3dthMCbWQb8GZwUG55n4+F7sG3dC8QQe94ymY=;
        b=dC7FyFX/UwAGi2OngmJHXI5R3ZYCB4LoRfFA8PqSRr2kY6sJX5IlBuJWK6vxppffnY
         R+Pr+xau0K3/FO8B0A9IP6FhWlmBh8X0391y8ec0AH588nIIMzSkVlU+tg/juXHJ/MFI
         pRQl9Tr99jRNz70SUOfH0YPD+tk/wtnHPD6gb9povhWX1n4D8OCVpEkite029PoiAUGc
         uBAOXG+YxtzRHz5Bv/dqwysK0igFoQ4j9XPmL8oFIMr7OsdfCAed/u51xI3qL55P5Cwu
         5JAsCnZdfBXXPC/cQ4koP5KidgvYywPSz7S2b1Pp5KFQamcILopqZK+h/ZBOZk+8QdWH
         IoHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id 9-v6si7243778qtp.121.2018.06.15.06.23.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jun 2018 06:23:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51BA6402312B;
	Fri, 15 Jun 2018 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com [10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D79FC2024CA1;
	Fri, 15 Jun 2018 13:23:09 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 05/13] hw/misc/tz-mpc.c: Implement the Arm
 TrustZone Memory Protection Controller
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-6-peter.maydell@linaro.org>
 <e2f81a60-6b05-1240-ab18-69d46a29185e@redhat.com>
 <CAFEAcA-kmhb4igH2gihSsOe4JFP1u8yienOBDqWvCvqjexftFg@mail.gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <680af824-0d38-d690-95b8-e64949820e39@redhat.com>
Date: Fri, 15 Jun 2018 15:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-kmhb4igH2gihSsOe4JFP1u8yienOBDqWvCvqjexftFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 15 Jun 2018 13:23:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Fri, 15 Jun 2018 13:23:11 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: Lz45gViEzmvD

Hi Peter,

On 06/15/2018 10:53 AM, Peter Maydell wrote:
> On 15 June 2018 at 08:10, Auger Eric <eric.auger@redhat.com> wrote:
>> after reading 8/13, I have a doubt here about the ret.perm value that
>> stays IOMMU_RW independently on the translation success. Usually if the
>> translation failn perm is set to IOMMU_NONE. In your case you also play
>> with the output address space which switches to the blocked one in case
>> of failure and you handle access failure through that means. So maybe
>> the end result is the same but I am not sure.
> 
> The end result is different, which is why we have to return RW here.
> If we return NONE we are telling the caller that this will be
> a memory transaction failure, so the CPU emulation will generate
> a bus-error kind of exception. By returning RW we tell the caller
> that it should make transactions for this address. We can then
> handle them in the MPC with the correct behaviour for a blocked
> access (generating an interrupt, and configurably either completing
> the access as RAZ/WI or returning MEMTX_ERROR to cause a busfault.)

OK thank you for the explanation

Eric
> 
> thanks
> -- PMM
> 
