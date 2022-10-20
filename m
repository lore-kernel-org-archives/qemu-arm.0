Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp281835ejn;
        Thu, 20 Oct 2022 05:20:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BgfLCHwYHsNfF+BetMu+vS82KuVJaUXfI3iPoDFoT+IY73kkRUmQbDlNGIq2qvEDIYpPa
X-Received: by 2002:ad4:5ccb:0:b0:4b1:9179:fb8e with SMTP id iu11-20020ad45ccb000000b004b19179fb8emr10870373qvb.67.1666268407165;
        Thu, 20 Oct 2022 05:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666268407; cv=none;
        d=google.com; s=arc-20160816;
        b=YwgyjoUITnyF6QHxQPBQWnTI2tGix+nZPWuJ4spZvcYzYrNjtaKLDVKVGJPlIuqr4q
         RUvNKdOGuNfAkrNLfPYbpty1sZC3QeZw/HIy6cJ2/azh77YOWniCABZ3aq1Yxm/KkyJS
         JInEZlOjBIVEndcpESzGF5MfcRAGdM54tW4FpFCrv94+FZmjuBZk0Bx2RQKK4K+KIM2p
         bZbUGlrouhXUSbqZD9UGJXvokLYRH7RmFvlvEov3JwV7dLo9qfqdmF3L+DJgB4Pv/cr8
         VRu+U/zHHCGmeFEsib0Gm/eCG/pKzrg+fDVLaksNXktJj8bBRMJxC3i9I2LbG+QzTWSA
         nNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rLFv0qWWnpCPwRMmjADII83X6xAoGAS4Mcd5/omzzW8=;
        b=fPIGlenQx/ISs/PwVu56UPFRTjSaPAxK8jCAyqPz8Sy5Dr54SxU/B5f9pMp71QU1Vu
         gF/pZqA4N+ZYS/bCnjKpbaETBkNyzOs+eT4lGcNin7g/HkcuiLRKwBQZkOoFVJvlIVnk
         WrURrLywzp3QhAKvrE5ZBUZtMHrnIC/Mkm5eUDD5ttpx72GVxM1I9FwVU8Svu01xbN1z
         k24j4xi0J85yZ0laf8uPqDF7+zhqYW+cfe9nG1+srY3hN7eSPYRz26134plCJA4UMUA9
         KxuN0K8F0T8skMZII/wrI+6pgReptWu9P6Muv+XEx7qIraFK5ZFF57d66b1Tlo3nHj4t
         mAjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aMAVn/4j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv3-20020ad44ee3000000b004b3e48b39e2si10973738qvb.22.2022.10.20.05.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 05:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aMAVn/4j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olUWq-0008Au-PG
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 08:20:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olThf-0004j7-4U
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 07:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTS3-0000tU-8l
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 07:11:14 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTS1-0006Au-Ix
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 07:11:02 -0400
Received: by mail-oi1-x229.google.com with SMTP id l5so22438214oif.7
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rLFv0qWWnpCPwRMmjADII83X6xAoGAS4Mcd5/omzzW8=;
 b=aMAVn/4jqxrHn1SNkELNmfYq3wZMC7XOo9dYevyoFt7E45TUsxd5yR0tiUfBXwfah9
 U8KJgw9lZKcJ5TbEgRGHrZOuhHTLk8OqzuHDGWfLKPtRAfZv+Va499GlFr/I7uuO7GP7
 5vb/NygZejpclfepHz01oaZIRw/2xLMXsfpwAWyRaSpm/1B2kz9JEuZpslshfY6AZTKp
 Z6TWB6zvpxqyRSC6kdugczL16By1wyDFia2MfW/bgbmxahRJzVednNIC56MF8ICxHAIi
 zFcfDwh0BKyIOuY81FZDn6HOiuo6W4KXVm4k96XCIK72tBBVXfaFDKU3aFl56W+Xsmv0
 +THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLFv0qWWnpCPwRMmjADII83X6xAoGAS4Mcd5/omzzW8=;
 b=Xd0XarO1ufL3D3tdR2zTUZE/NKsQC3X9yHyp1IzbdyjChOuS5L8DQOJwfFvdcRAueL
 57OWbSHu3iuCGYRYvTRegtjePqQjQ/mSAWE2v5WRhtHYvnA6HngF9t0Eb5ZviF2sVg+k
 83gVBcRJcfe/vgRqhyXv5/7fTkfji3DqdlAo0je/nVCG3gxTjgVK5c5prEucYjEpigpe
 tJAeYtjXgAKrdUUwguHx9cCJR8bXTPOyPpXv8pW9vckd1JzT9PDzytAxuBFcSq2I5OcF
 ZPWQYoam2hNKR6TfLPGiWv5c7J3RB2neNipb8/lDyv8nb16cPsvdQsRNn8S3KuaLesJ+
 Q44w==
X-Gm-Message-State: ACrzQf1CJJ083RaGfRmQV/hQep6x1e/RADQ6xksrmFXpvID4WBvZpMBy
 GGFy/V05In1hytkCUxDnE7QGqBtDOBDfgAwk
X-Received: by 2002:a17:90b:4ac5:b0:20d:ae54:f08b with SMTP id
 mh5-20020a17090b4ac500b0020dae54f08bmr40856726pjb.174.1666264249287; 
 Thu, 20 Oct 2022 04:10:49 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b00561cf757749sm13281429pfg.183.2022.10.20.04.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:10:48 -0700 (PDT)
Message-ID: <279bb0fe-c68c-364b-17df-f6cfebf5d059@linaro.org>
Date: Thu, 20 Oct 2022 21:10:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: h96MLCvQnwSM

On 10/20/22 20:20, Peter Maydell wrote:
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith
> 
>      exec_command(self, 'halt')
>      # Wait for VM to shut down gracefully
>      self.vm.wait()
> 
> In theory this should be fine. In practice it runs into two bugs:
> 
>   * when the test calls self.vm.wait() Avocado closes the socket
>     connection to the guest serial console immediately, so the
>     avocado logs don't have the last part of the guest output:
>     https://gitlab.com/qemu-project/qemu/-/issues/1265
>   * when the socket is closed, a bug in the QEMU socket chardev
>     means that it loses any data that the guest UART has not
>     yet consumed. This means that the guest doesn't always read
>     the full 'halt' command string, so the test intermittently
>     fails with a timeout:
>     https://gitlab.com/qemu-project/qemu/-/issues/1264
> 
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
