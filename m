Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp984049ejb;
        Fri, 26 May 2023 01:06:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5whwmKAWmCSHdtX+iNcEx7VOXwv1uundrG52wdQUyQADvpLmVEkP6lsIoQGrFDAeoPSIHN
X-Received: by 2002:a05:620a:2b42:b0:75b:23a1:832a with SMTP id dp2-20020a05620a2b4200b0075b23a1832amr1090139qkb.37.1685088372993;
        Fri, 26 May 2023 01:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685088372; cv=none;
        d=google.com; s=arc-20160816;
        b=JBOLX35ddB6fj9lqvP+whmeADcnd1TvJliGfoe64xo+WV4M8FKkiacckLP/FWqlZJZ
         x7hPLGnwllZB7pluG5ffiHRd1WiFG67ja4O7lDY60NEAX4WC4Uiou+AsKZCbu45mdEu5
         MoRVdXUKR6q0ZlWbK/llOYyBshwOb+6cjmRY9KmUA++3VQH8sO6klihwM1ic06MeUR4r
         /0jTwbChMsetNepN3z1jwRrZqR81jJkRAW0lqDVcsBvwm6wE9djfSUsnHyKVqFr3Df63
         0+IhoGliZbhH7MH9BOXL+najxPLITxc8s6Hv+z4+9z7uV61d8V8bd0ubQ0FJXWvwmRK3
         qTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=yoQC3I2eU4wMZ8qhxPHsf12e+mtpn9CN/LIbOPrXsis=;
        b=F+jZWsbFkeaV3CWMEam7DJl8HDqqwenjSvh8BGpO4N26uy49Zj7vD9G/H5JddGeaAA
         QUmiPYk28qDy8iqzCG8Jr4tdVRFJno1T96ZZo+/qZkMe2BEBYLoxww7UCHjnO5EGnTLv
         mY/OnxrC1GZqibj4CRv/QIvo+uXHBG8eCOgwtUusvHEMYG0r9/wVvur5BypFmDtMpUDj
         wl/PcjvNqLVGumlp4Yv96MQ69pGliy0xt2k7tXoLxfiHzwA96KxBOkop/BdtSnx1rF6f
         2KIRLK+ZQtqIZocAcJUuFd02rvFEbjWK3YbBoH4FeD5BzMhnfh+R6A71qXF4u0MYTLtT
         5ieQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOxzGbz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn21-20020a05620a2ad500b0075b92d784fasi1233003qkb.133.2023.05.26.01.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 May 2023 01:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOxzGbz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2SSh-0008Rz-1s; Fri, 26 May 2023 04:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q2SSe-0008Rd-UD
 for qemu-arm@nongnu.org; Fri, 26 May 2023 04:06:08 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q2SSc-0003jA-Qc
 for qemu-arm@nongnu.org; Fri, 26 May 2023 04:06:08 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af316b4515so4208621fa.1
 for <qemu-arm@nongnu.org>; Fri, 26 May 2023 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685088364; x=1687680364;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yoQC3I2eU4wMZ8qhxPHsf12e+mtpn9CN/LIbOPrXsis=;
 b=yOxzGbz4yFnGeEkuS2UgwHSwnTtRJxL0nlVF8t/7LiQ4oQBtdsZoBON0UWaiSnmwIE
 m3QDqbN5zRnH1KH5OEk0W3aQcEaDnucDTA7Cx1GXYqhRSuh1XqpcE7NzIJusGXHPq0vl
 1BCLHO0cdTXiKjsksydjhkZccKKIqaHyCRDYPQ6ZB4PCSaRUGtLb/0ZT4MjHkc1NWlJW
 AIEowvPpWpsrl630BCUl0EWxjG2/V8UT3EnM9YwZsVqUnTPwWgx+UgsARER9uA/PmBTr
 O/tK/Nn2Wjv2gFNXa9SrALi6v/C/gYRLBnSqPRvKoxtYbSkWtj0vSCGTrAd4tfK9XcvM
 EWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685088364; x=1687680364;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yoQC3I2eU4wMZ8qhxPHsf12e+mtpn9CN/LIbOPrXsis=;
 b=dlxXwbhhi9mBiRAe2T1bcOfmkRpzCmXOfxPABOfP9KLhMCFSa2aDXJaHcFcwbngJgv
 8iTdvJ/EcElK+r2skw/kjd4tP5ixZuhMNVw7bGjhMv1WEDNp2n3LaiECI/UEeLsYYOJc
 sXc8Vs06S11jIVwhWwU3FM6NS45LQ19Wgxul/x/AFB9o71AFPyusSlNV+9TV1zURr6GZ
 giHECc4rS6BkpCHl1iQB9l8H8rAAWflmAbRoGDF2TItgx2vK9/fOELbNkGCKzm9FP5Tp
 fSmxd34NExanc0ZvlrmEY+W4xm+5uK+s4PSarIxtvjWmZkoQ8O5U8ruGL3tDXbYu/RUQ
 wnmg==
X-Gm-Message-State: AC+VfDzNwPxMyQIbWqt8svGHxq40VrwHzm+8OnnIS5ab2fI9B9YYUg2H
 wafEzr9W2MrL2bCYSew8GrJJBg==
X-Received: by 2002:a2e:9510:0:b0:2af:2626:9f23 with SMTP id
 f16-20020a2e9510000000b002af26269f23mr418771ljh.12.1685088364242; 
 Fri, 26 May 2023 01:06:04 -0700 (PDT)
Received: from [192.168.88.29] (89-64-65-4.dynamic.chello.pl. [89.64.65.4])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a2e978e000000b002ad93c4c4e7sm602917lji.83.2023.05.26.01.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 01:06:03 -0700 (PDT)
Message-ID: <90397371-4ace-db8a-b2e6-0d1958ac6ca0@linaro.org>
Date: Fri, 26 May 2023 10:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/4] hw/arm/sbsa-ref: platform version 0.1
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA8VxcdRvrRN2-pztriakGsXoGhaEcyptJ9z-0rPua0HGw@mail.gmail.com>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8VxcdRvrRN2-pztriakGsXoGhaEcyptJ9z-0rPua0HGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: s6kG0I8WjR29

W dniu 25.05.2023 o 12:08, Peter Maydell pisze:
> The cover message subject says there should be 4 patches
> in this series, but there are only 3 listed here and
> only 3 emails arrived on list. Is there a missing patch?

I am sorry for mess - 4th patch turned out to be WIP one so I removed it.
