Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1114563lfb;
        Fri, 10 Jun 2022 05:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeRBuCYHRl7D6C+i8L+aGLj2qi6gzV3lzHPkSKuiu+wb689YDXGKRlCDPX7i8s6akDcWL7
X-Received: by 2002:a05:620a:166a:b0:6a6:b0ed:6199 with SMTP id d10-20020a05620a166a00b006a6b0ed6199mr20365284qko.776.1654865845415;
        Fri, 10 Jun 2022 05:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654865845; cv=none;
        d=google.com; s=arc-20160816;
        b=iKYLHKpHY42bSMBbSy3azWTTK187570FXxEXUElCCd1feopfDihLlUdJKcdaoKbiJ+
         SrFEXMsRaYCnxB4Xk3rikFU9JGl/y8TKDN8dcETK5tNuBpO2jF5GB288dB+4chSxozym
         LO6yGhCwkKnniR6gB7qqm1l4zEk9WBkUg263UTojrL4ZoVhHOjrYhUlij8E/rc10hvNu
         ZE/wBrUuGXjfmO/lFBVUVCpOprPpX6p6/7T6tsSpLe6NQcbh2MkT8YfnCo/wgRDt8weW
         zM7cdO6qp3TzZxF6E0aEFee/bjad0AFWYUi/ozMjdnKR+rZSklqfhFOOHICxvoezrsKY
         M++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=G1Oc6rDcqy2v5Vl2fN5odtAtmPY8T0X3y07z9CzodkQ=;
        b=MIDF860eLKMxekTnSufRsajMEn9QRtePJJU75SKy/jJKSGoNpo24JIIcFfi4T62Ry6
         n3BepQFnvSvkognRrR9nAbNGkNUWSv/EUTTT6AkhJoMKl6sX3R3plcXb8/NEYp1gnld5
         LpTmOF7dk8s4vp2eLJLEWXc8w/arBYFaHI1Tevhv2UZoy60yUEo6N15Fg+t8C1G1riC3
         NW/HiO5jvgv24EywOhRy/L8pTUtMamgt449egMvE9oUU/g8XDTws2TvjTM1DfXQ7N3SI
         g/y51jc/2YRdbNR+jsqHSQccGdUIz+JFH3BY64RPDRXT1KbgKWMeqVaSuw+yQHkiHkm1
         qmvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wVn2xV2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a27-20020a05620a125b00b006a333344d74si8621398qkl.205.2022.06.10.05.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 05:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wVn2xV2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzeCa-000348-Sd
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 08:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeBT-00031G-D7
 for qemu-arm@nongnu.org; Fri, 10 Jun 2022 08:56:15 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:37001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeBS-0002ct-1C
 for qemu-arm@nongnu.org; Fri, 10 Jun 2022 08:56:15 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31332df12a6so123270477b3.4
 for <qemu-arm@nongnu.org>; Fri, 10 Jun 2022 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1Oc6rDcqy2v5Vl2fN5odtAtmPY8T0X3y07z9CzodkQ=;
 b=wVn2xV2xRaUilBuux9O5AMTaXl3dqcMqoSV2k3ytoj/lXDs8YFq+LPg5GwhjOrIyCZ
 yk1xbTv+xAgBuUD99e6UbzZpXbLaXsSI5G+/ArZQCyPzCPJkEaRoIb2qugURd1vbC5Cw
 gfahXminzdkX9EmgiHgH569hPliWRVcop7l76xtxjhioyzH5PaIjhqdRT9eEEuOg710Y
 I3HLyCP7RAVDnr/pdiWsC0Bgz8l5jzqo2rlUldes80IAulI+G3lInIrGOLDn8KI7BNwJ
 hVv+vxpil7CKUTWhlhVujyU7sS1Blbu4A//IrdlhQNfWJXFO0SQGxsGtCF7F1zpqUqb+
 UqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1Oc6rDcqy2v5Vl2fN5odtAtmPY8T0X3y07z9CzodkQ=;
 b=iilrTnQYZWtin2zQfOAhi7hYdcMKUcN8Q3r/piof7UQql0gzKY224Zfc9aqkaJCKbk
 WgHJcUassu9+jDqNVBwsSkc7YyUeQBkrCSVXOgw/HznQA0FSiAVyw/COFJ0U4ikuY3rx
 P5yVE0GVE9RJOXSIhIdQV0RLJnLp+iyBKk/zUCyTtNAFDK8IMoUHQdhz9yRHeqmMRCSu
 /1C30KwSrB8h4VCiEf8njmeDkgee6QN2nTt3r4c6niaHGTDZsvV1DCfe2wULpzeTYWzA
 5i9zXiG9G+ZeDAnEE4kIwlviZO2e6PZCYgZ7k6bJ3upWdwYDW1rK1pOXFyW7SvPAk356
 nB5g==
X-Gm-Message-State: AOAM531C/DlKjep3NWDqU013cUnTSlSVcrj7B6h4/6lGpnkLx16sIG4y
 fdyfseElqkBCAzuJBCTlhPeQK4j+Hs3hEPm8pX6mj2xOfpM=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr48630816ywb.257.1654865772639; Fri, 10
 Jun 2022 05:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220609214657.1217913-1-richard.henderson@linaro.org>
In-Reply-To: <20220609214657.1217913-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:56:02 +0100
Message-ID: <CAFEAcA_STWv-LLcoQjjnqbLoHJjcoSrB5HRz5Ea_f7d9ed=RdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/arm: SCR_EL3 RES0, RAO/WI tweaks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mv8SuDqHfU7a

On Thu, 9 Jun 2022 at 22:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust RW, fixing #1062, and adjusting bits [4:2].
>
> Changes for v2:
>   * Fix patch 1 vs reset.
>

Applied to target-arm.next, thanks. (Fixed a missing space
at end of comment in patch 2.)

-- PMM
