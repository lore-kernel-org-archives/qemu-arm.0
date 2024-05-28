Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp49554ejk;
        Tue, 28 May 2024 09:04:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9LDPNeVxQukE8yaLPBInchvJ00fvcZbyaED2cwLiiWlvnawJFbAv7mV/9M5ChkHj817z9uaiDk1m0AQ2FzbHFUDQSWdxs
X-Google-Smtp-Source: AGHT+IEWplPNdZWISncluL85zvKKRM/VAsIq+DbtQ5C4jKJcWUyKAF/ZItqokxQBIlbvWGJ6APk3
X-Received: by 2002:a05:6214:5010:b0:6ad:764d:bf39 with SMTP id 6a1803df08f44-6ad764dc1e9mr158585736d6.11.1716912242446;
        Tue, 28 May 2024 09:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912242; cv=none;
        d=google.com; s=arc-20160816;
        b=B+FwCp2/JMFNKFj+BBC9Nx8U+bS+37QJWs+plcweT+umnb4FYkK2shlC67bV+MJxuj
         9pee7A8xqX3WgjcE6EemUbp8Hm1dk1NEBB7JjD2NbRzB5o6wmY/UpI/YRXck/LhYJ8o8
         XAHF9eqVE7bk1ulGeEJMFVt04rMfAkGtxFRLNlnA5LKD7tyZKa8k4qOVvsU+SKo2L8Nf
         IJSXRgtoIbqM1eR30K2apaDTA7r45DLruB4pm1bJh2vZv/wVTNoUVHXHnqX+SzqZoiKM
         znkJJuwVCKedW07oKWw5rxNRFc3Cu2u4NbvUh6peASuOhe3ixdnRYXZ1uEDQWfGq4hTE
         DoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pHpodULsqsdzeSAudm3146gsyzitGajONPimXbKis+M=;
        fh=t/giEtcTwK5oELIa7uWqabJjT2PGXGc/3JjZr4Vwg+4=;
        b=gmAdNPotyMVDN9RpxnylQjXt2nH0aAh41gK8nbDtS/LH1gDGxsFT4J58jKZUXLBfZF
         UVCk81tBBqUf3oyFJ47YOBca8YXlVTg2xteYXezdZaxNleBjrUKOwfqQtfmbDFOjxGtj
         cPkNnGXYUiAm+KnLGVDGlBdqyr+YaKAJO0H52wfdSiEbeE4d4wFSd7pEaRN3EEKK8+Hy
         iMF1POuWg8BjyqMzylaO8ALGM4t1T+vfThcv7inCDpKIafjA5/DPW0UaLPhIeLWJowq9
         qB9VtJqlPoTTNEid/d6wEzBMsl4xfar7HdNevKYWt3wgf5AHUY2riw5yglbSk8RrQDOL
         p46w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0p1GbuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac06f508f1si104793506d6.92.2024.05.28.09.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0p1GbuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzHr-0006Hp-I7; Tue, 28 May 2024 12:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzHq-0006Gm-78
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:02:54 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzHo-0007oQ-A3
 for qemu-arm@nongnu.org; Tue, 28 May 2024 12:02:53 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5295a576702so1197382e87.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912170; x=1717516970; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pHpodULsqsdzeSAudm3146gsyzitGajONPimXbKis+M=;
 b=D0p1GbuLeilXU1k0sXMWzb0/lWMXlhV2uX6n2R55Az/UquZvXvI5VoXl0zE6xfcKi+
 As13fGf6+cCGzGAlThxgRFK/LU+P0tmxkepiMijjvJ30U5ap09PPxxy1EN0RkXIlaimu
 z0Ed7ZkRxUKvevMtwbFWA059JzJ5AIMUJRZ4KugDn0zC/cSMUszuKWBNsXpRzMVVB57M
 spsAOTKSXL3t+yL1SjQqi4zcNK5Rh3xlOpZBPNP2n8KhqJj7lzCw2JOpVmDuYiigqpeO
 qOmKY3BR/fMot7VyX/pVFqt0WMiYo1nfvGb/FaMUt3oZEuKvlix3rynGGRiBEygc1GGD
 066A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912170; x=1717516970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pHpodULsqsdzeSAudm3146gsyzitGajONPimXbKis+M=;
 b=QvqLrsqeu5zgkZ2vy5j0dRo9t5syzSYHhsIefzc4x/8ZEJ1ZCeoHWE5Pp/MasHxiXv
 5Q+VTcrbciv0WYeabm/td7szovoaDWWX9onQ6hoKFKICqT9qxncPTMatnqHy+zIsjFYS
 oxokXxvASdaM5QdXHzGJt+1XkXhfaC030UUFC8w0qS18dHRWn9Ov/C2rV8w3Acp3Athn
 K2Fl1C7bhB/71/9fJlftlaZR9qjqJsivwMeTcdxxiB8y/1jstgRb08VKeo1+waFVTyJ2
 tQy69I7/LfwY9NgQ/cjy/O5u7TYDW81a6bliCJg/eanlrsL2Ymfzm7dCQX+xxiX0N6x4
 Qmig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7sGfq/Gcl5uPQ3I8868xbPi+d3iaBawjZgxWEnXvp7uDXbhqPEw+8W2JR26SAwMzL9EGsxTOjddZUepu1sGbUOaZj
X-Gm-Message-State: AOJu0YyJbbbgMavpKu2FTC+qh+UgrBl5B5+SEiMYTRM1G2Dq+ajkeAR+
 GRNSUrWLV6keTr3kyqQXFLztLQrWTip4dGPrr5upQ6lwQ1zNxThIbO94xAstjLTFukdbb6HB7eF
 cZ3uvZJJlegG7EtYZnzFVxiJwUPC4SL2YET5xnfRvd29sQC+g
X-Received: by 2002:a19:914d:0:b0:518:dfed:f021 with SMTP id
 2adb3069b0e04-529645e2b3dmr8113469e87.24.1716912170320; Tue, 28 May 2024
 09:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-58-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:02:39 +0100
Message-ID: <CAFEAcA8j1CV-C7dpD9GQzHFZ4iCCvfzN3UoWTcWg4xkd+E0BRQ@mail.gmail.com>
Subject: Re: [PATCH v2 57/67] target/arm: Convert SHSUB, UHSUB to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: VuTo3IS8v0vG

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  2 ++
>  target/arm/tcg/translate-a64.c | 11 +++--------
>  2 files changed, 5 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
