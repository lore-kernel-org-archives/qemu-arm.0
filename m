Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp721969lfc;
        Tue, 9 Jun 2020 10:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU8BHLaiSpJpODnAw2J24w0QLQU9zYQLWtA80R0YDCswF/xf0F2xbfsSQo0HzJc1HSOpQa
X-Received: by 2002:a25:7386:: with SMTP id o128mr8350533ybc.266.1591725247087;
        Tue, 09 Jun 2020 10:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591725247; cv=none;
        d=google.com; s=arc-20160816;
        b=ql9qEcM8io3E4YgXPge/04tygRi2xcFU3o+IQlvAW3nyvxPOGQyx3PviNaxRdqJX5y
         aB8otqNS7Au8uwJFEqoULYhCSJyRbMAlv31zGOupdWl5cWOWgFpxUVuOPFCC/kchBqmn
         P4njxZEMHssN2cO4KurC2vMDjzH8x+chUkB7W2bJFadFKj2GWhzrQJGAmnC+RpKL1bDw
         4o2FKHdNIq2JexaDKMpbLLkBn4mMNn0Eijcpl9s5qXhtR/i425HQwRGTe3uCmgitw2nO
         FI+tmtMGWSi1t5M5Bx6Nvu2T+3GtiuzHwDmbVgHnatDttTzsOtzMF9neTTIu4+lESlHQ
         wIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jBasq2HlXfK5voP01gxs0wtnR36LLYRt0XI1AqC9FVc=;
        b=TQ2GMZOH3q8lV42FQHiOA019o4WvGgad9a4pSop7GQMu6sp7k7PVGMvckRUKANxbfI
         MDAUSNbWjIoArPicOWgKVhZ69O0VhdyNOBNmLuClXkRLe3Ad2/p6mCYvrtyhdUsSjaXH
         aXaXXcGScudoETeVDFqcxcNJrAkQIScFtT5E45oRhf3zYU9323410j2r2aWod9cCEidx
         4HVsNdHT1Y7ihTTEc2zQXglrA0ZhWfb1L8BrU5p04Iq6IXJS91UPjYXPjmv6L+TSjTKY
         xj+tbAlrrj8Eh1IZzeQkGhFn2DB0RsiLk2m4+f5zpWsM78W3WqGWXMzK45WE9ZwjsFPu
         JqOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJzhe5i+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si3085310ybk.196.2020.06.09.10.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 10:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EJzhe5i+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiiRp-0000CF-8U
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 13:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiiF3-00086F-UQ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 13:40:53 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiiF2-0005Ro-MV
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 13:40:53 -0400
Received: by mail-pg1-x542.google.com with SMTP id e9so10590155pgo.9
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jBasq2HlXfK5voP01gxs0wtnR36LLYRt0XI1AqC9FVc=;
 b=EJzhe5i+zNgaON/3jcBQK00amcSerEcnunR0dlI7yf3Ou6SrJQUTsbnS5QQzTPvs6T
 iq5io3DM169jnUKB/G/TGZAgcFjMAoAYhH0J47hIMKxbUQ6Zeqh7bH/1sAOD+OJ6KyMB
 YyC2GhpnV0NtdsTbxwIdfmdiG+fLLvCGKDcwrTkQTWDgWWfMsHMaWj1fTRg+w/sVHrMM
 suWFC7SWaAPhFkv4Xln5tiWsML/8ArQmPVaYlrsbmzXvRtfaYbtMshyFSqywg7NGF5Ch
 JNRGy5EjpYltr6JXK4W/uhdTw1n1IE45jOajKtNnMtWvg5ba22hWYyHbg3mgvJ5tUNFV
 ZeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBasq2HlXfK5voP01gxs0wtnR36LLYRt0XI1AqC9FVc=;
 b=RweTayhURXR1XtSW4whydkoZY+hN3f2Iz1Ff0/Cy4hTj6n309dk/Vq2YpfPXEt1iEB
 f7Tm3Auj6QgkdkwLNdyk6pqxZdtb7fAaTiJaRGabZutZhU6FHxF7v8iWIUN4ZD48Rd7N
 GYIM3kUpTONtgsUjO+dftIbS5gyYO1kLp9Gt5kAv/JM2JgjQctkbo7pnqE/fKq7wpAiR
 uVonQGeRjEAikqH5XVh20R6vuCPaTVn3dMjTYISqcvsIfVGOTb6MQ05PA16NEiQFPy/P
 2I9vQ+CS2WFL3XPmrNpd+kpsAkzcQRI+EEwsdsUR4Pp1DVrcc0yHuj+OjRvmQAfmeKKm
 Wc+g==
X-Gm-Message-State: AOAM531u18w7XMc7DL4YgaNaMwqaTDdod2vCwy/VWol397SmfyXE+sOs
 jaOR0Zp4FcC8nRXBBJtbWOfl4Q==
X-Received: by 2002:a63:40a:: with SMTP id 10mr26045995pge.310.1591724451050; 
 Tue, 09 Jun 2020 10:40:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d189sm10563666pfc.51.2020.06.09.10.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 10:40:50 -0700 (PDT)
Subject: Re: [PATCH 3/7] target/arm: Convert Neon 3-reg-diff narrowing ops to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f7e4d90-e5e0-5b76-e801-4bc556036652@linaro.org>
Date: Tue, 9 Jun 2020 10:40:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: ecX9lDsUyW6B

On 6/9/20 9:02 AM, Peter Maydell wrote:
> +#define DO_NARROW_3D(INSN, OP, NARROWTYPE, EXTOP)                       \
> +    static bool trans_##INSN##_3d(DisasContext *s, arg_3diff *a)        \
> +    {                                                                   \
> +        NeonGenTwo64OpFn *addfn[] = {                                   \
> +            gen_helper_neon_##OP##l_u16,                                \
> +            gen_helper_neon_##OP##l_u32,                                \
> +            tcg_gen_##OP##_i64,                                         \
> +            NULL,                                                       \
> +        };                                                              \
> +        NeonGenNarrowFn *narrowfn[] = {                                 \
> +            gen_helper_neon_##NARROWTYPE##_high_u8,                     \
> +            gen_helper_neon_##NARROWTYPE##_high_u16,                    \
> +            EXTOP,                                                      \
> +            NULL,                                                       \
> +        };                                                              \
> +        return do_narrow_3d(s, a, addfn[a->size], narrowfn[a->size]);   \
> +    }

Missing const again.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
