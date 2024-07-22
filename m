Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1714378njc;
        Sun, 21 Jul 2024 22:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAkFs0/IiPEeq27EiKYyvU1h+TEm+fB7xr8gDEpY+cV/Ej3FeSWLxSTvhOQoZb389lCLqj55qPbnaJwDx4rLktursCNYfE
X-Google-Smtp-Source: AGHT+IHEPvnous+pjx1iGEZOogGmZp0DlNyj8iYB6OhKu7JwWgQvn71dm0ZjFU+SiqFAgW3SpBIr
X-Received: by 2002:a05:620a:4308:b0:79f:e9a:5ae5 with SMTP id af79cd13be357-7a1a13c5208mr761273785a.60.1721625724589;
        Sun, 21 Jul 2024 22:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721625724; cv=none;
        d=google.com; s=arc-20160816;
        b=AkQEupbMbdk6akRQiyz6DKXJn0VzIs1kn8B247Y4U040f5CNNWXknCY6wCz32IhBvY
         VnrMOKPTCCUw/qY4OU6QxKw/5+EAGCV9q/3szmJhSRcLw5MNVItvotbuBOFIsHuAZvO0
         CG0gVFvh/wxHCuGXvVRgP+gOzY6btqCmxZ7taNybz3inFcIaXhIXxsEzgMylyAAl7ti8
         kVmXihlH9t53d9+IFirTrT/vSpb4jRun/krmuZpf68JumsyL+w6bgQRgkdL+ZIXfjq8E
         1Yu/HDEZ1GBmHPXTcoU08ef60X+j281nVnGcY9T33OG/fbF+9SrAt+cPzB6jRLB7S2vU
         QvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tZnSY7mkBUXb0/F/YQCmgBzJ7YOFbEEDAM0HuwTaadY=;
        fh=yGEVoZ6TdDuqeI15/GxsrOG8l9k95ur8cKFVda+Jsbw=;
        b=JeLuXGlUlVO4R+2rsN/ryPo0dbQ/HWEwsvzlIPs5R2ZpBBJ+iVo6w+bpTS3ARGVvoP
         55fupUTvbA9vSkgzmcMveypUJ79eLFkOfvk2s3hTTRfW5Z5owVe0nQt9XJcKOw2IxBtB
         qRL9ENGSu3N+4mZyYN3x40qKsSGO7lOWa8F8lvXu4zX16bPNQvAdr+WfxEYnUCL04chs
         3H4KpOrpsafAEd7il7LMll4dve/AeqSMB+EtuCQB5d2BKHByO2BMdJe+VellrCE1c0Vm
         vRg8+NMslzvMXQuhgfNYzdc8QVhEVid3njpll3OLoztNdPHaAJrGXuXCTQ5BCRY4Qblq
         WpsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1gC93f4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990b439csi724606985a.752.2024.07.21.22.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 22:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1gC93f4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVlUj-0004aY-UP; Mon, 22 Jul 2024 01:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sVlUh-0004Yv-V1
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 01:21:55 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sVlUg-0005hc-C1
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 01:21:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-7a1215dd114so808052a12.1
 for <qemu-arm@nongnu.org>; Sun, 21 Jul 2024 22:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721625711; x=1722230511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tZnSY7mkBUXb0/F/YQCmgBzJ7YOFbEEDAM0HuwTaadY=;
 b=c1gC93f4jw6j8Zc3EMciYMmhptODNTxluRwr9MXTBZJuh/YVAujg+2RzmJTRB0nKwz
 IAdozJvcneC0GsLOqvP2ea+zNeGbKP1NtBskJ2WUI36G5LQ2gxlhfAblXfpcKrkfxWls
 WxJrTPVWK7Dp9c1hKiDJC6r1vVB0vI8zdwnJQP5me4AgMzDSwaLildVje3sV+ROYDK5q
 IWvdB8M7lPU4v51TbmbkuLBYwKABgrvhjD027J1zI0Hz1Gx2u/fcdFusauAK/5xTsqZf
 T+6iylT21VZcstXov8GiCQi7m5g9C+t9Umhr6QfsTT3t2epwwJ9JIki3FZFLYMc8z2x/
 iZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721625711; x=1722230511;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZnSY7mkBUXb0/F/YQCmgBzJ7YOFbEEDAM0HuwTaadY=;
 b=pGELh/CYuHD8UQjItcAkfRQqzP0nb7l7QGa2yXV6enk/iennGJW+wp2ohSAMqF2jLl
 h8kXBW9k7K0/qrfUygjN1obJOC4WOx/OUG+9PrU/N5MQcrw/AE7S1kx+06x2vZBrzqvm
 VD3glNzyrUnvGAO1yBnsnEZxNll3VUvXeov3hIaQFVDo7/4t4DHpx8QfAqm5mb71KQeM
 VnOJon2YCqPxROM0sZsch9sZmAzVoM5jOTkbBa5rftvl/zgaZiVFVV9cocVmVoe7CMa+
 Z1YeCX2y3v4XoX4IsFWLeEx++/20+GWMMBxN9xE0Nqg1+YEyapUzXkBlEppOHWW/Pyqy
 e5DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhrj88y2/Dnpa/A2l0V4up+5ZSYISHBl3Kh93kJIqEnxiywrG/+0cegaYXlrBTq1B4g8d9ECCQkc5a48y/14PGnnFC
X-Gm-Message-State: AOJu0YyVjbbGyxyftborSX/+B4RL/UGpY1UXVdKLQrgKFxpIW1LGbBgm
 /nsWT8T6TGDptyJMhbt0S/jHMEvrDwPzbUSRrprzOWIEbRKYF+3lCWeFuY69ZvreVlgIBVkzNXl
 g4JwamA==
X-Received: by 2002:a05:6a20:72aa:b0:1be:d1bf:a371 with SMTP id
 adf61e73a8af0-1c42295f2cdmr9990685637.33.1721625711461; 
 Sun, 21 Jul 2024 22:21:51 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f44d179sm45481055ad.212.2024.07.21.22.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jul 2024 22:21:51 -0700 (PDT)
Message-ID: <22995a46-9288-43d3-aafc-c56705c662ed@linaro.org>
Date: Mon, 22 Jul 2024 15:21:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/15] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240721081401.425588-1-clg@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uCGJM0sW1BvO

On 7/21/24 18:13, Cédric Le Goater wrote:
> The following changes since commit a87a7c449e532130d4fa8faa391ff7e1f04ed660:
> 
>    Merge tag 'pull-loongarch-20240719' ofhttps://gitlab.com/gaosong/qemu into staging (2024-07-19 16:28:28 +1000)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20240721
> 
> for you to fetch changes up to 4db1c16441923fc152142ae4bcc1cba23064cb8b:
> 
>    aspeed: fix coding style (2024-07-21 07:46:38 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * SMC model fix (Coverity)
> * AST2600 boot for eMMC support and test
> * AST2700 ADC model
> * I2C model changes preparing AST2700 I2C support

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.

r~
