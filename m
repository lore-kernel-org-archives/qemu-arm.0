Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5042704wrt;
        Tue, 5 Feb 2019 09:57:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IboVwGvGPB4wZ3zTsov6NMs+W+lPIBcF/38OIFzOjF5kDzAV/0p2OIqDEOifZjkZbQgJK5/
X-Received: by 2002:a81:1b44:: with SMTP id b65mr5076287ywb.393.1549389434175;
        Tue, 05 Feb 2019 09:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389434; cv=none;
        d=google.com; s=arc-20160816;
        b=TysQ1JrajL5MlMn6mMU3MGHr0m2oowPHxHkwm7h2aBCvTEFwxkcwjobH1W1RozLYPX
         lutb2ZC2mV+Syf3olIg/j6zELVL1GffMXMRP57/7lUupqqOw0mvLIOfOP/w57mo9OCkj
         ffo0H2Q5vXUamsiAqKo82+90nLyF1hTDZ6NvBK8KdOagDjunvGmGBxq+JDvL32TnQvD6
         MWLR8gyW6qreoIWiKQ3oz7Z7Q2/FwFMc//1xp5pOQ1uNFYbIGHrI0b7d4dddZDKKM8ry
         Nnv09E/9Sq8zYBnR0eQKAHBzFELv1CTKt+WY08ua1bmV17X+RAlbLbBfvzuZ3whHWqiO
         ZJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=GOSTi3s19iCszsGsZE7h9KTjRXOOszpIVlataz1Uw1Q=;
        b=KvkRwclSonHRtieWV+6HP2L+S6EGZZK9lX/DqG4v+myYOn9TJNQB1/FGmTt3DcUz2m
         1dgdv/Ob7xZaEyvsvgfBUd8+UK5f/fgnnho6e4PI/+GwC1BOemw3dr2kWiHOBaiiNNAR
         B+zP4rQEKQOw85Aplo7kYkkTZ5fxXcl8iwwjySV9XGHJxnT6Df6/KcafMgJ+FJvtVeKy
         F/dTj7v8PodsQcmuddCo8dCD8dRRAeoVizb53uO/RBE7QnFUQaBwc+NAninbewbbscqg
         kk0vxi+ikcVoj4GlOdQcPQl+yzQK4imGe8X6X9xwsCL+8tWKvw9xCn95c8Obym3TyTj+
         b2YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sAbT9zfH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si13149ywm.10.2019.02.05.09.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 09:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sAbT9zfH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:36044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr4y9-0001tm-JP
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 12:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gr4bl-0000J3-C0
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gr4bk-0004Nm-OR
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:05 -0500
Received: from mail-it1-x135.google.com ([2607:f8b0:4864:20::135]:36975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1gr4bg-0004Jx-SI; Tue, 05 Feb 2019 12:34:01 -0500
Received: by mail-it1-x135.google.com with SMTP id b5so10294078iti.2;
	Tue, 05 Feb 2019 09:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GOSTi3s19iCszsGsZE7h9KTjRXOOszpIVlataz1Uw1Q=;
	b=sAbT9zfHbnzb/bRe+qn7TBIQeLN9qGZihEmD/suFm6mhg2wmlVC6bKl0CHzwqbLF0h
	/plR9DrxUO6nmZL19QsykCQXtDcDYmTBeQHIuCjZARDej8JjfLattc2vU+6ZBZwNgQTi
	pJrUetzopduZ3O5yEzFMpRDtSJGWg5EpJyq6tT0Sl04yjiFu42Sc8AosNMgYVbLDiV0f
	sKAsC2+wOaKmpQ/Yh9SHdj9Q/NF+Ce3XO+RIw6j0g5I6Yk6EMIGD9C9QO9RDxbiSjava
	UNg6FLg+16ddKHmxLIQkqM6FNppoJ8AyBd7sbjpgQx8+Il4hd1q6MV2yD+7/AD8yhaPd
	wYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GOSTi3s19iCszsGsZE7h9KTjRXOOszpIVlataz1Uw1Q=;
	b=oN3vz10SfUkr7NCXnWMdlyaX1hijCYmiPNezwE7mvTVjmtALrRgNw4S4K+MSgJWzjt
	d4AUHTlFYtcyH8ITg0LsHGaZI/Cc/haAuOzek+Wai60zDaqstf25mbjuvdDwKAcIy8rT
	o9sZFOtnyihejc1UVQkRn6SroDMDckTbTT+qDv3i6OOWljGD/cIOsF31NirGzB0nW+uT
	6L3QLB9TBp9div/6EEeMAtkaVuq486R1uft8tdX06i5RNXaR5jepnLnSpb5pKc7SE8MK
	KL4wVTfpycA7S4OFQA1x/+RUsDadYNcrfBddNlpWge5xK8MUu3vgoDcXrMThih9a4QAy
	/lwA==
X-Gm-Message-State: AHQUAuYk7rUorWU0twPCXZ7LRxLgpzISPg2redPzEHaakNiAwP/E8X3v
	goHZJePmb9JQ86j34oiANhJ1db0OXhTZaQBFp0k=
X-Received: by 2002:a05:660c:fd2:: with SMTP id
	m18mr3208084itn.1.1549388039282; 
	Tue, 05 Feb 2019 09:33:59 -0800 (PST)
MIME-Version: 1.0
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 5 Feb 2019 18:33:48 +0100
Message-ID: <CABoDooNUh3SnTEN2-3d2NJf6E9d1tTMcfxxAqdD1On-qR4dbjA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::135
Subject: [Qemu-devel] ARM: another round of missed undefined instructions
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4p8qkKRwaQEl

Hello,

here are some missed undefined instructions I skipped over last time
(I had forgotten to enable FP16 support in QEMU):

- disas_simd_across_lanes: for FP16 FMAX/FMINV/FMAXNMV/FMINNMV it
should be checked that bit 0 of the size field is 0

- disas_simd_mod_imm: FP16 FMOV imm must have bit 29 = 0

- disas_simd_scalar_pairwise: FP16 FMAXP/FADPP/... must have bit 0 of
the size field = 0

- disas_simd_three_reg_same_fp16: opcodes 5, b, c, d, 11, 19, 1b, 1f
are unallocated

- disas_simd_two_reg_misc_fp16: FRECPX is a scalar only instruction

- disas_simd_two_reg_misc_fp16: FABS/FNEG/FSQRT are vector only instructions

- disas_simd_two_reg_misc_fp16: the default clause should undef in the
first switch statement

- disas_simd_two_reg_misc_fp16:  FNEG should be removed from the scalar part.

Hopefully that's all that was left...

Thanks,

Laurent
