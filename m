Received: by 10.25.21.96 with SMTP id l93csp192223lfi;
        Fri, 17 Jun 2016 03:29:54 -0700 (PDT)
X-Received: by 10.237.33.35 with SMTP id 32mr1370645qtc.8.1466159394394;
        Fri, 17 Jun 2016 03:29:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m42si22522259qtb.65.2016.06.17.03.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDr29-0005mE-PC
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:29:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDr1r-0005ar-F9
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDr1f-0002ar-UF
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:29:35 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDr1f-0002ah-Q7
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:29:23 -0400
Received: by mail-vk0-x22f.google.com with SMTP id j2so110063425vkg.2
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0zrKDiDkgyaYN5VUS2tt2UExHmxE3+zHqaYMMBFnsWQ=;
	b=Jx1DuQ+DX8nj9MLMOwsEQd/vw6QsSifRvPt48kADF1ZH6MxYDqaoLEyxvdorVnMaDD
	6SFSboN5f+nQVPB66rm4sWGQzB6ns/HHqyaswxCS5WEUqG7F/V9uma7kOskR/O3eVrz2
	ZjkkIIdlDMo+umU+ut78pQUzQDq1HPgyT0Eqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0zrKDiDkgyaYN5VUS2tt2UExHmxE3+zHqaYMMBFnsWQ=;
	b=VJwkLuhjjsyk4lYmKfi7LmGF0vMRNmuDECNahFujDyr3hWbrqkNpz5gWq03ECM/kuf
	WwEvvu6Z3VxhviH0qjV/tvMaiVU5kas2HDbQMCQRl6R5m+mTdcvddbNC4E3s4ygrCnPR
	MQo4QfB/COSDSrkGm3i822so9kMptdCt5N1d7UDWa6uOCSreFspibrKG6AcCWjl3h/6a
	9SFwEn3MCtnEgR3mhIM8mcLQZ38V+MAQYa0AGESDQCQRcBJ4v5av8uvGy3tNPkP/Fjpz
	KBtx5wVn/5JB4s4wicu/ql5i+RTH2MLsi3/KcbDiLyvuT9T00XL2x2LVCJWx/OijGWRg
	sroQ==
X-Gm-Message-State: ALyK8tInGob0ktl7Uddt+8LtsstpY/Cg1vaCmtkhAupeigD3Q9kSk7YiY7zmHx7+78I4cRThvlIAldicfB3jT+ll
X-Received: by 10.176.65.7 with SMTP id j7mr431769uad.38.1466159363182; Fri,
	17 Jun 2016 03:29:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 17 Jun 2016 03:29:03 -0700 (PDT)
In-Reply-To: <CALicx6svRE+cjeehkftpudox8=bvTqvPFyAx=whOhAFb4+WSWg@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
	<fe539d79-cac4-27e3-589f-66290ae8f243@redhat.com>
	<CALicx6svRE+cjeehkftpudox8=bvTqvPFyAx=whOhAFb4+WSWg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jun 2016 11:29:03 +0100
Message-ID: <CAFEAcA8gkvgsQ9e0aTE7vnJyorXkjjL6KS=yZ6nSN_GvPFzUow@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/4] exec.c: Remove static allocation
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
Cc: Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j8rvYT9X60gE

On 17 June 2016 at 11:14, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> Hi Paolo,
>
> On Mon, Jun 13, 2016 at 3:22 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>> diff --git a/exec.c b/exec.c
>>> index a9d465b..e803a41 100644
>>> --- a/exec.c
>>> +++ b/exec.c
>>> @@ -154,7 +154,7 @@ typedef struct subpage_t {
>>>      MemoryRegion iomem;
>>>      AddressSpace *as;
>>>      hwaddr base;
>>> -    uint16_t sub_section[TARGET_PAGE_SIZE];
>>> +    uint16_t *sub_section;
>>
>> Please make this a flexible array member instead, so that you can avoid
>> the extra pointer dereference.
>
> What do you mean by flexible array member?. please give more info.

https://en.wikipedia.org/wiki/Flexible_array_member

thanks
-- PMM
