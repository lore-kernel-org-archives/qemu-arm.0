Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048E2F4368A
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 10:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDgGA-0007i7-Fj; Fri, 17 Apr 2026 06:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDgG8-0007hJ-KD
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 06:17:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDgG6-0001Y0-8A
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 06:17:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so4020275e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776421028; x=1777025828; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1Au4VXp5HGXPE7mfkFPmEAGjjhqXU7oh6A12OK6f/o=;
 b=fDm/VjDNMjpvf5Ue7gf43NKb+kuV7uyiSgTDBlsntgfok6SqsXqnnNEZqMUcgtMLNI
 1EGrhOALEsuG9yXU5M/NREGOUddtw4iLPM7ABCCFjnLWROn9cfzDCo7d7syhc+iF4bAf
 R4MrJgULuOmYNHeOcmj2iKMQEkvsWbfYo+vL8SffyAjxg8186ejzwt2tofev7JGO1gd6
 Rl7PE0vov9LK6O8KujfDe0Xre2y4L94AtweFuSsAtNAD+XI2DfBZN+OFXXFOCCXjxcuc
 hz487p3V2w2FTll2f1Q/PLWWj6T5cTKxi6On1tm0p/6MTCBUEsqXjn2iKaUGbUBgAxF/
 F3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776421028; x=1777025828;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a1Au4VXp5HGXPE7mfkFPmEAGjjhqXU7oh6A12OK6f/o=;
 b=KZNWy3NXqd4sYXJZYE6Uh4E+tjut5cQcnnqnStJqIVWJADUXlRXhstlgoHUHUH8LZT
 Avkp1DjDWRmot6AKTrGgRh20Ir7ARhsQJIiIgb06u8/qqBryvaID5hh+ggSMr0FhsD1b
 KzTz1KDqPNZwfkftnu9GHbrAsgjVxT6/PWwnfu2tl6w2sfAj1OyOSZXORXKiuX3ro/OU
 Q/629GUNeCGY2PYli8eUH+GrSVt4E4Sy3fjOhI1/8szBHqXAwZU1LfayxiHvd/qzxCdX
 go49NCUM2h2acaVzPZGCShw2C+JPOOd2L5jp6ruR3sPoQXd+nMRjVEjJGzygbYUsTIwu
 XRBw==
X-Gm-Message-State: AOJu0Yx7+NPUiCer0Z6rbw/EvjM6qZrWxx3lO56ozST6LYrIz4rJj9uR
 21d4VSS6qymzdnvbBekppqwwXqRz2qr5ta++qcKq76B21IDK1AR8F7xVHudciFrfrv0=
X-Gm-Gg: AeBDiesk1cLw+6TAwdJF41+1u9U3qZUcV01mt9AuHEioHpk7D2fRFnlFyTEyfiDB4V4
 swcnpSvD1sYFs8kDTun5R4llBrAbN3UpUbdqsns9AstrgXq+AFx24RzJM1P1gpYDEHTrCdDyQFu
 b/T/VOzm+I4C1asg5bBGTwUd0FkH4n0kwMacq1T6jtt+7QRk+7VCCrPrPeaa2voLqvRiFZvH1b8
 TjZM4+9fBKbbdImmPSmcU2fFOYIagljSdBgFIhLpROIj0baqgGPFdviJTNP6g4j/MtIs3k+HAHm
 3lRUyjvnZzuJg3H+TkcN3tNcuLVf5N5zR/t55UC1u1cQ+6d24iQnizHnyI26mjhyB3feI+1Z9fl
 /CrbZi/MdwUcTAoygX2mqwaxSuRDKnxJoH+mPwoB/I4JEdVb2Is71QQhXZjORHRGEsPhghHNxQP
 x5OeilfcjpIA6L7y2JV81iYXzg+FSO52B3wQ==
X-Received: by 2002:a05:600c:c09c:b0:485:3989:b3e4 with SMTP id
 5b1f17b1804b1-488fb88c647mr20342775e9.6.1776421027680; 
 Fri, 17 Apr 2026 03:17:07 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc16f784sm29200475e9.1.2026.04.17.03.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 03:17:07 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4A04B5F94F;
 Fri, 17 Apr 2026 11:17:06 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>
Subject: Re: [PATCH] hw/arm, hw/ppc: Remove unnecessary audio.h includes
 from board code
In-Reply-To: <20260417093805.1076954-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 17 Apr 2026 10:38:05 +0100")
References: <20260417093805.1076954-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.1-pre2; emacs 30.1
Date: Fri, 17 Apr 2026 11:17:06 +0100
Message-ID: <87fr4tsxgd.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> Some boards (mostly arm, but also ppc/prep) include audio.h, but they
> don't need anything from it.  Drop the unnecessary include lines.
>
> These seem to have been introduced with commits 2b16397264a8e,
> b8ab0303de, which added the machine-default audiodev handling, but as
> far as I can tell they were unecessary right from the start, as the
> machine_add_audiodev_property() function has always been in boards.h.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

