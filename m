Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1628073lff;
        Fri, 18 Jun 2021 07:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1t0IuQMes5NeoHNkKl6vtiZtxCn8XLXCSRaZrkefBNTgmUJa0Ph+lKWOSu1+UkLedMsLz
X-Received: by 2002:a5d:5271:: with SMTP id l17mr12821008wrc.142.1624027547869;
        Fri, 18 Jun 2021 07:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624027547; cv=none;
        d=google.com; s=arc-20160816;
        b=g7biskPCt7c+LTVhy+cXrZwBlaSFQJW8Jx5DTCMi2j0ty2EoB9QJilz7MydRUAFxiX
         L3DCudimuR/J9xkHUlUjQogo4X4EtorT0eRLNg2n5KSD6uF6sEe6fuTdCe0KZocfg7BE
         ugSdzs9BXU8+SPsPfIS5mHZEUZCSQpdEdRPnUBQJsvdrsNKrF6+X0yUMrDQb8axwZjYP
         aGmVIorRATwRwBiO0MSI4unnwC3QlA68hsYHkep1017S5YgiWBGWhxIfes4/znOdfYj5
         DN0dc3MN4/cx/075tUWoyd6FE/fMhpjPJOPEl2R/Do9ZL60jGDq9J6sk/2xMtYxfLqgQ
         QvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h2idtcNg73Ez5P3bSTmn0ayv02j/HEPwlAJMMROze/c=;
        b=XGRW96l7SNtJ3ZdUGYRId+GaKrtUPVUbGkN0nmMGRnnFB/ftFQ+6Vu7MFhXq7nWYBw
         ShZDvIXX7iG4UR4QmJFtsyb3R+qe3Q1bExf+MleZzxEEoXGVARTaVxtNGwzP5iIetFJS
         QMlK1cq+F76IUC71D/vUIgFiJ0bVE7Oivcqpuq8GKLUl6XWSkpBq/Dfh4TmC4/g6g7Jc
         32u5SqYSH5De+X1dPJSeD6dvBupN2ne80IJ5FmBUcKBVOr4yPicIsNqwm940yp685T50
         yGe+MjkcfxB46JM6UF+hTyYZEcPHKoFHiHtH7oRDN+xMwLHU8BEZrY4+LgRcck3FKLOx
         QYxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tzpEDCto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si10741326wrh.321.2021.06.18.07.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tzpEDCto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFkh-00073I-24
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFjx-00072X-AG
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:45:01 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFjv-00063i-JZ
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 10:45:00 -0400
Received: by mail-pg1-x52d.google.com with SMTP id m2so7990502pgk.7
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=h2idtcNg73Ez5P3bSTmn0ayv02j/HEPwlAJMMROze/c=;
 b=tzpEDCtoDOOTNia5QDFCHs68GT6ugHe+lYbHTfKjurM2CcY/tKdAaGU9k1rkdcl0I9
 oBxdGRa9ASMvicjXrJVzTyYx6TtRx8DrG99NGY1sSjUxXlOIHior3r40kKIAMMs4wwfD
 uw44BCrlDBwJmhwBJdZvGcClIqxGSd/x4BvrjyQHVisszFuLqMuwTSdjkRADtoxQlqlr
 jmswZdLX59O97/jONSRi3xXq0E/6yvbS3WntTkTxP0ZBgl9CfCzuqdiEOzIE3F0f/u1P
 jC6bjMgGeBpuy4C+D+ZfXyzM9Cmw53OcFm+eYV3C6j8i3L1oPc1Hj3Lb/pbY+MDY8Bpz
 Jl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h2idtcNg73Ez5P3bSTmn0ayv02j/HEPwlAJMMROze/c=;
 b=oX4AkLoOjq3VC1M2hkR9OSKpxDjhhSk8bQpRrdkGdf4jm3ZkWWGAUugi3Nhn/SYq0L
 DvPoZJccDn7SxweUGduRNtnuWnYlay/LAErFHjTWznaq7Qg+RsQzgYSBmKG8NSBAQ8HM
 4+C1Dq6qpExbAwFZ6XLE2wenxEdnLpGEVXaR9p5bFRW5emJy1d4sWo6UQkYyDpZTZD+E
 sLnipK3iZLPESK1AyC2yeYmjFMQ1irlnwRKNVLaNPwb6VAa0p52ooL939Zb6pcevEYsJ
 qg5Ym90k2Q8uOsgZedWYkohVbsZWhK5pOUcEXa7eHKQ8qGK/aICpYpYZcWzjBQndB9Ui
 vgEg==
X-Gm-Message-State: AOAM533lCVULKad9UrWUuw5oQ4WxzB8QGoTTYYEo46Gw+Fz1kq/5Mt+f
 HFRvN0iOBFt0WwT/2k8s+ksMvA==
X-Received: by 2002:a63:d908:: with SMTP id r8mr10399741pgg.414.1624027498052; 
 Fri, 18 Jun 2021 07:44:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t2sm5522230pjj.19.2021.06.18.07.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:44:57 -0700 (PDT)
Subject: Re: [PATCH v3 01/44] target/arm: Implement MVE VLDR/VSTR
 (non-widening forms)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f5024ac-2c22-2484-2eab-39506a36073f@linaro.org>
Date: Fri, 18 Jun 2021 07:44:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617121628.20116-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9eaFHvX03CwZ

On 6/17/21 5:15 AM, Peter Maydell wrote:
> Implement the forms of the MVE VLDR and VSTR insns which perform
> non-widening loads of bytes, halfwords or words from memory into
> vector elements of the same width (encodings T5, T6, T7).
> 
> (At the moment we know for MVE and M-profile in general that
> vfp_access_check() can never return false, but we include the
> conventional return-true-on-failure check for consistency
> with non-M-profile translation code.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Changes v2->v3: pass MSIZE to specify memory size,
> and advance addr by that rather than by ESIZE;
> advance addr always, not only when predication passes.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
