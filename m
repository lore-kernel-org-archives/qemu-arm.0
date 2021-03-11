Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp430999lfg;
        Thu, 11 Mar 2021 08:23:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMEP/1Am35zSqz1C4/7TLnUD5kZ3dc9SHa5ZsXi+M+T3V7tMTfuNT6d946rBa4/H42i5Ru
X-Received: by 2002:a05:6e02:12c4:: with SMTP id i4mr3272869ilm.297.1615479802253;
        Thu, 11 Mar 2021 08:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615479802; cv=none;
        d=google.com; s=arc-20160816;
        b=MW80Q9ScyvIwDHI6CtMy2+rfT0fYCYdxKxjAgoTr7KV8C5yvHoKUILgIe/df0DtXti
         v83PXfz0W99VjSY17FdfYkWBLHwkinLWTzx/FAjPUUXP2yejPzVo0XVqVdN6YOiTRw3Y
         0C5t8DYXi0EwQ11KdCrVpptMBj1CI8SP3B/SSI3FO0PaMmEZ0Sq0DEfAY1+2kCDLaLgQ
         gMC9oMaknEIxT9w5S2Qg68xgc3/FMhyeKI3xlJNXd4sE72LEkY7OOyV6sx2aImHD5yGA
         7dYwLjahGF6cctblLBUdbNWR5A477m5cWoHuBf5psD3z6gavw6HN1m4BlOMqYebeBKZe
         xthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xpuvIhnTyLj3u0gKnS/722TUFWYedGu3c43M4i1wwOA=;
        b=fKe2hwd3PZBmTUUawOwFjyM4Nf2eY/sS02du6ov9jTEf3JcKTs8WK17v3vDF8eEcOw
         QU8/r7lQMVEEq7/qyFTdGKKKNx5Ug3b7X7qcIUEqnHj0wBNz6msFYbaAtsILAS2Kl2Xn
         MYMJRdtOYe9BmLya2sHgaIUGPMhei8cfBb06N3YlCBiM5mzv9IfXX4ToHzFfv1DdrqKB
         GpPM19gLxBWV6sH/GE7kmoKM+Kqq2+mvUmBI5WeoW2bfTVUVDmi1kUqbAxWjTjKH+qB9
         4avsvDK22mo8pdFDOIHwXJaJMGa2Y0W0T2SaJX/2kK6849sIp0us4iAmTul1Jgcpf7+h
         CH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TrTqTT1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26si2680303jao.38.2021.03.11.08.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 08:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TrTqTT1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKO5p-000305-He
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 11:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNll-0001Fc-H9
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 11:02:37 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNlj-00043h-IN
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 11:02:37 -0500
Received: by mail-ej1-x636.google.com with SMTP id ci14so47123039ejc.7
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 08:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xpuvIhnTyLj3u0gKnS/722TUFWYedGu3c43M4i1wwOA=;
 b=TrTqTT1FZ3Zz0RRbqkYxOdOhBdMbEGKOBatTjr+fNgvH3YF4fi8RJAShhghuA4+tTv
 8apiDMgQHo/7TlVBrTJ+EfVBkNDYK7MCWfehuUSQebd/vnLvPMBUB/zKrSxZGwUl38g4
 xFEyuWh8cM6z+f26a4oqgc0qWSkMBri4V01qJRxFjI0CCmxbjlxzoEviAoZtA0O69hlI
 lCBk+MbuLBQHTLci884rKkw6TaUevE6zVfOT9hT/7aOq6/+46K0w+wtzAxHJ8dKyo9Pe
 Ogz3tao/1bcLq/qrHOfegEnKutcg52oV6+miEpi9Rmh5zu/USTgO6vwuivsLBeWohUq0
 NpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpuvIhnTyLj3u0gKnS/722TUFWYedGu3c43M4i1wwOA=;
 b=hB8808TUYnKinMGitGhxzkrCI6SlJMmC8aH+XilBL9EnQQ5ThbIazgIDJ5VNimd6WX
 9VpDz0L/eVmPzzOsW1AKQVMAHJZ9G5wiuq/nr3WPvTtWVij0w9C5K8l2FTlqDLbZIO5B
 srA9UR++LTPzZCm+cYDYC1vPnkH+RYMeq9toVNXI33H6AIGZtn7zmdACOEDbl0+2MnZ3
 m62C5HFfluwWFVZf8twa4aR8vbNYm5B5uM2a6pMx2KO0pruElqLsu5PKWOkLshC0qSiy
 4kxJgvy5rBgGFkgh0R3Xg0eWsMp5VFTBlb2zVaOsQmTitwBQWOK9DmPEWwHvCfVZ8O0h
 AKJA==
X-Gm-Message-State: AOAM531qi/R7PtskiaKI4raRXfNyr263aM6kGVyevhVkf92C/eI5Ecmp
 oC35ntwfanj/czFLiQy0FOn3Xzp6Um/eAPGh/SMxjA==
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3777745ejg.482.1615478553617; 
 Thu, 11 Mar 2021 08:02:33 -0800 (PST)
MIME-Version: 1.0
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <e7520c77-16a8-0fda-c138-b411c20f0389@suse.de>
In-Reply-To: <e7520c77-16a8-0fda-c138-b411c20f0389@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 16:02:14 +0000
Message-ID: <CAFEAcA9RiWvYdh_xAu4iF+Gq2PBGSMk7YkT0UKmeDmrDRxvSww@mail.gmail.com>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7QE0AUiA8OSc

On Thu, 11 Mar 2021 at 15:21, Claudio Fontana <cfontana@suse.de> wrote:
> If there is no blocker on _any_ change to the hierarchy I will put it in the RFC series,
> so we can discuss the merits there and investigate alternatives,
> if there is no immediate blocker to any change in the object hierarchy.

Well, the blocker is lack of justification. The right place for
"common code between kvm and tcg" is in the base class TYPE_ARM_CPU.

thanks
-- PMM
