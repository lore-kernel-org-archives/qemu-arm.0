Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp571730njb;
        Thu, 5 Dec 2024 18:34:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWw5Eq5iiohw/m5l4OJ3MdYJuk39T9Y7k0opv/+ytrC8qQ/I3CP637nOjfFPFvLFTjxMK5Cl/fcqiWmYg==@linaro.org
X-Google-Smtp-Source: AGHT+IEd0oZ90lyXwu/PYed8btB6Fu9hJhC5evhaNbMtGLr9WlLNTy0UPIVgExnxF+b3GHUqS3DQ
X-Received: by 2002:ac8:5fcc:0:b0:460:8f80:9091 with SMTP id d75a77b69052e-46734cac0bcmr22093351cf.15.1733452471095;
        Thu, 05 Dec 2024 18:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733452471; cv=none;
        d=google.com; s=arc-20240605;
        b=PXNtJDLNcEvqV7R+5pxefz0oXTbLydPMrjjD0J6dZYUrgdniMvMiipxXKiAygHdVvO
         l+TNeWxH/eCYviETvwO21cxzQBrtoeE3LNTUgGrFuv1HkV7ffSdOeUcoENTDfCbHkQdT
         oyX4QWK0/H0mBE0uzv7r3uMLW7MSmT16yDUf87AZqE4aJVNY3s9wThFo5G3KK0rwUXoQ
         KigJHdifnyIwIcWuf2/wC7KwVE3RYl3NeUW8r3QZmG5TNSOdZ1XONxZECu/HbHCTRcTy
         jdT3+OSMjSvTwR3+InLy93v2BRzX25v77B0SguMrEVla4f8ARqp/8zxDMWg+FBucV7IZ
         a3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DdVCpbnp8Jy1Agb4lnXkLcMMusYALlOyzv+oIkXH4Oo=;
        fh=Npf2bOzjbut7fyo103N48QhKV5O9HGHId2rj2ghy1N4=;
        b=SdTzmk+fU041gJ5JUEIx+2rCVU+F3JkUMURHLvWaUAfYxUbnhb6HGNxkpG+G7XpSBJ
         dJqcZ3tS4+KS9J/oKl7R2ElkPeUXVJxigmVJCk3ouB7wCm/ZZZIun4aaFKIPuVcfi5tv
         S6m9gIbYkQeCQBzPJRLG+erRZBkIArrFN/qQhyQ/as1X4BxLB6L1XIjIlcZdYXSoN9u+
         DthGnikPXPEJIknsm9vy1IjbQ61AcOJ3Jw3ZWeVQzMX/Celj4e6RaalHtH9Vpg1VyH8y
         0DqOclJhqj6BHkU1D5p/YT+Ch5T/rmCTvpOhnb+22I0mFMHUumbkxHzLl4E4HsKimNKX
         fr7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQm6An7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b7017si36489381cf.109.2024.12.05.18.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 18:34:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oQm6An7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJOAd-0001oW-EO; Thu, 05 Dec 2024 21:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOAb-0001oD-VA
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 21:34:17 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOAZ-0000iH-RM
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 21:34:17 -0500
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3ea467fda32so497829b6e.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 18:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733452454; x=1734057254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DdVCpbnp8Jy1Agb4lnXkLcMMusYALlOyzv+oIkXH4Oo=;
 b=oQm6An7iY+xz72Z0ZqwzxZ5jgJnzU6pAwhg0pzfjhpKH5xTvhIpOMjtxaFQ0QwDiem
 8JPeUliJfOWk0VteNIfT691xeCsb7M1KDWaKNRBRzPpJMrH9FDKvi3ihTWhDl88tXyCa
 a71m6zVJD1L6IuBQFO4T27myctfIDHiEnu4TUZT5S5VveotSihYWuLZumm3VXRjCVuS0
 MVaobhITOk4Q+aZRwLIZ4Ow3DlRnpTljsiY6k9Ih1Oa2ZmaVlz66Hqmg/GwEVR2E99pv
 eJLdEYWlyPdTBfb+nnxrII27G441CF7jirGB0wqK2DhedghhrY3NUby+fMpSqiXtiFSy
 Qlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733452454; x=1734057254;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DdVCpbnp8Jy1Agb4lnXkLcMMusYALlOyzv+oIkXH4Oo=;
 b=eA3kfTcyJ8c6u/nwZdIz+gI/vN/naf2eHE0G9Nxc/HeoMDCp4q+9cpi5r+21rl6f7q
 XYLSqbcmnrZO5ZLdu0NGErfYpgwWBZEGy+FN1khLGb+3jFic16prXn8SgVcSvHji28EA
 1Cx6JC+evgT9rEBNFYCVCd/nzPtJwHdcgYEYqOHjhBEsWZH6VA31jkcdHz1GvaET2+Tk
 XlMDzupgTIAW63KwgZH3KlNNF/Pptk4CJztIe/DmMCsH5pVltmNumz5FXwiJXewv9RCo
 KdHfuEMilLS+xROOtWnDm6I4kysuMbkuYhhSCwbHPoV1qP3isk4YLPv8WT9m5LxbTKF4
 gRqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1thwTiD7L/emvSRKUW0v74USCCAoK8enXT7bWNwPVGtHok3aHhbDgB11m6AOktD3dk8sEjarZZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw21E1O/LdulEje23PGUCrooan4hd/DAZo0URVZV5uNINIbMnZ5
 eVyr4kXqTit9qCIoK2/01PTBzpXBMKF4sTo3uuFa923SaRl1wLmJLs0+L2UA6SQ=
X-Gm-Gg: ASbGncsUBeGXqYoRjCsFHlNbLE1Fc6qyxAq27t4OnsOu3a3jB7FNAaW6KRGtYiNSwN5
 luXCZZhG4ViZsP6aOX4tuSFRknYJhjVTjJOsagDW4QfZ/EKl/+zehDdh4viaPCvTNzMzl/K3+0g
 iO7eHiHmpZZa+j2IyHvlxosGgjtihcB3aFBRvxLcrwCvz6xdzyUUOfyPxG79a5m+qSL0gclzHe1
 7MNJ7cAGuXmCGZAGaIgs6ql/3AC8dIL5+cFCJg9nJD2pnUQ+ewf0iTubg7GBywbwtGxyv1SwcAT
 EG38IEM5rHjhwyx+haUhDlFFysTq
X-Received: by 2002:a05:6830:6217:b0:717:f701:4842 with SMTP id
 46e09a7af769-71dcf5530b0mr749589a34.28.1733452454032; 
 Thu, 05 Dec 2024 18:34:14 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f27930470fsm542553eaf.27.2024.12.05.18.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 18:34:13 -0800 (PST)
Message-ID: <39e6a66d-6c38-4ca5-a864-1a672a42456f@linaro.org>
Date: Thu, 5 Dec 2024 20:34:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/67] target/arm: Convert FMOV, FABS, FNEG (scalar) to
 decodetree
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-24-richard.henderson@linaro.org>
 <CAFEAcA9ECxgGvsSuw+GGsj4h2reKs9bVRSG=TD0oHPh519m7yA@mail.gmail.com>
 <4b1b91c2-80c2-4ed1-b313-a2e9ebba4049@linaro.org>
Content-Language: en-US
In-Reply-To: <4b1b91c2-80c2-4ed1-b313-a2e9ebba4049@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
X-TUID: iJothDSivINh

On 12/5/24 19:52, Richard Henderson wrote:
> On 12/5/24 15:12, Peter Maydell wrote:
>>> @@ -8295,15 +8356,6 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int 
>>> rd, int rn)
>>>       TCGv_i32 tcg_res = tcg_temp_new_i32();
>>>
>>>       switch (opcode) {
>>> -    case 0x0: /* FMOV */
>>> -        tcg_gen_mov_i32(tcg_res, tcg_op);
>>> -        break;
>>> -    case 0x1: /* FABS */
>>> -        gen_vfp_absh(tcg_res, tcg_op);
>>> -        break;
>>> -    case 0x2: /* FNEG */
>>> -        gen_vfp_negh(tcg_res, tcg_op);
>>> -        break;
>>>       case 0x3: /* FSQRT */
>>>           fpst = fpstatus_ptr(FPST_FPCR_F16);
>>>           gen_helper_sqrt_f16(tcg_res, tcg_op, fpst);
>>> @@ -8331,6 +8383,9 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int 
>>> rd, int rn)
>>>           gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
>>>           break;
>>>       default:
>>> +    case 0x0: /* FMOV */
>>> +    case 0x1: /* FABS */
>>> +    case 0x2: /* FNEG */
>>>           g_assert_not_reached();
>>>       }
>>>
>>
>> In these changes to the "handle this op" functions we make the
>> function assert if it's passed an op we've converted. But shouldn't
>> there also be a change which makes the calling function disas_fp_1src()
>> call unallocated_encoding() for the ops ?
> 
> Yes.  I missed that because the line is
> 
>      case 0x0 ... 0x3:
> 
> without the usual set of comments.

The next two patches have the same problem.  All fixed now.

r~
