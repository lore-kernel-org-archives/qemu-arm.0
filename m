Received: by 10.28.173.206 with SMTP id w197csp4181510wme;
        Tue, 9 Jan 2018 13:54:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBosi+HxJ/LLt6qYB2MsPW6ig9KCoiBjDV/xTdRSd5z5IL/860RQpwcVY1ogWRCoFHLGxjJSS
X-Received: by 10.129.92.3 with SMTP id q3mr14506813ywb.374.1515534894049;
        Tue, 09 Jan 2018 13:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515534894; cv=none;
        d=google.com; s=arc-20160816;
        b=yfHF+3PVJbca1gcKQ6z0q9BgbKQfUvSAWukS5JeRYnZaeZFDThmI0F1Tnu4pjtgeSQ
         aY1/3YsMRIMkny4dAwb/LdZ88wum92JjbFfk5WEySdYpjKwOLkFYPrrG09VLdN45+3YI
         2gPLz9xKU83rIr0BEfnf/96DyMFEAs9Q//PwrR7oCm/VkYauoFsulvRarU4HZQarnU7t
         9WfINC3ZRk+nblk+greEvTmAlm0qpJzHzLVjt5f/bh9oOGvFfQp+hMveX2Z9g0FhjjTe
         /as8f+v78CMoUnqjYwRVG0IuIvaxzSCMJNm+1G/FWLrMqQaD0G1qGBWfWnw0Rvi9IWmM
         6SBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=SclyfAbprxAaCX/ZvDpGsCktXAMR/Id63nnzk0PNriI=;
        b=WimvM6GrXU+/tNB71cNcUdIKRIlJ7u9xrbVV/1/sbaaiau056yAcKBQZ5kOgMaustN
         NvS28hM3pvJjAtD5ewoSsXJvgv4dB2gMpiIZa0KsRH4kfZvktTGCHkHiwRT7H6IHjoB1
         5fLs47GrnLfzrwFcKn2V4zr109EMzccif+OWm5Xm0L9BX6jdABzzSNCxJzTrBKX2maaO
         24aANfd6t/3MtxBcXA6GsGnywlCFxzh72YqCturciHgEsZWONciAFDdq8duJvbTb7KeG
         78hW2ziXcsxYQ9LLXeryCDp5/4MtoKuBy+KrMk3u9wLtD15YZz6NJ3lYIfGoUgVy59wV
         4/uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V0F7c5Km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si3153873ybm.616.2018.01.09.13.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 13:54:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V0F7c5Km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZ1rB-0004U1-Fq
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 16:54:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1qy-0004S7-Qr
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 16:54:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1qy-0007QG-3K
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 16:54:40 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:41429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eZ1qv-0007Ld-Un; Tue, 09 Jan 2018 16:54:38 -0500
Received: by mail-wm0-x241.google.com with SMTP id g75so23248219wme.0;
	Tue, 09 Jan 2018 13:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SclyfAbprxAaCX/ZvDpGsCktXAMR/Id63nnzk0PNriI=;
	b=V0F7c5KmazimwqM7LMJXYbXrLzuHwMxBLqfBlwcAxrILkwZkeArIlfx5BY0tCC5JdY
	V3Tyy/oA0iPx0gv7gpc9+HEyuSmDp61ReCcFVxTrTQGnDyO4VYSkdYr/17IdAcHmDDOj
	EJAER0XOjIoXx0Qg+YzLEslAcUXr8GllA+UOdEIFDD+A81tNTmuxsl+rvoDKsaWgJCFr
	YprJy9knAty6L7s9fT4OyciYUHjaniJvZ8sM0wGDlAPv2oyqngANPheDkWMsChFLJtNq
	fbtMxPAtAfU0qmOMn/zgAO7pQRfupmkrtaheh0FzfhKnrlmGy06gTLjahuADC4uqa6ey
	AXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=SclyfAbprxAaCX/ZvDpGsCktXAMR/Id63nnzk0PNriI=;
	b=qWcZv0ePj9LVeC/TCe4wYV9ACwC6G/4eEl+8NDFsDCsY77U0mPLuMhcnGHCmoc1T4V
	wph/5V4RdvTr4VjFcgYvgpfItRd8hgQlIofGK9zpEVm5W6gn3PWzMa6AXoHSqu15H9N9
	ySo7DHrid2ovoWvJJesJEEhoWunnI/u6bzFlmZNxCgO5i63AsMqk4suvZxrtI48fgBmp
	tceRfOQSqyvi4NTYLaKDjTmom93OBcqAGu2yGQGVhkUsF5x9ZX8zMwVB6yYR0Uceh0Uf
	RF58DzAnrk0dRK+kShT55X741o/0wX03HssL8gqgWv90ePiV8EAeWBwLEs2ncvKa+ZXm
	vx3Q==
X-Gm-Message-State: AKGB3mI1m+RUkevA+Ipk85aaiu+DUmFkcz7bglY7Mz5TN/t4G1HjNERk
	CHFgcs5FApvTKrRrmlstC9HyonRhQUSggumhULA=
X-Received: by 10.28.69.8 with SMTP id s8mr11661708wma.25.1515534876861; Tue,
	09 Jan 2018 13:54:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 13:54:05 -0800 (PST)
In-Reply-To: <20180108154303.6522-10-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-10-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 9 Jan 2018 13:54:05 -0800
X-Google-Sender-Auth: z10otuGzgvhtHcXQHal3KKniGhQ
Message-ID: <CAKmqyKPcQiWQrrjACBNFvZPc2w6vmUU7dxvCoirAU3jY_hkk9Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 09/31] sdhci: add a common
 class
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7sTfh8QJN6KW

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> so this class can be inherited.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  include/hw/sd/sdhci.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 4a9c3e9175..a80b7c0424 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -124,4 +124,16 @@ typedef struct SDHCIState {
>  #define SYSBUS_SDHCI(obj)                               \
>       OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
>
> +typedef struct {
> +    /*< private >*/
> +    BusClass parent_class;
> +    /*< public >*/
> +    DeviceRealize parent_realize;
> +} SDHCICommonClass;
> +
> +#define SYSBUS_SDHCI_COMMON_CLASS(klass) \
> +        OBJECT_CLASS_CHECK(SDHCICommonClass, (klass), TYPE_SYSBUS_SDHCI)
> +#define SYSBUS_SDHCI_COMMON_GET_CLASS(obj) \
> +        OBJECT_GET_CLASS(SDHCICommonClass, (obj), TYPE_SYSBUS_SDHCI)
> +
>  #endif /* SDHCI_H */
> --
> 2.15.1
>
>
