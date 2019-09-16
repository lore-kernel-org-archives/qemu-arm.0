Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4216771wrp;
        Mon, 16 Sep 2019 09:31:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymcclXLsaGwAKFNqqFRDNkEHB1P9RmpyNdB6aaTXisjwOqMHPnJXXOHIVkgIfrunKmwFOi
X-Received: by 2002:a17:906:20c7:: with SMTP id c7mr856655ejc.248.1568651478677;
        Mon, 16 Sep 2019 09:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568651478; cv=none;
        d=google.com; s=arc-20160816;
        b=uTwbj1t0u10KOqaeZrgkibO9hPuxTXg33hCTS0gfo9kzTCmBss3aYWoTgQs40uloSy
         P6ex0Ptj/M5iiM6RIzE7u07qN8GGe+E1LYUZf8ir1AksDPswAnXUjAkJMRZWP9JtNLhO
         neN6RzvIVMLuZGSXFTPmwVJb6aN524cCrdLsg+/kmeB5lGG23dO1CIDVGw8y0jSj729R
         6Za9qkpc0GAC/yW0SFUMVqUFek29poMkxgG3NIAVL0eTyVdfjqfbicmkIdKbwcpcfqKV
         CBlx2ajFPIeSqoajbmc4qjwI8K97C8jzCdIO5eIKlNuzVdGTMLWNW4LikuTQDXbATYJo
         Hk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:from:dkim-filter;
        bh=7FEtcSCw50nz2J+ex2XcrbbDVBd5b1FrErDUpF7zdx4=;
        b=B+ERM1weC87FkiKr5FV7MhZCcJcffNSNnPPCqbztlTM1OnowuNVpddy8RSthpmU5kH
         +n206qie0cOQRAIKsUFbU1fOGUcWGx8Z7vl2xieaoSzUVWP/BnoqxPD1vVoklNdsMsKy
         0dlEsTIcpXEIvaCvgjcBSNabDsRYI5bfC0osQadwT5JI3FieCSDhoJTYKb6B7KeKqNbS
         PNhl6/sqD6XzCXKQq/usx4dOywxpO7TsJ785xtMxclRE/B1nzofXA4XBR4ZNnBjuMy95
         omKrFI1YCKp5Cf6XRoXOynGia1Mxq4sQbFa1XEI1TTEzPZx6qNVqjF04mL71T79cAVzj
         8NLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si21802340edt.403.2019.09.16.09.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 09:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9tuH-0006dg-8J
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 12:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1i9tkd-0005Mh-O7
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 12:21:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1i9tkc-0006QM-MC
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 12:21:19 -0400
Received: from linux.microsoft.com ([13.77.154.182]:39244)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1i9tkc-0006Pz-Fn
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 12:21:18 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id A3C3720B7186
 for <qemu-arm@nongnu.org>; Mon, 16 Sep 2019 09:21:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A3C3720B7186
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: qemu-arm@nongnu.org
Message-ID: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
Date: Mon, 16 Sep 2019 09:21:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 13.77.154.182
Subject: [Qemu-arm] Adding /dev/tpm0 to qemu-system-aarch64
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
X-TUID: OI4GUfC78xqR

Hello,

I am trying to add a TPM device (/dev/tpm0) for qemu-system-aarch64.

I have a TPM simulator implemented as a Trusted Application (TA). The 
device /dev/tee0 interfaces with the above TA.

Have a TPM driver that interfaces with /dev/tpm0 and talks to /dev/tee0 
in the backend.

Am trying to add /dev/tpm0 through qemu-system-aarch64 command line 
arguments like below:

   -device tpm-tis,tpmdev=tpm0

I see the following error:

qemu-system-aarch64: -device tpm-tis,tpmdev=tpm0: 'tpm-tis' is not a 
valid device model name

What is the right way to add an emulated TPM device on qemu-system-aarch64?

For qemu-system-x86_64 I have seen TPM device emulated through socket 
application and added as given below:

   -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
   -tpmdev emulator,id=tpm0,chardev=chrtpm \
   -device tpm-tis,tpmdev=tpm0

https://github.com/qemu/qemu/blob/master/docs/specs/tpm.txt

Thanks,
  -lakshmi
