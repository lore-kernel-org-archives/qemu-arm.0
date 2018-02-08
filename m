Received: by 10.28.71.27 with SMTP id u27csp2525436wma;
        Thu, 8 Feb 2018 12:44:02 -0800 (PST)
X-Google-Smtp-Source: AH8x227Uulpto9hq6HfyRTyFF9NOIIAmPaiF//DmyAhjAqKwHCoUKPw31Gr3npuudjQxv+iJ6/8V
X-Received: by 10.129.73.201 with SMTP id w192mr363932ywa.387.1518122642109;
        Thu, 08 Feb 2018 12:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122642; cv=none;
        d=google.com; s=arc-20160816;
        b=jk1HX+EWBdwjigHF0xvZ0cX8mA7mS+lsXCYR1dGHP5rEgOnzunFwiKqJtq/hRz4/iw
         C7tVIlqnGiQP2AznThV9MxptCnEX4JSsO18ajDZ+cUZ8hzaGqq4PaFyIctx9aADDA2Te
         xDmcCWHVBTWdxCLc7bWdcsLt7ExBbC5C2hFqzvP4VTsZOUh68ys+RuPv2unnHYMEOOte
         TuojtWTwXMOlJaLcHHGfWj5PFMfuCRPNHROXQNi3kR4At5X7yavQ0RVt7cfM8qQCEwJQ
         Ak4324bZ94bAW5ONW5G0pev+PQSUN/BcUfwxImiCKfoRsKPmzMd8B6OFPLs8tu0sQ4fo
         aJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ss/cy0X9ScysQDNqHSi5hkD2rG1+/5BQwJtJ7Xqsbd4=;
        b=KeAbFbu6mtX/sbP0DOYDVWuBU3fMtoW8ITb6uC3MLMkiM2hj0m9LL7nrY7jkh0onmt
         GtlmZssXSnS+sYwY9AhXkZzCNK8cRGDnZwe/4JI3Ro0xECWb0l7lgvj2lqckaadHVSin
         lSWP8mZLikX3GtzwJ6zaBWWa0groOwHB0+MISVUl0ducz9VDUXUUK0yKsimG0t70UCIb
         3OIqRLE/bs1biXP9wv46FLrkej1iJnGJoqS0HA3NJdNSSdKqoGwMipyRTG3rglHVBrQn
         JYf+Zp3S8PBqoLR8uWxPlc0N9qmQOyqnLloRD3prD+iL7cAL86KoT94OHr4bDoQLW6T/
         AcWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u7SEtpeS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10si141091ybm.66.2018.02.08.12.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 12:44:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u7SEtpeS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejt33-0007u7-CW
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 15:44:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejsig-0005rl-9c
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 15:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejsif-0006Il-BP
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 15:22:58 -0500
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:37418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejsid-0006Hl-6i; Thu, 08 Feb 2018 15:22:55 -0500
Received: by mail-qt0-x235.google.com with SMTP id s27so7857393qts.4;
	Thu, 08 Feb 2018 12:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ss/cy0X9ScysQDNqHSi5hkD2rG1+/5BQwJtJ7Xqsbd4=;
	b=u7SEtpeS0NJS4BhPY7sAjqTbRtxrN9FkfM+1wyDCXi4MEbY8WSTzq9kvFMDj+X/SUv
	LYZbJ8gdiKReY0FkTskc606SfROsakbSMsnr6r4pB1rzeYqPTBqJI51AvW5LNQKI6luI
	ApsIRDcbCe9p6ff1NIgG7QXWI2wUu+l7WDt/rbpRec78ea0u2MZk5UUeLRSUitYjkqKy
	trMYCdIJByb+zoRtuT+/+VPYC6NN8xGhYdqtiF5Nr9YZaCd+poohV0P+Ln6kihtaJrIU
	S/HDWC63K4UvlmiBbnj4UZ2H+Lc5rA+p9lpzl49KhWkbqR+ArT8YssZ6L2mp8QaoSIvt
	D5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ss/cy0X9ScysQDNqHSi5hkD2rG1+/5BQwJtJ7Xqsbd4=;
	b=MIxhIKTDEDNBxjcdyCZugH7TFvZYqGb3fWCJeQos6DjcoYLzGE5VSPVghzV3BQqfN5
	e+cn0zKlraeQLvahrvCoJk4OI+A4aYvI+2raTj8Ohz2TmM1ADvTECkDWETHgTKJ2aqAA
	ET5mlBBllvG5DdeVJ83izyP3HWA5tZNM1ETCFlMoYIdNhmfu/1Q7qrK3HA3InCRDRR5c
	xkFksmMxjZLKgba6suOUGMDKy3mN+zIHKzvxJEHVNAJsH/WtsB4sp9iZYN5IPjy1mY2X
	1Bod2/ZOzI1PwxRKpLtj9K0wutWdrjI+2rrIbqVpQbPEkRzk+FDtVZaoYmOdK8MDrhLZ
	9eqw==
X-Gm-Message-State: APf1xPDd0JsDGd2qyS6XWPr82vReNwiRIpo83/thKDBEYjNaXo7je9Cp
	4niNalb0zKWcu8tRdpvCeGT4ZwrWFbiOvOg2zWM=
X-Received: by 10.237.52.228 with SMTP id x91mr710073qtd.112.1518121374340;
	Thu, 08 Feb 2018 12:22:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Thu, 8 Feb 2018 12:22:53 -0800 (PST)
In-Reply-To: <20180208221121-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-11-andrew.smirnov@gmail.com>
	<20180208194226-mutt-send-email-mst@kernel.org>
	<CAHQ1cqGZHie0sYudPGr-15LOEjMRT05=0+tsViKfCJBnN96Nag@mail.gmail.com>
	<20180208221121-mutt-send-email-mst@kernel.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 8 Feb 2018 12:22:53 -0800
Message-ID: <CAHQ1cqHGfTYyKuMEDGPWnHBbWYV2sMrqfHU6oJV3NQSv0Xi0Qg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-devel] [PATCH v5 10/14] pci: Add support for Designware
 IP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jS2Wg3Ovtq33

On Thu, Feb 8, 2018 at 12:11 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Thu, Feb 08, 2018 at 12:03:04PM -0800, Andrey Smirnov wrote:
>> >> +#define PCIE_PORT_LINK_CONTROL          0x710
>> >> +
>> >> +#define PCIE_PHY_DEBUG_R1               0x72C
>> >> +#define PCIE_PHY_DEBUG_R1_XMLH_LINK_UP  BIT(4)
>> >> +
>> >> +#define PCIE_LINK_WIDTH_SPEED_CONTROL   0x80C
>> >> +#define PORT_LOGIC_SPEED_CHANGE         (0x1 << 17)
>> >> +
>> >> +#define PCIE_MSI_ADDR_LO                0x820
>> >> +#define PCIE_MSI_ADDR_HI                0x824
>> >> +#define PCIE_MSI_INTR0_ENABLE           0x828
>> >> +#define PCIE_MSI_INTR0_MASK             0x82C
>> >> +#define PCIE_MSI_INTR0_STATUS           0x830
>> >> +
>> >> +#define PCIE_ATU_VIEWPORT               0x900
>> >> +#define PCIE_ATU_REGION_INBOUND         (0x1 << 31)
>> >> +#define PCIE_ATU_REGION_OUTBOUND        (0x0 << 31)
>> >> +#define PCIE_ATU_REGION_INDEX2          (0x2 << 0)
>> >> +#define PCIE_ATU_REGION_INDEX1          (0x1 << 0)
>> >> +#define PCIE_ATU_REGION_INDEX0          (0x0 << 0)
>> >> +#define PCIE_ATU_CR1                    0x904
>> >> +#define PCIE_ATU_TYPE_MEM               (0x0 << 0)
>> >> +#define PCIE_ATU_TYPE_IO                (0x2 << 0)
>> >> +#define PCIE_ATU_TYPE_CFG0              (0x4 << 0)
>> >> +#define PCIE_ATU_TYPE_CFG1              (0x5 << 0)
>> >> +#define PCIE_ATU_CR2                    0x908
>> >> +#define PCIE_ATU_ENABLE                 (0x1 << 31)
>> >> +#define PCIE_ATU_BAR_MODE_ENABLE        (0x1 << 30)
>> >> +#define PCIE_ATU_LOWER_BASE             0x90C
>> >> +#define PCIE_ATU_UPPER_BASE             0x910
>> >> +#define PCIE_ATU_LIMIT                  0x914
>> >> +#define PCIE_ATU_LOWER_TARGET           0x918
>> >> +#define PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
>> >> +#define PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
>> >> +#define PCIE_ATU_UPPER_TARGET           0x91C
>
> Can you avoid a PCIE prefix for this btw?
>

That's how those constants were named in Linux kernel, but yeah, I'll
add a prefix to them.

Thanks,
Andrey Smirnov
