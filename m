Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810DBD2CE01
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 01:29:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRKd4-0000IN-O1; Thu, 04 Dec 2025 20:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1vRKd2-0000Hk-BQ
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 20:29:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1vRKcz-000170-E8
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 20:29:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so15096105e9.3
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 17:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user; t=1764898135; x=1765502935; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k20l+9m53TjOU/a2lmglfT7bVTDyvj1RlRxi2gNcqLw=;
 b=dQ1an7Jlour73lqcDlNWiEngBO9NyxBeHopMnCj01LUrmy1VyffZRQbfnzDg5LB9ns
 pZm0RCMYjJxsIfxm6uJZBCrQT0HXviZ24w6zFw3rf2JOpyCgbO1HR54NJPtdAhLrGkfs
 ZRkrKLvMhTcinO8evXCNixDD9GN//JYZe06+/loIRZpukB0OHy0E8loovprO/pP5nx0E
 JRgivQ4HgJAPSeXDuEpQGw3ZLIlr/HkjEjIe+t17y/2hGS8CFnf+plFwdj1jlxjSgbaw
 c1bfvUZvctcaBR0fQkGLLzf8e874P8vwSnvn0HxE3jspcZ8EgUEL9Fnz7ecsgxFYE8FZ
 2SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764898135; x=1765502935;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k20l+9m53TjOU/a2lmglfT7bVTDyvj1RlRxi2gNcqLw=;
 b=sz8as/EtJ/f10D7YTvWSPdVkczLAWRpLAdsbbZMeAKuhQ2fSIQ9RXe9S6cFTtdElC9
 tt5diBfJkvd4anmZ9c4rVfDFGN3coMzod0F7G3t9Zxa5aYQaK6e/YZcgPEwTA2ray0ht
 JWMlQf+IzKGrNRFMIU8u/LbKu8P4AM9RMdxnKtIi2Xiq5i4tEKuB7caFGpUJRWRk/X73
 FBiEEPzd+8GvKpmzx9YIbJzeUyn7MRWrKbeDjiM3hxpKJswWl9ZjOCFFetolPiU81dOq
 JVoz2Svd117PzqfI2/D/2FAjQQ4NRJfVR4V3+0NtVbJ00cqtSWKcenvMQrksBt4YRTXB
 w9nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdWrom5xaMvbW92h2zXkOCxtaLtfnWibL2CrKlwL72ZODXQqG4wSTdMtNWvGiev3/0E3yJxd8cpw==@nongnu.org
X-Gm-Message-State: AOJu0YyIJBzDdFx5v4zIu8m6BRVetix3qyCjTQPMaUDpE0uuUAjxE3gD
 CVvLCVyUObBZhD7XoHiWS0pCRLRB74uc7DPCDbuRNeJ9tGf6nZOZBUDCN9J0thR9UGA=
X-Gm-Gg: ASbGncsLOK07L+ICsuEH8yiq9HLhtBsEqD9+WTeT8Fzjd8ODAXKjt+NHCSQZ32vVLAU
 hx5uJdAbzfMVLmAeKdbXbRndaW44qvxl9dC0l9FXt8xxN4KRWQpySWoowT34rahcxpAbBOuMYVT
 mQiTE+/VJF4cLrXKY9buuVkkmk5N833sQadKDAg+UaHiyeV0y4DjPFbwVSKblnRM4qzuVOpy1/f
 d6ENFcs3sTA6iJwzL20w3IgOQT5aVHVKctGN1P9QCXhKwWdKU6dXBvlnXV4wquKffDtaraaXZvJ
 rqKG2cLtLVX/DZTt7hO0sBgqZ3rM+uPa1Sy7eEVa42GtZHwV9DzspwMyemkMZU4nIt1MqW5Fnv/
 42uPhQNG1tDofRd7AzhJnqe7BgvmB8OzKKJDiGkQi7IKS6mwaPphrS+eHx4LMBOa12QPxnE1ram
 IKnJvVukdHf8ahJPoA2cgTLxJ+XQnaw8ecTw8oYadVi7TB+Rkr9q+rkLQXGR/UjuPNvF7EWh4Q
X-Google-Smtp-Source: AGHT+IHu/eRWalgYgjrBSDTdZejwyT9F2+yelvszQfoq+rSQxmUx8ZxI657mL8BZuS25dM8tporT3Q==
X-Received: by 2002:a05:600c:c84:b0:477:8a29:582c with SMTP id
 5b1f17b1804b1-4792f39d92cmr49791185e9.34.1764898135044; 
 Thu, 04 Dec 2025 17:28:55 -0800 (PST)
Received: from Jessicas-MacBook-Pro.localdomain (nat-184-7.net.cam.ac.uk.
 [131.111.184.7]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311ed466sm52640075e9.13.2025.12.04.17.28.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 04 Dec 2025 17:28:54 -0800 (PST)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
 id 97C1E1075B23F; Fri,  5 Dec 2025 01:28:53 +0000 (GMT)
Date: Fri, 5 Dec 2025 01:28:53 +0000
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3] target/arm: handle unaligned PC during tlb probe
Message-ID: <aTI1VZHxicpycoLj@Jessicas-MacBook-Pro>
References: <20251204203540.1381896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204203540.1381896-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wm1-x336.google.com
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

On Thu, Dec 04, 2025 at 08:35:40PM +0000, Alex Bennée wrote:
> PC alignment faults have priority over instruction aborts and we have
> code to deal with this in the translation front-ends. However during
> tb_lookup we can see a potentially faulting probe which doesn't get a
> MemOp set. If the page isn't available this results in
> EC_INSNABORT (0x20) instead of EC_PCALIGNMENT (0x22).
> 
> As there is no easy way to set the appropriate MemOp in the
> instruction fetch probe path lets just detect it in
> arm_cpu_tlb_fill_align() ahead of the main alignment check. We also
> teach arm_deliver_fault to deliver the right syndrome for
> MMU_INST_FETCH alignment issues.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3233
> Tested-by: Jessica Clarke <jrtc27@jrtc27.com>

v3 is different enough from the tested RFC that maybe this shouldn't
have been carried forwards, but I've now tested this v3 and it does
indeed still fix the issue in my testing.

Thanks,
Jessica

