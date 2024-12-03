Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3558578njk;
        Tue, 3 Dec 2024 02:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkVGucA3D3ur4Wca0qfALGX8ji+HQ7dcVLy22lYYdIxhtQCtUNE/be0AyApgLYj5gKUIHUwysotRxO4w==@linaro.org
X-Google-Smtp-Source: AGHT+IGelhO1kJx3dg3VS4RG4dca6waJ9kBvaxMM5L2SKCwOPqIwaYhtrWCKOhnnw+rlECrguylt
X-Received: by 2002:a05:6102:9c4:b0:4af:5f6a:e73f with SMTP id ada2fe7eead31-4af973111b4mr2239410137.24.1733220047094;
        Tue, 03 Dec 2024 02:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733220047; cv=none;
        d=google.com; s=arc-20240605;
        b=J0zj+x5RfYvT87vRXJmbASJLG/HU0WOwHO9NcEjGa0SbHW04zvqoU04RbTy92jtX2U
         qbMfSSh/+z52S4m9BMi2L6VLcN/yN+ff42l+0ZthvQZ2HgM9yjjTBCUD6EW3MTkUYp2v
         zr415IqfOXgFmw3yYrQuh/nP2nb3HVVQvn0lxK4SpPPXiHAX9LjFCV32jDo0NUT91MQU
         lI8oi5/7Y54pZk2mEkiVxr9aMdDhXha1tcA4gR4a+luJ/ihjFQoALzgKYUGXXkt2NBSC
         aLZ7a+65KIabvipC2zrT0FFHD4VCkKn4of9MCDuj26jhK+c5ruj3U69h7oxQhcsERD2Z
         t5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mou40D0ZjD2Lf1VQwRddwv9731DnFFHuY1Fb6AhznBU=;
        fh=ENDfTG0DXCmMClI9Lw67cWOreTp0vZfkuRdaIjb6GHo=;
        b=GeH3PlJqRZ5uQRGOcV3EWh9j3vXA6+8RHxydINKvQOnc+UO7y4jqFbG6unWFSyErw4
         xCUbIBx7/BRoVGtWbN5ZtYnsLbO9Sbgc0zJAlRozm1mcyWklUdS8w7hLdK+PjXURAA5i
         LiDPkPTDz1bJvdgW4XE8ScoKMqnhvumP8VkMfvdzQOHjnP1SaDmDpEJhaSlVq4pQujl6
         hXRZve/b6welkVN8LSvmU2goFx//l4VPPjSGaYmg3pH0Lm6mL52aSyACX89GSJAP+d+L
         jTYYTT6mgL2YrcIvj9fmrZ4tUcjp7E+EFfWulbL981w5cVN+PcIf4r+juYZuQsTura1X
         8JNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb0NjVPV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af590d4b85si5078565137.29.2024.12.03.02.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 02:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb0NjVPV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPho-0007Vi-2W; Tue, 03 Dec 2024 05:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIPhm-0007V1-51
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 05:00:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIPhj-00079X-OF
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 05:00:29 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-434aa222d96so65982415e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733220026; x=1733824826; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mou40D0ZjD2Lf1VQwRddwv9731DnFFHuY1Fb6AhznBU=;
 b=gb0NjVPV0uHoLLftcv+dgNLjneuRJPWrUsEJHOLjZrkKZQywPPocKmdWqf1vpdYuCs
 UrOITPYiXqaXZ2OhGKAAfHpi7ZSE8B7yCzYbKPV/6JDoXRdhUXLPJMvMOPlFVG33n3vb
 2LHSmUxstpkD6P5sXg5NqthMHfFAzApduoiTkIHfN9OM2B5caf1c+NSXsjwLkWR2F2Dh
 VoK8wL6+AulUHXf1rwfNG365qD1H7n712tBlaAhBdbWA7Iz+glwKkoJX221PrzKVSGg5
 Il8E0BYjQA2DGSDOTxhaU7U4/6xyHYbPpPMM10V3rCipjiqBZcAXFex7TktflAw5EM5+
 M0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733220026; x=1733824826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mou40D0ZjD2Lf1VQwRddwv9731DnFFHuY1Fb6AhznBU=;
 b=qAHb18iIfN1/xvM3qvLLHzspm6uyiAOfMYPOj+eoqNKN6WjOKOjgr7l8Xxljb45xtL
 nVHnE97DirRKW89ifakaxL4L55n05fG34aOWZBY3QP8LwEX0PEkYMOjAuQBFgJ+Jxkvv
 d5I/Vw4fCjJ3UVOIfj1GUfxEz0kUOwsWZxOUpVyqvLHnuQajO7IdRzxtS0wsR8g1RYsL
 P7VBN9NmiJeClARt+mPoYjhctr2OKQoYVz++BPIwWOpQzKh7WP6kriK37aZkEFXbZGIC
 pfPZHgnngetgiaDozjiZVvLbEJsYjnTruSZpEels3TARXoH/jjBmLBmJhDc6lx8c0Jqg
 tbFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4aY7nlC+dZYs6RY9vYTHs67GdCFrYhz9+i5Xmvb4qrCAWpTUFEuA/ZgnAtEEZsYRvKtqIykNNjw==@nongnu.org
X-Gm-Message-State: AOJu0Yw43yhqALBtxR+g6d2mWU5SgDzL1P4bj92PoORSVxL5UrLG9HMC
 5JyWWzl+LBnHe4+h9iaxPEnSNPmAJvnKNqWrjWNUl/3qv1711p/62/FUFw+5p7Y=
X-Gm-Gg: ASbGncvbRTsE09In7fQ97xhNKrkXHFOwZb1Zq5wt585u4mwwHaAZVglbFXXrJLoIVBR
 GSaz7VvxKDwysQxOaDvvdl0aoX3+0h4Zbzo8FVSAT0VvAPDPNl/TFg66qdtGtiUgYFtc6xDARFr
 pBhKqgxzl0C/D4UgwXC6catfEcIuIEpLpQ5He3Znuzqjpi4cbffSz7gqwjCgErkvjyIBBw1xHfJ
 /w3yjmJ2L+OfokrJddkYEwFFG3VBMclPDYzSbVMrDATYTSfIKxAqe4Hka7b9i3a7g==
X-Received: by 2002:a05:6000:4024:b0:385:f062:c2d4 with SMTP id
 ffacd0b85a97d-385fd435560mr1562279f8f.37.1733220025994; 
 Tue, 03 Dec 2024 02:00:25 -0800 (PST)
Received: from [192.168.69.223] ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385db7f86dasm13053820f8f.66.2024.12.03.02.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:00:25 -0800 (PST)
Message-ID: <0ca2c3e9-2ea6-4cd1-9f97-56068b48d870@linaro.org>
Date: Tue, 3 Dec 2024 11:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] qemu-options: Remove mentions of legacy '-machine
 foo,accel=bar'
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-8-philmd@linaro.org> <Z07VR-YvVCxdTua_@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z07VR-YvVCxdTua_@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xWLU4OwEoAxd

On 3/12/24 10:54, Daniel P. Berrangé wrote:
> On Tue, Dec 03, 2024 at 10:21:53AM +0100, Philippe Mathieu-Daudé wrote:
>> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
>> options") we prefer the '-accel bar' command line option.
>>
>> The new form started to be documented in commit 8d4e9146b35 ("tcg:
>> add options for enabling MTTCG"); it is safe to remove the mentions
>> of the legacy option.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   qemu-options.hx | 9 ---------
>>   1 file changed, 9 deletions(-)


> I'm not convinced we should be removing documentation for options that
> currently exist and remain supported.
> 
> The documentation should be updated to say that we prefer use of '-accel'
> instead at least.
> 
> Beyond that, what is our long term intention with '-machine accel=xxx' ?
> 
> Is this a case where we are happy to leave '-machine accel=' as syntax
> sugar forever ?  Or is this a case where we want to deprecate it and
> eventually remove its impl (and thus the documention here)

Right, we should deprecate and then remove.
