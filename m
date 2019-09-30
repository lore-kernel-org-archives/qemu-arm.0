Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp7425676wrp;
        Mon, 30 Sep 2019 15:27:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCpcIN5NH2W+ebkntJIHTBrBtrZ+oartlidABum9RGYlF4YiXbwAtkeZmoTgnTi68hd/lY
X-Received: by 2002:a0c:8867:: with SMTP id 36mr11099515qvm.177.1569882465131;
        Mon, 30 Sep 2019 15:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569882465; cv=none;
        d=google.com; s=arc-20160816;
        b=Cg0XNSN66bq9486rJnfNNBhFb7K7tcuGVykKfp0lRk5Ushiub/x8V7ScHfoZerHMbG
         xpcuwHLheFLMTO0QO4SFb+VkGFUgTsWkCcSe4RgUMjAT+RVNuz5YkckHiQgAKj7on1yy
         z4TqQ1Ajp2lCzTo7Afp03P3ySRSYnlb6747fAk+eGnyFS8Rgwgp/Up2k6pGsE9PnMidj
         GKIZejDAlUlAzG5V7eQS1pCZst9ZiQCx1LoJhdQsUCASWc3+eoD9g1XtrmDcAyc/NVlc
         YvgSESIaRUHVsQpwNOTRUz0WQ/GVOYeHFXTvYPpNgSIIwiA1XI9S7icGBMpwaQeLgj7d
         4JIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-filter;
        bh=wkRgj8K3RsPTki756eS0I/Skli8awMywW1dX5h5c1zM=;
        b=s+XPVAj1SHUwgBb0Ldem3yHcvxfQ4IVfEmY1N2G1pg/Z90RowPtLZGeA1ox0SgCqks
         PeDUOiyEtN4rxXCFBMF4MjZrX5R+FegUYVFXG1Vu/AQhJRhIaHqdzMbSCA0riIrFIFCK
         K0uR3BslyUshvjf0yT3BefpViDuRvfLNjMPXNu/Qlc4e7unRqMTK7kkco7FApjF2s4BB
         sKdVnUCGibtAy56A466BJ7FJ51Z9ZBq2j1TsIIPkCQ2EVkbmWdrOyey6IX53RiiaqCk0
         ZMZBWnPJohmLvwigFSSwEKxr0gtfa/TevWuKNvCLJnByQoNaZf3vV9LUHAMxJBa0rrYV
         GzZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n55si13802859qvc.19.2019.09.30.15.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 15:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iF48u-0003Ex-KL
	for alex.bennee@linaro.org; Mon, 30 Sep 2019 18:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iF48m-0003EW-3M
 for qemu-arm@nongnu.org; Mon, 30 Sep 2019 18:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iF48j-0003Dk-Q6
 for qemu-arm@nongnu.org; Mon, 30 Sep 2019 18:27:35 -0400
Received: from linux.microsoft.com ([13.77.154.182]:60084)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>)
 id 1iF48j-0003DO-LE; Mon, 30 Sep 2019 18:27:33 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 17FA82010688;
 Mon, 30 Sep 2019 15:27:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 17FA82010688
Subject: Re: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 qemu-devel@nongnu.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
 <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
 <65b49cb0-c9fb-d966-8dec-1e39d09ab8c7@redhat.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <88878b22-803f-41fc-9df2-2c6eb551b98d@linux.microsoft.com>
Date: Mon, 30 Sep 2019 15:27:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <65b49cb0-c9fb-d966-8dec-1e39d09ab8c7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 13.77.154.182
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8/EJSNB6vQd6

On 9/27/19 2:15 AM, Philippe Mathieu-Daud=C3=A9 wrote:

> Cc'ing Ard too
>>
>> https://salsa.debian.org/debian/atf-allwinner/commit/b6b671c4ac4bd5595=
306863225bb3bece1e6135c
>>
>>
>> Current limitations:
>> * Only cold boot is supported
>> * No build instructions for QEMU_EFI.fd and rootfs-arm64.cpio.gz
>> * No instructions for how to load a BL32 (Secure Payload)
>>
>> So looks like only cold boot is supported (no kexec support)
>> Is this correct?

Just wanted to check again -

Does ATF and QEMU (for ARM64) support cold boot only and does not have=20
support for kexec?

thanks,
  -lakshmi
