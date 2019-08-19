Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3142590wrs;
        Mon, 19 Aug 2019 14:02:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1fsU+6fFstEzVCBwtPtNWWd9I2mieHPkh3QZueAURQ04Vz82GfEA8UOcoZAMneqGcDRa6
X-Received: by 2002:a17:906:64cc:: with SMTP id p12mr22611678ejn.176.1566248529131;
        Mon, 19 Aug 2019 14:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566248529; cv=none;
        d=google.com; s=arc-20160816;
        b=o2iFT41cLByHC7wUxSiT5cNjsZA8Q9yf7FgwhbleDP2Pqx+HWCBxmhyt6o0iDJF69z
         3EtJF047xp89J85bG9s3WbWv834pNuZq61VASz/98uwPQYsb/cSF3owg1EfNDZiCehm+
         RclPQlrLU2sR4xQI91d5K/WZjztbG9OUHQw9Vo5MAy9ClA1srswyuc6UmZYR6+vwii5t
         1/iCs7xYuN0yaaQqTTJdV1JjhYCD3K9Ufx0ddC5bY74PMNxVPzgrM5xsOuCu0sqV4Ong
         +wLFh9r4iyzz2V9fRxePZQV8xFK532qWE18kyPd7zfH7qjwoJes7+t+ZvGTABF1wSu7/
         uygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
        b=jwlDg/F2Q9E9WdTAMvlvFYWVSiRAiA37aAXc+U20aUhzXuUzc7+C1QOU+IIbvILVOR
         P14UMwVMCRCH2ltC5oGVwBYuK6VFHs4xM8czAS1W+HPvOtlJaTUSQJrOAq29PpwccF2o
         /bdxATekfGUm25facbaZgDdSpHLyaqKMDTN1tkK7B3fX9EKufq0nTLWuv463Sp7bRm/E
         +ifc3n7vu3nd2xcwbD8HCbSUanMcPexY578G/aAyjL/QBSX/y58wLU2vs+sZ/BSGG+eY
         H8zqO1YZunbZ9ZJ4/qFLIPy2tyR6PRuX7QuOBn1ULV1tBlYa4FS/PyesnT75ni/AMlpT
         YjCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FxoL/ygN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m29si9049880edd.46.2019.08.19.14.02.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:02:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FxoL/ygN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzon1-0006S8-S3
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzomS-0006EK-Jm
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzomR-00073F-Bm
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:01:32 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzomR-00072B-3T
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:01:31 -0400
Received: by mail-pf1-x444.google.com with SMTP id w2so1896414pfi.3
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
 b=FxoL/ygNz+Ksftm1RuYm/hG7E+xUwHOeXleAvU5RKlIsyWRQv8RINw3kW0ZJByEwo0
 qguqHCPMGOnOa+JMyt2Xwlv2pqzilmdFTcReSsfN6Ms8DIzBRqW1zByU3jMKV6A8MKUd
 Ey3Co++zv2CtWWhtWKSWRA06PcwxEPwJijUHnQXpmVIriIaWqnF3XwHYCWss8+xa440m
 W+qxDOjbHZpamKwURVa1T4q7BTMqMydWd9i8NzVovYN2blADLG3kJVQBic4LQgyy3vlX
 Z06lyjJsf5W39pmQ8zid0Tq07PX/wgluHJ4U9/nidce7U2v5Uo8AzFvmwrpT/uSsFgmQ
 aH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vGBzrXO7KGpJ/NUWc/Wz8OhRnfw9xF17a3ctMtsK7KU=;
 b=nGjWMbf6lm/hGAuH5ovHpedwYBZZCHLdN+UatmTu44ULJRUWCa1x083FMTNploY5Lq
 etAP+PPLxylhVMI6UAhj7ZaghK6pnC55DolMPrKLW1A1bOXb4h93W6ONVhR5BjOO4R4s
 n8G3QIUztRkve2ECxhApqj75Pk3lKmgqkbnzpIicF/1KrV5EHAfMxbJ4hVYKRoswAfuf
 U75BT7K++lxAS1MVgxQwzOYg4JMNKoclcKPQk6lyIW+bkK2uss4CWeaA5tYwsOL8IWRF
 182lxtOxQlspP2D0Ouo1j4dUveEaOIDjeTPgIdq3W1If3eT+p6CpCbGnwVFCi0KX3s8E
 HTkA==
X-Gm-Message-State: APjAAAU6AAhNUgPCjxe5KR1LnPt+Kz1KyzS6NSr728hZV+GRqde1bHZx
 BXtLnnuUDWYRSAQ5rMEhQzX8xQ==
X-Received: by 2002:a65:6104:: with SMTP id z4mr21186266pgu.27.1566248488612; 
 Mon, 19 Aug 2019 14:01:28 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id c2sm7562265pjs.13.2019.08.19.14.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 14:01:27 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
 <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
 <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b79a173d-a682-21da-6e7f-489ce06c8f7a@linaro.org>
Date: Mon, 19 Aug 2019 14:01:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [qemu-s390x] [PATCH v7 33/42] exec:
 Replace device_endian with MemOp
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, jan.kiszka@web.de, sagark@eecs.berkeley.edu,
 david@redhat.com, green@moxielogic.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, i.mitsyanko@gmail.com, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, dmitry.fleytman@gmail.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, marex@denx.de, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, lersek@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, philmd@redhat.com, jasowang@redhat.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, jcd@tribudubois.net,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/0ICsGt7alk

On 8/19/19 11:29 AM, Paolo Bonzini wrote:
> On 19/08/19 20:28, Paolo Bonzini wrote:
>> On 16/08/19 12:12, Thomas Huth wrote:
>>> This patch is *huge*, more than 800kB. It keeps being stuck in the the
>>> filter of the qemu-s390x list each time you send it. Please:
>>>
>>> 1) Try to break it up in more digestible pieces, e.g. change only one
>>> subsystem at a time (this is also better reviewable by people who are
>>> interested in one area)
>>
>> This is not really possible, since the patch is basically a
>> search-and-replace.  You could perhaps use some magic
>> ("DEVICE_MEMOP_ENDIAN" or something like that) to allow a split, but it
>> would introduce more complication than anything else.
> 
> I'm stupid, at this point of the series it _would_ be possible to split
> the patch by subsystem.  Still not sure it would be actually an advantage.

It might be easier to review if we split by symbol, one rename per patch over
the entire code base.


r~
