Received: by 10.28.71.27 with SMTP id u27csp4779653wma;
        Tue, 27 Feb 2018 04:43:53 -0800 (PST)
X-Google-Smtp-Source: AH8x227y0CbUVqqiCHDIV4qOQSX69yfFv1yAiHV+CqwhOTy+694dNg5MRtt4Dwc2xECApSPWd1Co
X-Received: by 10.13.224.6 with SMTP id j6mr9159366ywe.484.1519735433484;
        Tue, 27 Feb 2018 04:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519735433; cv=none;
        d=google.com; s=arc-20160816;
        b=Ei+YSEcL4k5o9Iduf+0P7696UHoVcKEaiaby0BHZX1LgKOnTDTMeQNWroZ/8/mqlrb
         B6/c7pCuNoXIsa/cLMfvWE9fvcJkgQUu9FhBaRm0ijs6Awfz5IgkhS0xJnTNSR2NbXvT
         Z6evX6Ws+LGNR18VmmknNhPKeKYDqKXQ6++4Q37+CNW1q2kc7FVLkdJbNir/HlgpPO1t
         BsnleaVD40y8x/RCLMslDvu0LSVmVvGdpFc6xBoZftWQstrvcuZqxxq3p4SuCT4czxvW
         5d993kFiDVTnIG4M+WXD1eJRzsiNjvA0DQmVA2FcZpwJPT26EpQOKdu3NHKzdR95ZJ1p
         cT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=K/WXZ0oVfGnHJFByLWD5ER54XC4xCcI0FTmzlVa+WZA=;
        b=hGpOHb0gEG23yCWzTbNspNQ2u5m5vPZlmYnF6zXCR4BsGW+8rDLUzE0YkF4MAVEDK7
         IcGhNvXqM6kQ3lTKyeW8Cbv5PK4OF5q+sby3gHmUIV82LJ0U1W7PPenuRFJS1/qL9mlI
         3k1cV82LahnXM5Bnrli4Ezj4rcXpUEN421kLynmhuIyUsS7sfIyIvYpTT/mCFXPFcvH9
         sdXfAkTqW/l01ooZU/jiChqEqj5gRcOTIQuomW4DKYl/gBcxC3eYS76k2x1fDs/ZM98a
         QruakB1fuWOjOpkNmG5e2mBn3A1Q+B/cs1xyWmYIIGEwRgIGkhAHZkj0hyVgN3c8RnsC
         SVKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si1922092ybg.666.2018.02.27.04.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 04:43:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqebo-0002y5-Va
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 07:43:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqeaZ-00025A-PI
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqeaY-0002Iy-V3
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:42:35 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36436 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqeaY-0002Ie-Pn; Tue, 27 Feb 2018 07:42:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EFD98D6EA;
	Tue, 27 Feb 2018 12:42:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30E042026E04;
	Tue, 27 Feb 2018 12:42:18 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-4-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3540155b-ec90-81c7-1c56-05cf8f6976ba@redhat.com>
Date: Tue, 27 Feb 2018 13:42:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-4-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 27 Feb 2018 12:42:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 27 Feb 2018 12:42:24 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/9] acpi: reuse
 AcpiGenericAddress instead of Acpi20GenericAddress
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zalqi7O2xzDR

Hi Igor,

On 22/02/18 13:42, Igor Mammedov wrote:
> Drop duplicate in form of Acpi20GenericAddress and reuse
> AcpiGenericAddress.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/acpi/acpi-defs.h | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 80c8099..9942bc5 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -40,18 +40,6 @@ enum {
>      ACPI_FADT_F_LOW_POWER_S0_IDLE_CAPABLE,
>  };
>  
> -/*
> - * ACPI 2.0 Generic Address Space definition.
> - */
> -struct Acpi20GenericAddress {
> -    uint8_t  address_space_id;
> -    uint8_t  register_bit_width;
> -    uint8_t  register_bit_offset;
> -    uint8_t  reserved;
> -    uint64_t address;
> -} QEMU_PACKED;
> -typedef struct Acpi20GenericAddress Acpi20GenericAddress;
> -
>  struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
>      uint64_t signature;              /* ACPI signature, contains "RSD PTR " */
>      uint8_t  checksum;               /* To make sum of struct == 0 */
> @@ -167,7 +155,8 @@ struct AcpiGenericAddress {
>      uint8_t space_id;        /* Address space where struct or register exists */
>      uint8_t bit_width;       /* Size in bits of given register */
>      uint8_t bit_offset;      /* Bit offset within the register */
> -    uint8_t access_width;    /* Minimum Access size (ACPI 3.0) */
> +    uint8_t access_width;    /* ACPI 3.0: Minimum Access size (ACPI 3.0),
> +                                ACPI 2.0: Reserved, Table 5-1 */
>      uint64_t address;        /* 64-bit address of struct or register */
>  } QEMU_PACKED;
>  
> @@ -456,7 +445,7 @@ typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
>  struct Acpi20Hpet {
>      ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
>      uint32_t           timer_block_id;
> -    Acpi20GenericAddress addr;
> +    struct AcpiGenericAddress addr;
>      uint8_t            hpet_number;
>      uint16_t           min_tick;
>      uint8_t            page_protect;
> 
