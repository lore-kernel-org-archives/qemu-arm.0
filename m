Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3229104lfc;
        Mon, 26 Jul 2021 16:08:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJpNhIZLQDyjqHS8xaOq2N0Z5V75095p9DPMxR15cZ95gAIk5G2Pr565H17jKPzBzb4cFd
X-Received: by 2002:ab0:7299:: with SMTP id w25mr15400939uao.45.1627340900213;
        Mon, 26 Jul 2021 16:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627340900; cv=none;
        d=google.com; s=arc-20160816;
        b=cA0hgPbCxjfqAH80zIYspppX58hKi87dyz/cg75Mb1asxjGvOqFRxi4MmQotoH/jFX
         Jbd/T/O/GnfJ5dXZW8Gptv3oUiPZ7fsEErl4WeXkVJI+KFutQ7QrC/KunSbQM3E1sJRj
         R+QMTrHTF5RP3zpzgwwMrpuHMSsld2rjqPKsjNYEu7CDGiRyz2c6OaIYn048ET6R6zqj
         fAOzkVbHQGYp2p4pvnx9vtDlpBYsfV7J70Lxlgba5BvfZPoh7vfP146fissiPTLLhf9w
         0fk3307L4/HcHfIkh9qENUZgGJ2AdWh+8IJuaiPUB10WFTFaae2jWGGaZn/H0ExBG/Qf
         gIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nKLt9oVPkhnkAy+li3bSTD2+q+ewmab3w+995OCpQ28=;
        b=ZBqhHWX25O1NX3WnBPRAyjybuPXPCVZIkpDypKQOLFGtAjerEDVi/h2hADNPPHt1CF
         cAUXNDdBtyTMuFrWdpjH/daLRCLuYEm6uyOquc5jPI5c+pyY7Icvt2fjfLTG0RRJVKHW
         +Ov3q8Pl/AbgJCCWnQ6GM4tgjTHNz3JtiuyfzOiECdVFzeVjCLWXjr27KGZLrj3AqP2d
         Q6IlpdIlZnsXKbRZppA+mwDRFnXh2/0gUUNZXc1uh7Lo2wh0ZlZOYoNsopXZGJEKVE3L
         IZEho23RjpD9avMz3MCIBqRfe94AKAj1/2TzyU7OJqBlaMCoh5Jf42W7xXiQbtTVqLW/
         lXnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DWcNnENr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si779391uap.1.2021.07.26.16.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 16:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DWcNnENr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m89hr-0006C8-4c
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 19:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m89hg-0006AG-Ol
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 19:08:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m89he-0008Re-CH
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 19:08:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t21so13400636plr.13
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 16:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nKLt9oVPkhnkAy+li3bSTD2+q+ewmab3w+995OCpQ28=;
 b=DWcNnENrbFtYOyckuxkcn0/CZ4nmfbJSSo4GeSVmS9qU5cjU9vBejpDejo45FoAlYm
 jeJWcm4Qry78Oj0mpDyHu6bHThB1nEuKjfALGcvstzbohclnS+cq8xme59EkQSAmtD8k
 mXXplY6VImuWql7FzR/XPjoW0IJhvM7LOXI3gpzSreEkeI3GCim4yA15bC+SA4d2tgug
 G//MLsPNP+QWA46yFkHdXv/aS/Ye6zT0IRmRNqA5ZEKkxFpOkpj1+EjiXYCzCEzwrncA
 DgtfHR1kzrAZTVNOzjDqtDna7uvrqHxqWcJ7d/r0RSvFoKYGNifJs1LZULHVmQz9mydQ
 1m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nKLt9oVPkhnkAy+li3bSTD2+q+ewmab3w+995OCpQ28=;
 b=eLTbzWLgYg7Yzb6bSueMKXb/VSPHDM+DZXe6+NX+fRRlMNtR9o/Y8rjD1AiXqiP/sK
 DEEK5rX7DKj/4WNcDNLk9Banb3lWQG+SVM0MvARq4FY9IWELZ3EoEv1lErkzwoeSTPR7
 FWIA0CBfTJKwnePsScHM0gZSkmiuNYXRhp9CJce5ZhC4p8cqtVwIJrwM3JIaYwDNjXzq
 8iMmSSDPKRuGj2WY/l/vnNHp4DY8RfNQauEQ2FjDXUibALRb1YkJVSG+cSIjxgiVI0Cq
 4fQ24QSVMvq2gziCzvVu3Z3b5Xzislk0zlsKZsrQ45UFdxsA8oq1YLk49Tt4r3B9G8qf
 B+Qg==
X-Gm-Message-State: AOAM532kWpZEdAWLlOu76vzYw6t6UgK8v9nWzsEAJ1Yoo/hP5FTO20ON
 hqoBN2uvVvf81c+qnWsUuKCEaA==
X-Received: by 2002:a17:902:74c9:b029:12b:60fa:bde0 with SMTP id
 f9-20020a17090274c9b029012b60fabde0mr16353031plt.8.1627340884794; 
 Mon, 26 Jul 2021 16:08:04 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id l6sm1112851pff.74.2021.07.26.16.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 16:08:04 -0700 (PDT)
Subject: Re: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210726163351.32086-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d166f7d-5bd9-54ce-21f6-91f39117ba98@linaro.org>
Date: Mon, 26 Jul 2021 13:08:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726163351.32086-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 11qv83B8hEgo

On 7/26/21 6:33 AM, Peter Maydell wrote:
> If the user provides both a BIOS/firmware image and also a guest
> kernel filename, arm_setup_firmware_boot() will pass the
> kernel image to the firmware via the fw_cfg device. However we
> weren't checking whether there really was a fw_cfg device present,
> and if there wasn't we would crash.
> 
> This crash can be provoked with a command line such as
>   qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none
> 
> It is currently only possible on the raspi3 machine, because unless
> the machine sets info->firmware_loaded we won't call
> arm_setup_firmware_boot(), and the only machines which set that are:
>   * virt (has a fw-cfg device)
>   * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
>   * raspi3 (crashes)
> 
> But this is an unfortunate beartrap to leave for future machine
> model implementors, so we should handle this situation in boot.c.
> 
> Check in arm_setup_firmware_boot() whether the fw-cfg device exists
> before trying to load files into it, and if it doesn't exist then
> exit with a hopefully helpful error message.
> 
> Because we now handle this check in a machine-agnostic way, we
> can remove the check from sbsa-ref.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/503
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
