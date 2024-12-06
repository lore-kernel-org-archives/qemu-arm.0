Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp558937njb;
        Thu, 5 Dec 2024 18:02:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3XgaXfsJrfhnEJcX9ufWlnZkbVsNsfKTUqEPDtjsDaGAzAXmAry5KpqUbjYzOJEYXlT2YBaXLK/uVHw==@linaro.org
X-Google-Smtp-Source: AGHT+IFb4Jvg7UQ0wYhEorVCP/sWpcxXekUEsLX3vlaICedjOvt655yOI7nBCNAs+o9ye1ISpcbL
X-Received: by 2002:a05:622a:15ce:b0:466:aefe:7a9c with SMTP id d75a77b69052e-46734cac030mr34311181cf.13.1733450525649;
        Thu, 05 Dec 2024 18:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733450525; cv=none;
        d=google.com; s=arc-20240605;
        b=RCFI74UPQpQ3VT6TRyQuMPjZImTYy2GTaXn3UMLZPtRgaIRRfZDnxp2KWQkbn7o7l1
         jcPIWDttqF06XpwKlMHl62TAK+NHiB4axv1IariX9JbZ0eG+WvL/jm7k0GpzcR9enqc9
         fAAdlz9Pgf+5DaSrQ0H/gE2jQS0lvYCRdtAlU9eZbgqoVO1CZiLwVd7a32RnjtGhBS38
         yUcVT04ovqcroQspn/IbW3L3PozIDM5yQfnZ+DABE5Zf8vVD81Cslw5Sq2WMn+2Zx+Io
         qrWD5Qzypx+Irn/1FjUknGQs40sq5+UgnUR2o4+xHzBRw6wglipQMjhEC5A2IBDbGP5t
         osEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RlcJGCCSItrh2+DDBFKjSeJVBUxeLDlf7dxlp4sB8eo=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=isI8KI/3yd2djv8tOtts5CD8Iz0l90E0mkwXWkkMs71iTIvbla0H+gKqaRFeUKyGRf
         eBvg1fsBzwOws3H8nlfjvBGTcv6XNI4JYIwmIjUwFwX36wVjU9wQztVDDp0cthdBVKOY
         P373LdPE1Sl0tPnDcGcRH89MtWiiUuRXqFKyelpEycMH4hNIbrOCJz5z/76d3eyF9UVF
         O22dXAHBW1OmxISqJJHa4AsJ/zytC34dbz/iaZEtxRSUA206XJWuKSVPOacOBXPcaiPz
         lIL6JwrJ4oh9knIZMrXYU0azB6ZLuubByRn6TwkDHx1hLbXfnpvFAd3SNFFfQlNUi9QP
         w4aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsfeGIyj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4672984001dsi31113641cf.605.2024.12.05.18.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 18:02:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsfeGIyj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJNfA-0006pF-Kl; Thu, 05 Dec 2024 21:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJNf7-0006oo-UF
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 21:01:45 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJNf6-0006iK-9g
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 21:01:45 -0500
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3ea5f158138so459464b6e.0
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2024 18:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733450501; x=1734055301; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RlcJGCCSItrh2+DDBFKjSeJVBUxeLDlf7dxlp4sB8eo=;
 b=BsfeGIyjqnpcTvPtNK/Qo5Lv3jrfY7ObrdegpBxMu+rHy1R7D748cFQElaS0IKAI/S
 +gOOcu2XWulRfhk8tD5r2reRjsXRcyU79PmRXNL8Si+teAHa3k8YZZzrptpVmobNIwnL
 m/40cSlhhiVSXd2yZfKXvC6Q/sFY94J97bfhu/S748zSAsFbNnlNBD/QaS8yTN/5tdL1
 8i8SbBKexmvluYbr9dKzGwE/u7gL7Mp+/g6sTL6xCl1yhez6hfXfK+T4A4nXVJ/xOAuN
 71Od0seoV87CSYOsk0uMARmU07UycznY4hTc3vwzWu2OskhfW5XjBon/g2MZESLO56Sj
 YInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733450501; x=1734055301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlcJGCCSItrh2+DDBFKjSeJVBUxeLDlf7dxlp4sB8eo=;
 b=wWoBkU1ZPlQSh9rhCJyhTLfy3nsKy/gYdeYlLLujz9wTB3T7IDj7f9l40HgJgW1XuI
 9hOjeCzWeFuIPIH8yuMDZXuh748i9mWelqTLmzMpbRGEHSp56FfJ/ZTuCe0uO6nS0kwJ
 tNqqQ0aZjo7jElvlAfkNd23gJmkhBLRLH+iAk6aTY80uSocrWA97qF7vt9G/fXmnpxY1
 jhJBvZsPb/1YOzbI2DJBTIsbtjapcnqzy867ofdsPr7CSy4NgK8HBPKdXxmzXkHPK4gW
 oqhpgGHE/5V5T46X+OoqbrgGPLdYRfDQxEn5cUWejql6YBy0HNOniGkRPVpwM5WkK3w8
 7m3A==
X-Gm-Message-State: AOJu0YycBiVCTZWYU+Dn3lD0BbBptXHJTM4v/cTZwQdB1VWqK7WgHfp8
 uiJHe41RgWwSOQ3CsH6m2J63+2Pe4h0Lx+8F+P5Ov3NeRDwv/lyWcTSiStFf6tQ=
X-Gm-Gg: ASbGncvlcxWcDPzhA+VZKaMqzgqq7gD507i2mieSEeCs2LpQbU8iFmVpbpzmqE+k0KH
 iRYeRh3BZNB4fLrlyxI59ZCOBD++zdbMZkOHphYGLPLuxmlwweOOcR9dyqU2EV50mxHF/arHuVX
 ea1e4kHS0DUtpMvH0qPbm/7QkgIMgRnKVxQchVXyi2X97HHXPtRmeoppikJptVs8YWGwTBr9PZo
 9iDkqH1L1rdEVCE71vAp8BETaN2NE5PdADd6ZWyA0fSMX/rts8JBQK6JlHmCUzyQaN106wadMRr
 Rbwby+mR7MhFIJBL3lcHvVYApK94
X-Received: by 2002:a05:6830:d1a:b0:718:1163:ef8f with SMTP id
 46e09a7af769-71dcf4bcd01mr848122a34.2.1733450500908; 
 Thu, 05 Dec 2024 18:01:40 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f279223948sm530439eaf.14.2024.12.05.18.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 18:01:40 -0800 (PST)
Message-ID: <8da688bb-526c-4288-8e39-50be17d78d15@linaro.org>
Date: Thu, 5 Dec 2024 20:01:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/67] target/arm: Pass fpstatus to vfp_sqrt*
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-25-richard.henderson@linaro.org>
 <CAFEAcA8vrTL6EwQud75H+ZKYN-TE8txyj-8vmeApsB56y6vboQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8vrTL6EwQud75H+ZKYN-TE8txyj-8vmeApsB56y6vboQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pOE/qxXYAVrf

On 12/5/24 14:44, Peter Maydell wrote:
> On Sun, 1 Dec 2024 at 15:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Pass fpstatus not env, like most other fp helpers.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I have a patch pretty similar to this in my work-in-progress
> FEAT_AFP series, because there I wanted it as part of splitting
> env->vfp.fp_status into separate A32 and A64 fp_status fields...

I thought that might be the case. I have additional changes in this area for SME2. I'll 
send those out separately this evening, just so we can compare notes.


r~
