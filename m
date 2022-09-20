Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2030164ejy;
        Tue, 20 Sep 2022 13:56:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7v0OJB1hEggIhf7ntorjksa8yYTqVnOfgs+ZiB9gVbVAphq3qXRjKLNGf/E6a6MdQurbwR
X-Received: by 2002:a05:620a:1aa3:b0:6ce:3c85:d9d7 with SMTP id bl35-20020a05620a1aa300b006ce3c85d9d7mr17577706qkb.225.1663707366492;
        Tue, 20 Sep 2022 13:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663707366; cv=none;
        d=google.com; s=arc-20160816;
        b=e7GFT2ppe1j+3IsG/TXPUgp0bfjBt0zu2hCWKiqwugv4SgH/Jrr7aK0Eyiq38OKXTK
         5UszKqoSVlKFwcB6fbvfsGjp72zhnbi9Isxnq9uRdeYf8t5pIZNhV8zMRE6sopBQUCRv
         /fLtNXK3jxuEKdObWeteLCu17GcNP4P88wr7qgz4IRyPVANAQuXlmiTdUOZx5MpL4tFK
         sf6bobwXtijq2oVGx8vzvqoUKS1v0XVolKiWv+6g41byrx3wSAgttgfTCjR6+XXIjT02
         fp9Yb72J/f9knsAe0//NxnF4O4GDUFiQl+AqDz+nddjbmdTeIBkqB2epJZd/5iFybc6L
         bfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kX45IZHd5T80sxgdzvsZUjfdHOp/mMTOq6VJQy4iOBo=;
        b=KOXvKsKGiUDZw7/O4FXDGfgV/2JC4Eo32CSq7f2Bm12beYx2nZUFJwNH+7Hw1ouWi6
         cyeGeLwSHomP1zEg8NwfC4kxMU+iZ94AOzjt6mrt35NvHYIYp+L8jRBOtIKcx1Py4Zj+
         KSBB6dvPUZLOGw3043Ste1y8NNQx7yxbZ4qYdskgHxrMTgf2KbvLVHapyMY49kuVvzmE
         EwI5BVVZXqRY5MUlSX6VSgovUkmOFLMaGZAJYb6yZtMWT0+nR9FELaGWXDfLrCfYiRzl
         WU/a2+w4JhXfVAI33GHRtTamlxEFr2hwlsxm+mN9czTfv/E8SSY6a+RApLLYhZOoDPGP
         s3gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4+f4mHG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey15-20020a0562140b6f00b00472ef5d589csi518683qvb.57.2022.09.20.13.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4+f4mHG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oakHl-00086k-Vn
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oagNH-0007Mp-B0
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oagND-00041p-Vl
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663692326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kX45IZHd5T80sxgdzvsZUjfdHOp/mMTOq6VJQy4iOBo=;
 b=P4+f4mHGWJmAlNYW0HShYOfEgocfEvRIHo8BgOKgw3CWBqcwH16ZKxNHAV8R6nQ53w2oLt
 ws3syKkqwdtFC4JQiYfCNBFL7u9gvRO8QLrLIlvjQt7H220hoGoUwPBrr5Xs3tjzia23H7
 kzgxmYhRHDTu2KBGtaRHVSX0kU5mM3Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-LvLgLckSNwuEFzD60idZMw-1; Tue, 20 Sep 2022 12:45:25 -0400
X-MC-Unique: LvLgLckSNwuEFzD60idZMw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g15-20020adfbc8f000000b0022a4510a491so1390821wrh.12
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 09:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kX45IZHd5T80sxgdzvsZUjfdHOp/mMTOq6VJQy4iOBo=;
 b=ti+iYMC2/OVNC/WKEBo33dJkIp2WJ7Wo78QX54S/gnUVnbpPEYZRPQwWG83ygFzZsO
 STHHQa54hO7aej/R4cslhxhaBVVSV/8cwRoFp34dx+uhossOmvUsOsNN/z2C80qEtvjZ
 uH8KtgKMM+tCmwxJB9XKNNYsDUkH3zGhD8aBZ6IaKOamcjU9NJGMTdDECIWvdeHcNVbq
 Ep2tduaYlU6z7+FrWhUEGNwaNzNd/nmiptjc2DIJQJhNgWxS9ckgPpbXf+/qPXe1xxm9
 DUd3t5pbNRK8qeiDmIDYX4ALcYkjFt3aAWzXsXYDOy2CUz1cAMGc6Qr3EsLvzaXcqrpg
 ziuA==
X-Gm-Message-State: ACrzQf1rTt9SIP0nlpMn9GgrXoTL1GPLndGwIGNbv+5JvSU0EHavrC8R
 rnQKgmtkVtBGNLyG4uctHvJHgxkwKwQsB/KH8g2W84rCTiwZP4eDqnTFuEE4AJIoMERmlS2/f57
 H1InNGyODkLTl
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr3108446wmr.27.1663692322863; 
 Tue, 20 Sep 2022 09:45:22 -0700 (PDT)
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr3108435wmr.27.1663692322606; 
 Tue, 20 Sep 2022 09:45:22 -0700 (PDT)
Received: from [192.168.8.103] (tmo-083-219.customers.d1-online.com.
 [80.187.83.219]) by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b003a502c23f2asm312946wmb.16.2022.09.20.09.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 09:45:22 -0700 (PDT)
Message-ID: <a1289aed-8d2a-266a-c766-7c698a3aebfe@redhat.com>
Date: Tue, 20 Sep 2022 18:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 11/20] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <20220914115217.117532-13-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914115217.117532-13-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Iir8WYEdH0gN

On 14/09/2022 13.52, Richard Henderson wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> The PMU cycle and event counter infrastructure design requires that
> operations on the PMU register fields are wrapped in pmu_op_start()
> and pmu_op_finish() calls (or their more specific pmmcntr and
> pmevcntr equivalents).  This includes any changes to registers which
> affect whether the counter should be enabled or disabled, but we
> forgot to do this.
> 
> The effect of this bug is that in sequences like:
>   * disable the cycle counter (PMCCNTR) using the PMCNTEN register
>   * write a value such as 0xfffff000 to the PMCCNTR
>   * restart the counter by writing to PMCNTEN
> the value written to the cycle counter is corrupted, and it starts
> counting from the wrong place. (Essentially, we fail to record that
> the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
> to have started counting is the point when PMCNTEN is written to enable
> the counter.)
> 
> Add the necessary bracketing calls, so that updates to the various
> registers which affect whether the PMU is counting are handled
> correctly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220822132358.3524971-4-peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)

  Hi Peter, hi Richard,

this seems to break some Avocado based test(s) in our CI:

  make check-venv
  ./tests/venv/bin/avocado run tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt

... fails with commit 01765386a88868ae993bcb but still passes
with the preceeding commit. Could you please have a look?

  Thanks,
   Thomas

