Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1677543lfm;
        Thu, 18 Jun 2020 07:07:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlQwI8QS48qVio++OBi31aHahIdmlhClzvpjeVw8oSB2xhoIDZNT8INMs+gWkh2vvG+0jT
X-Received: by 2002:a25:9341:: with SMTP id g1mr6844631ybo.57.1592489273564;
        Thu, 18 Jun 2020 07:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592489273; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdbXJBzApO4/vnqE94iEmD8WyVJn5J15tFXRdO4+9ojsXGVskvTM9JdnKc67MCih7O
         Os7OadBmFUohKB4198FX2tm0csFmQKc83OKHNyjta2E7A6JWpMk3R+BZNhdg640SZEjO
         TLPjU+RmCqL8jrF4geItopVxuOOIxZ8hmHHm3V5v46OLlGhwWanV59xMLvP7aukdnY+h
         VXTWmFfsXX6q0GgK9LiglTuWR+zMddUIlNAc8PGiUzJtaVuretubpIWdyCgbXiOShCCk
         ntrenYkIblhcu1Y4RMZKXLlVSaESOrbube8W31wn8HXlTwHPkGXK+BkunuV5+VixaIFe
         wN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tTIdqA9YBmh2AxRpFhSPhVFkhn0l26ciempdi4X5B04=;
        b=Wu5mjJ2hgOGF9pabIhD5xc6dZlMgOZGHSyrpwO9110vV1JqspMogl3YFpuVIDhtJ0F
         UybtWV0pyibX2z96/1qobjYKv6RLrzx4FzRQhgVgKIheB8tnzAIP3xZZBgAN+9MccQcZ
         0/5ngFuIrWXf0pIESwWslXD/QMl0toNf8fHJX6OK0ZyKWq8uZlOYcHvGFpbuFIaTo7wS
         eFTFt1q/M25vTf/i9oWsQ+DXvpvuXatrFmz/U4yO0klI/7hEL+zNVBuE/XW78rvPXAm6
         xOLKYpQAHp62mq2aZ1FWy3WQJpYnLXNiMGFpfcVlPqp8jeLzRKDdGfOO3mFkjucm728B
         SU0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HVHtDE29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si2370838ybt.353.2020.06.18.07.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 07:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HVHtDE29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlvCq-0007ZD-Uv
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 10:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlvCi-0007Y1-5L
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 10:07:44 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlvCf-00065L-JG
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 10:07:43 -0400
Received: by mail-ot1-x344.google.com with SMTP id u23so4594309otq.10
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 07:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tTIdqA9YBmh2AxRpFhSPhVFkhn0l26ciempdi4X5B04=;
 b=HVHtDE29ABOMWzH8KA3Ak5EqOwl9i7stCtoYbjrLcyWctLeP0Gewvs8cX4Am8/KatC
 O1iym461vqvxG9SXMRfUEA0lw3w/2Gtqbddll9uxGFvSTCPfcd5gz3wq+rkKefGitV74
 pNdOyFSpUhrIUHdGi3BHxpI2PASJypIbI2rgMGm7b11RvoBwcfOiuAhObr9vmoXqdlyR
 f7uNP6kONH8wOZQu3KR69siWsLl8T2KdKHGi8RduB6goykOn0T3DLj8aiG7G5z3Zz9Xv
 2E5B/gMhtiPUeSws/7C3viV5yA/XHF4VCLP/bRiaFl7mM4ap7L5uRfKG2M5daMuZh+SU
 UA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tTIdqA9YBmh2AxRpFhSPhVFkhn0l26ciempdi4X5B04=;
 b=Rf0akhN/KQ9VGVJfzXMJ6eJ6VHQ9KYonWuz7cB3tfB/N21SwhmFl5hzaaAzXC1bpr8
 pf4xPwXDUCJDKCDo8yqC3S5UhMem+v53d/BWaxDJRKjhL2ybE0waaHRUua7UY3YePN0f
 RiEQcnznvU5Wv+7xpM6uEYuAsmHABnaq18FXyKvqm3BIFsiurhK0hfgn2XIhay+TTyde
 fBg1UrUr9hnUJxEuLF/KbEmIvCQKyvjHAnuEP/gJTcyHun41dwHf1JhNrD8bov5QoxcH
 sbNy3IiEAOCwhuXkwepF2qOkhAYQ9sYBpzUX4sx13fKH3RbRLIXMQSTLMr/yFttbqMbi
 MWJA==
X-Gm-Message-State: AOAM533w4mn6yOKBbnhbUtW9TauMfVBawDUiPDRumij5hZv830t++WsM
 pOYUVq42mwgpZGD9kq8nOuNeIxEkFClDXGVGa+RXSQ==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr3657411ote.135.1592489260114; 
 Thu, 18 Jun 2020 07:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-18-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 15:07:29 +0100
Message-ID: <CAFEAcA9xZs3ZDkmp7ndbPct3W8VeH8cWuKxZZe_MKRXoujoTyg@mail.gmail.com>
Subject: Re: [PATCH v7 17/42] target/arm: Restrict the values of DCZID.BS
 under TCG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bib5Jr6IWz8S

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can simplify our DC_ZVA if we recognize that the largest BS
> that we actually use in system mode is 64.  Let us just assert
> that it fits within TARGET_PAGE_SIZE.
>
> For DC_GVA and STZGM, we want to be able to write whole bytes
> of tag memory, so assert that BS is >= 2 * TAG_GRANULE, or 32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
