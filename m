Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1763476ejc;
        Fri, 24 Feb 2023 05:16:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/tLh2IhutTyYEPJU6+XcibP9W59KbfWikUcLUaa0XFCT6cGwPFit3gw+IxXAk8HiPG2lwJ
X-Received: by 2002:ac8:4e51:0:b0:3b6:2e12:4d25 with SMTP id e17-20020ac84e51000000b003b62e124d25mr22518460qtw.31.1677244573105;
        Fri, 24 Feb 2023 05:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677244573; cv=none;
        d=google.com; s=arc-20160816;
        b=BAe/zOZIprQcEqH95SdjPfUj7RHXy9eXoDTTVMWJndkhFAYcLLE/7ZHQWjbFJnmX1P
         DX6CRXkWCC1zYitY0jI84gQgAqKLPqKWlujrOcTJLa+2WhJb0/3t5JY+/SbzKcJcPnrh
         hC3U8nvOrc4Dl+CKsFwiiI6/jKOAZo2u48Am0BgUe5d8Va9BkHgAZvyhQCr8UHSJxSys
         LsaHRLQGLj/ghcEFpfHje2hlYKxXuTL43xHIYcp/6t5R/74Oojebq3W5bVbz+2k23N2G
         C+ssOqSCMhfKa3+w/+Klwq2mjYkZjHLsh8LYY51qyFv/qYAk2iUPM91/6O4rC4WLZmT8
         hm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=l6wWlWJyITAr3q8SHutWfu5AyXV7lXgt7QOMfy0GyN8=;
        b=XDyMQIk9xtN14RalZEyX813MsePF/8qvQU8Zd8n3PMiTfIvnYqRBH9+pe59aATfRS8
         9SgrWsH0Cy9qVZ+Rln2BjxUnGZL8HbpLsOVl2vSQGZpDxiLl27AH7KgY/uDSIyudnxTr
         vlYOi4+lO5YwnQaD0yOzVy8jKmPgs2ftjD5OQMoKUVtNRhW3PX6f8BpzkGyLsnwpe3Wg
         DJGDBoY7q/eKr4/T11OEZc7IL0lc9mTr/TywocEwrKhp5gt01qtYGSQJiu0sP2GtC+Oj
         cfFK3+hP3Vv898wTXb7qxq6LAc4HALlbui/9y+bE1hejr6xy9EQ2DeDU07D9x+nrNuzQ
         G+Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLP95UMK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020a05622a059200b003b9b6ab38f3si8673334qtb.441.2023.02.24.05.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 05:16:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLP95UMK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXvc-0006y8-2p; Fri, 24 Feb 2023 08:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXvW-0006tc-1i
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:15:57 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXvU-0002Ea-9z
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:15:53 -0500
Received: by mail-pg1-x530.google.com with SMTP id h31so7573653pgl.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l6wWlWJyITAr3q8SHutWfu5AyXV7lXgt7QOMfy0GyN8=;
 b=vLP95UMKZh3J0fEwUT0aGQ8TlfallxnY6HsbSFgyijbRJN1rZfMSW+4c2qthjp7XPp
 YPRIBlVR8r2Lhh+sdJe5bhjcPoMWHWqcP7KkP+QAIP/koMfqFF0NUh4WiWwfFrPLvpN4
 /xNPVp15/EFHFO0vyLHkZyZ4kE4AWyNHMysZ9wnHr9L9b26xc4pwVyqSCQhYU/SGJHdv
 jOeDXGLETJQ2NeIwR+FsnM62v3yDo0l+9tbvKJ3sfSMrSY0CHosdWe+WRPohPg19eU5q
 TXlO2yCcTVWw3mHJn/y5wZVioUujXJsmcb5/8iyiDRLIIrPg0QzFs6Lh045JMp1wOknS
 e/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6wWlWJyITAr3q8SHutWfu5AyXV7lXgt7QOMfy0GyN8=;
 b=Ngpn+0URdAcFlZbAcMHxbZLRKVAsBNLbVQzolN+O/9DNbIkTt2spmYeFDrUO6yOElm
 QY2ne8GmqsiZqm9mBK79/L5DYVmbzuVM4s7U7s6KqvH8FuRQykNu6tK+ccn9BH/z1oNf
 PrR03I4ZnlLxjbuYX9vCXa/SUdqR4X9BEDLRIWm85HApkZOjEcteqQgCKpq/fsve5rkB
 87crw6uRYXKFasSjJ3YZqb6BQEv4SE8VVT6PQWIIfdGjyIXdUCO4WE/LvXpbh6mRYx8I
 WRMH6s78RR7/LKEc18LxcGwRQDHnVuhpmAw2VbMKszdpsg+Iri+YlmX22TfALIqc6lQC
 92oQ==
X-Gm-Message-State: AO0yUKW2dTj6kx5Q2WOAvujiEsZoLEdxockg8TJ4RWT4xe3FMImGj7m2
 ++kCKxw2BsOWJ5eTzADBSaW1alCJWaWdQn5INY/g2w==
X-Received: by 2002:a65:6947:0:b0:502:ecb9:4f23 with SMTP id
 w7-20020a656947000000b00502ecb94f23mr1735813pgq.5.1677244550877; Fri, 24 Feb
 2023 05:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-3-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:15:39 +0000
Message-ID: <CAFEAcA8AHp3y8AShauxJh+YnqCrg-o5b03zd-E3JCsWmsZ_bSA@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] target/arm: Stub arm_hcr_el2_eff for m-profile
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: orQONAl/n7JK

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> M-profile doesn't have HCR_EL2.  While we could test features
> before each call, zero is a generally safe return value to
> disable the code in the caller.  This test is required to
> avoid an assert in arm_is_secure_below_el3.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
