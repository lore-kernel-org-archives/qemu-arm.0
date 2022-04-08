Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp160747lfq;
        Fri, 8 Apr 2022 16:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlre8hLH/4VecKEhrVwd7kcM/cWPwvqCvpzu3NGcEUSRtq02dD/OJ4iRBsw8lG+/UW6mu2
X-Received: by 2002:a05:622a:1822:b0:2e1:b2d4:d877 with SMTP id t34-20020a05622a182200b002e1b2d4d877mr18192786qtc.630.1649461226098;
        Fri, 08 Apr 2022 16:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649461226; cv=none;
        d=google.com; s=arc-20160816;
        b=puAbjbXpjdc/t2IV5Kx/lxskRgIoK0xsMuJz8y5NL0r2tynqOqFPjzv0HtIh/1Idue
         fx0XOsASrlvwLjOAuRY+TY2iEO7XkRxysVNo2YvJSnIw0vQlqT1hPezmDmwxYzous2IS
         lTlnkFhGyQykrNv4J6MuGw+Ju2w0ryZcxnG3Dawt5FsM06kquT8Z/U6W5c26J0nwZNMD
         Pa+Sb8Nwku5B5Aak8peEz6G4+Y8hmhwIj7aB6f3oPSsPM47X1zcQEd7urPFLHRcT6cfj
         P25n4jEAfrH5A8dKZvtCxi9HfFG8ne0hTZbAHIaP9M52sdv5Ah037Ly2QuFzZ85Q3kxr
         moyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+qksoESPnTj4K0vnUbhto+MvlUyxPcGeT5AtaKBGPO0=;
        b=TBFh4MMPsfVh5lvqzBb38JJ3VGkiXm6dVmUm5el20lDWexfTlF3ANGmpwS0YsuFTBv
         SlZbSC6A50/at2BCqItdj4+GV0+yvU5FPpEna7x8TvA8d119Eo7jMLZXqGXUQmyyUALJ
         rtdBWvVb5y++tKOMx0Az9MhUlTQ9YMtTIPACyIddg1+5qutaN1fzBx9lRoILVijh9v+p
         M9FsRpzs2jYuaMerVoae2rrexW8Q68XbMNSSGg7FPOtVa/lgD9uvjEEuoBuMA6YEx51C
         ouTRgOPAHOJ4oj4CYM+yFa2OELPaMQPFgPhNhKDYTogWCBqPUuGnd2HIN7j0+I/VTOMK
         uhZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBcSuB1f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a05621421c100b0044176518298si1397101qvh.56.2022.04.08.16.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 16:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBcSuB1f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyD5-0002fz-3w
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 19:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyCb-0002fG-LG
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:39:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyCZ-0007s1-Uu
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:39:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id u14so10043428pjj.0
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+qksoESPnTj4K0vnUbhto+MvlUyxPcGeT5AtaKBGPO0=;
 b=MBcSuB1f0AmW7CU925w3Yd1KDw8/FWK08fnw3txgIZNzEhRE3+cOc35BrnXHiYEC4g
 rF066D9jdTQ2xAWhpr141PxKavcpJBTCd1qYYoyvQO5IT4uGOJYeX69c/mY3nqfOF4B3
 VPkEWr/5i1BydP5DdumgZxp1ZPWq3AAFd600qQ6T56+1N/QdCdt1/ihEqcG7fsAn/ZKC
 0GlxuUhhC16vKjlmNNVuV4zbYYiFsigO+oNCkwT3FiJ+SMdlCBfVw3dcwwHynP4W8siv
 sDCWxPBNjDU6i+ItEBDVsrBOlLzIveg4oGFznwrl88y4LCY3wUXs7RDrYY6l+pstcn2S
 hjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+qksoESPnTj4K0vnUbhto+MvlUyxPcGeT5AtaKBGPO0=;
 b=eZEtl5dmOY05Kkf/fteQd7iDe/GrzTDPThNTOaRV7AVGhPJYwvGmJ/qxVtOumBLCPU
 CTi9WbPENLJ1MXU4leBj8Ahv/78oQdn0L8SPyRXvzR1OYbfbZou5F1E4/52CwmqWr1AB
 ghX9e00n967pYaL0NbYamZ3IXCrm/l1aj/ELVaAHGxutUEzS8iqBxE4P5bAFMvX3g2JF
 eHbXgYqTjdpG0iDpnAlQQkObqKfoJi/SuSjz+Yltvy8dGRvaq8MExy6AEByMqQLWElgZ
 BtD0MJP5bLjTyfAuoXH03qMDchGqEUCZpBktoElNZrsD6RNeGLIyxgEymewWHuHabTBt
 /QSQ==
X-Gm-Message-State: AOAM530LexZv4p2xJ25XmS3xPtne55l9CgkdKjFHqDo2ENy3RQmeYDU7
 oUJ50MaxdwIJIG6430gPAqo4zg==
X-Received: by 2002:a17:902:7c90:b0:156:255:c571 with SMTP id
 y16-20020a1709027c9000b001560255c571mr21512509pll.15.1649461178010; 
 Fri, 08 Apr 2022 16:39:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm12967803pju.44.2022.04.08.16.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:39:37 -0700 (PDT)
Message-ID: <44ba8f25-1e3e-b41e-c83a-1f2c20655232@linaro.org>
Date: Fri, 8 Apr 2022 16:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/41] target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OdhU1EFz5o1P

On 4/8/22 07:15, Peter Maydell wrote:
> In a GICv3, it is impossible for the GIC to deliver a VIRQ or VFIQ to
> the CPU unless the CPU has EL2, because VIRQ and VFIQ are only
> configurable via EL2-only system registers.  Moreover, in our
> implementation we were only calculating and updating the state of the
> VIRQ and VFIQ lines in gicv3_cpuif_virt_irq_fiq_update() when those
> EL2 system registers changed.  We were therefore able to assert in
> arm_cpu_set_irq() that we didn't see a VIRQ or VFIQ line update if
> EL2 wasn't present.
> 
> This assumption no longer holds with GICv4:
>   * even if the CPU does not have EL2 the guest is able to cause the
>     GIC to deliver a virtual LPI by programming the ITS (which is a
>     silly thing for it to do, but possible)
>   * because we now need to recalculate the state of the VIRQ and VFIQ
>     lines in more cases than just "some EL2 GIC sysreg was written",
>     we will see calls to arm_cpu_set_irq() for "VIRQ is 0, VFIQ is 0"
>     even if the guest is not using the virtual LPI parts of the ITS
> 
> Remove the assertions, and instead simply ignore the state of the
> VIRQ and VFIQ lines if the CPU does not have EL2.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
