Received: by 10.25.208.211 with SMTP id h202csp750825lfg;
        Thu, 18 Feb 2016 10:16:16 -0800 (PST)
X-Received: by 10.31.0.215 with SMTP id 206mr7605295vka.22.1455819376043;
        Thu, 18 Feb 2016 10:16:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s131si5853799vke.181.2016.02.18.10.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 10:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWT7f-000121-EB
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 13:16:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aWT7c-00011D-2o
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 13:16:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aWT7Y-0002F8-Ss
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 13:16:12 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:37993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aWT7Y-0002EW-L8
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 13:16:08 -0500
Received: by mail-wm0-x233.google.com with SMTP id a4so37815061wme.1
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=DoKd6SFOyQ1rfnOGeO3ZUwYp0CfZNTMhGngmqLdzvTU=;
	b=SOA+Ne3mU24XzJf2kpGHV1yI5W5tTGsHzNFFq9z+LzmY+hj5hLKn8CXLGAJ9DFXFmK
	oU4pXXmWiqKjbQJUE8lTCGUlJG+iljlTcaEdgO/q6wl9hQ7Kb/lObYJ5mVR6rjnVgs4s
	ZwiCbNhKGPgHBtfoGMFxpBAinqKp5DLBVjZLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DoKd6SFOyQ1rfnOGeO3ZUwYp0CfZNTMhGngmqLdzvTU=;
	b=lguH8Gb7c9hVAzXoVFqsK5yV9BeUAwAFrRafB5PXuKa5G0Pl+PmEi8c/3F8v6DKgU/
	0r7sPGvNToDPR5KU3rvHmjB29g2gyEtsSI13r0yPmifl0atQyT3YIXMoD6gEcbESED5D
	IDJu3MA+pTALNFScMAWMpAdiOas9hDZ/VAaa/3PKBZA2LlXq7wZzji+9aoFbAv39CHd5
	7C/3OIID2D2dycMLbfbnlVv4IBm+UYjoo30pkseDJgpaRY0elC+PDBDqpWFsHWLcG36B
	W2uT/e5cwahrlWv161UogvKCAZuuNm6F1EKP+R3vyg/Xa/DMtSqB4DEd9TuTZoaK9e38
	8C8Q==
X-Gm-Message-State: AG10YOTrfecYvF6UincCGG90JUvNg8eJ0rfArKCx17XKyCDNbPBXXc/+HuXhyLA1hTrcEZxx
X-Received: by 10.28.12.80 with SMTP id 77mr4774340wmm.19.1455819368006;
	Thu, 18 Feb 2016 10:16:08 -0800 (PST)
Received: from [192.168.2.25] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	74sm4139027wmn.17.2016.02.18.10.16.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 10:16:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
	<1454086429-4373-4-git-send-email-eric.auger@linaro.org>
	<CAFEAcA_ZQu7Lecf4UTG+br9yfVr64m_51CtHqGry0K-DnQO+ZA@mail.gmail.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56C60A49.3000800@linaro.org>
Date: Thu, 18 Feb 2016 19:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZQu7Lecf4UTG+br9yfVr64m_51CtHqGry0K-DnQO+ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: eric.auger@st.com, Pranav Sawargaonkar <pranav.sawargaonkar@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC v2 3/8] Generic PCIe host bridge INTx
 determination for INTx routing
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bHP/kBlYtEQ8

Hi Peter,
On 02/16/2016 07:14 PM, Peter Maydell wrote:
> On 29 January 2016 at 16:53, Eric Auger <eric.auger@linaro.org> wrote:
>> This patch stores information about assigned legacy interrupt numbers in
>> GPEX host structure.
>> This is used during GPEX INTx number determination from a pin during
>> INTx routing.
>>
>> Signed-off-by: Pranavkumar Sawargaonkar <address@hidden>
>> Signed-off-by: Tushar Jagad <address@hidden>
>> ---
>>  hw/arm/virt.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 15658f4..3839c68 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -826,6 +826,7 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>>      char *nodename;
>>      int i;
>>      PCIHostState *pci;
>> +    GPEXHost *s;
>>
>>      dev = qdev_create(NULL, TYPE_GPEX_HOST);
>>      qdev_init_nofail(dev);
>> @@ -861,8 +862,11 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>>      /* Map IO port space */
>>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
>>
>> +    s = GPEX_HOST(dev);
>> +
>>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
>> +        s->irq_num[i] = irq + i;
>>      }
> 
> I don't think that the board code should be prodding stuff in the GPEXHost
> struct like this -- device structs are supposed to be private to the
> device implementation. If you need the information in the device then
> you need to come up with a better API for this.

Sure, Thanks

Eric
> 
> thanks
> -- PMM
> 

