Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2419709ocg;
        Mon, 10 Oct 2022 06:11:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Y75QNl939rFXvKna+LBuux414U4IayUl3rlL3CXcM/ndkBxGBxZOkRoISk0WwoduNt44l
X-Received: by 2002:a05:6214:1c85:b0:4af:7393:3d91 with SMTP id ib5-20020a0562141c8500b004af73933d91mr14799770qvb.74.1665407460906;
        Mon, 10 Oct 2022 06:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665407460; cv=none;
        d=google.com; s=arc-20160816;
        b=OHX2kBBs+H4v5H3JSkfaGSuxAN16LdqtpaPCnxWT9uvLqESP6mGjpRCXYKovoIjDA8
         bmr4wodki5wLxojfR/wCYtD1jtanWuXEICvrcJBmL06IcwOrITsS2iuiGwNzQkmtFoif
         TcxbO2T/oD0fg8HczZe01TvekUv7PVpL/IaB0u447j6a2OIOP4jTol2VH3Yb0QnFJCOw
         SMd0L0SaoXpyrJJxeJcZ3U+qoGadLCMUMJjpOMRUe7xVxlY0myKO+8qX09fAg6KT3G3A
         14Hf7G5ZMEJeENNk41TqGaU04U64E8GsAAJr+Pt2BcN0m4rNxHAM6cDwPT6XnM6VTuKU
         69xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DlGgqI62L7OgfrviOXt1HgTQ4eB9ERsnrnYaUsjCytw=;
        b=iscaZzNBbVQsaqvS/4ZTfhZZK9Pn7qQ/74wgyiZUjmh1QJYmUoZJW6UJ/b2gUEsU45
         KrssktSfRKIp5jQQ4g2LMdqXpWg2H1Zwriey5lyjkuSY/SnhifA6hwOhC5p7LJiZ9gDb
         8wl7EGaGANi78YYsmllD4kG3Ge3JmDYPnulKnh5mhyAIz18yQpqhi2Exx6+22mdHLSp8
         TZzmjHzIHhhiXi6K9m1gbV7+NcAdEZS8/7mbzO1cmFaWA+HrYsYYRSyFmVlkdE4ckOpQ
         XFkaaxdAtwppkViaMNBF0+cAHMWSVD9BjzKF8x+fDao3/JLO/HiL03D0m3YHL8a9HcLb
         KV/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rt4+iWvL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a134b00b00392ebc43fe2si5617803qtk.709.2022.10.10.06.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 06:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rt4+iWvL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohsYe-0005uG-Ey
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 09:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsXz-0005pp-Ij
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 09:10:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsXu-0001IY-MI
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 09:10:19 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so9236015pjl.0
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DlGgqI62L7OgfrviOXt1HgTQ4eB9ERsnrnYaUsjCytw=;
 b=Rt4+iWvLOotDa8JuIKnFGdEJFttHZdDoquR5FLvmvLuAezAE5SG8IO7Fe8zvD17iwa
 6Tap6mTE1IOwvZig1BlqNpid4B2LM6Zu8J6muTnsN79tfOBWrYkJtYJqEb6PJ9DDeVaI
 1Ql35ySn3a0Rot4H1YkKJU7fMI1xnBHHL+CYk/HPKe8VnkSKmh9kEw7sxXj8C7dOsmt2
 IyGaQcv05WYa88LLIj4ordZFbkQ1LkJsHaZLYZj/IsTv1awwR/mfitueGPNQxNmdJ/2K
 KMYYmleD14f/iwIbetjQAo35BGZK9hrkUyh84KKzIeR6teNjuD5PExkcPu+AzdaCQ/iC
 ePMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DlGgqI62L7OgfrviOXt1HgTQ4eB9ERsnrnYaUsjCytw=;
 b=w+7dXTCBgf6HiPx0NbTJpj19odayPY6eH39ynz/76IVqThS9J/+ahZRwfEMtvw0pzz
 39MmsArKjZnRj75NXryaH9QbohRyuO5bcD/biq4URLYPpx9j5B0G46a4XyRxspObTg9l
 zuLdO0oLv6xFpiMPehrJuWzrt/8uN8u4MFtIsUYV6kS21m/fuxW3cA3KxK9Cr5YCeTTY
 bA8NYoPIdqFa+RtYixjdcm1JNcpGsikAf5G05uJod23apSJJQOmcTz6hY3b/dr5oEHRk
 BvG46DYcU/JMfbrByCK+rPA2x1n3Z/uVv10BK+x7b5+zNVHZA7G7Q7DsHTHG6Xs8lfvT
 3ToQ==
X-Gm-Message-State: ACrzQf2tWge2tfX6LN0SQExVx93nXiF5R0B2cvTGELyRktQHduLN9K31
 VTnqn7MNqCKyHfCadPBpeRvIzytOqNWf1L8/1hV8Sw==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr18857176plb.60.1665407413061; Mon, 10
 Oct 2022 06:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 14:10:01 +0100
Message-ID: <CAFEAcA__RTAL=DjbZ7pHR9O2x=MytMhEO-b8WtEue2JsPcordw@mail.gmail.com>
Subject: Re: [PATCH v3 00/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jgPYLATsNEG6

On Sat, 1 Oct 2022 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).
>

I've taken patches 1-20 plus the extra patch 1.5 into
target-arm.next (last patch taken "Use tlb_set_page_full").

thanks
-- PMM
