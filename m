Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1127449wrm;
        Wed, 9 Oct 2019 09:13:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4Mlppf+0mwRUls5MuPWONDeu2fICu3S/jhN3wjarp4VuH+PHWX4x0EwQ5DrZkuotL3ln8
X-Received: by 2002:ac8:f34:: with SMTP id e49mr4669170qtk.368.1570637591713;
        Wed, 09 Oct 2019 09:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637591; cv=none;
        d=google.com; s=arc-20160816;
        b=tzIpWN62ZyMySjtgJiMSN1svNmMKMucjfodRYufd3/nDYNBqWjfUfpw1AuLlUGEJzo
         uhYFCVOGaQA+iSP/AOIlFGwMnWQFpAFqhSMoWEDIAFRrjtLPmABNXsVRj3bhUB754dED
         K0WGQUprmljRCIb1LC+hsQBFxGTAHRhJcXbACpt5ptzpo9H/KenvXj0TDAuBSZvLPQp6
         m0DYSOtMq72XNe9t2SKG4ILXxxSpSACCAcab/Z4I9GopJ8CUhtXzYmmOquxdzGyeD2Xl
         L5/LDMfvzZ+V9tQ6R9IROAvQ5lJNitHqJyNRSUYeShE+9fV8EKOyzYES57IVdCD1QDKx
         hILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=5B5PokirAcyvVdxU0wyuXSRG4YX397KLy+gkaIxmrUA=;
        b=YSvLJvG+aGntt+naejhq+zb5Ujq0gby5KxUQPnJBdyRtniMCb/1ppoagMPypRu+4Z/
         k6tBgzPylpKQwNg4+XAe9Ny5AhFUrUlf1AjGDg2hG0/aRMm8RwSEVRi9P64yFZfwAEfH
         X1mhBi6umGjrSsKOlhwa0zkSqvPfZ6AtGLQAHSn/6WevTuGJ1we6qJcTXWbNvfJU4HZS
         KRqdXxcX79lqkExVSdiD/1WXviezwZekxc+kHWb/m7868mx1vtqzynVXvYhHQOufFNrg
         KvHP55CM6AUmQo+Ewk3em3TfTcoBLpZNRfjIh9yX4UB0TTYMOs0y3PAd99795DAHdTxd
         l/4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ubtARVdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si2507976qkl.199.2019.10.09.09.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ubtARVdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEaM-0003cS-3v
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tX-0001hy-2N
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:40:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1GK-0005NJ-Oi
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:59:37 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:43488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1GK-0005MR-Fl
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:59:36 -0400
Received: by mail-yw1-xc44.google.com with SMTP id q7so227287ywe.10
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5B5PokirAcyvVdxU0wyuXSRG4YX397KLy+gkaIxmrUA=;
 b=ubtARVdqRaFmcMQ2ybqqEWddOtqFrX8mOhuXf+wh5ZY4ABo+bqCa9hB2tirZo560GL
 R2tDw38t9lCN6VdLpClGi/pDhjFJuAYTMTGOpgL7oo9UxSPn1O+YRqL1Mfk8jADXfhfJ
 nlMq0ZjKC/tXJ07nQ5FulL8dydbbjwKXhnAkbnvF5CJaEXH5CvzwNRsRygUUnYDcajSo
 yRBKsCs7pWWHNIS/abrTVm3tYV01YBtp+V3d2nPDRgZUSuDl2Vp6yiovJLR9hm2BpdIb
 nRckk13xnzcm0qi7JCOmXbMCVn/+aPd5BdtpYGSn03TGJYvSLb0xjvmeU1wghP6TfC5U
 Yjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5B5PokirAcyvVdxU0wyuXSRG4YX397KLy+gkaIxmrUA=;
 b=pZkK0yjUsFUqadpIabSsF93a1xc+4srWX2QNfHg7OIpf3qljGVnIi2+gs3iX0pBN3W
 76a32stoLGI6inIqFBtLS6jwEqC77qD9FL4pJ+e16UTRUaREpcPw9QTd5Yck4jekIJfA
 XS9p/EG973mJr02PMBeiBwjVQSU5pK13AwQ4pG+9I8V/+smUj3e7UpaFaEklwUlkYDfL
 5BjT/fs4CdVuNbC3c1WuiHY0pyU6xkskPr7IydhF+8ihgTqZLTh2YEUNo4OMmw4JBXhz
 ZegP75lXM/sYK/y1gGd/j0umORBBcoHFz5WHqppMF7Y7+V+OgmPqGPtw7XFpqTgjFMRP
 RTzw==
X-Gm-Message-State: APjAAAUCHkIU/WfgWxEloSqQ/Z72+UfmwUSKedoi8GUCUnSoZk1bslJ7
 Nr6NAlx60xOhdXjnpovcmkzsEg==
X-Received: by 2002:a81:6f85:: with SMTP id k127mr1024783ywc.363.1570586375801; 
 Tue, 08 Oct 2019 18:59:35 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id z137sm225758ywd.18.2019.10.08.18.59.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:59:35 -0700 (PDT)
Subject: Re: [PATCH v2 13/21] hw/timer/exynos4210_mct.c: Switch ltick to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <977ac2b8-c2b0-286d-e4a2-d262aeec32c8@linaro.org>
Date: Tue, 8 Oct 2019 21:59:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NZPNy/n8rHgy

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the ltick ptimer over to the ptimer transaction API.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_mct.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
