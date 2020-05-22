Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2973975lfb;
        Fri, 22 May 2020 15:16:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF8BTwxuFsfz48QG78Hncth8aTzpy3n1tRnNoyFyjGa9lSdFR5yYHjjkWT/HFHvhP0iy7I
X-Received: by 2002:a0c:9e53:: with SMTP id z19mr5948872qve.47.1590185800278;
        Fri, 22 May 2020 15:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590185800; cv=none;
        d=google.com; s=arc-20160816;
        b=Sakly+ikuTnsF3RaC9kN3osrXOHIXEF3vo8Yaj7ErMO161LrtWCIYHXmwqIwwE60rr
         rSuUSEKksVBuOtkVtbUSGH1HYZDoEgJAqxPDSnF11QQhFLKYaUslLg41Rn5wDV1sxXWP
         suHGUNPvO1sPcu3s25pD4SbpKgyravZjQaLJ+gSfnvcrOZEAKhrxk37pTrfLitPhAuB3
         IH0LsQ+MPV/RyAH8aTeCAO8yjU11Ngx6esvblLDEW4qHiPK2zNsXqtJ140ivTSMcYmnW
         +e1XKBFE9c+kawCKqdhVVw6X+uXchtyPP5qvgzgPgiI5Y7B/sgA5fcNZbIdZKEqN2pUD
         kThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hyJbzYvz9no+JvZT0ZyCwUOfZMKd4VDuNu9gDBwudFQ=;
        b=hD8qQ1txWhOTVW6fAIhrBSiOBGXHN1HEvdkDI3k/oyDQlIMq6/T9p9I0OUpRyTNQYh
         Cj6/tFruB+GIEcpaxgl7+W9dW1IQ/yUSwZOwcvKX3Zao9VAvw/+KviLjBacScBaixgWj
         VLsHgceSptQ1FbOd9mJQmOC9zWcJMJLmGdpxgBwz5wo4RYlM4VMo8DLg3U5lJUGFeqDU
         iBYPlAZgqd1mqlDCjor08wtVXB7S2KeKzgaFxhK1KzYjpEj4lvxC/wDHjz9qAGeH5DKO
         +vOW2j1RMEQ9W3qJDzWpo9bAPPzXXftTAigSo1QJ3iEJvafoHTcCoOmrmQ8nZcsmm+ol
         ujUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNfbd0zL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si5787685qtk.87.2020.05.22.15.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 15:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNfbd0zL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jcFy3-0000v0-Mp
	for alex.bennee@linaro.org; Fri, 22 May 2020 18:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jcFxo-0000uS-B2
 for qemu-arm@nongnu.org; Fri, 22 May 2020 18:16:24 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jcFxn-0008V6-59
 for qemu-arm@nongnu.org; Fri, 22 May 2020 18:16:24 -0400
Received: by mail-ot1-x343.google.com with SMTP id z3so9405883otp.9
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hyJbzYvz9no+JvZT0ZyCwUOfZMKd4VDuNu9gDBwudFQ=;
 b=QNfbd0zLHGqNQJ1BpmxVfvvr/7AgClRq1BzI0n1xe1MjAfUrC3WL7PvhuN4NeTtln0
 WLYSqR3Tygnw9FienGwOBzBxI4VT4PegV5XirrutE7X+sfuCgH9OdRx8CGH49ZLkJkio
 +6n5k1S4fv1jHoK/cEs3K3kAlwO4YR9Y7VczekV/gcXE79qws1pkZiIcwWRo4/Q03O9H
 kbBkmq37RlOc3uNHwK2/29U9vbub9XwrBQ3CiDlcR0I6YOCmq8cFWCXv9GjET4KnfN0y
 1Hx7YRDAEmI0eTgsiulj6g1nddB7Jbdi+33RUIiXKDcTehX1nFEC2SpHbHRh3tiZcIXd
 VQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hyJbzYvz9no+JvZT0ZyCwUOfZMKd4VDuNu9gDBwudFQ=;
 b=h9YczsdSKmLC1AQvhfwa2Tep0sOKZnHmM4dHxK1TOj7RqiSN6Xy8ORiHXi1AYcDqND
 Rrz8dWasBno04tZRdiDyD/5Qx1lVq3lJBhYi7AfGK6GSBWc+ypHvlYdptYjwx+wkw7p2
 LkRDADol77YL4OtNd/stDLNVv8Y7YoF4YjUinwK9QcYV+M7iQ9y9Pllt3/qFffXv/xDl
 CN2mXjNhZVLgMtJWCjHmNc02cUZIkTnx3Y63fwcKcMkRkwywv4yY5lVGvka4Uj5BT+/z
 wE9l9n0gEjnXSIzM6bxsDEDfFlQoBvKVUudTk3dLM0s/Nkxi5k/G0GJJmNA+l6ZxQsG2
 ArmA==
X-Gm-Message-State: AOAM53263FzgH7nKym15RnDGwXOOaxPOC+0liQeqNdmryZXj4ScnKLIz
 BjRpcA38kwxbM8JdahnV2LZgXA/iZyCdd5ugDmKPsEU+28I=
X-Received: by 2002:a9d:3623:: with SMTP id w32mr12317395otb.91.1590185781562; 
 Fri, 22 May 2020 15:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200522145520.6778-1-peter.maydell@linaro.org>
 <20200522145520.6778-6-peter.maydell@linaro.org>
In-Reply-To: <20200522145520.6778-6-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 May 2020 23:16:10 +0100
Message-ID: <CAFEAcA-WmDWvBP=3GauiiOEGvCWdKUb9ENM_8F7zLLHY8po8MA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] target/arm: Convert Neon narrowing shifts with
 op==8 to decodetree
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qs1taFmxNXEf

On Fri, 22 May 2020 at 15:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the Neon narrowing shifts where op==8 to decodetree:
>  * VSHRN
>  * VRSHRN
>  * VQSHRUN
>  * VQRSHRUN
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---


> +    // todo expand out the shift-narrow and the narrow-op

Oops. I fixed this todo item but forgot to delete the comment.
The code should be correct, though.

-- PMM
