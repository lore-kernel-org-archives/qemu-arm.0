Received: by 10.25.21.96 with SMTP id l93csp541999lfi;
        Thu, 23 Jun 2016 07:06:07 -0700 (PDT)
X-Received: by 10.237.34.213 with SMTP id q21mr43659582qtc.53.1466690766948;
        Thu, 23 Jun 2016 07:06:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si237367qtt.92.2016.06.23.07.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 07:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG5Gg-0000kj-8E
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 10:06:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bG5GV-0000kK-Es
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bG5GS-0001Tu-8y
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 10:05:55 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35894)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bG5GS-0001To-4o; Thu, 23 Jun 2016 10:05:52 -0400
Received: by mail-qk0-x244.google.com with SMTP id l81so16033523qke.3;
	Thu, 23 Jun 2016 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=jaGW1C55ACNthsrRT5sa9+s7MaPYA+ie1lt1MfIHO+Y=;
	b=xwimOivW2wMUuJhfm4BskmqmeZdY6xVTvALWCmDxO1CAg6gP+ASmFTPiKOJ/hPb4Zl
	PJTuRRWkKfuuOGl3QB12A5KIarvR0QW0SRSIJP+Qd6s34KKUjj5ye1dca9EXqjAbkMIv
	ZAQEKnVKuGmPOjUSr6ekEhzvqEUwh3Y+FCZQ7XHT0tmhesjBlbaaEQqpiAMPwurw0arZ
	p5nNesugRkuvPKrCuXArd6/ns/lCVg34Xuf2Eom2wWkSjbmn3v83uQ48nAPafiu7L9fr
	9y9q3TVc5bErBCLrhlpcUnt+W/0JCsPqD7kZ2L57LEW2U+upeouCte7LNQWeETaKzKIp
	Z/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jaGW1C55ACNthsrRT5sa9+s7MaPYA+ie1lt1MfIHO+Y=;
	b=fHtsw7P6IJEfwO+PE+E880OqI+zUpSWnZOBMgXc3NbM464B6oyRn9jum1GcALjyOrr
	a3jHk3DAgoFF6R4+9ccSv5XeeTT6d1pEVOZ/jxwNs0CBVHfDP+fdXlnZpPKd96Rl4ueW
	m6/RQcepYtgfdrCMapRh9ankVDakNgTMGzwyszbJg5S3VMC64r7ghwSiY7BBsJV5rBSj
	U5dmmMT/psNn0LbeL6+1MXFTzjRleMUx+s8gS503/CJmPUwRhBMjm0QbAeU8T1991TBn
	JRXWizf8CX6lw9cQeKPbPZ4aSQ3W3aEIRF4+G5AdIpqeUoBEiFo6rtyAflCrgRuj6WqV
	A4jw==
X-Gm-Message-State: ALyK8tJmgvtXJQgTLq9rbDYq8gyfA4o2+kfz20anbcJ//IIvrxt3InJRAxxZReq+dE/vNA==
X-Received: by 10.55.77.4 with SMTP id a4mr20063069qkb.198.1466690751642;
	Thu, 23 Jun 2016 07:05:51 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	e41sm116396qta.37.2016.06.23.07.05.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 07:05:50 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1466599029-3388432-1-git-send-email-afarallax@yandex.ru>
	<5d86b8ba-16e8-e94d-ba7f-e865cbcc938e@twiddle.net>
	<1793281466613020@web5h.yandex.ru>
	<6c24c820-4a26-848c-e62d-88ebce59125d@twiddle.net>
	<201241466676212@web21j.yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <458f40bb-cb58-4e10-2237-a08cb35155bd@twiddle.net>
Date: Thu, 23 Jun 2016 07:05:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <201241466676212@web21j.yandex.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH v2] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oLqswnNhNjgT

On 06/23/2016 03:03 AM, Sergey Sorokin wrote:
> So what's wrong in this part of the patch?

I think I just misread it.


>
> 22.06.2016, 20:12, "Richard Henderson" <rth@twiddle.net>:
>> On 06/22/2016 09:30 AM, Sergey Sorokin wrote:
>>>>       diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
>>>>       index da10052..3dc38fa 100644
>>>>       --- a/tcg/ppc/tcg-target.inc.c
>>>>       +++ b/tcg/ppc/tcg-target.inc.c
>>>>       @@ -1399,6 +1399,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s,
>>>>      TCGMemOp opc,
>>>>            int add_off = offsetof(CPUArchState, tlb_table[mem_index][0].addend);
>>>>            TCGReg base = TCG_AREG0;
>>>>            TCGMemOp s_bits = opc & MO_SIZE;
>>>>       + int a_bits = get_alignment_bits(opc);
>>>>
>>>>            /* Extract the page index, shifted into place for tlb index. */
>>>>            if (TCG_TARGET_REG_BITS == 64) {
>>>>       @@ -1456,14 +1457,21 @@ static TCGReg tcg_out_tlb_read(TCGContext *s,
>>>>      TCGMemOp opc,
>>>>                 * the bottom bits and thus trigger a comparison failure on
>>>>                 * unaligned accesses
>>>>                 */
>>>>       + if (a_bits > 0) {
>>>>       + tcg_debug_assert((((1 << a_bits) - 1) & TLB_FLAGS_MASK) == 0);
>>>>       + } else {
>>>>       + a_bits = s_bits;
>>>>       + }
>>>>                tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
>>>>       + (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
>>>>
>>>>  ppc32 can certainly support over-alignment, just like every other target. It's
>>>>  just that there are some 32-bit parts that don't support unaligned accesses.
>>>
>>>  I don't understand your point here.
>>
>> ppc32 can support a_bits > s_bits.
>>
>> r~

