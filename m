Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE2B606CF9B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KmRUTxLn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOzvv-0004wV-Iq; Thu, 05 Nov 2026 11:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzvt-0004us-Vy
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:03:22 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xOzvq-0004ko-0p
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 11:03:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4919a880834so463641f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 08:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894596; x=1794499396; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=N5DmdGU+ZWv8SGaih6vanAq6ZBwv7XcwhCv2CEvK9Mg=;
 b=KmRUTxLnL9hSNmktzSnyxoh2yF7VT+GnsUqTdj0TKGnTurLF01S4Phim3AX5S+tlx9
 p0uPOYquGSsJbpvu/3zvM0EqxWra3yMoPJDY+J4ff4j2rK3wu8NHpGR2UabGxZ1ed+4t
 47KGJV+7snIn+GEvufgSyPEIU+9hgSberBCd5kLXbYKlm7nBxFsKEErJbjOop0tEA9P9
 shNj1DpRVx/BjLoUomdTbrVR+9zODCiQwMJ3PwE69YPcg5Fzl0RdYVPCCI2Z/Zpw5RZh
 3UilUYqcW3quhgjDleubZyYnNq3u26L2ABmop0iy8BXe4K63ktXpcvuZ02nhp1wrYIRd
 aGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894596; x=1794499396;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N5DmdGU+ZWv8SGaih6vanAq6ZBwv7XcwhCv2CEvK9Mg=;
 b=Kx802EbLSVPoozc0WT1qdHSrdPKqpEj+egifPJelqmMHFx54dE3RfLbJeiymCSYZCD
 JRAMJKC5Ht5Zqsfi85QjwTyLCckBYRVFiGOtQCJUSb0hOAMRtU5OKm8VAAje3DShokct
 Rygx/dXKrPCMkoUyuOriHpt7KZwCh19u5q4koXTN5lWEghbhX4Lx4Y/nGv/0jkUSqClE
 3px8DuOxXeypN+HMGcU59nNf4yUxZtbJPTIX42I1FoAkpIb77vfGJOLkhYVQzmdLgvJQ
 RBZ16ZILeei5QO4exEaU31VhG42wfY0Q8faWTnfhTNiOe6hv1rq1atowYBdDMMk/R7iV
 3ulA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzchBbk9C0AT2CORma41XsHWAFPqgSqqqYS2OIUFUXXxXo8vw2Nry1vyErqY/isCiRXCXItu3is8A==@nongnu.org
X-Gm-Message-State: APuU4Z+u7ayQcDD+ODPdc0QPNGdGIYV2acKvZ/ACoukEmQ+iZqipBExm
 Xo4M50wtXTqLlXTlhCmHxolSos/jkKgipoM5TGCZF6Zay9GBWLMXV3AFyz9/AVICo6E=
X-Gm-Gg: AYBFou2jYLnSih5XM5RJ89rfkAm1BK/In1zBXnXME/JPAafoNmrrdtthSS1ouql7RbF
 PN+/9q5Rd3yYcfdOqKyJKAZggfx9xvjEOmnNaPSAY9bC1vRrEdbydPayYlVEafH5KNutCVwCYcw
 HzvH6maRWu2GXMOs4SxrRpV6dwhap7q/EMGBaNVaN1XsrBLcS6vonbn1PzLXa5B0TyfGT3lNPku
 qesFisRAwf97cvYYsIvVoQG8psODY/ujfAMdYrt+wN05LRwyFSi2hzDxgVRXJaHMDNIoDmJKGvv
 EP+/Fg79T/9TQ8/xQeif1k67v7xR6xSlFNKDjq+SKHCHvJjaXf0/lCWsSf9sKAVhxv1RYFDa35j
 gmLjhCBkXDOM5sJfriPaZiukeg09IvpJNadBEc3bzjcjpRBbzvLh2PBeXI40cVd/nevtC30VUzj
 LyYYM31xUWBcWnoVJ3xiLZFsywMEtSVXpyvCkSOoJOwsw9/HLt9dUA791NXncKIeG7InvWsby7u
 ar3mo1aWE+WYoat0EV0gVypcltjLXqvIMMLHkDw3ASiaeaCz5t24X5chwGGG1wU7c/clU+U8qbE
 cL19oh+m4VdOsTo8EmJ8GOudwQaN
X-Received: by 2002:a5d:5d13:0:b0:48e:6f84:2e8e with SMTP id
 ffacd0b85a97d-49275eeefc2mr61877f8f.39.1793894595150; 
 Thu, 05 Nov 2026 08:03:15 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fecac2772sm10277010f8f.18.2026.11.05.08.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:03:14 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6BD985F8AF;
 Thu, 05 Nov 2026 16:03:13 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Michael
 Roth <michael.roth@amd.com>
Subject: Re: [PATCH v2 03/17] tests/unit/qobject: Replace deprecated
 sprintf() with g_strdup_printf()
In-Reply-To: <20261105125203.40320-4-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:48
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-4-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:03:13 +0000
Message-ID: <87eccz6zb2.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer g_strdup_printf() to avoid
> when using Apple clang 17.0.0 on macOS ARM64:
>
>   ../tests/unit/test-qobject-output-visitor.c:598:9: warning: 'sprintf' i=
s deprecated [-Wdeprecated-declarations]
>   ../tests/unit/test-qobject-input-visitor.c:600:9: warning: 'sprintf' is=
 deprecated [-Wdeprecated-declarations]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

