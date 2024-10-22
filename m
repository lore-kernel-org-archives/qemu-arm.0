Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2805030njb;
        Mon, 21 Oct 2024 21:12:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVvQKHCO/wCvoO5NbxK2ktXX5RmWy56hwzZ7fy0q0ZUQR4Mp+D3Nezpw/23DdyFdj8TFLCzz+PjL0xBA==@linaro.org
X-Google-Smtp-Source: AGHT+IFbLbPvhf+QQNu31NBCbWyafQ8TXx14zo18zNX1/j76nYcsKk+i0sSlYCzzxfQ9Mkuofoka
X-Received: by 2002:ac8:5f08:0:b0:457:c435:a5c2 with SMTP id d75a77b69052e-461010727e5mr18939491cf.58.1729570320192;
        Mon, 21 Oct 2024 21:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729570320; cv=none;
        d=google.com; s=arc-20240605;
        b=crM2sV+jv3OPavEuOXpTP+F9tV7fH4NXrgG/vKzCW44vREb7lBOSOKUyKI1SWgYapL
         ks7zelgrfnk4JQEopWUwVXLVMABYhTZ2bRAamcxG3Tmgr56iySqn5nHVH/mfdTKtvoeW
         o3lguMUlQ+anJjW7ARlv6hui1L+vv4TitrLyZuoERG4v7VTFU93tlYEdS8fVu0QCx0vu
         2A3Yr7vq0tmBkxwRRgBRlrUwOiN5171GT//X3FuPuh9LmmPPJd16EvW/hWi9ssb40slT
         3l53QAfbWs/rqGZKoc4aOb/jqUMQ2pUfuyIxhps2tBtsUBbo2PpNyopOWMsejvwG7ECA
         JMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aXIzRKITiu+bTV7skCLUHNsao7Mmm2V92UHYDAAGaHY=;
        fh=HobpW7rF1HonxHv9qAC3CtWhkNOSSv+ZKpmi1DjdIvw=;
        b=cEx2EHuM6Rx8rION/CRvsyQwlYHx6bSYeKtCYdBYomxNbBfJ/dmF1hHqJ9UBcGqhVy
         Jdosa08oYbTpc5dY7gndu0LB6GsSRbWILAD/W73kpITYhYUnxeuvp7ydm9c9SrhZrD13
         gplhmT/MB8zr+3f/Ctq/iReuivT9l49zCLGUnqIUCw6x7oyRsUkPDX8OprAGkAHYv7C4
         fgcY6B1s+y1dQsZ+GJgRcAwLV2pnMRQUG54pm7FkATTrEjPTB5ZC5jLobXHMAyZwFyv0
         f5Uo6a/ePXBFeRdlcRjcfVA0Qj7feT914Gm65f38YirPauHbJlDuqCZ+wLtxcT827QdH
         HNzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIA6bMCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460e9028665si37738431cf.378.2024.10.21.21.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 21:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIA6bMCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t36FA-0003FY-QB; Tue, 22 Oct 2024 00:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t36F7-0003Eq-L3
 for qemu-arm@nongnu.org; Tue, 22 Oct 2024 00:11:37 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t36F5-0004Og-QG
 for qemu-arm@nongnu.org; Tue, 22 Oct 2024 00:11:37 -0400
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3a7b80447so18408045ab.1
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 21:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729570294; x=1730175094; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aXIzRKITiu+bTV7skCLUHNsao7Mmm2V92UHYDAAGaHY=;
 b=iIA6bMCrnVkJS1hOyMCqNTVg29+cHGWrRNJKPzxuj6koncPjoqnCKqHWdkBUHmq0YX
 DZpe7uNFRHcWX9cVPRaxZxhHwGydSWjuAg2FKFCpY6JQI04F5ctC5pNdIUNySExo8FpB
 8G02rbd9LedEJP+4GTAX8hvn6PaFU8uhN/t2F8E916AAxFsicbhCus+EpI5knM1VSc2S
 BrgmsN/AANJBrF1gkiktBRJi7XoreT/NoBN9DjQdtQKaoGLtYeHy/KRgKPOg1x8wR6xW
 rhvHJTGmw+Uhe1jnYRQM5Y19If2114or9nHSfu3t0HGDLzFh68LtcucEshQfkIdg/Wl8
 wCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729570294; x=1730175094;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aXIzRKITiu+bTV7skCLUHNsao7Mmm2V92UHYDAAGaHY=;
 b=SpWDd3+yBWVd+owLfXgXY+u5pWz0VAfm0Nf24rvyJo+1SHW96BWcepGbcGt+LPn1a2
 rZ0hLDtutwjb1Eg7HTG4F0wwez0UmBbHxqM4Q0DqgVH/blpIPrwrtkDfqfz7OBf9vn7M
 yI6/Jc4U2/9476LHJKLWG5M/VJTdO76bKjSq2sIXWGWUMizV3zCrLDJWGl8VUBCbkFw6
 aIYh9H8UxLpsMR2SGKrKsapkaQTuHcR6EUIwPFDw+9hfp1Bq7EkEgtl07l0998w+fp+w
 FdVav/Pn/CpET/V+d15RbON5v88DYl6Row09umFROHYnOAVQ57RHVslrHErGh152KHd7
 16QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOlFMBH7AQIa4s2YfB/vOFMENrHKQeFd22Uaie60zG8h8MzyKQ+etA6CLZV7J9yjUTtpZjiE52BQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOtBZJOo0SxP4Gq4ZSNYESoE2yTJqLo1Teb5pnaZPkdAhTtrXa
 jVi8kHzMDWvgxCNlO0WA4F3r+XyUq+jOPp+4ycASzF1EYJ3+5lW93p30d1L2wT8=
X-Received: by 2002:a05:6e02:1885:b0:3a1:a163:ba58 with SMTP id
 e9e14a558f8ab-3a4cd80da09mr10934285ab.26.1729570294148; 
 Mon, 21 Oct 2024 21:11:34 -0700 (PDT)
Received: from [192.168.100.49] ([45.176.88.171])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7eaeabc115dsm4009419a12.74.2024.10.21.21.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 21:11:33 -0700 (PDT)
Message-ID: <977b5038-fa06-46d4-946d-f60135ecf106@linaro.org>
Date: Tue, 22 Oct 2024 01:11:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/functional: Add a functional test for the
 collie board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, Thomas Huth <thuth@redhat.com>
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <20241017163247.711244-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241017163247.711244-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-il1-x12d.google.com
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
X-TUID: 23RHnM/40dy1

On 17/10/24 13:32, Peter Maydell wrote:
> Add a functional test for the collie board that uses the kernel and
> rootfs provided by Guenter Roeck in the linux-test-downloads repo:
>   https://github.com/groeck/linux-test-downloads/
> 
> This just boots Linux with a userspace that immediately reboots
> the board, so we wait for the reboot log line.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                         |  1 +
>   tests/functional/meson.build        |  1 +
>   tests/functional/test_arm_collie.py | 31 +++++++++++++++++++++++++++++
>   3 files changed, 33 insertions(+)
>   create mode 100755 tests/functional/test_arm_collie.py


> +class CollieTest(LinuxKernelTest):
> +
> +    ASSET_ZIMAGE = Asset(
> +        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/zImage',
> +        '10ace8abf9e0875ef8a83b8829cc3b5b50bc6d7bc3ca29f19f49f5673a43c13b')
> +
> +    ASSET_ROOTFS = Asset(
> +        'https://github.com/groeck/linux-test-downloads/raw/225223f2ad7d637b34426810bf6c3b727b76a718/collie/rootfs-sa110.cpio',
> +        '89ccaaa5c6b33331887047e1618ffe81b0f55909173944347d5d2426f3bcc1f2')

Should we wrap these lines to comply with checkpatch.pl?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

