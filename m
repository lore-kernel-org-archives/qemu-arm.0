Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2248117njb;
        Mon, 10 Feb 2025 14:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAhpZ3VsaCdfTpciMFo/BlA95JbIoDEiq4efpcjrpRsbLpyYs1NL65dur2PydEHwAlFy9ivywXachU1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG7YHf98/Ad+TGHtoap9OiQtFMAaCAOB/BuU6RKqyHagrU0vi6I2ieyImSw2oRkJHe/km+2
X-Received: by 2002:a05:620a:450c:b0:7c0:6563:3681 with SMTP id af79cd13be357-7c065633a4dmr369936185a.24.1739225564435;
        Mon, 10 Feb 2025 14:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225564; cv=none;
        d=google.com; s=arc-20240605;
        b=VBYkcmjw5rb8BSD01YcBGRQbz4fXEgFGniE3NWJ7CKTiLsuDKm/q1HGxX2Kv9vMUnH
         85RWi7ekVtb1Bi0WPIlZgpSCADg9qRuhwnStvuUnEz5U36xBqe0BAXFl4HI9AzlEcj7a
         JxcZKcvatWmD6ePc5iyDgFIbFxtQrlQ765zGlH/z7Yx+GgIiAKZP88/Z6XYl+rUWi7mY
         J2xoJpztIv4b2mMB2dQncmtLXpoCjZqN0DrTbs3Ei3xT5U/sOm/sxVC2mWxh1WQOatP6
         fe46sNRvhNSY68CgeELJY+9dwJss10c0xXKPTE6m1PxbZKZuFiSqpBMhterD5E5OjISa
         gjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QqmxHfGf1ujzhqbDSxyygIhwXCXDJev2LskftYaJDcY=;
        fh=NxltZCcv2cJxR21z5GELFSgciufF8GbZ0h6W3GKGDz8=;
        b=NUWSCJozDTg/YZwzdCop2AYq0IktyQO0w9Ww+gxM5wwvpzei35b7lMyarKc1/3snMC
         lZghy/baY8dFWsfP8JyF8cExvfRPtH6TwDLI/R77vcrnXSkmWC7DAQHWthWhQJMCijB0
         Ttr62QH+wtJK+a8ieAdvzSCD16arGTATxJhe5Qry+SXLXLmwZShrWSrDSNbDP343I4n5
         IFIbyXXUXhptgALZjgXJP6dloY3FBxy+z+Vs4PIZXkc6QrOR6JySUKbbL1XbWMOylVGA
         tQeJT/SevK3ihoNRVCBs1/tQpifqqGzp41/0kjUGK2BLSMezI8aDRVXbWF2nWhhszrPv
         sbng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pLasVdPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e948fesi1036299585a.245.2025.02.10.14.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:12:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pLasVdPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc0r-0001sH-Nc; Mon, 10 Feb 2025 17:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0f-0001dq-82
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:12:11 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thc0d-0001EQ-DT
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:12:09 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2fa19e1d027so6156770a91.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225525; x=1739830325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QqmxHfGf1ujzhqbDSxyygIhwXCXDJev2LskftYaJDcY=;
 b=pLasVdPfAuglQdcCfLcNoMXIsEnplbKTAUG2d0QkTjhmISP0wy2LW4dbATzPneLNb5
 Wi5bGMPI31k2V6CbmipE1wJIpLHjiaVZrVFAmRx+G5SI5vZLCUk2Y+7tpmiO5VQBm6V2
 JtIRsnB8zM0rqLI86488XJiGkpAWr0ejGZBa9gANVdo1Ww+G9xx17uLClIbsHLqUbNNA
 rvC381DCc9c0xQ82kJAAbdpHcyp+h8wbQX/bbksg0lpjCpdsxW0fQianzuVJzG1BssVg
 4QHRVIlPYgBwaBJ2TwvsswP7RDjqPKj09gOOaHBpACncPs0vdWTIZ7kD7zpICqv90/sp
 n3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225525; x=1739830325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QqmxHfGf1ujzhqbDSxyygIhwXCXDJev2LskftYaJDcY=;
 b=hgzc2zOCJw3MAaKJOJYrXIZNhPywPrDUyBIWshLziglJUKWx3FmXzhjJ1S/q3y4PjD
 N3uSFuFce8Do9kLDoGJXSbPyPjM6ntJY1m8zbz+2Qq5THhD/UbBOUhonjRrEzE8I/9DW
 K00Jj+v2ANxwop3hlX3+3RSNRlK/hJq6B7pVogVDh3pR6fKeCl0xrSeeobNzenmTKnUH
 bj4E408C9sdURrUfwke3TbkOiGo7AEKWE21reyAlIi/LkCLiAjdq/z+wM/+o7WlpyO5N
 tzd2qHdwLaVf7l/Loc94Z5/lmmeGEg3gfOb8omJu5W3VML2PILjitIev52q9cI0hR4/f
 qbWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjVBmaThTZIzmFkj7gdU0Ziq708HwVFiXgyl+UXQsPgk6hY0Lj14FFtU8G+73T6WSNJcqYZKhucA==@nongnu.org
X-Gm-Message-State: AOJu0Yx7AHyWC/N8h/arz9odts13Y+rk8NF9pPz+z7jnBoUoUgxrPF/H
 FhicqdedVMoMUukoPlcCLKgYlb2g3M+SGBl2XpTrIZ95uVjSLAGVC5A+IJAcveo=
X-Gm-Gg: ASbGncsMXGONSPSNsBPastAZSGwide0g1KVVfjOtXQ0jlOQ8foxwMZT6n7fsbRog2Lp
 qoiNUWj3nNtb8Mv8pDHMzJTENAZkLDuQLbTbs/0QnnfVHO9YGZmf1uGIwz0vAKhApDlNrJ80Xac
 C/PRwai57SiLP2j9CEPBOCjHUH73htRLZt+79E3Iu8JzpQPNF5/oay2D8nrsITZy1mx55zVmuJQ
 mUm9JZxn8KOiDRRjGy+wkNFPUn/DmBHbG73cKpHy8gdD1Oudzufd4LtlGS/0WIBTyJt/YhA/xkY
 vcJ53vhCBb1w2LKTAowxI0+qSi/99JMEkzDqVnVeNfurmcNDMFlc5b4=
X-Received: by 2002:a17:90b:2252:b0:2fa:1a8a:cff8 with SMTP id
 98e67ed59e1d1-2fa243ed2efmr22680571a91.29.1739225525308; 
 Mon, 10 Feb 2025 14:12:05 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa20eba0dasm7782809a91.45.2025.02.10.14.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:12:05 -0800 (PST)
Message-ID: <fd3fba28-ea24-4ecb-84a3-2c9a84bab68a@linaro.org>
Date: Mon, 10 Feb 2025 14:12:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] target/mips: Set disassemble_info::endian value
 in disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: x0rlsE3Vc6PK

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have theCPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/mips/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
