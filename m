Received: by 10.28.91.67 with SMTP id p64csp982276wmb;
        Tue, 13 Mar 2018 10:41:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtxI/kCqYjaKvz8al/gci3654EeKNbOFQZgz6FKCgrug5zXdIu4eQr/4BOUq0RgzwAUFCU1
X-Received: by 10.55.148.6 with SMTP id w6mr2164448qkd.293.1520962905456;
        Tue, 13 Mar 2018 10:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520962905; cv=none;
        d=google.com; s=arc-20160816;
        b=DJ9MLfXDWh+wBf+zp0L3RLpbLH3ZRJqB6D3BwRg/KQerbsrrC2iFbTxjCNnqL69p6m
         +BJ7ObI7gzvueLENiJyo5t9sYlIyXhTn8Htv8I2gr6gYzJk9WASIZduHY2S/sySnw7Va
         oBaS153xRXZQQBCoUxqeRlZcRCN5REgmNrq7im+fjJg2Hyhz57Qaq1XsZeuHfqvW4CiO
         f1BNrI4NozP4T/t7TW4kHr/LjWXghTEEBGmmWNb5HvH2r2xNZ4TBiWa6KKVl6nF3jm8c
         MCCBe8lHy1FFSHc6xrrSZAV0UxqoQM8QHEem3yhI83oWgzCVyVTQbI8bBF/oI/UaEB1C
         Z+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=FGkejSjzKb4XAG721HBiOFjqkyk1T4dzDi781MjZy/8=;
        b=QaL5D9RgFZUWi/KhCcGvPAnYC6ZfiFQW3aQYOvDw5bY5Dn0ZbpJUd9OOGFT20M6EEa
         w020lQM7RKY7mEVPmffQ0ue7kpokkLUi32Jrv91DLhoPoyMr0DZTIgxTXmPg7q2/lUWG
         rEuJUTTsrZp4B/ExuEpeDCjT0g1kFnx8I5/kMrmB3Pd6N4QIphCg2I9wrWc8vznREQbA
         wsjSy/OiF1xfonajpc8dUEIEoVRW6rWf4WnBrQsTm01JZEKmEGjNTx3DgrbzHI+uMnrf
         acLLa8x75UEJ/EdYyeI2pDW1V6QGjE9kuuMO+sodfRYoINQbpjAiV6MVJlvrhTdzYJSY
         RuSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D8hfYjrJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m60si660755qte.95.2018.03.13.10.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 10:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D8hfYjrJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evnvk-0006H1-Q8
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 13:41:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evnLs-0008H6-1m
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 13:04:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evnLq-0002ny-Ui
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 13:04:40 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:46344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evnLq-0002ni-QY
	for qemu-devel@nongnu.org; Tue, 13 Mar 2018 13:04:38 -0400
Received: by mail-oi0-x234.google.com with SMTP id x12so266087oie.13
	for <qemu-devel@nongnu.org>; Tue, 13 Mar 2018 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FGkejSjzKb4XAG721HBiOFjqkyk1T4dzDi781MjZy/8=;
	b=D8hfYjrJD7j4TYEDDMLFsvuGpX3dyWo7CKcegBHRovuip49eysGQ9yXQ6iMscH6afU
	GEbaLd1jlqDRUo0n+VXSNDWxA9qG57I6QiugvXQ0IAEHqaOiy873IsyFrxKvU0Gnnfru
	VK5fs/fVZndHhF+4sb0bKq6lW+mLfbjFL5+vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FGkejSjzKb4XAG721HBiOFjqkyk1T4dzDi781MjZy/8=;
	b=RxXDVPBzqnOiPj11VCqPgx80tWiSYyjQXfoHZYj8Nu/my/aiBVgMIZIO8gaJ2oxYGc
	HmDA/i5oPMbsESW4FYhD64e6T2dEelXQScB4SJAbCeyqMg5mmiqtBGKABDNuODuaawr/
	yyVBijjv1hdLu1pc4MU7Vf0LmsMYDv4qgTIQK6zDZxGBWyiTdwBcj8I8K4gEfcVBbnlS
	0E//Y1O13PY50kDfrRgs60/+KdQ7DMkuzKQrVQyApvO8gr3b+78xQosZAONZcofzfufw
	Hp1oqSYVHz0V22H+vnwo2a2xqdGxagN9Y1grtfYvPZfNvLtGNb7ej2SHcOzDQnCElWtf
	bQ1A==
X-Gm-Message-State: AElRT7GZTEyjKN3dkcoo8SV1aPRXcwFwBrUFer57SEJcLuJPANe7aCwc
	dxpBKXv1P8nQf42eSeAdKSfBUsBEAdtOSMzO8HYRhg==
X-Received: by 10.202.17.13 with SMTP id 13mr859916oir.164.1520960677983; Tue,
	13 Mar 2018 10:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Tue, 13 Mar 2018 10:04:17
	-0700 (PDT)
In-Reply-To: <1520850690-23245-5-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1520850690-23245-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1520850690-23245-5-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Mar 2018 17:04:17 +0000
Message-ID: <CAFEAcA8B-U-DNT2Bxe5CDLiH+B-qA=oje0Vsgb0XAdwR5uaLsQ@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-devel] [PATCH v4 4/4] target/arm: Add
 arm_gdb_set_sysreg() callback
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AQn+vj35ODWH

On 12 March 2018 at 10:31, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> This is a callback to set the cp-regs registered by the dynamic XML.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>>> Adding to that our customers may need this write access, our tool TRACE=
32=C2=AE
>>> needs this also in some particular cases. For example: temporary disabl=
ing MMU
>>> to do a physical memory access.
>
>> By clearing the SCTLR bit? That's a good example of a case that
>> won't work reliably. If you clear the SCTLR.M bit via raw_write
>> this will not perform the tlb_flush() that it needs to, which
>> means that if anything does a memory access via the QEMU TLB
>> it may get the wrong cached results. If you always clear the
>> bit, do one gdb memory access then set the bit then it will
>> probably not run into problems but you're walking on thin ice.
>
> Does adding tlb_flush() before or after write_raw_cp_reg()
> could solve the reliability issue for other particular cases?
> Or is there any improvement that could be done for this write
> callback in order to get more reliable results for other
> particular cases?

(We kind of discussed some of this on IRC, so this is just writing
that conversation down as I understand the situation. I think we
can get the first 3 patches in to shape to apply without having
to resolve the writing-registers part first, anyway.)

I think there's an underlying unaddressed design question here,
which is: what should the semantics of gdbstub writes to system
registers be, and how can we best implement that? At the moment
system registers have basically two access methods:
 * real guest reads and writes, which we open-code in the
   code-generation parts of translate.c and translate-a64.c.
   This includes access-permission checks that don't allow a
   guest running at a lower exception level to access higher EL
   registers, and is also the code path that uses the CPRegInfo
   accessfn, readfn and writefn functions if a register spec
   defines them.
 * "raw" reads and writes. These were designed for VM migration
   and for synchronization of state with the kernel when running
   under KVM. That means they're not expected to actually be
   changing the state of the CPU, and they just update the
   underlying CPU state data structure fields for the most part.

Neither of those is necessarily the right thing for a write from GDB.

We get away with using 'raw read' for reads from GDB because
generally that gives us the right value and if we do happen
to return a wrong value that's pretty harmless: it won't have
upset the state of QEMU. But raw writes are potentially dangerous
if we let the user make them. SCTLR.M is one example discussed
above. Another is if you allow the user to write SCR_EL3 directly
when the CPU isn't at EL3 then you might be allowing them to set
SCR_EL3.NS =3D=3D 0 with a PSTATE indicating EL2; QEMU will likely
assert() shortly after because that's not architecturally valid.

Using an equivalent of the "real guest write" path would at
least be a bit safer than a raw write, but I'm not sure that
"sorry, can't do a physical memory access because the CPU's
at EL0 and we can't write SCTLR" is the behaviour you want...

So my feeling is that to safely support guest sysreg writes
from the gdbstub we need to:
 * define what the semantics of doing that are (preferably
   by reference to something architectural, eg what you get
   if you try it via halting debug mode)
 * provide some way of getting those semantics, which is probably
   another function pointer in the regdef struct for a gdb write
 * go through the various regdefs and update them to be able
   to handle gdb writes (either by providing a function to do
   the job, or by being flagged as "raw write is ok for gdb
   write" or something. Will depend on the individual register.)

The really important part here is 1, I think. Part 3 will be
a bit tedious, but I don't think there is any way to avoid
it. There's no "works for all registers" shortcut.

thanks
-- PMM
