Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2645936wrx;
        Mon, 15 Apr 2019 05:59:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/98ygCTf/SL4jVy9q3S02gmhRwvnH8DJHxyHRpbgia13tWeZTrtNn4ND6KPSgf532kBsa
X-Received: by 2002:a5d:6a03:: with SMTP id m3mr13297429wru.88.1555333153809;
        Mon, 15 Apr 2019 05:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555333153; cv=none;
        d=google.com; s=arc-20160816;
        b=H/iX2Nte1e0BgfVFBMZ244kstM8mH0vr7+TCSyl4cPm2XVyY0//Bn9sz6wAIi9PWi3
         R0zifj96bVsaHWpFN/DV0orEmMtsDlXnY1WC+T2/bJmhyPoV2IC2n6kfuipTOGGo5h02
         5KfOPNALEopUsYGLHHD/XsKvVyW+8VWuHjrW+nAAHnMtcJiucrk9/0XDSLUbJKbQWqep
         9Rc6jTOXdV+iMm0DljTlOOE8L7vxgaru19SIPQDHI3G7extcafTYKNhYpkaLE3JW7iZU
         kOQj8608jwf/5WrCc7mreSDIN4ckIAGEnCfroZv5PhHYPi/07aJ6x3s6Pg1wxCEzaD59
         drTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Ie3dcgbZmad4NfdsVQJ6EJmNCEjH+dnCiV4OnLDwi/Y=;
        b=md6/cTW/29WWOBp66A7CziOuq7oFb2I2o1VypzSyzniN5DFfSc37D5d5b+xB2AEsPp
         8Yekc1qIPCKeLfX04fRsm3Wgu/G3hFCv1ci0YfcYopGzLCIqOFZy044QowJynXux6cM7
         LNLuq1tGF2jpo2gSZwhxJmkiCWKda7fs2mTRHdTEddx29gXoS2yQvzIY4cuTliuWuApA
         jCTjaBVQG3uYGnAFd33APj9zWF/Dcxql43bz6zlPUvdZb5ookAlw5MU3VPq4q1JzbQJa
         AS2XdluvbtBU//KUUr9Wzj1rhyVmAJqeJhaWov2LU7HF2qYQROz8MZDqmzkC7rf4MVhM
         FECw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25si10508036wmj.158.2019.04.15.05.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 05:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG1Cb-0002SX-0K
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 08:59:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1BQ-0001wP-Ds
	for qemu-devel@nongnu.org; Mon, 15 Apr 2019 08:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1BJ-0000vl-Vb
	for qemu-devel@nongnu.org; Mon, 15 Apr 2019 08:57:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hG1BF-0000q5-75
	for qemu-devel@nongnu.org; Mon, 15 Apr 2019 08:57:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id w10so21861280wrm.4
	for <qemu-devel@nongnu.org>; Mon, 15 Apr 2019 05:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ie3dcgbZmad4NfdsVQJ6EJmNCEjH+dnCiV4OnLDwi/Y=;
	b=G20Y8TOLvCpWAlCNqF/TdhU63fg4s84+8gJtXRJ5Mw4B8em1vWCOJ/H/eeejU5kUAL
	jBOQSAHdsu1hYqzAjzXcDbts9dUvEYWNRTrsCNGWWgVPlDlH2w+TUzQ6rwjpEs/pOCJn
	Z9qunQ6Oberj2KsPEH6JUD7Vll86sY2CPwxlZkw0uoEDRJoA5r2T+Ls912/IaU9iVz53
	KubFh1X0Tw/EV15PvSYEVPX0oowS60MFJDHxUNOUAoHhZGmRGPKNK3ft8P/o9ICetUOh
	g7B6lCh7+SorN5KiBBSW84VyqoNng5NUo2FZNRTvXblvccS8AxgjZE6NVGNK3lYuYDcL
	N0hA==
X-Gm-Message-State: APjAAAUZ3FpUv40yd8vpykANOW1xevQ4TTTsAsZZXxDCC2C2mcfuixR6
	0BO4/ILnnV/T0+g2Q2bWrfKkwQ==
X-Received: by 2002:adf:9c91:: with SMTP id d17mr45375707wre.285.1555333067934;
	Mon, 15 Apr 2019 05:57:47 -0700 (PDT)
Received: from [10.1.5.6] (206.red-80-28-210.staticip.rima-tde.net.
	[80.28.210.206]) by smtp.gmail.com with ESMTPSA id
	f15sm62114321wru.21.2019.04.15.05.57.46
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 05:57:47 -0700 (PDT)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-3-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <24e41c8f-2d5e-b29a-d957-e3ed26a44291@redhat.com>
Date: Mon, 15 Apr 2019 14:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415070307.13668-3-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v2 2/4] i386,
 acpi: remove mcfg_ prefix in AcpiMcfgInfo members
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhaosl@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TRGtH46s2NIk

On 4/15/19 9:03 AM, Wei Yang wrote:
> This is obvious the member in AcpiMcfgInfo describe MCFG's property.
> 
> Remove the mcfg_ prefix.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/i386/acpi-build.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index d009176072..f0d27bffd6 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -87,8 +87,8 @@
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
>  typedef struct AcpiMcfgInfo {
> -    uint64_t mcfg_base;
> -    uint32_t mcfg_size;
> +    uint64_t base;
> +    uint32_t size;
>  } AcpiMcfgInfo;
>  
>  typedef struct AcpiPmInfo {
> @@ -2404,11 +2404,11 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>      int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
>  
>      mcfg = acpi_data_push(table_data, len);
> -    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
> +    mcfg->allocation[0].address = cpu_to_le64(info->base);
>      /* Only a single allocation so no need to play with segments */
>      mcfg->allocation[0].pci_segment = cpu_to_le16(0);
>      mcfg->allocation[0].start_bus_number = 0;
> -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
> +    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
>  
>      build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
> @@ -2577,15 +2577,15 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      if (!o) {
>          return false;
>      }
> -    mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
> +    mcfg->base = qnum_get_uint(qobject_to(QNum, o));
>      qobject_unref(o);
> -    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> +    if (mcfg->base == PCIE_BASE_ADDR_UNMAPPED) {
>          return false;
>      }
>  
>      o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
>      assert(o);
> -    mcfg->mcfg_size = qnum_get_uint(qobject_to(QNum, o));
> +    mcfg->size = qnum_get_uint(qobject_to(QNum, o));
>      qobject_unref(o);
>      return true;
>  }
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
