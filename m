Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2366364lff;
        Mon, 14 Jun 2021 15:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmIWOduzmbCDmTZe2IWR612L8p5gbHfExogQyUxx1t2Z5y4hP13EU4MrHchoRzTeUlFRSv
X-Received: by 2002:a1f:9950:: with SMTP id b77mr1422514vke.25.1623709417965;
        Mon, 14 Jun 2021 15:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623709417; cv=none;
        d=google.com; s=arc-20160816;
        b=CuiibrbiSc902G21eFR0BRyeEXK7xJkRU2j/qgGHxJQON9t9YNO1ZPz7wGglOhV7/U
         3O6PzJFgf1806VaSQInIjXlxfmfTSNjxhXgFPYFF3cBEHS3GYkveYrZkUSNRWNw+T8Nz
         YL+1j2V/2hts2HZi2WHR0uCzno08zgrlZHalPgJUDeVFOA542aaFvrjYZQUAddhZqZ82
         pOOpoXWmIDeJWLyl877nOHWdA0yHbYkwzLXxC1mmcOI4fPm/cS9uXuYin5aLyfKPZWgH
         5XtJBgYvbWQHFkPqk7gioLr1kx7sArwiTcGUCaeazBq07W8qszf3zd2c60FHuL1QhQRg
         7XfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mTWlfVlKbg3lS9GTlmCvyRWQO+V09J7F+2Kkce4J+9o=;
        b=ERs1oPMDIdziPtM5PsAitPHiiMLxauB1BaaIRC7h8FF0piWjmlXXDvybq72g5bAfLx
         v8j6ewpmAoSQ1CBBys12sPgNuHBMJKOCc4Mv/3NLll79VRBCBEJgzSHdxdWQyvReRmci
         XaaK1cuDTUghJGBcc5EpsTE15YxGmdTtQYJ21Onr43piDNBDroUvs03QgWd4MoJk472m
         BSK9CxY/SNZsVBrcNdax4DbIjfhHYUlIOO69ttZKSpLnQP/Q6qRIH50Dhgy0m5Lch00x
         OTRD9+KYf6zUIDF9oIQ6OBKoxlln6Oh7gKRZex+L7Sq1z49u8kX5DX/F4We6xGA6pVTv
         /ESg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLBV2Esw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n42si7586653uae.95.2021.06.14.15.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 15:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLBV2Esw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsuzZ-00085O-A4
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 18:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuyp-0006zu-ES
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 18:22:51 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuyn-0004RF-HO
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 18:22:51 -0400
Received: by mail-pg1-x531.google.com with SMTP id e33so5099609pgm.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 15:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mTWlfVlKbg3lS9GTlmCvyRWQO+V09J7F+2Kkce4J+9o=;
 b=DLBV2EswceSFZ320H7bDmbejAkb2IXb+3T225GyWbwZEpcH7Z1IIfP5B8T3WbuBprT
 fdOYR4fJoVJbBLAKSo8HKbiOgPaUbnsJpkylnpLpkAc9GbpjGIa8vZBdmTyuKwf1/aQq
 7tEiTqE+biMaWG7HrFLhgFI09p1grFwFsNLNxWATzWPzUk3MHDil79vDvh7DEbj+RwkU
 ny0mrB1MZcIgTVbhGCZ5vsLr+vmQVMqxduqJ2cIl9KCbGsoZNYzAKuat7gQNu2OgWgQl
 CEol4ZBpv3lDidyypNG3Z3Gebpnhj+hcI7JarNhvNWtRsoPnwhkBsCrwBEPXZlysHWKL
 gjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTWlfVlKbg3lS9GTlmCvyRWQO+V09J7F+2Kkce4J+9o=;
 b=LPK55iBpPeJWxMCisv0JY87Y3zOOqdKixpEXNx1I8F9q275qla8+gJGQm/jyoBN/gU
 BLAmu/5c3cbmreqDggz9bcbIoSkDBzo9p3K7DHHXuhEkjT5IoBLzDyYZs4iZJUE3lQXv
 XGNNpEZrFjeC5ftutKGpHXVm5pOyv2RHVflQQoety5SH6C7kaw3Fgy6qC84AtoJbJQXu
 I/Uz1x442lym1UNgrPhUUoYWF9td3ezTGGUW1XU4jt5sKQET3qisztZRi4T08eHY1spo
 789XcT3ARHvN7hn5Pi/SkSw5P10VSra+ayI4dbalKHYdMgmfomN73KTGxph2tr43jLmx
 MrEg==
X-Gm-Message-State: AOAM531YqFDFoNuIEPTacKP+FDEZounI2K2vQPxgg1UY2xc+f/Gw00Js
 iC0zlvN1gn/g+Wt/RMFkYWsprA==
X-Received: by 2002:aa7:8058:0:b029:2e9:ee0e:b106 with SMTP id
 y24-20020aa780580000b02902e9ee0eb106mr1214245pfm.4.1623709367955; 
 Mon, 14 Jun 2021 15:22:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d6sm1423556pgq.88.2021.06.14.15.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 15:22:47 -0700 (PDT)
Subject: Re: [PATCH v2 00/57] target/arm: First slice of MVE implementation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ded6216-9fa3-2b39-87ac-c61d08e80fd7@linaro.org>
Date: Mon, 14 Jun 2021 15:22:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
X-TUID: jq0UMXKpct1z

On 6/14/21 8:09 AM, Peter Maydell wrote:
>      - pass only ESIZE, not H, to macros in mve_helper.c

I've been thinking about the H* macros again while reading this.

While H##ESIZE is an improvement over passing in HN, I think we can do better and force 
the adjustment to match the type -- completely avoiding bugs you've caught at least twice 
during SVE review.

The form I'm playing with today is

#ifdef HOST_WORDS_BIGENDIAN
#define HTADJ(p) (7 >> __builtin_ctz(sizeof(*(p))))
#define HBADJ(p) (7 & (7 << __builtin_ctz(sizeof(*(p)))))
#else
#define HTADJ(p) 0
#define HBADJ(p) 0
#endif

/**
  * HT: adjust Host addressing by Type
  * @p: data pointer
  * @i: array index
  *
  * Adjust p[i] for host-endian addressing of sub-quadword values.
  */
#define HT(p, i)  ((p)[(i) ^ HADJ(p)])

/**
  * HB: adjust Host addressing by Bype
  * @p: data pointer
  * @i: byte offset
  *
  * Adjust p[i / sizeof(*p)] for host-endian addressing
  * of sub-quadword values.  Unlike HT, @i is not an array
  * index but a byte offset.
  */
#define HB(p, i) (*(__typeof(p))((uintptr_t)(p) + ((i) ^ H1ADJ(p))))

void bt(unsigned char  *x, long i) { H(x, i) = 0; }
void ht(unsigned short *x, long i) { H(x, i) = 0; }
void wt(unsigned int   *x, long i) { H(x, i) = 0; }
void qt(unsigned long  *x, long i) { H(x, i) = 0; }

void bb(unsigned char  *x, long i) { H1(x, i) = 0; }
void hb(unsigned short *x, long i) { H1(x, i) = 0; }
void wb(unsigned int   *x, long i) { H1(x, i) = 0; }
void qb(unsigned long  *x, long i) { H1(x, i) = 0; }

This gives us

#define DO_1OP(OP, TYPE, FN)                                            \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
         TYPE *d = vd, *m = vm;                                          \
         uint16_t mask = mve_element_mask(env);                          \
         unsigned e;                                                     \
         unsigned const esize = sizeof(TYPE);                            \
         for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
             mergemask(&HT(d, e), FN(HT(m, e)]), mask);                  \
         }                                                               \
         mve_advance_vpt(env);                                           \
     }

Thoughts?  Especially on the naming of the macros?
If the idea appeals, I'll do a pass over the existing code.


r~
