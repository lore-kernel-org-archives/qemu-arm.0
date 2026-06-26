Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF88CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:17:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2gG-0008Ml-Q5; Fri, 26 Jun 2026 05:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2gG-0008MS-0Q
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:17:00 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2gE-0004vB-La
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:16:59 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-664a09bc459so410272d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465417; cv=none;
 d=google.com; s=arc-20260327;
 b=OnSpzbjc3BHXwU3aYqjt2+Wvy9ugJwZ9UXk7CBUs7wcOXgTnRXmgaVEJjVFsJh8RBL
 zB7p1EJhLDWi0D4u7i/54rc7oCIj29LqBcepQDrBetvjujNRknbQN+lHRcHra8HusulX
 Sonl+m+1G7KjVF8rRRZYwIjPTg7r7ieyO1nqd0BCfMZx/KvCMhwVs/w5bom6GJK8JsSw
 ZoQh1VfYK5EFdnqNdht0ufJB3Orbahk/uYIX6yiwVbxte1uQoEfb5g6mxpmswyjNIAHj
 vknNOfG6WDn/pw6F60JvdSsap/KelA/nBqZ0CRAq2KUTqPari7cwE+0vBenkgJJDbLaQ
 IHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qgUA+fLbwrvGdpgTE+LuerIpJ7kwSME7ZYbWBSky9zk=;
 fh=AfqmulSYOgKKLX0PtIIbFrnpt5/bgshB1ZwExZI0YcM=;
 b=lS0wBKj9syh1DJou/N3OsIf07grc+O5JJgGFoT4x8Rso6ZrlC/ms/zadMpfNCTOuFp
 F4l/IVbjHIq6bxPz224eGO8YgZpR1Zj14NE7U5A9MdHB6jPorxKnFRD9UprlIXFCRJ6e
 GgVz4cIt/aRH7wTE1lWiC3jtwl9iTGLGVAWjNlOwvCPBSRVsBiZDL/+zV6JZ4IS703cC
 RvqWYImjVZxywpZCSdHt6FNkVFhlCsCyCb9G1UcX3SPjWyAINl4QpKenzn3FV1y4t63D
 83dJZMIl21c7XYvguuA2ySfMcnrkSDk+/oSj7UMzsmfOvXeaQCG6lleEBbKEDyzpVRnr
 ND2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782465417; x=1783070217; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qgUA+fLbwrvGdpgTE+LuerIpJ7kwSME7ZYbWBSky9zk=;
 b=GlUQqyPd5cbLPUU3/mHypwWFbspFf0xk9i+F6A3aOolJ6cm5E5YnEL3K8KUoLa45wl
 uLXDZbMc5o+XiXQ3LWKIf2rdzhNjSE348qFpAJE6HjgqwttS2Tf/WD1Qnw+IBK1Rzmi5
 mQGIMVb64mxgeBEYom5bk1c4Iv37ncIZn5+qO+2s4vI2TAfUzU7YBx/r6qRmd2iYeK+2
 /Pj5CB0qUxNWbxexdOjrUt2ZDbwynSPRWXAF4tlZsJd6Myhh5+3KnkvR44jpgg4ZfyMt
 AGo+bW31z/kYo6YLpO1r9GrGcG0Yeu0TJ41LXIJ30VenST7WWDJJ+p9SEV9rpKuVT+5P
 dh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782465417; x=1783070217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgUA+fLbwrvGdpgTE+LuerIpJ7kwSME7ZYbWBSky9zk=;
 b=AmlgPHC6p66n400IbLe8P8jMtijbwFSDY/fd80Q5Kg6cF3ONb/3QQsvduTUeDWiyns
 jrxV+x+zNXBFohfNdoENT278J3GMTofB6AEwmN7CWwZXz3k/7XDtDnug8ci9XXYsN5C6
 2hHob/cPABYBLre5pKpCH76LagEGYAmli/277+iDKMYfC4dtQR+a6EAQrljpKfyxRFep
 VbCXhVrjetfipm2P4IJVy3+ZNf3+lU52gRbiiDmBxYietHobPnSRr/qNXyXtaC/4+Xdh
 mXrP0uWplpCbPBBi0j1KfufWJTlIcd7xK58UTZ5jdn30T1rYTt4LZnyTIl3kfbJZTilH
 o1Lw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzfuTCNnqfBAnxkjUjfSVE2GQhTYCOX9B0tzh8wjXUbYp3KAM31/alfUr9+WeUxquQcioOTQe3TQ==@nongnu.org
X-Gm-Message-State: AOJu0YzI4QQih6Vox/JmSimLzuaW9SvIAX9d29htaZSYDVJYTtQ+0mfH
 TLqSo3/SYbpdrJjy9K6I1Xxy3eIxpa5GIcfuW9Spoe18bOtbUUolDdAjtzsjtbDJb6G50wEK9Jc
 dVTZfaRsWfkOyQNwS675CS0AS/gmHA80908z80Ybjj2Pgwl3GjBifPIPX7mmB
X-Gm-Gg: AfdE7cmIAYkIftvtpCvDoTX4BVoXBtUE/og3VfXbt+4PyYZZtBbBtGNHpG30LWIjPac
 jretY9uBytxBn3rYQCW/7baaTCqSR8jwE2IGRV2k7O5B1opdnK5hdulMCKVPBJ1nQZ8jpPeFtER
 I0KSyZZAB0qAnsMuFyU2HED+6zIis1KImea5TZa6bQa+BNlTKdFZFQsVaB8MBcIgCAjdMnlpd4a
 03KNbjDmlrQ3HJ7L0/ymfuWSB8LBvmDlEBsPMtT6TyecbdqcEIhJC03GiigHvETMIVtljSxJCQz
 3h29UaF3GFhHmcCj2rQJJlqpEYmYG5ghpHqspwwMfH+jPP4bGfUP8fxu
X-Received: by 2002:a05:690e:4402:b0:661:1307:3d4f with SMTP id
 956f58d0204a3-66487e76b6fmr4179891d50.46.1782465417141; Fri, 26 Jun 2026
 02:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-7-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:16:44 +0100
X-Gm-Features: AVVi8Ccz1jmZmv2-i1w_ZbJiDZUPKVAMZGYNrOYBFZ5Xjc5dJy7X1F_ljkq6NwQ
Message-ID: <CAFEAcA9mqb_=YnnAoFMhOtj+N5_YmO6YMgtQrHoSzLTBpNac4A@mail.gmail.com>
Subject: Re: [PATCH 06/10] target/arm: Implement DOT (multiple and indexed,
 FP8 to FP16)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Patch subject should be FDOT, not DOT. Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

