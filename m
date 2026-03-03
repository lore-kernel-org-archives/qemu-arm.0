Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB99EC0480
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:00:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMYP-0005Oh-OR; Tue, 03 Mar 2026 05:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMYB-0005Mx-Jr
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:00:24 -0500
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxMY9-0003HH-MA
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:00:22 -0500
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64ae2ce2fe1so4572580d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772532020; cv=none;
 d=google.com; s=arc-20240605;
 b=kcdmXdcCtERnHOZ74qnKaCh+4JrBPhZfK/BcTVUoLFmd6ZzY00aK6tsraXkA5MXH7T
 DHTxWn4ifB/JBFpG0b3zItTRrfAVTFX5xT831nTTezuTK+bgyhqcII/3nQ4lTlEIqkNL
 PMfnR1N+hkY7gUS2Ibw7r08bryMiTZjvVfAziLjm+QHsEeaRHnTqpfMcqPptn0xOzBlS
 9UBSLaRlxmF7Fk7ssV3OQNqVx8EqBUwG8VswBxeIgi6aEP+4zrVURbbYhkvEBX2rTCSG
 3+f8V54wC+Wgso38OZbiFkS+28K+AS9kRFEvzY+jcCaI02h3pxpcSXqK/ERr12LI0p+d
 dz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TQeFmCX85bi5y1R+miWM7liTulJFb/kn+hPKR62QfeM=;
 fh=yup6GyPlBmeMNoWc+m+4X9HGUHyFsG7pQbdGFu3PK+g=;
 b=Y9FqHD9FHJJzJIxTDCgKK+O9ot9JsYPSY9GRhxDcKxs/t4VW1KKk5dNuPL4ZXG7Tf9
 bOT1/VMDXYMjCk02wi1X1a7aJh9Cd9H8+fdiUgGuu9wr/sOjOS+2cw47bn04k2artAzh
 62G2hN0vCFq/BvktunLKTDgiQHUgibtEA2OPtNpwZkdNguyMTLDYa8tOa6BgqMTFEjeM
 /yLdylehUV+3XyltTKrX0HXqzBy1x7wYcyl3U9ma+pwtrD+5xlnNml3mjtCfTUdZVFX5
 lJOijeAeQJ7Nt3poprmXRgJkJBj9g7WwBVhF6Ot+kOyRi6rBjS22fPFZbMO404vsNLXZ
 JhJQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772532020; x=1773136820; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TQeFmCX85bi5y1R+miWM7liTulJFb/kn+hPKR62QfeM=;
 b=KGsxNfj6h085qHElAWcyadcmU+TEnsJGIk4WmFB5Iu0KF9tMA4cYWx2j6+Rh8SU58s
 KXpRGw+os6B5gMidYdJbvMfdKdGavuhsikypUyqSjPVxl0FADvmjexHz3cYMfcMtDssS
 F/lmvVPKa3MCYRJQiExi7yKhEtNdav7OB1bhE9Xg055IKVNsWW2Guc4rSn8bSXPfryWj
 b60XOW6xSJ5LxWGpRGzdIAWxSv/oexYVaigJKdKEg5SXXE/HseqIa92wEsUFWrZjA9Uc
 48NhrsIIrjco10Cej/j9TpFeYIj7EUJcWAFgeslmFwcqnTZw2paT8WonlG5QOLKFsl8H
 ytVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532020; x=1773136820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQeFmCX85bi5y1R+miWM7liTulJFb/kn+hPKR62QfeM=;
 b=w9TSb4EfsMxGu5G/M3gSGvqPyYc5RlqmJ3XO1yzI/vV1w1o0htlDQo6YeqbaC0QqEc
 VtuyXWrcYgQ2MzRTRnN0ocPHFDp3Yw1JakDAUbhnEYe23BIjx0oG23Jhud6+9SqTA3FN
 Wq+DfFxhHF+mHAe3EIiEKGXcRfy81HdIQ+jxknS5CHK7La9vIRoeaDWdX8dnbTU5z3tS
 sJKmJ48CiE7nXQSJOp0+7gRr3F3X0Lm9QGRLF2YxBQd7T1E8dWOfl+pgE+/QrKHPSuoC
 fGfrVH3PVMstZ86c5lBOaPgVyENuPDvSw8dnPfk4bSJj1SlY6sUz5JZDEvCZA+PcBn7Q
 e1qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs0BkCSxMxVRFtCOY9ixjLS1ZQitPeNcFCjNOPuWkg/X8B/TspvYTLqmvzuJzjzp9j37lZpK9Gpg==@nongnu.org
X-Gm-Message-State: AOJu0YxpyhQqvLZq2ow75ekNdr7zSlck4+WwPwEVT3fzJD+UNKEKa04p
 SM/D4O31Cm9cGZSSFrxY8RGovKiyyLdiXIdrb78dLdqm6IQ1Tijz6BgDAGjrBFTTidY4Xxwi87C
 zcQAQ7esMg/8hWHkF0HqfNrHbqYQIRYBqffIb7/aQfg==
X-Gm-Gg: ATEYQzzPl1swrbvu8TKlabt4tj8me8gB/dOceykQClYTNRAp52Dc4p6EvMR81jDQ4q9
 1PjJ29+PK90eQ1p9mf7w2hBM/CBm9qo5gJzAj7u2kA2JHNdk9sJNf3sHx8rvHv8BRKkeg10OZmu
 FIR30ZLkwJQvB1rC936afq8h/Ms5q/3fhTtC92QGjzPV1ipNoeql9JdhwSRmy0CprKbe3VIoSJe
 eeTgGiZ+dE+yMzXhl/1giPelpr7ZMe4ml5enAsxo73hR16zICTVwKCk/nE+qATU/UFw70reJmuU
 bBo1htJF2PTZpEDgnxyHS0Ycnh7MYtPvf0Nm1jEWNgAH/n4ce8T3EfsxJA5ppnSH2e1ItxF3dfX
 noA==
X-Received: by 2002:a53:d745:0:b0:64c:aa01:55ac with SMTP id
 956f58d0204a3-64cc20caafdmr9247295d50.24.1772532020113; Tue, 03 Mar 2026
 02:00:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-8s+fryKmgU7U=B4Roh4YsQYdWr005Q4opNd-fN3LoQw@mail.gmail.com>
 <20260226105826.30481-1-thuth@redhat.com>
In-Reply-To: <20260226105826.30481-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:00:08 +0000
X-Gm-Features: AaiRm52kkOCFsE2uRP3lkftDHAuXLvgHWjsX7OJ0l-VGpLCXKSIvoXCQKtQaUcg
Message-ID: <CAFEAcA_MMjrEeH3FknE+q-L7ZVZ3iXTMb4fkes=nY2BVnHtfkA@mail.gmail.com>
Subject: Re: [PATCH 2/1] hw/net: Remove the xgmac device
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 26 Feb 2026 at 10:58, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The xgmac device was only used by the highbank machine that just
> has been removed. Being a sysbus device that cannot be instantiated
> by the user, this is dead code now and thus can be removed, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

