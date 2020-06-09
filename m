Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp768414lfc;
        Tue, 9 Jun 2020 11:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ/+Lu7yoOenzK+hod6y2KaKlb0V8RSfqSaqaWXJSMplzieb8WsZIW6VfZOkJ+t7lQkkR/
X-Received: by 2002:a25:148a:: with SMTP id 132mr8794428ybu.129.1591729023731;
        Tue, 09 Jun 2020 11:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591729023; cv=none;
        d=google.com; s=arc-20160816;
        b=rVIPXMMBxoQzg51jwlKK17Fv2tX0Ib8v8EXlvvIxrmFhkWAWqU7fJJhZl3s49iPqEL
         l+DrRZIGcAnxi8eTETRvcAOyPHizZP7cA7yrD0D+iZdh1lLIXnArd36MF/JB7ZmtKkZX
         pvZ//ryleZgwJMUdct/AjLofvMT4+v1giGFSW8LVgb/UNhqej7oUCBIeal7aUmVtrjY2
         VYLxnUYdoLCa+noGBdUo+ldhvoAFwkXjmySlBdQsM34Y/AXVR2jog1SQyVdGFgP1ZNZA
         pPpWfiVNLgXYlbd7r4dIKj1e7FUfUO0axQ+d1ibabuDHT2i7m0mh3SvgWg+zd+0WgHbr
         dPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=096eqWxL0XJqSGPkLl0rEVGBekBw/41/MfNnc40nJzQ=;
        b=059jwKZ23qT+nQAXVKR5y8LLsrjHYYD4aAhGixldCw/8Lq0aZSBmw1OswV11vvCh+i
         Qf04pnFgIymTePvvWJDgC5X3uh4YqgIvOamijlZGgmIBD2B7YeVzhez5BlPOExx4Hy1o
         CZtgNWZHsjiQ/EFLVriWMQBWhgDFZvI3A7aGbhKJ0Bnz1Cx/y+acn1G6Qm1b6yEF2z45
         ypFXgv0Z/bDf3njliuJX43gmhvD2ON3M4jMcXHw9Wujk+gFCTO3tdrCiREvQDqB26eWW
         l/2PtmeDZCx0amKF8bWCnxHOMLcRQIxi5gGb9GxowAre1vRiQWwwR69Iqz3vo2hokAVd
         fBhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hndLuWVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si3881144ybg.300.2020.06.09.11.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 11:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hndLuWVZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jijQl-0004Em-3m
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 14:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jijQa-0004EW-3e
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:56:52 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jijQZ-0005L2-2t
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:56:51 -0400
Received: by mail-pj1-x1044.google.com with SMTP id s88so1796290pjb.5
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=096eqWxL0XJqSGPkLl0rEVGBekBw/41/MfNnc40nJzQ=;
 b=hndLuWVZFsfYdn5ISengfI3Lea2VdRByxvQQMxvVD9+GuacOVdYTjfV64k8RuiVj71
 Gf32mYFunKfD2QbvBoirIm6+zbsbVyf4Tb0FU8TKs8hx2NmPgf+9fq6QjwtoKVLcOITU
 i4bfCGwQJRlD491PDIlk0QmIdUd56ud9PJOOwc7BkQylYjr6N4DT22y+fah+sHnh4nj8
 RmTrMhud/nPCEjqg3rD6dvV6EC8v5cWRUDxW+Fn0lDICX5LN8Lns/kVAnhHzyK5CDrpG
 RYvMgR3Na3mNW7qDnqeP6zygJb9XN5j0jp09uVZZ9kDUjjYC0kyMDUjsik/2T/USrUJQ
 Ufgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=096eqWxL0XJqSGPkLl0rEVGBekBw/41/MfNnc40nJzQ=;
 b=F5aOmf8GBfUOF6ENDF2Ytroa6unDppTUyqM7Wbz2QVK55RBC8O01zVpsaRsdCFpP81
 GWukHmXKf2Z9KwpHL/lYnY+dIEJEXKC+R7hscj35HXq/ibe09OiSLNtVnO+TmiotkmPB
 ld4DFp+D9kKXLHDotL77ctbFxDeHgTrXM6v0EXNS1WX0L2HgDvDKwOsjUO88MANxzErF
 XAAnjiQhmqPAD8Wj4Movs4dTyeogSDp7IaNzs1f4w7QVeb9E1vn7/gylur1nPiBD+SgC
 Js2tdIKMo/lPyR+spsgBmF3/1oAjDyHTFTJ2EPJNSCviRDqmaWtso055W8u8+gyUnoB1
 oejA==
X-Gm-Message-State: AOAM533UMnXjExprzJx1hpeGKpy9c/G/GI5Hx4SbUIDhEnh7Etwf9p8G
 /hptKy6ugUVdoR0hbTydWjUeEQ==
X-Received: by 2002:a17:902:c214:: with SMTP id
 20mr4589314pll.193.1591729009580; 
 Tue, 09 Jun 2020 11:56:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x11sm10502171pfm.196.2020.06.09.11.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 11:56:48 -0700 (PDT)
Subject: Re: [PATCH 7/7] target/arm: Convert Neon 3-reg-diff polynomial VMULL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5682bf68-d7a4-0cfc-3017-2736c0a88f8e@linaro.org>
Date: Tue, 9 Jun 2020 11:56:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: bJltZRdNlt9f

On 6/9/20 9:02 AM, Peter Maydell wrote:
> Convert the Neon 3-reg-diff insn polynomial VMULL. This is the last
> insn in this group to be converted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  2 ++
>  target/arm/translate-neon.inc.c | 43 +++++++++++++++++++++++
>  target/arm/translate.c          | 60 ++-------------------------------
>  3 files changed, 48 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
