Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp287417eju;
        Thu, 4 Apr 2024 07:15:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXffubc8dKTau1N4wtj18PvGnr4dmNxVtK5Rh4PGhercdbHkLOS65MkpV2g0SLF39n0vccqj3M2FN7vVvL3tXE9G6VRr6JB
X-Google-Smtp-Source: AGHT+IGKIFyk9syksohji2ZKtqkO5IYzT10yEMaNwqkRyO2tp8rUryDFIYXG4TWMOFiHKOLjri1w
X-Received: by 2002:ad4:5dc5:0:b0:68f:e779:716c with SMTP id m5-20020ad45dc5000000b0068fe779716cmr2105267qvh.63.1712240146012;
        Thu, 04 Apr 2024 07:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240145; cv=none;
        d=google.com; s=arc-20160816;
        b=s4fusGxFJ7bJVSlO/xiWHCD7EmF2K7H5++AXqKj4nJfrr/2oTMt5JZ1Ft8/zHwTkBJ
         gWMWrPOJw8FnGvyOeW4zu7k99EuIMUq+AEUf6Wa+X6HLobUkg4rm41CTcD7+2Wh0IST5
         d9mXUd8aBaE8TqWqX57UaL+btdmw3cKQBs1iobn9j3U3zVBsuuOPRrGnP4yI0bG5yO4C
         fy+A2JSh0/vZxqzvixGyAfZUyAfNE7NJQf3GSZ025mYYL/3KTB7Q5GavwqIQifwJ0SWb
         Ax925x6v7kevdEX2TxSJO5Pf66Fu5sNEKOMvcyuRlBoAx4ugi9pX9gx8s5jm9Rn0ByG2
         YMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OpZ49vy00/X1604T6luPCTC6ve9xw7lv68Ak0EDNPxY=;
        fh=T4iyLpRxfX2pCltuCpBB2xZPcSCxfv+PDz5n1kJ6pVg=;
        b=V95MwKYpZac3x4Qt3Hz5V4vElocpoCy6Xe6wbg62YaxnD9tfQJy17NAHiQnAj2ATo5
         4D5bhB3wfZH2987ES5Mpi2X8Cl+PPGTehMESp9I2qLDgivM05toncXJ+Uhnvh3jSdqnt
         rld+yNttABnYvJacGiQvPJrKzVXem9TNjbk24N4YwBZm4jlJoj0ORP0lmr0h6Sk20/Fw
         CVICV4d7vTCfnK1HmoCsT40kNcpnfEZtLGQXG3sBbuPWH/wamUnnB7hTn2Zq8GPFng0t
         ZK+EyphuyNEbgmh+xzv2oXQtUCoNQDAswB5ObgnK551BMZHDRcZbFaNya+ZtxrJh2Bti
         MyuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LahDcADE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a0cdb0a000000b00699335296fesi1240308qvk.472.2024.04.04.07.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:15:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LahDcADE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rsNsL-0005C1-0P; Thu, 04 Apr 2024 10:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNs4-00057f-1j
 for qemu-devel@nongnu.org; Thu, 04 Apr 2024 10:15:19 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsNry-00088O-Mi
 for qemu-devel@nongnu.org; Thu, 04 Apr 2024 10:15:15 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-515c50dc2afso1227476e87.1
 for <qemu-devel@nongnu.org>; Thu, 04 Apr 2024 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240108; x=1712844908; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OpZ49vy00/X1604T6luPCTC6ve9xw7lv68Ak0EDNPxY=;
 b=LahDcADEFtl2zeIxw9uYWoDDBMBcASIOGvzOQuhyS4yPk/zRM0o4boSwkWCzsuFeMe
 7lgaf5hjLd8BPs1nb+Cf5Ido9TYBnO6C1IXsRnVRSLnpVXNkRsr51Ki9dKQEBCBvmOtF
 BLR3eExvBz9VwM2oROsRhYZxnQfUyQrMjomIbNOmfXgb40JMZYhgQYPd0GzZDUNfSM/O
 Ds/XfYusAMfy2kd1CuiJVHG0cO6NF9/qpoF8Usu7l9nMtOSz3BYJUHoCt4pmfT+Rub/b
 O+ZC/fXfY/gQojrDalvaC1Wrxg3l5QbksAOlpZXcA0lecCB9+VCsNjRr2sLIORjjF/E5
 zHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240108; x=1712844908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpZ49vy00/X1604T6luPCTC6ve9xw7lv68Ak0EDNPxY=;
 b=d7y+mKIqAtHj+seldUrVJXEtVf3Prfv90PcRvsFLBT19UfQXTNB+faKj7aJTFUIgXh
 16SM5z876sbqflLSDYATj9Iz5KhVV+61A73rZcKJ1wojbS4RayohqI3Os0DgB7G+m9x5
 UHTtCKMTZXeytZ0HAS6nItCzINR6vv3RpvmLLHte+2JMIZGVo70rcPHnc0yHDIkHyXVQ
 qgpsVp1Q84FPs1QZWe96ovC5FYzxlZ3NhbOeDpN3eTy16Z/dcqemLUQXlI950ffLdi4q
 1ebmGydIFAJwuRuCjgf4NLeqZWIlUN/PDx2j5C/vQLpHL9DgFuMQTZ70j6bW08SmOjtm
 dPyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyfPYj8DWeVd/w7S2a4iC8kWlIKImnmVN5eYDHUa2slcrwF/xTHL00D/WiIQQJXmuaQyLsFxj2K0ijPpLQAjl11UW8xHQ=
X-Gm-Message-State: AOJu0YwBW4JWqc0LYZXl6T5MstIhCGtTJ6b+GICG11UiDBZNOYzer0Ut
 yqPim+cpqvh+1Pkn3jGWKkxeXwMSCP3YeNGO8v834mzpoS7gDg1wQB2XhvjKNZPGa1Ig3lub/SL
 AlZPxEoZ4FGDuVtDitiJm8lDuu+QTH4ja30rFqQ==
X-Received: by 2002:a19:e053:0:b0:513:d5bb:3017 with SMTP id
 g19-20020a19e053000000b00513d5bb3017mr1997740lfj.36.1712240108374; Thu, 04
 Apr 2024 07:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-3-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-3-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:14:57 +0100
Message-ID: <CAFEAcA8wJe7g1kdJNMGK-NnFxvhyf_StN_uTtb_EQu8kkeG1DA@mail.gmail.com>
Subject: Re: [PATCH v12 02/23] target/arm: Add PSTATE.ALLINT
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uk5hYWJonbkG

On Wed, 3 Apr 2024 at 11:17, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
> ELx, with or without superpriority is masked.
>
> As Richard suggested, place ALLINT bit in PSTATE in env->pstate.
>
> With the change to pstate_read/write, exception entry
> and return are automatically handled.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
