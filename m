Received: by 10.25.27.66 with SMTP id b63csp1930347lfb;
        Tue, 31 May 2016 02:05:08 -0700 (PDT)
X-Received: by 10.140.251.195 with SMTP id w186mr30666429qhc.57.1464685508742;
        Tue, 31 May 2016 02:05:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r142si30381528qhb.69.2016.05.31.02.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 02:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7fbo-0001xF-6H
	for alex.bennee@linaro.org; Tue, 31 May 2016 05:05:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1b7fbj-0001wk-AB
	for qemu-arm@nongnu.org; Tue, 31 May 2016 05:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1b7fbh-00039O-2Z
	for qemu-arm@nongnu.org; Tue, 31 May 2016 05:05:02 -0400
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:36357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1b7fbg-00039K-Qn; Tue, 31 May 2016 05:05:00 -0400
Received: by mail-lf0-x229.google.com with SMTP id b73so63167299lfb.3;
	Tue, 31 May 2016 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gtqdv5IfoqlHUuYaRhFuaBfW9nHvmMZcKBcMyXplaVI=;
	b=J/MmBBwQfmwjPHaXFmJ60UXbn4GbYca9FZdRj5UwrBSHHdBp9xdRtwK1CI4nMepJjU
	SN/2buxtyCOOKNZSfhj+X+SIRkGdp7W8vL9NSGH8AK1fRiK4fg0fh1dWyX2qceRkc5em
	9pvDAzRVXWt3Dk9IP7Tue31eRsnLQaj/k4Kve3G1zeEHZU1xnTeBE63cdrf/437k94pj
	qGuzhAVMXIMupc2RqHuL/ntSYBioIaJOG/PSPcR3sNjr1fujCGBkt6TInfcZSWPgtXE1
	5XVbLlwyvVSBw3hpVg4XCDor1UjW77Hjzk7Hm2TkZldPg3oMfMI6eHbeHOecI4riJpT8
	Ygzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gtqdv5IfoqlHUuYaRhFuaBfW9nHvmMZcKBcMyXplaVI=;
	b=LYx8nJ+t20nie1YoujQSkx5pEc3yiu2dA5zqHAxooLuns+bkmiTKuar0aCluZXiGoy
	FBEJfG8fBdsPbIjCxrViOyocfXO9B4gxzLUuSJ5pz7WyhCCOahpIERvoCs9R2l+XD4w3
	lZV9mtQpOEwDLYk4B5XnrITEDdMKbFfcjwSfvXpTy3xW0YNmD6MlpiNwOPPAaMdeq8Ca
	phPli1aOS8VpMG1IjLP5qZfCCJnB7ymELaCOYLYR5QmO4Jd/8K7XQ2QfpEi1GR3MRSpA
	ru/eMINPXw+JTYIXkLq4L6aXDlFHkeQ6a5FRFnsQEgNBz5NSDhWiLygikMFxU+gD8ruz
	dqYw==
X-Gm-Message-State: ALyK8tIkGKd98FCV/wcaSayTz0Hy505f+DFoNvLxFsLM25BPHgbak3ftVg/QIOw7SQ7TBzVK67rQieQgUyxW5Q==
MIME-Version: 1.0
X-Received: by 10.25.158.73 with SMTP id h70mr9454169lfe.41.1464685499599;
	Tue, 31 May 2016 02:04:59 -0700 (PDT)
Received: by 10.25.153.72 with HTTP; Tue, 31 May 2016 02:04:59 -0700 (PDT)
In-Reply-To: <CALicx6u_YinmXd4xCZKsRVtWcnSUHqoe_7Tc1TOG7ai3cg_rYQ@mail.gmail.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
	<CALicx6u3yCdFSUuLyQgt7yP08RSwXP=k0w3WKmeTRfn7jS6vRA@mail.gmail.com>
	<CAFEAcA8sCNFY7dF2MSZcELgEfJg9MhNERFAY2ZJrou=e1zKM5w@mail.gmail.com>
	<CALicx6u_YinmXd4xCZKsRVtWcnSUHqoe_7Tc1TOG7ai3cg_rYQ@mail.gmail.com>
Date: Tue, 31 May 2016 14:34:59 +0530
Message-ID: <CALicx6uv8hr_HguPa_gXbt0r5Zc4spCCQ5_QyYe3j_72Vyq1mQ@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::229
Subject: Re: [Qemu-arm] [RFC PATCH v1 1/2] target-arm: Update page size for
 aarch64
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
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijay <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ynn+hnllxLq

Hi Peter

On Wed, Apr 6, 2016 at 8:31 PM, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Mon, Apr 4, 2016 at 10:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 4 April 2016 at 17:40, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>> On Mon, Apr 4, 2016 at 7:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> I agree that this would definitely improve performance (both for
>>>> migration and for emulated guests), but I'm afraid this breaks
>>>> running 32-bit ARMv5 and ARMv7M guests with this QEMU binary,
>>>> so we can't do this. If we want to allow the minimum page size to
>>>> be bigger than 1K for AArch64 CPUs then we need to make it a
>>>> runtime settable thing rather than compile-time (which is not
>>>> an entirely trivial thing).
>>>
>>> Do you mean to say that based on -cpu type qemu option
>>> choose the page size at runtime?
>>
>> If you want to avoid defining TARGET_PAGE_SIZE to the
>> lowest-common-denominator 1K, then yes, you'd need to
>> choose it at runtime. That could be painful to implement.
>
> Had a look at it. Needs some changes in common code as well.
> I will send this as a separate patch series and drop this patch
> from this series.

The L1 page table size, L1 shift are dependent on TARGET_PAGE_BITS(page size).
as shown in snippet code below from translate-all.c

/* The bits remaining after N lower levels of page tables.  */
#define V_L1_BITS_REM \
    ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS)

#if V_L1_BITS_REM < 4
#define V_L1_BITS  (V_L1_BITS_REM + V_L2_BITS)
#else
#define V_L1_BITS  V_L1_BITS_REM
#endif

#define V_L1_SIZE  ((target_ulong)1 << V_L1_BITS)

#define V_L1_SHIFT (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - V_L1_BITS)

/* The bottom level has pointers to PageDesc */
static void *l1_map[V_L1_SIZE];

How about adding CONFIG_PAGE_SIZE option to configure?.
