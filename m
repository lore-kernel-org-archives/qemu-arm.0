Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp276904lfo;
        Thu, 28 Jan 2021 06:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvAo14/0OTKhFRKfFTqWNoTKhoymhK7/mf0bWuFkA5raSVx2TIq/MB0SVPR4xdo4W0XX89
X-Received: by 2002:a25:2186:: with SMTP id h128mr23147534ybh.369.1611844723587;
        Thu, 28 Jan 2021 06:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611844723; cv=none;
        d=google.com; s=arc-20160816;
        b=IYh7WMfNim8gBnlpf3gB5smv0/cXwOJHVM1gaZ8J5fik1K7E71oBKzSJWHtjM8qJiQ
         vwQSbLLnX+Jw6+/CPyBo1rnZUFs2j97nPFL3ytvyPxcbxukvFTC90lsRf5/JLicqtNIP
         XHyyjY+Vs6cvwGa/eY1rVM+gRouAzc374bbKQ4+aSN1/XM/cyPsn8C+bPBh+iCu/t5J8
         mwKGVf+ba58qGo46SfZ9CQa8bJjrlhUtD20qHRMSLV8qy9duZJn001kiUmXAvu34wKtK
         hYnsKSIMHNLYPmH+UtqZcVs91Pki0QUwlLikAj6qpBCszpJbyO7G/EQjqVtQZ/szk8bh
         VhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BOUtrUQbu4v4DcBOyp3QHTI9z/QDDXd95PtlE1x7RnU=;
        b=okrMMdX2vlXE4TJa4PPnEnvJaLuFkHVABaw/6caBIt3JLvki+qF6FezdyWij8SBUq0
         oWh7kLePTl5bpzNG1ja4Ca4mPd/0uAtIec1lXl6HDj/5BHrQMKv+yLRKztT8t9fwhpuL
         O5h2Z/TH1mZmlCPG9+WE3iW/IcqGoNfBKUy5q+IeqiKhG5MrKmbK6DEVNPQ8kz2P1lJB
         NnkNRV6ConJVCIf4m7gWKFNzofBxveGcY9OFKpZTfvHOWhylCmQYTYdmXbXIdd93+dT1
         WdgsjnVd9p58t+yN/WNzz1QCmZs2CFzg+DO/gmVGk0o6qaAUcu6jOasU+I9qgWvCr+Rs
         Pl/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=esnld8CM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si5295574ybo.374.2021.01.28.06.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 06:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=esnld8CM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l58RW-0005hw-W6
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 09:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58RF-0005gZ-IM
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 09:38:26 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58RB-0006Cg-6T
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 09:38:25 -0500
Received: by mail-ej1-x62e.google.com with SMTP id rv9so8054940ejb.13
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BOUtrUQbu4v4DcBOyp3QHTI9z/QDDXd95PtlE1x7RnU=;
 b=esnld8CMrPBUhXNe/av8piYuONGbvNGhHTxp571wsxa00L0pCrdGBsLTOo/PYzz/5D
 xEVul5br5U2/dA+q23ucGHf1rlBDCG1LdLHRngyO8no5Ow/2mAIg2CP/SEYx/zFRL1jd
 dwCUYLUIUTTHm99DV/VexRIbzWY3nPOkPoYJaKME7+3GxVa0HvCV6loB3if/dDrEsStS
 p1KCq0LCXJcmOz4OtFSlkVwEwf3z6xZRSrCaqcI4VsqK1FkyHGFNeXhNsdx11dnIXuvl
 1u+VGG57g0KLEukT4cCeAxM9sKsae2ySokq0RiV8nHtxDK4sMfihWLbDPoVd0PJx8Fqr
 PSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BOUtrUQbu4v4DcBOyp3QHTI9z/QDDXd95PtlE1x7RnU=;
 b=GefV3QDZebvt7O9ZeD8xtZHwE+h/Otg0OlpTYu6Mxk2kVRkvrrzmR1KXmCIsJSqDEv
 K/S8+m6pq+XHlvs7TMxPQ5pMiRI/LoQLKld4Jyd9co+zBBPRdPXJfagj6+7WrFNwU6C4
 LNIui7+wVwTQ7N/BWrpaL6y0MV3DSIMGKGKuWa5SA56vmveLaLYwTeyfdIUwZaUFlPuu
 IHKEJ1xAlXe5MwzhQfu9nqtRRqggIqYaYj9F+ThaYcsX4JGALngdIGs7aa8TjQy7yUiU
 kuNmuYyWW4LSK5aTtsKD7buiYuHweapL3YxbKrNubNmnDVTnDBe0TDm4fGmjDXU1oAy3
 MOJw==
X-Gm-Message-State: AOAM531A2imlj/qWfEE6Y372hn3ikg/IAWkcGO07EFWUpmsNsy+Jz8dq
 g+X4m11yGT42peUlnId/zA7y+kaEUSIVjB1EY68ETw==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr11928329ejd.250.1611844699361; 
 Thu, 28 Jan 2021 06:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
In-Reply-To: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:38:08 +0000
Message-ID: <CAFEAcA-tj9+WETE-Jsq0Wt5xHZcX2ysx7BB-jNrVY1X4xravHA@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Fix SCR_EL3 migration issue
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GZOapipqSoeh

On Thu, 28 Jan 2021 at 14:31, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> The SCR_EL3 register reset value (0)  and the value produced when
> writing 0 via the scr_write function (set as writefn in the register
> struct) differ. This causes migration to fail.
>
> I believe the solution is to specify a raw_writefn for that register.
>
> Failing invocation:
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic
> QEMU 5.2.0 monitor - type 'help' for more information
> (qemu) migrate "exec:cat > img"
> (qemu) q
> $ qemu-system-arm -machine vexpress-a9 -cpu cortex-a9 -nographic -incoming "exec:cat img"
> qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'
> qemu-system-arm: load of migration failed: Operation not permitted

I'll review the patch later, but for the moment just a note that
I'm pretty sure this is not the only issue you'll run into with
trying to migrate an AArch32 TrustZone-enabled CPU.
https://bugs.launchpad.net/qemu/+bug/1839807 has the details
but in summary we aren't migrating the Secure banked contents
of cp15 registers which are banked Secure/Non-Secure. The
symptom will be that migration succeeds but the guest doesn't
behave correctly on the destination/after state restore.

thanks
-- PMM
