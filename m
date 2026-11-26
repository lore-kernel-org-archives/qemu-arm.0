Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84069606A33A
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFeICVzz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWaVU-0002RR-Te; Thu, 26 Nov 2026 09:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.mehnert@gmail.com>)
 id 1xWaVM-0002MK-RA
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:31:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.mehnert@gmail.com>)
 id 1xWaVK-0004KR-IO
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:31:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so4084120f8f.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 06:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795703469; x=1796308269; darn=nongnu.org;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x7mAYOpYaNnHIqFtG2PaPdxGyXANXPd8ixtPFRZmIII=;
 b=sFeICVzzOlQa7ua3MvqlrwxoxBVUgnIuVr76FLEFvyx//CMPmxAfsiDEg+5gfReaOp
 StBF9bAaKqHQ58EkLhM3HNPfkt/aWwzsPnoEg5XC6jSSwB5sbk7PaF4hbb8Gfvepxoru
 97OOcgiPx1U1U+lZSDRm2jryHq5VZQxzmUdKC9T6pXYpCsHUiSQRv3M94u3Fm8/3o7A1
 jQvC9f3Oe6GgYoYdKCsI1GRmK/WatOyEkS36VZtb2LdRjcPttsWq+WNYQ9pdWsEKRPi0
 mrmrz4a9CgPs5LIkhxK46yrVW94j2Pl1tFTdrW4zZ/F0JfzYQegTT+DR4bNqyzQBf+8Z
 tV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703469; x=1796308269;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=x7mAYOpYaNnHIqFtG2PaPdxGyXANXPd8ixtPFRZmIII=;
 b=wn26WCSNUSRwE6roCtMkyx+tw8DR/OwhxgkbG4wmQMMkX6PzPX48uEZ/iWlXvyOWdS
 WKoB+44w4FQtl8giGVjV57GPSdwXJK2DfGfe/AovI34GaajPCnh67QfVrnIvImORj2qX
 gK7ph5g4L1BG6VXe+S4tKrHjS/b/As8ZMrgQ7XUYwLSrwEyj5K6N0BBWXWeuVkWmp7il
 ebXJj4WeH/PwLyspiy4EytIr3p/Cdh2nb1NPoHeTi2+PEjB6RSXTOmZlqpIwiJCzEV7Y
 holR6iac/VyDeJtOQYFgGQUcylR6FQ0BCtknP1fbJZPHnBXFVMjvImNeo7YTw+XaJ9SJ
 J69Q==
X-Forwarded-Encrypted: i=1;
 AL+hErGdJCkG3qi421hVLLlyq2jMBXIc8edTmk+mk9J/9siGfgLZKic10SiLNTLimyIJSWdwpcCrLABXnQ==@nongnu.org
X-Gm-Message-State: APuU4Z8fr/B++TnluO8woQR1xAMk9snMaf0pYeaBorW59PPFQek7Pa1+
 O8INBPIyksMVEyxjlSp9cQ3WjdnPu7ZsMLeUBlDGUtwX8Odsuj+FotSU
X-Gm-Gg: AZFdTZcd2oU95Z8I7zMUAANCBlfqTuTfShAhisFNK3KEpd/ALvcicRj9GBNCa7HJh2j
 A719cQNw6n2z9U+AYalzDnXcyZtQvX7bh+NtBPy4j+VSYIik7dcptRiII8qJheEHuXXZFqXGSZ3
 7ImfrVsCP/GcFFnoWUUW36Kin3DzgboZ/bpKcgP5bgt6ASV7WiYQutO5MP7V8MI6+n/y/EAo8l9
 hIy/1YXAduZ9rxefDV2qZnBaA6aVEWxULGSbf/r1hQohe27Nn9m+/UpKTTLnzhbxuRfk9r0isnZ
 PmBLu5c0SRReqIttQ8kcEz82t1Io+Om1iAleQz+hXDAAzHPK2sMLuOtGOrksIUMceH11fz2+5IN
 qkdZYHgX8aYGrliY2mVIvALs8h+0iPSU3qtHf4VLKHiauFdgmvFSKvqeSrmNQJu5GKnphEOtG9W
 miEyV9yNzuK//wqOF0ol9y1xbMs+ujJdSiftgJTYtXNVJw8+vdbpDH75Knhk9hityPeYsIVVphY
 Ei4kmieEo+CRBDpt8WpqoIAFOYmVV6ICoQkKDFrKhdo3xUaeSRvsoqasaRy00LfwyRlHPy/SMpP
 Yqam+zes+/Cyl7JRMGKJNmbOqeJJkrWRJo5yCEtspSG/o/wPgFLXfSrvZ8xHKm1SE1R1u+KIN0P
 +tlv4NKEMg465Aw1hggf0W6YuKP4oWKXP9g==
X-Received: by 2002:a05:6000:178f:b0:4bb:ac0e:51df with SMTP id
 ffacd0b85a97d-4bbac0e523cmr6068789f8f.43.1795703469133; 
 Thu, 26 Nov 2026 06:31:09 -0800 (PST)
Received: from noys4.localnet (ip-178-026-066-148.vkd85.pools.vodafone-ip.de.
 [178.26.66.148]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f281sm38608547f8f.22.2026.11.26.06.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:31:08 -0800 (PST)
From: Frank Mehnert <frank.mehnert@gmail.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH for-11.2] target/arm: set the event register on a failed
 store-exclusive
Date: Thu, 26 Nov 2026 15:31:07 +0100
Message-ID: <zvhsHwoFTq6p6L5AdIM1Eg@gmail.com>
In-Reply-To: <87wlpzu8cc.fsf@draig.linaro.org>
References: <20261125082126.49911-1-frank.mehnert@kernkonzept.com>
 <87wlpzu8cc.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=frank.mehnert@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alex,

On Donnerstag, 26. November 2026 12:42 Alex Benn=C3=A9e wrote:
> Frank Mehnert <frank.mehnert@gmail.com> writes:
> > [...]
> >
> > Fixes: 01b223f895a7 ("target/arm: enable WFE sleeping for A-profile")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4938
> > Signed-off-by: Frank Mehnert <frank.mehnert@kernkonzept.com>
>=20
> Looks good to me - is it possible to extend the wxft test case with a
> test case to exercise this common lock pattern?

Yes. I added a test case to tests/tcg/aarch64/system/wfxt.c and will
send it together with the fix as v2.

The test does not depend on a race between the CPUs. CPU 0 executes
LDAXR on the free lock, then CPU 1, started through PSCI CPU_ON, takes
the lock with a plain store. The following STXR of CPU 0 must fail,
and the WFE after it must complete at once, with interrupts masked and
without any SEV. Like the WFIT/WFET cases, the test uses the virtual
timer interrupt, 1s out, as a watchdog, so a WFE that misses the event
makes the test fail instead of hanging.

The test needs a second CPU, so wfxt.c now runs with -smp 2.

With the fix, the test passed in 80 of 80 runs, with both
multi-threaded and single-threaded TCG, built with -O0 and -O2. With
the fix reverted, it failed in 20 of 20 runs: WFE woke only on the
timer interrupt after 1s.

> For the fix though:
>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> > [...]

I've added your Reviewed-by to the fix.

Thanks!

=46rank



