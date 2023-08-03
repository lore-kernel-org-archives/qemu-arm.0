Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1351599ejb;
        Thu, 3 Aug 2023 15:44:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0NHBFVP+mBbuuel5Ss0Mmu//JVUv9H0+wPuXcE1zdGEYEAk+OL2hDk/Y/2uQBafg6iTA7
X-Received: by 2002:ac8:5a45:0:b0:40c:7b4:37a9 with SMTP id o5-20020ac85a45000000b0040c07b437a9mr159085qta.51.1691102668374;
        Thu, 03 Aug 2023 15:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691102668; cv=none;
        d=google.com; s=arc-20160816;
        b=uOFiNKi/k4PwDicGDQbb4pMa6Ht3Dg14g2+FUT8aesQl5lAFZKXSe2jbHP6usHcAz0
         yiS3RRwRbaZWonpDXxTJkmOmsICfvgGEsg4zSs37RmiVsLAWsymUkbh1z7g02aG/A5CF
         vVMFlJ4ZLR7eI3/D+yCPzXOzye5Ho+Ookjrs1MssFxgWGVjujCr5jvwUBXfGJPHoYHhJ
         UyrHl6Oiaat5sF05OtUzIjjkwdjmsuKqAPdLSP8x79CAU8AfknBDywnw3ENQvyFmoIOR
         5rXR0CoBs9iREgcGAJmagizXM/X5hUUufHJHZnQnUNX7RiLoZrnnrk/Xoxxr6lDtB9Sx
         2S6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5Xax/i81wWuuTHacUrrWZ2wEVvCt2zpX9rQ5rNAXH/A=;
        fh=NBw7SrzuZw6mMYmeUUwb8IqeAoPji9e5dtxKfowYmtk=;
        b=WD6bXsuEd1ZnkmSpz1cJOJ/BdfUtqGsca0mITgimnLpwHURyPndRVIjtvJhMEsgME2
         srsbsGRSPnfr9NyWcCm9KPd8QXOSx32XS+BJh+ThIuiHf6F+7dITNQ/Dwt55fTR7SltI
         EMWxex0cdrWEHMSfr8+4G2XtDByK7JQBmaVf8XAdYCRJDVnjHuh4QjA2knyqGBU929DE
         sPmP8FDSzCUAcKkP7BP6qJ+/nSVE+tPwvtBd1FugVXRGALWM4sbrItrNYGF5sd2Si/Wp
         xU/CrrN9o+0ixO9Dls0SmAYOzB/xX2QaU4pMLCO23SCAeQ9ciD5r48bUmZH9+TC+JJOW
         QGxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g6YklAzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85c4f000000b004055012f6c6si451929qtj.466.2023.08.03.15.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 15:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g6YklAzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRh3H-0005t0-Mj; Thu, 03 Aug 2023 18:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRh3F-0005sn-K8
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 18:44:13 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qRh3A-0008VT-DL
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 18:44:13 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6bca66e6c44so1316937a34.0
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691102646; x=1691707446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Xax/i81wWuuTHacUrrWZ2wEVvCt2zpX9rQ5rNAXH/A=;
 b=g6YklAzGIS8VX87XWfeV89J6iSw5PLRV4Ww4FhztJw2RTk53n/Lm7c+X0LsAz4WOE6
 0klzdWu1JqCol2L162Q0ID8Po97xUl98j6tFzwN8BxFpt8eJZGd/xJ+pSmPTNu1YWnV6
 smT5W1Fzk5yvicwR73HOqxOXvY5bcJYLKZ5MvOox8pM+nzS2PQUmdRIjKMKP7xPTdUZ5
 H6ZyJ1uM6lz5CO3wGxfMh6NL9LatIXfLFsZVA08h0mukzpJ8xBkc7fVK6Z3o/dICKY0d
 rKEcrs/SdzAazUreCeCX98iqzspdt2aSR9nti2mKsHBibyjHEDc6T+cO9MdgFETCxGpD
 AbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691102646; x=1691707446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Xax/i81wWuuTHacUrrWZ2wEVvCt2zpX9rQ5rNAXH/A=;
 b=IlkJBnZ8Yv0r3gKBy7X068NOrDGH1uKIPUlqSJc8A1qldbtLSu28FoKZMsOc3vOi0o
 pMvZ39nwbXH22E8FRIyHPfgJB4AfGRUa2wl+SStKOwKVeHWVbXDvNBlvBlTJlxCuZOnn
 s6SdwYBAmnUhLKyOnS2U6aBV2Y2Tahc4NKJudJOaSLoN0sC1HYPON8tX6p+TYxBni6vh
 xulc4fpZKnLmpSg0imFcjTXN/aGmf5B1nmIwbqlOW/QKlsAS4NXv+F0UKekEymFA/oBr
 FJQM5Z3BeEZRlvsb+3ifmI7E4F9CvHr57HbsZw/U1I9tS9I+hH/9UUaJGTnKgRfwdraH
 D4qg==
X-Gm-Message-State: ABy/qLba39zPAqdLkTcxX5VLpgiLnXwur+Vl2G2MfWqBFF+4E08vNjSW
 6ZFvuUhPRctW6UTTQOj67jcTlA==
X-Received: by 2002:a05:6871:10c:b0:1b0:3cd4:76d5 with SMTP id
 y12-20020a056871010c00b001b03cd476d5mr23107676oab.37.1691102645732; 
 Thu, 03 Aug 2023 15:44:05 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.144.105])
 by smtp.gmail.com with ESMTPSA id
 ne10-20020a17090b374a00b00263b4b1255esm1485963pjb.51.2023.08.03.15.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 15:44:05 -0700 (PDT)
Message-ID: <b8f7799a-c54d-1635-d5b0-abe7e515bc19@linaro.org>
Date: Thu, 3 Aug 2023 15:44:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/3] linux-user: Emulate /proc/cpuinfo on aarch64 and
 arm
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230803214450.647040-1-deller@gmx.de>
 <20230803214450.647040-3-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230803214450.647040-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RuHcpNN4Rq9u

On 8/3/23 14:44, Helge Deller wrote:
> Add emulation for /proc/cpuinfo for arm architecture.
> The output below mimics output as seen on debian porterboxes.
> 
> aarch64 output example:
> 
> processor       : 0
> model name      : ARMv8 Processor rev 0 (v8l)
> BogoMIPS        : 100.00
> Features        : swp half thumb fast_mult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae aes pmull sha1 sha2 crc32
> CPU implementer : 0x41
> CPU architecture: 8
> CPU variant     : 0x1
> CPU part        : 0xd07
> CPU revision    : 0
> Hardware        : QEMU v8.0.92 arm,cortex-a57
> 
> arm 32-bit output example:
> 
> processor       : 0
> model name      : ARMv5 Processor rev 6 (armv5l)
> BogoMIPS        : 50.00
> Features        : swp half thumb fast_mult edsp
> CPU implementer : 0x69
> CPU architecture: 5
> CPU variant     : 0
> CPU part        : 0x2d0
> CPU revision    : 6
> Hardware        : QEMU v8.0.92 marvell,xscale
> Revision        : 0000
> Serial          : 0000000000000000
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> 
> v5:
> - use is_a64()
> v4:
> - more refinements based on Richards feedback
> v3:
> - show variant, part, revision and implementor based on midr
>    value (suggested by Richard Henderson)
> v2:
> - show features of CPU which is actually being emulated by qemu
>    (suggested by Peter Maydell)
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
