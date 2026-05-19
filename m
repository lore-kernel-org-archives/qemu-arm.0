Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A211CD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 10:44:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPHw4-0004zq-A8; Tue, 19 May 2026 06:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wPHw2-0004yw-LQ
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:44:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wPHw1-0008Vj-3m
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:44:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso35869365e9.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 03:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779187463; x=1779792263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5NkfIU0TuaDxOuifhlhaWQvtm+pvv4YYezcr0hTWZf0=;
 b=VsXQwNTUpqs3i5fN5TAX14Fe6KXHLDuDYy2HQcV4R/8Vj86yRWNHN5bKiprHYEwMuW
 sXYOI6oncCayBV0O0CZBW7W3pWZrwZJRyAdt9cQJsK61664vcQNEHRe87se6tVTMABZx
 IhaaXXLozXnPHypG0E77go4iLYgtyzBhDdqNj9i0gGNXBlVI+3HKB4lBGes8lwkOgS+q
 MfhvW95N4ukBJ/maKk3pdwVm+MsqPm/cp+BiyiXqczR55phjqjl8KTeAhAvUNI212pwZ
 DwMC4frFBXp9cYUPRS+WAjAQkMKjhEjiuBVx+y4AoBs1Zq+sHNfUhpHFJlphBSoxzYlT
 LWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779187463; x=1779792263;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5NkfIU0TuaDxOuifhlhaWQvtm+pvv4YYezcr0hTWZf0=;
 b=RQN3mqwgob7rzQhLzkeMfGRT2+2vRJDBacS0/zD6fOXNrhEBLwTkhBsbdxTD/+Rvsf
 h93fxcleJXcMp3x3LhUK8OfCQALxrXR953Hjenw58wE8G/9hTzhGR12zCPkxa3MdQChT
 xMXsckvSqW5daSH+OmurQ40OU4+dA9kq8dG/sYSftwfWq7Nwhsw1qVJVLH578oU9GCq1
 PR50PIZeT8JYOmJt8Hg48aXlnkeBX08ev0NvLhJ2wslSj+H8VmL4lB/9y/gz6j9ZbUpE
 cbwSlhvpiQatmBhf60u7kpbiYYkp/wMzcY2SY7kNSO5vvC7Okrm2kf86DjC3/tCINGng
 0xtg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Iy9lOxxIco2XWPq1yyBV3iOSa1ifKQ6ODBdWQbUpC7X0baC+OFbcngBtUHSs2iUEG4Wmcli/+/Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyo04egy4SIc2DAsKhfbVqcAr4RJBgii6Fj8VLt3L4h9zFD1ogp
 BA6vtn/0u8k2l+WtDKS/ZWb0jvYHGGFhV6Tg+9PcghUZdncONd4IYEHYtbYqvKw6Sac=
X-Gm-Gg: Acq92OETA9hXGkP32XumyBE3YBhLXUD7cjW+1rHVWXIEW+NusWAGp43STf7RTtIv6es
 bF+FqP+pUVnOokDOxU6X905IZNy/UMGI4rxdwQm2x0k63u01V++euN43LOXoHozMyBiiDDGS89j
 Gw2olFzXI4cIKF1KrPJHV6MCAq4eUg4sMQgnpKdtZOMI4+6Sm6BR3wkWtQviVsNCxr4m6ON2ahU
 6aRJGcjYrEMXDEGCJVbN+6ylsVWCJFvSQkhaL82m/IZh6n8VO65EWiLyQg23F7h29ZD9+KEMbeQ
 tT/DC2kKueLpj2NMUKvmns3CME4U/ETLZJChsjtHEbrZyfJOg8Wfvcv1lBQD7ZdoDrWrX3RrpNB
 1cQqTrcMdsuZM14UQsuyeJ2hAMthdjqKwGpA+L8AclELOQM1QpAPcpYP4CS5tpeNgp0p+4eX6q3
 YRToMo36pslo1vyA2/FgjTQSQ=
X-Received: by 2002:a05:600c:8184:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-48fe60ee4admr290018745e9.14.1779187462983; 
 Tue, 19 May 2026 03:44:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694f2csm320056325e9.4.2026.05.19.03.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 03:44:22 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0D9065F81D;
 Tue, 19 May 2026 11:44:21 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 dmitry.osipenko@collabora.com,  marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 0/4] virtio-gpu: enable Venus/Vulkan without OpenGL
 display
In-Reply-To: <20260423180315.53821-1-lucaaamaral@gmail.com> (Lucas Amaral's
 message of "Thu, 23 Apr 2026 15:03:15 -0300")
References: <20260317182049.33848-1-lucaaamaral@gmail.com>
 <20260423180315.53821-1-lucaaamaral@gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Tue, 19 May 2026 11:44:21 +0100
Message-ID: <874ik3d6gq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Lucas Amaral <lucaaamaral@gmail.com> writes:

> Ping (second). This series has been on the list since March 17 with
> no review on v5. Marc-Andr=C3=A9 gave Reviewed-by on patch 1/4 in v2.

I don't see the r-b on the patch.

> Patches still apply cleanly on current master.
>
> https://patchew.org/QEMU/20260317182049.33848-1-lucaaamaral@gmail.com/
>
> Thanks,
> Lucas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

