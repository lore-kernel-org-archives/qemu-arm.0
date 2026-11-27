Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5834606A31E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xPh4W5Ku
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWytA-0003C4-6o; Fri, 27 Nov 2026 11:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWyt5-00039f-BU
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:33:28 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWyt3-0008IK-CH
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:33:27 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-67db23d8892so8820802d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 08:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797204; cv=none;
 d=google.com; s=arc-20260327;
 b=BXtF4SW+yzFlg8flLeNJLXMn3wMNaHeZHFPPyIuLWBWklzUg+fXI6QvMzulzsaQjWs
 Gc0dxzdm4nTi1l8ZY0fBFhEFF+W1UxyktxHNcea7ufeEjp2v11E5hAgKYt8W/x8o0Heg
 mSsrPRUsoKXMQEEmiXwxcvVBqoelPjRpRJmK5GH/wE5bH6wI+esoRbNiIx2hqQLvsPxE
 vg7jYw5Ho0ITC1/IR0iloKof7sjBFpon0tfUbw+l/hiR8fIlyNT5RGrKTN/cXJNcgG/w
 aJa3v8sDXlJHT+QCV6MgqnyPwbY/gLGYNIKweLBSuZ2hC+EmmrwKJBPukAsbHdHismsZ
 UIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iluEXWYLL8WenezfR5PfG2NcJ+qFJ8RrrrOgkSCrR/Q=;
 fh=in6vzYeMslfKU0S8pfuUwhwWIZ5305izdscdJ2cQ+Do=;
 b=PQeclbi3Sj2UgUhQkjVdQjoKVL6wtqS0snyyRqKy8hsUXqzGZrc/TbUeO8AGbS0+EY
 zaz+QAVi4xUViV9+XWJ/m8OQJOQSY/qeXqVEV5QoIl8T6ixk4Y+ET5r2CQnd7y0UsQkf
 YYHKVqwhKvWYlhBK96tQrilFooI5IfQ5Mg3IHu3BDZXPNn6SEUZNRp4J4Xh+rRvQjGMD
 M3KFa52yzjSuwouhJ5vV6KzX4kIx8WdE8reqAhjZqZ1CvQRvtfJMiI5FPyWoeEpHnIU5
 z9nP2cRsiHeUg8onQHIhS/I4sAkFfh/YHq+GVPzYOLhF8rRT0djP5hceN6RoiaDT5CIr
 w/Lw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795797204; x=1796402004; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iluEXWYLL8WenezfR5PfG2NcJ+qFJ8RrrrOgkSCrR/Q=;
 b=xPh4W5KuPJjX6K4uPJxEroVEPL5ISQTRcbmAXucVWMszFVN70zL6vponmsaT5YtlX5
 m72dGN9f5LMFlVSwhUw1HTq6Dr59/PKS4qBxNiIEE5dlQZNprCazj4HaLaO2H7WtP28l
 FNRJgKN69Iyax1Z8EUiskh7f0azKN8fNGvrnzcGq1WU7bKD8+4Gzih4ISL7Qrmx95EzC
 mF0k/sbbWtcsbRvy4fcKGGGz5WG8WeWFelNoNhdDTPv2ZY6/8SM7NLPofzWFYhdfKBIT
 k6Yw22M9HkVTfZGK/AiClaUQsAqUjkvGZrXAztPccFS6LtTSDgK78U5++qKH342AAtVu
 gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795797204; x=1796402004;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iluEXWYLL8WenezfR5PfG2NcJ+qFJ8RrrrOgkSCrR/Q=;
 b=ESDsN3ni3spJ+4671ZnJ2HiR51QUQGfAvgy4txbjkHXCH88A4EuFWcgLSTGEbn/H5k
 N4NdL+CcuA9TmyahmAgvnbyWPa4RYMy4zJDwIda16d44RFi4TnXqM/lKbqL633ubXcoR
 2js9ZnBmQbrIGHx67auLnvZuJst/41s5F4d40IVRt061XdTikGGRqCAV2qq9oda09Vwk
 V2TJITlGl7JYl8GPO84cnX6Ud3vcUAAwAyMGxxYaPbcEfuzS4egFwdTgrerci63HH8DL
 a1e5ALplyhBAaHptVNzC+3oXYid6BcNHK22X1SGFr3floMZe6jU3c3ePJ+s7+b9w7HIV
 3F4g==
X-Forwarded-Encrypted: i=1;
 AL+hErH1cLPJizIgmENaDGzOdU4d8KdqHv0/4JbxnbYZ1nB8Otk6gpQKBvxv3pOkvBcCQwcRsmP+HKVJEA==@nongnu.org
X-Gm-Message-State: APuU4Z+jWvy46cDEBJqT8LIFi/BDsNmJicW4o5B5JZbhFS0oRFIeMJfi
 Klv7KZXEWHWaU98ft4PxloP9T2WUt7Ip+GQHw59IYuM6qJCmQGUbzTIOa9l5z12Hz/qoZO7D6v2
 +sGQ/NLn4Bsj+fyC8E1JapB7diReaozTWr6CnwpZtUQ==
X-Gm-Gg: AZFdTZeznWG1Jz7+GLlwtpEu6n1jXlGdPaAYEUNsQZFBskCobb6jap7uuvNDAwurGOC
 btERA0+JBgwxfKTVFHfeYA8krFqD1EmJSH5E9GJo3y12A/+eiYk1w6kM3fSse+wvSk0aEAWLpIx
 ZSO1blwL7jpiW4qX29PCFr6YsRYFC+38TqCOfVIJJd0djWUOwUvshMY9bjWtVg1ssa1NZOgcECV
 zJu79Vtcj09Wzcl9jOre8O2ByQ4uKBqeC2vA7r4euW5PQQci+m9H4Jct4jUcD28aPKuTvqW3KB1
 MFFdlHIfdYh0IYb2IQwh7jddd9wRXWHujxbcitCin+7gfiY7i/sIOKnU3EJnTgp8AgHBrmBoRHn
 hU/KpRhNfdSsAxaipta1pF0hWBNXZfHOA2ckv9h1Oe2ihiGkUpmq7NMo5mlUtj9vRovWI5m8CYn
 pVnwEQr7A67YnvlJe7DK4p
X-Received: by 2002:a05:690e:144f:b0:67d:f32c:3bd9 with SMTP id
 956f58d0204a3-67df43f4b0dmr13002951d50.21.1795797197294; Fri, 27 Nov 2026
 08:33:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030194318.319310-1-richard.henderson@linaro.org>
 <20261030194318.319310-5-richard.henderson@linaro.org>
In-Reply-To: <20261030194318.319310-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 16:33:06 +0000
X-Gm-Features: Aa3M54pN8hijM6stuWJcMfe5HNCoFM0070__Fewu911fHDSwdmHE1U2U3wnJm5w
Message-ID: <CAFEAcA-tJRerH0x+LZjMWzX2pYLijaz3nn4+txBnOmVS5GnQ_g@mail.gmail.com>
Subject: Re: [PATCH 4/9] target/arm: Split out gen_goto_tb_int
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 38 ++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

