Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7298811wrw;
        Thu, 15 Nov 2018 09:42:19 -0800 (PST)
X-Google-Smtp-Source: AJdET5c8lZXs5XC2SPjcFK+f0ZgDi7VUqihnht638CWzjA2xGw85ZGFyaUv/dtEKaFamjVqG9fGU
X-Received: by 2002:ac8:5509:: with SMTP id j9mr6646354qtq.287.1542303739332;
        Thu, 15 Nov 2018 09:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542303739; cv=none;
        d=google.com; s=arc-20160816;
        b=S9YvE/3Fsc3u0DWH6zLWO5ArjkK+lW55vu6wvYv81+DtGJlNHlcTweJSNXPvcrmYId
         GoIhgwLv94pObb3+Ha9TyVw0tswzTg5sQtXB6Xvts6Jcn3KzWGKoxolALKvGlws4LI+a
         Pm36YAym0ZfK4j2F+8eEBszDsNnxruXVSzV5umevKYUEWWuknkO6Q+A7+WnVP87fqH6W
         0VPX0eY6zaq0zSNuRKZBKgD32qYVxm0ftwjvSWB2Kp2G2LiDUVJankaI3Esdrb1BViSj
         t1CEeZDjb15rxRK7rzoTg/ClLVfXXMjRtANkNP3c8O6odDzC5JP6oh2HEEjhINv1+4Dd
         lIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=U+JPJWwFX6K9l8iwn+PdWj5cDswQ5acl6fFEn45wqcQ=;
        b=h2fRX9gwd7chT8ObwGgiQj4lgLcDTBta4kbPiVHb3ZGDtORSLPkaEz7z2s9dk/ByYM
         hqGuYwywBjhGCXxStF1YLJ9vN8uMUW02yUnmGWavl3fBIcZ2m4MY85rBcpIc2zhxriTY
         Mc+4TWYJTsw0Jxs0qUN3lqxPMIlOpm2R5eaEypkmCZC/sC89giXwK4QMZAigbttI/vo5
         syD3IKRIr62Q768z8PR2W3nRqAK8mI2M5yHm5gdlIyvUsI8LR00BGMN5JeUrdlx8y2WH
         Xf/aoI42NjzAcmM6TgRmA3/4N6Ey/4onc1aWhIxDFBcfGFORPjgrHkLow7odWX2BONzB
         V+xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YVM49p5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2-v6si5141280qtl.390.2018.11.15.09.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 09:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YVM49p5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNLek-0000Xp-T3
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 12:42:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLeW-0000XT-NB
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 12:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLeV-0006Kc-IU
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 12:42:04 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNLeV-0006DC-5d
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 12:42:03 -0500
Received: by mail-oi1-x242.google.com with SMTP id y23so8313407oia.4
	for <qemu-devel@nongnu.org>; Thu, 15 Nov 2018 09:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U+JPJWwFX6K9l8iwn+PdWj5cDswQ5acl6fFEn45wqcQ=;
	b=YVM49p5hiROTrSioSD4wxiyv5+J5DEijTfAL2CvFcVuPDnn8WXU66nDeNWeSJ4fvbm
	wOLavuGDIMIi8EDJYqFfghGfr2gBolzobzZo8tXgxA35KJrSk0ia8b0cYRAQrJ4hbbEC
	l9ge5EKYYXCY4TbxGn/zgXvMUQDVXBtrunnvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U+JPJWwFX6K9l8iwn+PdWj5cDswQ5acl6fFEn45wqcQ=;
	b=PTssZVF2oCPtRkUFsery6Q2jV/O5dqzzSEca18zNkxXny/yRS981vNnfk57yr/bhXc
	NeC4K0UDZtQ8ZK2wPaYWA1aSndWJuhRnD3ci8X1dG5Wr7jg/dgDdAfgmFu6p9hLZkL8K
	WeP5OEQQap53HL7foy8ECpq3P7xmtKA1HzunyQsjeDI3YM5ErVlroWlva+sHQGG4ebD5
	2qMoUKwpljig7BLU6TValOVW/kVYHwMJwoa4GCoyLQt1NpuoHDQLaIVztWZ30MA2GiQh
	ZCDZNWETVunbfj6Dm1lrQP7Hsos40oPl6/7J4OtsJ8R8ip0Or/5qegTx9Ta0N47qHUOZ
	WwSQ==
X-Gm-Message-State: AGRZ1gLFQPMCkYrUvluHlrqVzN0eBW/SyKvoFdQmXTxhd4v1LUwddfqk
	ybz8/n7WOcnZNmpnLLROr6K+jCPRBmG9NXiJAGiYvg==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr4285797oif.25.1542303722448; 
	Thu, 15 Nov 2018 09:42:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 09:41:41
	-0800 (PST)
In-Reply-To: <20181102134112.26370-4-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 17:41:41 +0000
Message-ID: <CAFEAcA-96EyPc3RnR5-EveW=F+SgatMw52M0W_A=Dk0fCkOypg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH for-4.0 3/4] target/arm: Implement the
 ARMv8.1-HPD extension
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TiTx8QuNpBX8

On 2 November 2018 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Since the TCR_*.HPD bits were RES0 in ARMv8.0, we can simply
> interpret the bits as if ARMv8.1-HPD is present without checking.
> We will need a slightly different check for hpd for aarch32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Another way to write the tail end of the loop would be
to move the nstable handling up, so:

        if (mmu_idx == ARMMMUIdx_S2NS) {
            /* Stage 2 table descriptors do not include any attribute fields */
            break;
        }
        /* Merge in attributes from table descriptors */
        attrs |= nstable << 3; /* NS */
        if (!hpd) {
            /* HPD disables all the table attributes except NSTable */
            break;
        }
        attrs |= extract32(tableattrs, 0, 2) << 11; /* XN, PXN */
        attrs |= extract32(tableattrs, 3, 1) << 5; /* APTable[1] => AP[2] */
        /* The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
         * means "force PL1 access only", which means forcing AP[1] to 0.
         */
        if (extract32(tableattrs, 2, 1)) {
            attrs &= ~(1 << 4);
        }
        attrs |= nstable << 3; /* NS */
        break;

which would then make the hpd handling use the same
approach we already have for "don't merge attributes if
this is a stage 2 table". But don't bother changing your
patch unless you think that's actually better.

thanks
-- PMM
