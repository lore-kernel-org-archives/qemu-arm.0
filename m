Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3521687njb;
        Tue, 10 Dec 2024 10:08:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXye+53fwgm9jpXT8XVUUclDtk/B8QDP4fJ4ms9diFj4ad1IefI7XGexmIKQBQXJcaxbBjz8PWxXc7OAg==@linaro.org
X-Google-Smtp-Source: AGHT+IGqrZ4sKG3FnNzV5kelNncVdVBPD26EmHsv8SMxOu+sTefyy8TDSKkvRObVZ6PpA2L40F73
X-Received: by 2002:a05:620a:44c9:b0:7b6:d1f6:3e0 with SMTP id af79cd13be357-7b6eb4b3496mr12204185a.22.1733854095026;
        Tue, 10 Dec 2024 10:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854095; cv=none;
        d=google.com; s=arc-20240605;
        b=fMKG12Zk30NXZ+8l1JJJuCZ51wq5aLOgNlbEpPZdDUH4FhdT+rxx5KUKkj5ERvCx8P
         +Fo7Y9euaAoyvHQ9mzB7rtGXCtGfVaruvacv6rL/XwUtldyJIWpkxlx/VmxO4Ockd3gQ
         ro8cPZXZSKrTAgqLQgJ/HfabZ5OrUsFkIOVU2Rw0pOUr22+/9i1lybksLWcvzq90eAtc
         OzhtSWep9PQ6HHnZB5Ke0uS04b198PmrvBSgXbfod/9oZ0njSijpJDz2+erU6wpwJjqS
         rOaymS1EKZWofCzr7OJAwEha7Uu5RAeZB9RKMbmeqf5657raL+mGcPctjEo+ITGpP84w
         L2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=OftDPk6XhWs7KS4awrmFBNEK5eyiQDSSRzc4xi8vJbc=;
        fh=L47UIBsx9dt33nxG37gUj+YFoWj7v5Az2Ptx7dNHuL0=;
        b=UAfFc8W7Gb9RO6QyYYt37zsxiyzjGGtxiZiZTREBMXm7FsXZI39PwrVzNK2OTgLp0b
         TNIumoqKnvLGxwJ052K2MkhbXrp51sgsHWAEvjVxRJyvdybJJzyrfH/amuFCUooG8hc0
         3tnUrHPpnotbsNcHzGVO+F+U3UY6UKFRJgeN5StPJOQGxQu3UDCuSgO1fEBsYBs4X0gW
         jLyexUYKVtgMMyV39R6SZoMRmy6gAdb8BoirUWmvtDMPYFBcX2oTOSvn5bM5BAwM/qvU
         r66w8XNS3pMNmyjTcftXtGoQzvvx8R58XUOEVzcu5+9ZzXpm9wA6G3hshQnQ0CULjKzu
         Qb7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MyJWtuPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6c53c7622si937294585a.178.2024.12.10.10.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:08:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MyJWtuPu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4eE-00041x-KO; Tue, 10 Dec 2024 13:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4eC-0003ww-Kd
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:07:48 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4eA-00027p-R8
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:07:48 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-71e1597e3b4so104295a34.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854064; x=1734458864; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OftDPk6XhWs7KS4awrmFBNEK5eyiQDSSRzc4xi8vJbc=;
 b=MyJWtuPumMVixD1bvKwnIXFqTuTiGwvr2QUCy9URnaiDyG/Ib4bYsWpPRm3SdMd9/H
 fhMWp+FH5S5GaKeRbyG9T28BCYgjk92FwQt0MS4zxqJA0oOVumroGTGXCTra+RMYG4jd
 DEkvLgx9dxQ3eJHpsMlE38WYNsO28p9kvVma22JVsOupp7b7oYWhFTkOYOXy8qn5hV3I
 SsntYUym7leUfvttjz8kMyrHn7Z1MIp+/WAGDq1VXJzjT00qEYWJlCkpSKlHIGHQT36x
 G7n4U4vFUX51FS8K3M+uuitJTxwb6xFzdXjGf9scNN2pcCTu0v5id3YDBER1KEsigo5m
 cLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854064; x=1734458864;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OftDPk6XhWs7KS4awrmFBNEK5eyiQDSSRzc4xi8vJbc=;
 b=nFsU5snGBEhvQIu0Rt8I0SKfJ1iokBE+UYDVeWNNUXnCJRK9EcB9aGxs8z2q4tSSQa
 qnp2gIRU2t5L82fxSqs4PelUPGouKvwv3ubyQmNPsg5vEU0xq5tepJPfqtKZmYAdWXp2
 BroqARtx6hZPcLmE/+kSq0AyXRgxbPMKGSRwj0/7999vSF7iowdWjIsiR0gHZnu+8foF
 /cfw3UP/Qpy2RCoQWrgN8RSFKLrHi38RCZlp7eghc6XdrBbJe61MRdYfQcltXjfUiYdK
 LAtUqQAHUMfV+BvkwAgRn1IXPaBqhQY7zrCGM2fDm9FmrODSGj/rRQYZm6S5hFRv5aEl
 MyFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFTY8cXZXl3uc3XoXlp3P6nC1TJqvY7iQkwIqw4ie/M/1vkAoD2JhXwU5F8WQ5XfiWgXhRzfOFSA==@nongnu.org
X-Gm-Message-State: AOJu0YytYma4X4ta2o4xYgCoSxj6uNAum7kFaBAXT4gukgDzKMDFeubU
 UmWnko+e3DO+SLlugNDwIwZ8yVopxfFNvP60Gs2vPhDvh/jKet+AYFOBOohvW9Q=
X-Gm-Gg: ASbGncuMzEs7tGNhqH3ro6nDdGN9rv761ltluz5Fx/tDAsF4u5ivCuuItdYSfOjRexR
 pL3lYId+JvcV+ydxTLaw9vyQsChQ+C9zutA0pCK+iDOVOg8T6x9/T9KpqcQHxbxTDvdmOaMz+7N
 /tLYYgXdsroOeUhRpMB6yNGP2awodMG+E20mLcCbWY1J2lveUoKvxZtzIVFbQ2iRWGV6H56SFem
 LXFU5NrzEKMADTdstvLt8ur3F47zTbAVHBJK/ya7W+7JyoAwf37RpL9Ef/Dp+9WUNjnFlo=
X-Received: by 2002:a9d:3e04:0:b0:71e:eb1:f75a with SMTP id
 46e09a7af769-71e0eb1fbb0mr943635a34.21.1733854063978; 
 Tue, 10 Dec 2024 10:07:43 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71dfb48c19csm922045a34.64.2024.12.10.10.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:07:43 -0800 (PST)
Message-ID: <0b3bdfa8-78d5-4d4e-8331-1502c85a7eef@linaro.org>
Date: Tue, 10 Dec 2024 12:07:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] target/arm: Move some TLBI insns to their own
 source file
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
X-TUID: pjnExQ3tBSzu

On 12/10/24 10:04, Peter Maydell wrote:
> target/arm/helper.c is very large and unwieldy.  One subset of code
> that we can pull out into its own file is the cpreg arrays and
> corresponding functions for the TLBI instructions.
> 
> Because these are instructions they are only relevant for TCG and we
> can make the new file only be built for CONFIG_TCG.
> 
> In this commit we move the AArch32 instructions from:
>   not_v7_cp_reginfo[]
>   v7_cp_reginfo[]
>   v7mp_cp_reginfo[]
>   v8_cp_reginfo[]
> into a new file target/arm/tcg/tlb-insns.c.
> 
> A few small functions are used both by functions we haven't yet moved
> across and by functions we have already moved.  We temporarily make
> these global with a prototype in cpregs.h; when the move of all TLBI
> insns is complete these will return to being file-local.
> 
> For CONFIG_TCG, this is just moving code around.  For a KVM only
> build, these cpregs will no longer be added to the cpregs hashtable
> for the CPU.  However this should not be a behaviour change, because:
>   * we never try to migration sync or otherwise include
>     ARM_CP_NO_RAW cpregs
>   * for migration we treat the kernel's list of system registers
>     as the authoritative one, so these TLBI insns were never
>     in it anyway
> The no-tcg stub of define_tlb_insn_regs() therefore does nothing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
