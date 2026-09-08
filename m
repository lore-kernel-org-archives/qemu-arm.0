Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716ACC79F82
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 11:07:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3tfB-0001wG-Cl; Tue, 08 Sep 2026 07:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tfA-0001vG-4V
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:06:52 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tf0-0002O8-Op
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:06:45 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-861feb6d61bso39299387b3.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 04:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788865600; cv=none;
 d=google.com; s=arc-20260327;
 b=nJJRP0cJ1gxTlu9+96WXjvzOMQDpnA1ItE3jEduddR34zc8dj/RDE/KtgfzQFewXic
 yVAgWODXCnWwOu/lYyI4MxF1Fol3WZmcRODrYFEVzkDmeVSn6Us5FdG3UcHmdfeSez+E
 0dzE9OpS9sJYAd/kMr+zBqnIA3bTWyaEyiK5QUFH7PBF70QJE0XkUpClNGdqFkbx4Jqj
 xU6WNNUILRXVkFrNEFQMHX7K5Y93mQ2wp6XanDK755AN+PX9GUquty7zaaz4JNkpsa6l
 ZMJSn1ZGk29VzP4sED/FhKFqnpw7y8ihxKLINTcCHvZPx2jMrrn41EFa8GxHxHHYmJB/
 18xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oglPP+j03+Qqw7bAG7SNFcjv48UgS4g5SlwNI/8S2oo=;
 fh=ncgq09x1f3LsIaKcga6qYqFlfvW+YDjc/hARzKhj4ew=;
 b=LfXQ4tsm3SN3WuydweKjN8cu22gT8sQF0ZTJqihZ41vzjP4kRF6bQMBDnmfmqiMWrX
 wtnjwe42x2F6xiKMK68v+2qAwBVeFLIfiEh9gbGQxa9uEcSkmOPwNUhCKNdfbjmRs/AA
 y3QHqMXk/AtuSP57zbU/Pqyq+dzJynbrMRGl6mp5r6Zb4EfD07TbaKJ2vLaBGwQeFuON
 e26OBxe7tl/aA/fY0gdaXGowQzlTQMqKbsIkc+5hyzf8b95Dn02p6n9yc1d76G0kKBT7
 dlFC+uL72IIKfn4M8FVSw433l5/bbT1TDaH3wkWSnLzPUbVeYhRFf0Bo0JtXgjSOrvfa
 U2ug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788865600; x=1789470400; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=oglPP+j03+Qqw7bAG7SNFcjv48UgS4g5SlwNI/8S2oo=;
 b=De+LzHn7Q5BiEc+VeRSwmhPzQLJMHvnj/wjbzGmmF2RdnomYsRDGvne/2y0crqm7sR
 wjvSJZp6LGRDa9tiQ6Yqt8pVQlbicQIU6pAnK6IG21//qHzbXSwKAHMLEjoeEFpcJ0db
 9dG3YxHiRfFpFKA+Wf9UOcSfW5+0jM+lJPXhQHZwdGe8FNx2bQrDmilcftjZOx1CtKgC
 YYEseqqaM60KAOg+9jQ9sZ0Gt6tig48eMbavZXS60TYl3Xq/VohZNjUeSWDZYxDHvSK7
 U9XvnRT/Wwq+Ec7d1mFifw80IXJ3ylBJhay6x1mqKlCC0jZr2zNyUptGPonZQmU6zRtU
 zZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788865600; x=1789470400;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oglPP+j03+Qqw7bAG7SNFcjv48UgS4g5SlwNI/8S2oo=;
 b=fod9TKY/0Emh63hhhDqIlze0p4PiOCYBF9zTVL7uS/rjlIVvbyf2eXz4W7dII6GgBb
 GSINip4i73GCXd2Jnta81Z19AZ0GUNBMDYCOD8JV+3sjjt9OzXtK8XmWVmW4lfR0R4g3
 7Xzik/udwAZbb9xHaLsCMZZIZ1EcqYCuRpvf88Xk62lNgZKfYR3iKfiLen0Yx2LRCPaT
 W+5muXaNa/g7YY2Ylss5tgtP75a4Zi16hkvK8H2srO9nBdyOdNrTFo4UymgMluVmgq84
 8Ya9Q2klhFWJki5GV4CAfx66E2qloRv1RqgmtchvNZeXKyCMoJxg6TsbotVrbx9XhaA/
 vmdA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwcYyXAWl++u+wM/aF3/dy5H9AUKVSk9WgBJghlRfmCPp6m850/4H3Zxy4eJVRXh0r8+InT5YngAg==@nongnu.org
X-Gm-Message-State: AFuF++kXULi4hI8gLnKTTE7gLWwB4jUi2SiaPw8fnJ1dC1dmdoYdie0C
 l1O4UVpo26x8TythELCZBUTPXb5WtSYjrqEC9DLcHd+Tb2xdCNHPBNfWeCD7LLJM6xQdLgnRM48
 BOj8a2SitR7nlYMwN/qPXrzEw3/AORojez1r28GGmdw==
X-Gm-Gg: AYBFou1EmYMaNnhnMmYVOg7lGq9v+oAmSz6Zo2jl13LGMb+kY1T4pIPOjdl0iunxaUX
 onWthbWHef+nO01NhHjlW2Qx4eP1ZGWlw6FL09HSipSSgdOKq16WQyQiJnzcJ3Z3kppSA50HTDq
 bwqJ6oAi3RV0kHxFTJo/2Fgilads2BX/+f0tb3i6W9QJbGrbB+F3U5RfU5DJdrZyGSXCu+CPt0P
 EdpdDV0dNyX3QFB70Yz1cTmZvh8IbVeYJ8cnRa1pjgrzBT3vV5piJDtj4vQoY7G56odMecm0h+d
 atl8mBChBuzMqRtVaDlxyvFSrLfkXlbZmgSPkstHEH2kiv/eTYz+biq77pFSJUoAQHNNZat8xce
 2kwLzQ53M/hG0Buwe/KOlxTb5Rv7+
X-Received: by 2002:a05:690c:dc7:b0:841:e9e4:8ab9 with SMTP id
 00721157ae682-8712a709f48mr117102247b3.25.1788865600031; Tue, 08 Sep 2026
 04:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-11-richard.henderson@linaro.org>
In-Reply-To: <20260828222639.1432046-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 12:06:28 +0100
X-Gm-Features: AcwNN1WQ_vBUzqsALzlCACrEV-a9WTwIwqZNRJpdlJ5oUpBDxEtdiRLIE4dhiyo
Message-ID: <CAFEAcA_J_y8ccp_BAtkb0n7z1wdRHqa88wgL_jAyaRmN-_sbKQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] target/arm: Read and write PSTATE.UINJ
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Fri, 28 Aug 2026 at 23:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With FEAT_UINJ, allow PSTATE.UINJ to be set from aa64 and aa32 modes.
> Read the value back for SPSR_ELx from aa32 mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

