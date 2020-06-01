Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3545459lfc;
        Mon, 1 Jun 2020 16:36:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdtt6sZ3XC9VrGsu8b/o5UGq9AGPs5K48VIdUdYJvWAhxgMCsZSUL8ywAmG/oHAzDtTYTa
X-Received: by 2002:a25:35d5:: with SMTP id c204mr36261112yba.292.1591054578096;
        Mon, 01 Jun 2020 16:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054578; cv=none;
        d=google.com; s=arc-20160816;
        b=bB1OLODkzuY15pm3drbKbPtvU7EI/gSeQD1tF3wc74SAg6mH+nLTWOmavvSlXyFlc0
         xtTApQEbRSzxKNAjTsZNUxyr/L5jjTEna7wvfta6doSeCDj4uRDs3rZNtlogXtcFS3A9
         RcNXekqx1SRU04lyvvHJoTdX9vEywge7t1/DKNw0gbT0zwGFhLQeP6r4Qjc0Yt+RvhW7
         bhw9R9bqUChj4xvuZrENlEYCYmYZr6YmWu3V5nmNpqrBuqBNZnPgumVbasLZuv4VmK7a
         eaUQCpQQ7NqycJBrafdpBhfb8oIIfitmVtjs4AAmAvH4Gwz7TgaioJH7u9jiZWcpsXuI
         QVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=X4I89W39vWdVNoghag0DFn1ebCW1eil3jLJKcfTKZ5M=;
        b=kvL7ATNXMt0q3olyQd403Yu8H/TksJyLMUIh3N+LE6Ld/HuLdIjrFZprgb7BRIBUBE
         ZcEstwZ1i8rQ8tCBOFHUNDdheDHqqcWS3NwB2TGMu9zj5Os7mZy5TvAEbaauJKJRImdp
         KugE82Y6w3iI2E1hZ3KMfu6G4fnKd3faAyZ/oJfmlCmnrJ7sC52bGs74YPzy4OI02Q9B
         jzhwIxYtx9VKKdQGNmTOH2cQneR9A43M8MAWtsgRMxddN13ar2QjuRpc0QnB32n3WydG
         eDBzCXAw3q6Z36U4/QK6QuWT55U2RkqKkom0IQy1BLlbX15QLeUCq3Cy2gDXVeyDpqG+
         RFlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rz09eZ1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si771092ybb.279.2020.06.01.16.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rz09eZ1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jftyb-0000zx-Ae
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfty6-0000dT-RH
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:35:46 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:36312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfty5-0004nu-Bt
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:35:46 -0400
Received: by mail-pj1-x1043.google.com with SMTP id q24so540882pjd.1
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X4I89W39vWdVNoghag0DFn1ebCW1eil3jLJKcfTKZ5M=;
 b=Rz09eZ1jDr2GqUZY/02LI/v+G4Mymsh044uItJIu+SnTWqBOlAr+pJ1tg3MAcjFFs1
 Wl6k+fmHMq6vXzx2AY0IPGk7NZeU4+E1Sdxl6Mw5AoL9jND4oWQZEQZD+r57AvzHYH/N
 NuhvsCmxF/i2/oBgKNFahnAkMkXFOc81T1dqP9gwS5GJh/0SPKNFan23YgZ6NQ73MEYJ
 qtizNevWe96Vk8MzhSZxh7Hzp13L2QEO5pK/Ckpe0BVTVtsiYNZzxunfsbyOeIti92AR
 Gv4QktnI7lS9pbKOOeJaYUI0JaAylDORYJBmQBzWNsCRniPV5I/JXtMFJ7Pws0xd4Q6l
 nS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X4I89W39vWdVNoghag0DFn1ebCW1eil3jLJKcfTKZ5M=;
 b=fzTqg/Bgm4B85ogvJ8OET1HiOTomnfDylz+Mn1fticJSja+m1WTSBZ0/F51FRSMiXf
 KnjFGgxgdjBMrJqiN0CXRwhf/aiwQUIsEPBbtpZHpZiu7myOHkKS7sR4h9DFU30tId39
 Xi+pl0G9PKHUZz4fTvxGC7pkXhUTsLgLjx6NH7l+Uf0nu3/BM5ZKt4zP68iuq0MHrAjW
 jqJDWmnm+u1W5F32Kb3lWIpwrTgrd6hD36VS6jWK/OgdBsjnJ9BLh87rQgCRqzQ6X3XX
 sQj1WvvPuUNYyvonns/ysBfKYn5lXx4HwO4B5c/DP2iIq1rEZqswN6NUtztL62Y8QDtg
 UBew==
X-Gm-Message-State: AOAM531Fw+dTPAkEvjwJDlaoM+Svp0uY8dJy0aMxwL+HV3VeTg6HicYZ
 dEUevhDl6kRDk20jHaR1un0JAg==
X-Received: by 2002:a17:902:7896:: with SMTP id
 q22mr23251618pll.216.1591054543738; 
 Mon, 01 Jun 2020 16:35:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z1sm441635pfr.88.2020.06.01.16.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:35:43 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] hw/pci-host/prep: Correct RAVEN bus bridge memory
 region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92a1fda6-0ee9-e7f2-7248-b79c01c7b2e3@linaro.org>
Date: Mon, 1 Jun 2020 16:35:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4ElZLfl1Nfb

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the bm-raven MemoryRegion
> ends up missing 1 byte:
> 
>   $ qemu-system-ppc -M prep -S -monitor stdio -usb
>   memory-region: bm-raven
>     0000000000000000-00000000fffffffe (prio 0, i/o): bm-raven
>       0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
>       0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff
> 
> Fix by using the correct value. We now have:
> 
>   memory-region: bm-raven
>     0000000000000000-00000000ffffffff (prio 0, i/o): bm-raven
>       0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
>       0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

