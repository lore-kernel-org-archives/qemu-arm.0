Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1564801ejb;
        Tue, 19 Mar 2024 14:16:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+rJrxyUoLmIhUnbI4rjfBikmZdw7e4rG1zJb5VCjGLQGaHANJccRu+mO/+JXrf+naw8BIiDpwUZiwdrHgWBKF89kbhY/L
X-Google-Smtp-Source: AGHT+IGBnOERlYnKAAHNBzoG1L78NDviK0r6zM/7EkMUSm+f6HsBDtxnkmRohOxbVmw16K1Kg28k
X-Received: by 2002:a05:6808:3995:b0:3c3:9728:260a with SMTP id gq21-20020a056808399500b003c39728260amr3734079oib.39.1710883015236;
        Tue, 19 Mar 2024 14:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710883015; cv=none;
        d=google.com; s=arc-20160816;
        b=rfdQ9BI7TdiJkxnAeuTaPqmeq8tm0ylCIAfvMV2zdaAW1ZN31EAmAI+GSc8Jt2FHeD
         tZl4IWg44edl24iu7hqWzHGCa9jxFKp+HzDq+QXN4XBc4nRt6P8bWznZ0wwlIw9Uuwn/
         jVMIuejvtuZB03yN1Dq3xbM/er67mlrqfRxiUQBGI2W4wrKcrFnYYX/nx4QcyINJfNX4
         s8OU+9Wm5Ziw5dSNgmLrTQ70wjkqAB/9WK177cHNFuBJ/uDOVpMgl5hGTlls43yDo+Dq
         CEGUt2lbiSbzbNOLj7t6UFVbS2Wo9pCUbKyCeUPik8CPKUcq/hEqIwBMUv5D7dgHa3zQ
         ZHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OzXNFRQy4obpYoDpWQot9takJN/KNaAfNdmPPTGfPTw=;
        fh=8tSoyW3kPTZ+QHPNotMyz+9JQgaiMDnuZVRGNj/N+SI=;
        b=Ah/T9QosNUR5xecJaXmYWMtfeXMZCbgtw0oCEkYKzU4GPlTebEYhlSBhJpp7XSigkj
         fIaawJDJ8D/MBYy8pevcdzBabG8eo4wOx0tlg1VH7BJyFr9FZBg9bs78TYcNW4h9Auz5
         1RfRnoLDatPhx6so/Um652VVWCNWSS5JAWp5XW4UMgZiZRic97CCSgvGT4/NAY92wQOU
         Cpd3Ei3rx8hh9mSAHQI9Zzqwo9JsD1rqxhVi7TszK06LdxzvLwpyRNYc0sto6rCQm78V
         BUFsSpJIJcnGzgElSkOHzT84YqAgryjmP6c0f/ZutOAfmgkY5Ap0O7qGBY9bf94mTbNg
         uboA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEIkDuG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a0562140cc900b0068fa9c997e8si11258790qvx.351.2024.03.19.14.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 14:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VEIkDuG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmgoz-0003Tp-LM; Tue, 19 Mar 2024 17:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgoz-0003TQ-3W
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 17:16:33 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgox-00005s-Cm
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 17:16:32 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1e0411c0a52so12485245ad.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710882990; x=1711487790; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OzXNFRQy4obpYoDpWQot9takJN/KNaAfNdmPPTGfPTw=;
 b=VEIkDuG7zgn+NpCTl7v7pVNnWtupvA6M3RPKNFArgltEDdFe4/I/9AQg1tUc6D878/
 L9fWhdrK9rQzzHhpKiH02UpSMyIjfo1iULE/eamjNviYnMAPAaOp1lWM4y0RWy/HMfLt
 DnPixkQBkQ87QZ0m2/iF8gvgC+0wa9ifZn/WCQJerKW95mjMFgS4EN/AvRSmL0BDWTFx
 jZrBL9+LpYuUdtXUb6E/+ClFSd1X0hwM+M6cGgJWDIUXQpEhjCKN8LeGPbwD2JYQdv66
 F24MVX9M0yh1Qgomq8Qg5KwPZf2q58iRyuutcLzOn0bBGeFLXfRDX/HZtsOEHik+qXeH
 AN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882990; x=1711487790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzXNFRQy4obpYoDpWQot9takJN/KNaAfNdmPPTGfPTw=;
 b=T9a/5lM6Q69Lg3UfbLM4IQJiBQURU69+thVg/QEG4MsY/+50jp+QMiCIZK27+E7tdZ
 kTTigtkb8jKfNdYlxqWJIJaAJZMs4csrRJCO5DiI1QkPX9i1LvVkG0cSSXY2afrzjoJu
 iLJ8EQ7v0VDy2t4EFRqGoSvpqIwyUoOiVY3ng+7+fsWLEACkaSzBkwduVpYdb18nxlvb
 Nu8ugPR7w0Sf3IsJWEtTHXt2Msr8ClYLPbMEzs0uxRTIWV1Ibbaz7s9EqXbXCs+K4ymh
 9hzhkKOqubWtadsflww1VGZvk13xnKnVilcoa0hAIQfz51td9pjpKU8cEVPVBPHbAQ+I
 U87A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwvOpsOIW5nA2PvICYxoTS08s34XyPSAcnWm+3T2JQHZI2fmhuihTG/yVLBzb4VjrJbtAMVck7u574g0zJPZT135In
X-Gm-Message-State: AOJu0YwLbkZdgKe32/QybG/q9ZAY7R6DgudH28GrZQBHyqAPSqN+sA3n
 1C6MqnB3f1xxUrazBwDhaQ/C6Qcd2GA9BnTvHuLhvLy8Yw4/snECAMCsIaxq5xU=
X-Received: by 2002:a17:902:b70e:b0:1dd:de1a:bd02 with SMTP id
 d14-20020a170902b70e00b001ddde1abd02mr3441417pls.41.1710882990023; 
 Tue, 19 Mar 2024 14:16:30 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 i17-20020a17090332d100b001dd7a97a266sm11708110plr.282.2024.03.19.14.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:16:29 -0700 (PDT)
Message-ID: <f53deaf6-6b83-4eeb-aae1-3ef5925e3897@linaro.org>
Date: Tue, 19 Mar 2024 11:16:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 00/27] accel/tcg: Introduce
 TCGCPUOps::get_cpu_state() handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>
References: <20240319154258.71206-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: S+c/Cxuza/Uf

On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (27):
>    accel/tcg: Ensure frontends define restore_state_to_opc handler
>    accel/tcg: Introduce TCGCPUOps::get_cpu_state() handler
>    target/alpha: Convert to TCGCPUOps::get_cpu_state()
>    target/arm: Restrict TCG-specific declarations
>    target/arm: Convert to TCGCPUOps::get_cpu_state()
>    target/avr: Convert to TCGCPUOps::get_cpu_state()
>    target/cris: Convert to TCGCPUOps::get_cpu_state()
>    target/hexagon: Convert to TCGCPUOps::get_cpu_state()
>    target/hppa: Convert to TCGCPUOps::get_cpu_state()
>    target/i386: Convert to TCGCPUOps::get_cpu_state()
>    target/loongarch: Convert to TCGCPUOps::get_cpu_state()
>    target/m68k: Convert to TCGCPUOps::get_cpu_state()
>    target/microblaze: Convert to TCGCPUOps::get_cpu_state()
>    target/mips: Convert to TCGCPUOps::get_cpu_state()
>    target/nios2: Convert to TCGCPUOps::get_cpu_state()
>    target/openrisc: Convert to TCGCPUOps::get_cpu_state()
>    target/ppc: Indent ppc_tcg_ops[] with 4 spaces
>    target/ppc: Convert to TCGCPUOps::get_cpu_state()
>    target/riscv: Convert to TCGCPUOps::get_cpu_state()
>    target/rx: Convert to TCGCPUOps::get_cpu_state()
>    target/s390x: Restrict TCG-specific declarations
>    target/s390x: Convert to TCGCPUOps::get_cpu_state()
>    target/sh4: Convert to TCGCPUOps::get_cpu_state()
>    target/sparc: Convert to TCGCPUOps::get_cpu_state()
>    target/tricore: Convert to TCGCPUOps::get_cpu_state()
>    target/xtensa: Convert to TCGCPUOps::get_cpu_state()
>    accel/tcg: Remove check on TARGET_HAS_CPU_GET_TB_CPU_STATE

Modulo 3 notes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
