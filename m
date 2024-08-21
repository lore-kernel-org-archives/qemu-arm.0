Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp305823njb;
        Wed, 21 Aug 2024 08:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXg9VctaxUInry/GES9lu5PG/FTlADWWHIwCk2FGwT7+1HdsQ+P+1uUqmtJfL7ovocutFYGemb9l2J2iQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFysY5Y73rDW89ZejpO/MEpLy4am9Dkp1tr0/u6tM0sTLZLsmMQnRxzlivddXwdV7Ehh9ao
X-Received: by 2002:a05:6808:3196:b0:3d6:3050:7caa with SMTP id 5614622812f47-3de193cc1f9mr2726482b6e.0.1724253133030;
        Wed, 21 Aug 2024 08:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724253132; cv=none;
        d=google.com; s=arc-20160816;
        b=D44UjhjN3hLXjX+u2bCFOtJVYX7Tj5to18zM0lt1SX02LfJirpcP5wbOFDD5a0xtGy
         CVaZ8iWzHYMYJ+qU29VImM2hTfxdWN7FZb1zhZ2pwicNcoRuACdBhh4eCFhO2LtkLCkf
         ei+ZN/05scm4JLeykhy8Ed0kIdp9282gZCG3Tx5VJFF4oSuiVy7V8rPmmbwWNvkYtmF0
         38G25kPnR9tmlmSW6JDein7fZDtcKDtddQmfoLixclaNM5H3qjLRaKMpfVbw7srCrFXU
         9QNfRogBFpu5Y9vOAMUbkmtM9DiY1vDygXxBb/OhyPn81D3XC/V5sE7K6znv8V8V+Wht
         JYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=er8A533SFJPEQI2xww8SF3EOOQMNUn1xFXlrcQOB35s=;
        fh=MQ7qbKS4yEHyJuAcdtUy0zmN3/M02ZHsPqjniX8daFg=;
        b=v6lXpndsAJ3BT+1YGTI4/zQ2BYtpk7W8IvBOj6m8LG6SquUzEMkkn1X2NvxCcpatUX
         Cdz2QU29SMj8Ki79ceSnVN5Eld0JPXl+51kAfi/yCmKabASSag8w/w0/eTY1gQoajpFc
         E0fWXuIGbNjwIhDbCYZWMgWUMsYPrN0tXJ6wQUztQKHswwGZbMDQiXQ8Wy94yTnFWU97
         vZzhxLBHH4yo6eY5+pwtY1DxhHvYEm6tLQ4ZQUS4Ddtk2chr8zYS/uQRf96bw/4oRPFm
         QYLicvJqYx6f1polVu4wPSCUVR7NEduGYEUC+p1itpH2FuyK4ELkY21Y+QqrVhQlYV02
         ocaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vWcpltaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4976ffb2590si2345094137.673.2024.08.21.08.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2024 08:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vWcpltaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sgmzx-0000NQ-UC; Wed, 21 Aug 2024 11:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sgmzw-0000Mc-KB
 for qemu-arm@nongnu.org; Wed, 21 Aug 2024 11:11:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sgmzu-0002fW-EL
 for qemu-arm@nongnu.org; Wed, 21 Aug 2024 11:11:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3719753d365so3926915f8f.2
 for <qemu-arm@nongnu.org>; Wed, 21 Aug 2024 08:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724253100; x=1724857900; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=er8A533SFJPEQI2xww8SF3EOOQMNUn1xFXlrcQOB35s=;
 b=vWcpltaGnDk6Roeqj0tJk2PfGcIsdD6gqaGdv+2fP/FI6KfIWdRvQNxuxiVzCepzbW
 lcIG71j0FuWbmVn5NnhcLeBdL3vAscWAd21B69KAC8xFyCLSV7At0lPjvBLFPVVqgW40
 6osTTqQMb0SpQCMGgIvmn5246NqUfcD3Y7FzpEKuqt6NUxVHwVlYbCKev5SkgYr6nYla
 7tYBlJg8UayGyPvNAjSCFUg3IzBXD2Y38IY9aSO6NvA9y+mxm2Sd+ZoJCcBJzaTxkQRP
 R5jh+a1OZ3KIYoKO/xfUPXbhLxxKRrA2SoJE8Nd8dfhKUa42ylWVyloYpylQIWLvWNLX
 ic/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724253100; x=1724857900;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=er8A533SFJPEQI2xww8SF3EOOQMNUn1xFXlrcQOB35s=;
 b=t4ekX+KhFbIZ2Tmyy4hj0/avOy5ISjCrnUXuf4k8wjqo1MLp7huZY4HXpx2YTQffI1
 KpLpP/bKnmM2j38KWi9Ec7Eew+gOF/kT3NknOmXuES3yXpCO/oRk/ndl3RDkOOmnAktW
 P78YPXmjIdEdkBZ2Z+IL8uYPnwLgFLsJyhM/5sD3GIohF0X9xSwUwSQwAqxpr6T4Kcr2
 1SK/UaRjtZGe044v11sSn/LMpC8l2FZnv/iIObplhE8+WPhpo0YN69yeJ3vNGu4iVgF3
 vZj/o0UvwfmSrpm+08Aj7Bs38QCk7DCF3c/5aj67EEsmWZ678MxqgPBLLnlefAgsr5mb
 1e0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcE5W5quGgFbbtzYAGUbL8FaKzZVzxOioNIxy2OvmSKrnpUP41HJqg5F3ZTraWyd9BB4I0AOrEHg==@nongnu.org
X-Gm-Message-State: AOJu0Yz9Kv5xRQznVJoy7SM0zhgn9TB/B4RMC/P/zZg+E+BxolvDp/8n
 ZmDyUOhWdccl7Gwe6QvGkLJFjAsL1AjNR61U67V8OYDfnUrRtxNLYUIpsltVmMDUYGEwAXuGkLU
 gMAw=
X-Received: by 2002:a5d:68c9:0:b0:367:96d2:5756 with SMTP id
 ffacd0b85a97d-372fd82b8f5mr1799134f8f.62.1724253100235; 
 Wed, 21 Aug 2024 08:11:40 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.218.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abee8bce1sm28931755e9.16.2024.08.21.08.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 08:11:38 -0700 (PDT)
Message-ID: <3e530db3-99e2-4878-a927-e6eebc0f92fe@linaro.org>
Date: Wed, 21 Aug 2024 17:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado: Move LinuxTest related code into a
 separate file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org
References: <20240719095031.32814-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240719095031.32814-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1+mFfKuWwJWO

On 19/7/24 11:50, Thomas Huth wrote:
> Only some few tests are using the LinuxTest class. Move the related
> code into a separate file so that this does not pollute the main
> namespace.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py  | 239 +---------------------
>   tests/avocado/avocado_qemu/linuxtest.py | 253 ++++++++++++++++++++++++
>   tests/avocado/boot_linux.py             |   3 +-
>   tests/avocado/hotplug_blk.py            |   2 +-
>   tests/avocado/hotplug_cpu.py            |   2 +-
>   tests/avocado/intel_iommu.py            |   2 +-
>   tests/avocado/replay_linux.py           |   2 +-
>   tests/avocado/smmu.py                   |   3 +-
>   8 files changed, 262 insertions(+), 244 deletions(-)
>   create mode 100644 tests/avocado/avocado_qemu/linuxtest.py
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 304c428168..a3da2a96bb 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -10,7 +10,6 @@
>   
>   import logging
>   import os
> -import shutil
>   import subprocess
>   import sys
>   import tempfile
> @@ -18,7 +17,7 @@
>   import uuid
>   
>   import avocado
> -from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
> +from avocado.utils import ssh

Unfortunately we don't run the user mode tests on CI and missed
'process' is used by the QemuUserTest class.
