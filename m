Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1158537ejx;
        Fri, 2 Dec 2022 01:54:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7bRCKKjUHaLLZ0oTT1eKA1FYdWQtdi02XdFkgzBOD/ccZOAj+/iWN4Orc0IVOlZd574o2t
X-Received: by 2002:a05:620a:15d4:b0:6fc:a7df:5f41 with SMTP id o20-20020a05620a15d400b006fca7df5f41mr5086011qkm.694.1669974864194;
        Fri, 02 Dec 2022 01:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669974864; cv=none;
        d=google.com; s=arc-20160816;
        b=ZU+A+iMNnzuzqb1BMzW1SIGCBC2MV7/9M3v4d5QQ+zJBRM+LEFI2k3PSSs5Gh23w9i
         CmZaiIjJ2f967q1hIxvtt58hPGlm6npmu6gMihErXzNUKxx0oXruy9WU1lZsNih24dJZ
         cJW0HB9uzHCOK0gsMHu67ktYfnTXnVuuq6GKmLSMejXdrUTY0p1byGOblCAIPFhZmyLd
         biXMObp2jrDg8DPF7G8r7XrIGtndMmaLcQhAe6QYlDtMAtPZrKCpo2ZnyU+wy3AUF5H4
         7G9+BPcyRfk16iCNp8yxArHg7awoRjFUjq6VMaQIklTi6Mk4vhkPXG7CslxfqRUC0dFB
         TGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1N+kd9SOJWC8ZGNBOYwaGBvTv+xiwpis+8gpeicTk+4=;
        b=Rxuiui4HhGeICaddg9rgtCnyGMgmQwe6uY/i23AyiRd1hUXqE1u9zraBGIhNq4n9XJ
         C0v5lLnAjw3/MpFq54KqxF0Nx1lVhTwisZEZjuD47NQ+ToP6J7T2rjOc4j9EvdqLI2iF
         Qbl+BtuFp1LMe02w/mm+i1MQV41m9/IHsSecbwFP46DlnqwiRoX/bniTDMEaBpp/XpQW
         Cpd4Qp+B9g5IUk2sgtOmGx8NnpcKORjJ8gvhzmGWvqP7kfa9zLnZeYdJmTY8FP8e14li
         KshFEWs/mKPOzsiPAK+e1vuRZ64tLna80BelEiuQpm9mpUVELwlNYhJDQZredeyyIOXr
         Kneg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b="uVS8/8gD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az7-20020a05620a170700b006fcab8ce2e8si1718687qkb.711.2022.12.02.01.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Dec 2022 01:54:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b="uVS8/8gD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12k6-0000uz-8D; Fri, 02 Dec 2022 04:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1p12k3-0000sB-A0; Fri, 02 Dec 2022 04:54:00 -0500
Received: from mail.xenproject.org ([104.130.215.37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1p12jv-0004jg-Ai; Fri, 02 Dec 2022 04:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID;
 bh=1N+kd9SOJWC8ZGNBOYwaGBvTv+xiwpis+8gpeicTk+4=; b=uVS8/8gD6r3mZ0stGA9b5DZnD/
 z7U4mIbPp3MFjsrLDVYJDRTSCbjqpUNIvPafEgMfGMsOcKXB4oCJR8DuHz6DOeeIPdz1sPFM5s2Xv
 pJZWmOTefC7EnlQbisWRMtnFITiv1aStN43TSdt6FYXdNsjxk2+3OSMPIoJWAzWFbX78=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p12jo-0006W1-3G; Fri, 02 Dec 2022 09:53:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p12jn-0001QU-T0; Fri, 02 Dec 2022 09:53:44 +0000
Message-ID: <a534bc75-7877-cf02-6493-777dc064e42b@xen.org>
Date: Fri, 2 Dec 2022 09:53:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Content-Language: en-US
To: "Garhwal, Vikram" <vikram.garhwal@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
 <MW3PR12MB44096CC3AD5CD01D6043B0E79F159@MW3PR12MB4409.namprd12.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <MW3PR12MB44096CC3AD5CD01D6043B0E79F159@MW3PR12MB4409.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=julien@xen.org;
 helo=mail.xenproject.org
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lw4exEYcu5/g



On 02/12/2022 03:24, Garhwal, Vikram wrote:
> Hi Julien,

Hi Vikram,

I am having trouble to differentiate your answers from my remark. For 
instance...


> From: Julien Grall <julien@xen.org>
> Date: Sunday, October 16, 2022 at 10:48 AM
> To: Garhwal, Vikram <vikram.garhwal@amd.com>, qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, open list:ARM TCG CPUs <qemu-arm@nongnu.org>, open list:X86 Xen CPUs <xen-devel@lists.xenproject.org>
> Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
> Hi,
> 
> There seem to be some missing patches on xen-devel (including the cover
> letter). Is that expected?
> Not sure what went wrong there. I can see all of these on QEMU-devel. Perhaps xen-devel is not in maintainer’s list for all the xen files?
> 
> 
> On 15/10/2022 06:07, Vikram Garhwal wrote:
>> Add a new machine xenpv which creates a IOREQ server to register/connect with
>> Xen Hypervisor.
> 
> I don't like the name 'xenpv' because it doesn't convey the fact that
> some of the HW may be emulated rather than para-virtualized. In fact one
> may only want to use for emulating devices.
> 
> Potential name would be 'xen-arm' or re-using 'virt' but with
> 'accel=xen' to select a Xen layout.
> 
>>
>> Xen IOREQ connection expect the TARGET_PAGE_SIZE to 4096, and the xenpv machine
>> on ARM will have no CPU definitions. We need to define TARGET_PAGE_SIZE
>> appropriately ourselves.
>>
>> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
>> TPM emulator and connects to swtpm running on host machine via chardev socket
>> and support TPM functionalities for a guest domain.
>>
>> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>>       -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>>       -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>
>> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
>> provides access to TPM functionality over socket, chardev and CUSE interface.
>> Github repo: https://github.com/stefanberger/swtpm
>> Example for starting swtpm on host machine:
>>       mkdir /tmp/vtpm2
>>       swtpm socket --tpmstate dir=/tmp/vtpm2 \
>>       --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> I see patches for QEMU but not Xen. How can this be tested with existing
> Xen? Will libxl ever create QEMU?
> Will send the patch for libxl Xen separately.

... the first two lines are my remarks and the 3rd is your answer. Can 
you configure your e-mail client to do proper quoting?

[...]

>> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
>> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
>> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(busdev, &error_fatal);
>> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> 
> I can't find where GUEST_TPM_BASE is defined. But then the guest memory
> layout is not expected to be stable. With your current approach, it
> means QEMU would need to be rebuilt for every Xen version. Is it what we
> want?
> I cannot think of better way to do this. Either we add the the def here or rebuild it if GUEST_TPM_BASE changes for each xen version.

The alternative would be to specify the address on the QEMU command 
line. The advantage is you could build a system where each guests have 
different layout.

Cheers,

-- 
Julien Grall
