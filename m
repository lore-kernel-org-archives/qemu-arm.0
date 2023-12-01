Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp891750ejb;
        Fri, 1 Dec 2023 02:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEZbA96JOOyz5l79kp7izD7WGryE730nrAL2KgoxG9u45PHLXVozyiJo+03U96o/n0fUti
X-Received: by 2002:a05:622a:40b:b0:423:7588:807e with SMTP id n11-20020a05622a040b00b004237588807emr30485476qtx.35.1701428351125;
        Fri, 01 Dec 2023 02:59:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701428351; cv=none;
        d=google.com; s=arc-20160816;
        b=BqGRpRgO68/EkLbbe1DpmRW+h0mF+n6pQBawu/qpXfS9rFO5CQTxvmGEaW2j34m9yQ
         d8kjZ92f6FjEL5WbJ+wDIUhbtJvS7UV612hs5VvCLaJUR/oaimPnnjGV+PtwLkujuPgZ
         wEjTc4p1ic50teo5QjFnayeR7u85dIiRNV6aAYRmq+vAHyPEHSYqC48J2FVv5aTgQ7Nf
         VGbvG6+evlUKZvxARntZegGfMldM9J1DKhcjv47zyMPP+zXYR+IHvOwAf3Q+hdDqVUqj
         YPyq495s/WcwtZgunoRuYv/jeORCpoABzUKybdIAXGCKkCMHjMn2rs2uev665KjycM76
         7gsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kBgEHer+ht0dHaP6LJn8O1147TeXZtstiObP4o2ORIE=;
        fh=CRercKJbM0EKhTPngniMzt0szygmuSJ33W87FfqFq5k=;
        b=Y0zLuUb38CeyRiD578IYfwdA8UKMGoVX4YCXW7gOTWdBDB0h44BPDDNm+uV2b5G4Wf
         qo1uZqaXsDZ2MwzazHCTydIoE4woqHcaUrI+IYowLkf/OV7nKPICnTVM5njhxyQ6NVcS
         hRSE7erYv7Hgwnp7393+wKeScYPFeigjYMVinynxsirh6eflf3G/phHETS8YdLN6JbYc
         K08P6bp2qZ6Y1oy5hzMpXX9on6UJ68pyRK06nhTBC+cwGz/VdRVgL2ullRQ2bgiZGzoc
         74L/y7GpfxqwiM2wFfVj0NxkmdacoufmRS/v2v9X+UjWOd6vDp4dt8rKYGB6DE5dPYNH
         k2SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyYBidxI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020ac87607000000b0041e57fefd24si2921806qtq.544.2023.12.01.02.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2023 02:59:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyYBidxI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r91Ef-0002jD-Rh; Fri, 01 Dec 2023 05:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91Ea-0002YQ-Es
 for qemu-devel@nongnu.org; Fri, 01 Dec 2023 05:59:02 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91EU-0004U5-S6
 for qemu-devel@nongnu.org; Fri, 01 Dec 2023 05:58:57 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bc8e37b5fso2820107e87.0
 for <qemu-devel@nongnu.org>; Fri, 01 Dec 2023 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701428333; x=1702033133; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kBgEHer+ht0dHaP6LJn8O1147TeXZtstiObP4o2ORIE=;
 b=yyYBidxIwnP/yECByAwEj1U8ScmGdnOSohVSKzyBsjPuUDynXQJDmnP/6yp1nSq8q5
 w3bbQoHhgDD2nAuOdBGyyVjuX/GXBoFPj2ZcqeGrNi3S1IhlsjzuDiYOk6vDjF66v1Wp
 asaUT7FrQPV0/ioRrMwK52JQQMtJu0K5S3BM/xoqb+Mz+fNJDbFKTzJ5JNhS3dYp+pRy
 RPrIXVV9wsJTkL4aG3jaLgvBYVDEIbyHUDVfyCqsOvhI/XgJfZVOvTQrFUiSfCW9wKRO
 SvyZDEXQwEGwOqxq12gjnkCYv5/7JwdEy5XgfKJiYEU3rhXueR+sttFKiqPiEjV8BBgK
 VOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701428333; x=1702033133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kBgEHer+ht0dHaP6LJn8O1147TeXZtstiObP4o2ORIE=;
 b=duG0UxjcbkVUf31t4fxdpozC1AB8KwPvjJDLWDgTQkb8Yxi6Ggfej0qm1tLDFodknj
 0s1vj3ob12sp6hN88p6b/Gimr8+G38srVfQTY+4DOWJ0t0yhWnUcsO74Cg9Y+8Ashd8p
 tgs3pOr4llyZeKqsOlAEujtCfkD/o3CAJ/fOnlnfhNhlxUMoKAOm8AQfBeJh6LNQZCxM
 b0msWAMDB/OCqja6p2Ax3W8lkF/DkbAwC1Hphz9FLl97gFShB4hYNdlelHVTq8qtupBa
 nkIQZFH632D4cxgJMqMvO3etiOjvD+QtWLxmhKVVMnS2U2n3pbAL9aK0x/c82KtGkDlJ
 4eOg==
X-Gm-Message-State: AOJu0YyVApiZd5zNZ+7wgt91RMiZzGLYQDQUlqo8yPcAMKtFscwvWAMZ
 QR1p+Hyn0FDhnXgyRH75p0h0Ww==
X-Received: by 2002:a05:6512:3ca2:b0:50b:cf6d:fe33 with SMTP id
 h34-20020a0565123ca200b0050bcf6dfe33mr912018lfv.58.1701428333107; 
 Fri, 01 Dec 2023 02:58:53 -0800 (PST)
Received: from [192.168.69.100] ([176.176.160.225])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b0040b5377cf03sm8725717wmq.1.2023.12.01.02.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 02:58:52 -0800 (PST)
Message-ID: <33f3cdfa-fe4a-4512-bf87-5b26e2fc2c81@linaro.org>
Date: Fri, 1 Dec 2023 11:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] machine: Print CPU model name instead of CPU type
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-5-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129042012.277831-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iWRhzsFAu42f

On 29/11/23 05:20, Gavin Shan wrote:
> The names of supported CPU models instead of CPU types should be
> printed when the user specified CPU type isn't supported, to be
> consistent with the output from '-cpu ?'.
> 
> Correct the error messages to print CPU model names instead of CPU
> type names.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v8: Use g_autofree                                        (Phil)
>      Relace 'type' with 'model' in error messages          (Gavin)
> ---
>   hw/core/machine.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

