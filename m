Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C61CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 16:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVaf-0006i8-Nz; Mon, 11 Aug 2025 12:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ulVae-0006hm-S9
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 12:41:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ulVaZ-0005ic-2N
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 12:41:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so2854520f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754930490; x=1755535290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+R96KrOH16vksyVz9aEkmswyGFRcewKV/PmGhbDiths=;
 b=aRqoN69JhklJ/QH0mWjZQzjy66q5wmpfiNP5WzPiua8n9b1og9RLkk4K6XrS5Fhycm
 t9+QL4KKQuKUDj6gxWiK8d67eLg4d3bzAD5KgahOXxc4zYRFA67V4U+z4ljIoe5+rotm
 4ScN2IIIfUuHx4emERpQsWurImC7HDSg1ufp8h4vqC2dZAvvUi+OqVO+4uIRgHPEv83t
 o/Go2/KT7WkE0b+bjI6pbmmhS3c0p+eEthwpMsc354UvI7w4zQtTcRfP/Ir31bMF8HI+
 uHqYTZpJ2sgL2OIWt27uR1Wb79sSAlivD5Oish9YPqJPx74qTJbHKQusOCyBvZdI+C0f
 0Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754930490; x=1755535290;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+R96KrOH16vksyVz9aEkmswyGFRcewKV/PmGhbDiths=;
 b=jo1t7bhO4f/570rWON87gDOoeNkAmDBJKvO7IQVgM8en6yHIWnmwk89lx5nyAEM3ls
 J2JE+BQSDNWJTM4Vt9WM6MLiNhrFTK0KFchg6AtTCXzs1fOdoi5acoGO0DO26vt2KBzg
 2zXaAf7U0g/6hnYhKWHwVVjTQRSredumscAPX/IsbW9jl95FvCr8Os+NWi3aSRPKc47p
 1xs9cwf2Ae4T8fGhXuIuORYC+I0EC2hufxRclJ2Et2lxITTnwDvgKfYrO28/4/GG8E0U
 g4fpIkBARCk6ojglD6zpztgzaZPbyySzJuvpiB45+eD690R7gJuwIEUNznzCWivFvGN+
 6eqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWphbx/vqPtmLffMBaUz3qFP/qc21J/MfI1SYjGuKmN38jSa3B7NWyenPZ2cyWodBZDUmBmp9MQ2g==@nongnu.org
X-Gm-Message-State: AOJu0Yx0FwE3YAs+HRhq6A84UTTGwCx6+PIvrmLK9MMuUBxSQYDeuTsM
 sF7AcRy+iyjOltgNHZ8umGxOKTlkmTIcyV5dxXUqcG3o2ItFWNPfYMMuzONbB76FFs4=
X-Gm-Gg: ASbGncvXqx7gWgG7aX+oX4K989J4UJTXQZku9vimE1E2ggu/fUWAuQL979zuzRgv+6s
 MUZO3MEkV9PNRr/ZdG+8ViKShvm8WWibDwEP2r9SixCB+J6GGlRzaiiPTrPoblvDZ5BXHSQ24ks
 n3CvKDPyVLpTkZ1R3SGrWdjLJuOMGZBIE0elO8JF4817ooMJFSKw6GiWLKrcZ5BzXcJNG5e7r8B
 dMDy99NknDW0ZX3bQZS7qg2MzqfmgugAlI41m0PJ6n1jq1IX2glIQUxk1yWG3KXCEAvPYqy+EUq
 QyI4ObVSOyhVfKSkGbtQZUuEDLdrO5NXnUTqO1vBOjkv/dhwMOYrIuUyiBxhYffzJdeIZYq6zqw
 ni2p+SwRgp02UidFFDiCgVhm9KgUSAskJXg==
X-Google-Smtp-Source: AGHT+IGv4ch0oEWFhZfrj8m41lr6tZRolkhgDV38Qpiaxnb/z90I0KzM8PR7u1YrR1GximgWiwG4cQ==
X-Received: by 2002:a05:6000:2404:b0:3b7:9c79:32be with SMTP id
 ffacd0b85a97d-3b911010e23mr352744f8f.45.1754930489874; 
 Mon, 11 Aug 2025 09:41:29 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b90a64318fsm6023335f8f.21.2025.08.11.09.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:41:29 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 264D05F834;
 Mon, 11 Aug 2025 17:41:28 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Gustavo Romero <gustavo.romero@linaro.org>,
 qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/functional: fix URLs in PCI hotplug test for aarch64
In-Reply-To: <20250811162315.59997-1-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Mon, 11 Aug 2025 12:23:15 -0400")
References: <20250811162315.59997-1-stefanha@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 11 Aug 2025 17:41:28 +0100
Message-ID: <87o6slbykn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Stefan Hajnoczi <stefanha@redhat.com> writes:

> Debian trixie has been released. The "stable" alias no longer refers to
> the Debian bookworm release, so URLs referring to bookworm artifacts via
> the "stable" alias no longer work.
>
> Switch to explicit release naming ("bookworm") to make a permalink so
> the test passes again.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 374a245573b8 ("tests/functional: Add PCI hotplug test for aarch64")
> Resolves: #3073 ("PCI hotplug test for aarch64 fails due to broken Debian=
 installer URL")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

