Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp697630wrx;
        Thu, 18 Apr 2019 07:21:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgkmxSMnPHxfrJEmMhA8FquT32Z+0tzxQKcHE5ajBCgghoYC8UQU0FYiArcKguWByZ+Vw4
X-Received: by 2002:a1c:7e55:: with SMTP id z82mr3360432wmc.11.1555597289500;
        Thu, 18 Apr 2019 07:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555597289; cv=none;
        d=google.com; s=arc-20160816;
        b=C7r6B95eDSEckzqP8MTK89F22fNNMHjekcKSjpmnamMvV4vzMtw3sy2BbFLSCR3FBv
         5QuR5VVS6CzgDQdshJKrNxJdUJzco+/+HPR70Ls7c+1HStieGmlUUPtSPAZSCg0BRAQb
         0/1S4PEBb3GH/S7h9qCD8NeXsyVQx4UI8ghP+nvkl6d0+Xdsi4Am3RLy9U2tC5s5sJoT
         RTUz0Q406X1ktAObj/e52dELyHYKJmUPgs9yixGxvOULbWdeqsq86JvkVRtFYO0MccHN
         2OZUftRutuGW9JXnZmXlFy5xblMXoMpCny4Jye4SXX6lRGJg6/Sx4HGBKHsckScZ7Utr
         Lsew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=4t/tUbXeb0HNo/GKit+uYhjPkXxvM3ccBoXJFKT8Cm0=;
        b=AfHtCY2IBDxz59MWgtdB59jiUhDdxskbbsJ5cNPzZjfgaXAYyGgvuTuXzHIMBDlx5w
         tGFVGwzO6Nb2nbttQaPzAntzlcnWsOovjNhhWRPGQnXQba8nh2Ox5lt3QygbuyKhSPVf
         FXKTWfXZXqUCnkklo6KvRx5KdEQYO2RuDpaciMzoF8GyBNPer34grdth7WiOJudPPTw6
         Am/UUPGQUtZSoQb1fmCPl8EapZP+f3Wj4pjSup+Lye/BgbhKCVuug3VvxRtBdbhQUjUU
         NucS9tYj2VufEX3nz/vIIZhPVDUQ7xRno5xMfqZYN4Q4MQpWc18L/dpmktpxEu6hsU5A
         FveQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t9p+yXED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si1782130wrd.165.2019.04.18.07.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 07:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t9p+yXED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hH7uq-0000Wc-FP
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 10:21:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hH7uW-0000T4-I5
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 10:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hH7uU-00024m-Kt
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 10:21:08 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:33733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1hH7uR-0001yJ-Dk; Thu, 18 Apr 2019 10:21:03 -0400
Received: by mail-ed1-x544.google.com with SMTP id d55so1980174ede.0;
	Thu, 18 Apr 2019 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4t/tUbXeb0HNo/GKit+uYhjPkXxvM3ccBoXJFKT8Cm0=;
	b=t9p+yXEDLELaxdtqC/8l59Bxmjed0qB00eYjHQQTYhZlzLsjKBuGhTz3tukxkdA4Tf
	1GCO//rUATlA/EqpeQOcicuoDpKnntmSMCg98F1yv/6w+NsjctcbWi0hOMDmuJI7qJVZ
	aypmD0c3FfGvY63LMvxLPulCnukhRlswRTTe60SYcdTnt7nsfCHEMbPaBWMXMMcyFUI+
	Dc2CwUELr8yEAiDU9zrwOkEFx6QwwjkMBmPdVZ650ABsUbZUGt7hF/tGfkjz9BnK4KC7
	grDdv39Hv8Tsbf8E2T6FxWGm2MiYOJEUDl2I+6f2xTAr2Bblxcl42fRjl1iQn0g1oR1b
	MI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4t/tUbXeb0HNo/GKit+uYhjPkXxvM3ccBoXJFKT8Cm0=;
	b=k+LrlKF3gYgo+XIMhncEczm5j+zsBNDxh1VFzJWziZJHuvLoJXymIBoEGOwn/gECBg
	H+woiXj69qM0oDWLeK0xp03B60Mdogn2SwdEfntc16D9GY3nw+ij26HMjIABM9ipE3vK
	qLHUt5YmS4uGe6PJ4hHZzx2cuzt8iFRmUaFNrflrmOtW1wVDSqpWYMQOM6dA9z5w4Ypv
	UYJf96qmZmMjJpvyPt+/+7CkvZA1W7YfP2zyY/gYkGz8Twmi1TlyFy6xbc8vIUHwv8v9
	D5ITIcqaVqb2XqK/WtIF5sDkYuv1XjVjghjay9QzOPdlIKTJ2sBCnB53ubTBacrEdB3k
	Ijog==
X-Gm-Message-State: APjAAAXnjiA9fc/WemxP0gyNqntxJwB9TsJwTelrtbBJZfx+0Z2qbcFO
	77w7fzoQ117zNly6ZK6ri3g=
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr52110173ejf.200.1555597260140; 
	Thu, 18 Apr 2019 07:21:00 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id r29sm547358eda.37.2019.04.18.07.20.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 07:20:59 -0700 (PDT)
Date: Thu, 18 Apr 2019 14:20:58 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190418142058.qvicrirxfghfosiu@master>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
	<20190417014038.26018-7-richardw.yang@linux.intel.com>
	<20190418130241.635b2e97@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418130241.635b2e97@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/6] acpi: pci: use
 build_append_foo() API to construct MCFG
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6myxj/tjfM7Y

On Thu, Apr 18, 2019 at 01:02:41PM +0200, Igor Mammedov wrote:
>On Wed, 17 Apr 2019 09:40:38 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> build_append_foo() API doesn't need explicit endianness conversions
>> which eliminates a source of errors and it makes build_mcfg() look like
>> declarative definition of MCFG table in ACPI spec, which makes it easy
>> to review.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>Thanks for nice cleanup!

Glad you like it. :-)

>
>with comment fixed up:
>Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
>> ---
>>  hw/acpi/pci.c               | 30 ++++++++++++++++++------------
>>  include/hw/acpi/acpi-defs.h | 18 ------------------
>>  2 files changed, 18 insertions(+), 30 deletions(-)
>> 
>> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
>> index fa0fa30bb9..05050fa087 100644
>> --- a/hw/acpi/pci.c
>> +++ b/hw/acpi/pci.c
>> @@ -30,17 +30,23 @@
>>  
>>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>>  {
>> -    AcpiTableMcfg *mcfg;
>> -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
>> -
>> -    mcfg = acpi_data_push(table_data, len);
>> -    mcfg->allocation[0].address = cpu_to_le64(info->base);
>> -
>> -    /* Only a single allocation so no need to play with segments */
>> -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>> -    mcfg->allocation[0].start_bus_number = 0;
>> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>> -
>> -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>> +    int mcfg_start = table_data->len;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    /* PCI fw r3.0 MCFG table. */
>It would be better to put spec name as is here so simple search
>could immediately point to it.
>
>like: PCI Firmware Specification, Revision 3.0
>      4.1.2 MCFG Table Description
>

Sure, will change to this.

-- 
Wei Yang
Help you, Help me
