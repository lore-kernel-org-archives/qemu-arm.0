Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1299955ejx;
        Tue, 27 Jun 2023 00:54:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4R9L4l9ePjcG5YVWjCAkXXTadb9U7H7qZbjmdcyA43J0yQ1WJ/WVGnzTV95jhMVaD0bmLX
X-Received: by 2002:a05:6a20:8e19:b0:11f:7aa:1b27 with SMTP id y25-20020a056a208e1900b0011f07aa1b27mr23378170pzj.51.1687852447723;
        Tue, 27 Jun 2023 00:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687852447; cv=none;
        d=google.com; s=arc-20160816;
        b=nnDWO0XaJ+RB7R3ak4WloS8AHybOauqyhCiKwdyLfmPgs91/c96mUxraRTK3B2YiMI
         Uf4e4a4XVPZecDR2cNhWC/qpyDBoAxgd8jPHcIPRVL72dgXU9sVBDKVvXeq7gk737JQH
         b046Eo9j3rvXndFUVq/O3T6fU/iL+/7XoQ/XyNrsvGNIZHjRRvIVB+7wnR4PH9lRcBPC
         1XqaFtWsATfVspBBg536VRzEVD9KC/FQ1gmMK3HE2NDAB8hoddq6bkzmb1eOx9QqqT44
         m+wg6NbtykNwmiesz5j0aPZ9RsGzA1bEt/GlynpZ11jrGIhj/Hw7S4j9CiFT4xfZPldX
         wOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature:ironport-hdrordr:ironport-data;
        bh=iYsUDDZF71fmZPwovKwRMlCt04dLbouDq2b1Jpkhego=;
        fh=W7D4e6Q+GOKVpceTGkqF7nwJzsjjwS2BzGlbEr21HEE=;
        b=cl7a9C6RIDftizV7m5C1uEZTUdROx/KPCGulDkkiHcY24i9l5DmhlIbQeeZK2p270b
         10EYlxH3Ux49eMV6tFavi2RArBBQbSY5oLkbOD0JKF1Q6tmOvYq9gq+edcG3Ac+i7Yz1
         sCSSsZg9/p8+zgYfTOSEWOVUNogIxD4SYPfjPlhu7mwQaZ4K3QAD6aHkou49WrHAZZFE
         E14EEFBpghmKIaEBfM3t9KnnFJFaEgtWdHYSYyOPrK2XgiWS03G+b1v8MWxFoJpiMm/d
         pYApfaHqqGlyBIxYfC+3wOZYANfEJc3pgZDoKn3epBA/XtMhW07eYHGusEN6xUhFeA+9
         H74g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=i3mM72Se;
       spf=pass (google.com: domain of alxndr@bu.edu designates 216.71.137.81 as permitted sender) smtp.mailfrom=alxndr@bu.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <alxndr@bu.edu>
Received: from esa11.hc2706-39.iphmx.com (esa11.hc2706-39.iphmx.com. [216.71.137.81])
        by mx.google.com with ESMTPS id q3-20020a170902bd8300b001b7e382dd08si6058633pls.522.2023.06.27.00.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jun 2023 00:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of alxndr@bu.edu designates 216.71.137.81 as permitted sender) client-ip=216.71.137.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=i3mM72Se;
       spf=pass (google.com: domain of alxndr@bu.edu designates 216.71.137.81 as permitted sender) smtp.mailfrom=alxndr@bu.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 288401263
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4SaNnaispZPlRBW32Viw0JkZX1613BIKZh0ujC45NGQN5FlHY01je
 htvXGHSMv3cZWehL41+Po/j9BwDv5CAyodlSFFppShgRCkW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4AZhPakjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbZGo75sCllPz
 OU/EBosTzOgnL23kL3uH4GAhux7RCXqFIYWu3Ul1C+ASPh5GdbMRKLF4dIe1zA17ixMNayGN
 oxJNHw1NUWGPEUn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYhgOS1aYCLIbRmQ+17t37fn
 VDIzV/IKTNCLPic+x3GqXaV07qncSTTHdh6+KeD3vdujU3VzGEVDhAbfV+6p/CjjQi5Qd03F
 qAP0i8nrKx37VLyC9eiB1u3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:5ZAWuq3slpvt3uTdFz/LnQqjBK0kLtp133Aq2lEZdPU1SKKlfq
 WV9sjzuiWatN98YgBDpTniAsi9qBHnmaKdiLN5VYtKOjOHhILCFvAA0WKN+VDd8n3FndJg6Q
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3APPNEH2mrjU3vxqFaXk8wYROv0iXXOUaDlS/LKHe?=
 =?us-ascii?q?5MH9OcJe0aHyz4/xlw8U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ayl3VWQ9hsjiuvqSX3xTm5jyQf+lB2+OVOk4/qqQ?=
 =?us-ascii?q?tmZGcES9CHHTGiA3iFw=3D=3D?=
Received: from mail-qv1-f70.google.com ([209.85.219.70])
  by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2023 03:54:06 -0400
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635984f84a9so30267726d6.0
        for <alex.bennee@linaro.org>; Tue, 27 Jun 2023 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bu.edu; s=s1gsbu; t=1687852445; x=1690444445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYsUDDZF71fmZPwovKwRMlCt04dLbouDq2b1Jpkhego=;
        b=i3mM72SeKK4UFFEaeh866luByAFI+JcVbbCOj+rpSmXNzePyvrxYCshc+P4deT5cEv
         hFHJCuRbHQLgYqZPg+KFfGAOjymEoNQc0Sv9DwkTv/NbKyuYwbR7X5m/PqLmhOM8RGBa
         INqjyKwWEibaBAjk1gx4eipkn8qGZ5IQoXrEoPbCNnDwKI4q+gjTHtXGng9RC3xkoVQR
         GpHxu8KZ+289phXN77E2p+GwbNOnhqsPFT1IsDI6R72nxpBOZJCoJftwnn01Hg/i285t
         hAt5WkRkOt9my1XBW9akyOw9yj+o/Q5eGiAqtlXUu4e1EZm6UYHYMXw7kwzQehZSlMBt
         oZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852445; x=1690444445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYsUDDZF71fmZPwovKwRMlCt04dLbouDq2b1Jpkhego=;
        b=B3xF0xq27dfRe0ge47apwvU7AI/i5bFZbldQpbe1euudPLU90G9cfjW1iuYxUC2/to
         Sjt54noMqIPnetOGXR4yDdmMJUhdRVecOjBNKSUxqfgzTZlSom0yhgeX1wgQqvYZNomb
         RYrD4p6Whk6XjnK0Tuq5Dwbazz5Yxssyi/jsPmYYYRxdmcbQkv0XFEzuclTa9hLYIffY
         RAVTJZfqnW3P2GMbdyEqkgtQfpU+Sse1uCZAdDYlmFVEFOk0j5OCOAv7cCukF0GIyOci
         uS87D8EF+nnq3PJt1lHnUK+NvldutJZzIqwgQSwq+sBWD1Ej/O0XI9nKtukc10p07jfT
         hDuw==
X-Gm-Message-State: AC+VfDyV9eQxL/Y5dx1CFd+r4wIcOMLjfI+tdyGFfts2GHsz+8Rh1e3R
	MHrrEtTYYushdD0aGd1jKgbj0gBucA2cY18mwG4jIjV2ika8Ycmk5XjzTlBd7RU8HX769AsJ67s
	DDZr3+tC8L4nLp5oKtLnTlaAUPrbyY+UIr8cjbiDaPH71
X-Received: by 2002:a05:6214:242c:b0:635:e113:a0ff with SMTP id gy12-20020a056214242c00b00635e113a0ffmr5725025qvb.30.1687852445632;
        Tue, 27 Jun 2023 00:54:05 -0700 (PDT)
X-Received: by 2002:a05:6214:242c:b0:635:e113:a0ff with SMTP id gy12-20020a056214242c00b00635e113a0ffmr5724998qvb.30.1687852445355;
        Tue, 27 Jun 2023 00:54:05 -0700 (PDT)
Return-Path: <alxndr@bu.edu>
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
        by smtp.gmail.com with ESMTPSA id 21-20020a05620a071500b007621b1bcbbfsm3644006qkc.102.2023.06.27.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:54:04 -0700 (PDT)
Date: Tue, 27 Jun 2023 03:54:00 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 08/26] tests/qtests: clean-up and fix leak in
 generic_fuzz
Message-ID: <20230627075400.fnasthl3r54sn6l2@mozz.bu.edu>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
 <20230626215926.2522656-9-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626215926.2522656-9-alex.bennee@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
X-TUID: N8Tf05ErnWie

On 230626 2259, Alex Bennée wrote:
> An update to the clang tooling detects more issues with the code
> including a memory leak from the g_string_new() allocation. Clean up
> the code with g_autoptr and use ARRAY_SIZE while we are at it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thank you

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index c525d22951..a4841181cc 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
>              .crossover = generic_fuzz_crossover
>      });
>  
> -    GString *name;
> +    g_autoptr(GString) name = g_string_new("");
>      const generic_fuzz_config *config;
>  
> -    for (int i = 0;
> -         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
> -         i++) {
> +    for (int i = 0; i < ARRAY_SIZE(predefined_configs); i++) {
>          config = predefined_configs + i;
> -        name = g_string_new("generic-fuzz");
> -        g_string_append_printf(name, "-%s", config->name);
> +        g_string_printf(name, "generic-fuzz-%s", config->name);
>          fuzz_add_target(&(FuzzTarget){
> -                .name = name->str,
> +                .name = g_strdup(name->str),
>                  .description = "Predefined generic-fuzz config.",
>                  .get_init_cmdline = generic_fuzz_predefined_config_cmdline,
>                  .pre_fuzz = generic_pre_fuzz,
> -- 
> 2.39.2
> 
