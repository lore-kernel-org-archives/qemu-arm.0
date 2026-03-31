Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA7B1061B21
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 10:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7WIr-0006Sc-3j; Tue, 31 Mar 2026 06:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7WIf-0006M9-Jn
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 06:26:24 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7WId-0003xd-KD
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 06:26:20 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64eb84d1e37so6544138d50.2
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 03:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952778; cv=none;
 d=google.com; s=arc-20240605;
 b=MazRodOHlW3hPw2lH4LrM2r/zaicrJ7m7+auByIaMRD63LoBRPj+UbP+jwIhVpOYp1
 mD26sY/wPKT1LBbEbAkHnr7rpIc55+PziAy7W+w555VtjnTtcXaPmanlN2WTcV0QzCXe
 ztvRf+DYuZPBZ4WvPnreOCjlRUjihWd4QQf1YMMkQdUH/VtgH4v1a3bcuEUd9zH0v+7d
 MFNchM/0xWG2pLyptSWMan+VOMsc5x5oV++HZsUaVbL17XGyS1LJRm+wusYvnGdUk9kw
 a/NQmyozwIi9sdZVm+QauFIMOOOJ3abk1ZEjHHCrAgUtCPtIwpcUx51eLtEZxv6vhtMy
 Ov5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OGJakI5/s4cFR4SR+pv32nqtOZb2B8bhCrtZ7SmTN6s=;
 fh=64wi3nL/qkDsVdEJoazbgMLHAf18DeeqKcFqnUHQ6Mw=;
 b=F9fewD7r22LuS6CRtbJBPIlp6WjhgHImKVmZWxkje3Nhtg0vs9XpJ7WRrdbFqZQASN
 VSGeYxUyDg8g9lPm2blMI+VBo5n4X5l28W/KW738zuFVv7MdJANVG47wFYBwkvrOHSV3
 B634iWfbK0/6BX2FekUdMg49LkBSD8nH5j+bf0uRAyyp1uQi7+NEVKh0adhEgsL56E1d
 H6IBgdZ3lm4kdaLj2IpKQAhuQ+yZne4pEddKRCt2iLM0sS9sNNHdL0V3W6fiWOimSpu3
 sG69dAotOMxqji63MYxz0MM+Y6Gx5UJ3ijsSRj5Eh+r3OFgBzUSyAA2vFq2PSUH/+PqM
 wnmg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774952778; x=1775557578; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OGJakI5/s4cFR4SR+pv32nqtOZb2B8bhCrtZ7SmTN6s=;
 b=HzXQrk+KgscWNPHhVwt/PlO6CFzXBCpC9VxMwrNrMEPXtgjBNjAHQ/Tc/v1Iqb0VxO
 LaW+Sm3VI/vJkkWhzhrdcMe7XPWilqH0s2dnMwLYymzs9UrAc349+iA+o3Jlupem0OmY
 hqaLcn3W62vx0ED/k1uWCLlOdDJYxTk451hkhfeGNQKyZdvE8ijbsv6BlEuP2zQrHZT8
 GfFBd8No6tOy9SEB+WSZByZFTpmH5mK4TMDvSJBCL2peivvP2EBasoGgMPtwzbaWDESi
 2BPkehW52cM4iS0eDoyCFMd7cxre1Ll9E4yq35nCzdc6DekJ3p2JsYXQ5UZZ3Z+VFWrG
 2H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774952778; x=1775557578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGJakI5/s4cFR4SR+pv32nqtOZb2B8bhCrtZ7SmTN6s=;
 b=SzLw2XOf+srs0tuZwsNH8Gt/Ug0zwqxnh5RCqHNMEtaxaxtTjMUi4kSbERYfA9J5Hl
 IY9tCFZ4jivY6YgIdFDmkE6m5U6A+EJNEgrBJkeBTq7pvwbsdmTY2cbrcpWHv+CPjukC
 DN7SP3gqQIlZB8WElx59Bc7Mre8yH7/IFR0bpmXVVNRBdCSGXak1JySTxlGMBmpBL2BV
 kDr8PHXzyb5s9HUmlKlOWNwn9CnphBVBTymG/suWe8FLcFcSbe9nB63bJpcNtP1muMBM
 2onlJWZZxXt/rPbSiivObx5mxcdoFz6m2XVHrsUZq83Z8QjQM3j+wxNAK5JHGQNy5Lyp
 gs4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTD66QPRq2gWwB9uzaA5NLk4+Vy76PBhUCLdgM1KhaEFhnEtyBKpSIEvx4wnt8z68aquHavRBYQA==@nongnu.org
X-Gm-Message-State: AOJu0YyR/lpKlio08mSElOAimvivNSZ9AvoV5N3wxdQDTXrAU7z8o6zS
 ONtVlYY58tGxHHwmIhD4Ecf1QuSnlqrQ7+kzrNCIbZgYo3LqEEQ1K78gVXncdS2qJpvx43zLBbr
 oyNIoRNuDj3U/px0ejF5zqRBxuXAaLJGgf9hin+hx7g==
X-Gm-Gg: ATEYQzzarn/cOl4UGEdq+AcNT6ngjhjYkGGJS7XyZRf4z2+vUerKsain4bmDM6ke0lS
 7ijhirHvfLZDuXuq9bQUkwdABDm7P9vSLzQ/LnokYfQSsILPo1P25I7m8eyMx7CT54GfOyAkY6h
 zGZDsbmlDqD1BrfnuGbpsPswHB4nLxbhIumHsfKEYe69f17rKvLjbOGgswE0DMEjyrgMnIo+ts2
 I5gGMCkyrujUMLdhwAfp0QNycHLcjNPvHGrJkyMc0vefIfAqi8grWnk7Bszb1Z7xyLD/Ebpd5Ob
 5d81N4m1FXcYik6YfhmNeoUWjyhjhoT3VwDpwh4ctNt/awbhtT7H8Q+Pt9HjRT3fc7o=
X-Received: by 2002:a53:c1cb:0:b0:64e:a1d0:1140 with SMTP id
 956f58d0204a3-64ff7417a45mr12048245d50.61.1774952778436; Tue, 31 Mar 2026
 03:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260331040659.401397-1-tangtao1634@phytium.com.cn>
 <20260331040659.401397-3-tangtao1634@phytium.com.cn>
In-Reply-To: <20260331040659.401397-3-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2026 11:26:05 +0100
X-Gm-Features: AQROBzB6Gq1PMrYoBpiPk_DUeRVKsPx7U8027JPTsJNNntCxqNxqNp_-3j_RT4o
Message-ID: <CAFEAcA9-=VKiGYMxYMTPhnKovWxYyEcTGp3+Yw3Cy0H1pDTv=g@mail.gmail.com>
Subject: Re: [PATCH 2/4] tests/qtest: Add libqtest attrs helpers for memory
 accesses
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Tue, 31 Mar 2026 at 05:07, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> Expose libqtest APIs for qtest memory commands with optional attrs:
> - qtest_{read,write}{b,w,l,q}_attrs()
> - qtest_mem{read,write,set}_attrs()
> - qtest_buf{read,write}_attrs()
>
> Keep the existing libqtest memory access helpers as wrappers passing
> NULL attrs, so current users remain unchanged.
>
> Also add matching libqtest-single shortcut wrappers for the *_attrs
> helpers.

This part is fine.

> Refactor libqtest response parsing by splitting qtest_rsp_args() into a
> raw tokenizing helper, qtest_rsp_words(), and the existing OK-checking
> wrapper. Add qtest_raw_cmd() on top of qtest_rsp_words() so tests can
> send raw qtest protocol commands and inspect non-OK responses such as
> ERR and FAIL.

This is a separate thing and shouldn't be in the same patch.

thanks
-- PMM

