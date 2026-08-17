Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C643C5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:24:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzBa-0000KI-G2; Mon, 17 Aug 2026 11:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzBY-0000BG-Cg
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:23:36 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzBW-0004AC-NT
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:23:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-836ce6cbe1eso44905897b3.1
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786980213; cv=none;
 d=google.com; s=arc-20260327;
 b=IH9cxrK5+rT5fDtKLd7eP9MJ41M//0z/dxCA6kErEyzln0d9atk72TeLqISOU+Ayhg
 F+FsVFh3mFWrbIZuIdn0oq2pX4VDvUvTTu+yo7vcQ/8CryMUTOhoz0cqyxk5BgX5kbuv
 lWODEHB3UE782fIbVy6uuYBR5US3KSX3SCWEqIdIW/CQY4+7nUKHfDGp4Jb0gV/s2E7u
 +d9dfs+K6VO2ROLrSwGx+a1LQeGa83sdRjAJ9aD6Brj0Wp7lGqeBkaPhqm3GgSwPYcAR
 kyQuKZdVSDxpR3wzUZ8IlIk+9CfDHo+fleCLfdefKpRcMwQ5nLF68MZsu1y39Kv1lgBf
 Rd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fDUUXlrS94PSLkYqonthioUjC+HhEl2gGJd/qSapbD8=;
 fh=Cf+F4AdmDBcrCcAGpLSXcJ6wizEUDD+SYaenzF/7Zfo=;
 b=eJ2+fZznitEDJrh7K1VG0QiFKXmJjgR5NiDWiU3FLisYDm4aao0ekR1Fn7r8k7qN5a
 faPIBILvArJgMDvq12YkSFWT9pyG2hhagJZj2lo2dNme55HcctxZMpZaog/QFRp8rqaJ
 A/Jq6vblGrwoz88mw/MIcKan8qID9hUwOiWgFjog5G71dICCI9EistBEzdKPdciKmnUv
 lWWYpdA9Xrt6nSJlQ4JyFyfn2WudZcIHQCuLHedmf+gldkzlFgcfwEsZoktCWmShm/PZ
 qVC60jomsY4i3x1p7VWHcSytZ95KShd+1OjYgL3ooxY9CCVSyBmtJL+leglwr5ugneM9
 mzYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786980213; x=1787585013; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fDUUXlrS94PSLkYqonthioUjC+HhEl2gGJd/qSapbD8=;
 b=gH6gGYtyWj1IBFxYJw6XUMNe8boASEd3CI4DF73EfZQjWZNG30NZt995mi+Ttde/WM
 aeR8ZGcinEfSKQgotr2G5f1apIHy7dURob0Bsnl3+3IYE8XMGGmutV9zs9fyAEQQKx4d
 +HgFSPvDMyUqt9GkV2nOjychWRBITzIMrXIGP/U0h2FemQdA0FRE1db43qaU9W1kKeTz
 joMYw+UpPtF1XXcZn/m6cYqdbQD5iOv+qctnteEV0GUcqWvq7CzkSNVo+o9xrFjk3/BZ
 gGt3ZVI5xVof+OVTMDl9hmCiu3BSYkMr6EINV1EQgtRPeBw0EobcjrAPQGj2hId1/hy1
 Jh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786980213; x=1787585013;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fDUUXlrS94PSLkYqonthioUjC+HhEl2gGJd/qSapbD8=;
 b=IqYgWteq3riyZCfZ0Or9Xn/gCJ+xHBcQfT/AM0YJSDtU1AZVNVkWSKZvIIUh7KyvES
 oG14U/m6VeWTUr9hBxxBonZIXsmBKhAhgzC3eIETrNHgzoncwvrwmI+yzDIoI/GrGzJe
 J2qehDt1jq1lWqu4njxAW/CCIGms1BgFAzW0M6TWLtmINkmefA5Rjm0kxsJ0hZwljqGm
 LNzA3x8+pFNxqfy2RwttR8nQvNslgsl9nYgILioTSVTUb/Rww6JkRoeNsKSId4uJ2Wf+
 48nfj86neHDCr3xQDpiZYoYzl3bUoMOl+2T4eTtct0K0Z9lFZmDbxlLfjpFFaZ94izkp
 RsgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqN4TLpjWmTL+vd/ZQVSHJgc5PnZN1EnPzXSFRp4umJGzIsElIouKzbH7rwOtNIBDn2dhTH0lulSA==@nongnu.org
X-Gm-Message-State: AOJu0YzyWTXu2NUfb/mJD3UJat+vp8fxYPKwNPtcS4qQZyOKFn3oeINR
 axbacYZsbHLrx/HoZUG8YCI+F3lTya2/peHnT3Ubf52OSyHXYbO4NO8YlZpAEwq2pBsSEUtyAkd
 /7mmQ5WmWmhFDxvqKfj/5AeeOJCS7sYOAZW/Acg/SvQ==
X-Gm-Gg: AR+sD1282ArVP5jkaOyYXVJB7QiJZPvdi31710SzRE/+zVTrt8oWdNNRRVsTb6VSc0E
 pQky/DjrQNvb4cY1jwUD7n4boUQ/l7GW8S6pDsIeLGHaG++gxLtIPFk5UqFNpYYUaDDdswwVFs3
 CvvPwGImD27hF6jkx3L87Q0CL39l+KFo/pitP30gPodRFy2/UwG/AvlhU9VzLDyz8SbJFpy0M2F
 xpP+KDcb0ab+C7fSNoPOq/yIVSkOTvTDLCFjDG5U63UtruMuYDFh9smdXHlZZr6iIqsinTJFExR
 lRSjCFxpe3IfmpaZzqCmWKu3SpMuvl0C9v+12M1UmZetlU7ffyBwUzLFd/FXHLZ5lCnQQK7r0WG
 t/c5UIxkL2THNDgGIj3Hvl43iQlo4
X-Received: by 2002:a05:690c:e0c5:20b0:80b:bfee:c427 with SMTP id
 00721157ae682-8412e0cc751mr5377617b3.13.1786980213165; Mon, 17 Aug 2026
 08:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-3-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-3-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:23:21 +0100
X-Gm-Features: AcwNN1W1y2f7Yk56Rwnh1OFm4MUWsAs_WaBVUBI5wYi0aEQS_S0MYd32W85WnA8
Message-ID: <CAFEAcA-1pdwBn4cEVwb3xy1P+arWeqG6g3NmkeN+s+NeQKOygg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] hw/arm/armsse: add Arm Corstone SSE-310
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add baseline Arm Corstone SSE-310 model.
>
> Device list changes between SSE-310 and SSE-300:
> New NPU0 Power Policy Unit and Configuration interface.
> All other devices are the same.
>
> Update comments in include/hw/arm/armsse.h to include SSE-300 and
> SSE-310 and their respective documentations. New SSE-310 IRQ mapping.
> sys_version and iidr values from the "SSE-310 with M85 and U55 FPGA"
> documentation for the mps3-an555. Refractor comments and code
> pertaining to both the SSE-300 and SSE-310.
>
> Arm Corstone SSE-310 TRM:
> https://developer.arm.com/documentation/102778/0000/
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

