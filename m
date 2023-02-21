Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp2732497dll;
        Tue, 21 Feb 2023 08:56:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8DTCPzsHzmJJ8uT2i17oyUAIZ3k546lTBdre0sPuHSd74NOjcBrQO6BL0wkOcUTiYPRmtj
X-Received: by 2002:ac8:598e:0:b0:3b8:588c:40e9 with SMTP id e14-20020ac8598e000000b003b8588c40e9mr7976143qte.19.1676998596622;
        Tue, 21 Feb 2023 08:56:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676998596; cv=none;
        d=google.com; s=arc-20160816;
        b=U0DT6HowPsMkvr+tGDvlMkCUKWC6gh8dlmpbRr6jardfBJb+YNW6DjDbo1dRjGzDlm
         VUba1hgZb4dGP+3wuufNHQ+E14g8LitV0+HvIYMWBzr/rJx6m568EpGCo9CypeVNyTAT
         ezQRzPKblLltxmY1KRkwAm6JgT/VGWUT/sux26ggrpyc65z0uppATN7FVWeNONpZ9a59
         J4QFFYEYvJFfwILHMkmsMD3CkE0EIjl5QXgtapV53bf6JpeGkS/ktU3qrEfsV4hb9TYx
         aTeTDLalNh60fTnReSJHiUEgCatGrXwZ8Z7n0oK5JhDiwe6uwPzB/plOp0RTgCnksN7G
         wtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=52B+7W7q446JH6dWkTm6gVpF849VXknIGCBunwuKg7w=;
        b=Pjrzz4fAx7cCFhX9ecc9i9hyfIcTAN3UQlLOD8cwn8Qjtm3OfXRjbEWNntlFClQ4N5
         FKqwFaEOLfpUg73goO2X/wxB6r0zjUpDj8M0WlIFgBemVxCVN15lJFjzA2hKqHlKHdnd
         PBnfXWXuxAU/KUe9A9fL1TeZgMHGCIRisrHDv5XHTuM49FD8ntId+WAP+MY+BPMp9A1y
         GyUyv9QU74D0Q5iQTmsmnQjzjYlez5Mi5hwZqN1a9rLl7Z5rglDf/Qn8BzzL/Hv0t6JS
         p3kT693PR0NDWJcTAfNNnPFZ8ErWEhlOt/eABicX8nTx2zqTc8Aet1jwbmFHZoNJNLk3
         GQrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cTaAGjdU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020ac85c05000000b003bd134d475bsi584631qti.368.2023.02.21.08.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 08:56:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cTaAGjdU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUVwJ-00005v-P8; Tue, 21 Feb 2023 11:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVwI-0008Vf-Ct
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 11:56:26 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVwF-0002At-Fz
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 11:56:25 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso5461315pjb.2
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 08:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676998582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=52B+7W7q446JH6dWkTm6gVpF849VXknIGCBunwuKg7w=;
 b=cTaAGjdUdUmsfLKNNJb+iJWhdQ9QagbcXSIs9IL/PFtFiPnN2JjLGY5uEQ33mGnU4h
 mEpcMjuksnVU/YVLHCYqblsjbJCiUA448FMYbQcKejUKUiDqJIs5+Xa4YbASxno/m3zH
 H7iBXU2b/BRFNwPOR1AI1cq0fHKqOnEquI6H8Sy7bHulHq9dLyTrhSjQVSHCSZf1GaBg
 yDM5wBeiG68MOaN3lLh8Gy9aLBMyC6RjCgwwVPoiZz2PpqzZNzj1zcfA5+vLRkmb2F/I
 8DMbdDyBN+mJwLhLCoqeOzQKi/1LhbX76FXUwOMpMqS2tFr3r/cJx6CPJXdDF3M5x9RR
 pdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676998582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52B+7W7q446JH6dWkTm6gVpF849VXknIGCBunwuKg7w=;
 b=p8w0136MeRtPBLOuc06sawAoHJSNjCSzwS8/JDfGRq/tp6fw80yMVmXWKgGd4Ha77v
 /KLoi3t8yOsJh6ISni9f3ZV6bZPErouOZQLL1p9lgcXhIzpLmWTtY4JitMnEaTuKI3OF
 KXIHwFdrj5VifraiO7o9H9ycdzS45yTwjuCEKWNvWUduv2JFYM4tLk8rTeKtlJeLlfD3
 Ay88ES3MJ4+p3N3FdpD3f98yCLQvJAxsRy8Ew1p0EWngfD9WiisV63s4jd4JAEbDg7yc
 hxVn8lZPsSztuzhzKsQ8ETLTFCAu6dx1SJ5yujNcV7LKbomp6p/vFcr5jEMwL8h2rdAS
 JMzQ==
X-Gm-Message-State: AO0yUKXX1iCxPf2AIQxLxzlHzR3+MtI5AyafoXEII4WB1BskwI095OZB
 UnoBCOYZgqfr8lnW/xNz04jwgq9tjQo+KRiRMc6dcQ==
X-Received: by 2002:a17:902:ab8e:b0:19a:721b:bce1 with SMTP id
 f14-20020a170902ab8e00b0019a721bbce1mr861699plr.23.1676998581854; Tue, 21 Feb
 2023 08:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-3-richard.henderson@linaro.org>
In-Reply-To: <20230221034122.471707-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:56:10 +0000
Message-ID: <CAFEAcA8yq_h953pLi+zJ0Ai52ErYyS28YkZP2Mq0L2ZWfEK3FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: d0u+xEEEiMLb

On Tue, 21 Feb 2023 at 03:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> M-profile is not supported by arm_is_secure, so using it as
> a replacement when bypassing get_phys_addr was incorrect.

That's pretty non-obvious. I think we should either
make arm_is_secure() handle M-profile[*], or else have
it assert if you try to call it for an M-profile CPU.

[*] i.e.
  if (arm_feature(env, ARM_FEATURE_M)) {
      return env->v7m.secure;
  }
at the top of the function.

If we do the latter we wouldn't need the revert in patch 1,
right? Or do you think regime_is_secure() is a better
choice of function here anyway?

thanks
-- PMM
