Received: by 10.25.227.6 with SMTP id a6csp1303482lfh;
        Mon, 26 Jun 2017 20:33:12 -0700 (PDT)
X-Received: by 10.55.102.203 with SMTP id a194mr4040693qkc.180.1498534392885;
        Mon, 26 Jun 2017 20:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498534392; cv=none;
        d=google.com; s=arc-20160816;
        b=cQrijkAmn0AksoZM5Yl20cX6gcptIv2L3Eeg4O3VPLZRCulYpnmhba92E6IEqsTGwm
         sM6UK4uR5Fc1voMXIvlmvnKBlaLDgGW363SD9qtmO6oldDdoWqUB57YO/2DxfmsbLiZ0
         9zbtCC4KJekpwh1adwXJ47YN/vlKLCOvwnXBqqifBMcIz0QH4MaPTE3KzO6htTzzfn5n
         NpKoUwhNmeZAB8tDMoDb0u9ogejVi0U67FoJOYrmztgt13ck04r8bedo7cGOgoEXHazd
         9X87PXPkdOlO+GJ6qbICpN2PCPdho7ZhTFMVolYwA21L6Xc7RAkdsgQQ1EnyS1bgodo+
         zRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=jQNYsz6Es8pclXeFSlfaEzA6REsFHVueHL3IK3WORyw=;
        b=hTrwp48iUiba4ii2/FYAVcRGY43LCeJ6WXVdNXpVU4LoPVO7dZJdMRDE3kGk/oypmw
         zajb5qpsVh5FdgpL6J8AL6ZGj8pCZC2+6fI8pIV6+0RByTVpLwh1R9tcrJskmvaUZrcc
         xwbMlwpZoZvZCODf3SFFZ6lsbJ/dI5txTR6EtAQah1aSVaf002pt0AH8anIZTDFgq6GA
         MMIFB9pT04fYe4AMRnHUIK2wsfJGOfoFNyF9YcTnsm9Iwr4baO6kteVxT2+Md3qAkJSI
         achZu0s/jmz55w5GMHQ9FgNQLUUR9FymhAzxpfTHKVyn6d+xIQ5gUyL2Lj0i98MPlxRr
         fTBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=WX05P8Fb;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com. [2607:f8b0:400d:c0d::244])
        by mx.google.com with ESMTPS id t46si1723303qtc.261.2017.06.26.20.33.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 20:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) client-ip=2607:f8b0:400d:c0d::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=WX05P8Fb;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x244.google.com with SMTP id v31so2467168qtb.3;
        Mon, 26 Jun 2017 20:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jQNYsz6Es8pclXeFSlfaEzA6REsFHVueHL3IK3WORyw=;
        b=WX05P8FbQmaPxv066xvdvO/Hf0O+ca8Ue+yyqHHJMmwa+PeK2SzSIaYaLlDXf1Xcqw
         X1rizjgRtncpf+1lLOxlGEbcAR9pdCjDrwTYgzCi8COy8+oelbKW33+Aa6y8Rv9vZ1yL
         Qd8KxEeGABRR7rJ8jE55OnQxS+aZWip7Sj5pSWQ4TE3J8xLqUlkSelTB1/07n2Twc/QL
         An7lm+YyyjTRnR2A03D9EIeIySJWeqn/p7uBO/5JdAME8vJCFU7BCSJHMQbybp1xLbAe
         pK5HLUUFWiYoTvcsS947MUBxHFNPcndurlUcfbk/z3AYsO/KhxIGLGWSUn1d7XWOqdgE
         rU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jQNYsz6Es8pclXeFSlfaEzA6REsFHVueHL3IK3WORyw=;
        b=a5P1ZZlZIL97A+ktwm2gFfbQ3PhGcKr6siob3ULtBi6fmsJhM9TGrFT0p9AMb7AbDr
         lyXFAflyyYvH61UzpekQx6HklHGD+bIJ9pmLcdoFMJyNv8JRTNdv/b+yi/a6klx2Xl22
         F/brNOB86WWTouCnS6OKxhoPg3oXqeuOwKKRXnLUZzRRTAaDymYpYXGBL7dtyyiB3+7O
         YJlml1nwu1q4wsYSwE4gCYbf6TSJED/hCYAE8JOGzcoZlxK6ABeqloAT1LTMiLL8zI6/
         H6Zzfg72li/L9Y83t+K7sBkAHISnOjEJxE+NtxYmtpZM6meoWssHrciBk7vJgMtvAVvD
         F41Q==
X-Gm-Message-State: AKS2vOw8RanJM5xgLAJy84bON0n6Lh7fzLZu1MEtQTk7246SxRNQGl8t
	uB6t8nyBw6Fyg2l9DIc=
X-Received: by 10.237.36.143 with SMTP id t15mr4082365qtc.180.1498534392313;
        Mon, 26 Jun 2017 20:33:12 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id c7sm1432732qke.27.2017.06.26.20.33.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 20:33:11 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v9 21/26] target: [tcg, arm] Port to
 insn_start
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
 <149838531005.6497.12362377034456580175.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c43f4c84-debd-ffbe-7d48-97c74a0b8bd0@twiddle.net>
Date: Mon, 26 Jun 2017 20:33:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149838531005.6497.12362377034456580175.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1kLvs+gclVdI

On 06/25/2017 03:08 AM, Lluís Vilanova wrote:
> +static void arm_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(db, DisasContext, base);
> +
> +    dc->insn_start_idx = tcg_op_buf_count();
> +    tcg_gen_insn_start(dc->pc,
> +                       (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
> +                       0);
> +
> +#ifdef CONFIG_USER_ONLY
> +    /* Intercept jump to the magic kernel page.  */
> +    if (dc->pc >= 0xffff0000) {
> +        /* We always get here via a jump, so know we are not in a
> +           conditional execution block.  */
> +        gen_exception_internal(EXCP_KERNEL_TRAP);
> +        dc->is_jmp = DJ_EXC;
> +    }
> +#endif
> +}

I think this DJ_EXC block is better placed at the start of disas_insn.

It is, however, the answer to one of my questions re patch 4/26.


r~
