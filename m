Received: by 10.28.91.67 with SMTP id p64csp3901404wmb;
        Tue, 6 Mar 2018 08:07:24 -0800 (PST)
X-Google-Smtp-Source: AG47ELvSJOHwwuHQLf9gO8qt+6cn3U77Fe37LCBuDzVzdVBsZANyLmVf0eOHH8oh7JLg8RGWGBHr
X-Received: by 2002:a25:d8a:: with SMTP id 132-v6mr6960522ybn.380.1520352444409;
        Tue, 06 Mar 2018 08:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520352444; cv=none;
        d=google.com; s=arc-20160816;
        b=wwzYHwg0sES6ozbzdS+UP+fLJMWFYMA8XuK/TbvfCd/nq3pQd3qUQ6an7dcPYdDR+0
         lJ7r9XVu08nRiRsxImhCbT8eY31Q4PYnUE2rKrZ0yM2isJxhjFPfIBn8qI2xlnZCUDcT
         M533cBD4YGyu4C0Y29Lqe0/DAn08lp2zD3KQmI4Ho4J6W1nkS1Zlzf/4OjfPJI01O3Ac
         OIEaSIM2TZ+FDoLCVDwuOS4ErUa0V1sKzGzJloMsrh+9V6gIbKEKc33p8Mk7zIwmlOBc
         0XyowgWa8vLlQNJF1IXTAaeMqkA90sZewTf2hNqwHya6uA87Lh3zQ2VXwtcjjtBfzxZw
         FFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TqrHaH+pV0+0caoJn64xbb5H+2pXVVTVZfgOsyDb4ic=;
        b=YZYl45Vtw3sr0DDCS9voWqNKsMyxJi77lcH/7UqAZXivIm3Q+C/mdb6EzNS+1/gw2B
         7FCKgSMV+9l/EfsFsrPp1z0jFO1wWbd++NmYQDxC54Ld3fMrGfp3FptSKxM/dQnEHCXY
         0RQncWVhvtkDww+dRZTnc+Lgz2pzgVY9WzrfYOnpDWk1A/XRkuDtGohp+didcMrrnfGl
         vjqUzGNksxrFPv/x5EaHsg7jr0yxIs2iWdWICVZLoyXXe19e7OQtzgVUzxVSv1FRRQZA
         n3iqbBWw4FQA98ljT3TjV/L1VrPrCkB2J6W0NMp2xycOhFoddmbpKC4DRbVhxJYUPTZ7
         hbxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rzmp8Pgi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si2564442ywd.408.2018.03.06.08.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 08:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rzmp8Pgi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etF7a-0002JN-FV
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 11:07:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etF6Z-0001rE-4e
	for qemu-devel@nongnu.org; Tue, 06 Mar 2018 11:06:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etF6Y-0002Te-6a
	for qemu-devel@nongnu.org; Tue, 06 Mar 2018 11:06:19 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:43901)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etF6Y-0002TJ-2F
	for qemu-devel@nongnu.org; Tue, 06 Mar 2018 11:06:18 -0500
Received: by mail-ot0-x235.google.com with SMTP id m22so18782613otf.10
	for <qemu-devel@nongnu.org>; Tue, 06 Mar 2018 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TqrHaH+pV0+0caoJn64xbb5H+2pXVVTVZfgOsyDb4ic=;
	b=Rzmp8Pgi7uATyfpcyk7HJ4aBdnzJfo8Aeft4HU+HwEDYC+RGkXXQQR+Mf6KRCxZ9vS
	z3ZdGqIL0brp/xKO/8aYaG3c4KcGGf1r5uo5+o3Qm4VcZjuIHBX31ajEK5HYy2ZV1lle
	Rl+2PALc1O3dnJ+BZ7Zkhyha+7udztvF8BTBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TqrHaH+pV0+0caoJn64xbb5H+2pXVVTVZfgOsyDb4ic=;
	b=TaNoZ8ebZV8UdjH4bS3e6F+uh2s/1D1EDf9CV4EOoKDhHTpiLjsSNbwYtLAHv99BfY
	mB1dfDOOWrsuULHpQXdGtk7hIv1Gkgpe3DV9rCWdcx9sdQaAo06tvW6qcEB3Du3pEm1j
	2Ak9QfgL/32EP8IA1An4mMoSV8SHGQXWK/rqb7p47kplWLvQ0NFQpAEGuLv5Gah6zEzO
	q1Z2Mtpy7WthDdWT42l2OOxjeghj4FwBUf62U5NyxJj2/nKSVpQtcIIXDjlqn67WRtTi
	atyQkn9ElDQ2SMGap0ZF08CWe7NBgzVYAUpjLa5B0jIddQs4au9EoHnjC/Wn8L1lNuDi
	dVhw==
X-Gm-Message-State: AElRT7FrGbl5a++Wa1zGf5PoJQG1Yq2VvO3nv7SZD+NQsf3Xh+Y6BJXh
	AQOH+3z9b8iaMIMrfvptapw9eEQIJ0w3N/DKhvHf6g==
X-Received: by 10.157.3.70 with SMTP id 64mr12827192otv.258.1520352377319;
	Tue, 06 Mar 2018 08:06:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 08:05:56 -0800 (PST)
In-Reply-To: <46c35ebb-b0f9-9a55-b8b1-cd94a29cff3e@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
	<CAFEAcA88s2X9qkFVYG6kmeeZj6-bp0uskXb8TJF0HMfUVVSf8A@mail.gmail.com>
	<46c35ebb-b0f9-9a55-b8b1-cd94a29cff3e@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 16:05:56 +0000
Message-ID: <CAFEAcA8G+eYWZghEza9GmWfwK=cOf9xpS_dg7rkN5KZ50ak9HA@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-devel] [PATCH v3 3/4] target/arm: Add the XML dynamic
 generation
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
X-TUID: 9C/arwi4N1Fl

On 6 March 2018 at 15:29, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> Hi Peter,
>>> diff --git a/gdbstub.c b/gdbstub.c
>>> index f1d5148..ffab30b 100644
>>> --- a/gdbstub.c
>>> +++ b/gdbstub.c
>>> @@ -665,6 +665,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>>              pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
>>>              pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
>>>              pstrcat(target_xml, sizeof(target_xml), "\"/>");
>>> +            if (cc->gdb_has_dynamic_xml) {
>>> +                cc->register_gdb_regs_for_features(cpu);
>>> +            }
>> I don't think we need a callback hook for this. You could just assume
>> the target code has already done whatever it needs. Specifically for
>> arm you can just make arm_cpu_register_gdb_regs_for_features() in helper.c
>> call gdb_register_coprocessor(..., "system-registers.xml",...) the
>> same way it already does for other xml files.
> I think in this case, for ARM64, if the execution mode has changed (to AARCH32) the time we connect
> to gdbstub then we will get the registers view of AARCH64 instead of AARCH32, as we have created
> our XML at the beginning (on arm_cpu_register_gdb_regs_for_feature()) where the CPU is
> on AARCH64.

The gdbstub code does not currently support guests flipping between
AArch32 and AArch64 -- it always exposes the AArch64 view of an
AArch64 CPU even if it happens to be in AArch32. This is obviously
unfortunate, but traditionally gdb has not supported the target
flipping architecture like this. I think that recent gdb changes
have enhanced the protocol to permit this, but adapting QEMU
to use them is a big job that you don't really want to make this
series be dependent on.

thanks
-- PMM
