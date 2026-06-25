Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE3CDE001
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 15:00:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclZG-0002yF-0u; Thu, 25 Jun 2026 11:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclZ6-0002lm-6f
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 11:00:28 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclZ4-0004KZ-Ek
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 11:00:27 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66493875766so384037d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 08:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399625; cv=none;
 d=google.com; s=arc-20260327;
 b=Qd5KDKhwjYoNn3XCSvbTWEGPV3e0utT/xlFxGqs72FM4BGMBerhx2GDif6iUBDVr3U
 5wSFRZhsBnOAXvQg39/wFHX0NSk8QSjV040VsQnV6S33rdO5MxUDtDVyfxGMx/n26kBE
 Bf8I39JO6p9+HfhWSwWGo5CYmhowgnblGtqxM67s+DSdHANk3oTV1tswVn/kXs0RXjhR
 l+1dlMl/JZPOK2st6yBqPRkvQz099P1L/ffXi9QvxNBqMZJ0gA5ZCKRWnRaMkrptl3zL
 mMrtW4jfAo3pNe+T0PQoRbU19KyC6dzeGWwdPH3UdOd1+eFfTuC/gNaE7vcPeIYVzhfh
 ZeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dfgXG61S4y9QZs5MmI0UQgo4J1SUZuJMXX7wQ0cwHYI=;
 fh=Sgf8qKu0VqB7kv2mGeJ0iAa/muC2L2c94xonZv8KB6M=;
 b=SiqS9dMhhA2jS9YWHSItG0P43QqXzzoMYPTN6HEwjArx65JYvtW/I+b08Pgzr9sfRI
 GmKXSn6tzxDen6segxgsRNVMI25fhBDleiyEBmmGjTNU4MuRDlJ9ubmZG+rqHKSSFRe4
 PpDRRSvtDmv549HJxA+Keb2IZlT/0lfum8LlhrGMn/TYj1qqI7ipp5AUQOkhsTOxdxZA
 NMxghjUmLZdB1c0Jjsi3uRQsD8Jztu+X/Dd65640oJmwTb2YfKXHQqKdh819HlUn7C2b
 SlLSBDix2YWYU7yjIpoif1n4i33xGQXGQFBBCNTtEpL65PdhFFrC+wc2V846076rYivS
 rxcQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399625; x=1783004425; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dfgXG61S4y9QZs5MmI0UQgo4J1SUZuJMXX7wQ0cwHYI=;
 b=hHtHLtlyY4ZsIiu1OT2SDtn/eti7qbleLD4Xb4b7VfsUtL5Wq00bUkWV4wapGzLCFm
 rZ2apb/xFUG8Ggmq4XqU7JOPPwQl3lR3wetIhfX6UkmqSXGZvyG18Xh9OTCTEQRnGEEi
 Sut+YdKGjH5Yq9KRCZE3VqPz78FlsxSg0FrzfqNnY66xK5TZFiC8sjyaq00gYn3t6kHh
 CWDSV1mdXfaPzvTgtFXkil0k0rwRnnYYlHLJtNev12qSG82O2Zv4RfnlXtggv8l2XdD+
 d26LHdtF058Kuw0vP219quwbSIbdZXvp/TVTSN8zn8DH1VTwqOzY3Bhghy74ka5qbE64
 semg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399625; x=1783004425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dfgXG61S4y9QZs5MmI0UQgo4J1SUZuJMXX7wQ0cwHYI=;
 b=dGMjv77aaPZAVet/CmtNfljVaRVJ+H/ibyngyIcmp+wEjWMinYtwN9G59kunQMi/yq
 m1Mp98Cqq7FQN5ZpGnFMqCHsQl1Wgs5c20MfrQZS/o5wZobkZDqwPtc9p3yKNuSUBKf2
 Eo2q4a9uIhBBbOf/cN43qW88RM4yIHBVXiDPSY0Nw/36/rrv7A/Oj1s9jdt3N3YbmsUL
 WXjwqa6wqaP9sqsIEJ5gQfXBXA+wPUZNL3gTQdhMsfLov6z1Grmk5OBZlLGEe+POfpDJ
 ufdglRGfPLIhqk9vjigG65sdlaepmzmNnQLE3bdk6KJ2KQSiGL82i1r/ZoccL/EfKxOc
 OWPQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5/KpuLDHkoj+IvOUjW2elcbSkuU7onEF3HbjHjTgHaN/2Liae5aCuCiiduQyX+/c648KkKAjpFw==@nongnu.org
X-Gm-Message-State: AOJu0YzJh+vuz5X/QDc1cDJpKes0grGnVgxSD+rYcpGCyvV+hBgbISdz
 xqhRMzjXt3ogDsh7hzxbva57SRqlFfW/wufZ+0ZMsKeUBvhKfO+DuxHCJTnuRGH+LYyJIdKWJHv
 xl6uoNXLLgCxJDnnrirNOS686utraA+7oN/iOn4idmGRzXSn32q7+UB+rsqyH
X-Gm-Gg: AfdE7ckdPMgas6rcjr/d2ydZg+G1oKS6Uio3BODz7h6xmpt9Jvf83DNT5it1XeRlsQU
 lwkxbOZC+CCCJFaz5dYY4JFt3KMcLh6Td3QsTH7ASEZEyANzh4ZaoOP03ndG5KI0LLY2LqpPFs3
 wB2wmEqdfe+yIo+3hgJh8oO5/ZtKuDaJgLjAHSMtFm7K5wXB2eZsiW249uYzXszhoTHPbqskXFP
 o3ZKsO49u5cEiKNq6qavMaPP3twI2GWL5gNZ1afOIPhUpBxK4Lm5yXXRQsM6DjiSahGplL1l/gE
 pIAdZgFfMMok8kbgMZWXaEeu/Edf4Tu4GEopvwO1WstcrrfgErw1c5/Z
X-Received: by 2002:a05:690e:12c6:b0:65c:6dbc:39c4 with SMTP id
 956f58d0204a3-664883cf072mr2064803d50.51.1782399624698; Thu, 25 Jun 2026
 08:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260623170354.43981-1-163wangjack@gmail.com>
 <20260623170354.43981-4-163wangjack@gmail.com>
In-Reply-To: <20260623170354.43981-4-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 16:00:12 +0100
X-Gm-Features: AVVi8Cd-jtKXwO_oqqYC44dGW1pgj8FSZMSOD21cEwgjob0sns7mLlNEW4K18PY
Message-ID: <CAFEAcA-ALs7TtxySitahcYk_P=99uh5078Ux7==Kh4ER+EQPRA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/misc/imx31_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 23 Jun 2026 at 18:04, jack wang <163wangjack@gmail.com> wrote:
>
> ---
>  hw/misc/imx31_ccm.c  | 33 ++++++++++-----------------------
>  hw/misc/trace-events | 10 ++++++++++
>  2 files changed, 20 insertions(+), 23 deletions(-)

Other than the missing signed-off-by line,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

