Received: by 10.25.87.130 with SMTP id l124csp134366lfb;
        Mon, 5 Sep 2016 06:56:15 -0700 (PDT)
X-Received: by 10.237.59.212 with SMTP id s20mr38831642qte.126.1473083775520;
        Mon, 05 Sep 2016 06:56:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a28si3418198qkh.98.2016.09.05.06.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 06:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bguNi-0004fC-VV
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 09:56:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bguNe-0004dp-M9
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 09:56:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bguNd-0003r0-Lo
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 09:56:10 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:33697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bguNd-0003qs-Gk
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 09:56:09 -0400
Received: by mail-ua0-x22f.google.com with SMTP id 31so26287362uao.0
	for <qemu-arm@nongnu.org>; Mon, 05 Sep 2016 06:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wacoTcDWw84qi6wTDyHz7/sRqZU7eQu6eKZN6BbIe9w=;
	b=Mf9dJyZYnznczONZlFF/6VRKkNc7jU7oTqhG3IXVQaA2GecZOXNMQbcxI9dc/88Glm
	uVJkewPf6esSC/dZvIsWLeYPRxe4ztvYpthPtnZ8a1GDrvsQchZfcNSGMSPvR0eiV2ts
	nmrrI0i8x2VGVckjKFkpkSaqPY+Okb5LHXpHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wacoTcDWw84qi6wTDyHz7/sRqZU7eQu6eKZN6BbIe9w=;
	b=f1gbl2pw4mt5QeOWM1/CFoTW/LEhGkUFFdGjaV2Hd/7pY4RrAi+7fYR5J0wWAPPnC1
	qNRrlUPC2/r/hb/8Pb9cX5HdTO6zNb8me0HZOW6/A08mTB4LaajF7JSWLEQXoiKCpzGV
	qFNjQhS3Nlkm23USrjXVbWhwCNpU7Rk3dX0NopoJ1F5eDblEn4eoOTCvQeXYtgFnxBMa
	NreCTxCXnEajHB+QFCMCHwUaeWydt3FTKzO/HufF6ENuBYfLaF9yyoR2Kxzn1oHHKoqk
	Ufyo8A1tBGg8Tvzyt+zBIoytuBe0hbSqTovB8/PhlT/WEsrVkf7C7vBQ199l6T4sfSer
	ct/A==
X-Gm-Message-State: AE9vXwOOkYJmmrTBZwfbkpHv/IduvmDAW3YTpMjhTC6Ev/1BC1RjhjQ39hnV2RIPTiCFqpKBwz2oUKNFSNL6U8X8
X-Received: by 10.176.0.120 with SMTP id 111mr9348123uai.17.1473083768986;
	Mon, 05 Sep 2016 06:56:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 06:55:48 -0700 (PDT)
In-Reply-To: <1472852809-23042-1-git-send-email-wei@redhat.com>
References: <1472852809-23042-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 14:55:48 +0100
Message-ID: <CAFEAcA-Mtcx7Kgj7Dcoiw50BG-jyYYA+unWKEnrd6b0sCj62tg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH 1/1] ARM: ACPI: fix the AML ID format for CPU
 devices
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHli9rztiwb1

On 2 September 2016 at 22:46, Wei Huang <wei@redhat.com> wrote:
> Current QEMU will stall guest VM booting under ACPI mode when vcpu count
> is >= 12. Analyzing the booting log, it turns out that DSDT table can't
> be loaded correctly due to "Invalid character(s) in name (0x62303043),
> repaired: [C00*]". This is because existing QEMU uses a lower case AML
> ID for CPU devices (e.g. C000, C001, ..., C00a, C00b). The ACPI code
> inside guest VM detects this lower case character as an invalid character
> (see acpi_ut_valid_acpi_char() in drivers/acpi/acpica/utstring.c file)
> and converts it to "*". This causes duplicated IDs (i.e. "C00a" ==>"C00*"
> and "C00b" ==> "C00*"). So ACPI refuses to load the table.
>
> This patch fixes the problem by changing the format with a upper case
> character. It matches the CPU ID formats used in other parts of QEMU
> code.
>
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 28fc59c..295ec86 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -53,7 +53,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>      uint16_t i;
>
>      for (i = 0; i < smp_cpus; i++) {
> -        Aml *dev = aml_device("C%03x", i);
> +        Aml *dev = aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
>          aml_append(scope, dev);

I see this is the format we use in hw/acpi/cpu.c, but why do we
say "%.03X" rather than "%.3X" ? The two mean the same thing but
one has a pointless extra 0 in the precision-specifier, as far
as I can see...

Anyway, applied to target-arm.next.

thanks
-- PMM
