Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4292502lfa;
        Mon, 19 Oct 2020 16:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVn3soZdfyfplRp4CoJUJurXRavbvebJkDjIlrYHm4nSOSI+MNgEltP1h16Pi5IYEZYVsI
X-Received: by 2002:ac8:75d6:: with SMTP id z22mr1945496qtq.158.1603149727016;
        Mon, 19 Oct 2020 16:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603149727; cv=none;
        d=google.com; s=arc-20160816;
        b=jFW8D/vv4cMvS8GLFI/8Y4vbKV6rfvSEKu2IbbGCBtQ9+hnoxd/g0Ucj75e0S+pBwv
         gYazgfJTC/p29b3k39TuCxwe7K1czj/S/NHVwQ0DgrMgA1ywfoDn+6wcpwpciSiwZJEY
         WtcF/V+b0LYT+Ek6kdtrHqzIfI6GcZ3GjKqziXm8N/JhS188UOdiZvkpSbV4ALyk/pZl
         keiY0KPDxfJFm/dcso8CaIDw43TJOmMg5K3JYVmPtiewSGN1ebTX7xjDwdjVzAV/cBU+
         9sVsp62Y+7CYFVUPPI35H1Tg4Sbf3AYufYqM9KMrIPdzIrkRZumCBB0rhBo1X+CSqbYY
         m+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XZbyhQGZdaoUeQwkWb6o6aGxcF2rkEztvcTQoIWH4uE=;
        b=0HgJvdHfLw8Gv+oTh+E72G1o+foynmi2vwS4NXSakyzRM7K6f0y3o6KoLMetVzaH/7
         nYdgmqTqMq2nzSMzuU0KO3kMWapOCHnUIXt7BT5hCxlzG7tafW3XldF/eNzz2bbT7kC/
         DxjL17Q3xGy5XwFyI6sU6c5XRYQeXwg9yPobukUQxUHh3pp4vK/IvkkoCn25TcJm57cE
         exd9XQy4qy3VAGJ5erppqZxEZD1klallXZ7cJAD0NYEO8W981Lfqa9uy5C+W65nJnEqg
         lUd9Rtm700BiUPOdASDbM49xqZDlU3pxTtLWs9Yvdq6adWxInMdbpStjkLjtrLvibE8i
         SZCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nhvb3Sff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si627402qvq.110.2020.10.19.16.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 16:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nhvb3Sff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUeTe-0000vq-EN
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 19:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUeR9-0007Kl-H6
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 19:19:33 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:35852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUeR7-0008UM-9F
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 19:19:30 -0400
Received: by mail-pj1-x1041.google.com with SMTP id a1so67409pjd.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XZbyhQGZdaoUeQwkWb6o6aGxcF2rkEztvcTQoIWH4uE=;
 b=Nhvb3SffknGY7sijupVvF7owMWwThL0FL8GQfhjhOUAtHaITlG2YoGhgiIPjBxX5vG
 sL1/N1iP/Zc1fZZN7xKj3n/JrBb25vekzdTd0MjrnS8GUU6GCRQUxVnal6pkydhiE5jq
 kh0myQ/B1hI2NBo782A3OLTZ6bpQb/R3SnnvrJLsUEjUMOM4e6da9ZuTBjyECGM6JPIs
 KAxgEI7rbKoFVDRGv9/FO8XlOaaLM/UThSf13JDXO5XMKuozorR7RScmYY7xkTXHcRG7
 PT9N+Z92KisWdBWizuqeL7ys+yRg3Z56tdpupALEMdD/97BYuP1zvFjsZ3BkJmlh79RV
 V5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZbyhQGZdaoUeQwkWb6o6aGxcF2rkEztvcTQoIWH4uE=;
 b=VsMriBuIUIf0Kg8AG9U368+rW7dJKz2eCLopo49J3Y0BEmuH5NXPk/3Aw4vDgklM0q
 2uQNWjgCbSVtDyndo3RVwaOsfuklFp1yg9PgsvIuX5pDgNZJn1GHBtH2evBhFKv+cOQ7
 yCd/OG7GnRlOjEjrJsZjHwjDtvrBrZ8hCVL3d7+LVXcKFHt5rtwVIQ5As73ULVHclmg/
 CbOIWk56RAXhGhqOXCFethyn2DBgRfcbYLSUo5RDQG1tjqOS6iDEwg3Q6mGLzFSnz8Gp
 ppCw57dXLsSwxZvQxX4M+yXTSCzWgvBQRBJ5eBoYZ2crAtKGlvfS5luAddAQet51pqqO
 Opdg==
X-Gm-Message-State: AOAM531Xf944P4clgGuloILrFH5cgJUtQTKnhdZVx5KQuYn3RGHL7+Gs
 HEVO+C5NHlwlo7xvsGmx341ewA==
X-Received: by 2002:a17:90b:3649:: with SMTP id
 nh9mr109203pjb.123.1603149565605; 
 Mon, 19 Oct 2020 16:19:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g22sm52588pfh.147.2020.10.19.16.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 16:19:24 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] tcg: add const hints for code pointers
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20201019013928.72770-1-j@getutm.app>
 <20201019013928.72770-6-j@getutm.app>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30c59d7a-a11f-5d9b-4dcc-eb8cf120a4cb@linaro.org>
Date: Mon, 19 Oct 2020 16:19:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019013928.72770-6-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:S390 TCG target" <qemu-s390x@nongnu.org>,
 "open list:AArch64 TCG target" <qemu-arm@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhc@lemote.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /NZcLsFXCju5

On 10/18/20 6:39 PM, Joelle van Dyne wrote:
> From: osy <osy86@users.noreply.github.com>
> 
> We will introduce mirror mapping for JIT segment with separate RX and RW
> access. Adding 'const' hints will make it easier to identify read-only
> accesses and allow us to easier catch bugs at compile time in the future.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Are you "osy"?  We do need S-o-b with real names from all contributors to the
patch.

The patch is bigger than I would like, but it all appears to be strongly
connected, and I don't see where it could be split.  I'm inclined to
cherry-pick this patch out now to avoid carrying it around.  So if I can either
fix the --author to you, or we can get a s-o-b from the author, I'll do that.


r~
