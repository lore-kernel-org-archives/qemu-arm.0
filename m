Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021F6FA3726
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Jan 2026 11:21:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vbdDw-0004RK-Qe; Fri, 02 Jan 2026 06:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vbdDv-0004QC-Cf
 for qemu-arm@nongnu.org; Fri, 02 Jan 2026 06:21:39 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vbdDt-00079g-LS
 for qemu-arm@nongnu.org; Fri, 02 Jan 2026 06:21:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso96267025e9.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jan 2026 03:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767352895; x=1767957695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFVKHmnkxQ3qobL3YmMQOytbDJSp9SIKyMZ9YJQ6t3U=;
 b=xue0EDo5KRWc+GRwVFz8b0viM/4/MRRthaIteGCuLsZEXKr0dBZXZAM34Uq6n7I0vs
 M2drXBm5sRUAwUzl2kSiSRWxKmtaCV4V7CAD8Fx2rtrsbNJOX6RN3y+qdJsA195652y1
 nt+lW6vG5NSh0Qmzs7kr5IcFd9gWc9ZYUp4XKAr5VfcMssFfD6AVH6Rtct2e3SjoH4my
 aq/p2WluxD8h3EyZJ9+ECev+uF+ekC3IsjbZvOG+D1Ykg2iepp9zYFpgvzN26BLdd3bM
 2p6PIGyPh9dyTFiqMZoVOC3QmikEdLWiRZSgSr2hSCwFpJP991wFzCl9riJaX+WqExg1
 EiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767352895; x=1767957695;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tFVKHmnkxQ3qobL3YmMQOytbDJSp9SIKyMZ9YJQ6t3U=;
 b=m22J2s+hcWrkb3Txk4HxmMdf3CYVbrBZJ9r3sr96tEc0QgfXr9pjUgy07xV8ZmXqzr
 kCeSOUVwiNHYilIMcYipvdw0tTxk0MpLGl1fNJBxRImfQq/nGu3acGJcAUdI0XrUMwz9
 2Jjbx58yPuYs0kyk9hJfdN8E1OtZee6IdMSOILJwv0jS9WqS+J3BHbJkKTYV28FpKra0
 AhQhWK/zIIPTOmOsE9CizXpyS/O77oJfO+fPWqvdJAlfUo39+fBimsWpvaij3WdryfaY
 GdGOst23LCtb0ONy3koXWQizOsytFUgI6B+Oh2+AkKVFAjqWTWjBqWEGPnS2Yru9i4G4
 k6fg==
X-Gm-Message-State: AOJu0YwQL/nAbGVpk16QA/Iu56rgZ4etz+YnfQLf1tgjpZYBe9Ojlhgm
 Aia0YczfvFEKFSkDOGyLhRUyGHM4g2tIfUFpdNx9ARp3NL5w9qwWyKW8SG0+TJJamb4=
X-Gm-Gg: AY/fxX58nEOURAVB0ZgRHyAwUEGNm2rEJ9F2xKFgi5v2dBIYqfpOGrbf0lvk+IvVmQg
 BH+4umZGXRD6sNfIP08Aj1AwJPc4d2DMVqPvEUmkYIg73RTdZ4vTlpKb6+tuLiIohVvkzz43zA9
 ZEm6EP1l0Ro7jNTe0LpgpLRL18xYhsIKvJJHJj2lrr0PfP5J+A0r3Kohkulf368OeuIUZkFsxVU
 e4Dcz3nZ9Zgqwstu+rrsHnMqjZK8bFEcQGAoVLm9bl31DerbtxSEO7IDMvHuHYpIpm86z6fTfAK
 zeUfk9rZxFaWdY3NXzNSRnmr57Bw2ARBtoVFrCwZNfrSJjNEJRiZkeAu2FtYrEEleSXjig5RkWQ
 V5ufgE8ZswCNRASdI5o/mfVCOc06gb5UR+WwBSWFhqKPJ/abBYYiZfq1ztViq0zHd+b4FqxyFN0
 ABnNuN3M5szoc=
X-Google-Smtp-Source: AGHT+IHvaQpeidF9CMkkjwowToaK3zs/8Qn3f70gynWYBZtldegcjyK+vMk3LfHKaXZ895JpWAbKGw==
X-Received: by 2002:a05:600d:486:10b0:47d:333d:868a with SMTP id
 5b1f17b1804b1-47d333d86c2mr318702825e9.33.1767352895490; 
 Fri, 02 Jan 2026 03:21:35 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa2bdfsm85127062f8f.32.2026.01.02.03.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 03:21:34 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 25AE25F7FE;
 Fri, 02 Jan 2026 11:21:34 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH 4/4] target/arm: Rename access_aa64_tid5() to access_tid5()
In-Reply-To: <20251231170858.254594-5-peter.maydell@linaro.org> (Peter
 Maydell's message of "Wed, 31 Dec 2025 17:08:58 +0000")
References: <20251231170858.254594-1-peter.maydell@linaro.org>
 <20251231170858.254594-5-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.14; emacs 30.1
Date: Fri, 02 Jan 2026 11:21:34 +0000
Message-ID: <87o6ncw98h.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

> There is no equivalent access_aa32_tid5() (HCR_EL2.TID5 only exists
> starting from v8); rename access_aa64_tid5() to access_tid5() to line
> up with the naming we now have for the TID1 and TID3 check functions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

