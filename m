Received: by 10.28.71.27 with SMTP id u27csp646863wma;
        Fri, 23 Feb 2018 06:19:34 -0800 (PST)
X-Google-Smtp-Source: AH8x226l0+NkBUs9dFknSMhh7FOigEP4o+glTBa+odGsSehacz7hEapPL8t/qh2sMH9B/+Tpz1XZ
X-Received: by 10.129.106.67 with SMTP id f64mr1041331ywc.349.1519395574370;
        Fri, 23 Feb 2018 06:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519395574; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2SPSpSfMLGTkW0UoyvkymtJFaAGCL37ksl+ASCMqQgyt3F3eXp9uizLcRxG37wvIQ
         FWuTPabu/cMPkL4fpPBrBZ+Pdq/OGFVeG6dtNfrlSyJWIclmhYjXsdDd5rsEPRX1VHuZ
         aTFJHZ//tNawu6nzWobXPfprXu4FKsagTTu09zB/YUf0HSNDHkImxQRa2lpcYOUUv1Cy
         6gth1Vmw2LdwaqKa+69Uoqbw5CI/3ADT9XNvWjinfC4DeRM77JBhmV9xXusCtdo6twdf
         fwKXvpGn3NNend9eTuUPAPeVX7pezmK1StPt6XUsAOXj3cqf4iWqcP00zO6t+P8fd4yL
         93Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rZmv2x/PDIElDMqEz0iN0wiP6O5vtinSLQwzSEO8aCw=;
        b=bbqTp475SEzRqwaUg+gD+bEGYNvLhMLRayPiif1kt9wtsZ4UbU3WM3Dbb8JGfCbtOR
         iXUEBsSx2eRIQ4Gs34WN86oFtdrrLIbF3uC5z8FLtDTlOgd5ZirCKvtaugOdMTJzGRul
         g1eZYxJ3tnUa2JAOWAaPHyaCMRBH4zk3lkwMYPFsuuX9TPzuhZV6AMZ1DMyMtijaRn7K
         hr35C/2OOtx2oCgbCjvZmmnx8m5o6htkNFSp8Kt1ytHw4yJsMLHox4tpPCKQbeLe6ufn
         Ukvvtvva6BQwWo+m2/hcq8LNSZlxaxrFmNKXEQW/pR5XZL8RYSbqIYsbEjOjftWyJZ+y
         O+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=It9nQYF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h10si244608ywa.788.2018.02.23.06.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 06:19:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=It9nQYF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epECD-0004Lq-Do
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 09:19:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epEBy-0004KK-Eb
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:19:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epEBx-0006Bj-GO
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:19:18 -0500
Received: from mail-pl0-x234.google.com ([2607:f8b0:400e:c01::234]:39735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epEBx-0006Af-9f
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 09:19:17 -0500
Received: by mail-pl0-x234.google.com with SMTP id s13so4968392plq.6
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rZmv2x/PDIElDMqEz0iN0wiP6O5vtinSLQwzSEO8aCw=;
	b=It9nQYF+vQc6Qn2O6pt5yjCbEGAGJ+bDTx2HRhZqLD16ydJYsAiCdlvveE7b2xQh/Z
	/9w78i5KbKoneFOhWCI7awyhoeOKhKMy8HBt2bvovuBaXrTLIz9PEnQDmeVKEA3oI96W
	7LqmPczP9UyKmGV0USiORHa7XB7+t1//H8rgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rZmv2x/PDIElDMqEz0iN0wiP6O5vtinSLQwzSEO8aCw=;
	b=eiOMGjSwWXb5D0Bpn7vz21hVPmxjk7257JovkKvRw8AS4CxL2NcEJDEL7Dy2uPCHSq
	f58UOoZV6oLrhRMAKO55OPpb9p8QImhBw1VglrDCbywEgxo2kPjYSas9yaz5j8qsajmN
	CrlOs5fL4UHh2OxLB4qKdQwunCjcWvOX/bZ2Ncjs5ANQXRtolz24DoCxo5LYNq1SJ2fG
	v63FfdqueCuERhzpUkEF+l0ECqr8Uux0gGe7WwcYpKEXj3G2FJyY90Yy8EL5DLZSyiGK
	J5Cqi54MIYNOxO7ZBkQCGnIlODT8nRp07efzr2HouHLOumd/RINbUy9OwAWheAU0Hxul
	2pQQ==
X-Gm-Message-State: APf1xPDKp1CBQQvIFuRGrdfdI+lVOrsjBXvDqLFAk8zTrZdvWft/M3d0
	wsVC2LZ3SlzTU/2F8cCFfRfZXpvWqZkYden4wvk6yA==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr1914429plz.436.1519395556494; 
	Fri, 23 Feb 2018 06:19:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 06:18:56 -0800 (PST)
In-Reply-To: <20180217182323.25885-26-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 14:18:56 +0000
Message-ID: <CAFEAcA9=_kCGqv8Ck6Ttg=wEotYdTj7VYcs_w09+3D=7k5pARA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 25/67] target/arm: Implement
 SVE Integer Wide Immediate - Predicated Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GIgrSr/il3BN

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/* Two operand predicated copy immediate with merge.  All valid immediates
> + * can fit within 17 signed bits in the simd_data field.
> + */
> +void HELPER(sve_cpy_m_b)(void *vd, void *vn, void *vg,
> +                         uint64_t mm, uint32_t desc)
> +{
> +    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
> +    uint64_t *d = vd, *n = vn;
> +    uint8_t *pg = vg;
> +
> +    mm = (mm & 0xff) * (-1ull / 0xff);

What is this expression doing? I guess from context that it's
replicating the low 8 bits of mm across the 64-bit value,
but this is too obscure to do without a comment or wrapping
it in a helper function with a useful name, I think.


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
