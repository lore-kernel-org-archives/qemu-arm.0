Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2717156njk;
        Mon, 27 Jan 2025 13:13:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUv/DZC4BfZxuDboT26J36aLOjDoIV6EsErrUtxSoqdwZFYOd681tVH/a6tISiGhJDnIVG9f2Mfl4h/9A==@linaro.org
X-Google-Smtp-Source: AGHT+IFwQq90HDtum4LWVrjhQTE5o18BY+naRWzkjL2E+n2ltQ/19nTFu+B09C/tb3muapluNx3S
X-Received: by 2002:a05:622a:189e:b0:467:6e87:99e8 with SMTP id d75a77b69052e-46e12bde146mr701674601cf.52.1738012383358;
        Mon, 27 Jan 2025 13:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738012383; cv=none;
        d=google.com; s=arc-20240605;
        b=Fohhlxs6V1/ggaLrowMFM7sOxDTAFagGmteUURJZAa/A3lP83Viv+YOFAZVAFrAFXX
         svQemwo1qYgkyy2FS7/FopOlT3o1K8GJ5XIaU1wmvNgvkxZApd/uxKNIOVidSRVuVn+x
         a9wj4WxZy22gMGcuF0BxWqVAEGoJl74R0Uo78zPp6F+NQ034uHbYQIjpvj51Jzptm+uN
         SZB1HiqcpHHVRiIpp+SaUKzDMkmaaw+vq+6AXqj8qFHGs3MHQt4aUIVHuUrZO7WmDDN2
         Vtv4FiSB/vUMk3asjygUpRJRl+VzsMcVT5howI9Eie+Q7JsiM5uyFJ+wqhLP59eWe8e5
         QMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tikZBc8zXMa2tH0z3aY/WEvQ26VmEeakiKukD5u3FXk=;
        fh=Sk1ukM5U1Gkxgf1uUDmo0wu4U0b+iR8n5kFK8Quk1zc=;
        b=WHQZ4lC9rooJ17ZzTEKWIUoL6/71mMxFViagRJajx4v8UcgL8Hb5CfrOcguN/Kcdbg
         d6r9Fl5RqJ03YB3runwSAW+D3UmbToimMOiJ6c9QJRnqXpI2h4D+/Xcvc/+Zlvlj2PCS
         7l3h+uNoMjXGF7AMWXhONgasLM0wFKECEyoI717rOs3W96ASXb1g9JXLwQAoagRnR9rR
         MdVW5qg4MJEGdbahBbZDpQbKpbEfY5yBzP8dRycRE+KEXmp8el4K8s7DVA74bcXrEJlL
         5q5ziH9DW8vbktfwXCpIBtECeRx2D+LUmiVT/ojk5dxFqRAQg1lgoDSRb7Ic6bB0/VME
         eM+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P4F+tB99;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba5811si101676751cf.521.2025.01.27.13.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 13:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P4F+tB99;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcWPI-0003Xb-0W; Mon, 27 Jan 2025 16:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWPF-0003X6-UV
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 16:12:29 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWPC-0000aY-4j
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 16:12:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-216426b0865so81536645ad.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 13:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738012337; x=1738617137; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tikZBc8zXMa2tH0z3aY/WEvQ26VmEeakiKukD5u3FXk=;
 b=P4F+tB99TF866rXpZicoed2yHJKWbTnUE3gXZlZ4C6uHbDca5Wou10nUs+isuLq82/
 Zq2HddSZUDzuZFixZaC4WfGWju6qLYhX6m2JM55fUEITc+W29ZZgojzhrBE70Nxy+W9a
 s4JWEu+XWrTwyzDzrsEpA4NWXXVN2pf/JV0Uez1sECtF+6y07Fk+bAGzXHaupip7wBFE
 iDuxDq4KC87LDZ1WgS3oqwGAafkFGQWRNora0/9VS4xCL2bwUISkB8/mLI/+iwecK6qa
 nSvNfrDHxiWuXw2Ef8BK2u62vYHseOfKFhDZVTUEE3uTrxuHAGANX56mluZoPX8AbDzy
 Vh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012337; x=1738617137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tikZBc8zXMa2tH0z3aY/WEvQ26VmEeakiKukD5u3FXk=;
 b=BA+fq/cidGMdCsnetw1kp3f3LIA4GNJwhsPE+vbYcfs23aPIy1rjJWpubqZIE1b6eG
 ndo+qAM0axCLTUohPjCUI7sgyWMwQDqjrlO3wiMWj5jrYKGoWM844oO50ItJFN4bl/3k
 4hvrbS8w9IY0KCVO5LQsn6F4lUSDqjXt2SXrvFxXkSU3zVQJ+PXUt7uH0WUzERY2JZzf
 ViBSrVwrC3UGqQgx8jDM4HewHEYg7nLrK3TeJe95KiKCKd/C2E9NFZfQzaSqR7CjjocJ
 MpXT9zZuRU84XCGl82Vz2V/YohRjQgKaLr+T9R6u2XLkqYFXR+8sbmeco5z5l1Ixxrq8
 Wt3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3pAn9yCnWJ4EplQVfuX74WOB4uabnpGQj0Pegtxi6zszPc0t+0wbEI0FGtIrPnlXRV6whHjBalajh@nongnu.org
X-Gm-Message-State: AOJu0Yx8A9d414mMgU0+m2AjDH0tfT7NOhL3g+Fm2FT7sK/vZhKOZKgO
 KNpXhzVPiBcTriSSHWcYUJQ75GkptOBE0DqBgM/dVh6BsiG1Hy0XfR6Htae8cQM=
X-Gm-Gg: ASbGnctgQdTgjeP94D63eQIJ0oFpk3h/F+lhAS3Hhou7N0FPbMYoYqGGIJd3pZYsN82
 jGKxxc3LYz5SVdgvaAheozN+LMx71vtXXVe66F7+lKRJ7ND7idv4swB01TYAPBrWop23Lrag40b
 QgNJGjrdM5tWDe78Jucp/Wn+siXdLDcIODs/rVUgWO9QUBn1k6F5VMtbm5wBZZyvHj+v8fgYIwd
 sbHjZjxTJ/VirzEESabqYLHto0e0HwWFiE+uTGCxtEAP9oXiFTocY7yYsj73QVpH2TSbOHNaSNq
 gb17fSLRz9FWWVWNEfriywr8eamtnf0Ng5cEoPnt8OkA0y8=
X-Received: by 2002:a17:902:d510:b0:212:5786:7bbe with SMTP id
 d9443c01a7336-21c3550e908mr729352445ad.24.1738012337566; 
 Mon, 27 Jan 2025 13:12:17 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414cc20sm68552005ad.165.2025.01.27.13.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:12:17 -0800 (PST)
Message-ID: <8ed100de-9136-4beb-b9c1-cd6cdf78a635@linaro.org>
Date: Mon, 27 Jan 2025 13:12:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hw/loader: Remove unused load_elf_ram()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Fj3zfYxxkgke

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> Last use of load_elf_ram() was removed in commit 188e255bf8e
> ("hw/s390x: Remove the possibility to load the s390-netboot.img
> binary"), remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/loader.h | 14 +-------------
>   hw/core/loader.c    | 16 +---------------
>   2 files changed, 2 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
