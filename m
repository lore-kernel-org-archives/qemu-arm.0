Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2082547wrq;
        Sat, 30 Jun 2018 13:09:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdlhteld1kw/hye9s21g62HhRiRFkkgMxFyNdp/k0A6PamJ40dil7ZmRjEa3274gDVLtoF5
X-Received: by 2002:a0c:aac7:: with SMTP id g7-v6mr17334257qvb.76.1530389366023;
        Sat, 30 Jun 2018 13:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530389366; cv=none;
        d=google.com; s=arc-20160816;
        b=OoJ1mpykazXxqsepushVar9hzVGdWMTAa95C1yQR8aIWLRG3tL4lrkeyrUvnnufoIE
         F3q7C0Ge27LlyxxVH3XxPWtz6cEiD9pEZUEbLNcaesaa9UqGCwpV1bQqKmdKnjXRr6m+
         QkuzoGISbN2dQH9ZNnZiyXwdiJApuRBCbraQI4xfveP1HZ0plhbGLB6sj65pLzSJYAgI
         kUrhyD3p+7dt9sQSK6MDFR51tWV1pmvd2+fvPHsFWJoB5FK51KVaMJipL7LC2Xp9M000
         FaSoGui4dsKFMRixB/bGufiP9yzW6C/VwWnE1+0HqqtI8lAzg71jPXrFDHUyKhCaUJ7I
         j5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=T1cJV9o0GXcL1Z/KNPU8RHyzDTFiI/8siKr320ve6cE=;
        b=uiZ1BIQiCLCp3rsceDE6qohpHG4Q0Sxk0uR1xJdBDTULD2xM5BUh0fzEo8f5I8bhxa
         7tOJKSZK/wY/EvMZUYnmVaiIdXJSLNJViNpcJ0X/u1mTux/iZ60lvIgadfYbQMzhJqst
         VIlZTCoYaVStTtx/LZC7wqGyfYdmSps2RcPzcajve2KZsjhrUhCZiq4lGTJ1kvjpWPo4
         nEcv+U8Q8igKAMDgdFNVapKTQz+scboYyb7K7E8O5191kxCh2JiBmBR5SH/uJcoc6+C7
         nbT6b+x6FwZMUmQ+pwgrbHNZxZUTlRGvM+uTsTAvRlhDKNslekQZ+TV2FTay+d1QOTRs
         aIpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EenepLbI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14-v6si12229461qvb.289.2018.06.30.13.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 13:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EenepLbI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZMBR-0000hw-Hi
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 16:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fZMBI-0000h4-3c
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fZMBH-0000ZS-77
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:09:16 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:40189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fZMBH-0000Ye-2K
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:09:15 -0400
Received: by mail-oi0-x241.google.com with SMTP id w126-v6so4144649oie.7
	for <qemu-arm@nongnu.org>; Sat, 30 Jun 2018 13:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T1cJV9o0GXcL1Z/KNPU8RHyzDTFiI/8siKr320ve6cE=;
	b=EenepLbIKOqHjUgzdnCiTe0+ptwbt7gjha4Ku+Wq16FPkyqDNDRIwK3Rk30eMvyfeF
	zKazYRhuNydzB3IlJAdKciqh6BX3evQFHNEzHNRdirhCJWQYFr04S4lraDK0DIKsivls
	90SiL2Ar4PTqIH0bDlgWw32T2x3ojGpGT7SnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T1cJV9o0GXcL1Z/KNPU8RHyzDTFiI/8siKr320ve6cE=;
	b=QU/B1pMx9TQopbPBtvNqRbsmPykj1wFv9Vz2K4ZeqWJp/NVsfLhidtjqE9Cah1s/rs
	i2ZmFHdtia8pIbSAG1r8xnjO4b/aOBwwJuSPHZCH7JvvzZjeDolAHFviMlvebCwNIkxV
	KZ1iW8y60k69GlucEPZsp2CzVD5CnZHkToto7OiYPhZfIRY+xALj7EL2wRcdJNrztLgy
	nzAxVsqYXc5LWfnmqFtbahuQiazbEdVCQWH1s/TDmMFaK17JKrs9Gx45Gu3bfDcOku4a
	D1s3rVJHgf5KSLMDTJb37i7XkyBtyP4GVIg4b70l6+KhF+ZGbLpJXEu1qDDF4PBe/WX/
	FvCw==
X-Gm-Message-State: APt69E1tH2nwlg3rKn5XI0F+JMh/PEIgyxACPVYdUGlUbqcRyxinRHwb
	F+AIcG0Qcj9326zhdfOX+yPTADbzvTn5G9R3DdAXhQ==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr4151794oih.12.1530389354405; 
	Sat, 30 Jun 2018 13:09:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Sat, 30 Jun 2018 13:08:54 -0700 (PDT)
In-Reply-To: <CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
	<CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
	<CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jun 2018 21:08:54 +0100
Message-ID: <CAFEAcA-dNr76uh_x98Uz_7h3xWxgd2Q_WdB5OSZVo6K9kruB=w@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
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
Cc: Patch Tracking <patches@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B9oIkrLINS/h

On 30 June 2018 at 20:42, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sat, Jun 30, 2018 at 12:20 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> I'm observing the following failure with xtensa tests:
>>
>> (qemu) qemu: fatal: Unable to handle guest executing from RAM within a
>> small MPU region at 0xd0000804
>>
>> Bisection points to this patch. Any idea what happened?
>
> Ok, I think I've found the issue: the following check in the
> get_page_addr_code does not work correctly when -1 is in the
> addr_code in the QEMU TLB:
>
> if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK))

Yes, Laurent ran into that and I sent a fix out on Friday:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=52914
-- could you give that patchset a try?

thanks
-- PMM
