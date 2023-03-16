Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp131930ejb;
        Thu, 16 Mar 2023 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/1wDjuwaiwc8h1WmjsmD5vk7V/ZLgBET5ZUfscq/I4jrVhPYdDdQX224u0FkuNPuAN9BuI
X-Received: by 2002:a05:600c:3150:b0:3eb:5990:aea4 with SMTP id h16-20020a05600c315000b003eb5990aea4mr7262138wmo.12.1678961554303;
        Thu, 16 Mar 2023 03:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678961554; cv=none;
        d=google.com; s=arc-20160816;
        b=RGJtgptdTx6Rgt0GtSMOmHBs4PY/yhC0DURmFYWtTMzCvKZwyqY3tZLOjYUoocb+4T
         nEbbTxp+vvb3WsX3HplaOioDmzKs66Cgyym0hbmanudv6XCaQmwaD6ljj+mXj+UOH1rz
         OZ4kTvZcBti87Rzv60aYr7DJt+nibvS+pfwwmJYVNMcy1ELIZwkRM74IzBdk+58fxa10
         r9vJ4V3hO8iehdU7WORYvb3+n0cwmWF+tNJIAZq2rB4qb4/IMB1ZRiSujiVHGpZQt/bK
         Lpr6zXMfUoMi22GPdklxud8rKq1uPfYUa4DH7YbHDU39THfIkOKE/bVeGZ4a2qTNHnTJ
         kHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fc4pvrXgtE2ZNMIye4ezRHM5j5pVsWdJIf0ztbDxvtI=;
        b=DxVx0GR9oa/ycxSyM43q7/k1AXiabwKLMYLDC6bAqFRIwXYNEI8aqIu6ZFw0rCwkrE
         jV8ftZbm6eOICSRd+Tf2F5p2gY1NLt54vns3fKb2Nj9NS/X6ryNm/shfpGOsh6+72mz/
         Sh5rs1MdLcVfM1lkVattWXo55ZOdmcWBuDmaiyRs/ZgrU6o/qtfgm4no+SDytKealVKL
         tkoxqfRRkApAKQ3/F6gAv2REwoBa7+2KDIdoPEA08ojBezzwQ0j3IeqK02r5kNTdwcyP
         EE4OA2aSJmBadVKuW71YvjVCdTaAezWXRin/F16+pcZPZJC5N1aAoXW4IWWe5hg5j5uZ
         hgVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N2tqkpfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05600c379400b003df218db64fsi635178wmr.216.2023.03.16.03.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 03:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N2tqkpfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pckap-0005Tr-79; Thu, 16 Mar 2023 06:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pckam-0005TA-TO
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 06:12:17 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pckak-0008KK-N0
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 06:12:16 -0400
Received: by mail-pg1-x52a.google.com with SMTP id p6so611029pga.0
 for <qemu-arm@nongnu.org>; Thu, 16 Mar 2023 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678961533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fc4pvrXgtE2ZNMIye4ezRHM5j5pVsWdJIf0ztbDxvtI=;
 b=N2tqkpfkaBMsGrNkgT6vrhJ+DPrYMQyHPurXodMzvc3rPSjNfNivHgtNA0q6byLdbh
 ZPZDefF0WTreViOtkp2jZ1aLMCur6Yk0+lQC7iUHMjg6H0dQgPUn7EqsQj+BWSBrzklV
 o013OB35LbXqsoNcwpfoyCw+LQZFRObpKjDpD7um0Nwh43bmUoOl9NSc8w/OHjdSsoU+
 cmjvcWonxXecDrimw8kAXH8o1rdL8/L5xMmWsDRmchbhgnehCtxRzqRnBNr71+m3XhRU
 SRhExSD7D2YUGZ+wY3Up8hiJozvCCzfeu86kUsDiGhuzQQzgurVuVy3Cbt7JhGdEysFE
 CKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678961533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fc4pvrXgtE2ZNMIye4ezRHM5j5pVsWdJIf0ztbDxvtI=;
 b=8G1pXNyCVoVBBZFHH+OklTQ40ADMjBrbCPGju2xRJRju9IiBFWAN1LtM/rl52R25SG
 49QfL4XOdZrin72DlvXHsD2c4ZZthOku5mkvQfJ/WwM6OzPp2Kchm9rjxuTl1miXUqzZ
 c+aXlZyzF9sxVbyZ5y0riAPxT2hwSZTJexhz75KBUo8z+ElxN2NFFLeKjrM1vvdUMF+p
 IHj4IE+WmvrERuyXfIZ6q3b9xPdzq77hkbnliuWwGvZk3tzcvx/8ENLzuvN0rEu4qqgV
 eKmZ1VPJX6dMKdxFP3BrdYIQ0r5G+34KshTSwJLA+VVSrPp7Fi+8mg0q3EioQIGuYUcI
 zKxA==
X-Gm-Message-State: AO0yUKWDjK07KjqYcJMagOMoN5GHoPMo9tqKLsZUaBjwlnRyOFh1AYRp
 u2ihmfcUnn/HoTZwPYpyjQNJ8gIq41aW1Pp4W2cjKg==
X-Received: by 2002:a05:6a00:10d0:b0:625:d7e6:51a0 with SMTP id
 d16-20020a056a0010d000b00625d7e651a0mr1409260pfu.1.1678961532862; Thu, 16 Mar
 2023 03:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
In-Reply-To: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 10:12:01 +0000
Message-ID: <CAFEAcA9MGK2hs9PQ3FDG6jhc-UZja6Zfjg4_NEBmJL7OfTwYHA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wpGGEJCgLXtY

On Mon, 13 Mar 2023 at 03:39, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> ---
>  target/arm/cpu64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>



Applied to target-arm.next, thanks.

-- PMM
