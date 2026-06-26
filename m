Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6115EC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:30:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6d9-0001sH-Dc; Fri, 26 Jun 2026 09:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6d6-0001rN-W0
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:30:01 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6d3-00050F-7W
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:29:59 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7e86d46b02dso13895547b3.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480596; cv=none;
 d=google.com; s=arc-20260327;
 b=m6V2taiPcwqHsKiclnwH1q8wyqsKRpt9qscqCt7BYUKEElfXD8Al3ESPwXRQuQM8TR
 PW9qmiwjhpd/G5VUDtsk9LpqEDmxLVD6ZuGEtOBemPrCH+bE9aQQs+xYps0emHMUPOSo
 3RtI9YjeprsPq6RxY5sWX72VIHrS3tX1l9b/xQ0SkZICIusN6nTJ4U1M/smwOyxHiIa/
 9XDMy0OF0lbQlAekUN0cjia26KQHZ1pIj1mPcYKgNGmwG6ovRF1RMOzKMWH9qLcZRsgJ
 XMHgcZfk5VIlJoj0NMv5ru16W1xcoFVL9Lkx3yf3fwt4epQJcETDBmlcnUPj6aFjIszC
 JupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AB6XgcnQzk3zBCK4Lj2CcXGmBM3Joo2qdjyStFw68E4=;
 fh=Umn4AnDzlD4vjdJ12N2inucom2DVMZ+MC3S1lZMuVZo=;
 b=ZwA27iSc2kkYBbjMr+viffrbE/Vrz8oqcBbxr0gsUkJwDK1JKdFb6sMqpF8vMOI1Wo
 aVVST7v4BbEqejLwoUIAl7+jg7Q/ePiY4TUlOy2f2QS2RzzNJAeZ9AKFAirTukln8V9B
 68EIXTKYR5aSE5s9E4MeQ6/l26qp446R/EhOaPaaPzzQyEavd6mEyUJE48Gcc55dhKEc
 JkJ51s4J5kkW8FUk6bKk06KuzDPmWz3Qd8O5nUAYWxq+RrWacL0oh0YFRV8pNrZoMP2q
 RBh8ZfkJK/MxEvHcl4yooR0CfNup2XEpdXsKa66fmmWjnPSzx9czwZUkhifKlT5f7o20
 IeGA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480596; x=1783085396; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AB6XgcnQzk3zBCK4Lj2CcXGmBM3Joo2qdjyStFw68E4=;
 b=O2GEe/O+djoVuSMEd255ipZKtWmfB6v47ZY+2MvioFk1bzC+RCZOs8z38NLpDu+Kcx
 m7HLMX+y++10i9SUSVEF6HVbrtwxkAFOIMHSkuxxE8cfGTZW4neh2t96L9CNY6qONNzw
 Rp/2BVtr/Fj3r3hn9DMb1BImVx7PvpiT6DiRx2Fdt0MolbwHK1h9SYYNWeGQuztC0XHA
 E4eLXYRWiGBy2+lp46qW+0/Cw6BSFhKXMVfHyel8VncKAZY8xvuiUzPEhOMjlDfGdhIS
 i5GSZuDEW/cmZEgNctcoqTMdySG4WSNPHQpFYVrWAdgx6HmfrB27iIKkgwFPDgyklDHy
 Omog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480596; x=1783085396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AB6XgcnQzk3zBCK4Lj2CcXGmBM3Joo2qdjyStFw68E4=;
 b=jC2wiTaP4vwHxUC8o/FDo5JXlHSIdOKE06+V+sy8swR1rAjrWd+7Bt81NSobRA7lVR
 UKO3yzmxFYXMqwLtMiOeFwG609lowiRHPm7vSuQINhdsWtQuB6ZKJ+ahTOEye2ZsZ0xF
 a/oQgX9kYm2RpGXYJU4v5fV+T/qmtkvn70rN4FALvUO8qruzrv49jWG0dx3SWVCHFZgv
 cefRQBDrl04BDVGJgtYEbRoXXuRJYl2SZppX4pm1OnUyqZHHQm4nGPzp2R8h3PFGmJ+a
 qZ0GL+GddVKYT8yNbQsV2hvwpY+yzoa0Op21BXtfuLOkh7WJTZ8Zoc4sDbnLoX5a220J
 kFeA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2YC/IQR3z1qHNUhc8Z/RAOGRptzA8ZP60nMPkRLSHL8vnBp0p7djNFBfpubjiMkuIJavZmHfbog==@nongnu.org
X-Gm-Message-State: AOJu0YxSCNRKc/2IjH4+M+Wj9iR+XZiGlT3UcW4JZaLPpXxZlLmC8PbJ
 1w+9u5Dtod4/0udj3G5Xt9QwCYdpyymFExpGRcPlw3WM/abbIqcMlfS/obfLfji0Fq96rOPFmJv
 lJUGS96sK1gInRl+GEPw9Xa5HUNWO7tdK9Xvhsm/Wmg==
X-Gm-Gg: AfdE7cmrBYF4Yfhg9puvI7rW5aCOHDABzSiORLG9gjLNSDSc6ukMZCjJNAPEIZYQPvh
 MnM5GtLtYQGBcIkCIk0lxds/w5PgGPOWsnpizTSeeirZk9Qe4JPQcWzlmE4y4I12ArJg+1RxBnN
 6/lCh5FG3yilrmKjrrIQIvRgOPINKNtVVZMCFmWjpSqteyb8+13fCjrGeh/t4+oIepgxC+S2UST
 irDNXBz/y7/CqDKCCAaNO3J9TjMrNTBymt//aHjKWGfoI/X9jXTBeNPBPIXNdzbAQ78DVlPNYgJ
 9QINgKWHfjV5ukj+aFSsTkcT4FQFsnNX+0Z0Z1Lawh/tuCTDAzCNJfXZ
X-Received: by 2002:a05:690c:e213:20b0:80a:9f1a:d492 with SMTP id
 00721157ae682-80a9f1ad692mr43590917b3.53.1782480595976; Fri, 26 Jun 2026
 06:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-16-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:29:43 +0100
X-Gm-Features: AVVi8CeSci9uSgJtQHbN3Ifs93zAqLRag92uIWWUFrhVED8qeOrfpXu-tgT7ggY
Message-ID: <CAFEAcA_COyr11t8GRHud-y+u6gXnk_sbK9ZD9=fdp96yppdvWg@mail.gmail.com>
Subject: Re: [PATCH 15/15] target/arm: Enable FEAT_SME_MOP4 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 25 Jun 2026 at 23:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

