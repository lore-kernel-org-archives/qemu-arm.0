Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp452006lfk;
        Mon, 7 Feb 2022 23:15:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG2N5IawPiYlc/tzPlPxwERYGo9onJTXn0Jq5VPJ3ieS7/J0vSzW8mYl8k9OdrGXv6Vn3x
X-Received: by 2002:a25:8b86:: with SMTP id j6mr3344981ybl.661.1644304506412;
        Mon, 07 Feb 2022 23:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644304506; cv=none;
        d=google.com; s=arc-20160816;
        b=yRK+aEmBa4HurxBiWtvAJ88xybzDsLFbA7BNu2tuM3unJ9wWTt3BWxJFqjZ7L/bAbt
         yS0Eu9a+ZNSHns+bQvoqJ7dCd0KyXtoYNwzoaXgP/R96jNApikj8tnwymA7xNjAhGmNc
         7HY2Kiogc12zX6ooGie7Ku4PoVJyl6w0lIoe73wYGmmb20Eqce64i/URc9FWTD6hVpEj
         raaLr3ZFrkV+YROsv5JYuKqqkTYrRob+BRnTsv1BRev3QJFymDDesN4sTPQ2oQ0SR8tq
         qgevUrDCsdKFfF0Qcfc6sl4Fwk5FzUy1YWrOTVrXMmhQzTub5IDzmW997WmIqPRWbsLc
         NOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4dVs808c/KGh7au+kF/SwIx8k0X8gpbFoQIaxWk+ets=;
        b=b978jU8nGMmL8gpMqJUYCW8Fk7j0F4c8hijLDFr77H/2sEn9WCBVeVqelwpBmfZsu8
         67aUC41rQK4TkDqNR17bfoBa5pFbFS50ys2dAVz5BEiQIFaU0I+zdmb0Q4bHVJFlaNg/
         Sxd9FkDnKd9RoiB2eMH1o1VJk7BtTIZHPe+cQpJcuu7H0bH9sYj16CvO9kcXMw70ATEf
         577IImFVZ/7sCY1tH2oRw1tkUaaK+zDk0k/kqtSMgcmHChcPq3X0xR6prs9Yq+nKxNjD
         kLn0ht/RIVa2C3XU08StrVmN/d/yRzxijfNAjeot/2WCf6Sep76ceECxl1JPFwYE4jLo
         ATLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloudflare.com header.s=google header.b=uQUOvggN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloudflare.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si5761774ybg.776.2022.02.07.23.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 23:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloudflare.com header.s=google header.b=uQUOvggN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloudflare.com
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHKiP-0007FB-Pq
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 02:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@cloudflare.com>)
 id 1nHF2L-0004GS-6Y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 20:11:17 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=34310
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ivan@cloudflare.com>)
 id 1nHF2I-0004yJ-Te
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 20:11:16 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id v186so45453551ybg.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 17:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dVs808c/KGh7au+kF/SwIx8k0X8gpbFoQIaxWk+ets=;
 b=uQUOvggN13kn4i2tfnhN9y+nFgexTEtoRTA+WqlWDv6hn6H2jHxNniizR/qmFoMy9X
 IeLJT8+ylOUqLv760mCCnjXuak76FVUT0Fie2iBJiHxqCOE6p6O2uAEGBCqiXh8dpZvN
 Xl35nhcmfSxaZjXEvISDpin3wStT3YOnZef/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dVs808c/KGh7au+kF/SwIx8k0X8gpbFoQIaxWk+ets=;
 b=YP7gtbacnP2hUKVHcruc6M1bC/WwB1HE1LKpaedvrcvnF3E9XQQMpa7rq6re0GLxdV
 jAy1Mmetvx63mj++K3LufwKH+65gyPiLTbcM/EiMCdfYGz+EAxnykQTq5iZLU5ICZbHk
 /Vyd7dDAT52B0T6K9DIjUXV/9auinadHf4Qm4fp8u8rb84rytJvsnK8K1MPx8hOW+NvM
 B+7u/O6YbIhik0tJU4A07tF23BkpmSTrfkN+CEPYD6Y9BjzJ3AAB4tNTZ25biSx8rhrr
 q2GCm64OnZFPIkBHqOps0zKHQ5EpcUc3M4LVIJh+y0yHkJoRj3URkZGEgZzF/WNNdG9Q
 v3YQ==
X-Gm-Message-State: AOAM531NjKcKrwqn/f1xT2DEzLNkhoRHp16Qz9DLtR8bSlUymMqTEDOG
 AMGZzBJ4Y03xECv1RdgR07ETUrHZvvSIcoHii5/erQ==
X-Received: by 2002:a81:c60c:: with SMTP id l12mr2626307ywi.379.1644282672862; 
 Mon, 07 Feb 2022 17:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20220207225211.15281-1-agraf@csgraf.de>
 <913E2F6B-AEBD-4DF6-9470-3AF34FE1E99D@apple.com>
In-Reply-To: <913E2F6B-AEBD-4DF6-9470-3AF34FE1E99D@apple.com>
From: Ivan Babrou <ivan@cloudflare.com>
Date: Mon, 7 Feb 2022 17:11:02 -0800
Message-ID: <CABWYdi18X6JMbHkWQdJcX-W0=C+v1O1DsbzqmzHuUF9P=TFBvw@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Handle ID_AA64ISAR2_EL1 reads
To: Cameron Esfahani <dirty@apple.com>
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Cameron Esfahani via <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=ivan@cloudflare.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Feb 2022 02:07:39 -0500
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0l9I+hQpqkf

The patch addresses the current issue for me, thanks!

Is it possible to make it more future proof? I can imagine a very
similar situation arising in the future and it would be good to be
able to handle it gracefully. If it's not possible, then maybe there's
a way to output some sort of error from qemu that a user can search
for. Right now all one gets is a qemu process using 100% of CPU and
outputting nothing. None of this is required for this patch, but it
would be good to have it at some point.

Reviewed-by: Ivan Babrou <ivan@cloudflare.com>
