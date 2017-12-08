Received: by 10.223.159.74 with SMTP id f10csp41815wrg;
        Fri, 8 Dec 2017 15:09:35 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYrDnDQnEdOn5Km4xaZiiRprjVNuTY7Mj4Sr6TltLuiAhUuH7kh8xNjW5V96c/0idr4KlWj
X-Received: by 10.129.201.6 with SMTP id o6mr21903687ywi.135.1512774575888;
        Fri, 08 Dec 2017 15:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512774575; cv=none;
        d=google.com; s=arc-20160816;
        b=USr2KqyEem4GFzl/gSRMg5VLRKzPNC9w05gCskqGxw3asr+gZIz7Fr0tD3eMQcGW3x
         VS553+dTHIx+gcTEzjz2iA2N5aCv8Yphk0R83TyqelCC2Ulf1Ju4MuiBqZdCuTCFJMx8
         KEddkXCvKphFt5XfFNqCSs98+T2B0izwtrJCKPinnp8nca0OubIKm11sKwWg0tDry+Gm
         h995oeTi1Ekq0t8J1DVdAt+rVinI5L8O6GSDkPnaChCMkLg4hWLG3FyCA6KxFEt8Peke
         oLRaE3JBdLsHg3ToxDq1BLBSI6uxOW5e5nNIJeJNGDSBryYZqBpNjpkXHDNI/9/Nhh0+
         cykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=RWICqgoZtVQHl9/mFM0zQov6k1m+ROgy+01RtoZcWO4=;
        b=aWw8KyN+XtslrGNF5aZ5duIHAWC7Z2FhSQ1/03GI767GMCk80V//cTJE5WhQpGdP30
         fIvsPbM5ygt/ld3/JoFMd5Kbj+hYww1iBIuCtzGUOb3WhThUuZBXGHYyJp0A1WKM25V2
         8PyAhpMg8mruJ2BuwdTqW7BQAauxKQ4cVfE6nvLwJ1h84UXr0M9OkSqJE4QMxePeVB1z
         jWcEEgDBjkf9BVtOlRPuelyNI386Fxwj+r1qnE772m9rlcwzJZ+XLA8rgTwkHtcY+IsZ
         a3XgaNwvuMiy/cm90P1rFpeDCGaYFjj4mxj9ihQFzAsZ7OGsIJLiGoOC5kl993A0qUiB
         2kew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=bO4jxA1l;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dwCVWujb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m37si1891141ywh.674.2017.12.08.15.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 15:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=bO4jxA1l;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dwCVWujb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNRlv-00062j-Bn
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 18:09:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eNRln-00062P-LY
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 18:09:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eNRlk-0001Cx-AJ
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 18:09:27 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48843)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eNRlk-0001Bv-30; Fri, 08 Dec 2017 18:09:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id DF62C209A5;
	Fri,  8 Dec 2017 18:09:21 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 08 Dec 2017 18:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=RWICqgoZtVQHl9/mFM0zQov6k1m+ROgy+01RtoZcWO4=; b=bO4jx
	A1ll/nkzXHvRhuAayHLJQJltK50MiJa8yc9zzK0KuVAs8LLeVhTkfyExH7MB0UkW
	N4oMqqTKJYuRnNuhBx17eNS1dGwN3V9NvmhcVK+PHH/3m/UH511aaONxHPG3z4Nj
	VEqmGOktwvdoAikfcVvsAgkwz/XfnPQyFa9nrM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=RWICqgoZtVQHl9/mFM0zQov6k1m+R
	Ogy+01RtoZcWO4=; b=dwCVWujbDFIBMV0KAwqx2QtNqfX85Cr7j/qDjCyEq9Y8M
	QCZLlY6w3PKhzQQLPMMevnDS6Sx0Z6uiFZT+z5+jF/HLr0iGpvhaV3aeDXDrDB2Q
	SeBsCxlWJMpl0ShKhbWa5Mx1Vocm6p9RMhJlJMsuaz8v9Wb/5JohZJHyMxg1++yT
	FLUqP990sphoqAEmI4t5+R2fRxXcvdohtP9UFYI4vbqOTLwLDCnZ+6M+rRK83iuR
	WUt4OCV4Qm3lFiK+5iBZ0z+m+DXCc6NLPbEYukgF8kq23RaZZ6QOMd++6bzXaWGC
	lQhqthPeBCoz+sbP5iIyxKwEzJF5aRmeBotPoCctw==
X-ME-Sender: <xms:oRsrWqocvctkg3PBiNMSQaMLP2lF2aoBPhA-_j6JSGfyKjBmJbdMdQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id A07B724136;
	Fri,  8 Dec 2017 18:09:21 -0500 (EST)
Date: Fri, 8 Dec 2017 18:09:20 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171208230920.GA11462@flamenco>
References: <1507824216-29058-1-git-send-email-peter.maydell@linaro.org>
	<1507824216-29058-9-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507824216-29058-9-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.27
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 08/13] target/arm: Pull Thumb
 insn word loads up to top level
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9tyJVxXEvISF

On Thu, Oct 12, 2017 at 17:03:31 +0100, Peter Maydell wrote:
> Refactor the Thumb decode to do the loads of the instruction words at
> the top level rather than only loading the second half of a 32-bit
> Thumb insn in the middle of the decode.
> 
> This is simple apart from the awkward case of Thumb1, where the
> BL/BLX prefix and suffix instructions live in what in Thumb2 is the
> 32-bit insn space.  To handle these we decode enough to identify
> whether we're looking at a prefix/suffix that we handle as a 16 bit
> insn, or a prefix that we're going to merge with the following suffix
> to consider as a 32 bit insn.  The translation of the 16 bit cases
> then moves from disas_thumb2_insn() to disas_thumb_insn().
> 
> The refactoring has the benefit that we don't need to pass the
> CPUARMState* down into the decoder code any more, but the major
> reason for doing this is that some Thumb instructions must be always
> unconditional regardless of the IT state bits, so we need to know the
> whole insn before we emit the "skip this insn if the IT bits and cond
> state tell us to" code.  (The always unconditional insns are BKPT,
> HLT and SG; the last of these is 32 bits.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 1507556919-24992-7-git-send-email-peter.maydell@linaro.org

This commit breaks the debian-arm boot test (see [1]), boot dies at:

> random: systemd urandom read with 4 bits of entropy available
> systemd[1]: Caught <SEGV>, core dump failed.
> systemd[1]: Freezing execution.

Sorry I noticed this so late (-rc4), for a while I thought my development
was causing this and didn't pay much attention to it. However, just realised
the problem is present on master. Bisect log below.

Thanks,

		Emilio

[1] https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg04085.html

$ git bisect log
git bisect start
# bad: [2babfe0c9241c239272a03fec785165a50e8288c] Update version for v2.11.0-rc4 release
git bisect bad 2babfe0c9241c239272a03fec785165a50e8288c
# good: [1ab5eb4efb91a3d4569b0df6e824cc08ab4bd8ec] Update version for v2.10.0 release
git bisect good 1ab5eb4efb91a3d4569b0df6e824cc08ab4bd8ec
# good: [62a2554ec2630896d1299e1a282a64c7f3b00da0] 390x/css: introduce maximum data address checking
git bisect good 62a2554ec2630896d1299e1a282a64c7f3b00da0
# bad: [f51f315a676ec913a55ac27be4ef857f9f7ddc5c] translate-all: use qemu_protect_rwx/none helpers
git bisect bad f51f315a676ec913a55ac27be4ef857f9f7ddc5c
# bad: [9f99c85c4a364f8de8134eb53b0cc1b84ded4b3f] Merge remote-tracking branch 'remotes/gkurz/tags/for-upstream' into staging
git bisect bad 9f99c85c4a364f8de8134eb53b0cc1b84ded4b3f
# good: [3637cf58f9441ad277fd70299a29d0e39b32c96c] util: move qemu_real_host_page_size/mask to osdep.h
git bisect good 3637cf58f9441ad277fd70299a29d0e39b32c96c
# bad: [b81b948ecc8659d78066f374c787ed12379d21dd] virtio/pci/migration: Convert to VMState
git bisect bad b81b948ecc8659d78066f374c787ed12379d21dd
# good: [43851b5bd48d952561610d0d6d6c314c97eff543] iotests: Set up Python logging
git bisect good 43851b5bd48d952561610d0d6d6c314c97eff543
# bad: [76eff04d166b8fe747adbe82de8b7e060e668ff9] target/arm: Implement SG instruction corner cases
git bisect bad 76eff04d166b8fe747adbe82de8b7e060e668ff9
# good: [b9f587d62cebed427206539750ebf59bde4df422] target/arm: Add M profile secure MMU index values to get_a32_user_mem_index()
git bisect good b9f587d62cebed427206539750ebf59bde4df422
# good: [6b8acf256df09c8a8dd7dcaa79b06eaff4ad63f7] target-arm: Don't check for "Thumb2 or M profile" for not-Thumb1
git bisect good 6b8acf256df09c8a8dd7dcaa79b06eaff4ad63f7
# bad: [5b8d7289e9e92a0d7bcecb93cd189e245fef10cd] target-arm: Simplify insn_crosses_page()
git bisect bad 5b8d7289e9e92a0d7bcecb93cd189e245fef10cd
# bad: [296e5a0a6c393553079a641c50521ae33ff89324] target/arm: Pull Thumb insn word loads up to top level
git bisect bad 296e5a0a6c393553079a641c50521ae33ff89324
# first bad commit: [296e5a0a6c393553079a641c50521ae33ff89324] target/arm: Pull Thumb insn word loads up to top level
