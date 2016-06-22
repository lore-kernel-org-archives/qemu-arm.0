Received: by 10.25.21.96 with SMTP id l93csp2316760lfi;
        Tue, 21 Jun 2016 23:58:26 -0700 (PDT)
X-Received: by 10.55.18.194 with SMTP id 63mr2146148qks.199.1466578704228;
        Tue, 21 Jun 2016 23:58:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b68si3695887qkd.282.2016.06.21.23.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 23:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFc7D-00006A-K9
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 02:58:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bFc4M-0004o3-OL
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 02:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bFc4K-0006ct-Pp
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 02:55:25 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bFc4H-0006bx-B4; Wed, 22 Jun 2016 02:55:21 -0400
Received: by mail-oi0-x242.google.com with SMTP id w141so1792203oia.0;
	Tue, 21 Jun 2016 23:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Pq8wOOqUdU0xYhBQdIg9H035SMRkNjs5Kt590FJunU=;
	b=IYENzGwJrNic9vq/5RkzkFlAOl+3I9+LO7UDyAKsPPcV2EQYZ8z8ekTiz7i0UIM8g/
	2fh33hja8ooBCVJbMd2+OFjtQyzWUUBdvNs+2kO40ebqTI02+rKLybUmUxm1Jy/os3am
	7u40CROpQmJlCidpV1zCzxiOxdtALnfKVupokUAJy7wyDGMMkZCtonArToCD7ETWqv99
	fBGkx3HDLiGNJAZ6YTXzlSglsPY4zKOM4PQktGjeeq1/DWO49/HvMCmPr56x8sMEkYR5
	aM1ubz94m7qMXQ3j1cKwc9Tmh5oGAAG/IV7cQnfyhy2VnkVNSuYwpZCvoDdq0HBcGt/4
	S0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Pq8wOOqUdU0xYhBQdIg9H035SMRkNjs5Kt590FJunU=;
	b=LioQRDPzyUvfY2F0wbKn1l6nq1I9TtEGrqUPbN+iyOKvqdP9NFLx4pV1MYtP4kovcs
	716L1METfEn+Tv6tU35zppu3TSnqJPuOJlc6vwIeQvXOjrjn7E0TGf6NsZxY9MC7i6N9
	JtUChKU6pTZhyqjzN71fxs0Wx8jG2rG74/b/5k1muYlboYA3h2dXdM7VejVR8lPDxTv3
	MfUhTuzCnRVMp62A2HlsN6osbOrew8vcGErx1TlqF5d4QXR4VQhaHOxvq5wQjMNXF7gF
	DzJLPOV4IFUM0qcHwBF2VPLWv7kx1akMa1yKZX7L64iXMGL4jzwCqiaKUtcjF6SCVsCJ
	FqrA==
X-Gm-Message-State: ALyK8tIOAVPKKP0kwiuIdX0ImEv0fncfx2M482k7IMEkid5Ayd0Vx4zDe326bROI1jR7vZneL18AvzAONxy6EA==
X-Received: by 10.202.205.84 with SMTP id d81mr746394oig.171.1466578519482;
	Tue, 21 Jun 2016 23:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.201 with HTTP; Tue, 21 Jun 2016 23:55:19 -0700 (PDT)
In-Reply-To: <BY1PR0701MB169163D3032F7EF4FB8FD000F22C0@BY1PR0701MB1691.namprd07.prod.outlook.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-3-git-send-email-peter.maydell@linaro.org>
	<BY1PR0701MB169163D3032F7EF4FB8FD000F22C0@BY1PR0701MB1691.namprd07.prod.outlook.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 22 Jun 2016 12:25:19 +0530
Message-ID: <CALicx6vv9K6wYAO-CSi5YOBUQQRSCV-P0DhqSxfT342APZNnfQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] Fw: [PATCH v2 2/6] exec.c: Remove static allocation
 of sub_section of sub_page
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3LSm9V1EtEw/

> ________________________________
> From: Qemu-arm <qemu-arm-bounces+vijayak=caviumnetworks.com@nongnu.org> on
> behalf of Peter Maydell <peter.maydell@linaro.org>
> Sent: Tuesday, June 21, 2016 10:39 PM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: Paolo Bonzini; Kumar, Vijaya; patches@linaro.org
> Subject: [Qemu-arm] [PATCH v2 2/6] exec.c: Remove static allocation of
> sub_section of sub_page
>
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>
> Allocate sub_section dynamically. Remove dependency
> on TARGET_PAGE_SIZE to make run-time page size detection
> for arm platforms.
>
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> Message-id: 1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com
> [PMM: use flexible array member rather than separate malloc
>  so we don't need an extra pointer deref when using it]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  exec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index 0122ef7..8eaeb0c 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -153,7 +153,7 @@ typedef struct subpage_t {
>      MemoryRegion iomem;
>      AddressSpace *as;
>      hwaddr base;
> -    uint16_t sub_section[TARGET_PAGE_SIZE];
> +    uint16_t sub_section[];
   NIT: Comment that this variable should be last member of this
struct will be helpful.

>  } subpage_t;
>
>  #define PHYS_SECTION_UNASSIGNED 0
> @@ -2270,8 +2270,7 @@ static subpage_t *subpage_init(AddressSpace *as,
> hwaddr base)
>  {
>      subpage_t *mmio;
>
> -    mmio = g_malloc0(sizeof(subpage_t));
> -
> +    mmio = g_malloc0(sizeof(subpage_t) + TARGET_PAGE_SIZE *
> sizeof(uint16_t));

NIT: sizeof(mmio->sub_section[0]) looks better than sizeof(uint16_t)

>      mmio->as = as;
>      mmio->base = base;
>      memory_region_init_io(&mmio->iomem, NULL, &subpage_ops, mmio,
> --
> 1.9.1
>
>
