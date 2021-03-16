Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4254661lfg;
        Mon, 15 Mar 2021 22:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj2FVkgjlo2LjaEb3mOXr9jevssLwS0U5VVeYVDoXqqKxWA5hfiaTlNE06c3dPIgoXoIpg
X-Received: by 2002:a25:824c:: with SMTP id d12mr4517823ybn.137.1615872853807;
        Mon, 15 Mar 2021 22:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615872853; cv=none;
        d=google.com; s=arc-20160816;
        b=yOybrOjyyFT2DxMQhwnkrTcTpe9ye7OulH1JXAKum7G2PRWn1j/s2VnRa6ymZQ8P7G
         cW6ieau70tqOz114zrCctE9risWy2kA3do+crbfXSwi/DeJN2XDioN0XAca5PgrPMH8s
         QmtBcvnVfjRy4FXExoyyWih+PyfRnQ23u/KG++3XV1uPgWPwtM7YBREjpl1CBtyFWNPc
         C7QhM3/vzDVYGX3kbqWHgbdJtnPvsdtgOajyVexVnX2aqS0kMvCsCEWyf+Xy2nImJCCb
         mk7LEqM6a+hcQyT1BkRvkYfMZS/4P5piSzHoyNxr8WH+6o2biFcBAibV2chS69n29yGz
         LZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-signature;
        bh=R9ldjAiXpGrH/lgKnvagxdnK5TDI37uf45CxoENqUpE=;
        b=uI0U+YXqL3YOjdJ3AtX0F+RA9OehFv77L4/cvx+mTFJYw1Alpg2dOeEIiAq957u52K
         HHoFu6vSc7hQLd+AydtmnML6bLqqAf3XN310qhGwe5z6ENzjBYoHXlG/XZq3yItMdE3T
         JFLsP9jNbDUJpE7j8TXo+NxGX/opmFDiL/7gJriqIt15cRdOGtXH4l5GqGOXxJp+WCOe
         jI8hCz/c0HNLvsvZTzzrnBJ3iLLxkpHB+9UNr/wvTuw2G+em4HjqkBB454aJ/O3GuVHZ
         p/NpKMqLh/RpF+XQ5gj9q2D3gK6bN8olVU8RxrfN+FoZzXaGV7aVqrNWL8PujrSjfUhz
         tcBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=LVWKnOr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si17677900ybp.70.2021.03.15.22.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 22:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=LVWKnOr9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM2LN-0005HR-71
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 01:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lM2KO-0004Vq-77
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:33:12 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:36118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lM2KL-0001OA-Le
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:33:11 -0400
Received: by mail-ot1-x32a.google.com with SMTP id t16so8072138ott.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 22:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=R9ldjAiXpGrH/lgKnvagxdnK5TDI37uf45CxoENqUpE=;
 b=LVWKnOr9UcAOQOXtleX6sw3ZlBtVjehRmlRhVK9Lc5z5WWwndX+jRXV8EC2D3fSfuw
 mFs/BHFO72LAbCkOkz7udatew19PkM4lPUECaN8zShv0sjzATjSb67mNoRMCfGRjNtEU
 9S4VEG4F+4eL6c0rA8RjoxpDNIX09OGnW7iTO38lzbhIeko4lbdx3szjmJyv6FGMljx1
 0TncSfAlTKnzB4v87bPxHzgFZRAe5GO1cAAjQ+ZTTXBkCIw8IDOKAai2LBKoszrMok/N
 LSslMDlveCHBaIVJHBnIQSzvIFESyV0/OE4Gjt/J1dmyVouc8mWQLeK1h4k0RNYWdbKM
 KYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=R9ldjAiXpGrH/lgKnvagxdnK5TDI37uf45CxoENqUpE=;
 b=o8SSQh0MRLBkUnNbPJwmFf67WwLeF9Pn2GvXw0XFTZFMk/AATD8c9gGiA87V5KmLGD
 YDFwDyI1+tKmkCdYvMNnXPmfgTyrQvcTLC4NVWXXqv3yOVWWg9ZwKgFSw1WvzLQusd7e
 UbJ7dbIV5S2D/We/srSM6w18H6Eg3njxBsaAgW4dF1bGEhuy58RM02TEs824YahCcIuk
 aTVB7BmrG7CfFVKgbnKh53yhumHuhrf9+CRygDo4RghSS5qLKyUg9VKf4ngys76b4L7c
 DnnMEjoNJtpBd+POwZ1g/k8X6MUmfFWxsrtMFr8aXaAyDknU8XEP1k5W1h3lnK7HYCxx
 GFBw==
X-Gm-Message-State: AOAM532qijNY0KkhD3x6PG2ERd/NP0qATBZRhbJHoQNQ4czKmVPNh5n6
 FyvVFNcsdXHIdiMHz19jlWeg9gxfgfTYi/kERmh0HgnXffqaNv7QTYO9Bsz7WHiDOcBSSgu+Pwi
 Y7IwzEQqkFQguSvNTHZIKwvfcuGc8P5lZwE9BM+yL87Z/0FFFdHqznxO3nwnsMKOgO3alU6A=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr2091803oto.151.1615872788244; 
 Mon, 15 Mar 2021 22:33:08 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z8sm7024313oih.1.2021.03.15.22.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 22:33:07 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Subject: Bug in tlbi_aa64_vae2is_write: tlbbits_for_regime called with swapped
 ARMMMUIdx_ values?
Message-ID: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
Date: Mon, 15 Mar 2021 23:33:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BFa0sAUNXNpm

I noticed the following in tlbi_aa64_vae2is_write: it appears that when 
calling tlbbits_for_regime the ARMMMUIdx values are swapped?

static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
{
     CPUState *cs = env_cpu(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
     bool secure = arm_is_secure_below_el3(env);
     int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
     int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : 
ARMMMUIdx_SE2,
                                   pageaddr);

     tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, 
bits);
}

-- 
Rebecca Cran
