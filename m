Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp230401lfq;
        Fri, 11 Sep 2020 12:30:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHtTePGwI+TzcEd77bv/Dd0Q5eaNevJfIAYuU4NHd9j5GD/7+JTsuVt3DKq3TJmMueEGuO
X-Received: by 2002:a37:6481:: with SMTP id y123mr2967569qkb.464.1599852641277;
        Fri, 11 Sep 2020 12:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599852641; cv=none;
        d=google.com; s=arc-20160816;
        b=Pn89/znVGt2D8hPp0/V/ET7OEmehG+9YC2RhipNg77CjbMlK4nXpL16QhS7sax/H3I
         ADOSmMfT9Q+B8hERVJGWO7I5cjyVN+4lmx3/EUfb/TBVyoPiHR/GBC1pdXV2w5UjhEmt
         cqNsLzmhIAEezqyE0xZkOhwI7UVhJ+BuyBpkt3iUoPPqe3OTPpSGAzpkEP80UY+m69QW
         QgoAg4kAXlnC8EVt7LRm0wcNEMwZZMXtkbJl4jE5cscZ4/kRTZLQCKT6cOSVWUgOU6k3
         oxSG5rqLGl8D2znVF3Cpi12pL4fcbnqozgSWXX7JmuK+wzIVvqMgEQhsa1lNz1J7gaUK
         KJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a5ylYiCfLG/5mC9/VdcQobGenVWYlduGmkYkyGmqqsI=;
        b=C3Pc3fE+ftwUpd7cdao2YD0rEb5jw7rDjNFIcbzGE5/lB9QrmBX6VsOUAnfhbNfwmE
         r+T4hDrcBkyKk8buwco7zZbx23DDSvDrDrm+LllC8kuCxLOzF8LX/kV95YIhfpa1jTkL
         ppdZECrZxB6h06lqO0TvUXX9EoeekDqZW0siiSa2N3H/kYXOu1YHSueOZW1HbN36kQOA
         DycFA+3Mjf01nyb0B4tfA2eujsvCyYBeJtCGKsC8ZI86OI7+cB27GVfG7mWY/O/5ANYY
         aGrWtIi+vb/DU5nDs+nYC5r+CHi8+TagDVx2D3geyry+N+y2GYIcH1T/z66aW+RxASjs
         aFyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suuc3koz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si2011889qvp.25.2020.09.11.12.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suuc3koz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGokq-0007eS-LR
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGoke-0007dw-Iy
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:30:28 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGoka-00008g-9e
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:30:28 -0400
Received: by mail-pg1-x544.google.com with SMTP id 34so7315532pgo.13
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=a5ylYiCfLG/5mC9/VdcQobGenVWYlduGmkYkyGmqqsI=;
 b=suuc3kozKUt22M0uMeNQ/aN11b6Lbg0zOe0651OHhr8jG9Ua9HQrj1vgWRYDtnVOez
 z1tbMR8FXxMD13ECK15K2pL4N6jc6X1OYzPgj8zujsxnxLOfCYhisIW83sppsQcE/CNT
 F849C7qHrrfl+bh5z9nEnUyQ1El+9oVCAeN8yTG59rmWxW5WjJ6QFa2nWjmlii7dXLBU
 dmdNUwqBULjMyO66toXbc+VZDJKTi3XVCd+n8HGA8ouZDupZJt/xymVDhfNEFgWoG9rX
 atLXxSWWBjEmTmRocg9OrPmWGRAP3C/0eXpZOY2J+/0nGW+cj/y7faC+9/5JMGR/Pxop
 v9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5ylYiCfLG/5mC9/VdcQobGenVWYlduGmkYkyGmqqsI=;
 b=ffdOTVhrnmbcU15sH/2J5VF0mE/1DjGDC4faBD8QpJb1xStvwj8uOxV9LSNRJr5Yxm
 iOrgJ7Euxof98powNXCpZDRJc3xWWNy6ZU3edo8kmhp3LANQCCBw8JyTGKkIkldLOHQJ
 RXH7HGNgU/zVbW3EsVS/sH1jA7icZdoE2s2OvrKOfig5kSHUNV/J0vqqy2+mhEWbI0YU
 HoELvNYerqoIcWSSrnuPdnGnDHiBaIVoEHjtJVcM8kkC5rLIGbDRWHva+w11gMfEomyA
 4upWn6MAwBw/xwVQcT8OkbU0b9yKtSPfQ3fTFOg+ibEyPiQHQjJBo93oNmCxV+Z5yntQ
 T/qw==
X-Gm-Message-State: AOAM530Xpen+73Fuy7JdO/5H2HJ6CZ1oKq7HSVbsc+ctlI4FQFS6mjYN
 smfYeuw2eWy1t4wkvtnew9GtQw==
X-Received: by 2002:aa7:9592:0:b029:13e:d13d:a054 with SMTP id
 z18-20020aa795920000b029013ed13da054mr3475242pfj.26.1599852622803; 
 Fri, 11 Sep 2020 12:30:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 137sm3004112pfb.183.2020.09.11.12.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:30:22 -0700 (PDT)
Subject: Re: [PATCH 3/5] hw/intc/armv7m_nvic: Only show ID register values for
 Main Extension CPUs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200910173855.4068-1-peter.maydell@linaro.org>
 <20200910173855.4068-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e58a799-6380-ee78-9a4b-291f3e100596@linaro.org>
Date: Fri, 11 Sep 2020 12:30:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910173855.4068-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yM1TnVYlUG9e

On 9/10/20 10:38 AM, Peter Maydell wrote:
> M-profile CPUs only implement the ID registers as guest-visible if
> the CPU implements the Main Extension (all our current CPUs except
> the Cortex-M0 do).
> 
> Currently we handle this by having the Cortex-M0 leave the ID
> register values in the ARMCPU struct as zero, but this conflicts with
> our design decision to make QEMU behaviour be keyed off ID register
> fields wherever possible.
> 
> Explicitly code the ID registers in the NVIC to return 0 if the Main
> Extension is not implemented, so we can make the M0 model set the
> ARMCPU struct fields to obtain the correct behaviour without those
> values becoming guest-visible.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

