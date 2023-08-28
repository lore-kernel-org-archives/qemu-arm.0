Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp2847905ejc;
        Mon, 28 Aug 2023 01:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGul3VscP6w9MLK8zt+yu6GTd/R5gNkX3t/OvwU2OVxBEuOnOkjaJwLqz5eBW4fLTtxj55s
X-Received: by 2002:a05:620a:4411:b0:767:8083:dd46 with SMTP id v17-20020a05620a441100b007678083dd46mr34778178qkp.61.1693211148644;
        Mon, 28 Aug 2023 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693211148; cv=none;
        d=google.com; s=arc-20160816;
        b=tSkuhVYThzAxq1OtNxlPVgbBT2/IVQBwWHNWs3ritTlPAkmQ2SNLw+2WZyaReARLVy
         wSLgnH7XqhV+PM9AQcu/CWFQNmyEB6zFpZ7fH3HB+M4JIBZ5yZfJ8OLJm4CkKlw93ppt
         eC3x12Wu4/xI/mz+JWwyA3Eo5pqci2BjrX+t69pF44cEpOxEas1erxm0bjrltnCQmjQg
         qVTf3j6pu1vTpe1IeND8obMXUUvrp6GY1WiI2gxSUrcQZGnuADF+4N6aYmHAAbc2YYF2
         6ZnjWvZV4MEG0YQhJAMeiUYxlJz6kOlIGkFtPDlmmCcMcuG6GQ11Xl60rJWhhNq+iJ/g
         cI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dUL2m1tfRB2n6s+nSERj/TqV/LP7m9mlNxBniZVSRQs=;
        fh=4ZtBmTCUOcd1dBLABh8nxFNZamR/m127sgYm9vLIUn0=;
        b=KE2YUThdG/NMWBiSBXlZPbvBnmnMfsDerJ65WFS9/OkN7tXm0U8fOti7Wf9CnnvQp3
         +0onYwbYNuLwCrTWGOjyEdAGg4ro8kJ2VWGRKRkDIJgidu2JtM9lkvZk15jmIIS5uRX7
         IbvSQsI1A2Q0B0/SgwK4q7up+rxw20nqILy+OsuXw1kuw2wQOqB3ncp3sRa/gJR1zlS5
         wQlRKWAn+TKOCElltoVs6/Qm6eZQk41EUwWcMUdHK6AH2hj8Pi8ePRegVUocOBKfgztX
         cs07u26KjqLQNjyG5CEO3I/VnGKwwxSekjE69OlVAfMDTyytXZS2QAJdzLhV6c7m8y3T
         bfMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=hw+N+q23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a05620a414300b0076f15fc7ddbsi583590qko.7.2023.08.28.01.25.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 01:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=hw+N+q23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaXZ8-0006bE-Vy; Mon, 28 Aug 2023 04:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qaXZ0-0006Xo-Jk; Mon, 28 Aug 2023 04:25:34 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qaXYy-0004SB-7z; Mon, 28 Aug 2023 04:25:34 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso371828166b.2; 
 Mon, 28 Aug 2023 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1693211130; x=1693815930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dUL2m1tfRB2n6s+nSERj/TqV/LP7m9mlNxBniZVSRQs=;
 b=hw+N+q23Rtupx0dPcDnrpSfawSORfnTem61sQzazWvcoTxD0jkRkWVYqsFLfSD2iKl
 V49qfxyYLuH9naEF6aVcFYNEFgClk1qRxUyKrBGa7Q17KNqzqZEqBn/f3BDgt+4WO4gP
 REBBkGxP1WtCxBMJBT9gASeeAOo923q46n+yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693211130; x=1693815930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUL2m1tfRB2n6s+nSERj/TqV/LP7m9mlNxBniZVSRQs=;
 b=k7mLlOKSV5L8SH5yLskC6UBgZj92OBTllfSxh3zz4TsrHpkzlZtTNXtQ7+e6Tuv0Br
 m+bxUAOjm69k6mk9qZ74U49fuG+qFG6seE6Sn35Hl5ayYBr8o06V/flW9jiRKvW2zqMf
 p2OoXcVw00Pi66CAA9486qISx6wl+1A/K4/Ux5s711Wb66dq60l1p4nDFXaNmSoJW5Nb
 UloJraDHKnNoO5zMv12h+8bxnOKyXqNCGSAgCaupFq7/dsaCSAKD569Be2C00ynHOPD+
 gzY1voykGTe/xX111wTno651PzYTHyhEusE8uKum7jv6Iv3IcaRcfyNdI6+uQpeGgbzx
 W8yg==
X-Gm-Message-State: AOJu0Yxt/DwA9vgLLFPGLEfZe1TS9uT82n5+Bt3bXi9FS7847Bob0OzQ
 6nHaBKZo3ZR6F3T9c0lGNySRbHdtEBWcaXS2Imk=
X-Received: by 2002:a17:906:cc13:b0:9a5:9305:8402 with SMTP id
 ml19-20020a170906cc1300b009a593058402mr3629601ejb.51.1693211129693; Mon, 28
 Aug 2023 01:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230825203046.3692467-1-ninad@linux.ibm.com>
In-Reply-To: <20230825203046.3692467-1-ninad@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Aug 2023 08:25:17 +0000
Message-ID: <CACPK8XeDo7USEw6_fMYHhcdpRJsKGzj1-N+cdMBMu1a2ub_PZQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Introduce model for IBM's FSP
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org, 
 andrew@aj.id.au, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 0dWFhe8P1OQB

Hi Ninad,

On Fri, 25 Aug 2023 at 20:51, Ninad Palsule <ninad@linux.ibm.com> wrote:
>
> Hello,
>
> Please review the patch-set.
>
> This is a first step towards introducing model for IBM's Flexible
> Service Interface. The full functionality will be implemented over the
> time.

You have a typo in the subject, I think you meant to write FSI instead of FSP.
