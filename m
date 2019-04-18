Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp579296wrx;
        Thu, 18 Apr 2019 05:27:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyslwJUoltt+FQtrTJH8nrYzKouQ5FZcaDPINBRUmtV/I+ibwDlAoadFJ5puUmqcH7fiJJ/
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr3118665wmk.9.1555590447140;
        Thu, 18 Apr 2019 05:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555590447; cv=none;
        d=google.com; s=arc-20160816;
        b=0mHRLJRSJVy+1fFc+MYpvYKpWF4oar+Qn/2yMzVmw5UGwyc6uKDEEEmJzNbnfslwYf
         9n6Dn5/xRxEdCObEcgjoXcjYDEgLS6pfH2nVl53Z+KJy/+dkBjFc3RdoXL26PWSRO4y5
         qp1hV5YdHWnZ+geYI7PVd80FfuFMhyZCpJbYiqYreVJrOco87fKvVbIRtWX2NctP1Oyk
         /DmGCpwjv6E78uGqA9FtMTJM+2i1iWAkXosfz4aHtNKLigjE9k5ifSNBA34cqv0+Vw/i
         bc5olTqL+8P+yECRBZM+ktuD+dT8HTDEWrwrkbpK0UpqtNqCa49+H1jKgCvygDbIrQJe
         gPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=z2t0MKFLxw73rw5qRebhf4LAb+imxO7d7A747fpacW8=;
        b=XLyiUZinit2RwVJ1Tfmx/7S5urwD4EWPMuTmn59wAvSnezXtVjTEPxCyGyz2NSGDY6
         NWoEVV8/dqoHMJOJVQ6ia6FmEmRWMjqWiqPcsVz/BIsiS5Tb67+2UqpxzfvRsq+858cb
         0Na3HCK6CwEUVVIXy/3B4Fzn2pSHt2PRk5TnLkQYp9UFBZlQqq9Y7B/PTASw1pqo46UR
         jyNXcHtRe4wDPFUCdV5EZAxtlu7x++YBijLAA5Rx0O0gqzLs59/hW3r+izGE5yCAgoDO
         JhJEL5rVF5A3t8BearmRCYD9VYySTHRvAxLVI/8GvU7VYLxIbxiQG297UAwJ96UFUKjT
         rKqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si1429161wme.56.2019.04.18.05.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 05:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hH68U-0001Ch-8T
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 08:27:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hH68I-0001Bl-Pz
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 08:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hH68H-0007xJ-OP
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 08:27:14 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hH68H-0007wT-Hz
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 08:27:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id h18so2701055wml.1
	for <qemu-arm@nongnu.org>; Thu, 18 Apr 2019 05:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z2t0MKFLxw73rw5qRebhf4LAb+imxO7d7A747fpacW8=;
	b=kFDJXHHhC4Kf3cMTriEA+q3ZsMImN1GRedXl8sokNKH76uF8cdlniz9KV5lkjGqv+Q
	aTE+y/j3sdaMPoiCzxNebKtGS+NnxFdM5IlZW91tExGhK2qhvPNclOAM2L6OFWn8+edV
	3Jdj7GDdzhsH6jGPcLxxz5EcDqLoANJmhsGIDx7ZQtivaJhwWAaEjmujKv/gcLRDG2KQ
	ROUXuZhmaU9lrxUM3qA72Ijau+pRxDw/4V2dVwb6TcT7nk5I4vTZy8PoCRDRTxAPHR7q
	BLkDUWPcgKlHRpxIThDIkjs2x7LgGCVAkfZpGiBT5jJt4EZW2YS5biTtaOPinYpbWU/D
	GRlA==
X-Gm-Message-State: APjAAAUQu26oTrzXJOhcolFBlEagmSZmfUv/BkpuZuA9fBKoEfxk17ax
	sYYnmeHszFnTNEjKyL41iufAjg==
X-Received: by 2002:a05:600c:249:: with SMTP id
	9mr2897884wmj.149.1555590432427; 
	Thu, 18 Apr 2019 05:27:12 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	g19sm1826065wmh.17.2019.04.18.05.27.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Apr 2019 05:27:11 -0700 (PDT)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
	<20190417014038.26018-2-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a96d8f02-4a90-9205-2f7e-82e68e88bca3@redhat.com>
Date: Thu, 18 Apr 2019 14:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417014038.26018-2-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v3 1/6] q35: acpi: do not create dummy MCFG
 table
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wOEiZS5aT4kt

On 4/17/19 3:40 AM, Wei Yang wrote:
> From: Igor Mammedov <imammedo@redhat.com>
> 
> Dummy table (with signature "QEMU") creation came from original SeaBIOS
> codebase. And QEMU would have to keep it around if there were Q35 machine
> that depended on keeping ACPI tables blob constant size. Luckily there
> were no versioned Q35 machine types before commit:
>   (since 2.3) a1666142db acpi-build: make ROMs RAM blocks resizeable
> which obsoleted need to keep ACPI tables blob the same size on source/destination.
> 
> Considering the 1st versioned machine is pc-q35-2.4, the dummy table
> is not really necessary and it's safe to drop it without breaking
> cross version migration in both directions unconditionally.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  hw/i386/acpi-build.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b17d4a711d..d009176072 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2401,7 +2401,6 @@ static void
>  build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>  {
>      AcpiTableMcfg *mcfg;
> -    const char *sig;
>      int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
>  
>      mcfg = acpi_data_push(table_data, len);
> @@ -2411,19 +2410,7 @@ build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
>      mcfg->allocation[0].start_bus_number = 0;
>      mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
>  
> -    /* MCFG is used for ECAM which can be enabled or disabled by guest.
> -     * To avoid table size changes (which create migration issues),
> -     * always create the table even if there are no allocations,
> -     * but set the signature to a reserved value in this case.
> -     * ACPI spec requires OSPMs to ignore such tables.
> -     */
> -    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> -        /* Reserved signature: ignored by OSPM */
> -        sig = "QEMU";
> -    } else {
> -        sig = "MCFG";
> -    }
> -    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
> +    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
>  
>  /*
> @@ -2592,6 +2579,9 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>      }
>      mcfg->mcfg_base = qnum_get_uint(qobject_to(QNum, o));
>      qobject_unref(o);
> +    if (mcfg->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
> +        return false;
> +    }
>  
>      o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_SIZE, NULL);
>      assert(o);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
