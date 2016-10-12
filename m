Received: by 10.80.166.35 with SMTP id d32csp538545edc;
        Wed, 12 Oct 2016 06:41:01 -0700 (PDT)
X-Received: by 10.55.113.69 with SMTP id m66mr1267704qkc.229.1476279661533;
        Wed, 12 Oct 2016 06:41:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si3852304qkh.210.2016.10.12.06.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 06:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buJmG-0001Lj-Sq
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 09:41:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buJm8-0001IT-Lr
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:40:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buJm7-00054b-Ly
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:40:52 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:32881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buJm7-00054G-A3
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:40:51 -0400
Received: by mail-ua0-x235.google.com with SMTP id p25so6126672uaa.0
	for <qemu-arm@nongnu.org>; Wed, 12 Oct 2016 06:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1FV/eiabVFZPD8TpNWjQahO+7ODZijZAoCKupQa88Iw=;
	b=bEpffSi0g4yk6TQsUXxuRB7gXbxdqL3/jPCMaFkEnq2MIigMukT+Wts7jmg/LBZ4le
	2IaeRRIdM4qtFMi+ZFQAp+Ae/TtQe0960eTtX3GKFM0imP3deG1gPA1GVGiGRb3LS7RT
	Z0KWQuEx4oUEXBe9wiZahiddgwlWgTBdcCeLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1FV/eiabVFZPD8TpNWjQahO+7ODZijZAoCKupQa88Iw=;
	b=BpjG8AjmZX3VDOGnidzAX01S7XgWimpVJlJKWAzDFiS/B2mUzCU3ZiI14OcqniUUBJ
	DjxTn/H0Xkb3xBNRBQLTXQo7oR3HJU3OoVOqEFCs0ULiJgUdpjH6UXcrhWwi4zLPuzfZ
	6xRfdkeNZ/8X0Xr9A+mRk3+GlypyPZf5RCJnBSllE4G6f2qKt8KmOudJAaQ1BzGLeWPh
	SkrrI9VB5iwcSwbSu1CiyYadIiGhSjdXPiMenu1BtZZe6WOzN6cQ+PM3l/Co1m5Mx0dc
	NsFY98elDdcDMYrIIx3Z7Hah8r6/phHSfcyUjtka3PAIRkoug/By0GRejVp39/F3qTA/
	e/7w==
X-Gm-Message-State: AA6/9RmgufXDbw4FWkTvd7BPR3D6hA0QAWtAdjnlrAIomBmIbw2jvYqq8dKmSEdPVesXpolcH/vNYgcAnmwfgcv0
X-Received: by 10.176.80.176 with SMTP id c45mr550266uaa.131.1476279650829;
	Wed, 12 Oct 2016 06:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 06:40:30 -0700 (PDT)
In-Reply-To: <20161012133326.cnzch6lbgeyficqe@kamzik.brq.redhat.com>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
	<1476205699-28857-7-git-send-email-peter.maydell@linaro.org>
	<20161012133326.cnzch6lbgeyficqe@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 14:40:30 +0100
Message-ID: <CAFEAcA87yQcFrx6ibowhRK2xpgNTsn07Afjh_=R761THX9AnGw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 6/7] target-arm: Make page
 size a runtime setting
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
Cc: Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: foZMxlVk4wad

On 12 October 2016 at 14:33, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Oct 11, 2016 at 06:08:18PM +0100, Peter Maydell wrote:
>> Rather than defining TARGET_PAGE_BITS to always be 10,
>> switch to using a value picked at runtime. This allows us
>> to use 4K pages for modern ARM CPUs (and in particular all
>> 64-bit CPUs) without having to drop support for the old
>> ARMv5 CPUs which had 1K pages.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +    if (!set_preferred_target_page_bits(pagebits)) {
>> +        /* This can only ever happen for hotplugging a CPU, or if
>> +         * the board code incorrectly creates a CPU which it has
>> +         * promised via minimum_page_size that it will not.
>> +         */
>> +        error_setg(errp, "This CPU requires a smaller page size than the "
>> +                   "system is using");
>
> I'm not sure about this. IIUC, then with this it won't be possible to
> create a board that sets up its cpus with the preferred target page bits
> greater than the cpu's default set above, even when the cpu supports it.
> For example, I may want a board that will only use AArch64 cpus with 64K
> pages. In that case I'd like to set the minimum to 16 bits, but then that
> would result in this error. I think we should only set the default when a
> preference hasn't already been given. And, maybe we should also provide
> a maximum to sanity check against? (side note: if we provide a maximum,
> then we could use it in arch_dump.c for the dump info's block size,
> which must be the maximum page size the cpu supports.)

If we had a CPU which supported only 64K pages then we would
make this if-ladder set pagebits appropriately. But we don't
have any of those, so it's a bit moot. If the CPU can be
configured by the guest to use 4K pages then the board
must not have set the preferred-page-size to something
larger, or the guest will fall over when it tries it.
That's what this check is protecting against.

The CPU's maximum page size isn't very interesting for this
patchset, because we only care about the minimum (which is
what the TLB needs to use). If the board code was somehow
buggy and requested a page size greater than the CPU's
maximum, then it will also be greater than the CPU's
minimum, and be caught by this error message.

thanks
-- PMM
