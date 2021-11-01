Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2415112lfv;
        Mon, 1 Nov 2021 11:53:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymZyNuvik6Peg7yFBXphVzXdhYcaq1A2b8qkaEpsLconASPs6Bj269Nzjz7ShVlLcmoZhI
X-Received: by 2002:aca:aacc:: with SMTP id t195mr688276oie.118.1635792781255;
        Mon, 01 Nov 2021 11:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635792781; cv=none;
        d=google.com; s=arc-20160816;
        b=DLYmeQjgefWQerMuag+wJ+ZpcDqCe3NhH9ERnlXzGNC6jVDLT5WgydUGfHWxRrnczg
         Xzj7sm6mJbSrQpkV266k3+D/8eA9mjilc4nYBORj6nZIFOdqjJke08wL6ZRGe6jc2J8U
         9e0Lb+0WWw+dQgVssUZhtJ+Iy69WsOvc59Xvc7alNJc1qIvR7ZHB3dOyusN5AWNtG0vL
         UGrQDeYiZxX7rtWc7pWZqYVAzOHp0kVvHErNe+oTqQQGhBrLeltD8CbRs4V5ocm2vHer
         cmj9v7SWywAAmBdUa+LWgmRu8nqpoOdz57z6ahhPYsgWmQwF9Xm79kk1+XCrmEUdzqFM
         Jwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=okFKJxfEIGVGgngTA6Lo4zgML9Fu17at0qBnc+vlT9E=;
        b=QMKFCHqR9KTgrjIiO68Lf9CjPheO14l2JyuYn/vmTNE9QkK4fizNtjsbF5M6GgBiAt
         gXgZe63P1fo319B2noVSB1nJFZ3l9k/wfFNMLM+zjyiYq2nzSqs5sMIkDbZtYYzh+laH
         3r7OwYlkKxB/V5tiJ7MD+7iJJeE6+nsYSZjUaW03jTw7bYmMgVwZsNVNYxpEdjom8We9
         Zuuld0q1IqqhHzCSDXpghZ/08w01mS7Bq7TEkSrIWvA3z/Tro/1PzO5KnL3zOZdHEWOZ
         3wNWQMBsI+UompaulTBDkkpbf+/ViUNyhrSglKnaMpqGXHKCU2SW7RMcnRAv5xjEsvSK
         u+rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cVUEc1+2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g98si16502583otg.29.2021.11.01.11.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cVUEc1+2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcQW-00018E-Hh
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbG3-0005wb-K2
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbG2-0004tD-6r
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id 71so11554343wma.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okFKJxfEIGVGgngTA6Lo4zgML9Fu17at0qBnc+vlT9E=;
 b=cVUEc1+2sIZF/UrUq3ABINu3A5nHbqgWqgl8S3w37QMCFT8EJrYpVObCQaOFkF1nFW
 21uy1NlR06kXjeKFcdcr2UKMl+YKX14vyFa04rG+C8K/Xq6mcIVEsLO7weJ97a0uxTYt
 Pf7zGtczJhixeghIxYDOVmO9wafRn+bNx3DjQ40Y9FM7fg5aei3Kw2rYSZ1JnOYqv9aE
 GlFNMavmOFdjfroT4yFK/WN0OEev9mV9xehWK61KIZJUDMafSVw09Y2vfh339eIUnSoh
 GjgoFb0FXKzGiDZ+OGIqr8S9Ft6XCN3fsVI9Q9hL5FGh/c8eD5v+bVvih2+tk8cyr0BS
 3Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okFKJxfEIGVGgngTA6Lo4zgML9Fu17at0qBnc+vlT9E=;
 b=byZUPF7m4Thep8oseYQpRIcTBIOGUPqsmMNj4ZVN4/TLYHWbCXnG6ocQ2ZgLY+B5md
 TLqOUI9h5RdRrr553a155UPY9/uaeyaIQ96vgECCzAJaLi07GbEDHsfvqT8QHsPwqYec
 aSL2YKC/vHS7jVbnttkEMfI9B/z5VfZEVBR4PxMA9BKN6bcOOVTx/quzynHKEn1gkR3h
 Ftm+aZ8M/3B/h0NBnQTsvARMN9BdBv5YS9cYmVrZDoot0GZYj310ja0THq9tIr3PZYok
 0t1chidUpn6GThxKiFRl89HCsqwuUSREiwzCTXjEpWROjjFE8eBuSyrqjUVNdEZrXFNU
 S8mQ==
X-Gm-Message-State: AOAM532fb9JyI0b1Xkbew5MSojKx10LJ5hvWYrY0QTj5JnMf/LNEH5jq
 ufUh4M22R1t0ycw6+IRqiL+H6gDWOlecWQeQu4q1Hg==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr378552wme.32.1635788284653;
 Mon, 01 Nov 2021 10:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-5-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:37:53 +0000
Message-ID: <CAFEAcA-Vq3J2a24_gRc_SUJ0Wg63iVfMi3OCzK7TRe4c9uHM_g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Titus Rwantare <titusr@google.com>, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FpCCKTshI000

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> Our sensor test requires both reading and writing from a sensor's
> QOM property. So we need to make the input of ADC module R/W instead
> of read only for that to work.

"instead of write only", I think ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
